<template>
  <div class="settings">
    <md-toolbar class="md-dense">      
      <h2 class="md-title" style="flex: 1">{{deviceInfo}}: {{caption}}</h2>
    </md-toolbar>
    <md-layout md-gutter md-align="center">
      <md-layout md-flex="33" md-flex-medium="33">
       <userschange></userschange>
      </md-layout>
      <md-layout md-flex="33" md-flex-medium="33">
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
</style>
