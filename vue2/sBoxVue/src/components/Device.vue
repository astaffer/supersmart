<template>
  <md-card md-with-hover>
    <md-card-header>
      <div class="md-title">Параметры устройства</div>
      <div class="md-subhead">Код устройства: {{ deviceInfo.id }}</div>
    </md-card-header>
    <md-card-content>
      <md-input-container>
        <label>Наименование устройства</label>
        <md-input maxlength="30" v-model="deviceInfo.name"></md-input>
        <span class="md-error">Ошибка при заполнении</span>
      </md-input-container>
    </md-card-content>
    <md-card-actions>
      <md-button @click.native="applyDeviceName()">Применить</md-button>
    </md-card-actions>
    <md-dialog-alert
  :md-content="alert.content"
  :md-ok-text="alert.ok"
  ref="dialog3">
  </md-dialog-alert>
  </md-card>
</template>
<script>
import device from '../device'
export default {
  name: 'devicechange',
  data () {
    return {
      error: '',
      deviceInfo: {
        id: '',
        name: ''
      },
      alert: {
        content: 'Наименование устройства изменено!',
        ok: 'OK'
      }
    }
  },
  mounted () {
    device.getDeviceFromService(this).then(response => {
      this.deviceInfo.id = response.data.device_id
      this.deviceInfo.name = response.data.device_name
    }, response => {
      this.error = 'Ошибка при получении данных устройства'
      console.log(this.error)
    })
  },
  methods: {
    applyDeviceName () {
      device.setDeviceName(this, this.deviceInfo).then(response => {
        this.deviceInfo.id = response.data.device_id
        this.deviceInfo.name = response.data.device_name
        this.openDialog('dialog3')
      }, response => {
        this.error = 'Ошибка при получении данных устройства'
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
