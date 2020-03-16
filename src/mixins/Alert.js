import Vue from 'vue'
import VueSweetalert2 from 'vue-sweetalert2'

Vue.use(VueSweetalert2)

export default {
  methods: {

    alertWithHtml (title = '', type = '', html = '') {
      return this.$swal({
        title: title,
        html: html,
        type: type
      })
    },

    alertSuccess (message) {
      return this.$swal('Success', String(message), 'success')
    },

    alertError (message) {
      return this.$swal('Error', String(message), 'error')
    },

    alertWarning (message) {
      return this.$swal('Oops', String(message), 'warning')
    },

    alertInfo (message) {
      return this.$swal('Info', String(message), 'info')
    },

    alertConfirmation (text, leftButtonText = 'Yes', rightButtonText = 'No') {
      return this.$swal({
        title: 'Confirmation',
        text: text,
        // type: 'info',
        type: 'warning',
        showCancelButton: true,
        confirmButtonText: leftButtonText,
        cancelButtonText: rightButtonText,
        showCloseButton: true,
        showLoaderOnConfirm: true
      })
    }

  }

}
