<template>    
      <div class="height--full">
        <div class="header--content">              
            <div class="header--content__title">
                <b-row class="header-toolbar">
                    <b-col sm="12">
                        Log Book | 
                        <ABSButton
                            text="Done"
                            icon="check-circle"
                            classButton="button-cancel button--cancelnew"
                            classIcon="icon-style-1"
                            @click="doBack" 
                            :styleButton="{color: 'black'}"                                                      
                        />
                      <div class="container-refresh">
                        <font-awesome-icon icon="sync" class="icon-style-1__master" /> 
                      </div>
            

                        
                        <!-- <ABSButton
                            text=""
                            icon="syn"
                            classButton="button button--new"
                            classIcon="icon-style-1"
                            @click="doBack" 
                            styleButton=""                                                      
                        /> -->
                    </b-col>
                    <b-col md="12">
                      <b-row>
                          <b-col md="11" class="search-toolbar" style="padding-left:10px !important;">
                            <b-form-input
                                id="txtSearch"
                                v-model="search"
                                type="text"
                                placeholder="Search...."
                                v-shortkey.focus="['f1']"
                                class="text-field-search"
                                @keyup.enter.native="onSearchEnter"
                                autocomplete="off"
                            >
                            </b-form-input>
                            <font-awesome-icon @click="onSearchEnter" icon="search" class="icon-style-1__searchIcon" style="margin-top: 10px !important;"/>
                          </b-col>
                          <b-col md="1">
                            <ABSButton
                                text="Sort"
                                icon="sort-amount-down"
                                classButton="button button--new"
                                classIcon="icon-style-1"                                
                                @click="doSort" 
                                :styleButton="{width: '70px'}"
                            />
                          </b-col>
                      </b-row>
                    </b-col>
                </b-row>

            </div>
        </div>
        <div class="content-app-form__body">
            <div class="block-scope-mobile">
                <b-list-group>
                  <b-list-group-item @click="onDataDblClick(index)" v-for="(data, index) in DataLogBook" href="#" class="flex-column align-items-start" v-bind:key="index">
                    <div style="
                      float: left;
                      margin: 0px 15px 0px 0px;
                    ">
                      
                      <div class="container-ava">
                        <!-- <ABSAvatar :fullname="data.customer_name" letter="2" size="54" /> 
                        <ABSAvatar image="https://www.freeiconspng.com/uploads/flat-blue-home-icon-4.png"  size="54" /> 
                        <ABSAvatar :image="require('@/assets/avatar.png')"  size="54" />  -->
                      </div>
                          
                                      
                      <div class="container-status">                    
                      <div class="div-status" style="background-color: #0680FF;">
                          <!-- In Progress -->
                          {{data.follow_up_type_cd}}
                        </div>
                      </div>                    
                      <!-- status warna blue -->
                    </div>
                    

                    <b-row>
                      <b-col>
                        <b-row>
                          <b-col md="5">
                            <p class="p-list" style="color: #F99500; font-size: 14px; font-weight: bold;"> 
                              <!-- color: orange, size: large, style: bold -->
                              {{'Name : ' + (data.customer_name && data.customer_name != '' ? data.customer_name : '-') }} 
                            </p>
                          </b-col>
                          <b-col md="5">
                            <p class="p-list" style="color: #0680FF; font-size: 11px;"> 
                              <!-- color: blue, size: small -->
                              {{ data.log_book_date && data.log_book_date != '' ? data.log_book_date : '-' }} 
                            </p>
                          </b-col>
                          <b-col md="5">
                            <p class="p-list"  style="color: #555555; font-size: 11px;"> 
                              <!-- color: black, size: small -->
                              {{ data.remark && data.remark != '' ? data.remark : '-' }}
                            </p>
                          </b-col>
                          <b-col md="5">
                            <p class="p-list" style="color: #2C9D05; font-size: 11px;"> 
                              <!-- color: green, size: small -->
                              {{ data.contact_status_descs && data.contact_status_descs != '' ? data.contact_status_descs : '-' }} 
                            </p>
                          </b-col>
                          <b-col md="5">
                            <p class="p-list" style="color: #F50404; font-size: 11px;"> 
                              <!-- color: red, size: small -->
                              {{ data.follow_up_descs && data.follow_up_descs != '' ? data.follow_up_descs : '-' }} 
                            </p>
                          </b-col>
                        </b-row>
                      </b-col>
                      <b-col md="1" class="center-delete-list" style="max-width:100% !important;">
                        <ABSButton
                          v-show="isCanDelete"
                          text="Delete"
                          icon="trash"
                          classButton="button button--delete"
                          classIcon="icon-style-1"
                          styleButton=""
                          @click="M_Delete(index)"
                        />
                      </b-col>
                    </b-row>
                  </b-list-group-item>
                </b-list-group>
            </div>
        </div>
        <div v-show="isCanAdd" class="fab" @click="addForm"> + </div>
        
        <b-modal
          id="modalFilter"
          :hide-footer="true" 
          :hide-header-close="true"
          size="md"
          ref="modalFilter"
          class="modal-customize-abs"
        >
          <b-container class="bv-example-row">
            <b-row>
              <b-col sm="12">
                <div class="modal-customize-abs__modal-header">
                  <div style="width:50%;" class="modal-customize-abs__modal-header--title">Sort By</div>
                  <div
                    class="modal-customize-abs__modal-header--icon"
                    @click="$refs.modalFilter.hide()"
                  >
                    <i class="icon-close"></i> 
                  </div>
                </div>
                <div class="modal-customize-abs__modal-body">
                  <div class="list-filter">
                    <b-row v-for="(data, index) in filteredColumn" :key="index">
                      <!-- <b-col sm="1"></b-col> -->
                      <b-col sm="6">
                        <b-form-select
                          v-model="data.columnName"
                          :options="definedColumn"
                          class="sm-12 font-lbl"
                          size="sm"
                          style="width:100% !important;"
                        >
                          <template v-slot:first>
                            <option :value="''" disabled>Column Name</option>
                          </template>
                        </b-form-select>
                      </b-col>
                      <b-col sm="5">
                        <b-form-select
                          v-model="data.signFilter"
                          :options="signFilter"
                          class="sm-12 font-lbl"
                          size="sm"
                          style="width:100% !important;"
                        >
                          <template v-slot:first>
                            <option :value="''" disabled>Sort By</option>
                          </template>
                        </b-form-select>
                      </b-col>
                      <b-col sm="1">
                        <div class="icon-close-filter" @click="M_RemoveFilter(index)">
                          <i class="icon-trash"></i>
                        </div>
                        <!-- <ABSButton                          
                          text="Delete"
                          icon="trash"
                          classButton="button button--delete"
                          classIcon="icon-style-1"
                          styleButton=""
                          @click="M_RemoveFilter(index)"
                        /> -->
                      </b-col>
                    </b-row>
                  </div>
                  <hr>
                  <b-row align-h="between">
                    <b-col cols="3">
                      <b-button @click="doAddFilter" block size="sm" variant="outline-primary">Add</b-button>
                    </b-col>
                    <b-col cols="3">
                      <b-button
                        size="sm"
                        block
                        variant="outline-success"
                        @click="modalFilterHandleOk"
                      >Ok</b-button>
                    </b-col>
                  </b-row>
                  <br>
                </div>
              </b-col>
            </b-row>
          </b-container>
        </b-modal>
      </div>
