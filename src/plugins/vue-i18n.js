import Vue from 'vue'
import VueI18n from 'vue-i18n'

Vue.use(VueI18n)

// const locales = {
//   en: {
//     dashboard: 'Dashboard',
//     Remarks: 'Remarks',
//     Description: 'Description',
//     ReferenceNo: 'Reference No'
//   },
//   id: {
//     dashboard: 'Beranda',
//     Remarks: 'Komentar',
//     Description: 'Deskripsi',
//     ReferenceNo: 'Referensi No'
//   }
// }

const messages = {
  en: require('@/lang/en.json'),
  id: require('@/lang/id.json')
}

export const i18n = new VueI18n({
  locale: 'en',
  messages,
  silentTranslationWarn: true
})