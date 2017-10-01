const detailsList = [{key: 'second', value: 'Секунды'}, {key: 'minute', value: 'Минуты'}, {key: 'hour', value: 'Часы'}, {key: 'day', value: 'Дни'}, {key: 'week', value: 'Недели'}, {key: 'month', value: 'Месяцы'}, {key: 'quarter', value: 'Кварталы'}, {key: 'year', value: 'Годы'}]
import service from '../service'
import auth from '../auth'
export default {
  gaugesData: {
    gaugesValues: [],
    gaugesOptions: []
  },
  details () {
    return detailsList
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
        units: detailsList.find(i => i.key === gauge.detail).value,
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
  },
  createGauge (context, gaugeUnit) {
    if (auth.user.authenticated) {
      var creds = {
        access_id: auth.getAccessId(),
        gauge: gaugeUnit
      }
      return context.$http.post(service.getGaugesCreateUrl(), creds)
    }
  },
  updateGauge (context, gaugeUnit) {
    if (auth.user.authenticated) {
      var creds = {
        access_id: auth.getAccessId(),
        gauge: gaugeUnit
      }
      return context.$http.post(service.getGaugesUpdateUrl(), creds)
    }
  },
  deleteGauge (context, gaugeId) {
    if (auth.user.authenticated) {
      var creds = {
        access_id: auth.getAccessId(),
        gauge_id: gaugeId
      }
      return context.$http.post(service.getGaugesDeleteUrl(), creds)
    }
  }
}
