<template>
  <div class="settings">
    <md-toolbar class="md-dense">      
      <div class="head-title">
        <h2 class="md-title" style="flex: 1">{{deviceInfo}}: {{caption}}</h2>
      </div>
    </md-toolbar>
    <md-layout md-gutter md-align="center">
      <md-layout md-flex="50" md-flex-medium="50" md-flex-xsmall="100" md-flex-small="100">
       <userschange></userschange>
      </md-layout>
      <md-layout md-flex="50" md-flex-medium="50" md-flex-xsmall="100" md-flex-small="100">
       <networkchange></networkchange>
      </md-layout>
    </md-layout>
  </div>
</template>
<script>
import userschange from '@/components/UserSettings'
import networkchange from '@/components/NetworkSettings'
import device from '../device'
export default {
  name: 'settings',
  components: { userschange, networkchange },
  data () {
    return {
      caption: 'Настройки',
      deviceInfo: ''
    }
  },
  mounted () {
    device.getDeviceFromService(this).then(response => {
      this.deviceInfo = response.data.device_name
    }, response => {
      this.error = 'Ошибка при получении данных устройства'
      console.log(this.error)
    })
  }
}
</script>
<style>
.settings{
  width: 100%;
}
.md-card{
  margin-bottom: 10px;
}
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
