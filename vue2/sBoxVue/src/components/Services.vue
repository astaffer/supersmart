<template>
  <div class="services">
    <md-toolbar class="md-dense"> 
      <div class="head-title">     
        <h2 class="md-title" style="flex: 1">{{deviceInfo}}: {{caption}}</h2>
      </div>
    </md-toolbar>
  	<md-layout  md-gutter >

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
      <md-layout  md-flex-xsmall="100" md-flex-small="50" md-flex-medium="33" md-flex-large="25" class="gauges" v-for="(entry, index) in this.gData.gaugesOptions" :key="entry.gauge_id">
        <md-card md-with-hover>
          <md-card-header>
            <div class="md-title">{{ entry.title }}</div>
          </md-card-header>
          <md-card-content>
            <radial-gauge 
              v-bind:options="entry"
              v-bind:value="gData.gaugesValues[index]">
            </radial-gauge>
          </md-card-content>
        </md-card>
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
import device from '../device'
export default {
  name: 'services',
  data () {
    return {
      caption: 'Сервис',
      deviceInfo: '',
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
    device.getDeviceFromService(this).then(response => {
      this.deviceInfo = response.data.device_name
    }, response => {
      this.error = 'Ошибка при получении данных устройства'
      console.log(this.error)
    })
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
        title: '_'
      }
      z.title = title
      return z
    },
    readGauge () {
      Gauges.getGauges(this, new Date()).then(response => {
        this.gData = Gauges.prepareData(response.data)
      }, response => {
        console.log('Error while loading data')
      })
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
.gauges{
  padding-left: 10px;
  padding-right: 10px;
}
</style>
