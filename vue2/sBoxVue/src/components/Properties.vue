<template>
  <div class="props">
    <h1>{{ msg }}</h1>
		<md-tabs md-fixed>
			<md-tab id="movies" md-label="Датчики">
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

			<md-tab md-icon="favorite">
			  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Deserunt dolorum quas amet cum vitae, omnis! Illum quas voluptatem, expedita iste, dicta ipsum ea veniam dolore in, quod saepe reiciendis nihil.</p>
			  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Deserunt dolorum quas amet cum vitae, omnis! Illum quas voluptatem, expedita iste, dicta ipsum ea veniam dolore in, quod saepe reiciendis nihil.</p>
			</md-tab>

			<md-tab md-icon="near_me">
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
      msg: 'Параметры',
      sensorList: []
    }
  },
  mounted () {
    this.loadSensors()
  },
  methods: {
    loadSensors () {
      this.sensorList = sensors.getAllSensors(this)
    }
  }
}
</script>
