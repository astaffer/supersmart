import service from '../service'
import auth from '../auth'
export default {
  getAllConfigs (context) {
    if (auth.user.authenticated) {
      var creds = {
        access_id: auth.getAccessId()
      }
      return context.$http.post(service.getConfigsUrl(), creds)
    }
  },
  saveConfig (context, configname) {
    if (auth.user.authenticated) {
      var creds = {
        access_id: auth.getAccessId(),
        config_name: configname
      }
      return context.$http.post(service.getConfigSaveUrl(), creds)
    }
  },
  applyConfig (context, configid) {
    if (auth.user.authenticated) {
      var creds = {
        access_id: auth.getAccessId(),
        config_id: configid
      }
      return context.$http.post(service.getConfigApplyUrl(), creds)
    }
  },
  removeConfig (context, configid) {
    if (auth.user.authenticated) {
      var creds = {
        access_id: auth.getAccessId(),
        config_id: configid
      }
      return context.$http.post(service.getConfigDeleteUrl(), creds)
    }
  }
}
