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
  setDeviceName (context, device) {
    if (auth.user.authenticated) {
      var creds = {
        access_id: auth.getAccessId(),
        device_id: device.id,
        device_name: device.name
      }
      return context.$http.post(service.getDeviceUpdateUrl(), creds)
    }
  }
}
