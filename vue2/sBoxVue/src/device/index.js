import service from '../service'
import auth from '../auth'
export default {
  getDeviceFromService (context) {
    if (auth.user.authenticated) {
      var creds = {
        access_id: auth.getAccessId()
      }
      return context.$http.post(service.getDeviceUrl(), creds)
    }
  },
  updateDevice (context, deviceInfo) {
    if (auth.user.authenticated) {
      var creds = {
        access_id: auth.getAccessId(),
        device: deviceInfo
      }
      return context.$http.post(service.getDeviceUpdateUrl(), creds)
    }
  }
}