</template>
<script>
  export default {
    data() {
      return {
        definedColumn:[],
        filteredColumn:[],
        selectedColumn: [],
        signFilter:[
          { value: "asc", text: "Ascending", type: "text" },
          { value: "desc", text: "Descending", type: "text" },
        ],
        tempAdvanceFilter:"",
        DataLogBook: [],
        LogBookOption: null,
        OptionUrl: "MK_LogBook",
        currentPage: 1,
        perPage: 10,
        sort: 'time_edit DESC',
        sourceField: '',
        paramView: '',
        search:''
      }
    },
    computed: {
      isCanAdd() {
        var canadd = this.LogBookOption ? (this.LogBookOption.add_status == "1") : true
        return canadd
      },
      isCanDelete() {
        var candelete = this.LogBookOption ? (this.LogBookOption.delete_status == "1") : true
        return candelete
      }
    },
    methods: {
      //filter start=======================
      doSort() {
        // this.$store.commit("setLevel", this.prop.PageLevel)
        // this.$store.commit("setTab", this.prop.TabIndex)
        this.$refs.modalFilter.show()
        this.doAddFilter()
                
      },
      doAddFilter() {
        var dataColumn = this.definedColumn;
        this.filteredColumn.push({
          columnName: "",
          signFilter: ""
        })
      },
      M_RemoveFilter(idx){
         this.filteredColumn.splice(idx, 1)
        this.$forceUpdate()
      },      
      modalFilterHandleOk(){
        var col = this.definedColumn
        var filterString = ""

        this.filteredColumn.forEach((filter, index) => {
          var i = col
          .map(value => {
            return value
          })
          .indexOf(filter.columnName)
          var theFilter = ""
          var sign = filter.signFilter

          if (filter.columnName !== '' && filter.signFilter !== '') {
            theFilter += filter.columnName + " " + filter.signFilter
            filterString += theFilter + ","
          }
        })

        filterString = filterString !== '' ? filterString.slice(0,-1) : filterString
        //substr(0, filterString.length - 3)
        
        this.tempAdvanceFilter = filterString
        this.doGetList("")
        this.filteredColumn = [] 
        
        this.$refs.modalFilter.hide()
      },
      //filter end=========================
      doBack(){
        this.$router.replace({ name: 'Dashboard' })
      },
      onSearchEnter(){
        this.doGetList(this.search)
      },
      addForm(){
        this.$router.push({ name: 'MK_LogBook_New', params: { Option: this.LogBookOption, mk_log_book_h_id: null, lastupdatestamp: null } })
      },
      M_Delete(index){
        this.alertConfirmation("Are You Sure Want To Delete This Data ?")
        .then(result => {
          if (result.value) {
            var param = {
              OptionUrl: this.OptionUrl,
              LineNo: 0,
              mk_log_book_h_id:this.DataLogBook[index].row_id,
              lastupdatestamp: this.DataLogBook[index].lastupdatestamp
            }

            var url = this.getUrlV2(this.getUrlDelete())

            this.postJSON(url, param)
            .then((response) => {
              if(response == null) return
              this.alertSuccess(response.Message)
              this.doGetList()
            })
          }
        })
      },
      doGetList(search = "") {
        var temp = ""
        if (this.tempAdvanceFilter == "") {
          temp = "time_edit DESC"
        }else{
          temp = this.tempAdvanceFilter
        }

        var param = {
          OptionUrl: this.OptionUrl,
          LineNo: 0,
          user_id: this.getDataUser().user_id,
          portfolio_cd: this.getDataUser().portfolio_cd,
          subportfolio_cd: this.getDataUser().subportfolio_cd,
          CurrentPage: this.currentPage,
          PerPage: this.perPage,
          ParamWhere: search,
          InitialWhere: "",
          SortField: temp,
          SourceField: this.sourceField,
          ParamView: this.paramView
        };  

        var url = this.getUrlV2(this.getUrlList())

        this.postJSON(url, param).then(response => {
          if (response == null) return;
          this.DataLogBook = response.Data
          var dataColumn = response.DefineColumn
          // this.selectedColumn = definedColumn;
          this.definedColumn = dataColumn.split(',')
          // console.log(this.definedColumn)
        })
      },
      onDataClick(index) {
        // if (index > -1) {
        //   this.DataLogBook[index].isActive = !this.DataLogBook[index].isActive ? false : true
        // }
      },
      onDataDblClick(index) {        
        this.$router.push({ name: 'MK_LogBook_New', params: { Option: this.LogBookOption, mk_log_book_h_id: this.DataLogBook[index].row_id, lastupdatestamp: this.DataLogBook[index].lastupdatestamp } })
      },
      doGetLogBookOption() {
        var param = {
          OptionUrl: "MK/" + this.OptionUrl,
          user_id: this.getDataUser().user_id,
          subportfolio_cd: this.getDataUser().subportfolio_cd,
        }

        this.postEncode(this.getPageInfoByOptionUrl(), param).then(response => {
          if (response == null) return
          if (response.Data.length < 1) return
          var data = response.Data[0]

          this.LogBookOption = data
        })
      },
    },
    beforeCreate: function () {
    },
    created: function() {
      // if (this.$route.params.Option) {
      //   this.LogBookOption = this.$route.params.Option
      // }
      // else {
        this.doGetLogBookOption()
      // }
    },
    beforeMount: function() {
    },
    mounted: function() {
      this.doGetList()
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

<style scoped>
  .div-status {
    text-transform: uppercase;
    padding: 5px 10px;
    min-width: 19px;
    display: inline-block;
    color: #ffffff;
    font-size: 11px;
    line-height: 1;
    text-align: center;
    white-space: nowrap;
    vertical-align: baseline;
    border-radius: .25rem;    
}
  .container-refresh{
  float: right;
  color: #215b7d;
  /* margin: 8px 15px 0px 0px; */
  /* #215b7d */
}
</style>