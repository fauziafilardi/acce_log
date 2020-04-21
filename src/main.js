import Vue from 'vue'

import App from './App.vue'

import BootstrapVue from 'bootstrap-vue'
import Datepicker from 'vuejs-datepicker'

import './plugins/axios'
import './plugins/vue-chartkick'
import './plugins/vue-bootstrap'
import { i18n } from './plugins/vue-i18n'
import './FontAwesome'
import IdleVue from 'idle-vue'

//modal vue
import VModal from 'vue-js-modal'

// import './assets/css/summernote/bootstrap.css'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import './assets/css/simple-line-icons.min.css'
// import './assets/ckeditor/ckeditor.js'
// import './assets/js/charts-loader'

import router from './router'
import store from './store'
import './registerServiceWorker'

// import ckeditor4 from 'assets/ckeditor/ckeditor'
// Object.defineProperty(Vue.prototype, '$ckeditor', { value: ckeditor4 })

// third-party components
import VueSweetalert2 from 'vue-sweetalert2'
import VeeValidate from 'vee-validate'
import vSelect from 'vue-select'
import draggable from 'vuedraggable'
import JsonExcel from 'vue-json-excel'
import ZkTable from 'vue-table-with-tree-grid'
import MaskedInput from 'vue-masked-input'
// import { CalenderView } from "vue-simple-calendar"
// import { CalenderViewHeader } from "vue-simple-calendar"


// import 'vue-simple-calendar/static/css/default.css'
// import 'vue-simple-calendar/static/css/holidays-us.css'

// mixins
import LocalStorage from './mixins/LocalStorage'
import Network from './mixins/Network'
import Functions from './mixins/Functions'
import Helper from './mixins/Helper'
import Alert from './mixins/Alert'
import Moment from './mixins/Moment'
import NoBackButton from './mixins/NoBackButton'
import Global from './mixins/Global'

// custom components
import CalenderView from './components/Calender/CalenderView.vue'
import CalenderViewHeader from './components/Calender/CalenderViewHeader.vue'
// import ABSinputText from './components/Forms/ABSinputText.vue'
import ABSinputPassword from './components/Forms/ABSinputPassword.vue'
// import ABSinputRadioButton from './components/Forms/ABSinputRadioButton.vue'
import ABSinputCheckBox from './components/Forms/ABSinputCheckBox.vue'
import ABSinputCheckBoxOnly from './components/Forms/ABSinputCheckBoxOnly.vue'
import ABSinputCheckBoxList from './components/Forms/ABSinputCheckBoxList.vue'
import ABSButton from './components/Forms/ABSButton.vue'
// import ABSList from './components/List/ABSList.vue'
// import ABSInputSelect from './components/Forms/ABSInputSelect.vue'
// import ABSInputSelect2 from './components/Forms/ABSInputSelect2.vue'
import ABSInputSelect2 from './components/Forms/ABSInputSelect2_new.vue'
import ABSInputSelect2Only from './components/Forms/ABSInputSelect2Only.vue'
import ABSMultiSelect from './components/Forms/ABSMultiSelect.vue'
import ABSToolBarFormHeader from './components/Forms/ABSToolBarFormHeader.vue'
import ABSToolBarVuex from './components/Forms/ABSToolBarVuex.vue'
import ABSToolBarVuex2 from './components/Forms/ABSToolBarVuex2.vue'
// import ABSSelectAsync from './components/Forms/ABSSelectAsync.vue'
// import ABSinputDate from './components/Forms/ABSinputDate.vue'
import ABSFileUpload from './components/Forms/ABSFileUpload.vue'
import ABSinputTextArea from './components/Forms/ABSinputTextArea.vue'
// import ABSTab from './components/Forms/ABSTab.vue'
import ABSTabDetail from './components/Forms/ABSTabDetail.vue'
import ABSTabDetailVuex from './components/Forms/ABSTabDetailVuex.vue'
// import ABSTabs from './components/Forms/ABSTabs.vue'
import ABSTabsVuex from './components/Forms/ABSTabsVuex.vue'

import ABSTabsVuex_New from './components/Forms/ABSTabsVuex_New.vue'
import ABSTabDetailVuex_New from './components/Forms/ABSTabDetailVuex_New.vue'

