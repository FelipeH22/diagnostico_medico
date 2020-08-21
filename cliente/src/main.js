import Vue from 'vue'
import App from './App.vue'

//import 'material-design-icons-iconfont/dist/material-design-icons.css' // Ensure you are using css-loader

import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css'
import router from './router'
import store from './store'

Vue.use(Vuetify)

import menu from '@/components/menu'
Vue.component("menu-app", menu);
import footer from '@/components/footer'
Vue.component("footer-app", footer);
import consultor from '@/components/consultor'
Vue.component("consultor-app", consultor);

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
