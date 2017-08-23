const HOST_NAME = location.hostname
const HOST_PORT = '8080'
const API_URL = 'http://' + HOST_NAME + ':' + HOST_PORT + '/'
const LOGIN_URL = 'auth/'
const SENSORS_URL = 'sensors/'
const EFFECTS_URL = 'effects/'
const GAUGES_URL = 'gauges/'
const BARS_URL = 'bars/'
const DEVICE_URL = 'device/'
const UPDATE_URL = 'change/'
const CREATE_URL = 'add/'
const DELETE_URL = 'delete/'
const GET_URL = 'get/'
const USERS_URL = 'users/'
const ROLES_URL = 'roles/'
const BYROLE_URL = 'byrole/'
const ADDROLE_URL = 'addrole/'
const DELETEROLE_URL = 'deleterole/'
const CHANGEPASS_URL = 'changepass/'
const STATUS_URL = 'status/'
export default {
  getApiUrl (api) {
    return API_URL + api
  },
  getStatusUrl () {
    return this.getApiUrl(STATUS_URL)
  },
  getAuthUrl () {
    return this.getApiUrl(LOGIN_URL)
  },
  getSensorsUrl () {
    return this.getApiUrl(SENSORS_URL)
  },
  getSensorUpdateUrl () {
    return this.getSensorsUrl() + UPDATE_URL
  },
  getEffectsUrl () {
    return this.getApiUrl(EFFECTS_URL)
  },
  getGaugesUrl () {
    return this.getApiUrl(GAUGES_URL)
  },
  getGaugesUpdateUrl () {
    return this.getGaugesUrl() + UPDATE_URL
  },
  getGaugesCreateUrl () {
    return this.getGaugesUrl() + CREATE_URL
  },
  getGaugesDeleteUrl () {
    return this.getGaugesUrl() + DELETE_URL
  },
  getBarsUrl () {
    return this.getApiUrl(BARS_URL)
  },
  getBarsUpdateUrl () {
    return this.getBarsUrl() + UPDATE_URL
  },
  getBarsCreateUrl () {
    return this.getBarsUrl() + CREATE_URL
  },
  getBarsDeleteUrl () {
    return this.getBarsUrl() + DELETE_URL
  },
  getDeviceUrl () {
    return this.getApiUrl(DEVICE_URL)
  },
  getDeviceUpdateUrl () {
    return this.getDeviceUrl() + UPDATE_URL
  },
  getUsersUrl () {
    return this.getApiUrl(USERS_URL)
  },
  getUserUrl () {
    return this.getApiUrl(USERS_URL) + GET_URL
  },
  getUsersChangePassUrl () {
    return this.getUsersUrl() + CHANGEPASS_URL
  },
  getRolesUrl () {
    return this.getApiUrl(ROLES_URL)
  },
  getUsersByRoleUrl () {
    return this.getApiUrl(USERS_URL) + BYROLE_URL
  },
  getUsersAddRoleUrl () {
    return this.getApiUrl(USERS_URL) + ADDROLE_URL
  },
  getUsersDeleteRoleUrl () {
    return this.getApiUrl(USERS_URL) + DELETEROLE_URL
  },
  getUsersCreateUrl () {
    return this.getApiUrl(USERS_URL) + CREATE_URL
  },
  getUsersDeleteUrl () {
    return this.getApiUrl(USERS_URL) + DELETE_URL
  },
  getUsersUpdateUrl () {
    return this.getApiUrl(USERS_URL) + UPDATE_URL
  }

}
