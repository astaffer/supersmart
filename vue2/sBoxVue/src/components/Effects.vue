<template>
  <div class="effects">
    <md-dialog md-open-from="#fab" md-close-to="#fab" ref="dialog2">
      <md-dialog-title>Указать период</md-dialog-title>
      <md-dialog-content>
          <md-input-container>
            <label>Дата от</label>
            <md-input v-model="dateFromStr"></md-input>
          </md-input-container>
          <md-input-container>
            <label>Дата до</label>
            <md-input v-model="dateToStr"></md-input>
          </md-input-container>
      </md-dialog-content>
      <md-dialog-actions>
        <md-button class="md-primary" @click.native="closeDialog('dialog2')">Отмена</md-button>
        <md-button class="md-primary" @click.native="getEffectsCustom()">Применить</md-button>
      </md-dialog-actions>
    </md-dialog>
    <md-toolbar class="md-dense">
      <div class="head-title">
        <h2 class="md-title" style="flex: 1">{{deviceInfo}}: {{caption}}</h2>
      </div>
    </md-toolbar>

    <md-layout md-gutter>
      <md-layout md-flex="80" md-flex-offset="5" class="top-5">
        <md-button-toggle md-single class="md-accent">
        <md-button @click.native="getDefEffects('today')" >Сегодня</md-button>
        <md-button @click.native="getDefEffects('yesterday')" class="md-toggle" >Вчера</md-button>
        <md-button @click.native="getDefEffects('week')" >Неделя</md-button>
        <md-button @click.native="getDefEffects('month')" >Месяц</md-button>
        <md-button @click.native="getDefEffects('quarter')" >Квартал</md-button>
        <md-button @click.native="getDefEffects('year')" >Год</md-button>
        <md-button @click.native="openDialog('dialog2')" id="fab">{{ datesButtonLabel }}</md-button>
        </md-button-toggle> 
      </md-layout>
    </md-layout>
    <md-layout md-gutter>
      <md-layout md-flex="80" md-flex-offset="5" class="top-5">
        <md-button-toggle md-single class="md-accent">
        <md-button @click.native="changeDetail('second')">Секунды</md-button>
        <md-button @click.native="changeDetail('minute')">Минуты</md-button>
        <md-button @click.native="changeDetail('hour')" class="md-toggle" >Часы</md-button>
        <md-button @click.native="changeDetail('day')">Дни</md-button>
        <md-button @click.native="changeDetail('week')" >Недели</md-button>
        <md-button @click.native="changeDetail('month')" >Месяцы</md-button>
        <md-button @click.native="changeDetail('quarter')" >Кварталы</md-button>
        <md-button @click.native="changeDetail('year')" >Годы</md-button>
        </md-button-toggle> 
      </md-layout>
    </md-layout>
    <md-layout md-gutter> 
      <md-layout md-flex-xsmall="100" md-flex-small="100" >
        <md-card class="md-warn" v-if="error">
                <p>{{ error }}</p>
        </md-card>
        <div class="chart-container" v-if="dataLoaded">
          <commitChart 
            :width = "600" 
            :chartData = this.dtc
            :options = this.charOpt></commitChart>
        </div> 
      </md-layout>
      <md-layout class="min-200">
        <md-table>
          <md-table-header>
            <md-table-row>
              <md-table-head class="short">Показатель</md-table-head>
              <md-table-head md-numeric class="short">{{ detaillabel }}</md-table-head>
              <md-table-head md-numeric class="short">%</md-table-head>
            </md-table-row>
          </md-table-header>
          <md-table-body>
            <md-table-row v-for="(entry, index) in this.eff" :key="entry.bar_id">
              <md-table-cell class="short" nowrap >{{ entry.bar_label }}</md-table-cell>
              <md-table-cell class="short"  md-numeric >{{ Math.round(entry.hours * 100) / 100  }}</md-table-cell>
              <md-table-cell class="short" >{{ percents[index] }}</md-table-cell>
            </md-table-row>
          </md-table-body>
        </md-table>
      </md-layout>
    </md-layout>
  </div>
