<template>
  <div>
    <!-- <HeaderFormList
            @new="doNew"
            @edit="doEdit"
            @delete="doDelete"
            @save="doSave"
            @cancel="doCancel"
            @refresh="doRefresh"
            @post="doPost"
            @export="doExport"
            @columns="doColumns"
            @advanceFilter="doAdvanceFilter"
            @onSearchEnter="doOnSearchEnter" /> -->
    <HeaderFormList/>

    <!-- body -->
    <div class="content-app-form__body" style=" margin-bottom: 50px !important;">
        <!-- coding body is here -->
        <!-- {{dataState}} -->
      <div @click="ActiveDiv('1')">
        <ABSTabs :tabPath="prop.tabPath" :listTab="listHeader" PageLevel='1' />
      </div>
      <!-- {{listDetail}} -->
      <div @click="ActiveDiv('2')" v-show="FormLevel2 && listDetail[0]">
        <!-- <ABSTabs v-show="listDetail != null" tabPath='views/Tabs2/' :listTab="listDetail" PageLevel='2' /> -->
        <ABSTabs v-show="FormLevel2" :tabPath="prop.tabPath2" :listTab="listDetail" PageLevel='2' />
      </div>
      <!-- {{listChild}} -->
      <div @click="ActiveDiv('3')" v-show="FormLevel3  && listChild[0]">
        <!-- <ABSTabs v-show="listChild != null" tabPath='views/Tabs2/' :listTab="listChild" PageLevel='3' /> -->
        <ABSTabs v-show="FormLevel3" :tabPath="prop.tabPath3" :listTab="listChild" PageLevel='3' />
      </div>
    </div>
  </div>
</template>

<script>
import {EventBus} from '../../main'

