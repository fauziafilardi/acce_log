<template>
  <b-tabs :class="classes" v-model="tabIndex">
    <!-- <b-tab :id="'tab_' + PageLevel + '_' + (index + 1)" v-for="(parent, index) in listTab" :key="index" :title="parent.TabLabel" @click="tabClicked(parent, index + 1)"> -->
    <b-tab :disabled="isTabDisable" v-for="(parent, index) in listTab" :key="PageLevel+'_'+index" :title="parent.QueryName"> <!--@click="tabClicked(parent, (index + 1).toString())"-->
      <ABSTabDetail :tabPath="tabPath" :tabUrl="parent.Url" :data="parent" :PageLevel="PageLevel" :TabIndex="(index + 1).toString()" />
    </b-tab>
  </b-tabs>
</template>

<script>
import {EventBus} from '../../main'
export default {
  props: {listTab: Array, tabPath: String, PageLevel: String},
  data () {
    return {
      activeForm: 'page1',
      classes: '',
      isTabDisable: false,
      tabIndex: 0
    }
  },
  watch: {
    tabIndex: function (newData, oldData) {
      // alert(newData);
      // alert(OldData);
      // alert(newData)
      this.tabClicked(newData + 1)
    },
    listTab: function (newData, oldData) {
      if (this.PageLevel == "page1") {
        this.classes = "ABSTabs__active"
        EventBus.$emit('ebTabDetail', this.listTab[0])
      } else if (this.PageLevel == 'page2') {
        EventBus.$emit('ebTabChild', this.listTab[0])
      }
    }
  },
  
  methods: {
    tabClicked (tabIndex) {
      var dtActiveTab = {TabIndex:tabIndex.toString(),PageLevel:this.PageLevel}
      // EventBus.$emit('ebActiveTab', tabIndex.toString())
      EventBus.$emit('ebActiveForm', this.PageLevel)
      EventBus.$emit('ebActiveTab', dtActiveTab)
      EventBus.$emit('ebGetList_' + this.activeForm + '_' + tabIndex)
      // EventBus.$emit('ebFormType', this.listTab[tabIndex - 1].FormType)

      if (this.PageLevel == 'page1') {
        EventBus.$emit('ebTabDetail', this.listTab[tabIndex - 1])
      }
      else if (this.PageLevel == 'page2') {
        EventBus.$emit('ebTabChild', this.listTab[tabIndex - 1])
      }

    }
  },
  created () {
    EventBus.$on('ebActiveForm', (data) => {
      // console.log('activeForm', data)
      this.activeForm = data
      // this.classes = "ABSTabs__inActive"
      
      if (this.PageLevel == data) {
        this.classes = "ABSTabs__active"

        // var dtActiveTab = {
        //   PageLevel:this.PageLevel,
        //   TabIndex:(this.tabIndex + 1)
        // }
        // EventBus.$emit('ebActiveTab', dtActiveTab)
        var datax = {
          // PageLevel: data,
          TabIndex: (this.tabIndex + 1).toString()
        }
        EventBus.$emit('ebActiveTab', datax)
        // EventBus.$emit('ebFormType', this.listTab[this.tabIndex - 1].FormType)

      } else {
        this.classes = "ABSTabs__inActive"
      }
    })

    // EventBus.$on('ebTab_' + this.PageLevel, (data) => {
    EventBus.$on('ebTabDisable', (data) => {
      this.isTabDisable = data
    })
  },
  beforeDestroy: function() {
    // EventBus.$off('ebActiveForm')
    // EventBus.$off('ebTab_' + this.PageLevel)
    // EventBus.$off('ebTab_' + this.PageLevel + '_' + tabIndex)
  },
  mounted () {
    // if (this.PageLevel == "page1") {
    //   this.classes = "ABSTabs__active"
    //   alert('mounted')
    //   console.table(this.listTab[0])
    //   EventBus.$emit('ebTabDetail', this.listTab[0])
    // }


    // this.tabClicked(1)
// alert(this.PageLevel + '_' + 1)
    // var dtActiveTab = {TabIndex:'1',PageLevel:'page1'}
    // EventBus.$emit('ebActiveForm', 'page1')
    // EventBus.$emit('ebActiveTab', dtActiveTab)
    // if (this.PageLevel == 'page1') {
    //   alert('lol')
    //   console.table(this.listTab[tabIndex - 1])
    //   EventBus.$emit('ebTabDetail', this.listTab[tabIndex - 1])
    // }
  }
}
</script>