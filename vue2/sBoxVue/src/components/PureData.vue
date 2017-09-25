<template>
 <div>
    <md-toolbar class="md-dense">      
        <div class="head-title">
        <h2 class="md-title" style="flex: 1">Данные</h2>
        </div>
    </md-toolbar>
    <md-layout md-gutter>
    <md-layout md-flex="100">
      <md-button @click.native="getPureData()"> Обновить</md-button>
     </md-layout>
     </md-layout>
     <md-layout md-gutter>
      <md-layout md-flex = "70" md-flex-small="90" md-flex-xsmall="100">
        <md-table>
          <md-table-header>
            <md-table-row>
              <md-table-head class="short">Датчик</md-table-head>
              <md-table-head md-numeric class="short">Время старт</md-table-head>
              <md-table-head md-numeric class="short">Время финиш</md-table-head>
              <md-table-head md-numeric class="short">Дельта, с</md-table-head>
            </md-table-row>
          </md-table-header>
          <md-table-body>
            <md-table-row v-for="entry in intvalues" :key="entry.id">
              <md-table-cell class="short" nowrap >{{ entry.sensor_id }}</md-table-cell>
              <md-table-cell class="short"  md-numeric >{{ entry.start_date }}</md-table-cell>
              <md-table-cell class="short" >{{ entry.stop_date }}</md-table-cell>
              <md-table-cell class="short" >{{ entry.delta_date }}</md-table-cell>
            </md-table-row>
          </md-table-body>
        </md-table>
        </md-layout>
        </md-layout>
 </div>
</template>
<script>
import service from '../service'
export default {
  name: 'pureData',
  data () {
    return {
      msg: 'hello',
      intvalues: []
    }
  },
  mounted () {
    this.getPureData()
  },
  methods: {
    getPureData () {
      this.$http.post(service.getPureDataUrl()).then(response => {
        this.intvalues = response.data
        this.intvalues.forEach(function (element, index, array) {
          element.start_date = new Date(Date.parse(element.start_date)).toLocaleString('ru-Ru', { year: 'numeric', month: 'numeric', day: 'numeric', hour: 'numeric', minute: 'numeric', second: 'numeric' })
          element.stop_date = new Date(Date.parse(element.stop_date)).toLocaleString('ru-Ru', { year: 'numeric', month: 'numeric', day: 'numeric', hour: 'numeric', minute: 'numeric', second: 'numeric' })
        })
      }, response => {
        this.error = 'Ошибка при получении данных'
        console.log(this.error)
      })
    }
  }

}
</script>
<style scoped>
@media (max-width: 944px) {
  .md-flex-small-90 {
      min-width: 90%;
      -ms-flex: 0 1 90%;
      flex: 0 1 90%;
  }
}
  @media (max-width: 600px) {
    .md-flex-xsmall-100 {
        min-width: 100%;
        -ms-flex: 0 1 100%;
        flex: 0 1 100%;
    }
  }
</style>
