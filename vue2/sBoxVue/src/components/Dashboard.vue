<template>
<div class="dash-form">
  <md-layout md-gutter>
         <md-layout md-flex="30" md-flex-offset="20">
              <p class="head-text"> {{ deviceInfo }}</p> 
              <md-card class="md-warn" v-if="error">
                <p>{{ error }}</p>
            </md-card>
         </md-layout>
  </md-layout>
  <md-layout md-gutter>
    <md-layout md-flex="100" md-align="center">
    <md-button-toggle md-single class="md-accent">
      <md-button v-bind:class="{ 'md-toggle': effectsActive() }" @click.native="$router.push({ path: '/dashboard/effects' })">Эффективность</md-button>
      <md-button @click.native="$router.push({ path: '/dashboard/services' })">Сервис</md-button>
      <md-button @click.native="$router.push({ path: '/dashboard/properties' })">Настройки</md-button>
    </md-button-toggle>
    </md-layout>
  </md-layout>
  <md-layout md-gutter class="dash-router" md-align="center">
    <md-layout md-flex="90" md-align="center">
      <router-view></router-view>
        <!--<md-tabs md-fixed >
          <md-tab id="effects" md-label="Эффективность">
            <md-layout md-gutter>
              <md-layout md-flex="60" md-flex-offset="10">
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
              <md-layout md-flex="30" md-align="end">
                <md-button-toggle md-single class="md-accent">
                  <md-button 
                    class="md-icon-button" 
                    v-bind:class="{'md-toggle': !showTable}"
                    @click.native="showTable=false">
                    <md-icon>assessment</md-icon>
                  </md-button>
                  <md-button 
                    class="md-icon-button" 
                    v-bind:class="{'md-toggle': showTable}"
                    @click.native="showTable=true">
                    <md-icon>view_list</md-icon>
                  </md-button>
                </md-button-toggle>
                <md-button class="md-icon-button">
                  <md-icon>file_download</md-icon>
                </md-button>
                <md-button class="md-icon-button">
                  <md-icon>share</md-icon>
                </md-button>
              </md-layout>
            </md-layout>  
            <md-layout md-gutter> 
                <md-layout md-flex="80" md-flex-offset="10" v-if="!showTable">
                  <div class="chart-container">
                     <commitChart :width="8" :height="4"></commitChart>
                   </div> 
                 </md-layout>
                 <md-layout md-flex="80" md-align="center" v-if="showTable">
                   <md-table v-once>
                    <md-table-header>
                      <md-table-row>
                        <md-table-head>Показатель</md-table-head>
                        <md-table-head md-numeric>Часы</md-table-head>
                        <md-table-head md-numeric>%</md-table-head>
                      </md-table-row>
                    </md-table-header>
                    <md-table-body>
                      <md-table-row>
                        <md-table-cell>План</md-table-cell>
                        <md-table-cell>56</md-table-cell>
                        <md-table-cell>100</md-table-cell>
                      </md-table-row>
                      <md-table-row>
                        <md-table-cell>Время включения</md-table-cell>
                        <md-table-cell>49</md-table-cell>
                        <md-table-cell>87,5</md-table-cell>
                      </md-table-row>
                      <md-table-row>
                        <md-table-cell>Время работы</md-table-cell>
                        <md-table-cell>40</md-table-cell>
                        <md-table-cell>71,4</md-table-cell>
                      </md-table-row>
                      <md-table-row>
                        <md-table-cell>Свет</md-table-cell>
                        <md-table-cell>56</md-table-cell>
                        <md-table-cell>100</md-table-cell>
                      </md-table-row>
                      <md-table-row>
                        <md-table-cell>Завеса</md-table-cell>
                        <md-table-cell>35</md-table-cell>
                        <md-table-cell>65,5</md-table-cell>
                      </md-table-row>
                      <md-table-row>
                        <md-table-cell>Вентиляция</md-table-cell>
                        <md-table-cell>30</md-table-cell>
                        <md-table-cell>53,6</md-table-cell>
                      </md-table-row>
                      <md-table-row>
                        <md-table-cell>Нет завеса-насос</md-table-cell>
                        <md-table-cell>2</md-table-cell>
                        <md-table-cell>3,6</md-table-cell>
                      </md-table-row>
                      <md-table-row>
                        <md-table-cell>Нет завеса-уровень воды</md-table-cell>
                        <md-table-cell>8</md-table-cell>
                        <md-table-cell>14,3</md-table-cell>
                      </md-table-row>
                      <md-table-row>
                        <md-table-cell>Фильтры забиты</md-table-cell>
                        <md-table-cell>1</md-table-cell>
                        <md-table-cell>1,8</md-table-cell>
                      </md-table-row>
                      <md-table-row>
                        <md-table-cell>Вибрация</md-table-cell>
                        <md-table-cell>0</md-table-cell>
                        <md-table-cell>0</md-table-cell>
                      </md-table-row>
                    </md-table-body>
                  </md-table>
                 </md-layout>
             </md-layout> 
          </md-tab>
          <md-tab id="services" md-label="Сервис">
            <radial-gauge :value="377"></radial-gauge>
          </md-tab>
          <md-tab id="settings" md-label="Настройки">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Deserunt dolorum quas.</p>
          </md-tab>
        </md-tabs>
        -->
    </md-layout>
  </md-layout>
</div>
</template>
<script>
import device from '../device'
export default {
  name: 'Dash',
  data () {
    return {
      deviceInfo: '',
      showTable: false,
      error: '',
      isEffectsActive: true
    }
  },
  mounted () {
    device.getDeviceFromService(this).then(response => {
      this.deviceInfo = response.data.device_name + ' ' + response.data.device_id
    }, response => {
      this.error = 'Ошибка при получении данных устройства'
      console.log(this.error)
    })
  },
  methods: {
    effectsActive () {
      return this.$route.name === 'Effects'
    }
  }
}
</script>
<style>
.dash-form{
  margin-top: 5px;
}
.chart-container{
  min-height: 400px;
  min-width: 800px;
}
.dash-router{
  padding-top: 20px;
}
.head-text{
  font-size: 20px;
  font-weight: 600;
}
</style>
