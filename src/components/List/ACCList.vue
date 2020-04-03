<template>
  <div class="card">
    <div class="card__title" style="padding-bottom: 5px !important;">
      <b-row>
        <b-col style="max-width:fit-content !important;">
          <span>{{title}}</span>
        </b-col>
        <b-col style="text-align: right;">
          <b-row>
            <b-col>
              <span>
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
                ></b-form-input>
              </span>
            </b-col>
          </b-row>
        </b-col>
        <b-col md="4" class="col-right">
          <span>
            <ABSButton
              :text="'Search'"
              classButton="button button--new"
              classIcon="icon-style-1"
              :disabled="false"
              @click="onSearchEnter"
            />
          </span>

          <span>
            <ABSButton
              :text="'Add New'"
              classButton="button button--new"
              classIcon="icon-style-1"
              :disabled="true"
            />
          </span>

          <span>
            <ABSButton
              :text="'Back'"
              classButton="button button--new"
              classIcon="icon-style-1"
              :disabled="true"
            />
          </span>
          <span>
            <div
              :class="isDisableTable ? '' : 'dropdown'"
              style="float:right;"
              v-show="!hideCheckboxAndGear"
            >
              <!-- <button class="dropbtn">
                                <i class="icon-settings"></i>
              </button>-->
              <ABSButton
                :text="'Export'"
                classButton="button button--save"
                classIcon="icon-style-1"
                :disabled="false"
              />
              <div class="dropdown-content">
                <div class="dropdown-modal-list" @click="openModalExport">
                  <font-awesome-icon icon="file-pdf" class="icon-style-1__exportPdf" />&nbsp;&nbsp;PDF
                </div>
                <div class="dropdown-modal-list" @click="openModalColumn">
                  <font-awesome-icon icon="file-csv" class="icon-style-1__exportIcon" />&nbsp;&nbsp;CSV
                </div>
                <div class="dropdown-modal-list" @click="openModalFilter">
                  <font-awesome-icon icon="file-excel" class="icon-style-1__exportIcon" />&nbsp;&nbsp;Excel
                </div>
              </div>
            </div>
          </span>
        </b-col>
      </b-row>
    </div>
    <div class="card__body">
      <div class="table--list">
        <b-table
          :responsive="true"
          :striped="false"
          :bordered="false"
          :outlined="false"
          :small="false"
          :hover="true"
          :dark="false"
          :fixed="false"
          :foot-clone="false"
          :fields="fieldHeader"
          :items="items"
          @head-clicked="headClicked"
          @row-clicked="rowClicked"
          @row-dblclicked="rowDblClicked"
          class="table-sm table-style-2"
        >
          <!-- <template slot="HEAD_chkBoxAction" slot-scope="data">
                                <b-form-checkbox
                                    v-show="!hideCheckboxAndGear || !hideCheckbox"
                                    @click.native.stop
                                    @change="headChkBoxAction"
                                    v-model="selected"
                                    :disabled="isDisableTable"
                                />
          </template>-->

          <!-- <template slot="chkBoxAction" slot-scope="row">
                                <b-form-checkbox
                                    v-show="!hideCheckboxAndGear || !hideCheckbox"
                                    @dblclick.native.stop
                                    @click.native.stop
                                    @change="chkBoxAction(row.index)"
                                    @input="chkBoxInput(row.index)"
                                    v-model="rowSelected"
                                    :value="row.index"
                                    :disabled="isDisableTable || (isCheckDisable == undefined ? false: row.item[isCheckDisable] == null)"
                                    style="min-height:15px !important;padding-top:0px !important;"
                                />
          </template>-->
        </b-table>
      </div>
    </div>
    <div class="card__footer">
      <b-form inline style="float: left; color: #333;">
        <label
          class="font-lbl"
          style="margin-bottom:0px !important; margin-right:0px !important;"
        >Page Size</label>
        <b-form-select
          id="cmbPerPage"
          v-model="perPage"
          v-on:input="doGetList($store.getters['getSearch' + prop.PageLevel], 'pageSize')"
          :options="pagingData"
          class="sm-3 mgn-left-10 font-lbl page-size-left"
          :disabled="isDisableTable"
        ></b-form-select>
        of {{ this.totalRows }} Records
      </b-form>

      <b-pagination
        align="right"
        v-model="currentPage"
        @input="doGetList($store.getters['getSearch' + prop.PageLevel], 'pagination')"
        :total-rows="totalRows"
        :per-page="perPage"
        :limit="limit"
        style="margin-bottom: 0px;"
        :disabled="isDisableTable"
      ></b-pagination>
    </div>
    <!-- Start Modal -->
    <b-modal
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
            <div class="modal-customize-abs__modal-header--title">Export {{title}} to Excel</div>
            <div class="modal-customize-abs__modal-header--icon" @click="$refs.modalExport.hide()">
              <i class="icon-close"></i>
            </div>
          </div>
          <div class="modal-customize-abs__modal-body">
            <p>Select data that will be exported</p>
            <div class="box-category">
              <div class="box-category__list-category-export" @click="doExportXLS('S')">
                <img :src="require('@/assets/export-select.png')" alt />
                Export Selected Data
              </div>
              <div
                class="box-category__list-category-export category-all"
                @click="doExportXLS('A')"
              >
                <img :src="require('@/assets/export-all.png')" alt />
                Export All
              </div>
            </div>
          </div>
        </b-col>
      </b-row>
    </b-modal>

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
              <div class="modal-customize-abs__modal-header--title">Edit Column</div>
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
                      <br />
                      <span>Select column below to display in your grid</span>
                    </div>
                    <br />
                    <div v-if="availableColumn.length > 0">
                      <ABSMultiSelect
                        v-model="availableColumnSelected"
                        :options="availableColumn"
                        size="10"
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
                      <font-awesome-icon icon="angle-double-right" class="icon-style-5" />
                    </b-button>
                  </div>
                </b-col>
                <b-col sm="5">
                  <div>
                    <div class="divCustom">
                      <b>Selected Column</b>
                      <br />
                      <span>Drag the column names below to reorder how they will appear above your grid</span>
                    </div>
                    <br />
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
                            <font-awesome-icon icon="trash" />&nbsp;Delete
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
              <br />
              <b-row>
                <b-col cols="12">
                  <b-button size="sm" block variant="success" @click="modalColumnHandleOk">Ok</b-button>
                </b-col>
              </b-row>
              <br />
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
              <div class="modal-customize-abs__modal-header--title">Filter Builder</div>
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
                    <div class="icon-close-filter" @click="M_RemoveFilter(index)">
                      <i class="icon-trash"></i>
                    </div>
                  </b-col>
                </b-row>
              </div>
              <hr />
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
              <br />
            </div>
          </b-col>
        </b-row>
      </b-container>
    </b-modal>
  </div>
