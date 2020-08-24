import 'babel-polyfill'
import Vue from 'vue'
import './plugins/vuetify'
import App from './App.vue'
import router from './router'
import store from './store'
import VueYoutube from 'vue-youtube'
import draggable from 'vuedraggable'

// import './filters/filters'

Vue.use(draggable)
Vue.use(VueYoutube)
// Importar y registrar componentes

import audioPlayer from '@/components/audio-player'
Vue.component("audio-player", audioPlayer);
import botonCerrarModal from '@/components/boton-cerrar-modal'
Vue.component("boton-cerrar-modal-app", botonCerrarModal);
import header from '@/components/header'
Vue.component("header-app", header);
import navMenu from '@/components/nav-menu'
Vue.component("nav-menu-app", navMenu)
import modalApp from '@/components/modal'
Vue.component("modal-app", modalApp)
import logosApp from '@/components/logos'
Vue.component("logos-app", logosApp)

Vue.config.productionTip = false

Vue.directive('focus', {
  // When the bound element is inserted into the DOM...
  inserted: function (el) {
    // Focus the element
    el.focus()
    el.scrollIntoView({
      behavior: "smooth"
    })
  },
  componentUpdated: function (el) {
    // Focus the element
    el.focus()
    el.scrollIntoView({
      behavior: "smooth"
    })
  }
})
new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')

