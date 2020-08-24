<template>
  <div>
    <v-layout wrap justify-center align-center mb-5 class="contenidoCurso">
        <v-flex xs11 sm10 md9 mb-2>
          <h1 class="titulo">Bienvenido</h1>
          <h2>Hello!</h2>
          <p>
            You’re about to use a short (3 min), safe and anonymous health checkup. 
            Your answers will be carefully analyzed and you’ll learn about possible causes of your symptoms.
          </p>
          <br/>
          <h2>Nuestros objetivos</h2>
          <br/>
            <ul>
              <li class="list-obj" v-for="(objetivo, index) in objetivos" :key="index">
                <v-layout wrap row justify-center align-center mt-3> 
                  <v-flex xs2 sm1 class="list-img">
                    <img :src="require('@/assets/unidad1/obj-'+(index+1)+'.png')" alt="">
                  </v-flex>
                  <v-flex xs10 sm10 class="list-txt">
                    <span class="obj-especifico" v-html="objetivo"></span>
                  </v-flex>
                </v-layout>
              </li>
            </ul>
        </v-flex>
    </v-layout>
  </div>
</template>
<script>
import nextConditions from "../../js/mixins/nextConditions";
export default {
  mixins: [nextConditions],
  data() {
    return {
      currentText: 0,
      estado:false,
      personajenum:"0",
      objetivos: [
        'Objetivo 1.',
        'Objetivo 2.',
        'Objetivo 3.'
      ],
    }
  },
  created(){
    this.$store.commit('nextShow', true)
  },
  watch: {
    currentText(val) {
      if (val >= this.dialogos.length - 1){
          this.$store.commit('nextShow', true)
      }

    }
  }
}
</script>
<style lang="scss" scoped>

@import '../../sass/globals';

.contenidoCurso{
  //height: 100vh;
  margin-top: 50px;
}
h1{
  font-family: FontBase-Bold;
  font-size: 1.9rem;
  border-bottom: 3px solid transparent;
  border-image: linear-gradient(90deg, $color-complement-two 0%, $color-secondary 100%)1;
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
ul{
  padding-left: 10px;
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
    width: 64px;
    height: 64px;
    margin-right: 15px;
    display: flex;
    align-items: center;
    justify-content: center;
  }
  .list-txt{
    font-size: 1.2rem;
    height: 64px;
    text-align: left;
    margin-left: .2rem;
    height: 100%;
  }
}
@media (min-width: 670px) {
  .list-img{
    width: 64px;
    height: 64px;
    margin-right: 30px;
    border-right: 3px solid transparent;
    //border-image: linear-gradient(10deg, rgba(11,111,92,1) 0%, rgba(105,165,0,1) 100%)1;
  }
}
@media (min-width: 670px) {
  .list-txt{
    margin-left: 0;
  }
}
</style>
