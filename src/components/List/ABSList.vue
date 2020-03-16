<template>
  <div style="padding-left: 15px;padding-right: 15px;">
    <!-- <div class="content-app__body"> -->

      <b-modal
        id="modalColumn"
        title="Edit Column"
        size="lg"
        ref="modalColumn"
        class="modalCustomABS">
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
              <b-button @click="M_moveRight" size="sm" variant="primary"><font-awesome-icon icon="angle-double-right" class="icon-style-5"/></b-button>          
            </div>
          <b-col sm="5">
            <div>
              <div class="divCustom">
                <b>Selected Column</b> <br>
                <span>Drag the column names below to reorder how they will appear above your grid</span>
              </div>
              <br>
                <draggable v-if="selectedColumn.length > 0" v-model="selectedColumn" @start="drag=true" @end="drag=false" class="drag-area">
                  <div v-for="element in selectedColumn" :key="element.value" class="draggable">
                    {{element.key}}
                    <span>                  
                      <span class="btn-remove" style="margin-top:0px; float:right;" @click="M_moveLeft(element.value)">
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
            <b-btn size="sm" class="float-right btnModal__btnCancel" @click="$refs.modalColumn.hide()">
              Cancel
            </b-btn>       
            <b-btn size="sm" class="float-right btnModal__btnOK" variant="primary" @click="modalColumnHandleOk">
              OK
            </b-btn>       
          </div>         
        </div>
      </b-modal>

      <b-modal
        id="modalFilter"
        title="Filter Builder"       
        size="lg"
        ref="modalFilter"
        class="modalCustomABS">
          <b-button @click="doAddFilter()" size="sm" variant="primary"> Add </b-button>
        
        <div style="padding-top:20px;">
          <b-row v-for="(data, index) in filteredColumn" :key="index">
            <b-col align-h="left" style="padding-bottom:10px; padding-right:0px !important; padding-left:20px !important; max-width:50px !important;">
              <b-button @click="M_RemoveFilter(index)" size="sm" class="btnModal__btnDelete">
                <font-awesome-icon icon="times" class="icon-style-5"/>
              </b-button>
            </b-col>

            <b-col sm="4">
              <b-form-select v-model="data.columnName" :options="selectedColumn" class="sm-3 font-lbl" size="sm" style="height:30px" />
            </b-col>

            <b-col sm="3">
              <b-form-select v-model="data.signFilter" :options="signFilter" class="sm-3 font-lbl" size="sm" style="height:30px" />
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
            <b-btn size="sm" class="float-right btnModal__btnCancel" @click="$refs.modalFilter.hide()">
              Cancel
            </b-btn>
            <b-btn size="sm" class="float-right btnModal__btnOK" variant="primary" @click="modalFilterHandleOk">
              OK
            </b-btn>          
          </div>         
        </div>
      </b-modal>
      
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
          <b-col sm="12" style="padding-top:20px; padding-bottom:10px !important; font-size:14px !important; text-align:center !important;" >
            Select data that will be exported
          </b-col>        
        </b-row>
        
        <b-row style="padding-top:20px;">
          <b-col sm="5" align-h="center" style="padding-bottom:7px;">
            <b-btn size="sm" class="float-center" style="width:100% !important;" variant="primary" @click="doExportXLS('S')">
              Export Selected Data
            </b-btn>
          </b-col>
          <b-col sm="5" align-h="center" style="padding-bottom:7px;">
            <b-btn size="sm" class="float-center" style="width:100% !important;" variant="success" @click="doExportXLS('A')">
              Export All
            </b-btn>
          </b-col>
          <b-col sm="2" align-h="right" style="padding-bottom:7px;">
            <b-btn size="sm" class="float-center btnModal__btnCancel" style="margin:0px !important;"  variant="primary" @click="$refs.modalExport.hide()">
              Cancel
            </b-btn>
          </b-col>        
        </b-row>      
      </b-modal>
        <!-- <b-row align-h="center" class="header-form">        
          <b-col sm="9">
            <ABSButton icon="plus" text="New" classButton="btnList__btnPrimary" classIcon="icon-style-1" @click="doNew" :disabled="statusFunction[0].disabled" />
            <ABSButton icon="edit" text="Edit" classButton="btnList__btnPrimary" classIcon="icon-style-1" @click="doEdit" />
            <ABSButton icon="trash-alt" text="Delete" classButton="btnList__btnRed" classIcon="icon-style-2" @click="doDelete" :disabled="statusFunction[2].disabled" />
            
            <ABSButton icon="save" text="Save" classButton="btnList__btnPrimary" classIcon="icon-style-1" @click="doSave" />
            <ABSButton icon="ban" text="Cancel" classButton="btnList__btnPrimary" classIcon="icon-style-2" @click="doCancel" />
            
            <ABSButton icon="sync" text="Refresh" classButton="btnList__btnPrimary" classIcon="icon-style-1" @click="doRefresh" />
            <ABSButton icon="list" text="Post" classButton="btnList__btnPrimary" classIcon="icon-style-1" @click="doPost" :disabled="statusFunction[4].disabled" />
            <ABSButton icon="file-export" text="Export" classButton="btnList__btnGreen" classIcon="icon-style-3" @click="openModalExport" :disabled="statusFunction[3].disabled" />
            <ABSButton icon="columns" text="Columns" classButton="btnList__btnPrimary" classIcon="icon-style-1" @click="openModalColumn" />
            <ABSButton icon="columns" text="Advance Filter" classButton="btnList__btnPrimary" classIcon="icon-style-1" v-b-modal.modalFilter />
          </b-col>
          <b-col sm="3">
                <b-form v-on:submit.prevent="onSearchEnter">
                  <b-form-input
                            id="txtSearch"
                            v-model="search"
                            type="text"
                            placeholder="Search..."          
                            v-shortkey.focus="['f1']" 
                            class="text-field-search"
                            style="margin-bottom: 0px !important;margin-top: 3px !important;"
                            >
                  </b-form-input>
                </b-form>         
              <font-awesome-icon @click="doGetList" icon="search" class="icon-style-1__searchIcon" style="margin-top: 8px !important;"/>            
          </b-col>
        </b-row> -->
        
          
          
          <!-- <b-row align-h="right" style="min-height: 35px !important; padding-top: 0px !important; background: #55b3ff;"> -->
            <b-row align-h="right" class="header-list__1"> 
            <!-- <b-col sm="3">
              <label class="font-lbl" style="margin-left:5px;">Total record : {{ this.totalRows }}</label>
            </b-col> -->
            <b-col align-h="left" sm="5" style="padding-left: 15px !important; padding-top: 3px !important;">        
              <b-form inline style="float: left; color:white;">            
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
            <b-col sm="6" align-h="center" style="padding-top: 3px !important;">
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
            <b-col>
              <div class="dropdown" style="float:right;">
                <button class="dropbtn"><img :src="require(`@/assets/icons/Application.png`)" alt="" style="width:20px; padding-top:6px; padding-bottom:6px;"></button>
                <!-- <button class="dropbtn"><font-awesome-icon icon="cog" class="icon-style-3 abs-spin-gear"/></button> -->
                <div class="dropdown-content">
                  <a href="#" @click="openModalExport"><font-awesome-icon icon="file-export" class="icon-style-3"/> Export</a>
                  <a href="#" @click="openModalColumn"><font-awesome-icon icon="columns" class="icon-style-1"/> Column</a>
                  <a href="#" @click="openModalFilter"><font-awesome-icon icon="columns" class="icon-style-1"/> Advance Filter</a>
                  <!-- <a href="#" v-b-modal.modalFilter><font-awesome-icon icon="columns" class="icon-style-1"/> Advance Filter</a> -->
                </div>
              </div>
            </b-col> 
            <!-- <b-col sm="1" align-h="right">
              <nav id="primary_nav_wrap" style="float:right;">
                <ul>
                  <li><a href="#"><img :src="require(`@/assets/icons/Application.png`)" alt=""></a>
                    <ul>                      
                      <li><a href="#" @click="openModalExport"><font-awesome-icon icon="file-export" class="icon-style-3"/> Export</a></li>
                      <li><a href="#" @click="openModalColumn"><font-awesome-icon icon="columns" class="icon-style-1"/> Column</a></li>
                      <li><a href="#" v-b-modal.modalFilter><font-awesome-icon icon="columns" class="icon-style-1"/> Advance Filter</a></li>
                    </ul>
                  </li>
                </ul>
              </nav>
            </b-col> -->
            <!-- <b-col>
              <ABSButton icon="file-export" text="Export" classButton="btnList__btnGreen" classIcon="icon-style-3" @click="openModalExport" :disabled="statusFunction[3].disabled" />
              <ABSButton icon="columns" text="Columns" classButton="btnList__btnPrimary" classIcon="icon-style-1" @click="openModalColumn" />
              <ABSButton icon="columns" text="Advance Filter" classButton="btnList__btnPrimary" classIcon="icon-style-1" v-b-modal.modalFilter />
            </b-col>-->
          </b-row>
          <!-- <b-row style="overflow-x:auto; max-height:435px !important;">
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
              rules="row">
        
              <template slot="HEAD_chkBoxAction" slot-scope="data">
                <b-form-checkbox @click.native.stop @change="headChkBoxAction" v-model="selected" />
              </template>
              
              <template slot="chkBoxAction" slot-scope="row">
                <b-form-checkbox @dblclick.native.stop @change="chkBoxAction(row.index)" v-model="rowSelected" :value="row.index"/>
              </template>
            </b-table>
          </b-row> -->
          <!-- <div style="overflow-x:auto; max-height:435px !important;"> -->
          <div style="overflow-x:auto;">
            <!-- <div style="width:100% !important; background-color:red;" class="float-right" v-b-toggle.tableCollapse>
              <div class="icon-right">
                <i class="icon-arrow-down"></i>
              </div>
            </div>          -->
            <!-- <div class="float-right" style="background-color:red;" v-b-toggle.tableCollapse >
              <div class="icon-right">
                <i class="icon-arrow-down"></i>
              </div>
            </div> -->
             <!-- <b-collapse id="tableCollapse">         -->

               <!-- :sort-by.sync="sortBy"
                :sort-desc.sync="sortDesc" -->
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
                rules="row">

                <template slot="HEAD_chkBoxAction" slot-scope="data">
                  <b-form-checkbox @click.native.stop @change="headChkBoxAction" v-model="selected" :disabled="isDisableTable" />
                </template>
                
                <template slot="chkBoxAction" slot-scope="row">
                  <!-- <b-form-checkbox-group id="checkboxes2" name="flavour2" v-model="rowSelected"> -->

                  <!-- old -->
                  <!-- <b-form-checkbox @dblclick.native.stop @change="chkBoxAction(row.index)" v-model="rowSelected" :value="row.index" :disabled="isDisableTable" style="min-height:15px !important;padding-top:0px !important;"/> -->

                  <!-- new -->
                  <b-form-checkbox @dblclick.native.stop @click.native.stop @change="chkBoxAction(row.index)" v-model="rowSelected" :value="row.index" :disabled="isDisableTable" style="min-height:15px !important;padding-top:0px !important;"/>

                    <!-- {{row.detailsShowing}} -->
                    <!-- {{rowSelected}}
                    {{row.index}} -->
                  <!-- </b-form-checkbox-group> -->
                  <!-- <b-form-checkbox v-if="row.item.Status=='B'" @change="chkBoxAction(row.index)" v-model="rowSelected" :value="row.index" /> -->
                  <!-- <b-form-checkbox v-else disabled/> -->
                </template>

                <!-- <template slot="CurrencyCd" slot-scope="row">
                  <span class="likeLink" @click.stop="rowLinkClick('url')">
                    {{ row.item.CurrencyCd }}
                  </span>
                </template> -->

                <!-- <template slot="selected" slot-scope="data">
                    {{data.item.selected}}
                </template> -->
              </b-table>              
            <!-- </b-collapse> -->
          </div>
        <!-- <div align-h="right" style="font-size:11px; color:#555555;"><b>* Double click row to see form entry</b></div> -->
        <!-- <b-row align-h="right" style="height: 35px !important; padding-top: 0px !important;">        
          <b-col sm="3">
            <label class="font-lbl" style="margin-left:5px;">Total record : {{ this.totalRows }}</label>
          </b-col>
          <b-col sm="6">
            <b-pagination align="center"
              v-model="currentPage"
              v-on:input="doGetList"
              :total-rows="totalRows"
              :per-page="perPage">  
            </b-pagination>
          </b-col>               
          <b-col align-h="right" sm="3">        
            <b-form inline style="float: right;">            
              <label class="font-lbl">Page Size</label>
              <b-form-select 
                id="cmbPerPage"
                v-model="perPage"
                v-on:input="doGetList"
                :options="pagingData"
                style="height: 28px; !important"
                class="sm-3 mgn-left-10 font-lbl">
              </b-form-select>
            </b-form>
          </b-col>
        </b-row> -->
    <!-- </div> -->
  </div>
