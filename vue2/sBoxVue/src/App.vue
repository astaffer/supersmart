<template>
  <div id="app" class="mainapp">
    <md-toolbar class="md-dense">
      <md-button class="md-icon-button" @click.native="toggleLeftSidenav" v-if="user.authenticated">
        <md-icon>menu</md-icon>
      </md-button>
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
    <md-sidenav class="md-left" ref="leftSidenav" @open="open('Left')" @close="close('Left')" v-if="user.authenticated">
      <md-toolbar class="md-large">
        <div class="md-toolbar-container">
          <h3 class="md-title">Sidenav content</h3>
        </div>
      </md-toolbar>

      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nisi cupiditate esse necessitatibus beatae nobis, deserunt ut est fugit, tempora deleniti, eligendi commodi doloribus. Nemo, assumenda possimus, impedit inventore perferendis iusto!</p>
    </md-sidenav>
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
    },
    toggleLeftSidenav () {
      this.$refs.leftSidenav.toggle()
    },
    open (ref) {
      console.log('Opened: ' + ref)
    },
    close (ref) {
      console.log('Closed: ' + ref)
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
@media (min-width: 1280px) {
  .md-sidenav-content {
    top: 0;
    pointer-events: auto;
    transform: translate3d(0, 0, 0);
  }
}
</style>
