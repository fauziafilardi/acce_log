
const state = {
  button: null
}

const getters = {
  getButtonStatus: state => { return state.button ? JSON.parse(state.button) : null }
}

const mutations = {
  setButtonStatus (state, data) {
    state.button = data ? JSON.stringify(data) : null
  },
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
