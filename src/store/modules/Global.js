import * as mutationTypes from '../mutation-types'

const state = {
  menuBig: false,
  paddingHeader: '225px',
  paddingLeftContent: '230px',
  widthSidebar: '230px',
  widthRightbar: '0px',
  textMenu: true,
  languageStatus: false,
  // disableChildData: 'def',
  disableChildData: '',
  // disableChildDataList: ['VAT'],
  statusLoader: false,
  statusError: false,
  paramInsertPopup: null,
  rowClickCount: 0,
  paramGetDataBy: null,
  dataT: [],
  search1: null,
  search2: null,
  search3: null,
  isPost: false,
  psMenu: null,
  newStatus: true,
  editStatus: true,
  deleteStatus: true,
  TitleForTabProcess: '',
  hideSideMenu: true,
  parentSeqNo: '',
  moduleName: '',

  ParamPage: {}
}

const getters = {
  menuBig: state => { return state.menuBig },
  paddingHeader: state => { return state.paddingHeader },
  paddingLeftContent: state => { return state.paddingLeftContent },
  widthSidebar: state => { return state.widthSidebar },
  widthRightbar: state => { return state.widthRightbar },
  textMenu: state => { return state.textMenu },
  languageStatus: state => { return state.languageStatus },
  getDisableChildData: state => { return state.disableChildData },
  // getDisableChildDataList: state => { return state.disableChildDataList },
  getStatusLoader: state => { return state.statusLoader },
  getStatusError: state => { return state.statusError },
  getParamInsertPopup: state => { return state.paramInsertPopup },
  getRowClickCount: state => { return state.rowClickCount },
  getParamGetDataBy: state => { return state.paramGetDataBy },
  getDataT: state => { return state.dataT },
  getSearch1: state => { return state.search1 },
  getSearch2: state => { return state.search2 },
  getSearch3: state => { return state.search3 },
  getIsPost: state => { return state.isPost },
  getPsMenu: state => { return state.psMenu },
  getNewStatus: state => { return state.newStatus },
  getEditStatus: state => { return state.editStatus },
  getDeleteStatus: state => { return state.deleteStatus },
  getTitleForTabProcess: state => { return state.TitleForTabProcess },
  getHideSideMenu: state => { return state.hideSideMenu },
  getParentSeqNo: state => { return state.parentSeqNo },
  getModuleName: state => { return state.moduleName },

  getParamPage: state => { return state.ParamPage }
}

const mutations = {
  [mutationTypes.UPDATE_MENU_BIG] (state, data) {
    state.menuBig = data
  },
  [mutationTypes.PADDING_HEADER] (state, data) {
    state.paddingHeader = data
  },
  [mutationTypes.PADDING_LEFT_CONTENT] (state, data) {
    state.paddingLeftContent = data
  },
  [mutationTypes.WIDTH_SIDEBAR] (state, data) {
    state.widthSidebar = data
  },
  [mutationTypes.WIDTH_RIGHTBAR] (state, data) {
    state.widthRightbar = data
  },
  [mutationTypes.TEXT_MENU] (state, data) {
    state.textMenu = data
  },
  setDisableChildData (state, data) {
    state.disableChildData = data
  },
  setStatusLoader (state, data) {
    state.statusLoader = data
  },
  setStatusError (state, data) {
    state.statusError = data
  },
  setParamInsertPopup (state, data) {
    state.paramInsertPopup = data
  },
  setRowClickCount (state, data) {
    state.rowClickCount = data
  },
  setParamGetDataBy (state, data) {
    state.paramGetDataBy = data
  },
  setDataT (state, data) {
    state.dataT = data
  },
  setSearch1 (state, data) {
    state.search1 = data
  },
  setSearch2 (state, data) {
    state.search2 = data
  },
  setSearch3 (state, data) {
    state.search3 = data
  },
  setIsPost (state, data) {
    state.isPost = data
  },
  setPsMenu (state, data) {
    state.psMenu = data
  },
  setNewStatus (state, data) {
    state.newStatus = data
  },
  setEditStatus (state, data) {
    state.editStatus = data
  },
  setDeleteStatus (state, data) {
    state.deleteStatus = data
  },
  setTitleForTabProcess (state, data) {
    state.TitleForTabProcess = data
  },
  setHideSideMenu (state, data){
    state.hideSideMenu = data
  },
  setParentSeqNo (state, data){
    state.parentSeqNo = data
  },
  setModuleName (state, data){
    state.moduleName = data
  },
  
  setParamPage (state, data){
    state.ParamPage = data
  }
}

const actions = {
  handleMenuBig ({ commit }, data) {
    commit(mutationTypes.UPDATE_MENU_BIG, data)
  },
  handlePaddingHeader ({ commit }, data) {
    commit(mutationTypes.PADDING_HEADER, data)
  },
  handlePaddingLeftContent ({ commit }, data) {
    commit(mutationTypes.PADDING_LEFT_CONTENT, data)
  },
  handleWidthSidebar ({ commit }, data) {
    commit(mutationTypes.WIDTH_SIDEBAR, data)
  },
  handleWidthRightbar ({ commit }, data) {
    commit(mutationTypes.WIDTH_RIGHTBAR, data)
  },
  handleTextMenu ({ commit }, data) {
    commit(mutationTypes.TEXT_MENU, data)
  }
}

export default {
  state,
  getters,
  mutations,
  actions
}
