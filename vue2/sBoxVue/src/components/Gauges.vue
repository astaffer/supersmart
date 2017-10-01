<template>
  <div>
    <md-dialog-confirm
      :md-title="confirm.title"
      :md-content-html="confirm.contentHtml"
      :md-ok-text="confirm.ok"
      :md-cancel-text="confirm.cancel"
      @close="onCloseClear"
      ref="dialog_clear">
    </md-dialog-confirm>
    <md-dialog-alert
      :md-content="alert.content"
      :md-ok-text="alert.ok"
      ref="dialog_gauge">
    </md-dialog-alert>
    <md-dialog-alert
      :md-content="alert.content_error"
      :md-ok-text="alert.ok"
      ref="dialog_gauge_error">
    </md-dialog-alert>
    <md-dialog-alert
      :md-content="alert.content_add"
      :md-ok-text="alert.ok"
      ref="dialog_gauge_add">
      </md-dialog-alert>
      <md-dialog-alert
      :md-content="alert.content_add_error"
      :md-ok-text="alert.ok"
      ref="dialog_gauge_add_error">
      </md-dialog-alert>
    </md-dialog-alert>
    <md-dialog-alert
      :md-content="alert.content_del"
      :md-ok-text="alert.ok"
      ref="dialog_gauge_del">
    </md-dialog-alert>
    <md-layout md-gutter>
      <md-layout  md-flex-xlarge="33" md-flex-large="50" md-flex-medium="70" md-flex-xsmall="100" md-flex-small="100" v-if="hasAdminAccess()">
        <md-card md-with-hover style="width:90%">
          <md-card-header>
            <div class="md-title">Новый показатель</div>
            
          </md-card-header>
          <md-card-content>
            <md-layout md-gutter md-align="center">
                <md-layout md-flex="33" md-flex-small="50" md-flex-xsmall="100" >
                  <md-input-container>
                    <label>Наименование</label>
                    <md-input maxlength="30" v-model="newgauge.gauge_label"></md-input>
                    <span class="md-error">Ошибка при заполнении</span>
                  </md-input-container>
                </md-layout>
                <md-layout md-flex="33" md-flex-small="50" md-flex-xsmall="100" >
                   <md-input-container>
                      <label>Единицы</label>
                      <md-select v-model="newgauge.detail" :disabled="!hasAdminAccess()">
                      <md-option v-for="detail in details" :key="detail.key" v-bind:value="detail.key">
                      {{ detail.value }}</md-option>
                    </md-select>
                      <span class="md-error">Ошибка при заполнении</span>
                  </md-input-container>
                </md-layout>
                <md-layout md-flex="33" md-flex-small="50" md-flex-xsmall="100" >
                  <md-input-container>
                    <label>Начальное значение</label>
                    <md-input type="number" v-model="newgauge.init_value"></md-input>
                    <span class="md-error">Ошибка при заполнении</span>
                  </md-input-container>
                </md-layout>
                <md-layout md-flex="33" md-flex-small="50" md-flex-xsmall="100" >
                  <md-input-container>
                    <label>Предельное значение</label>
                    <md-input type="number" v-model="newgauge.limit_value"></md-input>
                    <span class="md-error">Ошибка при заполнении</span>
                  </md-input-container>
                </md-layout>
                <md-layout md-flex="33" md-flex-small="50" md-flex-xsmall="100" >
                  <md-input-container>
                    <label>Датчик</label>
                    <md-select v-model="newgauge.sensor_id">
                      <md-option v-for="sensor in sensors" :key="sensor.sensor_id" v-bind:value="sensor.sensor_id">{{ sensor.sensor_name }}</md-option>
                    </md-select>
                    <span class="md-error">Ошибка при заполнении</span>
                  </md-input-container>
                </md-layout>
                <md-layout md-flex="33" md-flex-small="50" md-flex-xsmall="100" >
                  <md-input-container>
                    <label>Порядковый номер</label>
                    <md-input type="number" v-model="newgauge.sort_order"></md-input>
                    <span class="md-error">Ошибка при заполнении</span>
                  </md-input-container>
                </md-layout>
                <md-layout md-flex="33" md-flex-small="50" md-flex-xsmall="100" >
                  <md-input-container class="md-accent">
                    <label>Зеленая зона</label>
                    <md-input type="number" v-model="newgauge.start_green"></md-input>
                    <span class="md-error">Ошибка при заполнении</span>
                  </md-input-container>
                </md-layout>
                <md-layout md-flex="33" md-flex-small="50" md-flex-xsmall="100" >
                  <md-input-container>
                    <label>Оранжевая зона</label>
                    <md-input type="number" v-model="newgauge.start_yellow"></md-input>
                    <span class="md-error">Ошибка при заполнении</span>
                  </md-input-container>
                </md-layout>
                <md-layout md-flex="33" md-flex-small="50" md-flex-xsmall="100" >
                  <md-input-container>
                    <label>Красная зона</label>
                    <md-input type="number" v-model="newgauge.start_red"></md-input>
                    <span class="md-error">Ошибка при заполнении</span>
                  </md-input-container>
                </md-layout>
                <md-layout md-flex="33" md-flex-small="50" md-flex-xsmall="100" >
                  <md-input-container>
                      <label>Дата старт</label>
                      <md-input maxlength="10" v-model="newgauge.init_date"></md-input>
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
      <md-layout v-for="gauge in gauges" :key="gauge.gauge_id" md-flex-xlarge="33" md-flex-large="50" md-flex-medium="70" md-flex-xsmall="100" md-flex-small="100">
        <md-card md-with-hover style="width:90%">
          <md-card-header>
            <div class="md-title">Показатель: {{ gauge.gauge_id }}  </div>
            <div class="md-subhead">Текущее значение: {{ gauge.value}}</div>
          </md-card-header>
          <md-card-content>
            <md-layout md-gutter md-align="center">
                <md-layout md-flex="33" md-flex-small="50" md-flex-xsmall="100" >
                  <md-input-container>
                    <label>Наименование</label>
                    <md-input maxlength="30" v-model="gauge.gauge_label" :disabled="!hasAdminAccess()"></md-input>
                    <span class="md-error">Ошибка при заполнении</span>
                  </md-input-container>
                </md-layout>
                <md-layout md-flex="33" md-flex-small="50" md-flex-xsmall="100" >
                   <md-input-container>
                      <label>Единицы</label>
                      <md-select v-model="gauge.detail" :disabled="!hasAdminAccess()">
                      <md-option v-for="detail in details" :key="detail.key" v-bind:value="detail.key">
                      {{ detail.value }}</md-option>
                    </md-select>
                      <span class="md-error">Ошибка при заполнении</span>
                  </md-input-container>
                </md-layout>
                <md-layout md-flex="33" md-flex-small="50" md-flex-xsmall="100" >
                  <md-input-container>
                    <label>Начальное значение</label>
                    <md-input type="number" v-model="gauge.init_value"></md-input>
                    <span class="md-error">Ошибка при заполнении</span>
                  </md-input-container>
                </md-layout>
                <md-layout md-flex="33" md-flex-small="50" md-flex-xsmall="100" >
                  <md-input-container>
                    <label>Предельное значение</label>
                    <md-input type="number" v-model="gauge.limit_value"></md-input>
                    <span class="md-error">Ошибка при заполнении</span>
                  </md-input-container>
                </md-layout>
                <md-layout md-flex="33" md-flex-small="50" md-flex-xsmall="100" >  
                  <md-input-container>
                    <label>Датчик</label>
                    <md-select v-model="gauge.sensor_id" :disabled="!hasAdminAccess()">
                      <md-option v-for="sensor in sensors" :key="sensor.sensor_id" v-bind:value="sensor.sensor_id">{{ sensor.sensor_name }}</md-option>
                    </md-select>
                    <span class="md-error">Ошибка при заполнении</span>
                  </md-input-container>
                </md-layout>
                <md-layout md-flex="33" md-flex-small="50" md-flex-xsmall="100" >  
                  <md-input-container>
                    <label>Порядковый номер</label>
                    <md-input type="number" v-model="gauge.sort_order"></md-input>
                    <span class="md-error">Ошибка при заполнении</span>
                  </md-input-container>
                </md-layout>
                <md-layout md-flex="33" md-flex-small="50" md-flex-xsmall="100" >
                  <md-input-container class="md-accent">
                    <label>Зеленая зона</label>
                    <md-input type="number" v-model="gauge.start_green"></md-input>
                    <span class="md-error">Ошибка при заполнении</span>
                  </md-input-container>
                </md-layout>
                <md-layout md-flex="33" md-flex-small="50" md-flex-xsmall="100" >
                  <md-input-container>
                    <label>Оранжевая зона</label>
                    <md-input type="number" v-model="gauge.start_yellow"></md-input>
                    <span class="md-error">Ошибка при заполнении</span>
                  </md-input-container>
                </md-layout>
                <md-layout md-flex="33" md-flex-small="50" md-flex-xsmall="100" >
                  <md-input-container>
                    <label>Красная зона</label>
                    <md-input type="number" v-model="gauge.start_red"></md-input>
                    <span class="md-error">Ошибка при заполнении</span>
                  </md-input-container>
                </md-layout>
                <md-layout md-flex="33" md-flex-small="50" md-flex-xsmall="100" >  

                </md-layout>
                <md-layout md-flex="33" md-flex-small="50" md-flex-xsmall="100" >
                 
                  <md-input-container>
                      <label>Дата старт</label>
                      <md-input maxlength="10" v-model="gauge.init_date" :disabled="!hasAdminAccess()"></md-input>
                      <span class="md-error">Ошибка при заполнении</span>
                  </md-input-container>
                </md-layout>
            </md-layout>
          </md-card-content>
          <md-card-actions>
          <md-layout md-gutter>
            <md-layout>
              <md-button @click.native="clearGauge(gauge)">Сбросить</md-button>
            </md-layout>
            <md-layout >
              <md-button @click.native="updateGauge(gauge)">Изменить</md-button>
            </md-layout>
            <md-layout>
              <md-button @click.native="deleteGauge(gauge.gauge_id)" v-if="hasAdminAccess()">Удалить</md-button>
            </md-layout>
          </md-layout>
          </md-card-actions>
        </md-card>
      </md-layout>
    </md-layout>
  </div>
