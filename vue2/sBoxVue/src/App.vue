<template>
  <div id="app" v-bind:class="{'mainapp': user.authenticated}" class="">
    <md-toolbar class="md-dense" v-if="!user.authenticated">
      <md-button class="md-icon-button menubutton" @click.native="toggleLeftSidenav" v-if="user.authenticated">
        <md-icon>menu</md-icon>
      </md-button>
      <md-button class="md-icon-button" @click.native="$router.push({ name: 'Home' })">
        <md-icon>cloud</md-icon>
      </md-button>
      <h2 class="md-title" style="flex: 1">BrainBox</h2>
      <md-button class="md-icon-button" v-if="user.authenticated" @click.native="logout()">
        <md-icon>exit_to_app</md-icon>
      </md-button>
    </md-toolbar>
    <div class="menubutton">
        <md-button class="md-icon-button" @click.native="toggleLeftSidenav" v-if="user.authenticated">
            <md-icon>menu</md-icon>
        </md-button>
    </div>
    <md-sidenav class="md-left-fixed" ref="leftSidenav"  v-if="user.authenticated">
      <md-toolbar class="md-large  " md-theme="wh">
        <div class="md-toolbar-container">
          <div class="brainbox-logo" >
              <img src=".\assets\bb6.png"   alt="Brain Box logo">
          </div>
        </div>
      </md-toolbar>
      <md-list>
        <md-list-item @click.native="$router.push({ path: '/dashboard/effects' })">
             <md-icon>assessment</md-icon><span>Эффективность</span>
        </md-list-item>
        <md-list-item @click.native="$router.push({ path: '/dashboard/services' })">
             <md-icon>data_usage</md-icon><span>Сервис </span>
        </md-list-item>
        <md-list-item @click.native="$router.push({ path: '/dashboard/properties' })">
             <md-icon>star</md-icon><span>Параметры </span>
        </md-list-item>
        <md-list-item @click.native="$router.push({ path: '/adminusers' })">
             <md-icon>accessibility</md-icon><span>Пользователи </span>
        </md-list-item>
        <md-list-item @click.native="$router.push({ path: '/settings' })">
             <md-icon>settings</md-icon><span>Настройки </span>
             <md-divider class="md-inset"></md-divider>
        </md-list-item>
        <md-list-item @click.native="logout()">
             <md-icon class="md-warn">exit_to_app</md-icon><span>Выход</span> 
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
  width: 220px;
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
.mainapp {
  position: relative;
  height: 100%;
}
.menubutton {
    /* transform: scale(0); */
    display: block;
    position: absolute;
    z-index: 10;
    left: 0px;
    top: 2px;
}
.head-title {
  padding-left: 30px;
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
    padding-left: 220px;
  }
  .menubutton {
    /* transform: scale(0); */
    display: none;
  }
  .head-title {
    padding-left: 0px;
  }
}
</style>
