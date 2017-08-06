import service from '../service'
import auth from '../auth'
export default {
  getUser (context) {
    if (auth.user.authenticated) {
      var creds = {
        access_id: auth.getAccessId()
      }
      return context.$http.post(service.getUserUrl(), creds)
    }
  },
  changePassword (context, oldPassword, newPassword, user) {
    if (auth.user.authenticated) {
      var creds = {
        username: user,
        password: oldPassword,
        newpassword: newPassword
      }
      return context.$http.post(service.getUsersChangePassUrl(), creds)
    }
  },
  getUsers (context) {
    if (auth.user.authenticated) {
      var creds = {
        access_id: auth.getAccessId()
      }
      return context.$http.post(service.getUsersUrl(), creds)
    }
  },
  getRoles (context) {
    if (auth.user.authenticated) {
      var creds = {
        access_id: auth.getAccessId()
      }
      return context.$http.post(service.getRolesUrl(), creds)
    }
  },
  getUsersByRole (context, role) {
    if (auth.user.authenticated) {
      var creds = {
        access_id: auth.getAccessId()
      }
      return context.$http.post(service.getUsersUrl(), creds)
    }
  },
  createUser (context, user) {
    if (auth.user.authenticated) {
      var creds = {
        access_id: auth.getAccessId(),
        username: user.user_name,
        password: 'password',
        email: user.user_email,
        roles: user.roles
      }
      return context.$http.post(service.getUsersCreateUrl(), creds)
    }
  },
  addUserRole (context, user, newrole) {
    if (auth.user.authenticated) {
      var creds = {
        access_id: auth.getAccessId(),
        username: user.user_name,
        role: newrole
      }
      return context.$http.post(service.getUsersAddRoleUrl(), creds)
    }
  },
  deleteUserRole (context, user, delrole) {
    if (auth.user.authenticated) {
      var creds = {
        access_id: auth.getAccessId(),
        username: user.user_name,
        role: delrole
      }
      console.log(creds)
      return context.$http.post(service.getUsersDeleteRoleUrl(), creds)
    }
  },
  deleteUser (context, user) {
    if (auth.user.authenticated) {
      var creds = {
        access_id: auth.getAccessId()
      }
      return context.$http.post(service.getUsersDeleteUrl(), creds)
    }
  }
}
