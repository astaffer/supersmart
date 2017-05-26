import service from '../service'
import auth from '../auth'
export default {
  getAllSensors (context) {
    if (auth.user.authenticated) {
      var creds = {
        access_id: auth.getAccessId()
      }
      return context.$http.post(service.getSensorsUrl(), creds)
    }
  },

  getSingleSensor () {

  },
  saveSingleSensor () {

  }
}
