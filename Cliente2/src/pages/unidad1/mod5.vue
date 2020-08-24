<template>
    <div>
        <v-layout row wrap justify-center align-center mb-5 class="contenidoCurso">
            <v-flex xs11 sm10 md9 mb-2>
                <h1 class="titulo">Tus resultados</h1>
                <br/>
            </v-flex>
        </v-layout>
        <v-layout row wrap justify-center align-center >
            <v-flex xs6 sm4 md2 lg2 mb-2 class="imagen">
                <!--<img src="@/assets/unidad1/mod7/pantalla-final.png" alt="">-->
            </v-flex>
        </v-layout>
        <v-layout row wrap justify-center align-center >
            <v-flex xs10 sm8 md7 lg6 mb-2 mt-3 class="despedida">
                <h2>Has finalizado el análisis</h2>
                <p>
                  Te invitamos a seguir Lorem ipsum dolor sit amet consectetur, adipisicing elit.
                  Possimus sed voluptatem, veritatis eveniet iure illum quia architecto, voluptatum
                  porro sequi fuga quas. Quia doloremque commodi cum incidunt! Laboriosam, molestias nulla.
                </p>
                <p class="actividad">Regresa a la plataforma para continuar.</p>     
            </v-flex>
        </v-layout>
    </div>
</template>
<script>
import nextConditions from "../../js/mixins/nextConditions";
export default {
    mixins: [nextConditions],
    data(){
        return{}
    }
}
</script>

<style lang="scss" scoped>

@import '../../sass/globals';

.contenidoCurso{
  //margin-top: 80px;
  //height: 100vh;
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
  align-items: center;
  text-align: left;
  
}

.caja-texto{
    border: 3px solid transparent;
    border-image: linear-gradient(90deg,$color-secondary 0%, $color-complement-two 100%)1;
    padding: 15px;
}
li{
  list-style: none;
  display: flex;
  align-items: center;
  justify-content: start;
  div{
    height: auto;
  }
  .list-img{
    width: 80px;
    height: 80px;
    margin-right: 30px;
  }
  .list-txt{
    font-size: 1.2rem;
    height: 64px;
    text-align: left;
    margin-left: 1rem;
    height: 100%;
  }
  span{

    font-size: 1.2rem;
  }
}
.imagen img{/***/}
@media (min-width: 670px) {
  .list-img{
    width: 64px;
    height: 64px;
    margin-right: 30px;
    border-right: 3px solid transparent;
    //border-image: linear-gradient(10deg, rgba(11,111,92,1) 0%, rgba(105,165,0,1) 100%)1;
  }
}
.despedida, .despedida p{
  text-align: center;
}
p.actividad{
  margin-top: -12px;
  font-family: FontBase-SemiboldItalic;
}
</style>
