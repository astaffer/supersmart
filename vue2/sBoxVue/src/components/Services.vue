<template>
  <div class="services md-align-center">
  	<md-layout md-gutter md-align="center">
      <!--<md-layout md-flex="35" md-align="center">
        <h2>Журнал событий</h2>
        <md-list class="custom-list md-triple-line">
          <md-list-item class="md-button">
            <div class="md-list-text-container">
              <span>Ali Connors</span>
              <span>Brunch this weekend?</span>
              <p>I'll be in your neighborhood doing errands...</p>
            </div>

            <md-button class="md-icon-button md-list-action">
              <md-icon class="md-primary">close</md-icon>
            </md-button>

            <md-divider class="md-inset"></md-divider>
          </md-list-item>

          <md-list-item class="md-button">
           
            <div class="md-list-text-container">
              <span>me, Scott, Jennifer</span>
              <span>Summer BBQ</span>
              <p>Wish I could come, but I'm out of town ...</p>
            </div>

            <md-button class="md-icon-button md-list-action">
              <md-icon>close</md-icon>
            </md-button>

            <md-divider class="md-inset"></md-divider>
          </md-list-item>

          <md-list-item class="md-button">
           
            <div class="md-list-text-container">
              <span>Sandra Adams</span>
              <span>Oui oui</span>
              <p>Do you have Paris recommendations ...</p>
            </div>

            <md-button class="md-icon-button md-list-action">
              <md-icon>close</md-icon>
            </md-button>

            <md-divider class="md-inset"></md-divider>
          </md-list-item>

          <md-list-item class="md-button">
        
            <div class="md-list-text-container">
              <span>Trevor Hansen</span>
              <span>Order confirmation</span>
              <p>Thank you for your recent order from ...</p>
            </div>

            <md-button class="md-icon-button md-list-action">
              <md-icon>close</md-icon>
            </md-button>

            <md-divider class="md-inset"></md-divider>
          </md-list-item>
        </md-list>
      </md-layout>
      -->
      <md-layout md-flex="20" md-align="center">
        <radial-gauge :options="radOptions('Насос водной завесы')" :value=radialValue></radial-gauge>
      </md-layout>
      <md-layout md-flex="20" md-align="center">
        <radial-gauge :options="radOptions('Двигатель вентилятора')" :value=radialValue2></radial-gauge>
      </md-layout>
      <md-layout md-flex="20" md-align="center">
        <radial-gauge :options="radOptions('Лампы освещения')" :value=radialValue3></radial-gauge>
      </md-layout>
      <md-layout md-flex="20" v-for="(entry, index) in this.gData.gaugesOptions" :key="entry.gauge_id">
        <radial-gauge 
          v-bind:options="entry"
          v-bind:value="gData.gaugesValues[index]">
        </radial-gauge>
      </md-layout>
      <!--<md-layout md-flex="20" md-align="center">
        <radial-gauge :options="radOptions('Замена фильтров')" :value=radialValue2></radial-gauge>
      </md-layout>
      <md-layout md-flex="20" md-align="center">
        <radial-gauge :options="radOptions('Чистка водных отстойников')" :value=radialValue></radial-gauge>
      </md-layout>-->
		</md-layout>
  </div>
</template>
<script>
import RadialGauge from '../vue-canvas-gauges'
import Gauges from '../gauges'
export default {
  name: 'services',
  data () {
    return {
      msg: 'Сервис',
      radialOptions: {
        minValue: '0',
        maxValue: '40',
        width: 200,
        height: 200,
        valueBox: true,
        majorTicks: [
          '0',
          '20',
          '40'
        ],
        colorPlate: '#fff',
        borderShadowWidth: 0,
        borders: false,
        highlights: [{
          'from': 30,
          'to': 40,
          'color': 'rgba(200, 50, 50, .75)'
        }],
        animationDuration: 1500,
        animationRule: 'linear',
        title: 'Насос водной завесы'
      },
      radialValue: 35,
      radialValue2: 25,
      radialValue3: 15,
      gData: []
    }
  },
  mounted () {
    this.readGauge()
  },
  methods: {
    radOptions (title) {
      var z = {
        minValue: '0',
        maxValue: '40',
        width: 200,
        height: 200,
        valueBox: true,
        majorTicks: [
          '0',
          '20',
          '40'
        ],
        colorPlate: '#fff',
        borderShadowWidth: 0,
        borders: false,
        highlights: [{
          'from': 30,
          'to': 40,
          'color': 'rgba(200, 50, 50, .75)'
        }],
        animationDuration: 1500,
        animationRule: 'linear',
        title: 'Насос водной завесы'
      }
      z.title = title
      return z
    },
    readGauge () {
      var gsData = Gauges.getGauges(this, new Date())
      setTimeout(() => {
        this.gData = gsData
      }, 200)
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
