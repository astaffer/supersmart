<template>
  <div>
    <md-dialog md-open-from="#fab" md-close-to="#fab" ref="dialog_color">
      <md-dialog-title>Выбрать цвет</md-dialog-title>
      <md-dialog-content>
           <chrome-picker v-model="barToChangeColor.bar_colors"></chrome-picker>
      </md-dialog-content>
      <md-dialog-actions>
        <md-button class="md-primary" @click.native="onCloseColorChange()">Отмена</md-button>
        <md-button class="md-primary" @click.native="onApplyColorChange()">Выбрать</md-button>
      </md-dialog-actions>
    </md-dialog>
   <md-layout md-gutter >
    <md-layout md-flex="30" >
      <md-dialog-alert
        :md-content="alert.content"
        :md-ok-text="alert.ok"
        ref="dialog_bar">
      </md-dialog-alert>
      <md-dialog-alert
        :md-content="alert.content_error"
        :md-ok-text="alert.ok"
        ref="dialog_bar_error">
      </md-dialog-alert>
      <md-dialog-alert
        :md-content="alert.content_add"
        :md-ok-text="alert.ok"
        ref="dialog_bar_add">
      </md-dialog-alert>
      <md-dialog-alert
        :md-content="alert.content_del"
        :md-ok-text="alert.ok"
        ref="dialog_bar_del">
      </md-dialog-alert>
      <md-dialog-alert
        :md-content="alert.content_add_error"
        :md-ok-text="alert.ok"
        ref="dialog_bar_add_error">
      </md-dialog-alert>
      <md-dialog-alert
        :md-content="alert.content_del_error"
        :md-ok-text="alert.ok"
        ref="dialog_bar_del_error">
      </md-dialog-alert>
    </md-layout>
   </md-layout>
   <md-layout md-gutter md-align="center">
      <md-layout md-align="center" md-flex-medium="25" md-flex-xsmall="100" md-flex-small="50" v-if="hasAdminAccess()">
        <md-card md-with-hover style="width:90%" >
          <md-card-header>
            <div class="md-title">Новый показатель</div>
          </md-card-header>
          <md-card-content>
            <md-input-container>
              <label>Наименование</label>
              <md-input maxlength="30" v-model="newbar.bar_label"></md-input>

              <span class="md-error">Ошибка при заполнении</span>
            </md-input-container>
              <md-button  id="fab" v-bind:style="{background:rgba(newbar.bar_colors)}" @click.native="openColorChange(newbar)"></md-button>
            <md-input-container>
              <label>Тип</label>
              <md-select v-model="newbar.bar_type">
                <md-option value="Plan">План</md-option>
                <md-option value="SensorOn">Время Вкл</md-option>
                <md-option value="SensorOff">Время Выкл</md-option>
              </md-select>
              <span class="md-error">Ошибка при заполнении</span>
            </md-input-container>
            <md-input-container>
              <label>Датчик</label>
              <md-select v-model="newbar.sensor_id">
                <md-option v-for="sensor in sensors" :key="sensor.sensor_id" v-bind:value="sensor.sensor_id">{{ sensor.sensor_name }}</md-option>
              </md-select>
              <span class="md-error">Ошибка при заполнении</span>
            </md-input-container>
            <md-input-container>
              <label>Порядковый номер</label>
              <md-input type="number" v-model="newbar.sort_order"></md-input>
              <span class="md-error">Ошибка при заполнении</span>
            </md-input-container>
          </md-card-content>
          <md-card-actions>
            <md-button  @click.native="createBar(newbar)">Добавить</md-button>
          </md-card-actions>
        </md-card>
      </md-layout>
      <md-layout md-align="center" v-for="bar in bars" :key="bar.bar_id" md-flex-medium="25" md-flex-xsmall="100" md-flex-small="50">
        <md-card md-with-hover style="width:90%">
          <md-card-header>
            <div class="md-title">Показатель: {{ bar.bar_id }}</div>
          </md-card-header>
          <md-card-content>
            <md-input-container  >
              <label>Наименование</label>
              <md-input maxlength="30"  v-model="bar.bar_label" :disabled="!hasAdminAccess()"></md-input>
              <span class="md-error">Ошибка при заполнении</span>
            </md-input-container>
            <md-button  id="fab" v-bind:style="{background:rgba(bar.bar_colors)}" @click.native="openColorChange(bar)"></md-button>
            <md-input-container>
              <label>Тип</label>
              <md-select v-model="bar.bar_type" :disabled="!hasAdminAccess()">
                <md-option value="Plan">План</md-option>
                <md-option value="SensorOn">Время Вкл</md-option>
                <md-option value="SensorOff">Время Выкл</md-option>
              </md-select>
              <span class="md-error">Ошибка при заполнении</span>
            </md-input-container>
            <md-input-container>
              <label>Датчик</label>
              <md-select v-model="bar.sensor_id" :disabled="!hasAdminAccess()">
                <md-option v-for="sensor in sensors" :key="sensor.sensor_id" v-bind:value="sensor.sensor_id">{{ sensor.sensor_name }}</md-option>
              </md-select>
              <span class="md-error">Ошибка при заполнении</span>
            </md-input-container>
            <md-input-container>
              <label>Порядковый номер</label>
              <md-input type="number" v-model="bar.sort_order" ></md-input>
              <span class="md-error">Ошибка при заполнении</span>
            </md-input-container>
          </md-card-content>
          <md-card-actions>
           <md-layout md-gutter>
              <md-layout>
            <md-button  @click.native="updateBar(bar)" >Изменить</md-button>
            </md-layout>
            <md-layout>
            <md-button @click.native="deleteBar(bar.bar_id)" v-if="hasAdminAccess()">Удалить</md-button>
            </md-layout>
            </md-layout>
          </md-card-actions>
        </md-card>
      </md-layout>
    </md-layout>
  </div>
