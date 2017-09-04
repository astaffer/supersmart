<template>
  <div>
    <md-dialog-alert
      :md-content="alert.content"
      :md-ok-text="alert.ok"
      ref="dialog1">
    </md-dialog-alert>
    <md-dialog-alert
      :md-content="alert.save"
      :md-ok-text="alert.ok"
      ref="dialog2">
    </md-dialog-alert>
    <md-dialog-alert
      :md-content="alert.delete"
      :md-ok-text="alert.ok"
      ref="dialog3">
    </md-dialog-alert>
    <md-dialog-alert
      :md-content="alert.error"
      :md-ok-text="alert.ok"
      ref="dialog4">
    </md-dialog-alert>
    <md-toolbar class="md-dense">      
        <div class="head-title">
        <h2 class="md-title" style="flex: 1">{{deviceInfo}}: {{caption}}</h2>
        </div>
    </md-toolbar>
    <md-layout md-gutter>
      <md-layout md-flex = "30" md-flex-xsmall="100">
        <md-input-container>
          <label>Название конфигурации</label>
          <md-input v-model="configName"></md-input>
        </md-input-container>
        <md-button @click.native = "saveCurrent()">Сохранить текущую</md-button>
      </md-layout>
    </md-layout>
    <md-layout md-gutter >
      <md-layout md-flex-xsmall="100" md-flex-small="50" v-for="config in configs" :key="config.config_id"  >
        <md-card>
          <md-card-header>
            <div class="md-title">{{ config.config_name }}</div>
             <div class="md-subhead">{{config.device.device_name}}</div>
          </md-card-header>
          <md-card-content>
            <h5>Датчики</h5>
            <span v-for="sensor in config.sensors"  :key="sensor.sensor_id">
              {{sensor.sensor_name}},
            </span>
            <h5>Эффективность</h5>
            <span v-for="bar in config.effects"  :key="bar.bar_id">
              {{bar.bar_label}},
            </span>
            <h5>Сервис</h5>
            <span v-for="gauge in config.gauges"  :key="gauge.gauge_id">
              {{gauge.gauge_label}},
            </span>
          </md-card-content>
          <md-card-actions>
            <md-button @click.native = "applyCurrent(config.config_id)">Применить</md-button>
            <md-button @click.native = "deleteCurrent(config.config_id)">Удалить</md-button>
          </md-card-actions>
        </md-card>
      </md-layout>
    </md-layout>
  </div>
</template>
<script>
import device from '../device'
import configuration from '../configuration'
export default {
  name: 'configruationchange',
  data () {
    return {
      error: '',
      caption: 'Конфигурация',
      configName: '',
      deviceInfo: '',
      configs: [],
      alert: {
        content: 'Параметры конфигурации применены!',
        save: 'Параметры конфигурации сохранены!',
        delete: 'Параметры конфигурации удалены!',
        error: 'Ошибка!',
        ok: 'OK'
      }
    }
  },
  mounted () {
    device.getDeviceFromService(this).then(response => {
      this.deviceInfo = response.data.device_name
    }, response => {
      this.error = 'Ошибка при получении данных устройства'
      console.log(this.error)
    })
    this.getAllConfigs()
  },
  methods: {
    saveCurrent () {
      if (this.configName === '') {
        this.configName = 'Новая'
      }
      configuration.saveConfig(this, this.configName).then(response => {
        console.log(response.data)
        this.getAllConfigs()
        this.configName = ''
        this.openDialog('dialog2')
      }, response => {
        this.error = 'Ошибка при сохранении конфигурации'
        this.openDialog('dialog4')
        console.log(this.error)
      })
    },
    applyCurrent (configid) {
      configuration.applyConfig(this, configid).then(response => {
        this.getAllConfigs()
        this.openDialog('dialog1')
      }, response => {
        this.error = 'Ошибка при сохранении конфигурации'
        this.openDialog('dialog4')
        console.log(this.error)
      })
    },
    deleteCurrent (configid) {
      configuration.removeConfig(this, configid).then(response => {
        this.getAllConfigs()
        this.openDialog('dialog3')
      }, response => {
        this.error = 'Ошибка при удалении конфигурации'
        this.openDialog('dialog4')
        console.log(this.error)
      })
    },
    getAllConfigs () {
      configuration.getAllConfigs(this).then(response => {
        this.configs = response.data
      }, response => {
        this.error = 'Ошибка при получении конфигураций'
        console.log(this.error)
      })
    },
    openDialog (ref) {
      this.$refs[ref].open()
    },
    closeDialog (ref) {
      this.$refs[ref].close()
    }
  }
}
</script>
