<template>
  <div class="settings">
  <md-dialog-alert
  :md-content="alert.content"
  :md-ok-text="alert.ok"
  ref="dialog_network">
  </md-dialog-alert>
  <md-card md-with-hover class="settings">
    <md-card-header>
      <div class="md-title">Настройки сети</div>
    </md-card-header>
    <md-card-content>
    <md-switch v-model="dhcp" id="dhcp-switch" name="dhcp-switch" class="md-primary">DHCP</md-switch>
      <md-input-container v-bind:class="{ 'md-input-invalid': wrongip}">
        <label>IP-Адрес</label>
        <md-input type="text" v-model="ip"   >{{ ip }}</md-input>
        <span class="md-error">Validation message</span>
      </md-input-container>
      <md-input-container >
        <label>Маска подсети</label>
        <md-input type="text" v-model="mask" >{{ mask }}</md-input>
      </md-input-container>
      <md-input-container >
        <label>Основной шлюз</label>
        <md-input type="text" v-model="gateway"  >{{ gateway }}</md-input>
      </md-input-container>
      <md-input-container >
        <label>DNS-сервер</label>
        <md-input type="text" v-model="dns"> {{ dns }}</md-input>
      </md-input-container>
      <md-card class="md-warn" v-if="error">
              <p>{{ error }}</p>
      </md-card>
    </md-card-content>
    <md-card-actions>
      <md-button class="md-raised md-accent" @click.native="applySettings()">Применить</md-button>
    </md-card-actions>
  </md-card>
  </div>
</template>
<script>
export default {
  name: 'networkchange',
  data () {
    return {
      msg: '',
      ip: '10.0.0.1',
      mask: '255.255.255.0',
      gateway: '',
      dns: '1.1.1.1',
      dhcp: false,
      error: '',
      alert: {
        content: 'Сетевые настройки изменены!',
        ok: 'OK'
      }
    }
  },
  mounted () {
  },
  computed: {
    wrongip: function () {
      var numbers = this.ip.split('.')
      var result = true
      numbers.forEach(function (number) {
        result = result && (number < 256) && (number >= 0)
      })
      console.log(numbers)
      return !result
    }
  },
  methods: {
    applySettings () {

    },
    openDialog (ref) {
      this.$refs[ref].open()
    },
    closeDialog (ref) {
      this.$refs[ref].close()
    }
  }
}
</script>
<style scoped>
.settings{
  width: 98%;
}
.md-card{
  margin-bottom: 10px;
  margin-top: 10px;
}
</style>
