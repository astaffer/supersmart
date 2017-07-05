<template>
  <div class="settings">
    
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
export default {
  name: 'settings',
  components: { userschange, networkchange },
  data () {
    return {
      msg: 'Настройки'
    }
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