// import ABSMasterPage from './components/Forms/ABSMasterPage.vue'
import ABSMasterPageVuex from './components/Forms/ABSMasterPageVuex.vue'
import ABSMasterPageVuex2 from './components/Forms/ABSMasterPageVuex2.vue'
// import HeaderFormList from './components/HeaderForm/HeaderFormList.vue'
import HeaderFormListVuex from './components/HeaderForm/HeaderFormListVuex.vue'
import HeaderFormListVuex2 from './components/HeaderForm/HeaderFormListVuex2.vue'
import ABSTAnalysis from './components/TAnalysis/ABSTAnalysis.vue'
import ABSTAnalysisFromTo from './components/TAnalysis/ABSTAnalysisFromTo.vue'
import ABSTAnalysisRadioButton from './components/TAnalysis/ABSTAnalysisRadioButton.vue'
import ABSTAnalysisRadioButtonTransactionType from './components/TAnalysis/ABSTAnalysisRadioButtonTransactionType.vue'
import ABSTAnalysisLookUp from './components/TAnalysis/ABSTAnalysisLookUp.vue'
import ABSTAnalysisReportGeneratorExecutor from './components/TAnalysis/ABSTAnalysisReportGeneratorExecutor.vue'
import ABSCompute from './components/Forms/ABSCompute.vue'
import ABSLabelOnly from './components/Forms/ABSLabelOnly.vue'
import ABSInputSelectList from './components/Forms/ABSInputSelectList.vue'
import ABSInputSelectListMobile from './components/Forms/ABSInputSelectListMobile.vue'
import ABSInputSelectListOnly from './components/Forms/ABSInputSelectListOnly.vue'
import ABSInputSelectListDetail from './components/Forms/ABSInputSelectListDetail.vue'
import ABSLoader from './components/Forms/ABSLoader.vue'

import ABSGoogleMaps from './components/Forms/ABSGoogleMaps.vue'

import ABSProcessinputText from './components/Process/ABSProcessinputText.vue'
import ABSProcessinputRadioButton from './components/Process/ABSProcessinputRadioButton.vue'
import ABSProcessInputSelect from './components/Process/ABSProcessInputSelect.vue'
import ABSProcessInputSelect2 from './components/Process/ABSProcessInputSelect2.vue'
import ABSProcessInputSelectList from './components/Process/ABSProcessInputSelectList.vue'
import ABSProcessinputDate from './components/Process/ABSProcessinputDate.vue'
import ABSProcessinputDateRange from './components/Process/ABSProcessinputDateRange.vue'
import ABSProcessTextBoxOnly from './components/Process/ABSProcessTextBoxOnly.vue'
import ABSProcessinputCheckBox from './components/Process/ABSProcessinputCheckBox.vue'
import ABSProcessTextAreaVuex from './components/Process/ABSProcessTextArea_Vuex.vue'

import ABSInputDateTime from './components/Forms/ABSinputDateTime.vue'
import ABSTextBoxOnly from './components/Forms/ABSTextBoxOnly.vue'
import ABSDateOnly from './components/Input_Vuex/ABSinputDateOnly.vue'
import ABSinputRadioButtonOnly from './components/Forms/ABSinputRadioButtonOnly.vue'
import ABSInputTimeRange from './components/Forms/ABSinputTimeRange.vue'
import ABSInputTime from './components/Forms/ABSinputTime.vue'
import ABSTextEditor from './components/Forms/ABSTextEditor.vue'
import ABSAvatar from './components/Forms/ABSAvatar.vue'

import ABSModal from './components/Forms/ABSModal.vue'

