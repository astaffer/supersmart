<template>
  <div class="effects">
    <md-layout md-gutter>
      <md-layout md-flex="60" md-flex-offset="10">
        <md-button-toggle md-single class="md-accent">
          <md-button @click.native="generateData()" class="md-toggle">Сегодня</md-button>
          <md-button @click.native="generateData()" >Вчера</md-button>
          <md-button @click.native="generateData()" >Неделя</md-button>
          <md-button @click.native="generateData()" >Месяц</md-button>
          <md-button @click.native="generateData()" >Квартал</md-button>
          <md-button @click.native="generateData()" >Год</md-button>
          <md-button>19 фев - 17 мар 2017</md-button>
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
        <div class="chart-container">
          <commitChart 
            :width="750" 
            :height="500" 
            :chartData=this.dtc
            :options=this.chartOptions></commitChart>
        </div> 
      </md-layout>
      <md-layout md-flex="80" md-align="center" v-if="showTable">
        <md-table v-once>
          <md-table-header>
            <md-table-row>
              <md-table-head>Показатель</md-table-head>
              <md-table-head md-numeric>Часы</md-table-head>
              <md-table-head md-numeric>%</md-table-head>
            </md-table-row>
          </md-table-header>
          <md-table-body>
            <md-table-row>
              <md-table-cell>План</md-table-cell>
              <md-table-cell>56</md-table-cell>
              <md-table-cell>100</md-table-cell>
            </md-table-row>
            <md-table-row>
              <md-table-cell>Время включения</md-table-cell>
              <md-table-cell>49</md-table-cell>
              <md-table-cell>87,5</md-table-cell>
            </md-table-row>
            <md-table-row>
              <md-table-cell>Время работы</md-table-cell>
              <md-table-cell>40</md-table-cell>
              <md-table-cell>71,4</md-table-cell>
            </md-table-row>
            <md-table-row>
              <md-table-cell>Свет</md-table-cell>
              <md-table-cell>56</md-table-cell>
              <md-table-cell>100</md-table-cell>
            </md-table-row>
            <md-table-row>
              <md-table-cell>Завеса</md-table-cell>
              <md-table-cell>35</md-table-cell>
              <md-table-cell>65,5</md-table-cell>
            </md-table-row>
            <md-table-row>
              <md-table-cell>Вентиляция</md-table-cell>
              <md-table-cell>30</md-table-cell>
              <md-table-cell>53,6</md-table-cell>
            </md-table-row>
            <md-table-row>
              <md-table-cell>Нет завеса-насос</md-table-cell>
              <md-table-cell>2</md-table-cell>
              <md-table-cell>3,6</md-table-cell>
            </md-table-row>
            <md-table-row>
              <md-table-cell>Нет завеса-уровень воды</md-table-cell>
              <md-table-cell>8</md-table-cell>
              <md-table-cell>14,3</md-table-cell>
            </md-table-row>
            <md-table-row>
              <md-table-cell>Фильтры забиты</md-table-cell>
              <md-table-cell>1</md-table-cell>
              <md-table-cell>1,8</md-table-cell>
            </md-table-row>
            <md-table-row>
              <md-table-cell>Вибрация</md-table-cell>
              <md-table-cell>0</md-table-cell>
              <md-table-cell>0</md-table-cell>
            </md-table-row>
          </md-table-body>
        </md-table>
      </md-layout>
    </md-layout>
  </div>
</template>
<script>
import CommitChart from '../charts/CommitChart'
export default {
  name: 'effects',
  data () {
    return {
      msg: 'Эффективность',
      showTable: false,
      someData: [100, 65, 54, 51, 25, 31, 13, 1, 3],
      dtc: {
        labels: ['План', 'Время включения', 'Время работы', 'Свет', 'Завеса', 'Вентиляция', 'Нет Завеса – насос', 'Нет Завеса - уровень воды', 'Фильтры забиты'],
        datasets: [
          {
            label: 'Эффективность, %',
            data: [100, 65, 54, 51, 25, 31, 13, 1, 3],
            borderWidth: 1,
            backgroundColor: [
              'rgba(255, 99, 132, 0.2)',
              'rgba(54, 162, 235, 0.2)',
              'rgba(255, 206, 86, 0.2)',
              'rgba(75, 192, 192, 0.2)',
              'rgba(153, 102, 255, 0.2)',
              'rgba(255, 159, 64, 0.2)',
              'rgba(75, 192, 12, 0.2)',
              'rgba(153, 12, 35, 0.2)',
              'rgba(255, 59, 64, 0.2)'
            ],
            borderColor: [
              'rgba(255,99,132,1)',
              'rgba(54, 162, 235, 1)',
              'rgba(255, 206, 86, 1)',
              'rgba(75, 192, 192, 1)',
              'rgba(153, 102, 255, 1)',
              'rgba(255, 159, 64, 1)',
              'rgba(75, 192, 12, 1)',
              'rgba(153, 12, 35, 1)',
              'rgba(255, 59, 64, 1)'
            ]
          }]
      },
      chartOptions: {
        responsive: true,
        maintainAspectRatio: false,
        title: {
          display: true,
          text: 'Custom Chart Title'
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
                var realData = [1, 2, 3, 4, 5, 6, 7, 8, 9]
                var data = realData[index]
                ctx.fillText(data, bar._model.x, bar._model.y - 5)
              })
            })
          }
        }
      }
    }
  },
  mounted () {
    this.generateData()
  },
  methods: {
    generateData () {
      this.dtc = {
        labels: ['План', 'Время включения', 'Время работы', 'Свет', 'Завеса', 'Вентиляция', 'Нет Завеса – насос', 'Нет Завеса - уровень воды', 'Фильтры забиты'],
        datasets: [
          {
            label: 'Эффективность, %',
            data: [100, this.getRandomInt(), this.getRandomInt(), this.getRandomInt(), this.getRandomInt(), this.getRandomInt(), this.getRandomInt(), this.getRandomInt(), this.getRandomInt()],
            borderWidth: 1,
            backgroundColor: [
              'rgba(255, 99, 132, 0.2)',
              'rgba(54, 162, 235, 0.2)',
              'rgba(255, 206, 86, 0.2)',
              'rgba(75, 192, 192, 0.2)',
              'rgba(153, 102, 255, 0.2)',
              'rgba(255, 159, 64, 0.2)',
              'rgba(75, 192, 12, 0.2)',
              'rgba(153, 12, 35, 0.2)',
              'rgba(255, 59, 64, 0.2)'
            ],
            borderColor: [
              'rgba(255,99,132,1)',
              'rgba(54, 162, 235, 1)',
              'rgba(255, 206, 86, 1)',
              'rgba(75, 192, 192, 1)',
              'rgba(153, 102, 255, 1)',
              'rgba(255, 159, 64, 1)',
              'rgba(75, 192, 12, 1)',
              'rgba(153, 12, 35, 1)',
              'rgba(255, 59, 64, 1)'
            ]
          }]
      }
    },
    getRandomInt () {
      return Math.floor(Math.random() * (100 - 5 + 1)) + 5
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
  min-width: 800px;
}
.effects{
  width: 100%;
}
</style>
