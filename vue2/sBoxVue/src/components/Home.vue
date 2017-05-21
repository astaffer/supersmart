<template>
<div class="hello">
<md-layout md-align="center" md-gutter="10">
  <md-layout md-flex="70" md-flex-medium="70" md-flex-xsmall="100" md-flex-small="70" md-align="center">
    <h1>{{ msg }}</h1> 
    
  </md-layout>
</md-layout>
<md-layout md-align="center" md-gutter="10">
  <md-layout md-flex="35" md-align="center">
  <img src="..\assets\bb6.png" class="imglogo" alt="">
  </md-layout>
</md-layout>
<md-layout md-align="center" md-gutter="10">
  <md-layout md-flex="35" md-align="center">
    <md-button @click.native="$router.push({ name: 'Login' })">Вход</md-button>
  </md-layout>
</md-layout>
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
<style>
.imglogo{
  min-width: 200px;
  text-align: center;
  display: inline-block;
}
</style>
