<template>
  <div class="props">
    <h1>{{ msg }}</h1>
		<md-tabs md-fixed>
			<md-tab id="sensors" md-label="Датчики">
				<md-layout md-gutter md-align="center">
					<md-layout v-for="sensor in sensorList" :key="sensor.sensor_id">
						<md-card md-with-hover>
						  <md-card-header>
						    <div class="md-title">{{ sensor.sensor_name }}</div>
						    <div class="md-subhead">Идентификатор: {{ sensor.sensor_id }}</div>
						    <div class="md-subhead">Тип: {{ sensor.sensor_type }}</div>
						  </md-card-header>
						  <md-card-actions>
						    <md-button>Action</md-button>
						    <md-button>Action</md-button>
						  </md-card-actions>
						</md-card>
					</md-layout>
				</md-layout>
			</md-tab>

			<md-tab id="effects" md-label="эффективность">
			  <md-layout md-gutter md-align="center">
          <md-layout md-flex="70" md-align="center" v-for="sensor in sensorList" :key="sensor.sensor_id">
            <md-card md-with-hover>
              <md-card-header>
                <div class="md-title">{{ sensor.sensor_name }}</div>
                <div class="md-subhead">Идентификатор: {{ sensor.sensor_id }}</div>
                <div class="md-subhead">Тип: {{ sensor.sensor_type }}</div>
              </md-card-header>
              <md-card-actions>
                <md-button>Обновить</md-button>
                <md-button>Удалить</md-button>
              </md-card-actions>
            </md-card>
          </md-layout>
        </md-layout>
			</md-tab>

			<md-tab id="gauges" md-label="показатели">
			  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Deserunt dolorum quas.</p>
			</md-tab>
		</md-tabs>
  </div>
</template>
<script>
import sensors from '../sensor'
export default {
  name: 'properties',
  data () {
    return {
      error: '',
      msg: 'Параметры',
      sensorList: []
    }
  },
  mounted () {
    this.loadSensors()
  },
  methods: {
    loadSensors () {
      sensors.getAllSensors(this).then(response => {
        this.sensorList = response.data
      }, response => {
        this.error = 'Error when get sensors data'
        console.log(this.error)
      })
    }
  }
}
</script>
