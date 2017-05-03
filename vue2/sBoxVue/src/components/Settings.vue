<template>
  <div class="settings">
    <h1>{{ msg }}</h1>
    <router-link to="/login">Вход</router-link>
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
