<template>
  <div>
   <md-layout md-gutter >
    <md-layout md-flex="30" >
      <md-button @click.native="createBar()" class="md-accent">Добавить</md-button>
    </md-layout>
   </md-layout>
   <md-layout md-gutter md-align="center">
      <md-layout md-align="center" v-for="bar in bars" :key="bar.bar_id" md-flex="25">
        <md-card md-with-hover style="width:90%">
          <md-card-header>
            <div class="md-title">Показатель: {{ bar.bar_id }}</div>
          </md-card-header>
          <md-card-content>
            <md-input-container>
              <label>Наименование</label>
              <md-input maxlength="30" v-model="bar.bar_label"></md-input>
              <span class="md-error">Ошибка при заполнении</span>
            </md-input-container>
            <md-input-container>
              <label>Цвет</label>
              <md-input v-model="bar.bar_color"></md-input>
              <span class="md-error">Ошибка при заполнении</span>
            </md-input-container>
            <md-input-container>
              <label>Тип</label>
              <md-input  v-model="bar.bar_type"></md-input>
              <span class="md-error">Ошибка при заполнении</span>
            </md-input-container>
            <md-input-container>
              <label>Датчик</label>
              <md-input v-model="bar.sensor_id"></md-input>
              <span class="md-error">Ошибка при заполнении</span>
            </md-input-container>
            <md-input-container>
              <label>Порядковый номер</label>
              <md-input type="number" v-model="bar.sort_order"></md-input>
              <span class="md-error">Ошибка при заполнении</span>
            </md-input-container>
          </md-card-content>
          <md-card-actions>
            <md-button  @click.native="updateBar(bar)">Изменить</md-button>
            <md-button @click.native="deleteBar(bar.bar_id)">Удалить</md-button>
          </md-card-actions>
        </md-card>
      </md-layout>
    </md-layout>
  </div>
</template>
<script>
import barservice from '../bars'
export default {
  name: 'barschange',
  data () {
    return {
      error: '',
      bars: [],
      alert: {
        content: 'Наименование устройства изменено!',
        ok: 'OK'
      }
    }
  },
  mounted () {
    barservice.getBars(this).then(response => {
      this.bars = response.data
    }, response => {
      this.error = 'Error when get bar data'
      console.log(this.error)
    })
  },
  methods: {
    openDialog (ref) {
      this.$refs[ref].open()
    },
    closeDialog (ref) {
      this.$refs[ref].close()
    },
    createBar () {
    },
    updateBar (bar) {
      barservice.setBar(this, bar).then(response => {
        bar = response.data
      }, response => {
        console.log('error')
      })
      console.log(bar)
    },
    deleteBar (barId) {
      barservice.deleteBar(this, barId).then(response => {
        console.log(response.data)
      }, response => {
        console.log('error')
      })
      console.log(barId)
    }
  }
}
</script>
