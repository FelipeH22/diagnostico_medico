import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

// Importar páginas
import Portada from '@/pages/portada/'
import Unidad1 from '@/pages/unidad1/unidad1'

export default new Router({
  routes: [
      {
        path: '/',
        name: 'portada',
        component: Portada
      },
      {
        path: '/unidad1/:unipage',
        name: 'unidad1',
        component: Unidad1
      }
  ],
  /*scrollBehavior (to, from, savedPosition) {
    return { x: 0, y: 0 }
  }*/
})

