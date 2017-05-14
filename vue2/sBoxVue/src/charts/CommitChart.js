import { Bar, mixins } from 'vue-chartjs'
const { reactiveProp } = mixins
// import the component - chart you need
export default Bar.extend({
  mixins: [reactiveProp],
  props: ['options'],
  mounted () {
    // Overwriting base render method with actual data.
    this.renderChart(this.chartData, this.options)
  },
  watch: {
    'options': {
      handler (newOption, oldOption) {
        this.renderChart(this.chartData, this.options)
      },
      deep: true
    }
  }
})
