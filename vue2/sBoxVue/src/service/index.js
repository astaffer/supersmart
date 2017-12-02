const HOST_NAME = location.hostname
const HOST_PORT = '80'
const API_URL = 'http://' + HOST_NAME + ':' + HOST_PORT + '/'
const DEV_API_URL = 'http://' + HOST_NAME + ':' + '8080' + '/'
const LOGIN_URL = 'auth/'
const SENSORS_URL = 'sensors/'
const EFFECTS_URL = 'effects/'
const DEFEFFECTS_URL = 'defeffects/'
const GAUGES_URL = 'gauges/'
const BARS_URL = 'bars/'
const DEVICE_URL = 'device/'
const CONFIGS_URL = 'configs/'
const UPDATE_URL = 'change/'
const CREATE_URL = 'add/'
const DELETE_URL = 'delete/'
const SAVE_URL = 'save/'
const APPLY_URL = 'apply/'
const GET_URL = 'get/'
const USERS_URL = 'users/'
const ROLES_URL = 'roles/'
const BYROLE_URL = 'byrole/'
const ADDROLE_URL = 'addrole/'
const DELETEROLE_URL = 'deleterole/'
const CHANGEPASS_URL = 'changepass/'
const STATUS_URL = 'status/'
const CLEARDATA_URL = 'cleardata/'
const PUREDATA_URL = 'util/puredata/'
export default {
  getApiUrl (api) {
    if (process.env.NODE_ENV === 'development') {
      return DEV_API_URL + api
    }
    return API_URL + api
  },
  getPureDataUrl () {
    return this.getApiUrl(PUREDATA_URL)
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
  getSensorClearDataUrl () {
    return this.getSensorsUrl() + CLEARDATA_URL
  },
  getEffectsUrl () {
    return this.getApiUrl(EFFECTS_URL)
  },
  getDefEffectsUrl () {
    return this.getApiUrl(DEFEFFECTS_URL)
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
  },
  getConfigsUrl () {
    return this.getApiUrl(CONFIGS_URL)
  },
  getConfigApplyUrl () {
    return this.getApiUrl(CONFIGS_URL) + APPLY_URL
  },
  getConfigDeleteUrl () {
    return this.getApiUrl(CONFIGS_URL) + DELETE_URL
  },
  getConfigSaveUrl () {
    return this.getApiUrl(CONFIGS_URL) + SAVE_URL
  }

}
