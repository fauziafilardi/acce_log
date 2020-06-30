import Vue from 'vue'
import Vuex from 'vuex'


import Authentication from './modules/Authentication'
import Abs from './modules/Abs'
import Global from './modules/Global'
import Toolbar from './modules/Toolbar'
import MasterPage from './modules/MasterPage'
import ABSInput from './modules/ABSInput'
// import ABSList from './modules/ABSList'
import ButtonStatus from './modules/ButtonStatus'

Vue.use(Vuex)

export default new Vuex.Store({  
  modules: {
    Authentication,
    Abs,
    Global,
    Toolbar,
    MasterPage,
    ABSInput,
    // ABSList,
    ButtonStatus
  }
})
