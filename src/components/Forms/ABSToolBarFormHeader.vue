<template>
  <!-- <div class="col-padding"> -->
        <!-- <ABSButton icon="plus" text=" New" classButton="btnList__btnPrimary" classIcon="icon-style-1" @click="doNew" :disabled="isNew"/>
        <ABSButton icon="edit" text=" Edit" classButton="btnList__btnPrimary" classIcon="icon-style-1" @click="doEdit" :disabled="isNew"/>
        <ABSButton icon="save" text=" Save" classButton="btnList__btnPrimary" classIcon="icon-style-1" @click="doSave" :disabled="!isNew"/>
        <ABSButton icon="ban" text=" Cancel" classButton="btnList__btnPrimary" classIcon="icon-style-2" @click="doCancel" :disabled="!isNew"/>
        <ABSButton icon="trash-alt" text=" Delete" classButton="btnList__btnRed" classIcon="icon-style-2" @click="doDelete" :disabled="isNew"/>|

        <b-button @click="doAttachment" size="sm" class="btnList__btnDisabled" disabled="disabled"><font-awesome-icon icon="paperclip" /> Attachment</b-button>
        <b-button @click="doAdditionalInfo" size="sm" class="btnList__btnDisabled" disabled="disabled"><font-awesome-icon icon="info-circle" /> Additional Info</b-button>

        <b-button v-if="index < 2" v-for="(btn, index) in buttons" :key="btn.id" @click="doClickExtraButton(btn.id)" 
        size="sm" class="btn__btnPrimary"><font-awesome-icon :icon="btn.icon" />{{btn.text}}</b-button>

        <b-button v-if="index == 2" v-for="(btn, index) in buttons" :key="index" @click="doClickMoreButton" 
        size="sm" class="btn__btnPrimary">>></b-button>

        <div v-if="index > 1" v-for="(btn, index) in buttons" :key="btn.id" @click="doClickExtraButton(btn.id)">
          {{btn.text}}
        </div> -->
    <!-- <b-row class="col-padding">         -->
      <b-row class="header-toolbar">
          <!-- pakai PS -->
          <!-- <b-col sm="9"> -->
            <!-- <ABSButton icon="plus" text="New" classButton="btnList__btnPrimary" classIcon="icon-style-1" @click="doNew" :disabled="statusFunction[0].disabled" />
            <ABSButton icon="edit" text="Edit" classButton="btnList__btnPrimary" classIcon="icon-style-1" @click="doEdit" />
            <ABSButton icon="trash-alt" text="Delete" classButton="btnList__btnRed" classIcon="icon-style-2" @click="doDelete" :disabled="statusFunction[2].disabled" />            
            <ABSButton icon="save" text="Save" classButton="btnList__btnPrimary" classIcon="icon-style-1" @click="doSave" />
            <ABSButton icon="ban" text="Cancel" classButton="btnList__btnPrimary" classIcon="icon-style-2" @click="doCancel" />            
            <ABSButton icon="sync" text="Refresh" classButton="btnList__btnPrimary" classIcon="icon-style-1" @click="doRefresh" />
            <ABSButton icon="list" text="Post" classButton="btnList__btnPrimary" classIcon="icon-style-1" @click="doPost" :disabled="statusFunction[4].disabled" />
            <ABSButton icon="file-export" text="Export" classButton="btnList__btnGreen" classIcon="icon-style-3" @click="openModalExport" :disabled="statusFunction[3].disabled" />
            <ABSButton icon="columns" text="Columns" classButton="btnList__btnPrimary" classIcon="icon-style-1" @click="doColumns" />
            <ABSButton icon="columns" text="Advance Filter" classButton="btnList__btnPrimary" classIcon="icon-style-1" @click="doAdvanceFilter" /> -->

            <!-- <b-button size="sm" class="btnList__btnPrimary" disabled="disabled" ><img :src="require(`@/assets/icons/Add.png`)" alt="" style="width:15px; padding-bottom:3px; color:grey;"> New</b-button>
            <b-button size="sm" class="btnList__btnPrimary"><img :src="require(`@/assets/icons/Modify.png`)" alt="" style="width:15px; padding-bottom:3px;"> Edit</b-button>
            <b-button size="sm" class="btnList__btnPrimary"><img :src="require(`@/assets/icons/Delete.png`)" alt="" style="width:15px; padding-bottom:3px;"> Delete</b-button>
            <b-button size="sm" class="btnList__btnPrimary"><img :src="require(`@/assets/icons/save.png`)" alt="" style="width:15px; padding-bottom:3px;"> Save</b-button>
            <b-button size="sm" class="btnList__btnPrimary"><img :src="require(`@/assets/icons/cancel.png`)" alt="" style="width:15px; padding-bottom:3px;"> Cancel</b-button>
            <b-button size="sm" class="btnList__btnPrimary"><img :src="require(`@/assets/icons/arrow-refresh.png`)" alt="" style="width:15px; padding-bottom:3px;"> Refresh</b-button>
            <b-button size="sm" class="btnList__btnPrimary"><img :src="require(`@/assets/icons/layout_accept.png`)" alt="" style="width:15px; padding-bottom:3px;"> Post</b-button>
            <b-button size="sm" class="btnList__btnPrimary"><img :src="require(`@/assets/icons/Excel.png`)" alt="" style="width:15px; padding-bottom:3px;"> Export</b-button>
            <b-button size="sm" class="btnList__btnPrimary"><img :src="require(`@/assets/icons/table.png`)" alt="" style="width:15px; padding-bottom:3px;"> Column</b-button>
            <b-button size="sm" class="btnList__btnPrimary"><img :src="require(`@/assets/icons/table-edit.png`)" alt="" style="width:15px; padding-bottom:3px;"> Advance Filter</b-button> -->
            
          <!-- </b-col> -->
          <b-col sm="9" v-show="formType==='form'">
            <ABSButton icon="plus" text="New" classButton="btnList__btnPrimary" classIcon="icon-style-1" @click="doNew" :disabled="isNewDisabled" />
            <ABSButton icon="edit" text="Edit" classButton="btnList__btnPrimary" classIcon="icon-style-1" @click="doEdit" :disabled="isNew" />
            <ABSButton icon="trash-alt" text="Delete" classButton="btnList__btnRed" classIcon="icon-style-2" @click="doDelete" :disabled="!isNewDisabled" />
            
            <ABSButton icon="save" text="Save" classButton="btnList__btnPrimary" classIcon="icon-style-1" @click="doSave" :disabled="!isNew" />
            <ABSButton icon="ban" text="Cancel" classButton="btnList__btnPrimary" classIcon="icon-style-2" @click="doCancel" :disabled="!isNew" />
            
            <ABSButton icon="sync" text="Refresh" classButton="btnList__btnPrimary" classIcon="icon-style-1" @click="doRefresh" :disabled="isNew" />
            <!-- <ABSButton icon="list" text="Post" classButton="btnList__btnPrimary" classIcon="icon-style-1" @click="doPost" :disabled="isNew" /> -->
          </b-col>

          <b-col sm="9" v-show="formType===''">
            <ABSButton icon="plus" text="New" classButton="btnList__btnPrimary" classIcon="icon-style-1" @click="doNew" :disabled="isNew" />
            <ABSButton icon="edit" text="Edit" classButton="btnList__btnPrimary" classIcon="icon-style-1" @click="doEdit" :disabled="isNew" />
            <ABSButton icon="trash-alt" text="Delete" classButton="btnList__btnRed" classIcon="icon-style-2" @click="doDelete" :disabled="isNew" />
            
            <ABSButton icon="save" text="Save" classButton="btnList__btnPrimary" classIcon="icon-style-1" @click="doSave" :disabled="!isNew" />
            <ABSButton icon="ban" text="Cancel" classButton="btnList__btnPrimary" classIcon="icon-style-2" @click="doCancel" :disabled="!isNew" />
            
            <ABSButton icon="sync" text="Refresh" classButton="btnList__btnPrimary" classIcon="icon-style-1" @click="doRefresh" :disabled="isNew" />
            <ABSButton icon="list" text="Post" classButton="btnList__btnPrimary" classIcon="icon-style-1" @click="doPost" :disabled="isNew" />
          </b-col>
          
            <!-- <ABSButton icon="file-export" text="Export" classButton="btnList__btnGreen" classIcon="icon-style-3" @click="doExport" :disabled="isNew" />
            <ABSButton icon="columns" text="Columns" classButton="btnList__btnPrimary" classIcon="icon-style-1" @click="doColumns" :disabled="isNew" />
            <ABSButton icon="columns" text="Advance Filter" classButton="btnList__btnPrimary" classIcon="icon-style-1" @click="doAdvanceFilter" :disabled="isNew" /> -->



          <!-- <b-col sm="3">
            {{rowSelected}}
          </b-col> -->
          <!-- <b-col sm="2">
            F= {{activeForm}}
            T= {{activeTab}}
          </b-col> -->
          <!-- <b-col sm="2">
            FT={{formType}}
          </b-col> -->
          <b-col class="search-toolbar">
            <!-- <b-col sm="2"> -->
            <b-form-input
                          id="txtSearch"
                          v-model="search"
                          type="text"
                          placeholder="Search..."          
                          v-shortkey.focus="['f1']" 
                          class="text-field-search"
                          style="margin-bottom: 0px !important;margin-top: 3px !important;"
                          @keyup.enter.native="onSearchEnter"
                          autocomplete="off">
            </b-form-input>
            <font-awesome-icon @click="onSearchEnter" icon="search" class="icon-style-1__searchIcon" style="margin-top: 8px !important;"/>            
          </b-col>
        </b-row>

    <!-- <b-modal id="modalPrevent"
        ref="modal"
        size="lg"
        :title="BreadCrumbs[BreadCrumbs.length - 1].name"
        :hide-footer="true">
             
      <ABSFormSearchList
        @dblClickList="dblClickList"
      ></ABSFormSearchList>
    </b-modal> -->

  <!-- </div> -->
