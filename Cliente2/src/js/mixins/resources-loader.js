/* Creado por Juan Velandia <juankz.github.io> para Dominio Estudio
Este archivo provee funciones para cargar archivos remotos y locales.
Para cargar archivos remotos se utiliza el método require de webpack.
Para cargar archivos remotos se utiliza el API de axios para realizar peticiones al servidor

Métodos:
getJson
getPng
GetJpg
getSvg
getEmbeddedSvg
getMp4
*/

import vue from 'vue'
import axios from 'axios';
import vueAxios from 'vue-axios';

vue.use(vueAxios, axios);

export default{
  data(){
    return{
      LOCAL : 0,
      REMOTE : 1,
      SERVER_ROUTE : '', //"http://demos.dominioestudio.info/ecopetrol-operacion-Estructurada/",
      load_type : 0
    }
  },
  methods:{
    getJson(path, callback){
      require.context('../../assets/',true,/\.json$/)

      //Si la carga de archivo es local retorne el recurso utilizando webpack
      if (this.load_type === this.LOCAL) {
        callback(require('../../assets/' + path + '.json'))
        return
      }

      //Si la carga de archivos es remota, realice una petición al servidor

      var dataUrl = this.SERVER_ROUTE + path + '.json'

      axios.get(dataUrl).then(function(response){
        callback(response.data)
      }).catch(function(error){
        console.error(error + 'para la url ' + dataUrl)
      })
    },

    getPng(path, callback){
      require.context('../../assets/',true,/\.png$/)

      //Si la carga de archivo es local retorne el recurso utilizando webpack
      if (this.load_type === this.LOCAL) {
        callback(require('../../assets/' + path + '.png'))
        return
      }

      //Si la carga de archivos es remota, realice una petición al servidor

      var dataUrl = this.SERVER_ROUTE + path + '.png'

      axios.get(dataUrl).then(function(response){
        callback(response.data)
      }).catch(function(error){
        console.error(error + 'para la url ' + dataUrl)
      })
    },

    getJpg(path, callback){
      require.context('../../assets/',true,/\.jpg$/)

      //Si la carga de archivo es local retorne el recurso utilizando webpack
      if (this.load_type === this.LOCAL) {
        callback(require('../../assets/' + path + '.jpg'))
        return
      }

      //Si la carga de archivos es remota, realice una petición al servidor

      var dataUrl = this.SERVER_ROUTE + path + '.jpg'

      axios.get(dataUrl).then(function(response){
        callback(response.data)
      }).catch(function(error){
        console.error(error + 'para la url ' + dataUrl)
      })

    },

    getSvg(path, callback){
      require.context('../../assets/',true,/\.svg$/)

      //Si la carga de archivo es local retorne el recurso utilizando webpack
      if (this.load_type === this.LOCAL) {
        callback(require('!!url-loader!../../assets/' + path + '.svg'))
        return
      }

      //Si la carga de archivos es remota, realice una petición al servidor

      var dataUrl = this.SERVER_ROUTE + path + '.svg'

      axios.get(dataUrl).then(function(response){
        callback(response.data)
      }).catch(function(error){
        console.error(error + 'para la url ' + dataUrl)
      })

    },

    getEmbeddedSvg(path, callback){
      require.context('../../assets/',true,/\.svg$/)

      //Si la carga de archivo es local retorne el recurso utilizando webpack
      if (this.load_type === this.LOCAL) {
        callback(require('!!svg-inline-loader!../../assets/' + path + '.svg'))
        return
      }
    },

    getMp4(path, callback){
      require.context('../../assets/',true,/\.mp4$/)

      //Si la carga de archivo es local retorne el recurso utilizando webpack
      if (this.load_type === this.LOCAL) {
        callback(require('!!url-loader!../../assets/' + path + '.mp4'))
        return
      }

      //Si la carga de archivos es remota, realice una petición al servidor

      var dataUrl = this.SERVER_ROUTE + path + '.mp4'

      axios.get(dataUrl).then(function(response){
        callback(response.data)
      }).catch(function(error){
        console.error(error + 'para la url ' + dataUrl)
      })

    },

    /** getImage funciona solo si la ruta propuesta contiene la extensión del archivo*/
    getImage(path, callback) {
      var filename = path.split('.');
      var ext = filename.pop();

      if (ext == 'png') {
        return this.getPng(filename, callback);
      }
      else if (ext == 'jpg') {
        return this.getJpg(filename, callback);
      }
      else if (ext == 'svg') {
        return this.getSvg(filename, callback);
      }
      else {
        console.error('Error obteniendo la imagen ' + path);
      }
    },

    /** getImageOrEmbedded funciona solo si la ruta propuesta contiene la extensión del archivo*/
    getImageOrEmbedded(path, callback) {
      var filename = path.split('.');
      var ext = filename.pop();
      if (ext == 'png' || ext == 'jpg') {
        return this.getImage(path, callback);
      } else if (ext == 'svg') {
        return this.getEmbeddedSvg(filename, callback);
      } else {
        console.error('Error obteniendo la imagen ' + path);
      }
    }
  }
}
