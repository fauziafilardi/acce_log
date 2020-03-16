<template>
  <div style="padding-left: 15px;padding-right: 15px;">
    <!-- MODAL COLUMN -->
    <b-modal
      id="modalColumn"
      title="Edit Column"
      size="lg"
      ref="modalColumn"
      class="modalCustomABS"
    >
      <b-row>
        <b-col sm="5">
          <div>
            <div class="divCustom">
              <b>Available Columns</b> <br>
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
            <div v-else> <b> No Additional Properties </b> </div>
          </div>
        </b-col>
        <div class="arrow-move">
          <b-button
            @click="M_moveRight"
            size="sm"
            variant="primary"
          >
            <font-awesome-icon icon="angle-double-right" class="icon-style-5"/>
          </b-button>
        </div>
        <b-col sm="5">
          <div>
            <div class="divCustom">
              <b>Selected Column</b> <br>
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
                <div
                  v-for="element in selectedColumn"
                  :key="element.value"
                  class="draggable"
                >
                  {{element.key}}
                  <span>
                    <span
                      class="btn-remove"
                      style="margin-top:0px; float:right;"
                      @click="M_moveLeft(element.value)"
                    >
                      <font-awesome-icon icon="trash" /> Delete
                    </span>
                  </span>
                </div>
              </draggable>
            <div v-else> <b> No Column Selected </b> </div>
          </div>
        </b-col>
      </b-row>
      <div slot="modal-footer" class="w-100">
        <div style="padding-right:20px;">
          <b-btn
            size="sm"
            class="float-right btnModal__btnCancel"
            @click="$refs.modalColumn.hide()"
          >
            Cancel
          </b-btn>       
          <b-btn
            size="sm"
            class="float-right btnModal__btnOK"
            variant="primary"
            @click="modalColumnHandleOk"
          >
            OK
          </b-btn>       
        </div>         
      </div>
    </b-modal>
    <!-- ./MODAL COLUMN -->

    <!-- MODAL FILTER -->
    <b-modal
      id="modalFilter"
      title="Filter Builder"       
      size="lg"
      ref="modalFilter"
      class="modalCustomABS"
    >
      <b-button
        @click="doAddFilter()"
        size="sm"
        variant="primary"
      >
        Add
      </b-button>  
      <div style="padding-top:20px;">
        <b-row
          v-for="(data, index) in filteredColumn"
          :key="index"
        >
          <b-col
            align-h="left"
            style="padding-bottom:10px; padding-right:0px !important; padding-left:20px !important; max-width:50px !important;"
          >
            <b-button
              @click="M_RemoveFilter(index)"
              size="sm"
              class="btnModal__btnDelete"
            >
              <font-awesome-icon icon="times" class="icon-style-5"/>
            </b-button>
          </b-col>
          <b-col sm="4">
            <b-form-select
              v-model="data.columnName"
              :options="selectedColumn"
              class="sm-3 font-lbl"
              size="sm"
              style="height:30px"
            />
          </b-col>
          <b-col sm="3">
            <b-form-select
              v-model="data.signFilter"
              :options="signFilter"
              class="sm-3 font-lbl"
              size="sm"
              style="height:30px"
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
              style="height:30px" 
            />
          </b-col>
        </b-row>
      </div>
      <div slot="modal-footer" class="w-100">
        <div style="padding-right:20px;">
          <b-btn
            size="sm"
            class="float-right btnModal__btnCancel"
            @click="$refs.modalFilter.hide()"
          >
            Cancel
          </b-btn>
          <b-btn
            size="sm"
            class="float-right btnModal__btnOK"
            variant="primary"
            @click="modalFilterHandleOk"
          >
            OK
          </b-btn>          
        </div>         
      </div>
    </b-modal>
    <!-- /.MODAL FILTER -->

    <!-- MODAL EXPORT -->
    <b-modal
      id="modalExport"
      :hide-footer="true"
      :hide-header-close="true"
      size="md"
      ref="modalExport"
      class="modalCustomABS"
    >
      <div slot="modal-header" class="w-100">
        <div style="font-size:20px !important; color:#28a745 !important; text-align:center !important;">
          <b>Export {{title}} to Excel</b>
        </div>        
      </div>
      <b-row>
        <b-col
          sm="12"
          style="padding-top:20px; padding-bottom:10px !important; font-size:14px !important; text-align:center !important;"
        >
          Select data that will be exported
        </b-col>        
      </b-row>
      <b-row style="padding-top:20px;">
        <b-col sm="5" align-h="center" style="padding-bottom:7px;">
          <b-btn
            size="sm"
            class="float-center"
            style="width:100% !important;"
            variant="primary"
            @click="doExportXLS('S')"
          >
            Export Selected Data
          </b-btn>
        </b-col>
        <b-col
          sm="5"
          align-h="center"
          style="padding-bottom:7px;"
        >
          <b-btn
            size="sm"
            class="float-center"
            style="width:100% !important;"
            variant="success"
            @click="doExportXLS('A')"
          >
            Export All
          </b-btn>
        </b-col>
        <b-col sm="2" align-h="right" style="padding-bottom:7px;">
          <b-btn
            size="sm"
            class="float-center btnModal__btnCancel"
            style="margin:0px !important;"
            variant="primary"
            @click="$refs.modalExport.hide()"
          >
            Cancel
          </b-btn>
        </b-col>        
      </b-row>
    </b-modal>
    <!-- ./MODAL EXPORT -->

    <b-row>
      <b-col>
        <div class="dropdown dropdown--gear">
          <button class="dropbtn">
            <img :src="require(`@/assets/icons/Application.png`)" alt="" style="width:20px; padding-top:6px; padding-bottom:6px;">
          </button>
          <div class="dropdown-content">
            <a href="#" @click="openModalExport">
              <font-awesome-icon icon="file-export" class="icon-style-3"/> Export
            </a>
            <a href="#" @click="openModalColumn">
              <font-awesome-icon icon="columns" class="icon-style-1"/> Column
            </a>
            <a href="#" @click="openModalFilter">
              <font-awesome-icon icon="columns" class="icon-style-1"/> Advance Filter
            </a>
          </div>
        </div>
      </b-col>
    </b-row>

    <div style="overflow-x:auto;">
      <!-- TABLE SCOPE -->
      <b-table 
        :striped="false"
        :bordered="false"
        :outlined="false"
        :small="false"
        :hover="true"
        :dark="false"
        :fixed="false"
        :foot-clone="false"
        :fields="fields"
        :items="items"
        @head-clicked="headClicked"
        @row-clicked="rowClicked"
        @row-dblclicked="rowDblClicked"
        class="table-sm table-style-1"
        rules="row"
      >
        <template slot="HEAD_chkBoxAction" slot-scope="data">
          <div class="text--center">
            <b-form-checkbox
              @click.native.stop
              @change="headChkBoxAction"
              v-model="selected"
              :disabled="isDisableTable"
            />
          </div>
        </template>
        <template slot="chkBoxAction" slot-scope="row">
          <b-form-checkbox
            @dblclick.native.stop
            @click.native.stop
            @change="chkBoxAction(row.index)"
            v-model="rowSelected"
            :value="row.index"
            :disabled="isDisableTable"
          />
        </template>
      </b-table>
      <!-- ./TABLE SCOPE -->

      <!-- LOADER SCOPE -->
      <div class="loader--page" v-if="loader">
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
      </div>
      <!-- /.LOADER SCOPE -->
    </div>

    <!-- PAGINATION SCOPE -->
    <b-row align-h="right" class="header-list__1">
      <b-col align-h="left" sm="6">        
        <b-form inline style="float: left;">
          <label class="font-lbl">Page Size</label>
          <b-form-select
            id="cmbPerPage"
            v-model="perPage"
            v-on:input="doGetList('', 'pageSize')"
            :options="pagingData"
            style="height: 28px; !important"
            class="sm-3 mgn-left-10 font-lbl"
            :disabled="isDisableTable">
          </b-form-select>
          of {{ this.totalRows }} Records
        </b-form>
      </b-col>
      <b-col sm="6" align-h="center">
        <b-pagination align="right"
          v-model="currentPage"
          v-on:input="doGetList('', 'pagination')"
          :total-rows="totalRows"
          :per-page="perPage"
          :limit="limit"
          style="margin-bottom: 0px;"
          :disabled="isDisableTable">  
        </b-pagination>
      </b-col>
    </b-row>
    <!-- /.PAGINATION SCOPE -->
  </div>
