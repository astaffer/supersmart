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
  }
}
