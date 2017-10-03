
import Vue from 'vue'
import Router from 'vue-router'
import Dashboard from '@/components/Dashboard'
import Login from '@/components/Login'
import Home from '@/components/Home'
import Settings from '@/components/Settings'
import AdminUsers from '@/components/AdminUsers'
import Effects from '@/components/Effects'
import Services from '@/components/Services'
import Properties from '@/components/Properties'
import SideNav from '@/components/SideNav'
import Configurations from '@/components/Configurations'
import PureData from '@/components/PureData'
import Temp from '@/components/Temp'
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
          name: 'Effects',
          path: 'effects',
          component: Effects,
          meta: { requiresAuth: true }
        },
        {
          name: 'Services',
          path: 'services',
          component: Services,
          meta: { requiresAuth: true }
        },
        {
          name: 'Properties',
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
      path: '/configurations',
      name: 'Configurations',
      component: Configurations,
      meta: { requiresAuth: true }
    },
    {
      path: '/puredata',
      name: 'PureData',
      component: PureData,
      meta: { requiresAuth: true }
    },
    {
      path: '/adminusers',
      name: 'AdminUsers',
      component: AdminUsers,
      meta: { requiresAuth: true }
    },
    {
      path: '/login',
      name: 'Login',
      component: Login
    },
    {
      path: '/sidenav',
      name: 'SideNav',
      component: SideNav
    },
    {
      path: '/temp',
      name: 'Temp',
      component: Temp,
      children: [
        {
          name: 'gauges',
          path: 'gauges',
          component: Services,
          meta: { requiresAuth: true }
        }
      ]
    },
    {
      path: '*',
      redirect: '/'
    }
  ]
})
