<template>    
      <div class="height--full">
        <div class="header--content">              
            <div class="header--content__title">
                <b-row class="header-toolbar">
                    <b-col sm="12">
                        Fleet Mobile | 
                        <ABSButton
                            text="Back"
                            icon="chevron-left"
                            classButton="button-cancel button--cancelnew"
                            classIcon="icon-style-1"
                            @click="doBack" 
                            :styleButton="{color: 'black'}"                        
                        />
                        
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
                  <b-list-group-item @click="onDataClick(index)" v-for="(data, index) in DataList" href="#" class="flex-column align-items-start" v-bind:key="index">
                    <div style="
                      float: left;
                      margin: 0px 15px 0px 0px;
                    ">
                    <div class="container-ava">
                         <ABSAvatar :fullname="data.fm_fleet_type_id_descs" letter="2" size="54"/>
                         <!-- <ABSAvatar image=""  size="54" /> -->
                    </div>

                    <!-- <div class="container-status">
                      <div class="div-status" style="background-color: #;">
                         {{ data.?? }}
                      </div>
                    </div>  -->
                                            
                    </div>
                    

                    <b-row>
                      <b-col>
                        <b-row>
                         <b-col md="5">
                           <p class="p-list" style="color: #555555; font-size: 11px; ">
                               {{ data.fm_fleet_type_id_descs && data.fm_fleet_type_id_descs != '' ? data.fm_fleet_type_id_descs : '-' }}
                           </p>
                         </b-col>
                         <b-col md="5">
                           <p class="p-list" style="color: #0680FF; font-size: 14px; ">
                               {{ data.fleet_colour && data.fleet_colour != '' ? data.fleet_colour : '-' }}
                           </p>
                         </b-col>
                         <b-col md="5">
                           <p class="p-list" style="color: #2C9D05; font-size: 14px; ">
                               {{ data.fm_fleet_brand_id_descs && data.fm_fleet_brand_id_descs != '' ? data.fm_fleet_brand_id_descs : '-' }}
                           </p>
                         </b-col>
                         <b-col md="5">
                           <p class="p-list" style="color: #F50404; font-size: 14px; ">
                               {{ data.construction_year && data.construction_year != '' ? data.construction_year : '-' }}
                           </p>
                         </b-col>
                         <b-col md="5">
                           <p class="p-list" style="color: #F50404; font-size: 14px; ">
                               {{ data.engine_no && data.engine_no != '' ? data.engine_no : '-' }}
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
                  <div class="modal-customize-abs__modal-header--title">Sort By</div>
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
                      <b-col sm="6">
                        <b-form-select
                          v-model="data.columnName"
                          :options="definedColumn"
                          class="sm-12 font-lbl"
                          size="sm"
                          style="width:100% !important;"
                        />
                      </b-col>
                      <b-col sm="5">
                        <b-form-select
                          v-model="data.signFilter"
                          :options="signFilter"
                          class="sm-12 font-lbl"
                          size="sm"
                          style="width:100% !important;"
                        />
                      </b-col>                      
                      <b-col sm="1">
                        <div class="icon-close-filter" @click="M_RemoveFilter(index)">
                          <i class="icon-trash"></i>
                        </div>
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
                        @click="modalFilterHandleOk">
						Ok
					  </b-button>
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
        DataList: [],
        ListOption: null,
		Module:"FM",
        OptionUrl: "FM_Fleet_Mobile",
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
        var canadd = this.ListOption ? (this.ListOption.add_status == "1") : true
        return canadd
      },
      isCanDelete() {
        var candelete = this.ListOption ? (this.ListOption.delete_status == "1") : true
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
          columnName: dataColumn[0],
          signFilter: "asc"
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

          theFilter += filter.columnName + " " + filter.signFilter
          filterString += theFilter + " , " 
        })
        filterString = filterString.substr(0, filterString.length - 3)
        
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
        this.$router.push({ name: 'FM_Fleet_Mobile', params: { Option: this.ListOption, fm_fleet_id: null, lastupdatestamp: null } })
      },
      M_Delete(index){
        this.alertConfirmation("Are You Sure Want To Delete This Data ?")
        .then(result => {
          if (result.value) {
            var param = {
              OptionUrl: this.OptionUrl,
              LineNo: 0,
              fm_fleet_id:this.DataList[index].row_id,
              lastupdatestamp: this.DataList[index].lastupdatestamp
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
          this.DataList = response.Data
          var dataColumn = response.DefineColumn
          // this.selectedColumn = definedColumn;
          this.definedColumn = dataColumn.split(',')
          // console.log(this.definedColumn)
        })
      },
      onDataClick(index) {
        // if (index > -1) {
        //   this.DataList[index].isActive = !this.DataList[index].isActive ? false : true
        // }
      },
      onDataClick(index) {        
        this.$router.push({ name: 'FM_Fleet_Mobile', params: { Option: this.ListOption, fm_fleet_id: this.DataList[index].row_id, lastupdatestamp: this.DataList[index].lastupdatestamp } })
      },
      doGetListOption() {
        var param = {
          OptionUrl: this.Module+ "/" + this.OptionUrl,
          user_id: this.getDataUser().user_id,
          subportfolio_cd: this.getDataUser().subportfolio_cd,
        }

        this.postEncode(this.getPageInfoByOptionUrl(), param).then(response => {
          if (response == null) return
          if (response.Data.length < 1) return
          var data = response.Data[0]

          this.ListOption = data
        })
      },
    },
    beforeCreate: function () {
    },
    created: function() {
      if (this.$route.params.Option) {
        this.ListOption = this.$route.params.Option
      }
      else {
        this.doGetListOption()
      }
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
</style>
