<template>
  <div>
    <v-layout row wrap justify-center align-center mb-5 ml-5 mr-5 class="contenidoCurso">
        <v-flex xs11 sm10 md10>
          <h1 class="titulo">Please select your sex</h1>
          <p class="actividad">
            Haz clic en las imágenes para conocer la información.
          </p>
        </v-flex>
        <v-flex xs10 sm5 md4 lg5>
          <svg-app @redireccionar="redireccionar($event)"></svg-app>
        </v-flex>
    </v-layout>

  </div>
</template>
<script>
import nextConditions from "../../js/mixins/nextConditions";
import svg from './svg/selecGenero'
export default {
  components:{
    'svg-app':svg,
  },
  mixins: [nextConditions],
  data() {
    return {
      currentText: 0,
      estado:false,
      personajenum:"0",
      modal:false,

      mensaje:{},
      vistos: Array(8).fill(false)
    }
  },
  created(){
    
  },
  methods:{
    redireccionar(number){
      this.$router.push(`${3}`)
    }
  },

}
</script>
<style lang="scss" scoped>
@import '../../sass/globals';
.circle{
  content: '';
  background: #2D2D2D;
  height: 0.5rem;
  width: 0.5rem;
  border-radius: 50%;
  margin-right: 5px;

}
.contenedor{
  //background: $color-gray;
  padding-bottom: 20px;
  border-radius: 20px;
  h2{
    margin-top: 20px;
    text-align: center;
  }
}
h1{
  font-family: FontBase-Bold;
  font-size: 1.9rem;

  border-bottom: 3px solid transparent;
  border-image: linear-gradient(90deg, $color-complement-two 0%,$color-secondary 100%)1;
  margin-bottom: 30px;
}
h2{
  font-size: 1.7rem;
  font-family: FontBase-SemiBold;
}
p{
  font-size: 1.2rem;
  font-family: FontBase-Regular;
}
.list-obj li{
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: left;
}
li{
  list-style:square outside;
  //display: flex;
  align-items: center;
  justify-content: start;
  div{
    height: auto;
  }
  .list-img{
    height: 64px;
    width: auto;
    margin-right: 20px;
  }
  .barra{
    height: 40px;
    border-left: 3px solid transparent;
    border-image: linear-gradient(10deg, rgba(11,111,92,1) 0%, rgba(105,165,0,1) 100%)1;
  }
  .list-txt{
    font-size: 1.2rem;
    text-align: left;
    margin-left: 20px;
    height: 100%;
  }
}
.caja-texto{
    border: 3px solid transparent;
    border-image: linear-gradient(90deg,$color-secondary 0%, $color-complement-two 100%)1;
    padding: 15px;
}
.termometro{
  height: 300px;
}

ol, ul {
    padding-left: 34px;
    //list-style: square inside;
    list-style-position: outside;
}
li{
    //list-style: square inside !important;
}

.actividad{
  font-size: 1.1rem;
}
</style>
