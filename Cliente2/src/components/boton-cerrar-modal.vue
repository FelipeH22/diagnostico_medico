<template>
    <v-card-title class="cerrar">
        <p><strong>{{titulo}}</strong></p>
        <v-spacer></v-spacer>
        <button @click="$emit('cerrar')" class="hvr hvr-scale"><img :src="cerrar" alt="botón cerrar"></button>
    </v-card-title>
</template>
<script>

    export default {

        props: {
            titulo: {
                type: String,
                default: '',
                required: false
            }
        },
        data() {
            return {
                cerrar: '',
            }
        },
        created() {
            var self = this
            this.getPng('imagenes_compartidas/cerrar_blan', data => {
                self.cerrar = data
            })
        }
    }
</script>

<style lang="scss" scoped>
    .cerrar {
        padding: 10px;
        padding-bottom: 0;
        background-color: #CCEB81;

        img {
            width: 30px;
            padding: 5px;
            background: #004636;
            border-radius: 45px;
        }
    }
</style>