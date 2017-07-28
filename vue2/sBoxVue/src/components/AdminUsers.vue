<template>
  <div class="settings">
  <md-dialog-alert
  :md-content="alert.content"
  :md-ok-text="alert.ok"
  ref="dialog_network">
  </md-dialog-alert>
   <md-layout md-gutter >
      <md-layout md-flex="33" md-flex-offset="20">
          <md-list class="custom-list md-triple-line settings">
            <md-list-item   @click.native="createUser()" v-bind:class="{ 'active': isUserActive(-1) }">
                <md-icon>account_circle</md-icon>
                <div class="md-list-text-container">
                  <span>Новый пользователь</span>
                  <span>Создать</span>
                </div>
                <md-divider class="md-inset"></md-divider>
            </md-list-item>  
            <md-list-item  v-for="user in users" :key="user.user_id" @click.native="showUser(user)" v-bind:class="{ 'active': isUserActive(user.user_id) }" >
                <md-icon>account_circle</md-icon>
                <div class="md-list-text-container">
                  <span>{{user.user_name}}</span>
                  <span>{{user.user_email}}</span>
                </div>
                <md-divider class="md-inset"></md-divider>
            </md-list-item>
           </md-list>
      </md-layout>
      <md-layout>
          <form  class="userform">
            <md-input-container>
              <label>Пользователь</label>
              <md-input v-model="selectedUser.user_name">{{selectedUser.user_name}}</md-input>
            </md-input-container>
            <md-input-container>
              <label>Email</label>
              <md-input v-model="selectedUser.user_email">{{selectedUser.user_email}}</md-input>
            </md-input-container>
            <md-button class="md-raised md-accent" @click.native="updateCreateUser(selectedUser)" >Применить</md-button>
            
            <h1 class="md-title">Роли
            <md-button class="md-icon-button md-raised md-dense">
                          <md-icon>add</md-icon></md-button></h1>
            <md-table>
              <md-table-header>
                <md-table-row>
                <md-table-head>Роль</md-table-head>
                <md-table-head> 
                </md-table-head>
                </md-table-row>
              </md-table-header>
              <md-table-body>
                <md-table-row v-for="role in selectedUser.roles" :key="role">
                  <md-table-cell>{{ role }}</md-table-cell>
                  <md-table-cell>
                    <md-button class="md-icon-button">
                      <md-icon>delete</md-icon>
                    </md-button>
                  </md-table-cell>
                </md-table-row>
              </md-table-body>
            </md-table>

          </form>
      </md-layout>
   </md-layout>
  </div>
</template>
<script>
import userservice from '../user'
export default {
  name: 'adminusers',
  data () {
    return {
      users: [],
      activeItem: '',
      selectedUser: {
        user_name: '',
        user_id: '',
        user_email: '',
        roles: []
      },
      roles: [],
      error: '',
      alert: {
        content: 'Yo',
        ok: 'OK'
      }
    }
  },
  mounted () {
    userservice.getUsers(this).then(response => {
      this.users = response.data
      this.error = ''
      this.showUser(this.users[0])
    }, response => {
      this.error = 'Error when get users data'
      console.log(this.error)
    })
    userservice.getRoles(this).then(response => {
      this.roles = response.data
      this.error = ''
    }, response => {
      this.error = 'Error when get roles data'
      console.log(this.error)
    })
  },
  computed: {
  },
  methods: {
    showUser (user) {
      this.selectedUser = user
      this.activeItem = user.user_id
    },
    createUser () {
      this.selectedUser = {
        user_name: '',
        user_id: '-1',
        user_email: '',
        roles: []
      }
      this.activeItem = -1
    },
    isUserActive (userId) {
      return this.activeItem === userId
    },
    updateCreateUser (user) {
      if (user.user_id === '-1') {
        userservice.createUser(this, user).then(response => {
          this.error = ''
        }, response => {
          this.error = 'Error when create user data'
          console.log(this.error)
        })
      } else {
        userservice.updateUser(this, user).then(response => {
          this.error = ''
        }, response => {
          this.error = 'Error when upadate user data'
          console.log(this.error)
        })
      }
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
<style scoped>
.settings {
  width: 98%;
}
.md-card{
  margin-bottom: 10px;
  margin-top: 10px;
}
li.md-list-item.active {
  background-color: #43a047;
}
</style>
