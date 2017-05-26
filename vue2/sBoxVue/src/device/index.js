import service from '../service'
import auth from '../auth'
export default {
  getDeviceFromService (context) {
    if (auth.user.authenticated) {
      var creds = {
        access_id: auth.getAccessId()
      }
      return context.$http.post(service.getDeviceUrl(), creds)
      /* .then(response => {
        this.device = response.data
      }, response => {
        context.error = 'Error when get device data'
        console.log(context.error)
      }) */
    }
  }
}
