<template>
  <div class="hello">
    <md-layout md-gutter md-align="center">
      <md-layout md-flex-xsmall="100" md-flex-small="50" md-flex-medium="50">
        <div class="drow">
          <h1>{{ title }}</h1>
        </div>
        <div class="drow">
          <img src="..\assets\bb6.png" class="imglogo" alt="">
        </div>
        <div class="drow">
           <md-button class="md-raised md-accent" v-if="!error" @click.native="$router.push({ name: 'Login' })">Вход</md-button>
        </div>
        <div class="drow">
          <md-card class="md-warn" v-if="error">
                    <p>{{ error }}</p>
          </md-card>
        </div>
      </md-layout>
    </md-layout>
  </div>
</template>
<script>
import service from '../service'
export default {
  name: 'home',
  data () {
    return {
      title: 'Добро пожаловать',
      subtitle: 'Brain Box Internet of Things',
      error: ''
    }
  },
  mounted () {
    this.$http.get(service.getStatusUrl()).then(response => {
      this.error = ''
    }, response => {
      this.error = 'Ошибка подключения, сервис недоступен.'
      console.log(this.error)
    })
  }
}
</script>
<style scoped>
.drow {
  width: 100%;
  text-align: center;
}
@media (min-width: 1280px) {
  .hello {
    padding-top: 70px;
  }
}
@media (min-width: 1280px) {
  .hello {
    padding-top: 70px;
  }
}
</style>