// VUEX Component
import ABSinputTextVuex from './components/Input_Vuex/ABSinputText_Vuex.vue'
import ABSinputRadioButtonVuex from './components/Input_Vuex/ABSinputRadioButton_Vuex.vue'
import ABSInputSelectVuex from './components/Input_Vuex/ABSInputSelect_Vuex.vue'
import ABSinputDateVuex from './components/Input_Vuex/ABSinputDate_Vuex.vue'
import ABSinputDateRangeVuex from './components/Input_Vuex/ABSinputDate_Range_Vuex.vue'
import ABSListVuex from './components/List/ABSListVuex.vue'
import ABSListEdit from './components/List/ABSListEdit.vue'
import ABSListTextField from './components/List/ABSListTextField.vue'
import ABSGrid from './components/Grid/ABSGrid.vue'
import ABSListTest from './components/List/ABSListTest.vue'
import ABSTextAreaVuex from './components/Input_Vuex/ABSTextArea_Vuex.vue'
import ABSInputTextPeriodYear from './components/Input_Vuex/ABSInputTextPeriodYear.vue'

// ACCELOG Component
import ACCList from './components/List/ACCList.vue'
import ACCTextBox from './components/ACCForms/ACCTextBox.vue'
import ACCLookUp from './components/ACCForms/ACCLookUp.vue'
import ACCLookUpDetail from './components/ACCForms/ACCLookUpDetail.vue'
import ACCDropDown from './components/ACCForms/ACCDropDown.vue'
import ACCTextArea from './components/ACCForms/ACCTextArea.vue'

import HeaderFormVuex from './components/HeaderForm/HeaderFormVuex.vue'
import ABSMasterPageFormVuex from './components/Forms/ABSMasterPageFormVuex.vue'
import ABSPreviewReport from './components/Forms/ABSPreviewReport.vue'
import ABSColorPicker from './components/Input_Vuex/ABSColorPicker_Vuex.vue'
import VueLayers from 'vuelayers'
import * as VueGoogleMaps from 'vue2-google-maps'
// import { VueEditor } from 'vue2-editor';
// import CKEditor from '@ckeditor/ckeditor5-vue';
// import VueCkeditor from 'vue-ckeditor2'
import Treeselect from '@riophae/vue-treeselect'
import '@riophae/vue-treeselect/dist/vue-treeselect.css'
import Simplert from 'vue2-simplert'

import { Chrome } from 'vue-color'

Vue.use(VueGoogleMaps, {
  load: {
    // from vue google maps
    // key: 'AIzaSyDqrq-DczaS1fOjZW8bI7WM8_l583WPPhM',
    key: 'AIzaSyB-gk-UM0_k3cSxnxfbS0S4GUJ_pqj6FdQ',
    libraries: 'places', // This is required if you use the Autocomplete plugin
    region: 'ID',
    language: 'id',
    // OR: libraries: 'places,drawing'
    // OR: libraries: 'places,drawing,visualization'
    // (as you require)
 
    //// If you want to set the version, you can do so:
    // v: '3.26',
  },
 
  //// If you intend to programmatically custom event listener code
  //// (e.g. `this.$refs.gmap.$on('zoom_changed', someFunc)`)
  //// instead of going through Vue templates (e.g. `<GmapMap @zoom_changed="someFunc">`)
  //// you might need to turn this on.
  // autobindAllEvents: false,
 
  //// If you want to manually install components, e.g.
  //// import {GmapMarker} from 'vue2-google-maps/src/components/marker'
  //// Vue.component('GmapMarker', GmapMarker)
  //// then disable the following:
  // installComponents: true,
})

Vue.use(CalenderView)
Vue.use(CalenderViewHeader )
Vue.use(VModal,{ dynamic: true, injectModalsContainer: true })
Vue.use(VueSweetalert2)
Vue.use(VeeValidate)
Vue.use(BootstrapVue)
Vue.use(Datepicker)
Vue.use(require('vue-shortkey'))
Vue.use(VueLayers)
// Vue.use(VueCkeditor)
// Vue.use(CKEditor)
// map open layer
// all input/output coordinates, GeoJSON features in EPSG:4326 projection
// Vue.use(VueLayers, {
//   dataProjection: 'EPSG:4326'
// })

