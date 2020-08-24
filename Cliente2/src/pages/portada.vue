<template>
<v-layout  wrap row justify-center align-center class="bg-white contenidoCurso">
    <v-flex class="" xs10 lg10>
          <v-layout wrap row justify-center align-center text-xs-center class="">
            <v-flex xs7 sm4 md2 lg2 pt-5 class="">
              <img src="@/assets/presentacion/Elemento-logo.png" alt="Logo">
            </v-flex>
            <v-flex xs10 sm10 md5 lg4 class="first-cont">
              <!--<h5 class="tittle-small">Curso:</h5>-->
              <h1 class="tittle-big">
               DIAGNOSTIC SYSTEMS
              </h1>
            </v-flex>
          </v-layout>
          <v-layout wrap row mt-3 justify-center align-center text-xs-center>
            <v-flex xs2 sm2 md2 py-2 px-3 d-flex justify-center align-center class="subtitle-container">
              <div class="cont-bt">
                <router-link
                    to="/unidad1/0"
                  >
                  <button class="btn-portada mt-1 animated fadeInUp "> <span >Iniciar</span> </button> 
                </router-link>
              </div>
            </v-flex>
            <v-flex xs11 sm11 md11 py-2 px-3 d-flex justify-center align-center class="subtitle-container">
              <div class="linea-horizontal"></div>
            </v-flex>
          </v-layout>
          <v-layout wrap justify-center align-center>
              <v-flex xs12 sm12 md12 class="header-intro">
                <!--<logos-app></logos-app>-->
              </v-flex>
          </v-layout>
    </v-flex>
  </v-layout>
</template>
<script>
import nextConditions from "../js/mixins/nextConditions";
export default {
  mixins: [nextConditions],
  data() {
    return {
      btnColors:['#65B8FF','#2199FF','#0077DC','#005297'],
      iconActive: [true,false,false,false],
      unidadNumber: 1,
    }
  },
}
</script>
<style lang="scss" scoped>
// NOT SCOPED !!
@import '../sass/globals';

h1{
  border-bottom: 0px solid transparent;
  border-image: none;
  font-family: FontBase-Bold;
  font-size: 0rem;
  margin-bottom: 0px;
}
.tittle-big{
  font-size:3.2rem;
  text-align: left;
  line-height: 1.1em;
  font-family: FontBase-Bold;
  color:$color-complement-one;
}
.tittle-small{
  text-align: left;
  font-size:2.2rem;
  color: $color-text;
  font-family: FontBase-ExtraLight;
}
@media (max-width: 1350px) {
  .tittle-big{
    font-size:1.9rem;
    text-align: left;
    line-height: 1.1em;
    font-family: FontBase-Bold;
    color:$color-complement-one;
  }
  .tittle-small{
    text-align: left;
    font-size:1.4rem;
    color: $color-text;
    font-family: FontBase-ExtraLight;
  }
  .contenido{
    margin-top: 20px;
  }
}



@media (max-width: 420px) {
  
  .tittle-big{
    font-size:2.0rem;
    text-align: left;
    line-height: 1.1em;
    font-family: FontBase-Bold;
    color:$color-complement-one;
  }
  .tittle-small{
    text-align: left;
    font-size:1.2rem;
    color: $color-text;
    font-family: FontBase-ExtraLight;
  }
  .contenido{
    margin-top: 20px;
  }
}

@media (max-width: 950px) {
  .tittle-big{
    font-size:2.2rem;
    text-align: left;
    line-height: 1.1em;
    font-family: FontBase-Bold;
    color:$color-complement-one;
  }
  .tittle-small{
    text-align: left;
    font-size:1.7rem;
    color: $color-text;
    font-family: FontBase-ExtraLight;
  }
  .contenido{
    margin-top: 20px;
  }
}
.btn-portada{
  margin-top: 60px;
  font-family: FontBase-Regular;
  color: $color-complement-one;
  font-size:1.8rem;
  padding-left: 30px;
  padding-right: 30px;
  padding-top: 7px;
  padding-bottom: 7px;
  border: 2px solid transparent;
  //border-color: linear-gradient(90deg, rgba(11,111,92,1) 0%, rgba(105,165,0,1) 100%);
  border-image: linear-gradient(90deg, $color-complement-one 0%, $color-primary 100%)1;
  
}
.btn-portada:hover{  
  border: 2px solid transparent;
  border-image: linear-gradient(90deg, $color-complement-two 0%, $color-secondary 100%)1;
  color: $color-complement-two;
}

.linea-horizontal{
  margin-top: 40px;
  background:$color-gray;
  height: 5px;
  width: 70%;  
}
.contenidoCurso{
  margin-top: -5%;
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
}
img{
  height: 80%;
  width: 80%;
}
</style>
