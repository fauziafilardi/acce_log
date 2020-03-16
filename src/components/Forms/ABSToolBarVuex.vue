<template>
  <b-row class="header-toolbar">
    <b-col lg="9" md="9" sm="12">
      <ABSButton
        :text="statusFunction[0].text"
        icon="plus"
        classButton="button button--new"
        classIcon="icon-style-1"
        @click="doNew"
        :disabled="statusFunction[0].disabled||isNew"
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
        :disabled="statusFunction[2].disabled||isNew"
      />
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
        :disabled="isNew"
      />
      <ABSButton
        :text="statusFunction[4].text"
        icon="list"
        classButton="button button--post"
        classIcon="icon-style-1"
        @click="doPost"
        :disabled="statusFunction[4].disabled||isNew"
      />
    </b-col>
 
    <b-col v-show="isSearchDisable" class="search-toolbar">
      <b-form-input
        id="txtSearch"
        v-model="search"
        type="text"
        placeholder="Search..."
        v-shortkey.focus="['f1']"
        class="text-field-search"
        @keyup.enter.native="onSearchEnter"
        autocomplete="off"
        :disabled="isSearchDisable"
      >
      </b-form-input>
      <font-awesome-icon @click="onSearchEnter" icon="search" class="icon-style-1__searchIcon" style="margin-top: 10px !important;"/>            
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
      if (this.$store.getters.getFormType == "Form") {
        this.isSearchDisable = true
      }
      return this.$store.getters.getFormType
    },
    // isByPassCancel () {
    //   return this.$store.getters.getByPassCancel
    // }
  },
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
    },
    isProcess: Boolean
  },
  watch: {
    activeTab: function (newData, oldData) {
      
      var i = this.rowSelected.length
      while (i--) {
        if (this.rowSelected[i].pageLevel === this.pageLevel && this.rowSelected[i].tabIndex === oldData) {
          this.rowSelected.splice(i, 1)
          // break
        } else {
          var pl = this.rowSelected[i].pageLevel
          var af = this.pageLevel

          if (pl > af) {
            this.rowSelected.splice(i, 1)
          }
        }
      }
    },
    search: function (newData, oldData) {
      this.$store.commit('setSearch' + this.pageLevel, this.search)
    }
  },
  data() {
    return {
      isByPassCancel: false,
      isNew: false,
      params: [],
      BreadCrumbs: [],
      statusFunction : [
        {text:'New', disabled:true},
        {text:'Edit', disabled:true},
        {text:'Delete', disabled:true},
        {text:'Print', disabled:true},
        {text:'Process', disabled:true},
        {text:'Save', disabled:false},
        {text:'Cancel', disabled:false}
      ],
      allFields: null,
      rowSelected: [],
      // formType: '',
      isNewDisabled: false,
      isSearchDisable: false,
      FormStatus: 'NEW'
    }
  },
  methods: {
    unselectRow (row) {
      var i = this.rowSelected.length
      // var FormType = this.$store.getters.getFormType

      if (row == undefined) {
        return
      }
      while (i--) {
        if (this.rowSelected[i].pageLevel == row.pageLevel && this.rowSelected[i].tabIndex == row.tabIndex) {
            this.rowSelected.splice(i, 1)
            if (this.formType == "List") {
              this.getChild().$children[0].unselectRowClicked()
            }

            break
        }
      }
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
    },
    setButton (status) {
      this.isNew = status
      this.disableTab(status)
      this.search = ''
      this.isSearchDisable = this.inputStatus === 'Form' ? false : status
    },
    getChild () {
      if (this.isProcess == true) {
        return this.$parent.$parent
      }
      else {
        return this.$parent.$parent.$children[this.pageLevel].$children[0].$children[this.tabIndex - 1].$children[0].$children[0]
      }
    },
    dblClickList(record,index) {
      this.$refs.modal.hide()
      this.$emit('dblClickSearch', record)
    },
    doNew () {
      this.$store.commit('setStatus', 'new')
      this.$store.commit('setEventStatus', 'NEW')
      this.$store.commit('setListDisable', true)
      var scopeForm = "FormScope_" + this.pageLevel + "_" + this.tabIndex
      this.$validator.errors.clear(scopeForm)
      this.setButton(true)
      this.unselectRowAfterRowClick()

      var rowSelected = this.rowSelected.filter(x => {
        return x.pageLevel == this.pageLevel && x.tabIndex == this.tabIndex
      })

      this.unselectRow(rowSelected[0])

      this.getChild().M_New()
    },
    doEdit (param = false) {
      this.isByPassCancel = param
      var isCanEdit = false

      if (this.formType === 'Form') {
        isCanEdit = true
      } else {
        // find data on array, if got it, break and set isCanEdit true
        for (let i = 0; i < this.rowSelected.length; i++) {
          if (this.rowSelected[i].pageLevel == this.pageLevel && this.rowSelected[i].tabIndex == this.tabIndex) {
            isCanEdit = true
            break
          }
        }

        if (!isCanEdit) {
          this.alertWarning('No Data Selected')
          return
        }
      }
      
      var scopeForm = "FormScope_" + this.pageLevel + "_" + this.tabIndex
      this.$validator.errors.clear(scopeForm)

      this.$store.commit('setStatus', 'EDIT')
      this.$store.commit('setEventStatus', 'EDIT')
      this.$store.commit('setListDisable', true)
      
      this.setButton(true)
      this.getChild().M_Edit()
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
      // console.log(this.$validator)

      // this.$validator.errors.items.value[0]
      // this.$validator.validate('scope.*');
      if (this.errors.items.length > 0) {
        return
      }

      this.$validator._base.validateAll(scopeForm).then((result) => {
        if (!result) return
        this.alertConfirmation("Are You Sure Want To Save This Data ?")
        .then(ress => {
          if (ress.value) {
            this.$store.commit('setEventStatus', 'SAVE')
            this.$validator.errors.clear(scopeForm)
            this.getChild().M_Save()
          }
        })
      })
    },
    doCancel () {
      if (this.isByPassCancel) {
        this.getChild().M_Cancel()
        return
      }
      var statusForm = this.$store.getters.getStatus
      if (statusForm == 'new') {
        // manggil showForm false
        this.$parent.$parent.$children[this.pageLevel].$children[0].$children[this.tabIndex - 1].$children[0]._data.showForm = false
      }
      this.$store.commit('setEventStatus', 'CANCEL')
      var scopeForm = "FormScope_" + this.pageLevel + "_" + this.tabIndex
      this.$store.commit('setListDisable', false)
      this.$store.commit('setStatus', 'view')
      this.$validator.errors.clear(scopeForm)
      this.setButton(false)
      this.getChild().M_Cancel()
    },
    doRefresh () {
      this.$store.commit('setEventStatus', 'REFRESH')
      if (this.pageLevel == '1') {
        location.reload()
      } else {
        this.search = ""
        this.getChild().M_Refresh()
      }
    },
    doPost () {
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
        // this.alertConfirmation("Are You Sure Want To Save This Data ?")
        // .then(ress => {
        //   if (ress.value) {
        //     this.$store.commit('setEventStatus', 'SAVE')
        //     this.$validator.errors.clear(scopeForm)
        //     this.getChild().M_Save()
        //   }
        // })
      })
      // this.alertConfirmation("Are You Sure Want To Process This Data ?")
      // .then(ress => {
      //   if(ress.value) {
      //     this.$store.commit('setEventStatus', 'POST')
      //     this.getChild().M_Post()
      //   }
      // })
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
      this.getChild().M_Search(this.search)
    },
    disableTab (status) {
      this.$parent.$parent.$children[1].setTabDisable(status)
      this.$parent.$parent.$children[2].setTabDisable(status)
      this.$parent.$parent.$children[3].setTabDisable(status)
    },
    ProcessPS (PS = null) {
      this.isNew = false

      if (this.formType == 'Process') {
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
      else if (this.formType == 'View') {
        this.statusFunction[0].disabled = true
        this.statusFunction[1].disabled = true
        this.statusFunction[2].disabled = true
        this.statusFunction[3].disabled = true
        this.statusFunction[4].text = 'Process'
        this.statusFunction[4].disabled = true

        this.PS(PS)
      }
    },
    PS (PS = null) {
      var dt = ''
      var forPS = PS?PS:this.getOptionSeq().PS

      if(forPS && forPS !== '' && forPS !== undefined){
        dt = forPS.split('')
      }
      else {
        dt = [1,1,1,1,1]
      }
      
      // Button 0:New, 1:Edit, 2:Delete
      if (dt[0]==0) this.statusFunction[0].disabled = true
      if (dt[1]==0) this.statusFunction[0].disabled = true
      if (dt[2]==0) this.statusFunction[0].disabled = true

      //Button POST
      if (dt[4] == 0) {
        this.statusFunction[4].text = 'Process'
        this.statusFunction[4].disabled = true
      }
      else if (dt[4] == 1) {
        this.statusFunction[4].text = 'Process'
      }
      else if (dt[4] == 2) {
        this.statusFunction[4].text = 'Submit'
        this.statusFunction[4].disabled = true
      }
      else if (dt[4] == 3) {
        this.statusFunction[4].text = 'Submit'
      }

      this.getChild().setToolbarButton()
    }
  },
  beforeCreate: function () {
  },
  created: function() {
  },
  beforeMount: function() {
  },
  mounted: function() {
    this.allFields = this.$validator._base.fields

    // this.ProcessPS()

    this.noBackButton()
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