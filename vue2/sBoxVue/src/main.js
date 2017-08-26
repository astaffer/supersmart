// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import auth from './auth'
import VueResource from 'vue-resource'
import VueMaterial from 'vue-material'
import VueMask from 'v-mask'
import './assets/css/vue-material.css'
import './assets/css/main.css'
Vue.use(VueResource)
Vue.use(VueMaterial)
Vue.use(VueMask)
Vue.material.registerTheme('default', {
  primary: 'light-blue',
  accent: 'green',
  warn: 'orange'
})
Vue.material.registerTheme({
  wh: {
    primary: 'white',
    accent: 'light-blue'
  },
  about: {
    primary: 'indigo'
  },
  contact: {
    primary: 'teal'
  },
  prop: {
    primary: 'green',
    accent: 'light-blue',
    warn: 'orange'
  }
})
Vue.config.productionTip = false
/* eslint-disable no-new */
router.beforeEach((to, from, next) => {
  if (to.meta.requiresAuth) {
    auth.checkAuth()
    if (auth.user.authenticated) {
      next()
    } else {
      next({name: 'Login'})
    }
  } else {
    next()
  }
})
new Vue({
  el: '#app',
  router,
  template: '<App/>',
  components: { App }
})
