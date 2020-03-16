<template>
  <div class="height--full">
    <HeaderFormListVuex />
    <div class="content-app-form__body">
        <!-- coding body is here -->
        <!-- {{dataState}} -->
        <!-- {{EBData}} -->
        <!-- form 2 :{{FormLevel2}}
        form 3 :{{FormLevel3}} -->
      <div class="block-scope-container">
        <div @click="ActiveDiv('1')">
          <ABSTabsVuex :tabPath="prop.tabPath1" :listTab="listHeader" PageLevel='1' />
        </div>
        <!-- {{listDetail}} -->
        <div @click="ActiveDiv('2')" v-show="FormLevel2 && listDetail[0]">
        <!-- <div @click="ActiveDiv('2')" v-show="FormLevel2"> -->
          <!-- <ABSTabs v-show="listDetail != null" tabPath='views/Tabs2/' :listTab="listDetail" PageLevel='2' /> -->
          <ABSTabsVuex v-show="FormLevel2" :tabPath="prop.tabPath2" :listTab="listDetail" PageLevel='2' />
        </div>
        <!-- {{listChild}} -->
        <div @click="ActiveDiv('3')" v-show="FormLevel3 && listChild[0]">
        <!-- <div @click="ActiveDiv('3')" v-show="FormLevel3"> -->
          <!-- <ABSTabs v-show="listChild != null" tabPath='views/Tabs2/' :listTab="listChild" PageLevel='3' /> -->
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
  watch:{
    dataState:function(newData,OldData){
      // alert(newData);
      // alert(newData.PageLevel+' - '+newData.TabIndex)
      alert(newData)
      // alert(OldData);
    }
  },
  methods: {
    callMethodChild2 () {
      // console.log(this.$children[2].$children[0].$children[5].$children[0].$children[0])
      var len = this.$children[2].$children[0].$children.length / 2
      for (let x = 0; x < len; x++) {
        this.$children[2].$children[0].$children[x].$children[0].$children[0].paramFromParent()
      }
      // this.getAllChild2(aa)
    },
    callMethodChild3 () {
      var len = this.$children[3].$children[0].$children.length / 2
      for (let x = 0; x < len; x++) {
        this.$children[3].$children[0].$children[x].$children[0].$children[0].paramFromParent()
      }
      // this.getAllChild2(aa)
    },
    callMethodChild2GetDataBy () {
      setTimeout(() => {
        let data = this.$store.getters.GetPage1Data
        this.$children[1].$children[0].$children[this.getTabIndex - 1].$children[0].$children[0].getDataBy(data)
        this.$forceUpdate()
      }, 800)
    },
    callMethodChild3GetDataBy () {
      setTimeout(() => {
        let data = this.$store.getters.GetPage2Data
        this.$children[2].$children[0].$children[this.getTabIndex - 1].$children[0].$children[0].getDataBy(data)
        this.$forceUpdate()

        this.callMethodChild2GetDataBy()
      }, 800)
    },
    setDataToToolbar (datax) {
      // set data to toolbar
      this.$children[0].$children[0].setRowSelected(datax)
    },
    ValidasiPage(){
      // alert('validasi :'+this.getPageLevel)
      // alert(JSON.stringify(data))
      this.dataState.PageLevel = this.getPageLevel
      this.dataState.state = this.getStatus
      this.dataState.TabIndex = this.getTabIndex
      // alert('ToOpen :'+JSON.stringify(data))
      // EventBus.$emit('ebActiveForm', data.PageLevel)
     
      var Events = this.getEventStatus.toUpperCase()//data.Event.toUpperCase()
      // alert(Events)
      // console.log('validasipage '+Events,this.dataState)
      var datax = {
        pageLevel: this.getPageLevel,
        tabIndex: this.getTabIndex
      }
      // this.$store.commit('setLevel', data.PageLevel)
      // this.$store.commit('setEventStatus', data.Event)
      if (Events == 'NEW' || Events == 'EDIT') {
        this.$store.commit('setListDisable', true)
      } else {
        this.$store.commit('setListDisable', false)
      }
     
    //  alert(Events)
      // if(Events !=='ROWCLICK'){
      //    EventBus.$emit('ebActiveForm', data.PageLevel)
      //   EventBus.$emit('ebActiveTab', data)
      // }
      // alert(this.getPageLevel)
      if (this.getPageLevel == '1') {//PAGE1
        // this.$children[2].setTabIndex()
        // alert(data.PageLevel)
        // if(Events=='NEW'){
        //     this.FormLevel2 = false
        //     this.FormLevel3 = false
        // }
        if (Events == 'ROWCLICK') {
          this.setDataToToolbar(datax)
          // alert(Events)
          // alert(Events)          
          this.FormLevel2 = true
          this.FormLevel3 = false
          // alert(this.FormLevel2)
          // setTimeout(function() {
            // EventBus.$emit('HeaderPage', data.Key)
            // looping children tab untuk mengeset datanya
            
            // this.callMethodChild2(data.Key)
            this.callMethodChild2()
          // },700)
          
          // EventBus.$emit('ebRowSelect', datax)
        }
        if(Events=='REFRESH' || Events=='DELETE' || Events=='NEW' || Events=='PAGESIZE' || Events=='UPDATE'
              || Events=='PAGINATION' || Events=='HEADTABLE' || Events=='SAVE' || Events=='POST' || Events=='ONSEARCHENTER'){
            this.FormLevel2 = false
            this.FormLevel3 = false
        }
        if(Events=='CANCEL'){
          // EventBus.$emit('activeForm_page2',false)
          this.FormLevel3 = false
        }
        // EventBus.$emit('ebFormType', this.listHeader[data.TabIndex - 1].FormType)
      } else if (this.getPageLevel == '2') {//PAGE2
        // this.$children[3].setTabIndex()
        // alert(data.PageLevel)
        // if(Events=='NEW'){
        //     // this.FormLevel2 = false
        //     this.FormLevel3 = false
        // }
        
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
          // this.$store.commit('SetPage2Data', data.Key)
          this.callMethodChild3()
          //  setTimeout(function() {
          //    EventBus.$emit('HeaderChildPage', data.Key)
          //  },700)
          // EventBus.$emit('ebRowSelect', datax)
        }
        if(Events=='REFRESH' || Events=='DELETE' || Events=='NEW' || Events=='PAGESIZE' || Events=='UPDATE'
              || Events=='PAGINATION' || Events=='HEADTABLE' || Events=='SAVE' || Events=='ONSEARCHENTER'){
            // this.FormLevel2 = false
            this.FormLevel3 = false
            if (Events == 'SAVE' || Events == 'UPDATE') {
              this.callMethodChild2GetDataBy()
            }
        }
        if(Events=='CANCEL'){
          // EventBus.$emit('activeForm_page3',false)
          this.FormLevel3 = false
        }
        // EventBus.$emit('ebFormType', this.listDetail[data.TabIndex - 1].FormType)
      } else if(this.getPageLevel=='3') {//PAGE3
        // alert(data.PageLevel)
        // alert(this.FormLevel3)
        this.FormLevel3 = true
        if (Events=='ROWCLICK') {
          this.setDataToToolbar(datax)
          // EventBus.$emit('ebRowSelect', datax)
        }

        if (Events=='REFRESH' || Events=='DELETE' || Events=='NEW' || Events=='PAGESIZE' || Events=='UPDATE'
              || Events=='PAGINATION' || Events=='HEADTABLE' || Events=='SAVE' || Events=='ONSEARCHENTER'){
            if (Events == 'SAVE' || Events == 'UPDATE') {
              this.callMethodChild3GetDataBy()
            }
        }
        
        // EventBus.$emit('ebFormType', this.listChild[data.TabIndex - 1].FormType)
        // if(Events=='refresh'){
        //     // this.FormLevel2 = false
        //     // this.FormLevel3 = false
        // }
      }
    },
    ListenerEBData(){
      let data = this.$store.getters.GetEbData
    },
    ActiveDiv (data) {
      if (this.getStatus.toUpperCase() == 'NEW'||this.getStatus.toUpperCase()=='EDIT') {
        if (this.getPageLevel !== data) {
          return
        }
      } else {
        // alert(data)
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
        ParamWhere: "ParentSequenceNo = '" + data.QuerySequenceNo + "'"
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
        ParamWhere: "ParentSequenceNo = '" + data.QuerySequenceNo + "'"
      }
      this.postEncode(this.getUrlTab(), param)
      .then((response) => {
        if(response == null) return
        this.listChild = response.Data
      })
    }
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
    this.$store.getters.valueEBData
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
    this.$store.getters.valueEBData
  },
  updated: function() {
  },
  beforeDestroy: function() {
  },
  
  destroyed: function() {
  }
}
</script>