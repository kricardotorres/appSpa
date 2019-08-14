import Vue from 'vue' 
import  App  from  '../App.vue'
import  router  from  '../router'
import  store  from  '../store'
import  Axios  from  'axios' 
import BootstrapVue from 'bootstrap-vue'

import { library } from '@fortawesome/fontawesome-svg-core'
import { faLock } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
library.add(faLock)

Vue.component('font-awesome-icon', FontAwesomeIcon)
Vue.prototype.$http = Axios;

const token = localStorage.getItem('token');
if (token) {
  Vue.prototype.$http.defaults.headers.common['Authorization'] = token
}

Vue.config.productionTip = false
Vue.use(BootstrapVue)


import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

document.addEventListener('DOMContentLoaded', () => { 

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
})






  