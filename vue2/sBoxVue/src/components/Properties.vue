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
        <barschange></barschange>
			</md-tab>
			<md-tab id="gauges" md-label="сервис">
			  <gaugeschange></gaugeschange>
			</md-tab>
      <md-tab id="sensors" md-label="Датчики">
        <md-layout md-gutter md-align="center">
          <md-layout v-for="sensor in sensorList" :key="sensor.sensor_id">
            <md-card md-with-hover>
              <md-card-header>
                <div class="md-title">{{ sensor.sensor_name }}</div>
                <div class="md-subhead">Идентификатор: {{ sensor.sensor_id }}</div>
                <div class="md-subhead">Тип: {{ sensor.sensor_type }}</div>
              </md-card-header>
              <md-card-actions>
                <md-button>Action</md-button>
                <md-button>Action</md-button>
              </md-card-actions>
            </md-card>
          </md-layout>
        </md-layout>
      </md-tab>
		</md-tabs>
  </div>
</template>
<script>
import sensors from '../sensor'
import device from '../device'
import Devicechange from '@/components/Device'
import Barschange from '@/components/Bars'
import Gaugeschange from '@/components/Gauges'
export default {
  name: 'properties',
  components: { Devicechange, Barschange, Gaugeschange },
  data () {
    return {
      error: '',
      msg: 'Параметры',
      deviceInfo: {
        id: '',
        name: ''
      },
      sensorList: []
    }
  },
  mounted () {
    this.loadSensors()
    device.getDeviceFromService(this).then(response => {
      this.deviceInfo.id = response.data.device_id
      this.deviceInfo.name = response.data.device_name
    }, response => {
      this.error = 'Error when get device data'
      console.log(this.error)
    })
  },
  methods: {
    loadSensors () {
      sensors.getAllSensors(this).then(response => {
        this.sensorList = response.data
      }, response => {
        this.error = 'Error when get sensors data'
        console.log(this.error)
      })
    },
    applyDeviceName () {
      this.$Progress.start()
      device.setDeviceName(this, this.deviceInfo).then(response => {
        this.$Progress.finish()
        this.deviceInfo.id = response.data.device_id
        this.deviceInfo.name = response.data.device_name
      }, response => {
        this.$Progress.fail()
        this.error = 'Error when get device data'
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
