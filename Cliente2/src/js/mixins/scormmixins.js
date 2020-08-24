// En este archivo se pueden definir variables y funciones que pueden ser llamadas en los archivos en que se importen
//import { SCORM } from 'pipwerks-scorm-api-wrapper' // importa la dependencia
export default {
  data() {
    return {
      totalpag:0,
    }
  },
  methods: {
    guardarubicacion() {
      var routeArr = this.$route.path.split("/");
      var modName = routeArr[routeArr.length - 2];
      var pageNum = routeArr[routeArr.length - 1];

      if(modName === 'unidad1'){
        this.totalpag = (this.cantPagsMods(0) + parseInt(pageNum))
      } else if (pageNum === '') {
        this.totalpag = 0
      }


      // conteoPags esta en store y solo se actualiza si aumenta el total de pÃ¡ginas guardando el ultimo mayor valor del conteo
      if(this.totalpag > this.conteoPags){
        this.$store.commit('conteoPaginas', this.totalpag)
      }

      // guardar_ubicacion(this.totalpag);
      console.log('el conteo de paginas es ' + this.totalpag)
      console.log('la pagina mas avanzada visitada es ' + this.conteoPags)
    },
    guardarStore(){
      guardar_comments(JSON.stringify(this.$store.state));
      console.log(JSON.stringify(this.$store.state))
    },
    cargarStore(){
      var storeloaded = '';
      // storeloaded = cargar_comments();
      console.log(' store loaded >>',storeloaded)
      if(storeloaded != '')this.$store.replaceState(JSON.parse(storeloaded));
      //reemplaza el store actuar por que se guardo anteriormente
      console.log('load' )
    },
    cantPagsMods(modNum){
      // se retorna el numero de pantallas que tiene cada modulo desde el store
      // return this.$store.state.cantPagsMods
      return this.$store.getters.globalPage(modNum)
      
    }
  },
  computed: {
    conteoPags(){
      return this.$store.state.paginas
    },
  },
  mounted() {
    this.guardarubicacion()
  }
}