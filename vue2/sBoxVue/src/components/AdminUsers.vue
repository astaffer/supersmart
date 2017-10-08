<template>
  <div class="settings">
    <md-dialog-alert
    :md-content="alert.content"
    :md-ok-text="alert.ok"
    ref="dialog_network">
    </md-dialog-alert>
  <md-dialog-alert
  :md-content="alert.user_created"
  :md-ok-text="alert.ok"
  ref="dialog_user_created">
  </md-dialog-alert>
  <md-dialog-alert
  :md-content="alert.user_changed"
  :md-ok-text="alert.ok"
  ref="dialog_user_changed">
  </md-dialog-alert>
  <md-dialog-alert
  :md-content="alert.user_deleted"
  :md-ok-text="alert.ok"
  ref="dialog_user_deleted">
  </md-dialog-alert>
  <md-dialog md-open-from="#fab" md-close-to="#fab" ref="dialogCreateUser">
      <md-dialog-title>Создать пользователя</md-dialog-title>
      <md-dialog-content>
          <md-input-container>
            <label>Логин</label>
            <md-input v-model="newUser.user_name"></md-input>
          </md-input-container>
          <md-input-container>
            <label>Email</label>
            <md-input v-model="newUser.user_email"></md-input>
          </md-input-container>
          <md-input-container md-has-password >
            <label>Пароль</label>
            <md-input type="password" v-model="newUser.user_password"></md-input>
          </md-input-container>
      </md-dialog-content>
      <md-dialog-actions>
        <md-button class="md-primary" @click.native="closeDialog('dialogCreateUser')">Отмена</md-button>
        <md-button class="md-primary" @click.native="createUser()">Создать</md-button>
      </md-dialog-actions>
  </md-dialog>
  <md-dialog ref="dialogUpdateUser">
      <md-dialog-title> Изменить пользователя</md-dialog-title>
      <md-dialog-content>
          <md-input-container>
            <label>Логин</label>
            <md-input disabled v-model="selectedUser.user_name"></md-input>
          </md-input-container>
          <md-input-container>
            <label>Email</label>
            <md-input v-model="selectedUser.user_email"></md-input>
          </md-input-container>
          <md-input-container  md-has-password>
            <label>Пароль</label>
            <md-input type="password" v-model="selectedUser.user_password"></md-input>
          </md-input-container>
      </md-dialog-content>
      <md-dialog-actions>
        <md-button class="md-primary" @click.native="closeDialog('dialogUpdateUser')">Отмена</md-button>
        <md-button class="md-primary" @click.native="updateUser()">Изменить</md-button>
      </md-dialog-actions>
   </md-dialog>
  <md-toolbar class="md-dense">      
    <div class="head-title">
      <h2 class="md-title" style="flex: 1">{{deviceInfo}}: {{caption}}</h2>
    </div>
  </md-toolbar>
  <md-dialog md-open-from="#fab" md-close-to="#fab" ref="dialog2">
      <md-dialog-title>Выбрать роль</md-dialog-title>
      <md-dialog-content>
        <form>
          <md-input-container>
            <label>Роль</label>
            <md-select v-model="addingRole">
              <md-option v-for="role in roles" :key="role" v-bind:value="role">{{ role }}</md-option>
            </md-select>
            <span class="md-error">Ошибка при заполнении</span>
          </md-input-container>
        </form>
      </md-dialog-content>
      <md-dialog-actions>
        <md-button class="md-primary" @click.native="closeDialog('dialog2')">Отмена</md-button>
        <md-button class="md-primary" @click.native="addUserRole()">Применить</md-button>
      </md-dialog-actions>
   </md-dialog>
   <md-layout md-gutter >
    <md-layout md-flex="100">
      <md-button class="md-raised md-accent" @click.native="openDialog('dialogCreateUser')" id="fab">Создать пользователя</md-button>
    </md-layout> 
   </md-layout>
   <md-layout md-gutter >
      <md-layout md-flex="33">
          <md-list class="custom-list md-triple-line settings">
            <md-list-item  v-for="user in users" :key="user.user_id" @click.native="showUser(user)" v-bind:class="{ 'active': isUserActive(user.user_id) }" >
                <md-icon>account_circle</md-icon>
                <div class="md-list-text-container">
                  <span>{{user.user_name}}</span>
                  <span>{{user.user_email}}</span>
                </div>
                <md-button class="md-icon-button md-list-action" @click.native="showUpdateUser(user)" v-if="user.user_name !== 'admin'">
                    <md-icon class="">edit</md-icon>
                  </md-button>
                 <md-button class="md-icon-button md-list-action" @click.native="deleteUser(user)" v-if="user.user_name !== 'admin'">
                    <md-icon class="">delete</md-icon>
                  </md-button>
                <md-divider class="md-inset"></md-divider>
            </md-list-item>
           </md-list>
      </md-layout>
      <md-layout md-flex="33" md-flex-offset="10">
          <form  class="userform">
            
            <h1 class="md-title">Роли пользователя</h1>
            <md-button  @click.native="openDialog('dialog2')" id="fab" class="md-icon-button md-raised md-dense">
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
                    <md-button @click.native="deleteUserRole(role)" class="md-icon-button">
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
import device from '../device'
export default {
  name: 'adminusers',
  data () {
    return {
      caption: 'Пользователи',
      deviceInfo: '',
      users: [],
      activeItem: '',
      newUser: {
        user_name: '',
        user_email: '',
        user_password: ''
      },
      selectedUser: {
        user_name: '',
        user_id: '',
        user_email: '',
        user_password: '',
        roles: []
      },
      addingRole: '',
      roles: [],
      error: '',
      alert: {
        content: 'Yo',
        user_created: 'Пользователь создан!',
        user_changed: 'Пользователь изменен!',
        user_deleted: 'Пользователь удален!',
        ok: 'OK'
      }
    }
  },
  mounted () {
    device.getDeviceFromService(this).then(response => {
      this.deviceInfo = response.data.device_name
    }, response => {
      this.error = 'Ошибка при получении данных устройства'
      console.log(this.error)
    })
    this.readUsers()
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
    readUsers () {
      userservice.getUsers(this).then(response => {
        this.users = response.data
        this.error = ''
        this.showUser(this.users[0])
      }, response => {
        this.error = 'Ошибка при получении данных пользователей'
        console.log(this.error)
      })
    },
    showUser (user) {
      this.selectedUser = user
      this.activeItem = user.user_id
    },
    deleteUser (user) {
      if (user.user_name !== 'admin') {
        userservice.deleteUser(this, user).then(response => {
          this.error = ''
          this.openDialog('dialog_user_deleted')
          this.readUsers()
        }, response => {
          this.error = 'Ошибка при создании пользователя, сервис недоступен'
          console.log(this.error)
        })
      }
    },
    showUpdateUser (user) {
      this.selectedUser = user
      this.openDialog('dialogUpdateUser')
    },
    updateUser () {
      this.closeDialog('dialogUpdateUser')
      userservice.updateUser(this, this.selectedUser).then(response => {
        this.error = ''
        this.openDialog('dialog_user_changed')
        this.readUsers()
      }, response => {
        this.error = 'Ошибка при обновлении данных пользователя, сервис недоступен'
        console.log(this.error)
      })
    },
    createUser () {
      this.closeDialog('dialogCreateUser')
      userservice.createUser(this, this.newUser).then(response => {
        this.error = ''
        this.openDialog('dialog_user_created')
        this.readUsers()
        this.newUser = {
          user_name: '',
          user_email: '',
          user_password: ''
        }
      }, response => {
        this.error = 'Ошибка при создании пользователя, сервис недоступен'
        console.log(this.error)
      })
    },
    isUserActive (userId) {
      return this.activeItem === userId
    },
    updateCreateUser (user) {
      if (user.user_id === '-1') {
        userservice.createUser(this, user).then(response => {
          this.error = ''
        }, response => {
          this.error = 'Ошибка при создании пользователя, сервис недоступен'
          console.log(this.error)
        })
      } else {
        userservice.updateUser(this, user).then(response => {
          this.error = ''
        }, response => {
          this.error = 'Ошибка при обновлении данных пользователя, сервис недоступен'
          console.log(this.error)
        })
      }
    },
    deleteUserRole (delrole) {
      userservice.deleteUserRole(this, this.selectedUser, delrole).then(response => {
        console.log(response.data)
        this.selectedUser = response.data
        function findUser (_userid) {
          return function (element) {
            return element.user_id === _userid
          }
        }
        var user = this.users.filter(findUser(this.selectedUser.user_id))
        user[0].roles = response.data.roles
        this.error = ''
      }, response => {
        this.error = 'Error when get roles data'
        console.log(this.error)
      })
    },
    addUserRole () {
      console.log(this.addingRole)
      userservice.addUserRole(this, this.selectedUser, this.addingRole).then(response => {
        console.log(response.data)
        this.selectedUser = response.data
        function findUser (_userid) {
          return function (element) {
            return element.user_id === _userid
          }
        }
        var user = this.users.filter(findUser(this.selectedUser.user_id))
        user[0].roles = response.data.roles
        this.error = ''
      }, response => {
        this.error = 'Error when get roles data'
        console.log(this.error)
      })
      this.closeDialog('dialog2')
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
  width: 100%;
}
.md-card{
  margin-bottom: 10px;
  margin-top: 10px;
}
li.md-list-item.active {
  background-color: #43a047;
}
</style>