</template>
<script>
import CommitChart from '../charts/CommitChart'
import effects from '../effects'
import device from '../device'
export default {
  name: 'effects',
  data () {
    return {
      caption: 'Эффективность',
      deviceInfo: '',
      dateFromStr: '',
      dateToStr: '',
      error: '',
      dataLoaded: true,
      showTable: false,
      someData: [100, 65, 54, 51, 25, 31, 13, 1, 3],
      dtc: {},
      dateFrom: {},
      dateTo: {},
      eff: [],
      percents: [],
      detail: 'hour',
      detaillabel: 'Часов'
    }
  },
  computed: {
    charOpt: function () {
      var chartDataLabel = this.someData
      var s = {
        responsive: true,
        legend: {
          display: false
        },
        title: {
          display: true,
          text: ''
        },
        scales: {
          yAxes: [{
            ticks: {
              beginAtZero: true
            },
            gridLines: {
              display: true
            }
          }],
          xAxes: [{
            categorySpacing: 1,
            categoryPercentage: 4,
            gridLines: {
              display: true
            }
          }]
        },
        events: true,
        tooltips: {
          enabled: true
        },
        hover: {
          animationDuration: 0
        },
        animation: {
          duration: 1,
          onComplete: function () {
            var chartInstance = this.chart
            var ctx = chartInstance.ctx
            // ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily)
            ctx.textAlign = 'center'
            ctx.textBaseline = 'bottom'
            this.data.datasets.forEach(function (dataset, i) {
              var meta = chartInstance.controller.getDatasetMeta(i)
              meta.data.forEach(function (bar, index) {
                var realData = chartDataLabel
                var data = realData[index]
                ctx.fillText(data, bar._model.x, bar._model.y - 5)
              })
            })
          }
        }
      }
      return s
    },
    datesButtonLabel: function () {
      /* var options = {
        year: 'numeric',
        month: 'numeric',
        day: 'numeric'
      } */
      // this.dateFromStr = this.dateFrom.toLocaleString('ru', options)
      // this.dateToStr = this.dateTo.toLocaleString('ru', options)
      return `${this.dateFromStr}-${this.dateToStr}`
    }
  },
  mounted () {
    this.getEffects(1, 0)
    device.getDeviceFromService(this).then(response => {
      this.deviceInfo = response.data.device_name
    }, response => {
      this.error = 'Ошибка при получении данных устройства'
      console.log(this.error)
    })
  },
  methods: {
    getEffs () {
      effects.getEffects(this, this.dateFrom.toISOString(), this.dateTo.toISOString(), this.detail).then(response => {
        var options = {
          year: 'numeric',
          month: 'numeric',
          day: 'numeric'
        }
        this.dateFromStr = this.dateFrom.toLocaleString('ru', options)
        this.dateToStr = this.dateTo.toLocaleString('ru', options)
        var effectsData = effects.prepareData(response.data)
        this.eff = effectsData.eff
        this.someData = effectsData.data
        this.percents = effectsData.percents
        this.dtc = {
          labels: effectsData.labels,
          datasets: [
            {
              label: '',
              data: effectsData.percents,
              borderWidth: 1,
              backgroundColor: effectsData.backgroundColors,
              borderColor: effectsData.borderColors
            }]
        }
      }, response => {
        this.error = 'Ошибка при получении показателей, сервис недоступен'
        console.log(this.error)
      })
    },
    getEffects (daysBack, to) {
      this.dateFrom = this.getDate(-daysBack)
      this.dateTo = this.getDate(to)
      this.getEffs()
    },
    getDefEffects (period) {
      switch (period) {
        case 'today':
          this.dateFrom = this.getDate(0)
          this.dateTo = this.getDate(1)
          break
        case 'yesterday':
          this.dateFrom = this.getDate(-1)
          this.dateTo = this.getDate(0)
          break
        case 'week':
          this.dateFrom = this.getDate(-7)
          this.dateTo = this.getDate(1)
          break
        case 'month':
          this.dateFrom = this.getDate(-30)
          this.dateTo = this.getDate(1)
          break
        case 'quarter':
          this.dateFrom = this.getDate(-90)
          this.dateTo = this.getDate(1)
          break
        case 'year':
          this.dateFrom = this.getDate(-365)
          this.dateTo = this.getDate(1)
          break
      }
      effects.getDefaultEffects(this, period, this.detail).then(response => {
        var options = {
          year: 'numeric',
          month: 'numeric',
          day: 'numeric'
        }
        this.dateFromStr = this.dateFrom.toLocaleString('ru', options)
        this.dateToStr = this.dateTo.toLocaleString('ru', options)
        var effectsData = effects.prepareData(response.data)
        this.eff = effectsData.eff
        this.someData = effectsData.data
        this.percents = effectsData.percents
        this.dtc = {
          labels: effectsData.labels,
          datasets: [
            {
              label: '',
              data: effectsData.percents,
              borderWidth: 1,
              backgroundColor: effectsData.backgroundColors,
              borderColor: effectsData.borderColors
            }]
        }
      }, response => {
        this.error = 'Ошибка при получении показателей, сервис недоступен'
        console.log(this.error)
      })
    },
    changeDetail (_detail) {
      this.detail = _detail
      switch (_detail) {
        case 'second':
          this.detaillabel = 'Секунд'
          break
        case 'minute':
          this.detaillabel = 'Минут'
          break
        case 'hour':
          this.detaillabel = 'Часов'
          break
        case 'day':
          this.detaillabel = 'Дней'
          break
        case 'week':
          this.detaillabel = 'Недель'
          break
        case 'month':
          this.detaillabel = 'Месяцев'
          break
        case 'quarter':
          this.detaillabel = 'Кварталов'
          break
        case 'year':
          this.detaillabel = 'Лет'
          break
      }
      this.getEffs()
    },
    getEffectsCustom () {
      this.dateFrom = this.parseDateFromStr(this.dateFromStr)
      this.dateTo = this.parseDateFromStr(this.dateToStr)
      this.getEffs()
      this.closeDialog('dialog2')
    },
    parseDateFromStr (dateStr) {
      var dateArr = dateStr.split('.')
      var date = new Date()
      date.setYear(dateArr[2])
      date.setMonth(dateArr[1] - 1)
      date.setDate(dateArr[0])
      date.setHours(0, 0, 0, 0)
      return date
    },
    getDate (days) {
      var date = new Date()
      date.setHours(0, 0, 0, 0)
      var newDate = new Date(date.setTime(date.getTime() + days * 86400000))
      return newDate
    },
    openDialog (ref) {
      this.$refs[ref].open()
    },
    closeDialog (ref) {
      this.$refs[ref].close()
    },
    onOpen () {
      console.log('Opened')
    },
    onClose (type) {
      console.log('Closed', type)
    }
  },
  components: {
    CommitChart
  }
}
</script>
<style scoped>
canvas {
  width: 100% !important;
  max-width: 600px;
  height: auto !important;
}
.md-button-toggle {
    display: block;
}
.chart-container{
  margin-left: 10px;
  margin-right: 10px;
  margin-top: 10px;
  margin-bottom: 30px;
  min-height: 400px;
  max-height: 400px;
  min-width: 700px;
  max-width: 700px;
  position: relative;
}
.effects{
  width: 100%;
}
.top-5{
  padding-top:5px;
}
.md-input-container {
  margin: 0;
}
.min-200 {
  min-width: 300px;
  margin-top: 10px;
  margin-left: 10px;
  margin-right: 10px;
}
.md-table .md-table-cell {
  height: 24px;
}
@media (max-width: 944px) {
  .chart-container {
    min-height: 300px;
    max-height: 300px;
    min-width: 500px;
    max-width: 500px;
  }
}
@media (max-width: 600px) {
  .chart-container {
    min-height: 250px;
    max-height: 250px;
    min-width: 350px;
    max-width: 350px;
  }
}
@media (max-width: 420px) {
  
  .chart-container {
    min-height: 170px;
    max-height: 170px;
    min-width: 250px;
    max-width: 250px;
  }
  .md-fab-bottom-right{
    display: none;
  }
}
</style>
<style>
@media (max-width: 420px) {
  .md-table .md-table-cell.short .md-table-cell-container {
    padding: 3px 10px 3px 7px;
  }
  .md-table .md-table-head-text.md-test {
    height: 16px;
    padding-right: 10px;
    padding-left: 7px;
    line-height: 10px;
  }
  .md-table .md-table-head.short .md-table-head-container{
    padding: 8px 0;
    height: 28px;
  }
  .md-table .md-table-head.short:last-child .md-table-head-container .md-table-head-text {
    padding-right: 12px;
  }
  .md-table .md-table-cell.short:last-child .md-table-cell-container {
    padding-right: 12px;
  }
  .min-200 {
    min-width: 200px;
  }
}
</style>