</template>
<script>
import Gauge from '../gauges'
import sensorservice from '../sensor'
import Util from '../util'
export default {
  name: 'gaugeschange',
  props: {
    user: {
      user_name: '',
      roles: []
    }
  },
  data () {
    return {
      error: '',
      gauges: [],
      details: [],
      sensors: [],
      newgauge: {},
      gaugeToClear: {},
      alert: {
        content: 'Показатель изменен!',
        content_error: 'Ошибка при изменении показателя!',
        content_add_error: 'Ошибка при добавлении показателя!',
        content_add: 'Показатель добавлен!',
        content_del: 'Показатель удален!',
        ok: 'OK'
      },
      confirm: {
        title: 'Подтверждение операции',
        contentHtml: 'Показатель будет обнулен',
        ok: 'Согласен',
        cancel: 'Отмена'
      }
    }
  },
  mounted () {
    this.details = Gauge.details()
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
      Gauge.getGauges(this, new Date()).then(response => {
        this.gauges = response.data
        // console.log(this.gauges)
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
      let localGauge = Object.assign({}, gauge)
      localGauge.init_date = Util.parseDateFromStr(gauge.init_date)
      localGauge.mileage_date = Util.parseDateFromStr(gauge.mileage_date)
      Gauge.updateGauge(this, localGauge).then(response => {
        gauge = response.data
        this.readGauges()
        this.openDialog('dialog_gauge')
      }, response => {
        this.openDialog('dialog_gauge_error')
        console.log('error')
      })
    },
    deleteGauge (gaugeId) {
      Gauge.deleteGauge(this, gaugeId).then(response => {
        this.readGauges()
        this.openDialog('dialog_gauge_del')
      }, response => {
        console.log('error')
      })
    },
    createGauge (gauge) {
      let localGauge = Object.assign({}, gauge)
      localGauge.init_date = Util.parseDateFromStr(gauge.init_date)
      if (gauge.mileage_date) {
        localGauge.mileage_date = Util.parseDateFromStr(gauge.mileage_date)
      }
      Gauge.createGauge(this, localGauge).then(response => {
        gauge = response.data
        this.readGauges()
        this.openDialog('dialog_gauge_add')
      }, response => {
        console.log('error')
        this.openDialog('dialog_gauge_add_error')
      })
    },
    clearGauge (gauge) {
      this.gaugeToClear = gauge
      this.openDialog('dialog_clear')
    },
    onCloseClear (type) {
      if (type === 'ok') {
        let localGauge = Object.assign({}, this.gaugeToClear)
        localGauge.init_date = Date.now()
        localGauge.mileage_date = Util.parseDateFromStr(this.gaugeToClear.mileage_date)
        Gauge.updateGauge(this, localGauge).then(response => {
          this.gaugeToClear = response.data
          this.openDialog('dialog_gauge')
        }, response => {
          this.openDialog('dialog_gauge_error')
        })
      }
      this.gaugeToClear = {}
    }
  }
}
</script>
<style scoped>
@media (max-width: 944px) {
  .md-flex-small-100 {
    min-width: 100%;
    -ms-flex: 0 1 100%;
    flex: 0 1 100%;
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
