<template>
  <div class="effects">
    <md-layout md-gutter>
      <md-layout md-flex="60" md-flex-offset="10">
        <md-button-toggle md-single class="md-accent">
          <md-button @click.native="getEffects(0,1)" class="md-toggle">Сегодня</md-button>
          <md-button @click.native="getEffects(1,0)" >Вчера</md-button>
          <md-button @click.native="getEffects(7,1)" >Неделя</md-button>
          <md-button @click.native="getEffects(30,1)" >Месяц</md-button>
          <md-button @click.native="getEffects(120,1)" >Квартал</md-button>
          <md-button @click.native="getEffects(365,1)" >Год</md-button>
          <md-button>{{ datesButtonLabel }}</md-button>
        </md-button-toggle>   
      </md-layout>
    </md-layout>
    <md-layout md-align="end" md-gutter>
      <md-layout md-flex="30" >
        <md-button-toggle md-single class="md-accent">
          <md-button 
            class="md-icon-button" 
            v-bind:class="{'md-toggle': !showTable}"
            @click.native="showTable=false">
            <md-icon>assessment</md-icon>
          </md-button>
          <md-button 
            class="md-icon-button" 
            v-bind:class="{'md-toggle': showTable}"
            @click.native="showTable=true">
            <md-icon>view_list</md-icon>
          </md-button>
        </md-button-toggle>
        <md-button class="md-icon-button">
          <md-icon>file_download</md-icon>
        </md-button>
        <md-button class="md-icon-button">
          <md-icon>share</md-icon>
        </md-button>
      </md-layout>
    </md-layout>
    <md-layout md-gutter> 
      <md-layout md-flex="80" md-flex-offset="10" v-if="!showTable">
        <md-card class="md-warn" v-if="error">
                <p>{{ error }}</p>
        </md-card>
        
        <div class="chart-container" v-if="dataLoaded">
          <commitChart 
            :width = "800" 
            :chartData = this.dtc
            :options = this.charOpt></commitChart>
        </div> 
      </md-layout>
      <md-layout md-flex="80" md-align="center" v-if="showTable">
        <md-table>
          <md-table-header>
            <md-table-row>
              <md-table-head>Показатель</md-table-head>
              <md-table-head md-numeric>Часы</md-table-head>
              <md-table-head md-numeric>%</md-table-head>
            </md-table-row>
          </md-table-header>
          <md-table-body>
            <md-table-row v-for="entry in this.eff" :key="entry.bar_id">
              <md-table-cell>{{ entry.bar_label }}</md-table-cell>
              <md-table-cell md-numeric>{{ entry.hours }}</md-table-cell>
              <md-table-cell>{{ percents[entry.bar_id-1] }}</md-table-cell>
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
export default {
  name: 'effects',
  data () {
    return {
      msg: 'Эффективность',
      error: '',
      dataLoaded: true,
      showTable: false,
      someData: [100, 65, 54, 51, 25, 31, 13, 1, 3],
      dtc: {},
      dateFrom: {},
      dateTo: {},
      eff: [],
      percents: []
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
      var options = {
        year: 'numeric',
        month: 'short',
        day: 'numeric'
      }
      var dateFromStr = this.dateFrom.toLocaleString('ru', options)
      var dateToStr = this.getDate(0).toLocaleString('ru', options)
      return `${dateFromStr}-${dateToStr}`
    }
  },
  mounted () {
    this.getEffects(0, 1)
  },
  methods: {
    getEffects (daysBack, to) {
      this.dateFrom = this.getDate(-daysBack)
      this.dateTo = this.getDate(to)
      effects.getEffects(this, this.dateFrom.toISOString(), this.dateTo.toISOString(), 'hour').then(response => {
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
        this.error = 'Error when get effects data'
        console.log(this.error)
      })
    },
    getDate (days) {
      var date = new Date()
      date.setHours(0, 0, 0, 0)
      var newDate = new Date(date.setTime(date.getTime() + days * 86400000))
      return newDate
    }
  },
  components: {
    CommitChart
  }
}
</script>
<style>
.chart-container{
  min-height: 400px;
  max-height: 400px;
  min-width: 800px;
  max-width: 800px;
  position: relative;
}
.effects{
  width: 100%;
}
</style>
