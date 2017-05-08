<template>
  <div class="services">
  	<md-layout md-gutter>
  		<md-layout md-flex="20">
    		<radial-gauge :value="33" :options="{ value: '67' }"></radial-gauge>
    	</md-layout>
    	 
		</md-layout>
  </div>
</template>
<script>
import RadialGauge from '../vue-canvas-gauges'
export default {
  name: 'services',
  data () {
    return {
      msg: 'Сервис'
    }
  },
  components: {
    RadialGauge
  }
}
</script>
<style>
.services{
	width: 100%;
}
</style>
