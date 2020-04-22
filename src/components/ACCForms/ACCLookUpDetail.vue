<template>
  <div style="padding-left: 15px;padding-right: 15px;">
    <b-modal
      id="modalColumn"
      :hide-footer="true"
      :hide-header-close="true"
      size="lg"
      ref="modalColumn"
      class="modal-customize-abs"
    >
      <b-container class="bv-example-row">
        <b-row>
          <b-col sm="12">
            <div class="modal-customize-abs__modal-header">
              <div class="modal-customize-abs__modal-header--title">
                Edit Column
              </div>
              <div
                class="modal-customize-abs__modal-header--icon"
                @click="$refs.modalColumn.hide()"
              >
                <i class="icon-close"></i>
              </div>
            </div>
            <div class="modal-customize-abs__modal-body">
              <b-row>
                <b-col sm="5">
                  <div>
                    <div class="divCustom">
                      <b>Available Columns</b>
                      <br>
                      <span>Select column below to display in your grid</span>
                    </div>
                    <br>
                    <div v-if="availableColumn.length > 0">
                      <ABSMultiSelect
                        v-model="availableColumnSelected"
                        :options="availableColumn"
                        size=10
                        class="selectCustom"
                      />
                    </div>
                    <div v-else>
                      <b>No Additional Properties</b>
                    </div>
                  </div>
                </b-col>
                <b-col sm="2">
                  <div class="arrow-move">
                    <b-button @click="M_moveRight" size="sm" variant="primary">
                      <font-awesome-icon icon="angle-double-right" class="icon-style-5"/>
                    </b-button>
                  </div>
                </b-col>
                <b-col sm="5">
                  <div>
                    <div class="divCustom">
                      <b>Selected Column</b>
                      <br>
                      <span>Drag the column names below to reorder how they will appear above your grid</span>
                    </div>
                    <br>
                    <draggable
                      v-if="selectedColumn.length > 0"
                      v-model="selectedColumn"
                      @start="drag=true"
                      @end="drag=false"
                      class="drag-area"
                    >
                      <div v-for="element in selectedColumn" :key="element.value" class="draggable">
                        {{element.key}}
                        <span>
                          <span
                            class="btn-remove"
                            style="margin-top:0px; float:right;"
                            @click="M_moveLeft(element.value)"
                          >
                            <font-awesome-icon icon="trash"/>&nbsp;Delete
                          </span>
                        </span>
                      </div>
                    </draggable>
                    <div v-else>
                      <b>No Column Selected</b>
                    </div>
                  </div>
                </b-col>
              </b-row>
              <br>
              <b-row>
                <b-col cols="12">
                  <b-button
                    size="sm"
                    block
                    variant="success"
                    @click="modalColumnHandleOk"
                  >
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
              <div class="modal-customize-abs__modal-header--title">
                Filter Builder
              </div>
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
                  <b-col sm="4">
                    <b-form-select
                      v-model="data.columnName"
                      :options="selectedColumn"
                      class="sm-3 font-lbl"
                      size="sm"
                    />
                  </b-col>
                  <b-col sm="3">
                    <b-form-select
                      v-model="data.signFilter"
                      :options="signFilter"
                      class="sm-3 font-lbl"
                      size="sm"
                    />
                  </b-col>
                  <b-col sm="4">
                    <b-form-input
                      v-if="signFilter[signFilter.map(x => {return x.value}).indexOf(data.signFilter)].type=='text'"
                      v-model="data.value"
                      type="text"
                      placeholder="Enter a value"
                      size="sm"
                      class="sm-3 font-lbl"
                    />
                  </b-col>
                  <b-col sm="1">
                    <div
                      class="icon-close-filter"
                      @click="M_RemoveFilter(index)"
                    >
                      <i class="icon-trash"></i>
                    </div>
                  </b-col>
                </b-row>
              </div>
              <hr>
              <b-row align-h="between">
                <b-col cols="3">
                  <b-button
                    @click="doAddFilter"
                    block
                    size="sm"
                    variant="outline-primary"
                  >
                    Add
                  </b-button>
                </b-col>
                <b-col cols="3">
                  <b-button
                    size="sm"
                    block
                    variant="outline-success"
                    @click="modalFilterHandleOk"
                  >
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

    <!-- <b-modal
      id="modalExport"
      :hide-footer="true"
      :hide-header-close="true"
      size="md"
      ref="modalExport"
      class="modal-customize-abs"
    >
      <b-row>
        <b-col sm="12">
          <div class="modal-customize-abs__modal-header">
            <div class="modal-customize-abs__modal-header--title">
              Export {{title}} to Excel
            </div>
            <div
              class="modal-customize-abs__modal-header--icon"
              @click="$refs.modalExport.hide()"
            >
              <i class="icon-close"></i>
            </div>
          </div>
          <div class="modal-customize-abs__modal-body">
            <p>Select data that will be exported</p>
            <div class="box-category">
              <div class="box-category__list-category-export" @click="doExportXLS('S')">
                <img :src="require('@/assets/export-select.png')" alt="">
                Export Selected Data
              </div>
              <div class="box-category__list-category-export category-all" @click="doExportXLS('A')">
                <img :src="require('@/assets/export-all.png')" alt="">
                Export All
              </div>
            </div>
          </div>
        </b-col>
      </b-row>
    </b-modal> -->
    
    <!-- <b-row align-h="right" class="header-list__1">
      <b-col>
        <div class="dropdown" style="float:right;">
          <button class="dropbtn">
            <i class="icon-settings"></i>
          </button>
          <div class="dropdown-content">
            <div class="dropdown-modal-list" @click="openModalExport"><font-awesome-icon icon="file-export" class="icon-style-3"/> Export</div>
            <div class="dropdown-modal-list" @click="openModalColumn"><font-awesome-icon icon="columns" class="icon-style-1"/> Column</div>
            <div class="dropdown-modal-list" @click="openModalFilter"><font-awesome-icon icon="columns" class="icon-style-1"/> Advance Filter</div>
          </div>
        </div>
      </b-col>
    </b-row> -->
    <div class="modal-customize-abs__modal-header" style="padding-top:0px !important; padding-bottom:0px !important;">
      <!-- <div class="modal-customize-abs__modal-header--title" style="width: 97% !important;"> -->
      <div class="modal-customize-abs__modal-header--title">
        <b-row style="padding-bottom:0px">
          <b-col class="search-toolbar">
            <b-form-input
              :id="cName + 'search'"
              v-model="searchValue"
              type="text"
              :placeholder="'Search ' + title"
              class="text-field-search"
              style="margin-bottom: 0px !important;margin-top: 3px !important; padding-left:30px !important; border-top: none; border-right: none; border-left: none; min-height: 40px; border-radius: 0px !important;"
              @keyup.enter.native="onSearchEnter"
              autocomplete="off">
            </b-form-input>
            <font-awesome-icon @click="onSearchEnter" icon="search" class="icon-style-1__searchIconLeft" style="margin-top: 16px !important; margin-right:743px !important"/>        
            <!-- <i @click="closeLookup()" class="icon-style-1__searchIcon icon-close" style="margin-top: 16px !important; right:-10px !important; color: red !important;"></i> -->
          </b-col>
        </b-row>
      </div>      
      <div
        class="modal-customize-abs__modal-header--icon"
        style="padding-top: 15px !important;"        
        @click="closeLookup()"
      >
        <i class="icon-close"></i>
      </div>
    </div>
    <!-- <b-row style="padding-bottom:20px">
      <b-col class="search-toolbar">
        <b-form-input
          id="txtSearch"
          v-model="searchValue"
          type="text"
          :placeholder="'Search ' + title"
          class="text-field-search"
          style="margin-bottom: 0px !important;margin-top: 3px !important; padding-left:30px !important; border-top: none; border-right: none; border-left: none; min-height: 40px; border-radius: 0px !important;"
          @keyup.enter.native="onSearchEnter"
          autocomplete="off">
        </b-form-input>
        <font-awesome-icon @click="onSearchEnter" icon="search" class="icon-style-1__searchIconLeft" style="margin-top: 16px !important; margin-right:743px !important"/>        
        <i @click="closeLookup()" class="icon-style-1__searchIcon icon-close" style="margin-top: 16px !important; right:-10px !important; color: red !important;"></i>
      </b-col>
    </b-row>     -->
    <b-form inline style="float: left; color: #333;width:100%;font-size:11px;">
      <label class="font-lbl" style="margin-bottom:0px !important; margin-right:0px !important;">Page Size</label>
      <b-form-select
        id="cmbPerPage"
        v-model="perPage"
        v-on:input="doGetList('', 'pageSize')"
        :options="pagingData"
        class="sm-3 mgn-left-10 font-lbl page-size-left"
        :disabled="isDisableTable">
      </b-form-select>
      of {{ this.totalRows }} Records
    </b-form>

    <b-pagination align="right"
      v-model="currentPage"
      v-on:input="doGetList('', 'pagination')"
      :total-rows="totalRows"
      :per-page="perPage"
      :limit="limit"
      style="margin-bottom: 0px;"
      :disabled="isDisableTable">
    </b-pagination>

    <div class="table--list" style="position:relative; overflow:auto;max-height:400px;margin-top:13px;">
      <b-table
        :striped="false"
        :bordered="false"
        :outlined="false"
        :small="false"
        :hover="true"
        :dark="false"
        :fixed="false"
        :foot-clone="false"
        :responsive="false"
        :fields="fieldHeader"
        :items="items"
        @head-clicked="headClicked"
        @row-dblclicked="rowDblClicked"
        class="table-sm table-style-1"
        rules="row"
      >
        <!-- @row-clicked="rowClicked" -->
        <!-- <template slot="HEAD_chkBoxAction" slot-scope="data">
          <b-form-checkbox
            @click.native.stop
            @change="headChkBoxAction"
            v-model="selected"
            :disabled="isDisableTable"
          />
        </template>

        <template slot="chkBoxAction" slot-scope="row">
          <b-form-checkbox
            @dblclick.native.stop
            @click.native.stop
            @change="chkBoxAction(row.index)"
            v-model="rowSelected"
            :value="row.index"
            :disabled="isDisableTable"
            style="min-height:15px !important;padding-top:0px !important;"
          />
        </template> -->
      </b-table>
    </div>

    <!-- <b-form inline style="float: left; color: #333;">
      <label class="font-lbl">Page Size</label>
      <b-form-select
        id="cmbPerPage"
        v-model="perPage"
        v-on:input="doGetList('', 'pageSize')"
        :options="pagingData"
        class="sm-3 mgn-left-10 font-lbl page-size-left"
        :disabled="isDisableTable">
      </b-form-select>
      of {{ this.totalRows }} Records
    </b-form>

    <b-pagination align="right"
      v-model="currentPage"
      v-on:input="doGetList('', 'pagination')"
      :total-rows="totalRows"
      :per-page="perPage"
      :limit="limit"
      style="margin-bottom: 0px;"
      :disabled="isDisableTable">
    </b-pagination> -->

    <!-- <div class="loader--page" v-if="loader">
      <div class="loader--page__box">
        <div class="spinner">
          <div class="rect1"></div>
          <div class="rect2"></div>
          <div class="rect3"></div>
          <div class="rect4"></div>
          <div class="rect5"></div>
        </div>
        <div class="title">Please wait...</div>
      </div>
    </div> -->
    <!-- <ABSLoader /> -->
  </div>
