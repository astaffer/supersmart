<template>
  <div>
    <ul>
      <li v-for="bar in bars">
        {{ bar.bar_id }} - {{ bar.bar_label }} - {{ bar.bar_color }}
      </li>
    </ul>
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
    }
  }
}
</script>
