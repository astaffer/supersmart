<template>
<div class="login-form">
  <md-layout md-gutter md-align="center">
    <md-layout md-flex-xsmall="80" md-flex-small="50" md-flex-medium="33"  md-flex-large="25" md-align="center">
      <md-card style="width:100%" md-with-hover>
        <md-card-content>
          <form >
            <md-input-container>
              <md-icon>account_circle</md-icon>
              <label>Логин</label>
              <md-input v-model="credentials.username"></md-input>
            </md-input-container>
            <md-input-container md-has-password>
              <md-icon>lock</md-icon>
              <label>Пароль</label>
              <md-input type="password" v-model="credentials.password"></md-input>
            </md-input-container>
            <md-layout md-align="center">
              <md-button class="md-raised md-accent" @click.native="submit()">Войти</md-button>
            </md-layout>
            <md-card class="md-warn" v-if="error">
              <p>{{ error }}</p>
            </md-card>
          </form>
        </md-card-content>
      </md-card>
    </md-layout>
  </md-layout> 
</div>
</template>
<script>
import auth from '../auth'
import router from '../router'
export default {
  data () {
    return {
        // We need to initialize the component with any
        // properties that will be used in it
      credentials: {
        username: '',
        password: ''
      },
      error: ''
    }
  },
  mounted: function () {
    this.isAuthenticated()
  },
  methods: {
    submit () {
      var credentials = {
        username: this.credentials.username,
        password: this.credentials.password
      }
        // We need to pass the component's this context
        // to properly make use of http in the auth service
      auth.login(this, credentials, '/dashboard/effects')
    },
    isAuthenticated () {
      auth.checkAuth()
      if (auth.user.authenticated) {
        router.push({path: '/dashboard/effects'})
      }
    }
  }
}
</script>
<style scoped>
.login-form{
  margin-top: 100px;
}
@media (max-width: 944px) {
  .md-flex-small-50 {
    min-width: 50%;
    -ms-flex: 0 1 50%;
    flex: 0 1 50%;
  }
}
@media (max-width: 600px) {
  .md-flex-xsmall-80 {
      min-width: 80%;
      -ms-flex: 0 1 80%;
      flex: 0 1 80%;
  }
}
</style>
