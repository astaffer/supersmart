import service from '../service'
import auth from '../auth'
export default {
  gaugesData: {
    gaugesValues: [],
    gaugesOptions: []
  },
  getGauges (context, dateto) {
    if (auth.user.authenticated) {
      var gaugesParm = {
        access_id: auth.getAccessId(),
        dateTo: dateto
      }
      context.$http.post(service.getGaugesUrl(), gaugesParm).then(response => {
        this.gaugesData.gaugesValues = response.data.map(function (gauge) {
          return gauge.value
        })
        this.gaugesData.gaugesOptions = response.data.map(function (gauge) {
          var gaugeOption = {
            minValue: '0',
            maxValue: gauge.limit_value,
            units: gauge.gauge_unit,
            width: 200,
            height: 200,
            valueBox: true,
            majorTicks: [
              '0',
              '500',
              '1000',
              '3000',
              '5000',
              '7000',
              '10000'
            ],
            colorPlate: '#fff',
            borderShadowWidth: 0,
            borders: false,
            highlights: [{
              'from': 0,
              'to': gauge.start_yellow,
              'color': 'rgba(97, 218, 13, .75)'
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
      })
      return this.gaugesData
    }
  }
}
