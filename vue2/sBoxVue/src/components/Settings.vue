<template>
  <div class="settings">
    
    <md-layout md-gutter md-align="center">
      <md-layout md-flex="33" md-flex-medium="33">
       <userschange></userschange>
      </md-layout>
    </md-layout>
  </div>
</template>
<script>
import userschange from '@/components/UserSettings'
export default {
  name: 'settings',
  components: { userschange },
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
