import service from '../service'
import auth from '../auth'
export default {
  getAllSensors (context) {
    if (auth.user.authenticated) {
      var creds = {
        access_id: auth.getAccessId(),
        filter: 'sensor_hide = 0'
      }
      return context.$http.post(service.getSensorsUrl(), creds)
    }
  },
  getAllSensorsWithHidden (context) {
    if (auth.user.authenticated) {
      var creds = {
        access_id: auth.getAccessId(),
        filter: ''
      }
      return context.$http.post(service.getSensorsUrl(), creds)
    }
  },
  setSensor (context, _sensor) {
    if (auth.user.authenticated) {
      var creds = {
        access_id: auth.getAccessId(),
        sensor: _sensor
      }
      return context.$http.post(service.getSensorUpdateUrl(), creds)
    }
  },
  clearSensorData (context, _sensor) {
    if (auth.user.authenticated) {
      var creds = {
        access_id: auth.getAccessId(),
        sensor: _sensor
      }
      return context.$http.post(service.getSensorClearDataUrl(), creds)
    }
  },
  getSingleSensor () {

  },
  saveSingleSensor () {

  }
}
