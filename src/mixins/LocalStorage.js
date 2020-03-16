export default {
  methods: {

    getDataUser () {
      return localStorage.lsDataUser === undefined ? undefined : JSON.parse(localStorage.lsDataUser)
    },

    getFavoriteMenu () {
      return localStorage.lsFavoriteMenu === undefined ? undefined : JSON.parse(localStorage.lsFavoriteMenu)
    },

    getMenu () {
      return localStorage.lsMenu === undefined ? undefined : JSON.parse(localStorage.lsMenu)
    },

    getSession () {
      return localStorage.lsSession === undefined ? undefined : JSON.parse(localStorage.lsSession)
    },

    getOptionSeq () {
      return this.$route.query.oid === undefined ? undefined : { OptionSeq: this.$route.query.oid }
      // return localStorage.lsOptionSeq === undefined ? undefined : JSON.parse(localStorage.lsOptionSeq)
    },
    getIsPopup () {
      return this.$route.query.isPopup
    },
    getIsCallBack () {
      return this.$route.query.isCallBack
    },
    getFrom () {
      return this.$route.query.from
    },

    getStatusForm () {
      return localStorage.statusForm === undefined ? undefined : localStorage.statusForm
    },

    doClearLocalStorage () {
      return localStorage.clear()
    }

    // example use this method get session id
    // this.getSession().Session_Id
  }
}
