import moment from 'moment'
import { extendMoment } from 'moment-range'

export default {
  methods: {

    momentDate (date) {
      return moment(date).format('YYYY-MM-DD')
    },

    momentDateFormatting (date, frm) {
      if (!date) return null
      return moment(date).format(frm)
    },

    momentDateFormat (date, frm) {
      return moment(date, frm).format('YYYY-MM-DD')
    },

    momentDateFormat2 (date, frm, frm2) {
      return moment(moment(date, frm)).format(frm2)
    },

    momentDateBetween (from, to) {
      const momentRange = extendMoment(moment)
      return momentRange(from).isSameOrBefore(to)
    },

    getMonthName (date) {
      return moment(date).format('MMMM')
    }

  }

}
