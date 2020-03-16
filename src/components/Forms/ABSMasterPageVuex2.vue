<template>
  <div class="height--full">
    <HeaderFormListVuex2 />
    <div class="content-app-form__body">
      <div id="cList" class="block-scope-container">
        <div @click="ActiveDiv('1')">
          <ABSTabsVuex :tabPath="prop.tabPath1" :listTab="listHeader" PageLevel='1' />
        </div>
        <!-- {{listDetail}} -->
        <div @click="ActiveDiv('2')" v-show="FormLevel2 && listDetail[0]">
          <ABSTabsVuex v-show="FormLevel2" :tabPath="prop.tabPath2" :listTab="listDetail" PageLevel='2' />
        </div>
        <!-- {{listChild}} -->
        <div @click="ActiveDiv('3')" v-show="FormLevel3  && listChild[0]">
          <ABSTabsVuex v-show="FormLevel3" :tabPath="prop.tabPath3" :listTab="listChild" PageLevel='3' />
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  props: {
    prop: {
      tabPath1: '', tabPath2: null, tabPath3: null
    }
  },
  data() {
    return {
      PageLevel: '1',
      FormLevel2: false,
      FormLevel3: false,
      listTabs: [],
      listHeader: [],
      listDetail: [],
      listChild: [],
      TabIndex: '1',
      dataState:{
        state:'firstload',
        PageLevel:'1',
        TabIndex:'1'
      },
      EBData:null,
      EventStatus: ''
    };
  },
  methods: {
    callMethodChild2 () {
      var tabLevel2 = this.$store.getters.getTabLevel2 - 1
      var len = this.$children[2].$children[0].$children.length / 2
      // for (let x = 0; x < len; x++) {
      //   this.$children[2].$children[0].$children[x].$children[0].$children[0].paramFromParent()
      // }
      if (len > 0) {
        setTimeout(() => {
          this.$children[2].$children[0].$children[tabLevel2].$children[0].$children[0].paramFromParent()
        }, 1);
      }
    },
    callMethodChild3 () {
      var tabLevel3 = this.$store.getters.getTabLevel3 - 1
      var len = this.$children[3].$children[0].$children.length / 2
      // for (let x = 0; x < len; x++) {
      //   this.$children[3].$children[0].$children[x].$children[0].$children[0].paramFromParent()
      // }
      if (len > 0) {
        this.$children[3].$children[0].$children[tabLevel3].$children[0].$children[0].paramFromParent()
      }
    },
    callMethodChild2GetDataBy () {
      setTimeout(() => {
        let data = this.$store.getters.GetPage1Data
        // console.log(this.$children)
        this.$children[1].$children[0].$children[0].$children[0].$children[0].getDataBy(data)
        this.$forceUpdate()
      }, 800)
    },
    callMethodChild3GetDataBy () {
      setTimeout(() => {
        let data = this.$store.getters.GetPage2Data
        this.$children[2].$children[0].$children[0].$children[0].$children[0].getDataBy(data)
        this.$forceUpdate()

        this.callMethodChild2GetDataBy()
      }, 800)
    },
    setDataToToolbar (datax) {
      // set data to toolbar
      this.$children[0].$children[0].setRowSelected(datax)
    },
    ValidasiPage() {
      this.dataState.PageLevel = this.getPageLevel
      this.dataState.state = this.getStatus
      this.dataState.TabIndex = this.getTabIndex
     
      var Events = this.getEventStatus.toUpperCase()
      var datax = {
        pageLevel: this.getPageLevel,
        tabIndex: this.getTabIndex
      }
      
      if (Events == 'NEW' || Events == 'EDIT') {
        this.$store.commit('setListDisable', true)
      } else {
        this.$store.commit('setListDisable', false)
      }
     
      if (this.getPageLevel == '1') {//PAGE1
        if (Events == 'ROWCLICK') {
          this.setDataToToolbar(datax)
          this.FormLevel2 = true
          this.FormLevel3 = false
          this.callMethodChild2()
          // this.$children[2].$children[0].$children[x].$children[0].$children[0].paramFromParent()
        }
        if (Events=='REFRESH' || Events=='DELETE' || Events=='NEW' || Events=='PAGESIZE' || Events=='UPDATE'
              || Events=='PAGINATION' || Events=='HEADTABLE' || Events=='SAVE' || Events=='POST' || Events=='ONSEARCHENTER') {
            this.FormLevel2 = false
            this.FormLevel3 = false
        }
        if (Events=='CANCEL') {
          this.FormLevel3 = false
        }
        if (Events == 'REFRESH_COLUMN') {
          this.FormLevel2 = false
          this.FormLevel3 = false
        }
      } else if (this.getPageLevel == '2') {//PAGE2
        if (Events == 'ROWCLICK') {
          // for (var i = 0; i < this.getDisableChildDataList.length; i++) {
          //   var data = this.getDisableChildDataList[i]
          //   if (data == this.getDisableChildData) {
          //     this.FormLevel3 = false
          //     return
          //   }
          // }
          this.FormLevel3 = true
          this.setDataToToolbar(datax)
          this.callMethodChild3()
        }
        if (Events=='REFRESH' || Events=='DELETE' || Events=='NEW' || Events=='PAGESIZE' || Events=='UPDATE'
              || Events=='PAGINATION' || Events=='HEADTABLE' || Events=='SAVE' || Events=='ONSEARCHENTER') {
            this.FormLevel3 = false
            if (Events == 'SAVE' || Events == 'UPDATE') {
              this.callMethodChild2GetDataBy()
            }
        }
        if (Events=='CANCEL') {
          this.FormLevel3 = false
        }
        if (Events == 'REFRESH_COLUMN') {
          this.FormLevel3 = false
        }
      } else if(this.getPageLevel=='3') {//PAGE3
        this.FormLevel3 = true
        if (Events=='ROWCLICK') {
          this.setDataToToolbar(datax)
        }

        if (Events=='REFRESH' || Events=='DELETE' || Events=='NEW' || Events=='PAGESIZE' || Events=='UPDATE'
              || Events=='PAGINATION' || Events=='HEADTABLE' || Events=='SAVE' || Events=='ONSEARCHENTER'){
            if (Events == 'SAVE' || Events == 'UPDATE') {
              this.callMethodChild3GetDataBy()
            }
        } 
      }
    },
    ListenerEBData(){
      let data = this.$store.getters.GetEbData
    },
    ActiveDiv (data) {
      if (this.$store.getters.getFormType == 'ListEdit') {
        this.$store.commit('setLevel', data)
        this.$children[data].setTabIndex()
        return
      }

      if (this.getStatus.toUpperCase() == 'NEW'||this.getStatus.toUpperCase()=='EDIT') {
        if (this.getPageLevel !== data) {
          return
        }
      } else {
        this.$store.commit('setLevel', data)
        this.$children[data].setTabIndex()
      }
    },
    doGetTabs () {
      var param = {
        OptionSeq: this.getOptionSeq().OptionSeq,
        ParamWhere: ''
      }
      this.postEncode(this.getUrlTab2(), param)
      .then((response) => {
        if(response == null) return
        this.listTabs = response.Data
        this.$store.commit('setListTabs', response.Data)
      })
    },
    doGetTabHeader () {
      var param = {
        OptionSeq: this.getOptionSeq().OptionSeq,
        ParamWhere: '[Level] = 1'
      }
      this.postEncode(this.getUrlTab(), param)
      .then((response) => {
        if(response == null) return
        this.listHeader = response.Data
      })
    },
    doGetTabDetail (data) {
      // alert('detail')
      var param = {
        OptionSeq: this.getOptionSeq().OptionSeq,
        ParamWhere: "parent_sequence_no = '" + data.query_sequence_no + "'"
      }
      this.postEncode(this.getUrlTab(), param)
      .then((response) => {
        if(response == null) return
        this.listDetail = response.Data
      })
    },
    doGetTabChild (data) {
      if (!data) return

      var param = {
        OptionSeq: this.getOptionSeq().OptionSeq,
        ParamWhere: "parent_sequence_no = '" + data.query_sequence_no + "'"
      }
      this.postEncode(this.getUrlTab(), param)
      .then((response) => {
        if(response == null) return
        this.listChild = response.Data
      })
    },
  },
  beforeCreate: function () {
    // this.ListenerEBData()
  },
  computed:{
    getPageLevel () {
      return this.$store.getters.getLevel
    },
    getTabIndex () {
      return this.$store.getters.getTab
    },
    comEBData(){
      this.EBDataSecond = JSON.stringify(this.$store.getters.valueEBData)
    },
    getLevel () {
      return this.$store.getters.getLevel
    },
    getEventStatus () {
      return this.$store.getters.getEventStatus
    },
    getStatus () {
      return this.$store.getters.getStatus
    },
    // getDisableChildData () {
    //   return this.$store.getters.getDisableChildData
    // },
    // getDisableChildDataList () {
    //   return this.$store.getters.getDisableChildDataList
    // }
  },
  created: function() {
  },
  beforeMount: function() {
    // this.$store.getters.valueEBData
  },
  mounted: function() {
    this.$store.commit('setLevel', 1)
    this.$store.commit('setTab', 1)
    this.$store.commit('setStatus', 'view')
    this.$store.commit('setListDisable', false)

    // this.doGetTabs()
    this.doGetTabHeader()
  },
  beforeUpdate: function() {
    // this.$store.getters.valueEBData
  },
  updated: function() {
  },
  beforeDestroy: function() {
  },
  destroyed: function() {
  }
}
</script>