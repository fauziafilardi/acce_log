<template>
  <b-row class="header-toolbar">
    <!-- <b-col sm="9" v-show="formType=='Form'">
      <ABSButton
        :text="statusFunction[0].text"
        icon="plus"
        classButton="button button--new"
        classIcon="icon-style-1"
        @click="doNew"
        :disabled="statusFunction[0].disabled||isNewDisabled"
      />
      <ABSButton
        :text="statusFunction[1].text"
        icon="edit"
        classButton="button button--edit"
        classIcon="icon-style-1"
        @click="doEdit"
        :disabled="statusFunction[1].disabled||isNew"
      />
      <ABSButton
        :text="statusFunction[2].text"
        icon="trash-alt"
        classButton="button button--delete"
        classIcon="icon-style-2"
        @click="doDelete"
        :disabled="statusFunction[2].disabled||!isNewDisabled"
      /> 
      <ABSButton
        :text="statusFunction[5].text"
        icon="save"
        classButton="button button--save"
        classIcon="icon-style-1"
        @click="doSave"
        :disabled="!isNew||statusFunction[5].disabled"
      />
      <ABSButton
        :text="statusFunction[6].text"
        icon="ban"
        classButton="button button--cancel"
        classIcon="icon-style-2"
        @click="doCancel"
        :disabled="!isNew||statusFunction[6].disabled"
      />
      <ABSButton
        text="Refresh"
        icon="sync"
        classButton="button button--refresh"
        classIcon="icon-style-1"
        @click="doRefresh"
        :disabled="isNew"
      />
    </b-col> -->
    <b-col lg="9" md="9" sm="12">
      <ABSButton
        :text="statusFunction[0].text"
        icon="plus"
        classButton="button button--new"
        classIcon="icon-style-1"
        @click="doNew"
        :disabled="statusFunction[0].disabled||isNew||!newStatus"
      />
      <ABSButton
        :text="statusFunction[1].text"
        icon="edit"
        classButton="button button--edit"
        classIcon="icon-style-1"
        @click="doEdit"
        :disabled="statusFunction[1].disabled||isNew||isCannotEdit||!editStatus"
      />
      <ABSButton
        :text="statusFunction[2].text"
        icon="trash-alt"
        classButton="button button--delete"
        classIcon="icon-style-2"
        @click="doDelete"
        :disabled="statusFunction[2].disabled||isNew||isCannotDelete||!deleteStatus"
      />
      <!-- ||isCannotDelete -->
      <ABSButton
        text="Save"
        icon="save"
        classButton="button button--save"
        classIcon="icon-style-1"
        @click="doSave"
        :disabled="statusFunction[5].disabled||!isNew"
      />
      <ABSButton
        text="Cancel"
        icon="ban"
        classButton="button button--cancel"
        classIcon="icon-style-2"
        @click="doCancel"
        :disabled="statusFunction[6].disabled||!isNew"
      />
      <ABSButton
        text="Refresh"
        icon="sync"
        classButton="button button--refresh"
        classIcon="icon-style-1"
        @click="doRefresh"
        :disabled="statusFunction[7].disabled&&isNew"
      />
      <ABSButton
        :text="statusFunction[4].text"
        icon="list"
        classButton="button button--post"
        classIcon="icon-style-1"
        @click="doPost"
        :disabled="statusFunction[4].disabled||isNew||isCannotDelete"
      />
      <!-- {{statusFunction[4].disabled}}
      {{isNew}}
      {{isCannotDelete}} -->
    </b-col>
          
      <!-- <ABSButton icon="file-export" text="Export" classButton="btnList__btnGreen" classIcon="icon-style-3" @click="doExport" :disabled="isNew" />
      <ABSButton icon="columns" text="Columns" classButton="btnList__btnPrimary" classIcon="icon-style-1" @click="doColumns" :disabled="isNew" />
      <ABSButton icon="columns" text="Advance Filter" classButton="btnList__btnPrimary" classIcon="icon-style-1" @click="doAdvanceFilter" :disabled="isNew" /> -->

    <!-- <b-col class="search-toolbar" v-show="!getIsPopup() || !isSearchDisable"> -->
    <b-col class="search-toolbar" v-show="!isSearchDisable && !getIsPopup()">
      <!-- {{isSearchDisable}} -->
      <b-form-input
        id="txtSearch"
        v-model="search"
        type="text"
        placeholder="Search...."
        v-shortkey.focus="['f1']"
        class="text-field-search"
        @keyup.enter.native="onSearchEnter"
        autocomplete="off"
        :disabled="isSearchDisable"
      >
      </b-form-input>
      <font-awesome-icon @click="onSearchEnter" icon="search" class="icon-style-1__searchIcon" style="margin-top: 10px !important;"/>            
      <!-- {{formType + '-' + isNew}} -->
    </b-col>
    <ABSLoader />
  </b-row>
