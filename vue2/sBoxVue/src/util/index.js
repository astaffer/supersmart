export default {
  parseDateFromStr (dateStr) {
    var dateArr = dateStr.split('.')
    var date = new Date()
    date.setYear(dateArr[2])
    date.setMonth(dateArr[1] - 1)
    date.setDate(dateArr[0])
    date.setHours(0, 0, 0, 0)
    return date
  }
}