</template>

<script>

export default {
  props: {
    dataLookUp : {
      LookUpCd: String,
      ColumnDB: String,
      InitialWhere: String,
      ParamWhere: String,
      OrderBy: String,
      ParamView: String,
      SourceField: String,
      DisplayLookUp: String
    },
    title: String,

    // T Analysis
    // TrxAnalysisCategory: {type: String, default: ''},
    // isTAnalysis: {type:Boolean, default: false},
    urlApi: String,
    cName: String
  },
  data() {
    return {
      searchValue: '',
      loader: false,
      // isDisableTable: false,
      isDisableTable: false,
      // checkbox all
      selected: false,
      rowSelected: [],
      dataSelected: [],
      rowSel: -1,

      search: "",
      fieldHeader: [],
      items: [],
      sort: "",
      // sort: "TimeEdit DESC",

      // paging
      totalRows: 0,
      currentPage: 1,
      lastPage: 1,
      perPage: 20,
      limit: 2,
      // combobox paging
      // selected: 2,
      pagingData: [
        // { value: 2, text: '2' },
        { value: 5, text: "5" },
        { value: 10, text: "10" },
        { value: 15, text: "15" },
        { value: 20, text: "20" },
        { value: 40, text: "40" },
        { value: 60, text: "60" },
        { value: 80, text: "80" },
        { value: 100, text: "100" }
      ],

      fileName: "TestExport",
      ExportToken: "",

      availableColumn: [],
      availableColumnTemp: [],
      availableColumnSelected: [],
      selectedColumn: [],
      selectedColumnTemp: [],
      selectedColumnSelected: [],

      sortedField: [],

      // dataFilter:[],
      filteredColumnTemp: [],
      filteredColumn: [],
      signFilter: [
        { value: "=", text: "Equals", type: "text" },
        { value: "<>", text: "Does Not Equal", type: "text" },
        { value: "<", text: "Is Less Than", type: "text" },
        { value: ">", text: "Is Greater Than", type: "text" },
        { value: "<=", text: "Is Less Than Or Equal To", type: "text" },
        { value: ">=", text: "Is Greater Than Or Equal To", type: "text" },
        { value: "null", text: "Is Empty", type: "none" },
        { value: "notnull", text: "Is Not Empty", type: "none" },
        { value: "like", text: "Contains Of", type: "text" },
        // {value: 'between', key: 'Is Between'},
        { value: "in", text: "Is Any Of", type: "text" },
        { value: "notin", text: "Is None Of", type: "text" }
      ],

      dataState: {
        // PageLevel: '1',
        TabIndex: "1"
      },
      tempAdvanceFilter: ""
    };
  },
  computed: {
  //   isDisableTable() {
  //     return this.$store.getters.getListStatus;
  //   }
  },
  methods: {
    closeLookup() {
      this.$parent.$parent.$parent.closeLookup()
    },
    getToolbarAbsList() {
      return this.$parent.$parent.$parent.$parent.$parent.$parent.$children[0]
        .$children[0];
    },
    doNew() {
      this.$emit("doNew");
    },
    doEdit() {
      this.$emit("doEdit");
    },
    doSave() {
      this.$emit("doSave");
    },
    doCancel() {
      this.$emit("doCancel");
    },
    doRefresh() {
      this.dataLookUp.InitialWhere = "";
      // this.sort = 'TimeEdit ASC'
      this.doGetList("", "refresh");
      this.resetSelected();
      this.$emit("doRefresh");
    },
    onSearchEnter() {
      this.doGetList(this.searchValue, "onSearchEnter");
    },
    onClose(){
      // alert('test')
      // console.log(this.modalLookup)
      this.$emit('close');
    },
    // getRowSelected (param, method) {
    //   var data = []
    //   if(this.rowSelected.length > 0){
    //     this.rowSelected.forEach(idx => {
    //       data.push(this.items[idx])
    //     })
    //     // this.$emit('getSelected' + param, data, method)
    //     this.$emit(method, data)
    //   }
    //   else {
    //     this.alertWarning('No Data Selected')
    //   }
    // },
    getRowSelected() {
      var data = [];
      if (this.rowSelected.length > 0) {
        this.rowSelected.forEach(idx => {
          data.push(this.items[idx]);
        });
        // this.$emit('getSelected' + param, data, method)
        // this.$emit(method, data)
        return data;
      } else {
        this.alertWarning("No Data Selected");
      }
    },
    // doPostOrDelete(act) {
    //   var data = [];
    //   if (this.rowSelected.length > 0) {
    //     this.rowSelected.forEach(idx => {
    //       data.push(this.items[idx]);
    //     });

    //     EventBus.$emit("ebProcessPostAndDelete" + this.prop.PageLevel + "_" + this.prop.TabIndex, { Act: act, Data: data })
    //   } else {
    //     if (act == "post") {
    //       this.alertWarning("No Data Selected To Post");
    //     } else if (act == "delete") {
    //       this.alertWarning("No Data Selected To Delete");
    //     } else if (act == "process") {
    //       this.alertWarning("No Data Selected To Process");
    //     }
    //   }
    // },
    // M_Delete(data) {
    //   var param = {
    //     OptionSeq: this.getOptionSeq().OptionSeq,
    //     SubPortfolioCd: this.getDataUser().subportfolio_cd,
    //     PortfolioCd: this.getDataUser().portfolio_cd,
    //     LineNo: this.prop.LineNo,
    //     Data: data
    //   };

    //   this.postJSON(this.getUrlDeleteMulti(), param).then(response => {
    //     // response from API
    //     if (response == null) return;

    //     this.responses = response;
    //     this.alertSuccess("Deleting Data Successfully");
    //     this.doGetList("", "refresh_delete");
    //     this.resetSelected();
    //   });
    // },
    doExportXLS(param) {
      if (param == "A") {
        var url = this.getFileExcel(this.fileName, this.ExportToken);
        window.location.href = url;
        this.$refs.modalExport.hide();
      } else {
        if (this.rowSelected.length > 0) {
          var data = "";
          this.rowSelected.forEach(idx => {
            // data.push(this.items[idx])
            data += this.items[idx].row_id + ",";
          });

          data = data.slice(0, -1);

          this.M_ExportXLS(data);

          // alert(JSON.stringify(data))

          // this.$emit('getSelected', data, 'export')
          // EventBus.$emit('ebToolBarExport', data)
        } else {
          this.alertWarning("No Data Selected To Export");
        }
      }
    },
    M_ExportXLS(data) {
      var param = {
        Token: this.ExportToken,
        Data: data
      };

      this.postJSON(this.getUrlGetTokenExport(), param).then(response => {
        if (response == null) return;

        var url = this.getFileExcel(this.fileName, response.Data.Token);
        window.location.href = url;
        this.$refs.modalExport.hide();
      });
    },
    // M_PostData(data) {
    //   var param = {
    //     OptionSeq: this.getOptionSeq().OptionSeq,
    //     SubPortfolioCd: this.getDataUser().subportfolio_cd,
    //     PortfolioCd: this.getDataUser().portfolio_cd,
    //     LineNo: this.prop.LineNo,
    //     Data: data
    //   };
    //   console.table(param);
    //   this.postEncode(this.getUrlPostMulti(), param).then(response => {
    //     // response from API
    //     console.log("post");
    //     console.table(response);
    //     if (response == null) return;

    //     this.alertSuccess("Posting Data Successfully");
    //     this.doGetList("", "refresh_post");
    //     this.resetSelected();
    //   });
    // },
    // openModalExport() {
    //   this.$refs.modalExport.show();
    // },
    openModalColumn() {
      this.$refs.modalColumn.show();
    },
    openModalFilter() {
      this.$refs.modalFilter.show();
      // v-b-modal.modalFilter
    },
    doCursorSearch() {
      document.getElementById(this.cName + "search").focus()
      // document.getElementById(frmObj.id).select();
      // alert("cursor");
    },
    doAddFilter() {
      var dataColumn = this.selectedColumn;
      this.filteredColumn.push({
        columnName: dataColumn[0].value,
        signFilter: "=",
        value: ""
      });
    },
    M_RemoveFilter(idx) {
      this.filteredColumn.splice(idx, 1);
      this.$forceUpdate();
    },
    modalFilterHandleOk() {
      var col = this.selectedColumn;
      var filterString = "";

      this.filteredColumn.forEach((filter, index) => {
        var i = col
          .map(value => {
            return value.value;
          })
          .indexOf(filter.columnName);
        console.log(i);
        console.log(filter.columnName);
        var theFilter = "";
        var sign = filter.signFilter;
        console.log(sign);
        if (sign == "in" || sign == "notin") {
          var val = filter.value.split(",");
          var xVal = "";
          val.forEach(v => {
            xVal += "'" + v + "',";
          });

          xVal = xVal.substr(0, xVal.length - 1);

          if (sign == "in") {
            theFilter = "in (" + xVal + ")";
          } else {
            theFilter = "not in (" + xVal + ")";
          }
        } else if (sign == "like") {
          theFilter += "like '%" + filter.value + "%'";
        } else if (sign == "null") {
          theFilter += " is null ";
        } else if (sign == "notnull") {
          theFilter += " is not null ";
        } else {
          theFilter += filter.signFilter + " '" + filter.value + "'";
        }
        filterString += this.selectedColumn[i].key + " " + theFilter + " AND ";
      });
      filterString = filterString.substr(0, filterString.length - 4);
      // this.prop.InitialWhere = filterString
      this.tempAdvanceFilter = filterString;
      this.doGetList("", "refresh_filter");
      this.$refs.modalFilter.hide();
    },
    modalColumnHandleOk() {
      var field = "";

      this.selectedColumn.forEach((el, index) => {
        if (index == this.selectedColumn.length - 1) {
          field += el.key
          // field = field.substr(0, field.length - 1);
        }
        else {
          field += el.key + ","
        }
      });

      var param = {
        OptionSeq: this.getOptionSeq().OptionSeq,
        user_id: this.getDataUser().user_id,
        subportfolio_cd: this.getDataUser().subportfolio_cd,
        column_field: field,
        user_input: this.getDataUser().user_id,
        LineNo: this.prop.LineNo
      };

      this.postJSON(this.getUrlDefineColumn(), param).then(response => {
        // response from API
        if (response == null) return;

        this.responses = response;

        this.fieldHeader = [];
        this.fieldHeader.push({
          value: 0,
          key: "chkBoxAction"
        });
        this.selectedColumn.forEach(ar => {
          var thClass = "ABSthClassList"
          var isSorted = this.sortedField.map(x => x.field).indexOf(ar.key)
          if (isSorted > -1) {
            if (this.sortedField[isSorted].sort == 'ASC') {
              thClass = thClass + ' AscSorted'
            }
            else {
              thClass = thClass + ' DescSorted'
            }
          }
          
          if (this.languageStatus) {
            this.fieldHeader.push({
              value: ar.value,
              key: ar.key,
              thClass: thClass,
              tdClass: "ABStdClassList",
              label: this.$t(ar.key)
            })
          } else {
            this.fieldHeader.push({
              value: ar.value,
              key: ar.key,
              thClass: thClass,
              tdClass: "ABStdClassList",
            })
          }
        })

        this.doGetList("", "refresh_column")
        this.$refs.modalColumn.hide()
      })
    },
    M_moveRight() {
      if (
        this.availableColumnSelected &&
        this.availableColumnSelected.length > 0
      ) {
        var arr = this.availableColumn;
        var x = 0;
        this.availableColumnTemp.forEach((dt, idx) => {
          if (dt.value == this.availableColumnSelected[x]) {
            arr = arr.filter(function(arr, index) {
              return arr.value != dt.value;
            });

            this.selectedColumn.push({
              value: dt.value,
              key: dt.key,
              text: dt.key
            });

            x += 1;
          }

          if (x == this.availableColumnSelected.length) {
            this.availableColumn = arr;
            this.selectedColumnTemp = this.selectedColumn;
            this.availableColumnTemp = this.availableColumn;
          }
        });
      }
    },
    M_moveLeft(selected) {
      this.selectedColumnSelected = [selected];
      var arr = this.selectedColumn;
      var x = 0;
      this.selectedColumnTemp.forEach((dt, idx) => {
        if (dt.value == this.selectedColumnSelected[x]) {
          arr = arr.filter(function(arr, index) {
            return arr.value != dt.value;
          });

          this.availableColumn.push({
            value: dt.value,
            key: dt.key,
            text: dt.key
          });

          x += 1;
        }

        if (x == this.selectedColumnSelected.length) {
          this.selectedColumn = arr;
        }
      });
    },
    headClicked: function(field, index) {
      if (field.toUpperCase() == "NO") {
        return;
      }
      if (this.isDisableTable) return;
      var dtSort = this.sortedField;
      this.sort = "";
      var x = dtSort
        .map(e => {
          return e.field;
        })
        .indexOf(field);

      if (x > -1) {
        if (this.sortedField[x].sort == "ASC") {
          this.sortedField[x].sort = "DESC";
        } else {
          // this.sortedField[x].sort = "ASC";
          this.sortedField.splice(x, 1)
        }
      } else {
        this.sortedField.push({ field: field, sort: "ASC" });
      }

      this.sortedField.forEach(el => {
        this.sort += el.field + " " + el.sort + ",";
      });

      this.sort = this.sort.substr(0, this.sort.length - 1);
      this.doGetList("", "headTable");
      this.resetSelected();
      this.$emit("headClicked");
    },
    headChkBoxAction() {
      this.rowSelected = [];
      if (!this.selected) {
        this.items.forEach((el, idx) => {
          this.rowSelected.push(idx);
          // this.items[idx]['_rowVariant'] = 'primary'
        });
      } else {
        this.items.forEach((el, idx) => {
          // this.items[idx]['_rowVariant'] = ''
        });
      }

      this.$emit("allCheckBoxAction", this.items);
    },
    chkBoxAction(index) {
      var x = this.rowSelected.indexOf(index);
      if (x > -1) {
        this.selected = false;
      } else {
        if (this.rowSelected.length == this.items.length) {
          this.selected = true;
        }
      }
    },
    rowClicked: function(record, index) {
      if (this.isDisableTable) return;
      if (this.rowSel != -1) {
        this.items[this.rowSel]["_rowVariant"] = "";
      }

      this.rowSel = index;
      this.items[index]["_rowVariant"] = "primary";
      this.$forceUpdate();

      this.$emit("rowClicked", record, index);
      // var datax = {
      //   pageLevel: this.prop.PageLevel,
      //   tabIndex: this.prop.TabIndex
      // };

      // this.getToolbarAbsList().unselectRowAfterRowClick(datax);
    },
    unselectRowClicked() {
      this.items[this.rowSel]["_rowVariant"] = "";
      this.$forceUpdate();
    },
    rowDblClicked: function(record, index) {
      this.$emit("rowDblClicked", record, index)
    },
    rowLinkClick(url) {
      this.$emit("rowLinkClick", url);
    },
    resetSelected() {
      this.rowSelected = [0];
      this.selected = false;
      this.items[0]["_rowVariant"] = "primary";
      this.rowSel = 0;
    },
    doGetList(search, method) {
      // var data = {
      //   Event: method,
      //   PageLevel: this.prop.PageLevel,
      //   TabIndex: this.dataState.TabIndex
      // };

      // jika advance filter kosong '' maka kasih initial where aja
      // selainnya berarti inital where + advance filter
      
      var x = this.dataLookUp.InitialWhere
      var temp =
        this.tempAdvanceFilter == ""
          ? this.dataLookUp.InitialWhere
          : this.dataLookUp.InitialWhere + " " + this.tempAdvanceFilter

      var param = {
        // user_id: this.getDataUser().user_id,
        // portfolio_cd: this.getDataUser().portfolio_cd,
        // subportfolio_cd: this.getDataUser().subportfolio_cd,
        look_up_cd: this.dataLookUp.LookUpCd,
        column_db: this.dataLookUp.ColumnDB,
        current_page: this.currentPage,
        per_page: this.perPage,
        initial_where: temp,
        param_where: this.searchValue,
        sort_field: this.sort,
        param_view: this.dataLookUp.ParamView
      };

      if (this.dataLookUp.sort_field == undefined || this.dataLookUp.DisplayLookUp == undefined ||
          this.dataLookUp.sort_field == '' || this.dataLookUp.DisplayLookUp == '') {
      } else {
        param.sort_field = this.dataLookUp.SourceField
        param.display_look_up = this.dataLookUp.DisplayLookUp
      }
      
      var paramT = {
        user_id: this.getDataUser().user_id,
        portfolio_cd: this.getDataUser().portfolio_cd,
        subportfolio_cd: this.getDataUser().subportfolio_cd,
        // TrxAnalysisCategory: this.TrxAnalysisCategory,
        PerPage: this.perPage,
        CurrentPage: this.currentPage,
        SortField: this.sort,
        ParamWhere: this.searchValue
      };

      // this.loader = true;
      this.$store.commit('setStatusLoader', true)

      var urls = this.getUrlLookupList()//this.isTAnalysis ? this.urlApi :this.getUrlLookupList()
      var params = param //this.isTAnalysis && urls == this.getUrlTanalysisLookup() ? paramT :param
      this.postJSON(urls, params).then(response => {
        this.$store.commit('setStatusLoader', false)
        if (method == 'initial') {
          // this.search = searchValue
          this.sortedField = []
        }
        // this.loader = false;
        if (response == null) return;

        this.selected = false;

        this.rowSelected = [];

        this.rowSel = 0;

        this.responses = response;

        this.ExportToken = this.responses.ExportToken;

        if (this.responses.Data.length > 0) {
        }
        this.items = [];
        this.fieldHeader = [];
        this.items = this.responses.Data;

        var keys = this.responses.AllColumn.split(",");
        // if (this.isTAnalysis) {
        //   keys = ["No", "TrxAnalysisCd", "Descs", "separator"]
        // }
        for (var j = 0; j < keys.length; j++) {

          var thClass = "ABSthClassList"

          var tdClass = 'ABStdClassList'
          if (keys[j].toLowerCase().includes('amount') || keys[j].toLowerCase().includes('amt') || keys[j].toLowerCase().includes('rate')) {
            tdClass = 'ABStdClassList2'
            thClass = 'ABSthClassList2'
          }

          for (var k in this.sortedField){
            var field = this.sortedField[k].field
            var sort = this.sortedField[k].sort
            // alert('urutan=>' + k + '_' + field + '_' + sort)

            if (field == keys[j]) {
              if (sort == 'ASC') {
                thClass = thClass + ' AscSorted'
              } else {
                thClass = thClass + ' DescSorted'
              }
              break
            }
          }
          
          // get value => record[keys[j]]
          if (keys[j].toLowerCase() == 'separator') {
            continue
          }

          if (this.languageStatus) {
            this.fieldHeader.push({
              value: j + 1,
              key: keys[j],
              thClass: thClass,
              tdClass: tdClass,
              text: keys[j],
              label: this.$t(keys[j])
            })
          } else {

            var listReplace = [
              {
                key: 'TrxAnalysisCd',
                value: 'Trx Analysis Code'
              },
              {
                key: 'DebtorAnalysisCd',
                value: 'Debtor Analysis Code'
              },
              {
                key: 'FixedAssetAnalysisCd',
                value: 'Fixed Asset Analysis Code'
              },
              {
                key: 'AccountAnalysisCd',
                value: 'Account Analysis Code'
              },
              {
                key: 'StockAnalysisCd',
                value: 'Stock Analysis Code'
              },
              {
                key: 'TagAnalysisCd',
                value: 'Tag Analysis Code'
              },
              {
                key: 'ItemAnalysisCd',
                value: 'Item Analysis Code'
              },
              {
                key: 'SupplierAnalysisCd',
                value: 'Supplier Analysis Code'
              },
              {
                key: 'LotAnalysisCd',
                value: 'Lot Analysis Code'
              },
              // {
              //   key: 'DocumentTypeCd',
              //   value: 'Document Type Code'
              // },
              {
                key: '_',
                value: ' '
              },
              {
                key: 'Amt',
                value: ' Amount'
              },
              {
                key: 'Cd',
                value: ' Code'
              },
              {
                key: 'Descs',
                value: ' Description'
              },
              {
                key: 'time_edit',
                value: 'Last Update'
              },
              {
                key: 'garing',
                value: '/'
              },
              {
                key: 'titik',
                value: '.'
              },
            ]
            var isGotIt = false
            var labelHeader = undefined

            if (keys[j].includes('_')) {
              labelHeader = keys[j].toLowerCase().split('_').map((s) => {
                return s.charAt(0).toUpperCase() + s.substring(1)
              }).join(' ')
            }
            else {
              labelHeader = keys[j].charAt(0).toUpperCase() + keys[j].substring(1)
            }

            for (var data of listReplace) {
              if (labelHeader == undefined) {
                labelHeader = this.replaceAllString(keys[j], data.key, data.value)
              } else {
                if (labelHeader.includes(data.key)) {
                  labelHeader = this.replaceAllString(labelHeader, data.key, data.value)
                }
              }
            }
            
            this.fieldHeader.push({
              value: j + 1,
              key: keys[j].split("=")[0].trim(),
              thClass: thClass,
              tdClass: tdClass,
              label: labelHeader
            })

            // for (var data of listReplace) {
            //   if (keys[j].includes(data.key)) {
            //     isGotIt = true
            //     // labelHeader = this.replaceAllString(keys[j], data.key, data.value)
            //     // break

            //     if (labelHeader == undefined) {
            //       // labelHeader = str_array[i].replace(data.key, data.value)
            //       labelHeader = this.replaceAllString(keys[j], data.key, data.value)
            //     } else {
            //       // labelHeader = labelHeader.replace(data.key, data.value)
            //       labelHeader = this.replaceAllString(labelHeader, data.key, data.value)
            //     }
            //   }
            // }

            // if (isGotIt) {
            //   if (labelHeader.includes('=')) {
            //     labelHeader = labelHeader.split("=")[0].trim()
            //   }

            //   this.fieldHeader.push({
            //     value: j + 1,
            //     key: keys[j].split("=")[0].trim(),
            //     thClass: thClass,
            //     tdClass: tdClass,
            //     label: labelHeader
            //   })
            // } else {
            //   this.fieldHeader.push({
            //     value: j + 1,
            //     key: keys[j].split("=")[0].trim(),
            //     thClass: thClass,
            //     tdClass: tdClass,
            //     text: keys[j].split("=")[0].trim()
            //   })
            // }
          }
        }

        this.totalRows = this.responses.Total;
        this.lastPage = this.responses.Last_Page;

        // this.loader = false;
      });

      // if (method != undefined) {
      //   var datax = {
      //     pageLevel: this.prop.PageLevel,
      //     tabIndex: this.prop.TabIndex
      //   };
      //   if (method.toUpperCase() == "REFRESH") {
      //     this.currentPage = 1;
      //     this.getToolbarAbsList().unselectRow(datax);
      //   } else if (method == "pageSize") {
      //     this.$emit("pageSize");
      //     this.getToolbarAbsList().unselectRow(datax);
      //   } else if (method == "pagination") {
      //     this.$emit("pagination");
      //     this.getToolbarAbsList().unselectRow(datax);
      //   } else if (method == "refresh_filter") {
      //     this.$emit("filter");
      //     this.getToolbarAbsList().unselectRow(datax);
      //   } else if (method == "headTable") {
      //     this.$emit("headTable");
      //     this.getToolbarAbsList().unselectRow(datax);
      //   }
      // }
    }
  },
  beforeCreate: function() {},
  created: function() {
    // EventBus.$on("eb_postAndDelete" + this.prop.PageLevel, data => {
    //   this.doPostOrDelete(data);
    // });
    if (this.dataLookUp) {
      if (this.dataLookUp.OrderBy == undefined) {
      } else if (this.dataLookUp.OrderBy == "") {
      } else if (this.dataLookUp.OrderBy != undefined) {
        this.sort = this.dataLookUp.OrderBy;
      }
    }
  },
  beforeMount: function() {},
  mounted: function() {
    // this.doGetList('', 'mounted')
  },
  beforeUpdate: function() {},
  updated: function() {},
  beforeDestroy: function() {
    // EventBus.$off("eb_postAndDelete" + this.prop.PageLevel);
  },
  destroyed: function() {}
};
</script>