</template>

<script>

export default {
  computed: {
    pageLevel () {
      return this.$store.getters.getLevel
    },
    tabIndex () {
      return this.$store.getters.getTab
    },
    formType () {
      if (this.$store.getters.getFormType == "Form" || this.$store.getters.getFormType == "Inquiry") {
        this.isSearchDisable = true
      } else {
        this.isSearchDisable = false
      }
      return this.$store.getters.getFormType
    },
    newStatus () {
      return this.$store.getters.getNewStatus
    },
    editStatus () {
      return this.$store.getters.getEditStatus
    },
    deleteStatus () {
      return this.$store.getters.getDeleteStatus
    }
    // isByPassCancel () {
    //   return this.$store.getters.getByPassCancel
    // },
    // clickCheckBoxCount () {
    //   return this.$store.getters.getCheckBoxClickCount
    // }
  },
  props: {
    buttons: {
      id: String,
      icon: String,
      text: String
    },
    hideBreadcrumbs: false,
    // search: '',
    FormAutoFocus: {
      new: String,
      edit: String
    },
    isProcess: Boolean
  },
  watch: {
    formType: function (newData, oldData) {
      this.isCannotEdit = this.isCanEdit()
      this.checkBoxCount()
      this.isGrid()
      this.isListEdit()
    },
    pageLevel: function (newData, oldData) {
      this.isCannotEdit = this.isCanEdit()
      this.checkBoxCount()
      this.search = this.$store.getters['getSearch' + this.pageLevel]
      this.isGrid()
      this.isListEdit()
    },
    tabIndex: function (newData, oldData) {
      this.isCannotEdit = this.isCanEdit()
      this.checkBoxCount()
      this.isGrid()
      this.isListEdit()
    },
    search: function (newData, oldData) {
      this.$store.commit('setSearch' + this.pageLevel, this.search)
    },
    // clickCheckBoxCount: function (newData, oldData) {
    //   if (this.clickCheckBoxCount > 0 ) {
    //     this.isCannotDelete = false
    //   } else {
    //     this.isCannotDelete = true
    //   }
    // },
  },
  data() {
    return {
      isByPassCancel: false,
      isNew: false,
      params: [],
      BreadCrumbs: [],
      statusFunction : [
        {text:'Add', disabled:true},
        {text:'Edit', disabled:true},
        {text:'Delete', disabled:true},
        {text:'Print', disabled:true},
        {text:'Process', disabled:true},
        {text:'Save', disabled:false},
        {text:'Cancel', disabled:false},
        {text:'Refresh', disabled:false}
      ],
      allFields: null,
      rowSelected: [],
      // formType: '',
      isNewDisabled: false,
      isSearchDisable: false,
      FormStatus: 'NEW',
      search: '',
      isCannotEdit: true,
      isCannotDelete: true,
      checkBox: [],
      dontCallProcessPS: false
    }
  },
  methods: {
    isGrid () {
      if (this.formType == 'Grid') {
        this.isCannotEdit = false
      }
    },
    isListEdit () {
      if (this.formType == 'ListEdit') {
        this.isCannotEdit = false
      }
    },
    checkBoxCount () {
      for (let i = 0; i < this.checkBox.length; i++) {
        if (this.checkBox[i].pageLevel == this.pageLevel && this.checkBox[i].tabIndex == this.tabIndex) {
          if (this.checkBox[i].checkBoxCount > 0 ) {
            this.isCannotDelete = false
          } else {
            this.isCannotDelete = true
          }
          break
        }
      }
    },
    setCheckBoxClick (row) {
      // console.log(this.statusFunction[4])
      // console.log(this.isCannotDelete)
      // console.log(this.isNew)
      if (this.checkBox.length > 0) {
        var isGotIt = false
        for (let i = 0; i < this.checkBox.length; i++) {
          if (this.checkBox[i].pageLevel == this.pageLevel && this.checkBox[i].tabIndex == this.tabIndex) {
            this.checkBox[i].checkBoxCount = row.checkBoxCount
            if (this.checkBox[i].checkBoxCount > 0 ) {
              this.isCannotDelete = false
            } else {
              this.isCannotDelete = true
            }
            isGotIt = true
            break
          }
        }
        if (!isGotIt) {
          this.checkBox.push(row)
          this.isCannotDelete = false
        }
      } else {
        this.checkBox.push(row)
        this.isCannotDelete = false
      }
    },
    unselectRow (row) {
      var i = this.rowSelected.length

      if (row == undefined) {
        return
      }
      while (i--) {
        if (this.rowSelected[i].pageLevel == row.pageLevel && this.rowSelected[i].tabIndex == row.tabIndex) {
          this.rowSelected.splice(i, 1)
          if (this.formType == "List") {
            this.getChild().$children[0].$children[0].unselectRowClicked()
          }
          break
        }
      }
      this.isCannotEdit = this.isCanEdit()
    },
    unselectRowAfterRowClick () {
      var i = this.rowSelected.length
      while (i--) {
        var pl = this.rowSelected[i].pageLevel
        var af = this.pageLevel

        if (pl > af) {
          this.rowSelected.splice(i, 1)
        }
      }
    },
    setRowSelected (row) {
      // cari data row di page level dan tab tersebut ada ga sih row yang ke klik
      // kalau ga ada, push ke array
      // kalau ada di update array tersebut dengan data row yang baru (ga usah)
      // kalau page 2 dan 3 di close, maka bersihin array nya yah....
      if (this.isProcess == true) {
        return
      }
      
      var isGotIt = false
      for (let i = 0; i < this.rowSelected.length; i++) {
        if (this.rowSelected[i].pageLevel === row.pageLevel && this.rowSelected[i].tabIndex === row.tabIndex) {
          isGotIt = true
          break
        }
      }
      // jika ga list ini belum ke mapping ke array, maka push
      if (!isGotIt) {
        this.rowSelected.push(row)
      }
      this.isCannotEdit = this.isCanEdit()
    },
    setButton (status) {
      this.isNew = status
      this.statusFunction[6].disabled = !status
      this.statusFunction[7].disabled = status
      this.disableTab(status)
      this.search = ''
      if (this.formType == 'Form' || this.formType == 'Inquiry') {
      } else {
        this.isSearchDisable = status
        // if(!status){
        //   document.getElementById("cList").style.height = "64%";
        // }        
      }
    },
    getChild () {
      if (this.isProcess == true) {
        return this.$parent.$parent
      }
      else {
        // return this.$parent.$parent.$children[this.pageLevel].$children[0].$children[this.tabIndex - 1].$children[0].$children[0]
        return this.$parent.$parent.$children[this.pageLevel].$children[0].$children[this.tabIndex - 1].$children[0]
      }
    },
    dblClickList(record,index) {
      this.$refs.modal.hide()
      this.$emit('dblClickSearch', record)
    },
    doNew () {
      this.getChild().getChild().M_ClearForm()
      
      var scopeForm = "FormScope_" + this.pageLevel + "_" + this.tabIndex
      this.$validator.pause()
      this.$nextTick(() => {
        this.$validator.errors.clear(scopeForm)
        this.$validator.resume()
      })
      // this.$validator.errors.clear(scopeForm)
      this.$store.commit('setStatus', 'new')
      this.$store.commit('setEventStatus', 'NEW')
      this.$store.commit('setListDisable', true)
      this.setButton(true)
      this.unselectRowAfterRowClick()

      var rowSelected = this.rowSelected.filter(x => {
        return x.pageLevel == this.pageLevel && x.tabIndex == this.tabIndex
      })

      this.unselectRow(rowSelected[0])
      this.$store.commit('SetPage' + this.pageLevel + 'Data', undefined)

      this.getChild().M_New()
    },
    doEdit (param = false) {
      this.isByPassCancel = param
      // cek list click
      // var isCanEdit = false

      // if (this.formType === 'Form') {
      //   isCanEdit = true
      // } else {
      //   // find data on array, if got it, break and set isCanEdit true
      //   for (let i = 0; i < this.rowSelected.length; i++) {
      //     // alert(JSON.stringify(this.rowSelected[i]))
      //     if (this.rowSelected[i].pageLevel == this.pageLevel && this.rowSelected[i].tabIndex == this.tabIndex) {
      //       isCanEdit = true
      //       break
      //     }
      //   }

      //   if (!isCanEdit) {
      //     this.alertWarning('No Data Selected')
      //     return
      //   }
      // }
      
      var scopeForm = "FormScope_" + this.pageLevel + "_" + this.tabIndex
      this.$validator.errors.clear(scopeForm)
      // this.isNew = true

      this.getChild().M_Edit()
      
      this.$store.commit('setStatus', 'EDIT')
      // this.$store.commit('setStatus', {from: this.activeForm + "_" + this.activeTab, status: 'edit'})
      this.$store.commit('setEventStatus', 'EDIT')
      this.$store.commit('setListDisable', true)
      
      // this.disableTab(true)
      this.setButton(true)
    },
    isCanEdit () {
      // cek list click
      var isCanEdit = false

      if (this.formType === 'Form') {
        isCanEdit = true
      } else {
        // find data on array, if got it, break and set isCanEdit true
        for (let i = 0; i < this.rowSelected.length; i++) {
          // alert(JSON.stringify(this.rowSelected[i]))
          if (this.rowSelected[i].pageLevel == this.pageLevel && this.rowSelected[i].tabIndex == this.tabIndex) {
            isCanEdit = true
            break
          }
        }

        // if (!isCanEdit) {
        //   this.alertWarning('No Data Selected')
        //   return
        // }
      }
      return !isCanEdit
    },
    doDelete () {
      this.alertConfirmation("Are You Sure Want To Delete This Data ?")
      .then(ress => {
        if (ress.value) {
          this.$store.commit('setEventStatus', 'DELETE')
          this.getChild().M_Delete()
        }
      })
    },
    doSave () {
      var scopeForm = "FormScope_" + this.pageLevel + "_" + this.tabIndex
      this.$validator._base.validateAll(scopeForm).then((result) => {
        if (!result) return
        this.alertConfirmation("Are You Sure Want To Save This Data ?")
        .then(ress => {
          if (ress.value) {
            this.$store.commit('setEventStatus', 'SAVE')
            this.$validator.errors.clear(scopeForm)
            // this.$store.commit('setStatusLoader', true)
            // console.log(window.opener)
            // window.opener.postMessage(true, '*'); //or false
            // console.log(window.opener.postMessage)
            // // self.close()
            // return
            this.getChild().M_Save()
          }
        })
      })
    },
    doCancel () {
      if (this.getIsPopup()) {
        // alert('otnay')
        self.close()
      }
      if (this.isByPassCancel) {
        this.getChild().M_Cancel(true)
        return
      }
      // if (this.formType == 'Form') {
      //   this.getChild().M_Cancel(true)
      //   return
      // }
      // var statusForm = this.$store.getters.getStatus
      // if (statusForm == 'new') {
      //   // manggil is detail false
      //   this.$parent.$parent.$children[this.pageLevel].$children[0].$children[this.tabIndex - 1].$children[0]._data.isDetail = false
      // }
      this.$store.commit('setEventStatus', 'CANCEL')
      var scopeForm = "FormScope_" + this.pageLevel + "_" + this.tabIndex
      this.$store.commit('setListDisable', false)
      this.$store.commit('setStatus', 'view')
      this.$validator.errors.clear(scopeForm)
      // this.disableTab(false)
      this.setButton(false)
      this.getChild().M_Cancel()
    },
    doRefresh () {
      this.$store.commit('setEventStatus', 'REFRESH')
      if (this.pageLevel == '1') {
        location.reload()
        // history.go(0)
      } else {
        this.search = ""
        this.getChild().M_Refresh()
      }
      
    },
    doPost () {
      if (this.isProcess == true) {
        var scopeForm = "FormScope_" + this.pageLevel + "_" + this.tabIndex
        this.$validator._base.validateAll(scopeForm).then((result) => {
          if (!result) return
          this.alertConfirmation("Are You Sure Want To Process This Data ?")
          .then(ress => {
            if(ress.value) {
              this.$store.commit('setEventStatus', 'POST')
              this.getChild().M_Post()
            }
          })
        })
      } else {
        this.alertConfirmation("Are You Sure Want To Process This Data ?")
        .then(ress => {
          if(ress.value) {
            this.$store.commit('setEventStatus', 'POST')
            this.getChild().M_Post()
          }
        })
      }
    },
    doExport () {
    },
    doColumns () {
      // openModalColumn
      this.$emit('columns')
    },
    doAdvanceFilter () {
      this.$emit('advanceFilter')
    },
    onSearchEnter () {
      if (this.isSearchDisable) return
      this.$store.commit('setEventStatus', 'ONSEARCHENTER')
      // this.$store.commit('setSearch', this.search)
      this.getChild().M_Search(this.search)
    },
    disableTab (status) {
      if (this.isProcess) {
        return
      }
      this.$parent.$parent.$children[1].setTabDisable(status)
      this.$parent.$parent.$children[2].setTabDisable(status)
      this.$parent.$parent.$children[3].setTabDisable(status)
    },
    ProcessPS (PS = null) {
      if (this.dontCallProcessPS) {
       return 
      }
      // console.log(PS)
      this.isByPassCancel = false
      this.isNew = false

      if (this.formType == 'Process') {
        this.isCannotDelete = false
        this.statusFunction[0].disabled = true
        this.statusFunction[1].disabled = true
        this.statusFunction[2].disabled = true
        this.statusFunction[3].disabled = true
        this.statusFunction[4].text = 'Process'
        this.statusFunction[4].disabled = false

        this.PS(PS)
      }
      else if (this.formType == 'Form') {
        if (this.FormStatus == 'EDIT') {
          this.statusFunction[0].disabled = true
          this.statusFunction[1].disabled = false
          this.statusFunction[2].disabled = true
          this.statusFunction[3].disabled = true
          this.statusFunction[4].text = 'Process'
          this.statusFunction[4].disabled = true
          // this.statusFunction[7].disabled = false
        }
        else {
          this.statusFunction[0].disabled = false
          this.statusFunction[1].disabled = true
          this.statusFunction[2].disabled = true
          this.statusFunction[3].disabled = true
          this.statusFunction[4].text = 'Process'
          this.statusFunction[4].disabled = true

          this.PS(PS)
        }
      }
      else if (this.formType == 'List') {
        this.statusFunction[0].disabled = false
        this.statusFunction[1].disabled = false
        this.statusFunction[2].disabled = false
        this.statusFunction[3].disabled = false
        this.statusFunction[4].text = 'Process'
        this.statusFunction[4].disabled = true
        
        this.PS(PS)
      }
      else if (this.formType == 'ListProcess') {
        this.statusFunction[0].disabled = false
        this.statusFunction[1].disabled = false
        this.statusFunction[2].disabled = false
        this.statusFunction[3].disabled = false
        this.statusFunction[4].text = 'Process'
        this.statusFunction[4].disabled = false

        this.PS(PS)
      }
      else if (this.formType == 'View' || this.formType == 'Inquiry') {
        if (this.formType == 'View') {
          this.$store.commit('setEventStatus', 'VIEW')
          this.$store.commit('setStatus','View')
          this.setButton(false)
          // this.$store.commit('setListDisable', true)
        }

        this.statusFunction[0].disabled = true
        this.statusFunction[1].disabled = true
        this.statusFunction[2].disabled = true
        this.statusFunction[3].disabled = true
        this.statusFunction[4].text = 'Process'
        this.statusFunction[4].disabled = true

        this.PS(PS)
      }
      else if (this.formType== 'ListEdit') {
        this.isNew = true
        //cek
        this.statusFunction[0].disabled = true
        this.statusFunction[1].disabled = true
        this.statusFunction[2].disabled = true
        this.statusFunction[3].disabled = true
        this.statusFunction[4].text = 'Process'
        this.statusFunction[4].disabled = true
        this.$store.commit('setListDisable', false)
        // this.isNew = true
        this.statusFunction[6].disabled = true
        this.$store.commit('setStatus', 'EDIT')
        this.$store.commit('setEventStatus', 'EDIT')
        // this.statusFunction[7].disabled = true

        // this.PS(PS)
      }
      else if (this.formType == 'Grid') {
        this.isCannotEdit = false
        this.statusFunction[0].disabled = true
        this.statusFunction[1].disabled = false
        this.statusFunction[2].disabled = false
        this.statusFunction[3].disabled = false
        this.statusFunction[4].text = 'Process'
        this.statusFunction[4].disabled = true
        
        this.PS(PS)
      }
    },
    PS (PS = null) {
      // 1 = disabled false
      var dt = ''
      var forPS = PS?PS:this.getOptionSeq().PS

      if(forPS && forPS !== '' && forPS !== undefined){
        dt = forPS.split('')
      }
      else {
        dt = [1,1,1,1,1]
      }

      // Codingan PS menu && tab
      if (this.$store.getters.getPsMenu == null) {
        var event = this.getMenu().event_with_child
        var url = this.$route.path
        var ps_local = ''
        var isGotIt = false
        // var arrFilter = event.filter(function(menu) {

        //   var x = menu.child.filter(function(child) {
        //     var menu = child.menu_url
        //     if (menu.includes(url)) {
        //       ps_local = child
        //       // return menu
        //     }
        //   })
        // })

        for (let i = 0; i < event.length; i++) {
          // if (dt[i] == 1 && menu[i] == 1) {
          //   dt2.push(1)
          // }
          var child = event[i].child
          for (let j = 0; j < child.length; j++) {
            var menu = child[j].menu_url
            // var menu = child[j]
            if (menu.includes(url)) {
              ps_local = child[j]
              isGotIt = true
              break
            }
          }
          if (isGotIt) {
            break
          }
        }
        this.$store.commit('setPsMenu', ps_local)
      }

      var menu = this.$store.getters.getPsMenu.ps
      if (menu != null) {
        menu = menu.split('')

        var dt2 = []
        for (let x = 0; x < menu.length; x++) {
          // 1	1	1	1	1
          // add    this.statusFunction[0]
          // edit   this.statusFunction[1]
          // delete this.statusFunction[2]
          // print  this.statusFunction[]
          // view   this.statusFunction[4]
          // console.log(x + ' => ' + dt[x] + ' -> ' + menu[x] + ' -> ' + this.statusFunction[x].disabled)
          if (dt[x] == "1" && menu[x] == "1" && this.statusFunction[x].disabled == false) {
            dt2.push(1)
          } else {
            dt2.push(0)
          }
        }
        if (dt2.length > 0) {
          dt = dt2
        }

        // console.log(dt)
        // console.log(menu)
        // console.log(this.statusFunction)
        // console.log(dt2)
      }
      
      // Button 0:New, 1:Edit, 2:Delete
      if (dt[0]==0) this.statusFunction[0].disabled = true
      if (dt[1]==0) this.statusFunction[1].disabled = true
      if (dt[2]==0) this.statusFunction[2].disabled = true

      //Button POST
      // console.log(dt[4])
      if (dt[4] == 0) {
        this.statusFunction[4].text = 'Process'
        this.statusFunction[4].disabled = true
      }
      else if (dt[4] == 1) {
        this.statusFunction[4].text = 'Process'
        this.statusFunction[4].disabled = false
      }
      else if (dt[4] == 2) {
        this.statusFunction[4].text = 'Submit'
        this.statusFunction[4].disabled = true
      }
      else if (dt[4] == 3) {
        this.statusFunction[4].text = 'Submit'
        this.statusFunction[4].disabled = false
      }

      if (this.$store.getters.getIsPost) {
        this.statusFunction[4].text = 'Post'
      }

      this.getChild().setToolbarButton()
      
      if (this.getIsPopup()) {
        this.doNew()
      }
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
  },
  beforeMount: function() {
  },
  mounted: function() {
    this.allFields = this.$validator._base.fields
    // this.BreadCrumbs = this.$route.meta.breadcrumbs

    // this.ProcessPS()

    // if(this.getStatusForm() == 'new') {
    //   this.isNew = true
    // }
    this.noBackButton()
    if (this.getIsPopup()) {
      // setTimeout(() => {
        document.getElementById('sidebar-app').style.display = 'none'
        document.getElementById('header--top').style.display = 'none'
        document.getElementById('content-app').style.paddingLeft = '0px'
      // }, 2000)
    }
    // localStorage.setItem('statusForm', 'view')
    // this.getReportGenerator('749RG.xls')
  },
  beforeUpdate: function() {
  },
  updated: function() {
  },
  beforeDestroy: function() {
  },
  destroyed: function() {
  }
}
</script>