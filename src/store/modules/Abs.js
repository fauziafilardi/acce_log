import * as mutationTypes from '../mutation-types'

const state = {
    // BUTTON
    buttonToolbarNew: false, 
    buttonToolbarEdit: false, 
    buttonToolbarDelete: false, 
    buttonToolbarSave: true, 
    buttonToolbarCancel: true, 
    buttonToolbarRefresh: false, 
    buttonToolbarPost: false,
    // SEARCH
    searchToolbar: '',
    // ACTIVE
    pageActive: null,
    tabActive: null,
}

const getters = {
    // BUTTON
    buttonToolbarNew: state => { return state.buttonToolbarNew },
    buttonToolbarEdit: state => { return state.buttonToolbarEdit },
    buttonToolbarDelete: state => { return state.buttonToolbarDelete },
    buttonToolbarSave: state => { return state.buttonToolbarSave },
    buttonToolbarCancel: state => { return state.buttonToolbarCancel },
    buttonToolbarRefresh: state => { return state.buttonToolbarRefresh },
    buttonToolbarPost: state => { return state.buttonToolbarPost },
    // SEARCH
    searchToolbar: state => { return state.searchToolbar }
}

const mutations = {
    // BUTTON
    BUTTON_NEW (state, data) {
        state.buttonToolbarNew = data
    },
    [mutationTypes.TOOLBAR_BUTTON_EDIT] (state, data) {
        state.buttonToolbarEdit = data
    },
    [mutationTypes.TOOLBAR_BUTTON_DELETE] (state, data) {
        state.buttonToolbarDelete = data
    },
    [mutationTypes.TOOLBAR_BUTTON_SAVE] (state, data) {
        state.buttonToolbarSave = data
    },
    [mutationTypes.TOOLBAR_BUTTON_CANCEL] (state, data) {
        state.buttonToolbarCancel = data
    },
    [mutationTypes.TOOLBAR_BUTTON_REFRESH] (state, data) {
        state.buttonToolbarRefresh = data
    },
    [mutationTypes.TOOLBAR_BUTTON_POST] (state, data) {
        state.buttonToolbarPost = data
    },
    // SEARCH
    [mutationTypes.TOOLBAR_SEARCH] (state, data) {
        state.searchToolbar = data
    }
}

const actions = {
    handleButtonNew ({commit}) {
        commit(mutationTypes.TOOLBAR_BUTTON_NEW, true)
        commit(mutationTypes.TOOLBAR_BUTTON_EDIT, true)
        commit(mutationTypes.TOOLBAR_BUTTON_DELETE, true)
        commit(mutationTypes.TOOLBAR_BUTTON_SAVE, false)
        commit(mutationTypes.TOOLBAR_BUTTON_CANCEL, false)
        commit(mutationTypes.TOOLBAR_BUTTON_REFRESH, true)
        commit(mutationTypes.TOOLBAR_BUTTON_POST, true)
    },
    handleButtonCancel ({commit}) {
        commit(mutationTypes.TOOLBAR_BUTTON_NEW, false)
        commit(mutationTypes.TOOLBAR_BUTTON_EDIT, false)
        commit(mutationTypes.TOOLBAR_BUTTON_DELETE, false)
        commit(mutationTypes.TOOLBAR_BUTTON_SAVE, true)
        commit(mutationTypes.TOOLBAR_BUTTON_CANCEL, true)
        commit(mutationTypes.TOOLBAR_BUTTON_REFRESH, false)
        commit(mutationTypes.TOOLBAR_BUTTON_POST, false)
    },
    disableSemuaData ({commit}) {
        commit(mutationTypes.TOOLBAR_BUTTON_NEW, true)
        commit(mutationTypes.TOOLBAR_BUTTON_EDIT, true)
        commit(mutationTypes.TOOLBAR_BUTTON_DELETE, true)
        commit(mutationTypes.TOOLBAR_BUTTON_SAVE, true)
        commit(mutationTypes.TOOLBAR_BUTTON_CANCEL, true)
        commit(mutationTypes.TOOLBAR_BUTTON_REFRESH, true)
        commit(mutationTypes.TOOLBAR_BUTTON_POST, true)
    },
    handleChangeSearch ({commit}, data) {
        commit(mutationTypes.TOOLBAR_SEARCH, data)
    }
}

export default {
    state,
    getters,
    mutations,
    actions
}