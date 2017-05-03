// src/auth/index.js
// URL and endpoint constants
import router from '../router'
const API_URL = 'http://' + location.hostname + ':8080/'
const LOGIN_URL = API_URL + 'auth/'

export default {

  // User object will let us check authentication status
  user: {
    authenticated: false
  },

  // Send a request to the login URL and save the returned JWT
  login (context, creds, redirect) {
    context.$http.post(LOGIN_URL, creds).then(response => {
      if (response.data.message === 'OK') {
        localStorage.setItem('access_id', response.data.access_id)
        this.user.authenticated = true
        // Redirect to a specified route
        if (redirect) {
          router.push({name: redirect})
        }
      } else {
        context.error = 'Error:' + response.data.message
      }
    }, response => {
      context.error = 'Error when auth attempt check the net'
    // error callback
    })
  },
  // To log out, we just need to remove the token
  logout () {
    localStorage.removeItem('access_id')
    this.user.authenticated = false
    router.push({name: 'Home'})
  },
  checkAuth () {
    var jwt = localStorage.getItem('access_id')
    if (jwt) {
      console.log(jwt)
      this.user.authenticated = true
    } else {
      this.user.authenticated = false
    }
  },
  // The object to be passed as a header for authenticated requests
  getAuthHeader () {
    return {
      'Authorization': 'Bearer ' + localStorage.getItem('access_id')
    }
  }
}