</template>

<script>
import {EventBus} from '../../main'

export default {
  props: {
    buttons: {
      id: String,
      icon: String,
      text: String
    },
    hideBreadcrumbs: false,
    search: null,
    FormAutoFocus: {
      new: String,
      edit: String
    }
  },
  watch: {
    activeTab: function (newData, oldData) {
      // delete old tab if exist, before change new tab
      // if page level 1 change tab, then level 2 and 3 clear
      // if page level 2 change tab, then level 3 clear
      // or
      // if this page level change then > level page clear

      // for (let i = 0; i < this.rowSelected.length; i++) {
      //   // if (this.rowSelected[i].PageLevel === this.activeForm && this.rowSelected[i].TabIndex === oldData) {
      //   //   this.rowSelected.splice(i, 1)
      //   //   // break
      //   // }
      //   var af = this.activeForm.replace('page', '')
      //   var pl = this.rowSelected[i].PageLevel.replace('page', '')
      //   if (pl >= af) {
      //     // remove
      //   }
      // }

      var i = this.rowSelected.length
      while (i--) {
        if (this.rowSelected[i].PageLevel === this.activeForm && this.rowSelected[i].TabIndex === oldData) {
          this.rowSelected.splice(i, 1)
          // break
        } else {
          var af = this.activeForm.replace('page', '')
          var pl = this.rowSelected[i].PageLevel.replace('page', '')

          // var at = this.activeTab
          // var ti = this.rowSelected[i].TabIndex

          // if (at < ti) {

          // }
          if (pl > af) {
            this.rowSelected.splice(i, 1)
          }
        }
      }
    }
  },
  data() {
    return {
      isNew: false,
      params: [],
      BreadCrumbs: [],
      statusFunction : [
        {text:'New', disabled:false},
        {text:'Edit', disabled:false},
        {text:'Delete', disabled:false},
        {text:'Print', disabled:false},
        {text:'Post', disabled:false}
      ],
      activeForm: '1',
      activeTab: '1',
      allFields: null,
      rowSelected: [],
      formType: '',
      isNewDisabled: false
    }
  },
  methods: {
    dblClickList(record,index) {
        this.$refs.modal.hide()
        // localStorage.setItem('statusForm', 'view')
        this.$emit('dblClickSearch', record)
    },
    doNew () {
      var scopeForm = "FormScope_" + this.activeForm + "_" + this.activeTab
      // alert(scopeForm)
      this.$validator.pause()
      this.$nextTick(() => {
        this.$validator.errors.clear(scopeForm)
        this.$validator.resume()
      })
      // alert('new')
      // localStorage.setItem('statusForm', 'new')
      this.isNew = true
      this.$store.commit('setStatus', 'new')
      // EventBus.$emit('ebInput', true);
      // this.$emit('new')
      EventBus.$emit('New_' + this.activeForm + '_' + this.activeTab, true)
      this.disableTab(true)
    },
    doEdit () {
      // cek list click
      var isCanEdit = false

      if (this.formType === 'form') {
        isCanEdit = true
      } else {
        // console.log(this.rowSelected)
        // find data on array, if got it, break and set isCanEdit true
        for (let i = 0; i < this.rowSelected.length; i++) {
          // alert(JSON.stringify(this.rowSelected[i]))
          if (this.rowSelected[i].PageLevel === this.activeForm && this.rowSelected[i].TabIndex === this.activeTab) {
            isCanEdit = true
            break
          }
        }

        if (!isCanEdit) {
          this.alertWarning('No Data Selected')
          return
        }
      }
      
      // alert('edit')
      // localStorage.setItem('statusForm', 'edit')
      this.isNew = true
      // EventBus.$emit('ebInput', true);
      // this.$emit('edit')
      // alert('Edit_' + this.activeForm + '_' + this.activeTab)
      EventBus.$emit('Edit_' + this.activeForm + '_' + this.activeTab, true)
      this.$store.commit('setStatus', 'edit')
      this.disableTab(true)
    },
    doDelete () {      
      this.alertConfirmation("Are You Sure Want To Delete This Data ?")
      .then(ress => {
        if (ress.value) {
          // this.$emit('delete')
          // EventBus.$emit('eb_delete' + this.activeForm)
          EventBus.$emit('Delete_' + this.activeForm + '_' + this.activeTab)
        }
      })
    },
    doSave () {
      var scopeForm = "FormScope_" + this.activeForm + "_" + this.activeTab
      // console.log(this.$validator)
      this.$validator._base.validateAll(scopeForm).then((result) => {
        if (!result) return
        this.alertConfirmation("Are You Sure Want To Save This Data ?")
        .then(ress => {
          if (ress.value) {
            this.$validator.errors.clear(scopeForm)
            EventBus.$emit('Save_' + this.activeForm + '_' + this.activeTab)
            this.disableTab(false)
          }
        })
      })
    },
    doCancel () {
      // var scopeForm = "FormScope_" + this.activeForm + "_" + this.activeTab
      // this.alertConfirmation("Are You Sure Want To Cancel ?")
      // .then(ress => {
      //   if (ress.value) {
      this.isNew = false
      // this.$emit('cancel')
      // this.$validator.pause()
      // this.$nextTick(() => {
      //   this.$validator.errors.clear(scopeForm)
      //   this.$validator.resume()
      // })
      EventBus.$emit('Cancel_' + this.activeForm + '_' + this.activeTab)
      this.$store.commit('setStatus', 'view')
      // EventBus.$emit('ebInput', false)
      this.disableTab(false)
      // localStorage.setItem('statusForm', 'view')
      //   }
      // })
    },
    doRefresh () {
      if(this.activeForm.toUpperCase()=='1'){
        location.reload();
      }else{
        EventBus.$emit('ebGetList' + this.activeForm, '')
      // this.$emit('refresh')
      // alert('Refresh_ dari toll bar ' + this.activeForm + '_' + this.activeTab)
        EventBus.$emit('Refresh_' + this.activeForm + '_' + this.activeTab)
      }
      
    },
    doPost () {
      this.alertConfirmation("Are You Sure Want To Post This Data ?")
      .then(ress => {
        if(ress.value) {
          EventBus.$emit('eb_post' + this.activeForm) //ke ABSList
          
          // Langsung Ke TabDetail
          // EventBus.$emit('ebGetPostList_' + this.activeForm + '_' + this.activeTab, this.$store.getters.getSelectedData)
        }
      })
    },
    onSearchEnter () {
      // EventBus.$emit('ebGetList', this.search)
      // this.$emit('onSearchEnter', this.search)
      EventBus.$emit('ebGetList_' + this.activeForm + '_' + this.activeTab, this.search)
      EventBus.$emit('onSearchEnter_' + this.activeForm + '_' + this.activeTab)
    },
    disableTab (isDisable) {
      // for (var i = 1; i <= 3; i++) {
      //   EventBus.$emit('ebTab_page' + i, isDisable)
      // }
      EventBus.$emit('ebTabDisable', isDisable)
    }
    // doClickExtraButton (id) {
    //   this.$emit('extra', id)
    // },
    // doClickMoreButton () {
    //   // this.$emit('more', id)
    // },
    // doClose () {

    // }
  },
  beforeCreate: function () {
  },
  created: function() {
    EventBus.$on('ClickForm',(data)=>{
      this.isNew = true
      EventBus.$emit('Edit_' + data.PageLevel + '_' + data.TabIndex, true)
      this.disableTab(true)
    })
    EventBus.$on('ebToolbar', (data) => {
      if (data == 'new') {
        this.isNew = true
      } else {
        this.isNew = false
        EventBus.$emit('ebInput', false);
      }
    })
    EventBus.$on('ebActiveForm', (data) => {
      this.activeForm = data
      // this.formScope.page = data + "_"
      this.$emit('GetPageLevel',data)
    })
    EventBus.$on('ebActiveTab', (data) => {
      // this.activeTab = data
      // console.log('form', this.activeForm)
      this.activeTab = data.TabIndex
      // this.formScope.tab = data.TabIndex
      this.$emit('GetTabIndex',data)
    })
    EventBus.$on('ebToolBarDelete', (data) => {
      this.$emit('delete', data)
    })
    EventBus.$on('ebToolBarPost', (data) => {
      this.$emit('post', data)
    })
    EventBus.$on('ebToolBarExport', (data) => {
      this.$emit('export', data)
    })
    // EventBus.$on('ebRowSelect_' + this.activeForm + '_' + this.activeTab, (data) => {
    //   if (data && data!=='') {
    //     this.canEdit = true
    //   }
    // })
    EventBus.$on('ebRowSelect', (data) => {
      // delete data['state']

      // cari data di page level dan tab tersebut ada ga sih row yang ke klik
      // kalau ga ada, push ke array
      // kalau ada di update array tersebut dengan data yang baru (ga usah)
      // kalau page 2 dan 3 di close, maka bersihin array nya yah....
      
      // alert(JSON.stringify(data))
      var isGotIt = false
      for (let i = 0; i < this.rowSelected.length; i++) {
        if (this.rowSelected[i].PageLevel === data.PageLevel && this.rowSelected[i].TabIndex === data.TabIndex) {
          isGotIt = true
          break
        }
      }
      // jika ga list ini belum ke mapping ke array, maka push
      if (!isGotIt) {
        this.rowSelected.push(data)
      }
    })

    EventBus.$on('ebFormType', (data) => {
      this.formType = data.formType
      this.isNewDisabled = data.isNewDisabled
    })
  },
  beforeMount: function() {
  },
  mounted: function() {
    this.allFields = this.$validator._base.fields
    this.BreadCrumbs = this.$route.meta.breadcrumbs

    // if(this.getStatusForm() == 'new') {
    //   this.isNew = true
    // }
    this.noBackButton()
    var dt = this.getOptionSeq().PS.split('')
    dt.forEach((el, idx) => {

      if (idx == 4) {
        if (el == 0) {
          this.statusFunction[idx].text = 'Post'
          this.statusFunction[idx].disabled = true
        }
        else if (el == 1) {
          this.statusFunction[idx].text = 'Post'
          this.statusFunction[idx].disabled = false
        }
        else if (el == 2) {
          this.statusFunction[idx].text = 'Submit'
          this.statusFunction[idx].disabled = true
        }
        else if (el == 3) {
          this.statusFunction[idx].text = 'Submit'
          this.statusFunction[idx].disabled = false
        }
      } else {
        if (el == 0) {
          this.statusFunction[idx].disabled = true
        }
        else if (el == 1) {
          this.statusFunction[idx].disabled = false
        }
      }

    })
    // localStorage.setItem('statusForm', 'view')
  },
  beforeUpdate: function() {
  },
  updated: function() {
  },
  beforeDestroy: function() {
    EventBus.$off('ebToolbar')
    EventBus.$off('ebActiveForm')
    EventBus.$off('ebActiveTab')
    EventBus.$off('ebToolBarDelete')
    EventBus.$off('ebToolBarPost')
    EventBus.$off('ebToolBarExport')
    EventBus.$off('ebTabDisable')
    EventBus.$off('ClickForm')
    // EventBus.$off('ebRowSelect_' + this.activeForm + '_' + this.activeTab)
    EventBus.$off('ebRowSelect')
    EventBus.$off('ebFormType')
  },
  destroyed: function() {
  }
}
</script>