// custom component
Vue.component('CalenderView', CalenderView)
Vue.component('CalenderViewHeader', CalenderViewHeader)
// Vue.component('ABSinputText', ABSinputText)
Vue.component('ABSinputPassword', ABSinputPassword)
// Vue.component('ABSinputRadioButton', ABSinputRadioButton)
Vue.component('ABSinputCheckBox', ABSinputCheckBox)
Vue.component('ABSinputCheckBoxOnly', ABSinputCheckBoxOnly)
Vue.component('ABSinputCheckBoxList', ABSinputCheckBoxList)
Vue.component('ABSButton', ABSButton)
// Vue.component('ABSList', ABSList)
Vue.component('ABSMultiSelect', ABSMultiSelect)
// Vue.component('ABSInputSelect', ABSInputSelect)
Vue.component('ABSInputSelect2', ABSInputSelect2)
Vue.component('ABSInputSelect2Only', ABSInputSelect2Only)
// Vue.component('ABSInputSelect2New', ABSInputSelect2New)
// Vue.component('ABSSelectAsync', ABSSelectAsync)
Vue.component('ABSToolBarFormHeader', ABSToolBarFormHeader)
Vue.component('ABSToolBarVuex', ABSToolBarVuex)
Vue.component('ABSToolBarVuex2', ABSToolBarVuex2)
// Vue.component('ABSinputDate', ABSinputDate)
Vue.component('ABSFileUpload', ABSFileUpload)
Vue.component('ABSinputTextArea', ABSinputTextArea)
// Vue.component('ABSTab', ABSTab)
Vue.component('ABSTabDetail', ABSTabDetail)
Vue.component('ABSTabDetailVuex', ABSTabDetailVuex)
// Vue.component('ABSTabs', ABSTabs)
Vue.component('ABSTabsVuex', ABSTabsVuex)
// Vue.component('ABSMasterPage', ABSMasterPage)

Vue.component('ABSTabsVuexNew', ABSTabsVuex_New)
Vue.component('ABSTabDetailVuexNew', ABSTabDetailVuex_New)

Vue.component('ABSCompute', ABSCompute)
Vue.component('ABSLabelOnly', ABSLabelOnly)
Vue.component('ABSInputDateTime', ABSInputDateTime)
Vue.component('ABSinputRadioButtonOnly', ABSinputRadioButtonOnly)
Vue.component('ABSTextBoxOnly', ABSTextBoxOnly)
Vue.component('ABSDateOnly', ABSDateOnly)
Vue.component('ABSInputTimeRange', ABSInputTimeRange)
Vue.component('ABSInputTime', ABSInputTime)
Vue.component('ABSTextEditor', ABSTextEditor)
Vue.component('ABSModal', ABSModal)
Vue.component('ABSAvatar', ABSAvatar)

// component Vuex - By Akmal
Vue.component('ABSinputTextVuex', ABSinputTextVuex)
Vue.component('ABSinputRadioButtonVuex', ABSinputRadioButtonVuex)
Vue.component('ABSInputSelectVuex', ABSInputSelectVuex)
Vue.component('ABSinputDateVuex', ABSinputDateVuex)
Vue.component('ABSinputDateRangeVuex', ABSinputDateRangeVuex)
Vue.component('ABSListVuex', ABSListVuex)
Vue.component('ABSListEdit', ABSListEdit)
Vue.component('ABSListTextField', ABSListTextField)
Vue.component('ABSGrid', ABSGrid)
Vue.component('ABSListTest', ABSListTest)
Vue.component('ABSTextAreaVuex', ABSTextAreaVuex)
Vue.component('ABSInputTextPeriodYear', ABSInputTextPeriodYear)

//ACCELOG Component
Vue.component('ACCList', ACCList)
Vue.component('ACCTextBox', ACCTextBox)
Vue.component('ACCLookUp', ACCLookUp)
Vue.component('ACCLookUpDetail', ACCLookUpDetail)
Vue.component('ACCDropDown', ACCDropDown)
Vue.component('ACCTextArea', ACCTextArea)

// componen Vuex - By Fauzi
Vue.component('HeaderFormVuex', HeaderFormVuex)
Vue.component('ABSMasterPageFormVuex', ABSMasterPageFormVuex)

Vue.component('ABSMasterPageVuex', ABSMasterPageVuex)
Vue.component('ABSMasterPageVuex2', ABSMasterPageVuex2)
// Vue.component('HeaderFormList', HeaderFormList)
Vue.component('HeaderFormListVuex', HeaderFormListVuex)
Vue.component('HeaderFormListVuex2', HeaderFormListVuex2)

