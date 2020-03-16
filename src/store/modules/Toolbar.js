// import { ENV } from '@/store/config'

const state = {
  toolbar: {
    level: '1',
    tab: 1,
    tabLevel2: 1,
    tabLevel3: 1,
    status: 'view',
    FormType: '',
    EventStatus: '', // untuk event pada page component misal : RowClick,Refresh,DELETE,NEW,PAGESIZE,PAGINATION,HEADTABLE,SAVE,CANCEL,ROWCLICK
    ListStatus: false,
    listTabs: [],
    ps: '',
    byPassCancel: false
  }
}

const getters = {
  getLevel: state => { return state.toolbar.level },
  getTab: state => { return state.toolbar.tab },
  getTabLevel2: state => { return state.toolbar.tabLevel2 },
  getTabLevel3: state => { return state.toolbar.tabLevel3 },
  getStatus: state => { return state.toolbar.status },
  getEventStatus: state => { return state.toolbar.EventStatus },
  getListStatus: state => { return state.toolbar.ListStatus },
  getListTabs: state => { return state.toolbar.listTabs },
  getPS: state => { return state.toolbar.ps },
  getFormType: state => { return state.toolbar.FormType },
  getByPassCancel: state => { return state.toolbar.byPassCancel }
}

const mutations = {
  setLevel (state, data) {
    state.toolbar.level = data
  },
  setTab (state, data) {
    state.toolbar.tab = data
  },
  setTabLevel2Active (state, data) {
    state.toolbar.tabLevel2 = data
  },
  setTabLevel3Active (state, data) {
    state.toolbar.tabLevel3 = data
  },
  setStatus (state, data) {
    // state.toolbar.status[state.toolbar.level + '_' + state.toolbar.tab] = data.toLowerCase()
    state.toolbar.status = data.toLowerCase()
  },
  setEventStatus (state, data) {
    state.toolbar.EventStatus = data
  },
  setListDisable (state, data) {
    state.toolbar.ListStatus = data
  },
  setListTabs (state, data) {
    state.toolbar.listTabs = data
  },
  setPS (state, data) {
    state.toolbar.ps = data
  },
  setFormType (state, data) {
    if (data === null || data === undefined) {
      state.toolbar.FormType = 'List'
    } else {
      state.toolbar.FormType = data
    }
  },
  setByPassCancel (state, data) {
    state.toolbar.byPassCancel = data
  }
}

const actions = {
  handleEventStatus ({commit}, data) {
    commit('setEventStatus', data)
  }
}

export default {
  state,
  getters,
  mutations,
  actions
}
