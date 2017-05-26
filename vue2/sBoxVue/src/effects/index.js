import service from '../service'
import auth from '../auth'
export default {
  effects: [],
  effectsData: {
    backgroundColors: [],
    borderColors: [],
    labels: [],
    data: [],
    percents: [],
    eff: []
  },
  prepareData (data) {
    this.effects = data
    this.effectsData.eff = data
    this.effectsData.labels = this.effects.map(function (effect) {
      return effect.bar_label
    })
    this.effectsData.backgroundColors = this.effects.map(function (effect) {
      var color = effect.bar_color
      return `rgba(${color}, 0.2)`
    })
    this.effectsData.borderColors = this.effects.map(function (effect) {
      var color = effect.bar_color
      return `rgba(${color}, 1)`
    })
    var plan = this.effects.filter(function (effect) {
      return effect.bar_type === 'Plan'
    })[0]
    this.effectsData.data = this.effects.map(function (effect) {
      if (effect.bar_type === 'Plan') {
        return effect.hours
      }
      return effect.hours
      // return effect.bar_type === 'SensorOff' ? plan.hours - effect.hours : effect.hours
    })
    this.effectsData.percents = this.effectsData.data.map(function (item) {
      return plan.hours > 0 ? Math.round(item / plan.hours * 100) : 0
    })
    return this.effectsData
  },
  getEffects (context, datefrom, dateto, detail) {
    if (auth.user.authenticated) {
      var effectsParm = {
        access_id: auth.getAccessId(),
        dateFrom: datefrom,
        dateTo: dateto,
        detail: detail
      }
      return context.$http.post(service.getEffectsUrl(), effectsParm)
    }
  }
}
