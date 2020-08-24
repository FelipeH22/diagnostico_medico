<!-- Este componente contiene:

// Datos de cabecera del nombre del titulo del curso y template
// Menu desplegable del contenido del curso 

-->

<template>
    <div>
        <v-layout justify-center align-center row class="header">
            <v-flex xs1 sm1 px-1 py-1 class="iconos">
                <button @click="menu = !menu"><v-icon class="menu-icon">more_vert</v-icon></button>
            </v-flex>
            <v-flex xs9 sm9>
                <p><span class="tittle-small">{{titulo[0]}}</span> </p>
                <p><span class="tittle-big">{{titulo[1]}}</span></p>
            </v-flex>
            <v-spacer></v-spacer>
            <v-flex xs1 sm1 pr-2 class="logomenu">
                <!--<img src="@/assets/imagenes_compartidas/logo.png" alt="logo">-->
            </v-flex>
        </v-layout>
        <v-layout row wrap justify-left align-top class="menu-temporal animated fadeIn" v-if="menu">
            <v-flex xs10 md4 py-1 class="menu-items animated fadeInLeft">
                <div class="cont-close pr-1">
                    <button @click="menu = !menu"><v-icon class="close-icon" medium>close</v-icon> </button>
                </div>
                <div class="container-items">
                    <v-list class="cont-menu">
                    <template v-for="(menubot, indexUl) in data.menubots">
                        <template v-if="menubot.subt.length == 0">
                        <v-list-tile class="menu-tile" v-if="conteoPags >= calculateNumberOfPages(0) + menubot.pages[0]" @click.native="clickNav, hideNav(indexUl), goTo(menubot.link)" 
                                    :class="{'active':menubot.active}" :key="'tile'+indexUl">
                            {{menubot.name}}
                        </v-list-tile>
                        </template>
                        <template v-else>
                        <v-list-group :value="menubot.active" class="menu-tile" v-if="conteoPags >= calculateNumberOfPages(0) + menubot.pages[0]" :key="'tile'+indexUl">
                            <v-list-tile  @click.native="clickNav, hideNav(indexUl), goTo(menubot.link)" class="tema" :class="{'active':menubot.active}"  slot="activator">
                                {{menubot.name}}
                            </v-list-tile>
                            <v-list-tile class="submenu-tile" @click="goTo(submenu.link), closemenu()" v-for="(submenu, index) in menubot.subt" 
                                        :key="'subt'+indexUl+index" 
                                        v-if="(submenu.pages[0] + calculateNumberOfPages(0)) <= conteoPags"  :class="{'checkmenu':menubot.active}">
                                {{submenu.name}}
                            </v-list-tile>
                        </v-list-group>
                        </template>
                    </template>
                    </v-list>

                </div>
                <!-- ICONOS DE PARTE INFERIOR -->
                <!--<div class="cont-submenu">
                    <button @click="openGlosario()" class="btn-icon"><v-icon class="icon">settings</v-icon> <span>Contácto</span></button>
                    <button @click="openGlosario()" class="btn-icon"><v-icon class="icon">people</v-icon> <span>Créditos</span></button>
                    <button @click="openGlosario()" class="btn-icon"><v-icon class="icon">book</v-icon> <span>Bibliografía</span></button>
                    <button @click="openGlosario()" class="btn-icon"><v-icon class="icon">library_books</v-icon> <span>Glosario</span></button>
                </div>-->
            </v-flex>
            <!-- MODAL DE GLOSARIO -->
            <modal-app v-model="glosario" :fullscreen="true"> 
                <template slot="modaltittle"><h1 class="modal-icon-title">Glosario</h1></template>
                <template slot="modalcontent"><Glosario/></template>
            </modal-app>

        </v-layout>
    </div>
</template>
<script>
import resourcesLoader from "../js/mixins/resources-loader";
import scormmixins from '../js/mixins/scormmixins'

export default { 
    mixins: [resourcesLoader,scormmixins],
    
    data() {
        return {
            submenu: false,
            menu: false,
            glosario:false,
            data: '',
            cibergrafia: false,
            glosario: false,
            materialReferencia: false,
            atribuciones: false,
            materialReferencia: false,
            drawer: false,
            cibergrafiaData: [],
            referencias: [],
            listHeightScroll: false,
            titulo: ''
        }
    },
    created() {
        var self = this
        this.getJson('modulos/navegacion', data => {
            self.data = data
            self.calculateNumberOfPages()
        })
        this.getJson('textos_proyecto',function(data){
            self.titulo = data.nombre_del_proyecto
        })
        console.log('TITULO ' + this.titulo)
    },
    methods: {
        getData(data) {
            return data
        },
        openGlosario(){
            this.glosario = true
        },
        getModuleTitle() {
            return this.$store.state.title
        },
        adjustButtons() {
            var list = document.querySelector('.course-menu')
            var listContainer = document.getElementById('list-container')
            console.log('lch: '+listContainer.clientHeight + ' lh: '+list.offsetHeight)
            this.listHeightScroll= listContainer.clientHeight - 283 < list.offsetHeight;
        },
        hey(modNum) {
            var canTemas = 0
            for(var i = 0; i < modNum; i++) {
                canTemas += this.data.menubots[i].canTemas
            }
            return canTemas
        },
        clickNav() {
        var routeArr = this.$route.path.split("/");
        var modName = routeArr[routeArr.length - 2];
        var pageNum = routeArr[routeArr.length - 1];

        this.data.menubots.forEach(function(element) {
            var botName = element.link.split("/");
            // Actualiza nombre en el encabezado
            if(pageNum >= element.pages[0] && pageNum <= element.pages[1]){
            this.$store.commit('temaName', element.name)
            }
            // Muestra los temas que se han visitado y oculta los temas futuros
            if (element.link === this.$route.path) {
            } else if (modName === botName[1]) {
            // this.$store.commit('temaName', element.name)
            element.active = true;
            } else {
            element.active = false;
            }

            // Muestra los subtemas
            element.subt.forEach(function(subElem) {
            var subLink = subElem.link.split("/")
            if (subLink[1] === modName && (pageNum >= subElem.pages[0] && pageNum <= subElem.pages[1])) {
                this.$store.commit('subTemaName', subElem.name)
                this.$store.commit('temaName', element.name)
                subElem.active = true;
            } else {
                subElem.active = false;
            }
            }, this)
        }, this);
        },
        hideNav(event) {
            if (this.data.menubots[event].subt.length === 0) {
                this.menu = false
            }
        },
        closemenu(){
            this.menu = false
        },
        calculateNumberOfPages(modNum) {
            return this.$store.getters.globalPage(modNum)
        },
        goTo(route){
            this.$router.push(route)
            console.log('route ' + route)
        }
    },
    computed: {
        // screenTrack() {
        //     return this.$store.state.screens;
        // },
        temaName() {
            return this.$store.state.tema;
        },
        subtemaName() {
            console.log('SUBTEMANAME '+this.$store.state.subTema)
            return this.$store.state.subTema;
        },
        showTrack() {
            var routeArr = this.$route.path.split("/");
            console.log('routerArr '+ routeArr)
            if (routeArr.length <= 2) {
                return false
            } else {
                return true
            }
        },
        currentPage() {
            return Math.floor(this.$route.params.unipage);
        }
    },
    watch: {
        '$route' (to, from) {
            this.clickNav();
        }
    }
}
</script>
<style lang="scss" scoped>
@import '../sass/globals';

