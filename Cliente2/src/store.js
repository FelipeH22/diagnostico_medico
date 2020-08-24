import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
    state: {
        nextPant: false,
        screens: [0, 0],
        tema:'',
        subTema:'',
        // cantPagsMods: {moduloUno: 1, moduloDos: 30, moduloTres: 53, moduloCuatro: 74},
        cantPagsMods: [0,2,6], //Las dos primeras son para el landing page y la selección de los módulos
        paginas: 0,
        testResult: 0,
        MenuHamburguesa: false,
        menuContentOn: false,
        menuCloseAnimation: false,
        menuAmpliar: false,
        glossaryVisible: false,
      },
      mutations: {
        setTitle (state, newTitle) {
          state.title = newTitle
        },
        nextShow: (state, event) => state.nextPant = event,
        screenTrack: (state, [currentScr, cantScr]) => state.screens = [currentScr, cantScr],
        temaName: (state, event) => state.tema = event,
        subTemaName: (state, event) => state.subTema = event,
        conteoPaginas: (state, event) => state.paginas = event,
        updateSelectedRol: (state,event) => state.selectedRol = event,
        updateTestResult: (state,event) => state.testResult = event,
        openGlossary: (state, event) => state.glossaryVisible = event,
        menuState: state => state.menuContentOn = !state.menuContentOn,
        menuStateCerrar: state => state.menuCloseAnimation = !state.menuCloseAnimation,
        menuStateAmpliar: state => state.menuAmpliar = !state.menuAmpliar,
        menuBurguer: state => state.MenuHamburguesa = !state.MenuHamburguesa,

      },
      getters: {
        /* Retorna el número global de la página, este se compone de la suma de la 
          cantidad de páginas de todos los módulos anteriores y el modulo por el que se pregunta*/
    
        globalPage:(state) => (modNum) => {
          var page = 0;      
          for(var i = 0; i <= modNum; i++){
            page += state.cantPagsMods[i]
          }
          return page;
        }
    }
})
