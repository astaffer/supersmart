<template>
  <div class="settings">
  <md-dialog-alert
  :md-content="alert.content"
  :md-ok-text="alert.ok"
  ref="dialog_user">
  </md-dialog-alert>
  <md-card md-with-hover class="settings">
    <md-card-header>
      <div class="md-title">Смена пароля</div>
      <div class="md-subhead">Пользователь: {{ user.user_name}}</div>
      <div class="md-subhead">Роли: {{ user.roles}}</div>
    </md-card-header>
    <md-card-content>
      <md-input-container>
        <label>Старый пароль</label>
        <md-input type="password" v-model="oldPwd">{{ oldPwd }}</md-input>
      </md-input-container>
      <md-input-container md-has-password>
        <label>Новый пароль</label>
        <md-input type="password" v-model="newPwd">{{ newPwd }}</md-input>
      </md-input-container>
      <md-card class="md-warn" v-if="error">
              <p>{{ error }}</p>
            </md-card>
    </md-card-content>
    <md-card-actions>
      <md-button class="md-raised md-accent" @click.native="changePassword()">Применить</md-button>
    </md-card-actions>
  </md-card>
  </div>
</template>
<script>
import userservice from '../user'
import auth from '../auth'
export default {
  name: 'userschange',
  data () {
    return {
      msg: 'Сменить пароль',
      oldPwd: '',
      newPwd: '',
      user: {
        user_name: '',
        roles: []
      },
      error: '',
      alert: {
        content: 'Пароль изменен!',
        ok: 'OK'
      }
    }
  },
  mounted () {
    userservice.getUser(this).then(response => {
      this.user = response.data
      this.error = ''
    }, response => {
      this.error = 'Error when get user data'
      console.log(this.error)
    })
  },
  methods: {
    changePassword () {
      userservice.changePassword(this, this.oldPwd, this.newPwd, this.user.user_name).then(response => {
        var credentials = {
          username: this.user.user_name,
          password: this.newPwd
        }
          // We need to pass the component's this context
          // to properly make use of http in the auth service
        auth.login(this, credentials, null)
        this.openDialog('dialog_user')
      }, response => {
        this.error = 'Ошибка при изменении пароля'
      })
    },
    openDialog (ref) {
      this.$refs[ref].open()
    },
    closeDialog (ref) {
      this.$refs[ref].close()
    }
  }
}
</script>
<style>
.settings{
  width: 98%;
}
.md-card{
  margin-bottom: 10px;
  margin-top: 10px;
  padding-left: 10px;
  padding-right: 10px;
}
</style>
