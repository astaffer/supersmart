import auth from '../auth'
const SENSORS_URL = 'sensors/'
export default {
  sensors: [],
  sensor: {},
  getAllSensors (context) {
    if (auth.user.authenticated) {
      var creds = {
        access_id: auth.getAccessId()
      }
      context.$http.post(auth.getApiUrl() + SENSORS_URL, creds).then(response => {
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
