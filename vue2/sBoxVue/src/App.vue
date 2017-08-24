<template>
  <div id="app" v-bind:class="{'mainapp': user.authenticated}" class="">
    <md-toolbar class="md-dense">
      <md-button class="md-icon-button menubutton" @click.native="toggleLeftSidenav" v-if="user.authenticated">
        <md-icon>menu</md-icon>
      </md-button>
      <md-button class="md-icon-button" @click.native="$router.push({ name: 'Home' })">
        <md-icon>cloud</md-icon>
      </md-button>
      <h2 class="md-title" style="flex: 1">BrainBox</h2>
      <!--<md-button class="md-icon-button"  @click.native="$router.push({ name: 'AdminUsers' })" v-if="user.authenticated">
        <md-icon>accessibility</md-icon>
      </md-button>
      <md-button class="md-icon-button"  @click.native="$router.push({ path: '/dashboard/effects' })" v-if="user.authenticated">
        <md-icon>dashboard</md-icon>
      </md-button>
      <md-button class="md-icon-button"  @click.native="$router.push({ name: 'Settings' })" v-if="user.authenticated">
        <md-icon>settings</md-icon>
      </md-button>
      -->
      <md-button class="md-icon-button" v-if="user.authenticated" @click.native="logout()">
        <md-icon>exit_to_app</md-icon>
      </md-button>
    </md-toolbar>
    <md-sidenav class="md-left-fixed" ref="leftSidenav" @open="open('Left')" @close="close('Left')" v-if="user.authenticated">
      <md-toolbar class="md-large  " md-theme="wh">
        <div class="md-toolbar-container">
          <div class="brainbox-logo" >
            
              <img src=".\assets\bb6.png"   alt="Brain Box logo">
             
            
          </div>
        </div>
      </md-toolbar>
      <md-list>
        <md-list-item @click.native="$router.push({ path: '/dashboard/effects' })">
             Эффективность 
        </md-list-item>
        <md-list-item @click.native="$router.push({ path: '/dashboard/services' })">
             Сервис 
        </md-list-item>
        <md-list-item @click.native="$router.push({ path: '/dashboard/properties' })">
             Параметры 
        </md-list-item>
        <md-list-item @click.native="$router.push({ path: '/adminusers' })">
             Пользователи 
        </md-list-item>
        <md-list-item @click.native="$router.push({ path: '/settings' })">
             Настройки 
        </md-list-item>
      </md-list>
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
.md-sidenav.md-left-fixed .md-sidenav-content {
  left: 0;
  transform: translate3D(-100%,0,0);
  width: 200px;
}
.md-sidenav.md-left-fixed .md-toolbar {
    min-height: 172px;
    border-bottom: 1px solid rgba(0,0,0,.12);
}
.brainbox-logo {
  font-size: 24px;
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-flow: column;
 
}
.brainbox-logo img {
   margin-top: 100px;
   width: 120px;
}
@media (min-width: 1280px) {
  .md-sidenav.md-left-fixed .md-sidenav-content {
    top: 0;
    pointer-events: auto;
    position: fixed;
    transform: translate3d(0, 0, 0);
    box-shadow: 0 1px 5px rgba(0,0,0,.2), 0 2px 2px rgba(0,0,0,.14), 0 3px 1px -2px rgba(0,0,0,.12);
  }
  .mainapp {
    padding-left: 200px;
  }
  .menubutton{
    transform: scale(0);
  }
}
</style>
