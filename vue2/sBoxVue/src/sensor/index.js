import service from '../service'
import auth from '../auth'
export default {
  sensors: [],
  sensor: {},
  getAllSensors (context) {
    if (auth.user.authenticated) {
      var creds = {
        access_id: auth.getAccessId()
      }
      context.$http.post(service.getSensorsUrl(), creds).then(response => {
        // console.log(response.data)
        this.sensors = response.data
      }, response => {
        context.error = 'Error when get sensors data'
        console.log(context.error)
      })
      return this.sensors
    }
  },

  getSingleSensor () {

  },
  saveSingleSensor () {

  }
}
