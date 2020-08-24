<template>
    <v-flex class="pagina-curso" xs12 fill-height>
        <header-app></header-app>
        <nav-menu-app :mod="mod"></nav-menu-app>
        <div class="contenido">
            <transition name="fade">
                <component key="item" :is="'mod' + $route.params.unipage + '-app'"></component>
            </transition>
        </div>
    </v-flex>
</template>
<script>
    import mod0 from "./mod0";
    import mod1 from "./mod1";
    import mod2 from "./mod2";
    import mod3 from "./mod3";
    import mod4 from "./mod4";
    import mod5 from "./mod5";


    export default {
        components: {
            "mod0-app": mod0,
            "mod1-app": mod1,
            "mod2-app": mod2,
            "mod3-app": mod3,
            "mod4-app": mod4,
            "mod5-app": mod5,
        },
        data() {
            return {
                noOfPages: 5,
                mod: {
                    modurl: "unidad1"
                },
                verdialogo:0,
                nombreAnimacion:'',
                cambioAction:''
            };
        },        
        computed: {
            currentPage() {
              return Math.floor(this.$route.params.unipage);
            },
            subModName() {
                return this.$store.state.subTema;
            },
        },
        methods: {
        },
        // mounted y updated: Carga el número de pantallas en el store para que las flechas de navegación funcionen
        mounted() {
            this.$store.commit("screenTrack", [this.currentPage, this.noOfPages]);
        },
        updated() {
            this.$store.commit("screenTrack", [this.currentPage, this.noOfPages]);
        }        
    };
</script>
<style lang="scss" scoped>
    // NOT SCOPED !!
    @import "../../sass/globals";
    .pagina-curso {
        background-image: url("../../assets/fondo/fondoopacity3.svg");
        background-repeat: no-repeat;
        background-position: bottom right;
        background-size: 20%;
        height: 100vh;
        overflow-y: auto;
        transition: all 0.3s ease-in-out;
        padding: 0px;

        .contenido {
            max-width: 100%;
            width: 955px;
            margin: auto;
            position: relative;
            overflow: hidden;
            min-height: calc(100vh - 50px);
            height: auto;
            padding: 0px;
            margin-top: 50px;
  
        }
        @media screen and (max-width: 700px) {
            background-size: 70%;
        }
        @media screen and (max-width: 500px) {
            background-size: 90%;
        }
    }
.fade-enter-active, .fade-leave-active {
    transition: all 2s;
    position: absolute;
    max-height: 100%;
    min-height: 100%;
    max-width: calc(100% - 0px);
    min-width: calc(100% - 0px);
    overflow: hidden;
}
.fade-enter, .fade-leave-to /* .fade-leave-active below version 2.1.8 */ {
  opacity: 0;
}
@media (max-width: 700px) {
    .pagina-curso{
        background-image: url("");
    }
}

</style>
