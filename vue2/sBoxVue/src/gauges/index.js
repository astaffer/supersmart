import service from '../service'
import auth from '../auth'
export default {
  gaugesData: {
    gaugesValues: [],
    gaugesOptions: []
  },
  prepareData (data) {
    this.gaugesData.gaugesValues = data.map(function (gauge) {
      return gauge.value
    })
    this.gaugesData.gaugesOptions = data.map(function (gauge) {
      var ticks = [0, 1 / 6, 1 / 3, 1 / 2, 2 / 3, 5 / 6, 1]
      var majorTicks = ticks.map(function (tick) {
        return Math.floor(gauge.limit_value * tick) + ''
      })
      var gaugeOption = {
        minValue: '0',
        maxValue: gauge.limit_value,
        units: gauge.gauge_unit,
        width: 200,
        height: 200,
        valueBox: true,
        majorTicks: majorTicks,
        colorPlate: '#fff',
        borderShadowWidth: 0,
        borders: false,
        highlights: [{
          'from': 0,
          'to': gauge.start_yellow,
          'color': 'rgba(63, 102, 50, .75)'
        },
        {
          'from': gauge.start_yellow,
          'to': gauge.start_red,
          'color': 'rgba(242, 228, 106, .75)'
        },
        {
          'from': gauge.start_red,
          'to': gauge.limit_value,
          'color': 'rgba(200, 50, 50, .75)'
        }],
        animationDuration: 1500,
        animationRule: 'linear',
        title: gauge.gauge_label
      }
      return gaugeOption
    })
    return this.gaugesData
  },
  getGauges (context, dateto) {
    if (auth.user.authenticated) {
      var gaugesParm = {
        access_id: auth.getAccessId(),
        dateTo: dateto
      }
      return context.$http.post(service.getGaugesUrl(), gaugesParm)
    }
  }
}