Vue.component('ABSProcessinputText', ABSProcessinputText)
Vue.component('ABSProcessinputRadioButton', ABSProcessinputRadioButton)
Vue.component('ABSProcessInputSelect', ABSProcessInputSelect)
Vue.component('ABSProcessInputSelect2', ABSProcessInputSelect2)
Vue.component('ABSProcessInputSelectList', ABSProcessInputSelectList)
Vue.component('ABSProcessinputDate', ABSProcessinputDate)
Vue.component('ABSProcessinputDateRange', ABSProcessinputDateRange)
Vue.component('ABSProcessTextBoxOnly', ABSProcessTextBoxOnly)
Vue.component('ABSProcessinputCheckBox', ABSProcessinputCheckBox)
Vue.component('ABSProcessTextAreaVuex', ABSProcessTextAreaVuex)

Vue.component('v-select', vSelect)
Vue.component('draggable', draggable)
Vue.component('downloadExcel', JsonExcel)
Vue.component('ABSTAnalysis', ABSTAnalysis)
Vue.component('ABSTAnalysisFromTo', ABSTAnalysisFromTo)
Vue.component('ABSTAnalysisRadioButton', ABSTAnalysisRadioButton)
Vue.component('ABSTAnalysisRadioButtonTransactionType', ABSTAnalysisRadioButtonTransactionType)
Vue.component('ABSTAnalysisLookUp', ABSTAnalysisLookUp)
Vue.component('ABSTAnalysisReportGeneratorExecutor', ABSTAnalysisReportGeneratorExecutor)
Vue.component('vTreeTable', ZkTable)
Vue.component('masked-input', MaskedInput)
Vue.component('ABSInputSelectList', ABSInputSelectList)
Vue.component('ABSInputSelectListMobile', ABSInputSelectListMobile)
Vue.component('ABSInputSelectListOnly', ABSInputSelectListOnly)
Vue.component('ABSInputSelectListDetail', ABSInputSelectListDetail)
Vue.component('ABSLoader', ABSLoader)

Vue.component('ABSGoogleMaps', ABSGoogleMaps)

Vue.component('ABSPreviewReport', ABSPreviewReport)
Vue.component('ABSColorPicker', ABSColorPicker)
Vue.component('Treeselect', Treeselect)
Vue.component('Simplert', Simplert)
Vue.component('chrome-picker', Chrome)

// Vue.component('vue-editor', VueEditor)

Vue.mixin(LocalStorage)
Vue.mixin(Network)
Vue.mixin(Functions)
Vue.mixin(Helper)
Vue.mixin(Alert)
Vue.mixin(Moment)
Vue.mixin(NoBackButton)
Vue.mixin(Global)

// IDLE TIME
const eventsHub = new Vue()
Vue.use(IdleVue, {
  eventEmitter: eventsHub,
  // idleTime: 30 * 60 * 1000 // saat ini 10 menit (ganti digit di depan aja ya, * 60 * 1000 jangan diapa2in)
  idleTime: 1440 * 60 * 1000 // (1 hari)
})

// Vue.directive('click-outside', {
//   priority: 700,
//   bind () {
//     let self = this
//     this.event = function (event) {
//       self.vm.$emit(self.expression, event) 
//  	  }
//     this.el.addEventListener('click', this.stopProp)
//     document.body.addEventListener('click', this.event)
//   },
//   unbind () {
//     this.el.removeEventListener('click', this.stopProp)
//     document.body.removeEventListener('click', this.event)
//   },
//   stopProp (event) {
//     event.stopPropagation()
//   }
// })

export const EventBus = new Vue()

Vue.config.productionTip = false

const app2 = new Vue({
  i18n,
  router,
  store,
  render: h => h(App),
  onIdle () {
    if (this.$route.path !== '/sign-in') {
      this.alertInfo('Session has expired please login again')
      localStorage.clear()
      router.replace({
        path: '/sign-in'
      })
    }
  }
}).$mount('#app')

// const app2 = new Vue({
//   el: '#app-2',
//   render: h => h(App)
// })

// VModal.rootInstance = app2