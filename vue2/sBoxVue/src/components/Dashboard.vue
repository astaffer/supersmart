<template>
<div class="dash-form">
	{{msg}}
	<md-layout md-gutter>
	  <md-layout md-flex="100">
		  <md-theme md-name="wh">
		  	<md-tabs md-fixed >
				  <md-tab id="effects" md-label="Эффективность">
					  <md-layout md-gutter>
						  <md-layout md-flex="60" md-flex-offset="20">
								<md-button-toggle md-single class="md-accent">
								  <md-button class="md-toggle">Сегодня</md-button>
								  <md-button>Вчера</md-button>
								  <md-button>Неделя</md-button>
								  <md-button>Месяц</md-button>
								  <md-button>Квартал</md-button>
								  <md-button>Год</md-button>
								  <md-button>19 фев - 17 мар 2017</md-button>
								</md-button-toggle>		
							</md-layout>
						</md-layout>	
						<md-layout md-gutter> 
								<md-layout md-flex="80" md-flex-offset="10">
									<div class="chart-container">
 										<commitChart :width="8" :height="4"></commitChart>
 									</div> 
 								</md-layout>
 								<md-layout md-flex="80" md-flex-offset="10">
 									<md-table v-once>
									  <md-table-header>
									    <md-table-row>
									      <md-table-head>Показатель</md-table-head>
									      <md-table-head md-numeric>Часы</md-table-head>
									      <md-table-head md-numeric>%</md-table-head>
									    </md-table-row>
									  </md-table-header>
									  <md-table-body>
									    <md-table-row v-for="(row, index) in 5" :key="index">
									      <md-table-cell>Dessert Name</md-table-cell>
									      <md-table-cell v-for="(col, index) in 2" :key="index" md-numeric>10</md-table-cell>
									    </md-table-row>
									  </md-table-body>
									</md-table>
 								</md-layout>
 							</md-layout> 
				  </md-tab>

				  <md-tab id="services" md-label="Сервис">
				    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Deserunt dolorum quas amet cum vitae, omnis! Illum quas voluptatem, expedita iste, dicta ipsum ea veniam dolore in, quod saepe reiciendis nihil.</p>
				    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Deserunt dolorum quas amet cum vitae, omnis! Illum quas voluptatem, expedita iste, dicta ipsum ea veniam dolore in, quod saepe reiciendis nihil.</p>
				  </md-tab>

				  <md-tab id="settings" md-label="Настройки">
				    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Deserunt dolorum quas.</p>
				  </md-tab>

				</md-tabs>
			</md-theme>	
	  </md-layout>
	</md-layout>
</div>
</template>
<script>
import CommitChart from '../charts/CommitChart'
export default {
  name: 'Dash',
  data () {
    return {
      msg: 'Устройство №1'
    }
  },
  components: {
    CommitChart
  }
}
</script>
<style>
.dash-form{
  margin-top: 20px;
}
.chart-container{
	min-height: 400px;
	min-width: 800px;
}
</style>
