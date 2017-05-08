<template>
  <div class="settings">
    <h1>{{ msg }}</h1>
  </div>
</template>
<script>
export default {
  name: 'settings',
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
</style>
