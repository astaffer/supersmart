<template>
  <div class="props">
		<md-tabs md-fixed>
      <md-tab id="basic" md-label="Основное">
        <md-layout md-gutter md-align="center">
          <md-layout md-flex="70">
          <devicechange></devicechange>
          </md-layout>
        </md-layout>
      </md-tab>
			<md-tab id="effects" md-label="эффективность">
        <barschange :user=user></barschange>
			</md-tab>
			<md-tab id="gauges" md-label="сервис">
			  <gaugeschange :user=user></gaugeschange>
			</md-tab>
      <md-tab id="sensors" md-label="датчики">
        <sensorschange :user=user></sensorschange>
      </md-tab>
		</md-tabs>
  </div>
</template>
<script>
import device from '../device'
import userservice from '../user'
import Devicechange from '@/components/Device'
import Barschange from '@/components/Bars'
import Gaugeschange from '@/components/Gauges'
import Sensorschange from '@/components/Sensors'
export default {
  name: 'properties',
  components: { Devicechange, Barschange, Gaugeschange, Sensorschange },
  data () {
    return {
      error: '',
      msg: 'Параметры',
      deviceInfo: {
        id: '',
        name: ''
      },
      sensorList: [],
      user: {
        user_name: '',
        roles: []
      }
    }
  },
  mounted () {
    device.getDeviceFromService(this).then(response => {
      this.deviceInfo.id = response.data.device_id
      this.deviceInfo.name = response.data.device_name
    }, response => {
      this.error = 'Ошибка получения данных устройства, сервис недоступен'
      console.log(this.error)
    })
    userservice.getUser(this).then(response => {
      this.user = response.data
    }, response => {
      this.error = 'Ошибка получения данных пользователя, сервис недоступен'
      console.log(this.error)
    })
  },
  methods: {
    applyDeviceName () {
      device.setDeviceName(this, this.deviceInfo).then(response => {
        this.deviceInfo.id = response.data.device_id
        this.deviceInfo.name = response.data.device_name
      }, response => {
        this.error = 'Ошибка получения данных устройства, сервис недоступен'
        console.log(this.error)
      })
    }
  }
}
</script>
<style>
.props{
  width: 100%;
}
</style>
