import { Bar } from 'vue-chartjs'
// import the component - chart you need

export default Bar.extend({
  mounted () {
    // Overwriting base render method with actual data.
    this.renderChart({
      width: 400,
      height: 600,
      labels: ['План', 'Время включения', 'Время работы', 'Свет', 'Завеса', 'Вентиляция', 'Нет Завеса – насос', 'Нет Завеса - уровень воды', 'Фильтры забиты'],
      datasets: [
        {
          label: 'Эффективность, %',
          data: [100, 64, 35, 51, 25, 31, 13, 1, 3],
          backgroundColor: [
            'rgba(255, 99, 132, 0.2)',
            'rgba(54, 162, 235, 0.2)',
            'rgba(255, 206, 86, 0.2)',
            'rgba(75, 192, 192, 0.2)',
            'rgba(153, 102, 255, 0.2)',
            'rgba(255, 159, 64, 0.2)',
            'rgba(75, 192, 12, 0.2)',
            'rgba(153, 12, 35, 0.2)',
            'rgba(255, 59, 64, 0.2)'
          ],
          borderColor: [
            'rgba(255,99,132,1)',
            'rgba(54, 162, 235, 1)',
            'rgba(255, 206, 86, 1)',
            'rgba(75, 192, 192, 1)',
            'rgba(153, 102, 255, 1)',
            'rgba(255, 159, 64, 1)',
            'rgba(75, 192, 12, 1)',
            'rgba(153, 12, 35, 1)',
            'rgba(255, 59, 64, 1)'
          ],
          borderWidth: 1,
          options: {
            scales: {
              yAxes: [{
                ticks: {
                  beginAtZero: true
                },
                gridLines: {
                  display: true,
                  color: 'rgba(255, 0, 0, 1)'
                }
              }],
              xAxes: [{
                categorySpacing: 0,
                categoryPercentage: 0,
                gridLines: {
                  display: true
                }
              }]
            },
            events: false,
            tooltips: {
              enabled: false
            },
            hover: {
              animationDuration: 0
            }
          }
        }
      ]
    })
  }
})
