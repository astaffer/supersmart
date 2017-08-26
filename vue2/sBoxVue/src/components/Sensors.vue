<template>
  <div>
   <md-layout md-gutter >
   </md-layout>
   <md-layout md-gutter md-align="center">
      <md-layout md-align="center" v-for="sensor in sensorList" :key="sensor.sensor_id" md-flex="25">
        <md-card md-with-hover style="width:90%">
          <md-card-header>
            <div class="md-title">Датчик: {{ sensor.sensor_id }}</div>
            <div class="md-subhead">Сигнал: {{sensor.sensor_value}}</div>
          </md-card-header>
          <md-card-content>
            <md-input-container>
              <label>Наименование</label>
              <md-input maxlength="30" v-model="sensor.sensor_name" :disabled="!hasAdminAccess()"></md-input>
              <span class="md-error">Ошибка при заполнении</span>
            </md-input-container>
              <md-checkbox v-model="sensor.sensor_type" :disabled="!hasAdminAccess()">Тип:вещественный</md-checkbox>
              <md-checkbox v-model="sensor.sensor_hide" :disabled="!hasAdminAccess()">Не отображать</md-checkbox>
          </md-card-content>
          <md-card-actions>
            <md-button  @click.native="updateSensor(sensor)" v-if="hasAdminAccess()">Изменить</md-button>
            <md-button  @click.native="clearSensorData(sensor)" v-if="hasAdminAccess()">Очистить</md-button>
          </md-card-actions>
        </md-card>
      </md-layout>
      <md-dialog-alert
        :md-content="alert.content"
        :md-ok-text="alert.ok"
        ref="dialog_sensor">
      </md-dialog-alert>
       <md-dialog-alert
        :md-content="alert.error"
        :md-ok-text="alert.ok"
        ref="dialog_error">
      </md-dialog-alert>
      <md-dialog-confirm
        :md-title="confirm.title"
        :md-content-html="confirm.contentHtml"
        :md-ok-text="confirm.ok"
        :md-cancel-text="confirm.cancel"
        @close="onCloseClear"
        ref="dialog_clear">
      </md-dialog-confirm>
    </md-layout>
  </div>
</template>
<script>
import sensorservice from '../sensor'
export default {
  name: 'sensorschange',
  props: {
    user: {
      user_name: '',
      roles: []
    }
  },
  data () {
    return {
      error: '',
      sensorList: [],
      sensorToClear: {},
      alert: {
        content: 'Датчик изменен!',
        error: 'Ошибка при изменении данных датчика!',
        ok: 'OK'
      },
      confirm: {
        title: 'Подтверждение операции',
        contentHtml: 'Внимание! Данные датчика будут очищены без возможности восстановления.',
        ok: 'Согласен',
        cancel: 'Отмена'
      }
    }
  },
  mounted () {
    sensorservice.getAllSensorsWithHidden(this).then(response => {
      this.sensorList = response.data
    }, response => {
      this.error = 'Error when get sensors data'
      console.log(this.error)
    })
  },
  methods: {
    hasAdminAccess () {
      return this.user.roles.includes('admin')
    },
    openDialog (ref) {
      this.$refs[ref].open()
    },
    closeDialog (ref) {
      this.$refs[ref].close()
    },
    updateSensor (sensor) {
      sensorservice.setSensor(this, sensor).then(response => {
        sensor = response.data
        this.openDialog('dialog_sensor')
      }, response => {
        this.openDialog('dialog_error')
      })
    },
    clearSensorData (sensor) {
      this.sensorToClear = sensor
      this.openDialog('dialog_clear')
    },
    onCloseClear (type) {
      if (type === 'ok') {
        sensorservice.clearSensorData(this, this.sensorToClear).then(response => {
          this.openDialog('dialog_sensor')
        }, response => {
          this.openDialog('dialog_error')
        })
      }
      this.sensorToClear = {}
    }
  }
}
</script>
