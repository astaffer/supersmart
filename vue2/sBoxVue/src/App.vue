<template>
  <div id="app">
    <md-toolbar class="md-dense">
      <md-button class="md-icon-button" @click.native="$router.push({ name: 'Home' })">
        <md-icon>cloud</md-icon>
      </md-button>
      <h2 class="md-title" style="flex: 1">BrainBox</h2>
      <md-button class="md-icon-button"  @click.native="$router.push({ name: 'AdminUsers' })" v-if="user.authenticated">
        <md-icon>accessibility</md-icon>
      </md-button>
      <md-button class="md-icon-button"  @click.native="$router.push({ path: '/dashboard/effects' })" v-if="user.authenticated">
        <md-icon>dashboard</md-icon>
      </md-button>
      <md-button class="md-icon-button"  @click.native="$router.push({ name: 'Settings' })" v-if="user.authenticated">
        <md-icon>settings</md-icon>
      </md-button>
      <md-button class="md-icon-button" v-if="user.authenticated" @click.native="logout()">
        <md-icon>exit_to_app</md-icon>
      </md-button>
    </md-toolbar>
    <router-view></router-view>
  </div>
</template>

<script>
import auth from './auth'
export default {
  name: 'app',
  data () {
    return {
      user: auth.user
    }
  },
  methods: {
    logout () {
      auth.logout()
    }
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  margin-top: 0px;
}
html {
    overflow: -moz-scrollbars-vertical; 
    overflow-y: scroll;
}
</style>