</template>

<script>
import { EventBus } from "../../main";
import { setTimeout } from "timers";

export default {
  props: {
    prop: {
      initialWhere: String,
      LineNo: Number,
      PageLevel: String,
      TabIndex: String
    },
    title: String
  },
  data() {
    return {
      loader: false,
      selected: false,
      rowSelected: [],
      dataSelected: [],
      rowSel: -1,

      search: "",
      fields: [],
      items: [],
      sort: "TimeEdit DESC",

      // paging
      totalRows: 0,
      currentPage: 1,
      lastPage: 1,
      perPage: 5,
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
    isDisableTable() {
      return this.$store.getters.getListStatus;
    }
  },
  methods: {
    getToolbarAbsList() {
      return this.$parent.$parent.$parent.$parent.$parent.$parent.$children[0]
        .$children[1];
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
      this.prop.initialWhere = "";
      // this.sort = 'TimeEdit ASC'
      this.doGetList("", "refresh");
      this.resetSelected();
      this.$emit("doRefresh");
    },
    onSearchEnter(event) {
      this.doGetList("", "onSearchEnter");
    },
    getRowSelected() {
      var data = [];
      if (this.rowSelected.length > 0) {
        this.rowSelected.forEach(idx => {
          data.push(this.items[idx]);
        });
        return data;
      } else {
        this.alertWarning("No Data Selected");
      }
    },
    doPostOrDelete(act) {
      var data = [];
      if (this.rowSelected.length > 0) {
        this.rowSelected.forEach(idx => {
          data.push(this.items[idx]);
        });

        EventBus.$emit(
          "ebProcessPostAndDelete" +
            this.prop.PageLevel +
            "_" +
            this.prop.TabIndex,
          { Act: act, Data: data }
        );
      } else {
        if (act == "post") {
          this.alertWarning("No Data Selected To Post");
        } else if (act == "post") {
          this.alertWarning("No Data Selected To Delete");
        }
      }
    },
    M_Delete(data) {
      var param = {
        OptionSeq: this.getOptionSeq().OptionSeq,
        SubPortfolioCd: this.getDataUser().subportfolio_cd,
        PortfolioCd: this.getDataUser().portfolio_cd,
        LineNo: this.prop.LineNo,
        Data: data
      };

      this.postJSON(this.getUrlDeleteMulti(), param).then(response => {
        // response from API
        if (response == null) return;

        this.responses = response;
        this.alertSuccess("Deleting Data Successfully");
        this.doGetList("", "refresh_delete");
        this.resetSelected();
      });
    },
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
    M_PostData(data) {
      var param = {
        OptionSeq: this.getOptionSeq().OptionSeq,
        SubPortfolioCd: this.getDataUser().subportfolio_cd,
        PortfolioCd: this.getDataUser().portfolio_cd,
        LineNo: this.prop.LineNo,
        Data: data
      };
      console.table(param);
      this.postEncode(this.getUrlPostMulti(), param).then(response => {
        // response from API
        console.log("post");
        console.table(response);
        if (response == null) return;

        this.alertSuccess("Posting Data Successfully");
        this.doGetList("", "refresh_post");
        this.resetSelected();
      });
    },
    openModalExport() {
      this.$refs.modalExport.show();
    },
    openModalColumn() {
      this.$refs.modalColumn.show();
    },
    openModalFilter() {
      this.$refs.modalFilter.show();
      // v-b-modal.modalFilter
    },
    doCursorSearch() {
      document.getElementById(txtSearch).focus();
      document.getElementById(frmObj.id).select();
      alert("cursor");
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
      // this.prop.initialWhere = filterString
      this.tempAdvanceFilter = filterString;
      this.doGetList("", "refresh_filter");
      this.$refs.modalFilter.hide();
    },
    modalColumnHandleOk() {
      var field = "";

      this.selectedColumn.forEach((el, index) => {
        field += el.key + ",";
        if (index == this.selectedColumn.length - 1) {
          field = field.substr(0, field.length - 1);
        }
      });

      var param = {
        OptionSeq: this.getOptionSeq().OptionSeq,
        UserId: this.getDataUser().user_id,
        SubPortfolioCd: this.getDataUser().subportfolio_cd,
        ColumnField: field,
        UserInput: this.getDataUser().user_id,
        LineNo: this.prop.LineNo
      };

      this.postEncode(this.getUrlDefineColumn(), param).then(response => {
        // response from API
        if (response == null) return;

        this.responses = response;

        this.fields = [];
        this.fields.push({
          value: 0,
          key: "chkBoxAction"
        });
        this.selectedColumn.forEach(ar => {
          this.fields.push({
            value: ar.value,
            key: ar.key,
            thClass: "ABSthClassList",
            tdClass: "ABStdClassList",
            value: ar.key
          });
        });

        this.doGetList("", "refresh_column");
        this.$refs.modalColumn.hide();
      });
    },
    M_moveRight() {
      alert('bray')
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
      // alert(field)
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
          this.sortedField[x].sort = "ASC";
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
      var datax = {
        pageLevel: this.prop.PageLevel,
        tabIndex: this.prop.TabIndex
      };
      this.getToolbarAbsList().unselectRowAfterRowClick(datax);
    },
    unselectRowClicked() {
      this.items[this.rowSel]["_rowVariant"] = "";
      this.$forceUpdate();
    },
    rowDblClicked: function(record, index) {
      if (this.isDisableTable) return;
      this.$emit("rowDblClicked", record, index);
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
      var data = {
        Event: method,
        PageLevel: this.prop.PageLevel,
        TabIndex: this.dataState.TabIndex
      };

      this.$store.commit("setEventStatus", method);
      // jika advance filter kosong '' maka kasih initial where aja
      // selainnya berarti inital where + advance filter
      var temp =
        this.tempAdvanceFilter == ""
          ? this.prop.initialWhere
          : this.prop.initialWhere + " AND " + this.tempAdvanceFilter;
      var param = {
        OptionSeq: this.getOptionSeq().OptionSeq,
        LineNo: this.prop.LineNo,
        UserId: this.getDataUser().user_id,
        PortfolioCd: this.getDataUser().portfolio_cd,
        SubPortfolioCd: this.getDataUser().subportfolio_cd,
        CurrentPage: this.currentPage,
        PerPage: this.perPage,
        // ParamWhere: this.search,
        ParamWhere: search,
        // InitialWhere: this.prop.initialWhere,
        InitialWhere: temp,
        SortField: this.sort
      };
      // alert(this.sort)
      // alert(JSON.stringify(param))
      // console.log(param)
      this.loader = true;
      this.postEncode(this.getUrlList(), param).then(response => {
        if (response == null) return;
        this.selected = false;
        this.rowSelected = [];
        this.rowSel = 0;
        this.responses = response;
        this.ExportToken = this.responses.ExportToken;
        if (this.responses.Data.length > 0) {}
        this.items = [];
        this.fields = [];
        this.items = this.responses.Data;

        var str_array = this.responses.DefineColumn.split(",");
        var allColumn_bf = this.responses.AllColumn.split(",");
        var allColumn = [];
        var filteredColumn = [];
        var definedColumn = [];

        this.fields.push({
          value: 0,
          key: "chkBoxAction"
        });

        allColumn_bf.forEach((val, idx) => {
          allColumn.push({
            value: idx + 1,
            key: val,
            thClass: "ABSthClassList",
            tdClass: "ABStdClassList",
            text: val
          });

          filteredColumn.push({
            value: idx + 1,
            key: val,
            thClass: "ABSthClassList",
            tdClass: "ABStdClassList"
          });
        });

        for (var i = 0; i < str_array.length; i++) {
          filteredColumn = filteredColumn.filter(val => {
            if (val.key == str_array[i]) {
              definedColumn.push({
                value: val.value,
                key: val.key,
                thClass: "ABSthClassList",
                tdClass: "ABStdClassList",
                text: val.key
              });
            }

            return val.key != str_array[i];
          });

          this.fields.push({
            value: i + 1,
            key: str_array[i],
            thClass: "ABSthClassList",
            tdClass: "ABStdClassList",
            text: str_array[i]
          });
        }

        this.availableColumn = filteredColumn;
        this.selectedColumn = definedColumn;

        this.availableColumnTemp = filteredColumn;
        this.selectedColumnTemp = definedColumn;

        this.totalRows = this.responses.Total;
        this.lastPage = this.responses.Last_Page;

        setTimeout(() => {
          this.loader = false;
        }, 800);
      });

      if (method != undefined) {
        var datax = {
          pageLevel: this.prop.PageLevel,
          tabIndex: this.prop.TabIndex
        };
        if (method.toUpperCase() == "REFRESH") {
          this.currentPage = 1;
          this.getToolbarAbsList().unselectRow(datax);
        } else if (method == "pageSize") {
          this.$emit("pageSize");
          this.getToolbarAbsList().unselectRow(datax);
        } else if (method == "pagination") {
          this.$emit("pagination");
          this.getToolbarAbsList().unselectRow(datax);
        } else if (method == "refresh_filter") {
          this.$emit("filter");
          this.getToolbarAbsList().unselectRow(datax);
        } else if (method == "headTable") {
          this.$emit("headTable");
          this.getToolbarAbsList().unselectRow(datax);
        }
      }
    }
  },
  beforeCreate: function() {},
  created: function() {
    EventBus.$on("eb_postAndDelete" + this.prop.PageLevel, data => {
      this.doPostOrDelete(data);
    });
  },
  beforeMount: function() {},
  mounted: function() {
    this.doGetList();
  },
  beforeUpdate: function() {},
  updated: function() {},
  beforeDestroy: function() {
    EventBus.$off("eb_postAndDelete" + this.prop.PageLevel);
  },
  destroyed: function() {}
};
</script>

<style lang="scss" scoped>
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
  padding: 3px 7px;
  /* font-size: 12px; */
  /* font-weight: bold; */
  line-height: 1;
  color: #fff;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  background-color: #dc3545;
  border-radius: 10px;
  /* float: right; */
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

.loader--page {
  display: flex;
  align-items: center;
  justify-content: center;
  position: fixed;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  z-index: 1050;
  overflow: hidden;
  outline: 0;
  background-color: #000;
  display: -webkit-box;
  display: -ms-flexbox;
  opacity: 0.8;
}

.loader--page__box {
  max-width: 50%;
}

.loader--page__box .title {
  font-size: 1.5rem;
  color: #fff;
}

/* LOADER 1 */

.loader--page__box .spinner {
  margin: auto;
  width: 50px;
  height: 40px;
  text-align: center;
  font-size: 10px;
}

.loader--page__box .spinner > div {
  background-color: #0680ff;
  height: 100%;
  width: 6px;
  display: inline-block;

  -webkit-animation: sk-stretchdelay 1.2s infinite ease-in-out;
  animation: sk-stretchdelay 1.2s infinite ease-in-out;
}

.loader--page__box .spinner .rect2 {
  -webkit-animation-delay: -1.1s;
  animation-delay: -1.1s;
}

.loader--page__box .spinner .rect3 {
  -webkit-animation-delay: -1s;
  animation-delay: -1s;
}

.loader--page__box .spinner .rect4 {
  -webkit-animation-delay: -0.9s;
  animation-delay: -0.9s;
}

.loader--page__box .spinner .rect5 {
  -webkit-animation-delay: -0.8s;
  animation-delay: -0.8s;
}

@-webkit-keyframes sk-stretchdelay {
  0%,
  40%,
  100% {
    -webkit-transform: scaleY(0.4);
  }
  20% {
    -webkit-transform: scaleY(1);
  }
}

@keyframes sk-stretchdelay {
  0%,
  40%,
  100% {
    transform: scaleY(0.4);
    -webkit-transform: scaleY(0.4);
  }
  20% {
    transform: scaleY(1);
    -webkit-transform: scaleY(1);
  }
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

@keyframes move {
  0% {
    left: 0%;
  }
  100% {
    left: 100%;
  }
}

// ABS list
table {
  border: 1px solid #CCC;
}

.text--center {
  text-align: center;
}

.tabs {
  padding: 15px;
}

.nav-tabs {
  border-bottom: 0px!important;
  width: 70%;
  float: left;
}

.header-list__1 {
  min-height: 35px !important;
  padding-top: 0px !important;
  background: transparent!important;
  margin-top: 25px;
}

.ABSTabs__active {
  background: white !important;
  margin-top: 8px !important;
  margin-left: 12px !important;
  margin-right: 12px !important;
  margin-bottom: 10px !important;
  -webkit-box-shadow:1px 1px 2px 2px #c1c1c1 !important;
  box-shadow:1px 1px 2px 2px #c1c1c1 !important;
  border: 0 solid!important;
  border-left: 5px solid #007bff!important;
}

// DROPDOWN GEAR
.dropdown--gear {
  float: right;
}

// CHECKBOX
// @import url(https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css);

input[type=checkbox] {
  position: relative;
}

.custom-checkbox input[type=checkbox]:before {
  position: absolute;
  background-color: #FFFFFF;
  height: 100%;
  width: 100%;
  font-family: FontAwesome;
  display: inline-block;
  content:"\f096";
  letter-spacing: 10px;
}

.custom-checkbox input[type=checkbox]:checked:before {
  font-family: FontAwesome;
  display: inline-block;
  content:"\f046";
  letter-spacing: 5px;
}

// PAGINATION
ul.pagination {
  li {
    a {
      background-color: #FFFFFF;
      border: 1px solid #dee2e6;
      margin-right: 5px;
      border-radius: 3px;
    }
  }
}

.page-item.active .page-link {
  background-color: #007bff !important;
  color: #FFFFFF!important;
}

.page-link {
  color: #000!important;
  border-style: solid!important;

  &:hover {
    background-color: #007bff !important;
    color: #FFFFFF!important;
    border: 1px solid #007bff !important;
  }
}


table {
  border: 1px solid #CCC;
}

.text--center {
  text-align: center;
}

.tabs {
  padding: 15px;
}

.nav-tabs {
  border-bottom: 0px!important;
  width: 70%;
  float: left;
}

.header-list__1 {
  min-height: 35px !important;
  padding-top: 0px !important;
  background: transparent!important;
  margin-top: 25px;
}

.ABSTabs__active {
  background: white !important;
  margin-top: 8px !important;
  margin-left: 12px !important;
  margin-right: 12px !important;
  margin-bottom: 10px !important;
  -webkit-box-shadow:1px 1px 2px 2px #c1c1c1 !important;
  box-shadow:1px 1px 2px 2px #c1c1c1 !important;
  border: 0 solid!important;
  border-left: 5px solid #007bff!important;
}

// DROPDOWN GEAR
.dropdown--gear {
  float: right;
}

// CHECKBOX
// @import url(https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css);

input[type=checkbox] {
  position: relative;
}

.custom-checkbox input[type=checkbox]:before {
  position: absolute;
  background-color: #FFFFFF;
  height: 100%;
  width: 100%;
  font-family: FontAwesome;
  display: inline-block;
  content:"\f096";
  letter-spacing: 10px;
}

.custom-checkbox input[type=checkbox]:checked:before {
  font-family: FontAwesome;
  display: inline-block;
  content:"\f046";
  letter-spacing: 5px;
}

// PAGINATION
ul.pagination {
  li {
    a {
      background-color: #FFFFFF;
      border: 1px solid #dee2e6;
      margin-right: 5px;
      border-radius: 3px;
    }
  }
}

.page-item.active .page-link {
  background-color: #007bff !important;
  color: #FFFFFF!important;
}

.page-link {
  color: #000!important;
  border-style: solid!important;

  &:hover {
    background-color: #007bff !important;
    color: #FFFFFF!important;
    border: 1px solid #007bff !important;
  }
}
</style>