</template>
<script>
import barservice from '../bars'
import sensorservice from '../sensor'
import {Chrome} from 'vue-color'
export default {
  name: 'barschange',
  components: {
    'chrome-picker': Chrome
  },
  props: {
    user: {
      user_name: '',
      roles: []
    }
  },
  data () {
    return {
      error: '',
      newbar: {
        bar_colors: {
          hex: '#194d33',
          hsl: {
            h: 150,
            s: 0.5,
            l: 0.2,
            a: 1
          },
          hsv: {
            h: 150,
            s: 0.66,
            v: 0.30,
            a: 1
          },
          rgba: {
            r: 25,
            g: 77,
            b: 51,
            a: 1
          },
          a: 1
        }
      },
      bars: [],
      sensors: [],
      barToChangeColor: {
        bar_colors: {
          hex: '#194d33',
          hsl: {
            h: 150,
            s: 0.5,
            l: 0.2,
            a: 1
          },
          hsv: {
            h: 150,
            s: 0.66,
            v: 0.30,
            a: 1
          },
          rgba: {
            r: 25,
            g: 77,
            b: 51,
            a: 1
          },
          a: 1
        }
      },
      alert: {
        content: 'Показатель изменен!',
        content_error: 'Ошибка при изменении показателя!',
        content_add: 'Показатель добавлен!',
        content_del: 'Показатель удален!',
        content_add_error: 'Ошибка при добавлении показателя!',
        content_del_error: 'Ошибка при удалении показателя!',
        ok: 'OK'
      }
    }
  },
  mounted () {
    this.readBars()
    sensorservice.getAllSensors(this).then(response => {
      this.sensors = response.data
      this.sensors.push({
        sensor_id: 0,
        sensor_value: 0,
        sensor_name: 'План'
      })
    }, response => {
      this.error = 'Ошибка при получении данных датчиков'
      console.log(this.error)
    })
  },
  methods: {
    readBars () {
      barservice.getBars(this).then(response => {
        this.bars = response.data
        this.bars.forEach(function (element, index, array) {
          element.bar_colors = JSON.parse(element.bar_colors)
        })
      }, response => {
        this.error = 'Ошибка при получении данных показателей'
        // console.log(this.error)
      })
    },
    hasAdminAccess () {
      return this.user.roles.includes('admin')
    },
    openDialog (ref) {
      this.$refs[ref].open()
    },
    closeDialog (ref) {
      this.$refs[ref].close()
    },
    updateBar (bar) {
      barservice.setBar(this, bar).then(response => {
        var res = response.data
        res.bar_colors = JSON.parse(res.bar_colors)
        bar = res
        this.openDialog('dialog_bar')
      }, response => {
        // console.log('error')
        this.openDialog('dialog_bar_error')
      })
    },
    deleteBar (barId) {
      barservice.deleteBar(this, barId).then(response => {
        // console.log(response.data)
        this.openDialog('dialog_bar_del')
        this.readBars()
      }, response => {
        // console.log('error')
        this.openDialog('dialog_bar_del_error')
      })
      // console.log(barId)
    },
    createBar (bar) {
      barservice.createBar(this, bar).then(response => {
        // console.log(response.data)
        this.openDialog('dialog_bar_add')
        this.readBars()
      }, response => {
        this.openDialog('dialog_bar_add_error')
        // console.log('error')
      })
      // console.log(bar)
    },
    rgba (colors) {
      return `rgba(${colors.rgba.r}, ${colors.rgba.g}, ${colors.rgba.b}, ${colors.rgba.a})`
    },
    openColorChange (bar) {
      this.barToChangeColor = bar
      this.openDialog('dialog_color')
    },
    onCloseColorChange (type) {
      this.closeDialog('dialog_color')
      this.barToChangeColor = {
        bar_colors: {
          hex: '#194d33',
          hsl: {
            h: 150,
            s: 0.5,
            l: 0.2,
            a: 1
          },
          hsv: {
            h: 150,
            s: 0.66,
            v: 0.30,
            a: 1
          },
          rgba: {
            r: 25,
            g: 77,
            b: 51,
            a: 1
          },
          a: 1
        }
      }
    },
    onApplyColorChange (type) {
      this.updateBar(this.barToChangeColor)
      this.onCloseColorChange(type)
    }
  }
}
</script>
<style scoped>
@media (max-width: 1264px) {
  .md-flex-medium-25 {
      min-width: 25%;
      -ms-flex: 0 1 25%;
      flex: 0 1 25%;
  }
}
@media (max-width: 944px) {
  .md-flex-small-50 {
      min-width: 50%;
      -ms-flex: 0 1 50%;
      flex: 0 1 50%;
  }
}
@media (max-width: 600px) {
  .md-flex-xsmall-100 {
      min-width: 100%;
      -ms-flex: 0 1 100%;
      flex: 0 1 100%;
  }
}
</style>
