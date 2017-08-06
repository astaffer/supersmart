<template>
  <div>
    <md-layout md-gutter md-align="center">
      <md-layout md-align="center" md-flex="90" v-if="hasAdminAccess()">
        <md-card md-with-hover style="width:90%">
          <md-card-header>
            <div class="md-title">Новый показатель</div>
            <md-dialog-alert
              :md-content="alert.content"
              :md-ok-text="alert.ok"
              ref="dialog_gauge">
              </md-dialog-alert>

          </md-card-header>
          <md-card-content>
            <md-layout md-gutter md-align="center">
                <md-layout md-flex="33">
                  <md-input-container>
                    <label>Наименование</label>
                    <md-input maxlength="30" v-model="newgauge.gauge_label"></md-input>
                    <span class="md-error">Ошибка при заполнении</span>
                  </md-input-container>
                  <md-input-container>
                    <label>Единицы</label>
                    <md-input maxlength="10" v-model="newgauge.gauge_unit"></md-input>
                    <span class="md-error">Ошибка при заполнении</span>
                  </md-input-container>
                  <md-input-container>
                    <label>Начальное значение</label>
                    <md-input type="number" v-model="newgauge.init_value"></md-input>
                    <span class="md-error">Ошибка при заполнении</span>
                  </md-input-container>
                </md-layout>
                <md-layout md-flex-offset="5">
                  <md-input-container>
                    <label>Предельное значение</label>
                    <md-input type="number" v-model="newgauge.limit_value"></md-input>
                    <span class="md-error">Ошибка при заполнении</span>
                  </md-input-container>
                  <md-input-container>
                    <label>Датчик</label>
                    <md-select v-model="newgauge.sensor_id">
                      <md-option v-for="sensor in sensors" :key="sensor.sensor_id" v-bind:value="sensor.sensor_id">{{ sensor.sensor_name }}</md-option>
                    </md-select>
                    <span class="md-error">Ошибка при заполнении</span>
                  </md-input-container>
                  <md-input-container>
                    <label>Порядковый номер</label>
                    <md-input type="number" v-model="newgauge.sort_order"></md-input>
                    <span class="md-error">Ошибка при заполнении</span>
                  </md-input-container>
                </md-layout>
                <md-layout md-flex-offset="5">
                  <md-input-container class="md-accent">
                    <label>Зеленая зона</label>
                    <md-input type="number" v-model="newgauge.start_green"></md-input>
                    <span class="md-error">Ошибка при заполнении</span>
                  </md-input-container>
                  <md-input-container>
                    <label>Оранжевая зона</label>
                    <md-input type="number" v-model="newgauge.start_yellow"></md-input>
                    <span class="md-error">Ошибка при заполнении</span>
                  </md-input-container>
                  <md-input-container>
                    <label>Красная зона</label>
                    <md-input type="number" v-model="newgauge.start_red"></md-input>
                    <span class="md-error">Ошибка при заполнении</span>
                  </md-input-container>
                </md-layout>
            </md-layout>
          </md-card-content>
          <md-card-actions>
            <md-button  @click.native="createGauge(newgauge)">Добавить</md-button>
          </md-card-actions>
        </md-card>
      </md-layout>
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
                  <md-input maxlength="30" v-model="gauge.gauge_label" :disabled="!hasAdminAccess()"></md-input>
                  <span class="md-error">Ошибка при заполнении</span>
                </md-input-container>
                <md-input-container>
                  <label>Единицы</label>
                  <md-input maxlength="10" v-model="gauge.gauge_unit" :disabled="!hasAdminAccess()"></md-input>
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
                  <md-select v-model="gauge.sensor_id" :disabled="!hasAdminAccess()">
                    <md-option v-for="sensor in sensors" :key="sensor.sensor_id" v-bind:value="sensor.sensor_id">{{ sensor.sensor_name }}</md-option>
                  </md-select>
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
            <md-button @click.native="updateGauge(gauge)">Изменить</md-button>
            <md-button @click.native="deleteGauge(gauge.gauge_id)" v-if="hasAdminAccess()">Удалить</md-button>
          </md-card-actions>
        </md-card>
      </md-layout>
    </md-layout>
  </div>
</template>
<script>
import Gauge from '../gauges'
import sensorservice from '../sensor'
import DatePick from '../helpers/DatePick'
export default {
  name: 'gaugeschange',
  props: {
    user: {
      user_name: '',
      roles: []
    }
  },
  components: { datepicker: DatePick },
  data () {
    return {
      error: '',
      gauges: [],
      sensors: [],
      newgauge: {},
      alert: {
        content: 'Показатель изменен!',
        ok: 'OK'
      }
    }
  },
  mounted () {
    this.readGauges()
    sensorservice.getAllSensors(this).then(response => {
      this.sensors = response.data
    }, response => {
      this.error = 'Ошибка при получении данных датчиков'
      console.log(this.error)
    })
  },
  methods: {
    readGauges () {
      Gauge.getGauges(this).then(response => {
        this.gauges = response.data
        console.log(this.gauges)
      }, response => {
        this.error = 'Ошибка при получении показателей, сервис недоступен'
        console.log(this.error)
      })
    },
    hasAdminAccess () {
      return this.user.roles.includes('admin')
    },
    openDialog (ref) {
      this.$refs[ref].open()
    },
    closeDialog (ref) {
      this.$refs[ref].close()
    },
    updateGauge (gauge) {
      Gauge.updateGauge(this, gauge).then(response => {
        gauge = response.data
        this.openDialog('dialog_gauge')
      }, response => {
        console.log('error')
      })
    },
    deleteGauge (gaugeId) {
      Gauge.deleteGauge(this, gaugeId).then(response => {
        this.readGauges()
      }, response => {
        console.log('error')
      })
    },
    createGauge (gauge) {
      Gauge.createGauge(this, gauge).then(response => {
        gauge = response.data
        this.readGauges()
      }, response => {
        console.log('error')
      })
    }
  }
}
</script>
