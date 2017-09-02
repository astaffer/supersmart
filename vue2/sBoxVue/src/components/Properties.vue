<template>
  <div class="props">
    <md-toolbar class="md-dense">      
      <div class="head-title">
        <h2 class="md-title" style="flex: 1">{{deviceInfo.name}}: {{caption}}</h2>
      </div>
    </md-toolbar>
    <md-theme md-name="wh">
    <div class="tabs">
  		<md-tabs>
        <md-tab id="basic" md-label="Основное">
          <md-theme md-name="default">
             
              <devicechange></devicechange>
               
            </md-layout>
          </md-theme>
        </md-tab>
  			<md-tab id="effects" md-label="эффективность">
          <md-theme md-name="default">
            <barschange :user=user></barschange>
          </md-theme>
  			</md-tab>
  			<md-tab id="gauges" md-label="сервис">
          <md-theme md-name="default">
  			   <gaugeschange :user=user></gaugeschange>
           </md-theme>
  			</md-tab>
        <md-tab id="sensors" md-label="датчики">
          <md-theme md-name="default">
            <sensorschange :user=user></sensorschange>
          </md-theme>
        </md-tab>
  		</md-tabs>
      </div>
    </md-theme>
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
      caption: 'Параметры',
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
@media (max-width: 424px) {
  .tabs .md-tabs .md-tabs-navigation {
    display: block ;
  }
  .tabs .md-tabs .md-tab-indicator {
    display: none;
  }
}
</style>
