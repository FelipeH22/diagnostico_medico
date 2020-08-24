<template>
  <v-layout class="navmenu-container" justify-center align-center >
    <!-- v-show="screenTrack[0] >= 1"  -->
    <button class="btn-nav" :class="{'inactive': !screenTrack[0] >= 1}" @click="scrolltop()">
      <router-link :to="'/'+mod.modurl+'/'+ (screenTrack[0]-1)" @click.native.prevent="guardarubicacion()" >
        <v-icon class="icon animated fadeInLeft" medium style="font-size:40px;">keyboard_arrow_left</v-icon>
        <span class="icon animated fadeInRight" medium style="font-size:20px;">Back</span>
      </router-link>
    </button>
    <div class="progress-container">
      <div class="page-count">
        <span><strong>{{screenTrack[0]+1}}</strong> / <strong>{{screenTrack[1]}}</strong></span>
      </div>
      <div class="progress-bar">
        <div ref="progressBar" class="bar"></div>
      </div>
    </div>
    <!-- v-show="nextPant" -->
    <button class="btn-nav"  :class="{'inactive': !nextPant}" @click="scrolltop()">
      <router-link :to="'/'+mod.modurl+'/'+ (screenTrack[0]+1)" @click.native.prevent="guardarubicacion()" >
        <span class="icon animated fadeInRight" medium style="font-size:20px;">Next</span>
        <v-icon class="icon animated fadeInRight" medium style="font-size:40px;">keyboard_arrow_right</v-icon>
      </router-link>
    </button>
  </v-layout>
</template>
<script>
    import ScormMix from '../js/mixins/scormmixins'
    import resourcesLoader from "../js/mixins/resources-loader";
    export default { 
        mixins: [resourcesLoader],
        props:{
            mod: {
              type: Object,
              required: true
            },
        },
        data() {
            return {
                titulo: '',
                // logo: '',
            }
        },
        methods: {
            getData(data) {
                return data
            },
            getModuleTitle() {
                return this.$store.state.title
            },
            scrolltop(){
              //this.$refs.toolbarChat.scrollTop = -1000;
              window.scrollTo(0,0)
            }
        },
        computed: {
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
            },
          nextPant() {
            return this.$store.state.nextPant;
          },
          screenTrack() {
            return this.$store.state.screens;
          },
          currentPage() {
            return Math.floor(this.$route.params.unipage);
          }
        },
        watch: {
          screenTrack(val){
            let bar = this.$refs['progressBar']
            let pct = ((val[0]+1)/val[1]) * 100
            console.log('pct: '+pct)
            bar.style.width = pct+"%"
          }
        },
        mixins: [ScormMix]
    }
</script>
<style lang="scss" scoped>
@import '../sass/globals';
*:focus{
    outline: none!important;
}
a{
  text-decoration: none!important;
  color: white;
}
.inactive{
  opacity: 0;
  pointer-events: none;
  &:hover{
    cursor:none!important;
  }
}
.navmenu-container{
    width: 100%;
    height: 40px;
    position: fixed;
    bottom: 0px;
    background: $color-gray;
    z-index: 3;
    color: $color-complement-one;
  }

  .progress-container{
    width: 90%;
    height: auto;
    .page-count{
      width: 100%;
      position: relative;
      padding: 0;
      margin: 0;
      height: 10px;
      font-size: 8pt;
      line-height: 0pt;
      text-align: center;
      span{
        padding: 0;
        margin: 0;

      }
    }
    .progress-bar{
      width: 80%;
      height: 6px;
      background: $color-inverted;
      border-radius: 3px;
      position: relative;
      overflow: hidden;
      margin: 0 auto;
      .bar{
        display: block;
        position: absolute;
        height: 100%;
        bottom: 0%;
        left: 0%;
        background: rgb(11,111,92);
        background: linear-gradient(90deg, rgba(11,111,92,1) 0%, rgba(105,165,0,1) 100%);
        //background-color: $color-primary;
        max-width: 100%;
        transition: width 200ms;
      }
    }
    @media screen and (min-width: 700px){
      width: 50%;    
    }
  }
  .btn-nav{
    cursor: pointer;
    padding: 5px;
    border: solid transparent;
    .icon{
      color: $color-complement-one;
      line-height: 20px;
    }

    &:hover{
      a{
        .icon{
          color: $color-complement-two!important;
        }
      }

    }
  }

</style>