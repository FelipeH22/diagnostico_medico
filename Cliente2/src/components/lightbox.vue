<template>
    <div>
        <v-dialog :name="'modal' + id" :persistent="!showClose" :width="width" v-model="modal">
            <v-card>
                <boton-cerrar-modal-app :showClose="showClose" :titulo="titulo"
                                        @cerrar="modal=false"></boton-cerrar-modal-app>
                <div v-if="showSlot">
                    <v-container fluid px-2>
                        <slot></slot>
                    </v-container>
                </div>
                <div v-else>
                    <v-container :class="{'text-xs-center': centrado}" fluid px-2>
                        <v-card-text v-html="texto" v-if="texto != ''"></v-card-text>
                        <v-card-text v-if="imagen != ''"><img :src="imagen" alt="Imagen"/></v-card-text>
                        <v-card-text v-html="textoAbajo" v-if="textoAbajo != ''"></v-card-text>
                    </v-container>
                </div>
            </v-card>
        </v-dialog>
    </div>
</template>

<script>

    export default {
        props: {
            id: {
                type: String,
                required: true
            },
            titulo: {
                type: String,
                required: true
            },
            centrado: {
                type: Boolean,
                required: false,
                default: false
            },
            texto: {
                type: String,
                required: false,
                default: null
            },
            textoAbajo: {
                type: String,
                required: false,
                default: null
            },
            imagen: {
                type: String,
                required: false,
                default: ''
            },
            showClose: {
                type: Boolean,
                required: false,
                default: true
            },
            width: {
                type: String,
                required: false,
                default: '500px'
            }
        },
        data() {
            return {
                modal: false,
                showSlot: false
            }
        },
        created() {
            if (this.texto == null && this.textoAbajo == null && this.imagen == '') {
                this.showSlot = true;
            }
        },
        methods: {
            show: function () {
                this.modal = true;
            },
            close: function () {
                this.modal = false;
            }
        },
        watch: {
            modal: function (value) {
                if (!value) {
                    // closed
                    this.$emit('closedModal');
                }
            }
        }
    }
</script>
<style lang="scss" scoped>
    @import '../sass/globals';

    .container {
    }

    .close {
        width: 30px;
        height: 30px;
        position: absolute;
        top: 10px;
        right: 10px;
        // background-image: url('../assets/iconos/mal-bot-gran.png');
        background-size: contain;
        background-position: center;
        cursor: pointer;
    }
</style>