.header{
    position: fixed;
    width: 100%;
    z-index: 2;
    background-color:$color-inverted;
    color: $color-inverted;
    min-height: 64px;
    border-radius: 0px;
    box-shadow: 0 0 2px black; 
    p {
        margin-left: 20px;
        margin: 0;
        padding: 0;
        //font-size: .73em;
    }
    .menu-icon{
        width: 64px;
        font-size: 3rem;
        color: $color-complement-one;
        &:hover{
            //color:$color-complement-two;
        }
    }
}
.close-icon{
    color: $color-primary;
    &:hover{
        //color:darken($color: $color-primary, $amount: 10);
    }
}
.container-items{
    .cont-menu{
        background:transparent;
    }
}

.menu-temporal{
    width: 100%;
    height: 100%;
    position: absolute;
    background: rgba(0,0,0,0.3); 
    backdrop-filter: blur(3px);
    z-index: 4;
    .menu-items{
        background:$color-inverted;
        position: relative;
        p{
            font-size: 11pt;
        }
    }
}
.cont-close{
text-align: right;
}
.cont-submenu{
    position: absolute;
    bottom: 0;
    left: 0;
    display: flex;
    justify-content: space-between;
    text-align: center;
    align-items: center;
    border-top: solid $color-primary 1px;
    padding: 5px 20px 4px 20px;
    width: 100%;
    color:$color-inverted;
    background: $color-complement-one;
    .icon{
        color: $color-inverted;
    &:hover{
        //color: $color-complement-two;
        cursor: pointer;
    }
        
    }
}

.btn-icon{
    display: flex;
    justify-content: center;
    align-content: center;
    text-align: center;
    flex-wrap: wrap;
    width: 20%;
    span{
        width: 100%;
        font-size: 0.8em;
    }
}

.menu-tile {
    font-family: 'fontBase-Bold';
    border-bottom: 3px solid $color-gray;
    margin-left: 15px;
    margin-right: 15px;
    padding:0px;
    cursor: pointer;
    transition: all 0.3s ease-out!important;
    color:$color-text;
    &:hover{
       // background: darken($color: $color-complement-one, $amount: 10);
    }
}
.submenu-tile {
  color:$color-text;
  font-family: 'fontBase-Regular';
  &:hover {
    //background-color: darken($color: $color-complement-one, $amount: 10);
  }
}

.tittle-big{
  font-size:1.4rem;
  text-align: left;
  line-height: 1.5rem;
  font-family: FontBase-Bold;
  color:$color-complement-one;
}
.tittle-small{
  text-align: left;
  font-size:1.3rem;
  color: $color-text;
  font-family: FontBase-ExtraLight;
}
@media (max-width: 420px) {
    .tittle-big{
        font-size:.9rem;
    }
    .tittle-small{
        text-align: left;
        font-size:.7rem;
        color: $color-text;
        font-family: FontBase-ExtraLight;
    }
    .menu-icon{
        width: 64px;
        font-size: 2rem;
        color: $color-complement-one;
    }
}
@media (max-width: 600px) {
    .logomenu{
        display: none;
    }
}
.checkmenu{
    background: $color-gray;
}
@media (min-width: 560px){
    .iconos {
        -ms-flex-preferred-size: 6.666666666666664%;
        flex-basis: 6.666666666666664%;
        -webkit-box-flex: 0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        max-width: 6.666666666666664%; 
    }
}

@media (max-width: 559px){
    .iconos {
        -ms-flex-preferred-size: 15.666666666666664%;
        flex-basis: 15.666666666666664%;
        -webkit-box-flex: 0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        max-width: 15.666666666666664%; 
    }
}/*
@media (max-width: 990px){
    .iconos {
        -ms-flex-preferred-size: 7.666666666666664%;
        flex-basis: 7.666666666666664%;
        -webkit-box-flex: 0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        max-width: 7.666666666666664%; 
    }
}*/
</style>

