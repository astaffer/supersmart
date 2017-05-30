<template>
  <div>
    <md-layout md-gutter md-align="center">
      <md-layout md-align="center" v-for="gauge in gauges" :key="gauge.gauge_id" md-flex="90">
        <md-card md-with-hover style="width:90%">
          <md-card-header>
            <div class="md-title">Показатель: {{ gauge.gauge_id }}</div>
          </md-card-header>
          <md-card-content>
            <md-layout md-gutter md-align="center">
                <md-layout md-flex="33">
                <md-input-container>
                  <label>Наименование</label>
                  <md-input maxlength="30" v-model="gauge.gauge_label"></md-input>
                  <span class="md-error">Ошибка при заполнении</span>
                </md-input-container>
                <md-input-container>
                  <label>Единицы</label>
                  <md-input maxlength="10" v-model="gauge.gauge_unit"></md-input>
                  <span class="md-error">Ошибка при заполнении</span>
                </md-input-container>
                <md-input-container>
                  <label>Начальное значение</label>
                  <md-input type="number" v-model="gauge.init_value"></md-input>
                  <span class="md-error">Ошибка при заполнении</span>
                </md-input-container>
                </md-layout>
                <md-layout md-flex-offset="5">
                <md-input-container>
                  <label>Предельное значение</label>
                  <md-input type="number" v-model="gauge.limit_value"></md-input>
                  <span class="md-error">Ошибка при заполнении</span>
                </md-input-container>
                
                <md-input-container>
                  <label>Датчик</label>
                  <md-input type="number" v-model="gauge.sensor_id"></md-input>
                  <span class="md-error">Ошибка при заполнении</span>
                </md-input-container>
                <md-input-container>
                  <label>Порядковый номер</label>
                  <md-input type="number" v-model="gauge.sort_order"></md-input>
                  <span class="md-error">Ошибка при заполнении</span>
                </md-input-container>
                
                </md-layout>
                <md-layout md-flex-offset="5">
                <md-input-container class="md-accent">
                  <label>Зеленая зона</label>
                  <md-input type="number" v-model="gauge.start_green"></md-input>
                  <span class="md-error">Ошибка при заполнении</span>
                </md-input-container>
                <md-input-container>
                  <label>Оранжевая зона</label>
                  <md-input type="number" v-model="gauge.start_yellow"></md-input>
                  <span class="md-error">Ошибка при заполнении</span>
                </md-input-container>
                <md-input-container>
                  <label>Красная зона</label>
                  <md-input type="number" v-model="gauge.start_red"></md-input>
                  <span class="md-error">Ошибка при заполнении</span>
                </md-input-container>
                </md-layout>
            </md-layout>
          </md-card-content>
          <md-card-actions>
            <md-button  @click.native="updateGauge(gauge)">Изменить</md-button>
            <md-button @click.native="deleteGauge(gauge.gauge_id)">Удалить</md-button>
          </md-card-actions>
        </md-card>
      </md-layout>
    </md-layout>
  </div>
</template>
<script>
import Gauge from '../gauges'
export default {
  name: 'gaugeschange',
  data () {
    return {
      error: '',
      gauges: [],
      alert: {
        content: 'Наименование устройства изменено!',
        ok: 'OK'
      }
    }
  },
  mounted () {
    Gauge.getGauges(this).then(response => {
      this.gauges = response.data
    }, response => {
      this.error = 'Error when get bar data'
      console.log(this.error)
    })
  },
  methods: {
    openDialog (ref) {
      this.$refs[ref].open()
    },
    closeDialog (ref) {
      this.$refs[ref].close()
    },
    updateGauge (gauge) {
      Gauge.updateGauge(this, gauge).then(response => {
        gauge = response.data
      }, response => {
        console.log('error')
      })
    },
    deleteGauge (gaugeId) {
      Gauge.deleteGauge(this, gaugeId).then(response => {
      }, response => {
        console.log('error')
      })
    }
  }
}
</script>
