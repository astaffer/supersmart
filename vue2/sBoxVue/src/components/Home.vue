<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
    <router-link to="/login">Вход</router-link>
  </div>
</template>
<script>
export default {
  name: 'home',
  data () {
    return {
      msg: 'Добро пожаловать в BBiot'
    }
  }
}
</script>
