import service from '../service'
import auth from '../auth'
export default {
  getBars (context) {
    if (auth.user.authenticated) {
      var creds = {
        access_id: auth.getAccessId()
      }
      return context.$http.post(service.getBarsUrl(), creds)
    }
  },
  setBar (context, barUnit) {
    if (auth.user.authenticated) {
      var creds = {
        access_id: auth.getAccessId(),
        bar: barUnit
      }
      return context.$http.post(service.getBarsUpdateUrl(), creds)
    }
  },
  createBar (context, barUnit) {
    if (auth.user.authenticated) {
      var creds = {
        access_id: auth.getAccessId(),
        bar: barUnit
      }
      return context.$http.post(service.getBarsCreateUrl(), creds)
    }
  },
  deleteBar (context, barId) {
    if (auth.user.authenticated) {
      var creds = {
        access_id: auth.getAccessId(),
        bar_id: barId
      }
      return context.$http.post(service.getBarsDeleteUrl(), creds)
    }
  }
}
