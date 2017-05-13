const HOST_NAME = location.hostname
const API_URL = 'http://' + HOST_NAME + ':8080/'
const LOGIN_URL = 'auth/'
const SENSORS_URL = 'sensors/'
const EFFECTS_URL = 'effects/'
export default {
  getApiUrl (api) {
    return API_URL + api
  },
  getAuthUrl () {
    return this.getApiUrl(LOGIN_URL)
  },
  getSensorsUrl () {
    return this.getApiUrl(SENSORS_URL)
  },
  getEffectsUrl () {
    return this.getApiUrl(EFFECTS_URL)
  }
}
