<template>
    <div>
        <v-layout row wrap justify-center align-center mb-5 class="contenidoCurso">
            <v-flex xs11 sm10 md9 mb-2>
                <h1 class="titulo">Please select your age</h1>
                <br/>
            </v-flex>
            <v-flex xs12 sm6 md4>
        <v-slider
            v-model="slider"
            :min="16"
            :max="256"
            label="Size"
            thumb-label
          ></v-slider>
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
    },
    
  created(){
    this.$store.commit('nextShow', true)
  },
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