</template>

<script>
export default {
  props: {
    prop: {
      initialWhere: String,
      LineNo: Number,
      PageLevel: String,
      TabIndex: String,
      OrderBy: String,
      SourceField: String,
      ParamView: String
    },
    title: String,
    isProcess: Boolean,
    isCheckDisable: String,
    isCheckAsStatus: String,
    statusFalse: String,
    hideCheckboxAndGear: Boolean,
    hideCheckbox: Boolean,
    cShowNumber: Boolean
  },
  data() {
    return {
      isFirst: false,
      selected: false,
      rowSelected: [],
      dataSelected: [],
      rowSel: -1,

      search: "",
      isSearchDisable: false,
      fieldHeader: [],
      items: [],
      firstSort: true,
      sort: "time_edit DESC",

      totalRows: 0,
      currentPage: 1,
      lastPage: 1,
      perPage: 5,
      limit: 2,
      pagingData: [
        { value: 5, text: "5" },
        { value: 10, text: "10" },
        { value: 15, text: "15" },
        { value: 20, text: "20" },
        { value: 40, text: "40" },
        { value: 60, text: "60" },
        { value: 80, text: "80" },
        { value: 100, text: "100" },
        { value: 1000, text: "1000" }
      ],

      fileName: "TestExport",
      ExportToken: "",

      availableColumn: [],
      availableColumnTemp: [],
      availableColumnSelected: null,
      selectedColumn: [],
      selectedColumnTemp: [],
      selectedColumnSelected: [],

      sortedField: [{ field: "time_edit", sort: "DESC" }],

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
      tempAdvanceFilter: "",
      allColumn_bf: []
    };
  },
  computed: {},
  methods: {
    openModalExport() {
      // this.$store.commit("setLevel", this.prop.PageLevel);
      // this.$store.commit("setTab", this.prop.TabIndex);
      this.$refs.modalExport.show();
    },
    openModalColumn() {
      // this.$store.commit("setLevel", this.prop.PageLevel);
      // this.$store.commit("setTab", this.prop.TabIndex);
      // this.availableColumnTemp = this.availableColumnStatic
      // this.selectedColumnTemp = this.selectedColumnStatic

      // this.availableColumn = this.availableColumnStatic
      // this.selectedColumn = this.selectedColumnStatic

      this.doGetList("", "refresh_column");
      this.$refs.modalColumn.show();
    },
    openModalFilter() {
      // this.$store.commit("setLevel", this.prop.PageLevel);
      // this.$store.commit("setTab", this.prop.TabIndex);
      this.$refs.modalFilter.show();
    },
    resetSelected() {
      this.rowSelected = [0];
      this.selected = false;
      this.items[0]["_rowVariant"] = "primary";
      this.rowSel = -1;
    },
    checkOrderBy() {
      if (this.prop.OrderBy == undefined) {
      } else if (this.prop.OrderBy == "") {
      } else if (this.prop.OrderBy != undefined) {
        this.sort = this.prop.OrderBy;
      }
    },
    onSearchEnter(data) {
      // console.log(data);
      this.doGetList(this.search, "onSearchEnter");
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
        var theFilter = "";
        var sign = filter.signFilter;
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
      this.tempAdvanceFilter = filterString;
      this.doGetList("", "refresh_filter");
      this.$refs.modalFilter.hide();
    },
    modalColumnHandleOk() {
      var field = "";

      this.selectedColumn.forEach((el, index) => {
        if (index == this.selectedColumn.length - 1) {
          field += el.key;
        } else {
          field += el.key + ",";
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
          var thClass = "ABSthClassList";
          var isSorted = this.sortedField.map(x => x.field).indexOf(ar.key);
          if (isSorted > -1) {
            if (this.sortedField[isSorted].sort == "ASC") {
              thClass = thClass + " AscSorted";
            } else {
              thClass = thClass + " DescSorted";
            }
          }

          this.fieldHeader.push({
            value: ar.value,
            key: ar.key,
            thClass: thClass,
            tdClass: "ABStdClassList notranslate",
            value: ar.key
          });
        });

        this.doGetList("", "refresh_column");
        this.$refs.modalColumn.hide();
      });
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
      if (this.selectedColumn.length == 1) {
        this.alertWarning("Selected Column Should Have At Least One Column");
        return;
      }

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

      if (field.toUpperCase() == "TIME_EDIT") {
        this.firstSort = false;
      } else {
        if (this.firstSort == true) {
          var b = this.sortedField
            .map(e => e.field.toUpperCase())
            .indexOf("TIME_EDIT");
          if (b > -1) {
            this.sortedField.splice(b, 1);
          }
        }
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
          // this.sortedField[x].sort = "ASC"
          this.sortedField.splice(x, 1);
        }
      } else {
        this.sortedField.push({ field: field, sort: "ASC" });
      }

      if (this.sortedField.length > 0) {
        this.sortedField.forEach(el => {
          if (!(this.firstSort && el.field.toUpperCase() == "TIME_EDIT")) {
            this.sort += el.field + " " + el.sort + ",";
          }

          // this.sort += el.field + " " + el.sort + ","
        });

        this.sort = this.sort.substr(0, this.sort.length - 1);
      } else {
        for (var i = 0; i < this.allColumn_bf.length; i++) {
          if (this.allColumn_bf[i].toLowerCase() == "time_edit") {
            this.sort = "time_edit DESC";
          }
        }
      }

      // this.doGetList(this.$store.getters.getSearch, "headTable")
      this.doGetList(this.search, "headTable");
      this.resetSelected();
      this.$emit("headClicked");
    },
    rowClicked: function(record, index) {
      if (this.isDisableTable || this.isProcess == true) return;
      if (this.rowSel != -1) {
        this.items[this.rowSel]["_rowVariant"] = "";
      }

      this.rowSel = index;
      this.items[index]["_rowVariant"] = "primary";
      this.$forceUpdate();

      this.$emit("rowClicked", record, index);
    },
    rowDblClicked: function(record, index) {
      if (this.isDisableTable) return;
      this.$emit("rowDblClicked", record, index);
    },
    doGetList(search, method) {
      this.checkOrderBy();
      // if (this.getIsCallBack()) {
      // } else if (this.getIsPopup() && method == 'eb_getList') {
      //     return
      // }
      var data = {
        Event: method,
        PageLevel: this.prop.PageLevel,
        TabIndex: this.dataState.TabIndex
      };

      // this.$store.commit("setEventStatus", method);
      // jika advance filter kosong '' maka kasih initial where aja
      // selainnya berarti inital where + advance filter

      // var temp =
      //     this.tempAdvanceFilter == ""
      //     ? this.prop.initialWhere
      //     : this.prop.initialWhere == "" ? this.prop.initialWhere + this.tempAdvanceFilter : this.prop.initialWhere + " AND " + this.tempAdvanceFilter;
      var temp = this.prop.initialWhere;

      if (method != undefined) {
        if (method == "save" || method == "update" || method == "refresh") {
          temp = this.prop.initialWhere;
          this.sortedField = [];
          if (this.prop.OrderBy && this.prop.OrderBy != "") {
            this.sort = this.prop.OrderBy;
          } else {
            this.sort = "time_edit DESC";
            this.sortedField.push({ field: "time_edit", sort: "DESC" });
            this.firstSort = true;
          }
          this.perPage = 5;
          this.currentPage = 1;
        } else if (method == "pageSize" || method == "ONSEARCHENTER") {
          this.currentPage = 1;
        }
      }

      // if (this.formType == "Inquiry") {
      //   this.sort = ""
      // }

      var param = {
        // OptionSeq: this.getOptionSeq().OptionSeq,
        // LineNo: this.prop.LineNo,
        // user_id: this.getDataUser().user_id,
        // portfolio_cd: this.getDataUser().portfolio_cd,
        // subportfolio_cd: this.getDataUser().subportfolio_cd,
        // CurrentPage: this.currentPage,
        // PerPage: this.perPage,
        // ParamWhere: search,
        // InitialWhere: temp,
        // SortField: this.sort,
        // SourceField: this.prop.SourceField,
        // ParamView: this.prop.ParamView
        option_url: "/SS/SS_Portfolio", //this.getOptionUrl(),
        line_no: this.prop.LineNo,
        user_id: this.getDataUser().user_id,
        portfolio_id: this.getDataUser().portfolio_id,
        subportfolio_id: this.getDataUser().subportfolio_id,
        current_page: this.currentPage,
        per_page: this.perPage,
        param_where: search,
        initial_where: temp,
        sort_field: this.sort,
        source_field: this.prop.SourceField,
        param_view: this.prop.ParamView
      };

      // this.loader = true;
      this.postJSON(this.getUrlList(), param).then(response => {
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

        var str_array = this.responses.DefineColumn.split(",");
        var defineSize = this.responses.DefineSize.split(",");
        this.allColumn_bf = this.responses.AllColumn.split(",");
        var index = this.allColumn_bf.indexOf("lastupdatestamp");
        if (index > -1) {
          this.allColumn_bf.splice(index, 1);
        }
        var allColumn = [];
        var filteredColumn = [];
        var definedColumn = [];

        // this.fieldHeader.push({
        //     value: 0,
        //     key: "chkBoxAction"
        // });

        // HeaderACCList
        // ContentACCList

        this.allColumn_bf.forEach((val, idx) => {
          var thClass = "HeaderACCList";
          var isSorted = this.sortedField.map(x => x.field).indexOf(val);
          if (isSorted > -1) {
            if (this.sortedField[isSorted].sort == "ASC") {
              thClass = thClass + " AscSorted";
            } else {
              thClass = thClass + " DescSorted";
            }
          }

          allColumn.push({
            value: idx + 1,
            key: val,
            thClass: thClass,
            tdClass: "ContentACCList notranslate",
            text: val
          });

          filteredColumn.push({
            value: idx + 1,
            key: val,
            thClass: thClass,
            tdClass: "ContentACCList notranslate"
          });
        });

        for (var i = 0; i < str_array.length; i++) {
          filteredColumn = filteredColumn.filter(val => {
            if (val.key == str_array[i]) {
              definedColumn.push({
                value: val.value,
                key: val.key,
                thClass: val.thClass,
                tdClass: val.tdClass,
                text: val.key
              });
            }

            return val.key != str_array[i];
          });

          var thClass = "HeaderACCList " + defineSize[i];

          var tdClass = "ContentACCList notranslate";
          if (
            str_array[i].toLowerCase().includes("amount") ||
            str_array[i].toLowerCase().includes("amt") ||
            str_array[i].toLowerCase().includes("rate") ||
            str_array[i].toLowerCase().includes("price")
          ) {
            tdClass = "ABStdClassList2 notranslate";
            thClass = "ABSthClassList2";
          }

          var isSorted = this.sortedField
            .map(x => x.field)
            .indexOf(str_array[i]);
          if (isSorted > -1) {
            if (this.sortedField[isSorted].sort == "ASC") {
              thClass = thClass + " AscSorted";
            } else {
              thClass = thClass + " DescSorted";
            }
          }

          if (this.languageStatus) {
            this.fieldHeader.push({
              value: i + 1,
              key: str_array[i],
              thClass: thClass,
              tdClass: tdClass,
              label: this.$t(str_array[i])
            });
          } else {
            var listReplace = [
              {
                key: "_",
                value: " "
              },
              {
                key: "Amt",
                value: " Amount"
              },
              {
                key: "Cd",
                value: " Code"
              },
              {
                key: "Descs",
                value: " Description"
              },
              {
                key: "Time Edit",
                value: "Last Update"
              },
              {
                key: "Batch Status",
                value: "Status"
              },
              {
                key: "garing",
                value: "/"
              },
              {
                key: "titik",
                value: "."
              },
              {
                key: "SnP",
                value: "SnP "
              },
              {
                key: "VO",
                value: "VO "
              }
            ];
            var isGotIt = false;
            var labelHeader = undefined;

            if (str_array[i].includes("_")) {
              labelHeader = str_array[i]
                .toLowerCase()
                .split("_")
                .map(s => {
                  return s.charAt(0).toUpperCase() + s.substring(1);
                })
                .join(" ");
            } else {
              // if (str_array[i] !== 'lastupdatestamp') {
              labelHeader =
                str_array[i].charAt(0).toUpperCase() +
                str_array[i].substring(1);
              // }
            }

            // for (var data of listReplace) {
            //   if (str_array[i].includes(data.key)) {
            //     isGotIt = true
            //     if (labelHeader == undefined) {
            //       // labelHeader = str_array[i].replace(data.key, data.value)
            //       labelHeader = this.replaceAllString(str_array[i], data.key, data.value)
            //     } else {
            //       // labelHeader = labelHeader.replace(data.key, data.value)
            //       labelHeader = this.replaceAllString(labelHeader, data.key, data.value)
            //     }
            //     // break
            //   }
            // }

            for (var data of listReplace) {
              if (labelHeader == undefined) {
                labelHeader = this.replaceAllString(
                  str_array[i],
                  data.key,
                  data.value
                );
              } else {
                if (labelHeader.includes(data.key)) {
                  labelHeader = this.replaceAllString(
                    labelHeader,
                    data.key,
                    data.value
                  );
                }
              }
            }

            this.fieldHeader.push({
              value: i + 1,
              key: str_array[i],
              thClass: thClass,
              tdClass: tdClass,
              label: labelHeader
            });

            // if (isGotIt) {
            //   // str_array[i] = 'Last Update'
            //   this.fieldHeader.push({
            //     value: i + 1,
            //     key: str_array[i],
            //     thClass: thClass,
            //     tdClass: tdClass,
            //     label: labelHeader
            //   })
            // } else {
            //   labelHeader = undefined

            //   if (str_array[i].includes('SnP')) {
            //     labelHeader = this.replaceAllString(str_array[i], 'SnP', 'SnP ')
            //   }
            //   else if (str_array[i].includes('VO')) {
            //     labelHeader = this.replaceAllString(str_array[i], 'VO', 'VO ')
            //   }

            //   this.fieldHeader.push({
            //     value: i + 1,
            //     key: str_array[i],
            //     thClass: thClass,
            //     tdClass: tdClass,
            //     label: labelHeader
            //   })
            // }
            // this.fieldHeader.push({
            //   value: i + 1,
            //   key: str_array[i],
            //   thClass: thClass,
            //   tdClass: tdClass
            // });
          }
        }

        this.availableColumn = filteredColumn;
        this.selectedColumn = definedColumn;

        this.availableColumnTemp = filteredColumn;
        this.selectedColumnTemp = definedColumn;

        // this.availableColumnStatic = filteredColumn;
        // this.selectedColumnStatic = definedColumn;

        this.totalRows = this.responses.Total;
        this.lastPage = this.responses.Last_Page;

        if (this.isCheckAsStatus != undefined) {
          var cInt = 0;
          for (var i = 0; i < this.items.length; i++) {
            var d = this.isCheckAsStatus.split("=")[0];
            var dt = this.items[i][d];
            var value = this.isCheckAsStatus.split("=")[1];
            // if (this.isCheckAsStatus.split("=")[1] == "true") {
            //   value = true
            // }
            // else if (this.isCheckAsStatus.split("=")[1] == "false") {
            //   value = false
            // }
            // if (this.items[i]._checked == 'Y') {
            if (dt) {
              if (dt.toString() == value) {
                this.rowSelected.push(i);
                cInt++;
              }
            }

            if (cInt == this.items.length) {
              this.selected = true;
            }
          }
        }
      });

      if (method != undefined) {
        var datax = {
          // pageLevel: this.prop.PageLevel,
          // tabIndex: this.prop.TabIndex
        };
        if (method.toUpperCase() == "REFRESH") {
          this.currentPage = 1;
          // this.getToolbarAbsList().unselectRow(datax);
        } else if (method == "pageSize") {
          this.$emit("pageSize");
          // this.getToolbarAbsList().unselectRow(datax);
        } else if (method == "pagination") {
          this.$emit("pagination");
          // this.getToolbarAbsList().unselectRow(datax);
        } else if (method == "refresh_filter") {
          this.$emit("filter");
          // this.getToolbarAbsList().unselectRow(datax);
        } else if (method == "headTable") {
          this.$emit("headTable");
          // this.getToolbarAbsList().unselectRow(datax);
        } else if (method == "ONSEARCHENTER") {
          // this.getToolbarAbsList().unselectRow(datax);
        } else if (method == "refresh_column") {
          // this.$emit("refreshColumn");
        }
      }
    },
    doGetlist2() {
      this.items = [
        {
          no: 1,
          date: "10-01-2020 12.00",
          customer_name: "PT Abadi Sentosa",
          contact_person: "Basa Aritonang",
          phone_no: "+62-818-889978788",
          row_id: 1
        },
        {
          no: 2,
          date: "10-01-2020 12.00",
          customer_name: "PT Gemini Perkasa Abadi",
          contact_person: "Ivan Laksana",
          phone_no: "+62-818-889978788",
          row_id: 2
        },
        {
          no: 3,
          date: "10-01-2020 12.00",
          customer_name: "PT Garuda Perkasa",
          contact_person: "Steven Chai",
          phone_no: "+62-818-889978788",
          row_id: 3
        },
        {
          no: 4,
          date: "10-01-2020 12.00",
          customer_name: "PT Indo Sejahtera",
          contact_person: "Triyono",
          phone_no: "+62-818-889978788",
          row_id: 4
        },
        {
          no: 5,
          date: "10-01-2020 12.00",
          customer_name: "PT Provost Utama Tama",
          contact_person: "Fingky Endawan",
          phone_no: "+62-818-889978788",
          row_id: 5
        }
      ];

      this.fieldHeader = [
        {
          key: "no",
          label: "No",
          thClass: "HeaderACCList",
          tdClass: "ContentACCList"
        },
        {
          key: "date",
          label: "Date Added",
          thClass: "HeaderACCList",
          tdClass: "ContentACCList"
        },
        {
          key: "customer_name",
          label: "Customer Name",
          thClass: "HeaderACCList",
          tdClass: "ContentACCList"
        },
        {
          key: "contact_person",
          label: "Contact Person",
          thClass: "HeaderACCList",
          tdClass: "ContentACCList"
        },
        {
          key: "phone_no",
          label: "Phone No",
          thClass: "HeaderACCList",
          tdClass: "ContentACCList"
        }
      ];
    }
  },
  mounted() {
    // this.doGetlist2();
  }
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
  background: transparent;
  border: none;
  font-size: 15px !important;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  text-align: left;
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

.isProcessNeeds {
  color: #000000 !important;
  height: 36px !important;
}
</style>