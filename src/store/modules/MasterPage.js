// import { ENV } from '@/store/config'
import * as mutationTypes from '../mutation-types'

const state = {
  masterPage: {
    Page1Data: null,
    Page2Data: null,
    Page3Data: null,

    Page1GetDataBy: null,
    Page2GetDataBy: null,
    Page3GetDataBy: null
  }
}

const getters = {
  GetPage1Data: state => { return state.masterPage.Page1Data },
  GetPage2Data: state => { return state.masterPage.Page2Data },
  GetPage3Data: state => { return state.masterPage.Page3Data },

  GetPage1GetDataBy: state => { return state.masterPage.Page1GetDataBy },
  GetPage2GetDataBy: state => { return state.masterPage.Page2GetDataBy },
  GetPage3GetDataBy: state => { return state.masterPage.Page3GetDataBy }
}

const mutations = {
  SetPage1Data (state, data) {
    state.masterPage.Page1Data = data
  },
  SetPage2Data (state, data) {
    state.masterPage.Page2Data = data
  },
  SetPage3Data (state, data) {
    state.masterPage.Page3Data = data
  },

  SetPage1GetDataBy (state, data) {
    state.masterPage.Page1GetDataBy = data
  },
  SetPage2GetDataBy (state, data) {
    state.masterPage.Page2GetDataBy = data
  },
  SetPage3GetDataBy (state, data) {
    state.masterPage.Page3GetDataBy = data
  },
}
// const actions = {
//   setEBData ({commit}, data) {
//     commit('EBDATA_STATUS', data)
//   }
// }

export default {
  state,
  getters,
  mutations
}