export default {
  props: {
    prop: {
      tabPath: '', tabPath2: null, tabPath3: null
    }
  },
  data() {
    return {
      PageLevel: '1',
      FormLevel2: false,
      FormLevel3: false,
      listHeader: [],
      listDetail: [],
      listChild: [],
      TabIndex: '1',
      dataState:{
        state:'firstload',
        PageLevel:'1',
        TabIndex:'1'
      }
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
    ActiveDiv (data) {
      // console.table(this.dataState)
      if(this.dataState.state=='new' || this.dataState.state=='edit'){
        if(this.dataState.PageLevel !== data){
            this.PageLevel = this.dataState.PageLevel
            return
        }
      }else{
        this.PageLevel = data
        EventBus.$emit('ebActiveForm', data)
        // this.dataState.state='divclick'
      }
     
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
    doGetTabDetail (param) {
      var param = {
        OptionSeq: this.getOptionSeq().OptionSeq,
        ParamWhere: "ParentSequenceNo = '" + param.QuerySequenceNo + "'"
      }

      this.postEncode(this.getUrlTab(), param)
      .then((response) => {
        if(response == null) return
        this.listDetail = response.Data       
      })
    },
    doGetTabChild (param) {
      var param = {
        OptionSeq: this.getOptionSeq().OptionSeq,
        ParamWhere: "ParentSequenceNo = '" + param.QuerySequenceNo + "'"
      }

      this.postEncode(this.getUrlTab(), param)
      .then((response) => {
        if(response == null) return

        this.listChild = response.Data
      })
    }
  },
  beforeCreate: function () {
  },
  created: function() {

    EventBus.$on('ToOpen', (data) => {
      // console.log(data)
      // alert(data.PageLevel)
      // alert(JSON.stringify(data))
      this.dataState.PageLevel = data.PageLevel
      this.dataState.state = data.Event
      this.dataState.TabIndex = data.TabIndex
      // alert('ToOpen :'+JSON.stringify(data))
      // EventBus.$emit('ebActiveForm', data.PageLevel)
     
      var Events = data.Event.toUpperCase()
      var datax = {
        PageLevel: data.PageLevel,
        TabIndex: data.TabIndex
      }

      // if(Events !=='ROWCLICK'){
      //    EventBus.$emit('ebActiveForm', data.PageLevel)
      //   EventBus.$emit('ebActiveTab', data)
      // }
      if (data.PageLevel.toUpperCase() == '1') {//PAGE1
        // alert(data.PageLevel)
        // if(Events=='NEW'){
        //     this.FormLevel2 = false
        //     this.FormLevel3 = false
        // }

        if (Events == 'ROWCLICK') {
          this.FormLevel2 = true
          this.FormLevel3 = false
          setTimeout(function() {
            EventBus.$emit('HeaderPage', data.Key)
          },700)
          
          EventBus.$emit('ebRowSelect', datax)
        }

        if(Events=='REFRESH' || Events=='DELETE' || Events=='NEW' || Events=='PAGESIZE'
              || Events=='PAGINATION' || Events=='HEADTABLE' || Events=='SAVE' || Events=='POST'){
            this.FormLevel2 = false
            this.FormLevel3 = false
        }

        if(Events=='CANCEL'){
          EventBus.$emit('activeForm_page2',false)
          this.FormLevel3 = false
        }
        // EventBus.$emit('ebFormType', this.listHeader[data.TabIndex - 1].FormType)

      } else if (data.PageLevel.toUpperCase() == '2') {//PAGE2
        // alert(data.PageLevel)
        // if(Events=='NEW'){
        //     // this.FormLevel2 = false
        //     this.FormLevel3 = false
        // }
        
        if (Events == 'ROWCLICK') {
          this.FormLevel3 = true
           setTimeout(function() {
             EventBus.$emit('HeaderChildPage', data.Key)
           },700)

          EventBus.$emit('ebRowSelect', datax)
        }

        if(Events=='REFRESH' || Events=='DELETE' || Events=='NEW' || Events=='PAGESIZE'
              || Events=='PAGINATION' || Events=='HEADTABLE' || Events=='SAVE'){
            // this.FormLevel2 = false
            this.FormLevel3 = false
        }

        if(Events=='CANCEL'){
          EventBus.$emit('activeForm_page3',false)
          this.FormLevel3 = false
        }
        // EventBus.$emit('ebFormType', this.listDetail[data.TabIndex - 1].FormType)

      } else if(data.PageLevel.toUpperCase()=='3') {//PAGE3
        // alert(data.PageLevel)
        // alert(this.FormLevel3)
        this.FormLevel3 = true
        if (Events=='ROWCLICK') {
          EventBus.$emit('ebRowSelect', datax)
        }
        
        // EventBus.$emit('ebFormType', this.listChild[data.TabIndex - 1].FormType)
        // if(Events=='refresh'){
        //     // this.FormLevel2 = false
        //     // this.FormLevel3 = false
        // }
      }
    })
    EventBus.$on('ebActiveTab', (data) => {
      this.dataState.TabIndex = data.TabIndex
      // alert('ebActiveTab '+JSON.stringify(data))
      var dt ={
        active : false,
        TabIndex : data.TabIndex,
        PageLevel : data.PageLevel
      }
      EventBus.$emit('activeForm_'+data.PageLevel,dt)
      // alert(JSON.stringify(data))
      // alert(data.PageLevel)
      // alert(this.PageLevel)
      if(data.PageLevel=='1'){
        this.FormLevel2 = false
        this.FormLevel3 = false
      } else if(data.PageLevel=='2'){
        this.FormLevel3 = false
      }
      // this.doGetTabDetail(data)
    })
    EventBus.$on('ebTabDetail', (data) => {      
      this.doGetTabDetail(data)
    })

    // EventBus.$on('ebTabDetailClear', (data) => {
    //   this.listDetail = []
    // })
    
    EventBus.$on('ebTabChild', (data) => {
      this.doGetTabChild(data)
    })

    // EventBus.$on('ebTabChildClear', (data) => {
    //   this.listChild = []
    // })
  },
  beforeMount: function() {
  },
  mounted: function() {
    // EventBus.$emit('ebActiveForm', this.PageLevel)
    // setTimeout (function () {
    //     EventBus.$emit('ebActiveForm', '1')
    // },500)
    this.doGetTabHeader()
  },
  beforeUpdate: function() {
  },
  updated: function() {
  },
  beforeDestroy: function() {
    EventBus.$off('ToOpen')
    EventBus.$off('ebActiveTab')

    EventBus.$off('ebTabDetail')
    // EventBus.$off('ebTabDetailClear')
    
    EventBus.$off('ebTabChild')
    // EventBus.$off('ebTabChildClear')
  },
  destroyed: function() {
  }
}
</script>