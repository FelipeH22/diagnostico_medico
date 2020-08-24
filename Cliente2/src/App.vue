<template>
  <div id="app">
    <v-app>
      <v-content>
        <v-layout class="fill-viewport-height">
            <router-view />
        </v-layout>
      </v-content>
    </v-app>
  </div>
</template>


<script>
export default {
  name: "App"
};
</script>

<style lang="scss">
@import "sass/globals";

.header-grid{
  width: 100%;
  height: 50%;
  display: flex;
  justify-content: space-between;
  align-content: center;
  align-items: center;
  color: white;
}
#app {
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  width: 100%;
  font-size: 15px;
  font-family: FontBase-Regular;
}
img {
  max-width: 100%;
}
.fill-viewport-height {
  height: 100vh; //Antes estaba 100% pero no funcionaba en navegadores iOS
}
/********************  FONTS ********************/
/* Las fuentes se cargan acá porque se tiene acceso a los recursos que están en assets*/

@font-face {
  font-family: FontBase-Regular;
  src: url("./assets/fonts/SourceSansPro-Regular.ttf");
}
@font-face {
  font-family: FontBase-SemiBold;
  src: url("./assets/fonts/SourceSansPro-Semibold.ttf");
}
@font-face {
  font-family: FontBase-Bold;
  src: url("./assets/fonts/SourceSansPro-Bold.ttf");
}
@font-face {
  font-family: FontBase-BoldItalic;
  src: url("./assets/fonts/SourceSansPro-BoldItalic.ttf");
}
@font-face {
  font-family: FontBase-Black;
  src: url("./assets/fonts/SourceSansPro-Black.ttf");
}
@font-face {
  font-family: FontBase-BlackItalic;
  src: url("./assets/fonts/SourceSansPro-BlackItalic.ttf");
}

@font-face {
  font-family: FontBase-ExtraLight;
  src: url("./assets/fonts/SourceSansPro-ExtraLight.ttf");
}
@font-face {
  font-family: FontBase-ExtraLightItalic;
  src: url("./assets/fonts/SourceSansPro-ExtraLightItalic.ttf");
}

@font-face {
  font-family: FontBase-Italic;
  src: url("./assets/fonts/SourceSansPro-Italic.ttf");
}
@font-face {
  font-family: FontBase-LightItalic;
  src: url("./assets/fonts/SourceSansPro-LightItalic.ttf");
}
@font-face {
  font-family: FontBase-Light;
  src: url("./assets/fonts/SourceSansPro-Light.ttf");
}
@font-face {
  font-family: FontBase-SemiboldItalic;
  src: url("./assets/fonts/SourceSansPro-SemiboldItalic.ttf");
}
@font-face {
  font-family: FontSpecial-Regular;
  src: url("./assets/fonts/SourceSansPro-Regular.ttf");
}
/******** IMÁGENES RETROALIMENTACIÓN BIEN Y MAL PARA DRAG N DROP **************************/
.actividad-drap-n-drop {
  .mal,
  .bien {
    position: relative;
    color: black;
    &:after {
      content: "";
      top: -12px;
      right: -12px;
      position: absolute;
      width: 25px;
      height: 25px;
      background-size: contain;
      z-index: 1;
    }
  }
}
/************* IMÁGENES DE BIEN/VISTO EN GENERAL *********************/
.cosa{
  height: 8vh;
}
.bot-check-vis, .bot-check-vis-cen, .feedback-mal, .feedback-mal-cen {
  position: relative;
}

.bot-check-vis:after, .feedback-mal:after {
  content: " ";
  background-image: url("./assets/imagenes_compartidas/check.svg");
  background-size: contain;
  position: absolute;
  width: 25px;
  height: 25px;
  top: -8px;
  right: -8px
}
// .feedback-mal:after {
//   background-image: url("./assets/imagenes_compartidas/Cerrar_Ventana.png");
// }

.bot-check-vis-cen:after, .feedback-mal-cen:after {
  content: " ";
  background-image: url("./assets/imagenes_compartidas/check.svg");
  background-size: contain;
  position: absolute;
  width: 30px;
  height: 30px;
  top: -20px;
  right: 0;
  left: 0;
  margin: auto;
}
// .feedback-mal-cen:after {
//   background-image: url("./assets/imagenes_compartidas/Cerrar_Ventana.png");
// }


.fade-enter-active, .fade-leave-active {
      transition: all 2s;
    position: absolute;
    max-height: 100%;
    min-height: 100%;
    max-width: calc(100% - 20px);
    min-width: calc(100% - 20px);
    overflow: hidden;
}
.fade-enter, .fade-leave-to /* .fade-leave-active below version 2.1.8 */ {
  opacity: 0;
}

</style>

