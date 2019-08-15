import Vue from 'vue' 
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    status: '',
    token: localStorage.getItem('access-token') || '',
    client: localStorage.getItem('client') || '',
    uid: localStorage.getItem('user') || '',
    user: localStorage.getItem('user') || {}
  },
  mutations: {
    auth_request(state) {
      state.status = 'loading'
    },
    data_request(state) {
      state.status = 'loading'
    },
    data_success(state) {
      state.status = 'success'
    },
    auth_success(state, token, user, client) {
      state.status = 'success'
      state.token = token
      state.user = user
      state.client = client
    },
    auth_error(state) {
      state.status = 'error'
    },
    load_error(state) {
      state.status = 'error'
    },
    logout(state) {
      state.status = ''
      state.token = ''
    },
  },
  actions: {
    login({ commit }, user) {
      return new Promise((resolve, reject) => {
        commit('auth_request')
        axios({ url: '/api/auth/sign_in', data: user, method: 'POST' })
          .then(resp => { 
            const token = resp.headers['access-token']
            const user = resp.headers.uid 
            const client = resp.headers.client 
            localStorage.setItem('access-token', token)
            localStorage.setItem('user', user)
            localStorage.setItem('client', client)
            // Add the following line:
            axios.defaults.headers.common['access-token'] = token
            axios.defaults.headers.common['client'] = client
            axios.defaults.headers.common['uid'] = user
            commit('auth_success', token, user, client)
            resolve(resp)
          })
          .catch(err => {
            commit('auth_error')
            localStorage.removeItem('access-token')
            reject(err)
          })
      })
    },
    register({ commit }, user) {
      return new Promise((resolve, reject) => {
        commit('auth_request')
        axios({ url: '/register', data: user, method: 'POST' })
          .then(resp => {
            const token = resp.data.token
            const user = resp.data.user
            localStorage.setItem('token', token)
            // Add the following line:
            axios.defaults.headers.common['access-token'] = token
            commit('auth_success', token, user,resp.data.client)
            resolve(resp)
          })
          .catch(err => {
            commit('auth_error', err)
            localStorage.removeItem('token')
            reject(err)
          })
      })
    },
    getCarrousels({ commit }  ){
 
      const url = `/api/v1/carrousels.json`;
    return axios.get(url).then(response => response.data);

    },
    getCards({ commit }  ){
 
      const url = `/api/v1/cards.json`;
    return axios.get(url).then(response => response.data);

    },
    getInvestigateds({ commit }  ){

            axios.defaults.headers.common['access-token'] = localStorage.getItem('access-token')


            axios.defaults.headers.common['client'] = localStorage.getItem('client')
            axios.defaults.headers.common['uid'] = localStorage.getItem('user')
      const url = `/api/v1/investigateds.json`;
    return axios.get(url).then(response => response.data);

    },
    getInvestigated(pk) {
    const url = `/api/v1/investigateds/${pk}.json`;
    return axios.get(url).then(response => response.data);
    },

    sign_out({ commit }  ){
      return new Promise((resolve, reject) => {
        commit('auth_request')
        axios({ url: '/api/auth/sign_out', 
        headers: {
            'Content-Type': 'application/json',
        }, method: 'DELETE' })
          .then(resp => { 
        commit('logout')
        localStorage.removeItem('access-token')

           delete axios.defaults.headers.common['access-token']  
           delete axios.defaults.headers.common['client'] 
           delete axios.defaults.headers.common['uid']
        resolve()  
             
          })
          .catch(err => {
            commit('auth_error')
            localStorage.removeItem('access-token')
            reject(err)
          })
      })
    },
    logout({ commit }) {
      return new Promise((resolve, reject) => {
        commit('logout')
        localStorage.removeItem('access-token')
        delete axios.defaults.headers.common['Authorization']
        resolve()
      })
    }
  },
  getters: {
    isLoggedIn: state => !!state.token,
    authStatus: state => state.status,
  }
})