</template>

<script>
import {EventBus} from '../../main'
import { setTimeout } from 'timers';

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
      isDisableTable: false,
      // checkbox all
      selected: false,
      rowSelected: [],
      dataSelected: [],
      rowSel: -1,

      search: '',
      fields: [],
      items: [],
      sort : 'TimeEdit DESC',

      // sorting
      sortBy: '',
      sortDesc: false,

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
        { value: 5, text: '5' },
        { value: 10, text: '10' },
        { value: 15, text: '15' },
        { value: 20, text: '20' },
        { value: 40, text: '40' },
        { value: 60, text: '60' },
        { value: 80, text: '80' },
        { value: 100, text: '100' }
      ],

      fileName: "TestExport",
      ExportToken: '',

      availableColumn:[],
      availableColumnTemp:[],
      availableColumnSelected:[],
      selectedColumn:[],
      selectedColumnTemp:[],
      selectedColumnSelected:[],

      sortedField:[],

      // dataFilter:[],
      filteredColumnTemp:[],
      filteredColumn:[],
      signFilter:[
        {value: '=', text: 'Equals', type: 'text'},
        {value: '<>', text: 'Does Not Equal', type: 'text'},
        {value: '<', text: 'Is Less Than', type: 'text'},
        {value: '>', text: 'Is Greater Than', type: 'text'},
        {value: '<=', text: 'Is Less Than Or Equal To', type: 'text'},
        {value: '>=', text: 'Is Greater Than Or Equal To', type: 'text'},
        {value: 'null', text: 'Is Empty', type: 'none'},
        {value: 'notnull', text: 'Is Not Empty', type: 'none'},
        {value: 'like', text: 'Contains Of', type: 'text'},
        // {value: 'between', key: 'Is Between'},
        {value: 'in', text: 'Is Any Of', type: 'text'},
        {value: 'notin', text: 'Is None Of', type: 'text'}
      ],

      dataState: {
        // PageLevel: '1',
        TabIndex: '1'
      },
      tempAdvanceFilter: ''
    }
  },
  methods: {
    doNew () {
      this.$emit('doNew')
    },
    doEdit () {
      this.$emit('doEdit')
    },
    doSave () {
      this.$emit('doSave')
    },
    doCancel () {
      this.$emit('doCancel')
    },
    doRefresh () {
      this.prop.initialWhere = ''
      // this.sort = 'TimeEdit ASC'
      this.doGetList('', 'refresh')
      this.resetSelected()
      this.$emit('doRefresh')
    },
    onSearchEnter (event) {
      this.doGetList('', 'onSearchEnter')
    },
    getRowSelected (param, method) {
      var data = []
      if(this.rowSelected.length > 0){
        this.rowSelected.forEach(idx => {
          data.push(this.items[idx])
        })
        // this.$emit('getSelected' + param, data, method)
        this.$emit(method, data)
      }
      else {
        this.alertWarning('No Data Selected')
      }
    },
    doPost () {
      var data = []
      if(this.rowSelected.length > 0){
        this.rowSelected.forEach(idx => {
          data.push(this.items[idx])
        })
        EventBus.$emit('ebGetPostList_' + this.prop.PageLevel + '_' + this.prop.TabIndex, data)
      }
      else {
        this.alertWarning("No Data Selected To Post")
      }
    },
    doDelete () {
      var data = []
      if(this.rowSelected.length > 0){
        this.rowSelected.forEach(idx => {
          data.push(this.items[idx])
        })
        // this.$emit('getSelected', data, 'delete')
        // this.$emit('delete', data)
        // EventBus.$emit('ebToolBarDelete', data)
        EventBus.$emit('ebGetDeleteList_' + this.prop.PageLevel + '_' + this.prop.TabIndex, data)
      }
      else {
        this.alertWarning("No Data Selected To Delete")
      }
    },
    M_Delete (data) {
      var param = {
        OptionSeq: this.getOptionSeq().OptionSeq,
        SubPortfolioCd:this.getDataUser().subportfolio_cd,
        PortfolioCd:this.getDataUser().portfolio_cd,
        LineNo: this.prop.LineNo,
        Data: data
      }
    
      this.postJSON( this.getUrlDeleteMulti(), param )
      .then(response => {
          // response from API
          if(response == null) return

          this.responses = response
          this.alertSuccess("Deleting Data Successfully")
          this.doGetList('', 'refresh_delete')
          this.resetSelected()
      })
    },
    doExportXLS (param) {
      if (param == 'A') {
        var url = this.getFileExcel(this.fileName, this.ExportToken)
        window.location.href = url
        this.$refs.modalExport.hide()
      } else {
        if (this.rowSelected.length > 0) {
          var data = ''
          this.rowSelected.forEach(idx => {
            // data.push(this.items[idx])
            data += this.items[idx].row_id + ','
          })

          data = data.slice(0,-1)

          this.M_ExportXLS(data)

          // alert(JSON.stringify(data))
          
          // this.$emit('getSelected', data, 'export')
          // EventBus.$emit('ebToolBarExport', data)
        }
        else {
          this.alertWarning("No Data Selected To Export")
        }
      }
    },
    M_ExportXLS (data) {
      var param = {
        Token: this.ExportToken,
        Data: data
      }

      this.postJSON( this.getUrlGetTokenExport(), param )
      .then(response => {
          if (response == null) return

          var url = this.getFileExcel(this.fileName, response.Data.Token)
          window.location.href = url
          this.$refs.modalExport.hide()
      })
    },
    M_PostData (data) {
      var param = {
        OptionSeq: this.getOptionSeq().OptionSeq,
        SubPortfolioCd:this.getDataUser().subportfolio_cd,
        PortfolioCd:this.getDataUser().portfolio_cd,
        LineNo: this.prop.LineNo,
        Data: data
      }
      console.table(param)
      this.postEncode( this.getUrlPostMulti(), param )
      .then(response => {
          // response from API
          console.log('post')
          console.table(response)
          if(response == null) return
          
          this.alertSuccess("Posting Data Successfully")
          this.doGetList('', 'refresh_post')
          this.resetSelected()
      })
    },
    openModalExport () {
      this.$refs.modalExport.show()
    },
    openModalColumn () {
      this.$refs.modalColumn.show()
    },
    openModalFilter () {
      this.$refs.modalFilter.show()
      // v-b-modal.modalFilter
    },
    doCursorSearch () {
      document.getElementById(txtSearch).focus()
      document.getElementById(frmObj.id).select()
      alert('cursor')
    },
    doAddFilter () {
      var dataColumn = this.selectedColumn
      this.filteredColumn.push({
        columnName: dataColumn[0].value,
        signFilter: '=',
        value: ''
      })
    },
    M_RemoveFilter (idx) {
      this.filteredColumn.splice(idx,1)
      this.$forceUpdate()
    },
    modalFilterHandleOk () {
      var col = this.selectedColumn
      var filterString = ''

      this.filteredColumn.forEach((filter, index) => {
        var i = col.map(value => { return value.value }).indexOf(filter.columnName)
        console.log(i)
        console.log(filter.columnName)
        var theFilter = ''
        var sign = filter.signFilter
        console.log(sign)
        if (sign == 'in' || sign == 'notin') {
          var val = filter.value.split(',')
          var xVal = ''
          val.forEach(v => {
            xVal += "'" + v + "',"
          })

          xVal = xVal.substr(0,xVal.length-1)

          if (sign == 'in') {
            theFilter = "in (" + xVal + ")"
          }
          else {
            theFilter = "not in (" + xVal + ")"
          }
        }
        else if (sign == 'like') {
          theFilter += "like '%" + filter.value + "%'"
        }
        else if (sign == 'null') {
          theFilter += " is null "
        }
        else if (sign == 'notnull') {
          theFilter += " is not null "
        }
        else {
          theFilter += filter.signFilter + " '" + filter.value + "'"
        }
        filterString += this.selectedColumn[i].key + " " + theFilter + " AND "
      })
      filterString = filterString.substr(0, filterString.length - 4)
      // this.prop.initialWhere = filterString
      this.tempAdvanceFilter = filterString
      this.doGetList('', 'refresh_filter')
      this.$refs.modalFilter.hide()

    },
    modalColumnHandleOk () {
      var field = '';

      this.selectedColumn.forEach((el, index) => {
        field += el.key + ","
        if (index == (this.selectedColumn.length - 1)) {
          field = field.substr(0,field.length - 1)
        }
      });

      var param = {
        OptionSeq: this.getOptionSeq().OptionSeq,
        UserId: this.getDataUser().user_id,
        SubPortfolioCd: this.getDataUser().subportfolio_cd,
        ColumnField: field,
        UserInput: this.getDataUser().user_id,
        LineNo: this.prop.LineNo
      }

      this.postEncode(this.getUrlDefineColumn(), param)
      .then(response => {
        // response from API
        if(response == null) return

        this.responses = response

        this.fields = []
        this.fields.push({
            value: 0,
            key: 'chkBoxAction'
        })
        this.selectedColumn.forEach(ar => {
          this.fields.push({
            value: ar.value,
            key: ar.key,
            thClass: "ABSthClassList",
            tdClass: "ABStdClassList",
            value: ar.key,
          })
        });

        this.doGetList('', 'refresh_column')
        this.$refs.modalColumn.hide()
      })
    },
    M_moveRight () {
      if (this.availableColumnSelected && this.availableColumnSelected.length > 0) {
        var arr = this.availableColumn
        var x = 0
        this.availableColumnTemp.forEach((dt, idx) => {

          if (dt.value == this.availableColumnSelected[x]) {
            arr = arr.filter(function(arr, index){
              return arr.value != dt.value
            })

            this.selectedColumn.push({
              value : dt.value,
              key : dt.key,
              text : dt.key
            })

            x+=1
          }

          if (x == this.availableColumnSelected.length) {
            this.availableColumn = arr
            this.selectedColumnTemp = this.selectedColumn
            this.availableColumnTemp = this.availableColumn
          }

        })
      }
    },
    M_moveLeft (selected) {
      this.selectedColumnSelected = [selected]
      var arr = this.selectedColumn
      var x = 0
      this.selectedColumnTemp.forEach((dt, idx) => {

        if (dt.value == this.selectedColumnSelected[x]) {
          arr = arr.filter(function(arr, index){
            return arr.value != dt.value
          })

          this.availableColumn.push({
            value : dt.value,
            key : dt.key,
            text: dt.key
          })

          x += 1
        }

        if (x == this.selectedColumnSelected.length) {
          this.selectedColumn = arr
        }
      })
    },
    headClicked :function (field, index) {
      // alert(field)
      if(field.toUpperCase()=='NO'){
        return
      }
      if (this.isDisableTable) return
      var dtSort = this.sortedField
      this.sort = ''
      var x = dtSort.map((e) => {return e.field}).indexOf(field)
      
      if (x > -1) {
        if (this.sortedField[x].sort == 'ASC') {
          this.sortedField[x].sort = 'DESC'
          // this.sortBy = field
          this.fields.map((data, index) => {
            if (data.key === field) {
              this.fields[data.value].thClass = 'ABSthClassList set--desc'
            }
          })
        } else {
          this.sortedField[x].sort = 'ASC'
          // this.sortBy = field
          this.fields.map((data, index) => {
            if (data.key === field) {
              this.fields[data.value].thClass = 'ABSthClassList set--asc'
            }
          })
        }
      } else {
        this.sortedField.push({'field':field, 'sort':'ASC'})
      }

      this.sortedField.forEach((el) => {
        this.sort += el.field + " " + el.sort + ","
      });
      this.sort = this.sort.substr(0, this.sort.length - 1)
      setTimeout(() => {
        this.doGetList('', 'headTable')
      }, 2000)
      this.resetSelected()
      this.$emit('headClicked')
    },
    headChkBoxAction () {
      this.rowSelected = []
      if(!this.selected){
        this.items.forEach((el, idx) => {
          this.rowSelected.push(idx)
          // this.items[idx]['_rowVariant'] = 'primary'
        })
      }
      else {
        this.items.forEach((el, idx) => {
          // this.items[idx]['_rowVariant'] = ''
        });
      }

      this.$emit('allCheckBoxAction', this.items)
    },
    chkBoxAction (index) {
      var x = this.rowSelected.indexOf(index)
      if (x > -1) {
        this.selected = false
      } else {
        if (this.rowSelected.length == this.items.length) {
          this.selected = true
        }
      }

      // var a = this.dataSelected
      // var b = [index]
      // var hm = this.dataSelected.indexOf(index)
      // if(hm > -1){
      //   this.dataSelected.splice(hm,1)
      // }
      // else {
      //   this.dataSelected = a.concat(b.filter(function (item) {
      //       return a.indexOf(item) < 0
      //   }))
      // }

      // var d = []
      // this.dataSelected.forEach((v) => {
      //   d.push(this.items[v])
      // })
      
      // this.$store.commit('setSelectedData', {LineNo: this.prop.LineNo, Selected: d, SelectAll: this.selected})
    },
    rowClicked :function (record, index) {
      if (this.isDisableTable) return
      // var x = this.rowSelected.indexOf(index)
      // if (x > -1) {
      //   this.rowSelected.splice(x,1)
      //   this.items[index]['_rowVariant'] = ''
      //   this.selected = false
      // } else {
      //   this.rowSelected.push(index)
      //   this.items[index]['_rowVariant'] = 'primary'

      //   if (this.rowSelected.length == this.items.length) {
      //     this.selected = true
      //   
      // }
      // EventBus.$emit('ebRowSelect_' + this.prop.PageLevel + '_' + this.prop.TabIndex, index)
      
      if (this.rowSel != -1) {
        this.items[this.rowSel]['_rowVariant'] = ''
      }
      
      this.rowSel = index
      this.items[index]['_rowVariant'] = 'primary'
      this.$forceUpdate()

      this.$emit('rowClicked', record, index)

      // let data = {
      //   pageLevel: this.prop.PageLevel,
      //   tabIndex: this.prop.TabIndex
      // }
      // EventBus.$emit('ebRowSelect', data)
    },
    unselectRowClicked () {
      this.items[this.rowSel]['_rowVariant'] = ''
      this.$forceUpdate()
    },
    rowDblClicked :function (record, index) {
      if (this.isDisableTable) return
      this.$emit('rowDblClicked', record, index)
    },
    rowLinkClick (url) {
      this.$emit('rowLinkClick', url)
    },
    resetSelected () {
      this.rowSelected = [0]
      this.selected = false
      this.items[0]["_rowVariant"] = 'primary'
      this.rowSel = 0
    },
    doGetList(search, method) {
      var data = {
        Event: method,
        PageLevel: this.prop.PageLevel,
        TabIndex: this.dataState.TabIndex
      }
      // alert(method)
     if (method === 'pageSize' || method === 'pagination' || method === 'headTable') {
       if (method === 'headTable') {
         EventBus.$emit('ebActiveForm', data.PageLevel)
       }
      //  EventBus.$emit('ToOpen', data)
      // alert('dr list')
      // alert(method+'_'+data.PageLevel+'_'+data.TabIndex)
      EventBus.$emit(method+'_'+data.PageLevel+'_'+data.TabIndex,data)
     }
     // jika advance filter kosong '' maka kasih initial where aja
     // selainnya berarti inital where + advance filter
     var temp = this.tempAdvanceFilter == '' ? this.prop.initialWhere : this.prop.initialWhere + ' AND ' + this.tempAdvanceFilter
     var param =
      {
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
        InitialWhere : temp,
        SortField: this.sort,
      }
      // alert(this.sort)
      // alert(JSON.stringify(param))
    // console.log(param)
      this.postEncode(this.getUrlList(), param)
      .then((response) => {
        if(response == null) return

        this.selected = false

        this.rowSelected = []

        this.rowSel = 0

        this.responses = response

        this.ExportToken = this.responses.ExportToken

        if (this.responses.Data.length > 0) {
          
        }
        this.items = []
        this.fields = []
        this.items = this.responses.Data

        var str_array = this.responses.DefineColumn.split(',')
        var allColumn_bf = this.responses.AllColumn.split(',')
        var allColumn = []
        var filteredColumn = []
        var definedColumn = []

        this.fields.push({
            value: 0,
            key: 'chkBoxAction'
        })

        allColumn_bf.forEach((val, idx) => {
          allColumn.push({
            value: idx + 1,
            key: val,
            thClass: 'ABSthClassList',
            tdClass: "ABStdClassList",
            text: val
          })

          filteredColumn.push({
            value: idx + 1,
            key: val,
            thClass: 'ABSthClassList',
            tdClass: "ABStdClassList",
          })
        });

        for (var i = 0; i < str_array.length; i++) {
          filteredColumn = filteredColumn.filter((val) => {
            if(val.key == str_array[i]){
              definedColumn.push({
                value: val.value,
                key: val.key,
                thClass: 'ABSthClassList',
                tdClass: "ABStdClassList",
                text: val.key
              })
            }

            return val.key != str_array[i]
          })

          this.fields.push({
            value: i + 1,
            key: str_array[i],
            thClass: 'ABSthClassList',
            tdClass: "ABStdClassList",
            text: str_array[i],
            // sortable: true
          })
        }

        this.availableColumn = filteredColumn
        this.selectedColumn = definedColumn

        this.availableColumnTemp = filteredColumn
        this.selectedColumnTemp = definedColumn

        this.totalRows = this.responses.Total
        this.lastPage = this.responses.Last_Page
      })
    }
  },
  beforeCreate: function () {
  },
  created: function() {

    EventBus.$on('eb_post' + this.prop.PageLevel, (data) => {
      this.doPost()
    })

    // EventBus.$on('eb_validToDelete' + this.prop.PageLevel, (data) => {
    //   this.alertConfirmation("Are You Sure Want To Delete This Data?")
    //   .then(ress => {
    //     if(ress.value){
    //       this.M_Delete(data)
    //     }
    //   })
    // })

    // EventBus.$on('eb_exportSelectedRow' + this.prop.PageLevel, (data) => {
    //   this.M_ExportXLS(data)      
    // })

    // EventBus.$on('eb_validToPost' + this.prop.PageLevel, (data) => {
    //   this.alertConfirmation("Are You Sure Want To Post This Data?")
    //   .then(ress => {
    //     if(ress.value){
    //       this.M_PostData(data)
    //     }
    //   })
    // })

    // EventBus.$on('ebOpenModalExport' + this.prop.PageLevel, this.openModalExport)
    // EventBus.$on('ebOpenModalColumn' + this.prop.PageLevel, this.openModalColumn)
    // EventBus.$on('ebOpenModalFilter' + this.prop.PageLevel, this.openModalFilter)
    EventBus.$on('ebGetList_' + this.prop.PageLevel + '_' + this.prop.TabIndex, (search) => this.doGetList(search, 'eb_getList'))
    EventBus.$on('ebDoDeleteList_' + this.prop.PageLevel + '_' + this.prop.TabIndex, () => {
      this.doDelete()
    })
    // EventBus.$on('New_' + this.prop.PageLevel + '_' + this.prop.TabIndex, this.unselectRowClicked)
    // EventBus.$on('New_' + this.prop.PageLevel + '_' + this.prop.TabIndex, (data)=>{
    //   this.unselectRowClicked = data
    //   this.isDisableTable = data
    // })
    // EventBus.$on('Edit_' + this.prop.PageLevel + '_' + this.prop.TabIndex, (data)=>{
    //   // this.unselectRowClicked = data
    //   this.isDisableTable = data
    // })
    // EventBus.$on('Save_' + this.prop.PageLevel + '_' + this.prop.TabIndex, (data)=>{
    //   // this.unselectRowClicked = data
    //   this.isDisableTable = false
    // })
    // EventBus.$on('Cancel_' + this.prop.PageLevel + '_' + this.prop.TabIndex, (data)=>{
    //   // this.unselectRowClicked = data
    //   this.isDisableTable = false
    // })
    EventBus.$on('ToOpen', (data) => {
      // this.dataState.PageLevel = data.PageLevel
      // this.dataState.state = data.Event
      // this.dataState.stater = data.TabIndex

      if (data.Event == 'new' || data.Event == 'edit') {
        this.isDisableTable = true
        // console.info('page Level=>' + data.PageLevel)
        // console.info('tab=>' + this.dataState.TabIndex)
      } else {
        this.isDisableTable = false
      }

    })
    
    EventBus.$on('ebActiveTab', (data) => {
      // this.dataState.TabIndex = data
      this.dataState.TabIndex = data.TabIndex
    })
  },
  beforeMount: function() {
  },
  mounted: function() {
    // this.noBackButton()
    // this.doGetList()
    // var dt = this.getOptionSeq().PS.split('')
    // dt.forEach((el, idx) => {

    //   if (idx == 4) {
    //     if (el == 0) {
    //       this.statusFunction[idx].text = 'Post'
    //       this.statusFunction[idx].disabled = true
    //     }
    //     else if (el == 1) {
    //       this.statusFunction[idx].text = 'Post'
    //       this.statusFunction[idx].disabled = false
    //     }
    //     else if (el == 2) {
    //       this.statusFunction[idx].text = 'Submit'
    //       this.statusFunction[idx].disabled = true
    //     }
    //     else if (el == 3) {
    //       this.statusFunction[idx].text = 'Submit'
    //       this.statusFunction[idx].disabled = false
    //     }
    //   } else {
    //     if (el == 0) {
    //       this.statusFunction[idx].disabled = true
    //     }
    //     else if (el == 1) {
    //       this.statusFunction[idx].disabled = false
    //     }
    //   }

    // })
  },
  beforeUpdate: function() {
  },
  updated: function() {
  },
  beforeDestroy: function() {
    EventBus.$off('eb_post' + this.prop.PageLevel)
    // EventBus.$off('ebOpenModalExport' + this.prop.PageLevel)
    // EventBus.$off('ebOpenModalColumn' + this.prop.PageLevel)
    // EventBus.$off('ebOpenModalFilter' + this.prop.PageLevel)
    EventBus.$off('ebGetList_' + this.prop.PageLevel + '_' + this.prop.TabIndex)
    // EventBus.$off('New_' + this.prop.PageLevel + '_' + this.prop.TabIndex)
    EventBus.$off('ebDoDeleteList_' + this.prop.PageLevel + '_' + this.prop.TabIndex)
    // EventBus.$off('ToOpen')
    // EventBus.$off('ebActiveTab')
  },
  destroyed: function() {
  },
}
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
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;   
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    /* transition: all 100s; */    
}

.dropdown-content a:hover {background-color: #f1f1f1;}
.dropdown:hover .dropdown-content {display: block;}
.dropdown:hover .dropbtn { background-color: #d9efff;}

.dropdown:not(:hover) {
  transition: all 0.1s;
  transition-delay:5s;
}

.dropdown-content:not(:hover){
  transition: all 0.1s;
  transition-delay:5s;
}
</style>