<style scoped>
div.draggable {
  cursor: move;
  position: relative;
  display: block;
  padding: 10px 15px;
  /* margin-bottom: -1px; */
  background-color: #fff;
  border-bottom: 1px solid #ddd;
}

span.btn-remove {
  cursor: pointer;
  display: inline-block;
  min-width: 10px;
  padding: 5px 7px;
  font-size: 12px;
  font-weight: bold;
  line-height: 1;
  color: #fff;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  background-color: #dc3545;
  border-radius: 0;
  float: right;
  margin-top: 5px;
}

div.arrow-move {
  text-align: center;
  /* margin-top: 23%; */
  align-self: center;
  margin: 20px;
}

span.likeLink {
  cursor: pointer;
  text-decoration: none;
  color: #007bff;
}
span.likeLink:hover {
  color: #0056b3;
  text-decoration: underline;
}

.dropbtn {
  /* background-color: #4CAF50;
      color: white;
      padding: 16px;
      font-size: 16px; */
  background: transparent;
  border: none;
  /* transition:0s 100s; */
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  right: 0;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  /* transition: all 100s; */
}

.dropdown-content a:hover {
  background-color: #f1f1f1;
}
.dropdown:hover .dropdown-content {
  display: block;
}
.dropdown:hover .dropbtn {
  background-color: #d9efff;
}

.dropdown:not(:hover) {
  transition: all 0.1s;
  transition-delay: 5s;
}

.dropdown-content:not(:hover) {
  transition: all 0.1s;
  transition-delay: 5s;
}

/* LOADER 2 */
.bullet--1 {
  background-color: #ff5460;
  animation: move 2s infinite cubic-bezier(0.2, 0.64, 0.81, 0.23);
}
.bullet--2 {
  background-color: #ff9d84;
  animation: move 2s 150ms infinite cubic-bezier(0.2, 0.64, 0.81, 0.23);
}
.bullet--3 {
  background-color: #f0e797;
  animation: move 2s 300ms infinite cubic-bezier(0.2, 0.64, 0.81, 0.23);
}
.bullet--4 {
  background-color: #75b08a;
  animation: move 2s 450ms infinite cubic-bezier(0.2, 0.64, 0.81, 0.23);
}

.form-control:focus {
  
  box-shadow: none!important;
  border-top: transparent !important;
  border-right: transparent !important;
  border-left: transparent !important;

  
}

@keyframes move {
  0% {
    left: 0%;
  }
  100% {
    left: 100%;
  }
}
</style>