<template>
    <!--persistent-->
    <v-dialog v-model="modal" :transition="fullscreen?'dialog-bottom-transition':'dialog-transition'" persistent :fullscreen="fullscreen" :width="width" scrollable>
        <v-card class="fondo-curso-modal">
            <v-toolbar class="cerrar" :style="{'height':heightCerrar}" >
                <slot name="modaltittle"></slot>
                <!-- <v-spacer> </v-spacer> -->
                <button v-if="mostrarCerrar" @click="$emit('click', false), $emit('pausarAudio')" class="hvr hvr-scale">
                    <v-icon>close</v-icon>
                </button>
            </v-toolbar>
            <v-card-text>
                <v-flex contain class="dialog-content" text-xs-center>
                    <slot name="modalcontent"></slot>
                </v-flex>
            </v-card-text>
        </v-card>
    </v-dialog>
</template>
<script>
    export default {
        model: {
            prop: 'modal',
            event: 'click'
        },
        props: {
            modal: Boolean,
            width: {
                type: String,
                default: '700px'
            },
            fullscreen: {
                type: Boolean,
                default: true,
            },
            mostrarCerrar: {
                type: Boolean,
                default: true
            },
            heightCerrar:{
                type: String,
                default: '45px'
            }
        },
        data() {
            return {
            }
        },
        watch: {
            fullscreen: function(value){
                if(value){

                }
            }
        }
    }
</script>

<style lang="scss" scoped>
    @import '../sass/helpers/variables';
    .cerrar {
        padding-bottom: 0;
        height: 45px;
        text-align: center;
        background: white;
        box-shadow: none;
        img{
            width: 30px;
            border-radius: 45px;
            margin-top: 10px;
            margin-left: 0px;
        }
    }

    .dialog-content {
        max-width: 1100px;
        // max-width: 100%;
        margin: auto;
        padding: 5px;
        margin-top: -10px;
        align-items: center;
        @media (max-height: 800px){
            align-items: start;
        }
    }

    .fullscreen {
        @media (min-height: 800px){
            height: 70vh;
        }
    }
    .fondo-curso-modal {
        background: white;
    }
</style>
