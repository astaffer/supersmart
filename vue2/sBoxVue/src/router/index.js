
import Vue from 'vue'
import Router from 'vue-router'
import Dashboard from '@/components/Dashboard'
import Login from '@/components/Login'
import Home from '@/components/Home'
import Settings from '@/components/Settings'
import Effects from '@/components/Effects'
import Services from '@/components/Services'
import Properties from '@/components/Properties'

Vue.use(Router)
export default new Router({
  routes: [
    {
      path: '/',
      name: 'Home',
      component: Home
    },
    {
      path: '/dashboard',
      name: 'Dashboard',
      component: Dashboard,
      children: [
        {
          path: 'effects',
          component: Effects,
          meta: { requiresAuth: true }
        },
        {
          path: 'services',
          component: Services,
          meta: { requiresAuth: true }
        },
        {
          path: 'properties',
          component: Properties,
          meta: { requiresAuth: true }
        }
      ],
      meta: { requiresAuth: true }
    },
    {
      path: '/settings',
      name: 'Settings',
      component: Settings,
      meta: { requiresAuth: true }
    },
    {
      path: '/login',
      name: 'Login',
      component: Login
    },
    {
      path: '*',
      redirect: '/'
    }
  ]
})
