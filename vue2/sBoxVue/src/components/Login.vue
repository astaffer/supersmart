<template>
<div class="login-form">
  <md-layout md-gutter>
    <md-layout md-flex="33" md-flex-medium="33" md-flex-offset="33">
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
              <md-button @click.native="submit()">Войти</md-button>
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
  methods: {
    submit () {
      var credentials = {
        username: this.credentials.username,
        password: this.credentials.password
      }
        // We need to pass the component's this context
        // to properly make use of http in the auth service
      auth.login(this, credentials, 'Dashboard')
    }
      // auth.login(this, credential, 'Hello')
  }
}
</script>
<style>
.login-form{
  margin-top: 100px;
}
</style>
