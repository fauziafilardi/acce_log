<template>
  <div style="margin-left: 10px;margin-right: 5px; border-bottom: 1px solid #dee2e6;">
    
    <div class="table--list" :style="prop.divStyle">
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
        class="table-sm table-style-1"
        rules="row"
      >
        <!-- @head-clicked="headClicked"
        @row-clicked="rowClicked"
        @row-dblclicked="rowDblClicked" -->


        <template slot="HEAD_chkBoxAction" slot-scope="data">
          <b-form-checkbox
            @click.native.stop
            @change="headChkBoxAction"
            v-model="selected"
            :disabled="isDisableTable"
          />
        </template>

        <template slot="HEAD_CheckBoxActionLeft" slot-scope="data">
          <!-- <b-form-checkbox
            @click.native.stop
            @change="headChkBoxAction"
            v-model="selected"
            :disabled="isDisableTable"
          /> -->
          <!-- {{data}} -->
        </template>
        
        <template slot="HEAD_CheckBoxCustom" slot-scope="data">
          <!-- <b-form-checkbox
            @click.native.stop
            @change="headChkBoxAction"
            v-model="selected"
            :disabled="isDisableTable"
          /> -->
          <!-- {{data}} -->
        </template>

        <!-- <template slot="FOOT_CheckBoxCustom" slot-scope="data">
          <strong>Total {{data}}</strong>
        </template> -->
        
        <!-- <template v-for="(text, index) in prop.cTotalColumn.split(',')" :slot="'FOOT_' + data" slot-scope="data"> -->
        <template v-for="(text, index) in fieldHeader" :slot="'FOOT_' + text.key" slot-scope="data">
<!-- {{text.key}} -->
          <template v-for="(textTotal, indexTotal) in prop.cTotalColumn.split(',')">
            <!-- {{textTotal}} <br/> -->
            <template v-if="text.key == textTotal">
              {{total[indexTotal]}}
              <!-- <div>
                
              </div> -->
            </template>
          </template>

          <!-- <template v-if="data.column==''">
            <div>
              
            </div>
          </template>
          fef {{data}} -->
        </template>

        <!-- @input="chkBoxAction(row.index)" -->

        <!-- kalau ada di view baca, kalau ga ada default isCheckedDisable -->
        <template slot="chkBoxAction" slot-scope="row">
          <!-- {{row}} -->
          <!-- {{isCheckDisable == undefined ? false: row.item[isCheckDisable] == null}} -->
          
          <b-form-checkbox
            @dblclick.native.stop
            @click.native.stop
            @change="chkBoxAction(row.index)"
            @input="chkBoxInput()"
            v-model="rowSelected"
            :value="row.index"
            :disabled="isDisableTable || (isCheckDisable == undefined ? false: row.item[isCheckDisable] == null)"
            style="min-height:15px !important;padding-top:0px !important;"
          />
          <!-- @input="chkBoxInput()" -->
        </template>
        
        <!-- kalau ada di view baca, kalau ga ada default isCheckedDisable -->
          <!-- {{isCheckDisable == undefined ? false: row.item[isCheckDisable] == null}} -->
          
          <!-- <b-form-checkbox
            @dblclick.native.stop
            @click.native.stop
            @change="chkBoxAction(row.index)"
            @input="chkBoxInput()"
            v-model="rowSelected"
            :value="row.index"
            :disabled="isDisableTable || (isCheckDisable == undefined ? false: row.item[isCheckDisable] == null)"
            style="min-height:15px !important;padding-top:0px !important;"
          /> -->
          <!-- @input="chkBoxInput()" -->

          
        <template v-for="(data, index) in prop.comp" :slot="data.slot" slot-scope="row">
          <!-- {{row.item}} -->
          <!-- <b-form-input
            v-show="inputStatus=='new' || inputStatus=='edit'"
            v-model="row.item[data]"
            type="text"
            @blur.native="calculate(row)"
             />
          
          <label v-show="inputStatus=='view'" class="text-field-form">
            {{ row.item[data] }}
          </label> -->
          <!-- {{data.compType}} -->
          <template v-if="data.compType=='groupingLabel'">
            ookoko
            <template v-if="row.index == 0">
              {{row.item[data.slot]}}
            </template>
            <template v-else-if="row.item[data.slot] != items[row.index - 1]">
              {{row.item[data.slot]}}
            </template>
          </template>
          <template v-else-if="data.compType=='ABSTextBoxOnly'">
            <!-- <div> -->
              <!-- {{row.item}} -->
              <!-- {{data}} -->
              <!-- <ABSTextBoxOnly :prop="{
                cValidate: data.cValidate,
                cName: data.cName,
                cLabelSize: data.cLabelSize,
                cOrder: data.cOrder,
                cKey: data.cKey,
                cType: data.cType,
                cDefault: data.cDefault,
                cProtect: data.cProtect,
                cVisible: data.cVisible,
                cPageLevel: data.cPageLevel,
                cTabIndex: data.cTabIndex,
                cParentForm: data.cParentForm,
                cDecimal: data.cDecimal,
                cLastLabel: data.cLastLabel,
                cLastLabelShow: data.cLastLabelShow,
                cIsAlwaysShow: data.cIsAlwaysShow,
                cHideRowColumnCSS: data.cHideRowColumnCSS,
                cWhenLabel: data.cWhenLabel,
                cRowDisable: data.cRowDisable
              }"
                :rowLine="row.index"
                v-model="row.item[data.slot]"
                @input="onInput"
                @onBlur="onBlur(row.index, data.slot)"
                ref="gridTextBox" /> -->

                <b-col v-show="inputStatus!=='view'">                  
                  <b-form-input    
                  :name="data.cName"
                  :id="data.cName"
                  :rowLine="row.index"
                  v-model="row.item[data.slot]"
                  type="text"
                  @input="handleInput(index, data.slot, row.index)"
                  @keypress.native="formatNumber($event, index, data.slot, row.index)"
                  @blur.native="isCurrency2(index, data.slot, row.index)"
                  ref="gridTextBox"
                  style="text-align:right;"
                  class="text-field-form form-control input"
                />
                </b-col>
                <b-col md="" v-if="inputStatus=='view' && data.cType=='decimal'" style="text-align: right !important;">
                  <label class="lbl-value-view-form notranslate">{{row.item[data.slot]}}</label>
                </b-col>
                <b-col md="" v-else-if="inputStatus=='view' && data.cType=='numeric'">
                  <label class="lbl-value-view-form notranslate">{{row.item[data.slot]}}</label>
                </b-col>
                <b-col md="" v-else-if="inputStatus=='view'">
                  <label class="lbl-value-view-form notranslate">{{row.item[data.slot]}}</label>
                </b-col>
                <!-- FAUZI -->
                
          </template>
          <template v-else-if="data.compType=='CheckBoxCustom'">
            <!-- {{row}} -->
            <b-form-checkbox
              @dblclick.native.stop
              @click.native.stop
              @change="chkBoxCustomAction(row.index, row.item._chkBoxCustomAction)"
              v-model="row.item._chkBoxCustomAction"
              @input="onInput"
              :value="row.index"
              :disabled="!isDisableTable || (isCheckDisable == undefined ? false: row.item[isCheckDisable] == null)"
              style="min-height:15px !important;padding-top:0px !important;"
            />
              <!-- @input="chkBoxInput()" -->
          </template>
          <template v-else-if="data.compType=='CheckBoxActionLeft'">
            <!-- {{row}} -->
            <b-form-checkbox
              @dblclick.native.stop
              @click.native.stop
              @change="CheckBoxActionLeftAction(row.index, row.item._CheckBoxActionLeft)"
              v-model="row.item._CheckBoxActionLeft"
              @input="onInput"
              :value="row.index"
              :disabled="!isDisableTable || (isCheckDisable == undefined ? false: row.item[isCheckDisable] == null)"
              style="min-height:15px !important;padding-top:0px !important;"
            />
              <!-- @input="chkBoxInput()" -->
          </template>
          <template v-else-if="data.compType=='ABSinputCheckBoxOnly'">
            <!-- {{row}} -->
            <!-- <ABSinputCheckBoxOnly
              :prop="{
                cValidate: data.cValidate,
                cName: data.cName+row.index,
                cLabel: data.cLabel,
                cLabelSize: data.cLabelSize,
                cOptions: data.cOptions,
                cOrder: data.cOrder,
                cNoValue: data.cNoValue,
                cKey: data.cKey,
                cVisible: data.cVisible,
                cProtect: data.cProtect,
                cDefault: data.cDefault,
                cPageLevel: data.cPageLevel,
                cTabIndex: data.cTabIndex,
                cParentForm: data.cParentForm,
                cHideRowColumnCSS: data.cHideRowColumnCSS,
                cRowDisable: data.cRowDisable
              }"
              :rowLine="row.index"
              @input="changeCheckBox(row.index, row.item[data.slot], data.slot)"
              v-model="row.item[data.slot]"
              ref="gridCheckBoxOnly" /> -->
              <b-form-checkbox
                :id="data.cName+row.index"
                v-model="row.item[data.slot]"
                :name="data.cName+row.index"
                :value="data.checked"
                :unchecked-value="data.unchecked"
                :disabled="(inputStatus=='edit' && data.cKey) || data.cProtect || inputStatus=='view'"
                @input="changeCheckBox(row.index, row.item[data.slot], data.slot)"
                :ref="'gridCheckBoxOnly'+index"
              />
              <!-- @input="chkBoxInput()" -->
          </template>
          <template v-else-if="data.compType=='ABSDateOnly'">
            <!-- {{row}} -->
            <!-- {{data}} -->
            
            <!-- <ABSDateOnly :prop="data"
              v-model="row.item[data.slot]"
              ref="gridDateOnly" /> -->
            <ABSDateOnly :prop="{
                        cValidate: data.cValidate,
                        cName: data.cName + row.index,
                        cLabel: data.cLabel,
                        cLabelSize: data.cLabelSize,
                        cVisible: data.cVisible,
                        cOrder: data.cOrder,
                        cKey: data.cKey,
                        cProtect: data.cProtect,
                        cFormat: data.cFormat,
                        cPageLevel: data.cPageLevel,
                        cTabIndex: data.cTabIndex,
                        cParentForm: data.cParentForm,
                        cIsAlwaysShow: data.cIsAlwaysShow,
                        cLabelValue: data.cLabelValue,
                        cHideRowColumnCSS: (data.cHideRowColumnCSS ? data.cHideRowColumnCSS : false),
                        cRowDisable: (data.cRowDisable ? data.cRowDisable : [])
                    }"
              :rowLine="row.index"
              v-model="row.item[data.slot]"
              @input="onInput"
              ref="gridDateOnly" />
          </template>
          <template v-else-if="data.compType=='ABSinputRadioButtonOnly'">
            <ABSinputRadioButtonOnly :prop="{
              cValidate : data.cValidate,
              cName: data.cName + row.index,
              cId: data.cId + row.index,
              cRadioOptions: data.cRadioOptions,
              cRadioDefaultOption: data.cRadioDefaultOption,
              cLabel: data.cLabel, 
              cLabelSize: data.cLabelSize,
              cOrder: data.cOrder,
              cProtect: data.cProtect,
              cVisible: data.cVisible,
              cPageLevel: data.cPageLevel,
              cTabIndex: data.cTabIndex,
              cParentForm: data.cParentForm,
              cHideRowColumnCSS: (data.cHideRowColumnCSS ? data.cHideRowColumnCSS : false),
              cRowDisable: (data.cRowDisable ? data.cRowDisable : [])
            }"
              :rowLine="row.index"
              v-model="row.item[data.slot]"
              @input="onInput"
              ref="gridRadioButtonOnly" />
          </template>
          <template v-else-if="data.compType=='ABSInputSelectListOnly'">
            <ABSInputSelectListOnly :prop="{
              dataLookUp: data.dataLookUp, 
              cValidate : data.cValidate,
              cName: data.cName,
              cLabel: data.cLabel,
              cKey: data.cKey,
              cLabelSize: data.cLabelSize,
              cOrder: data.cOrder,
              cTriggered: data.cTriggered,
              cDefault: data.cDefault,
              cProtect: data.cProtect,
              cVisible: data.cVisible,
              cAsync: data.cAsync,
              cFilter: data.cFilter,
              cPageLevel: data.cPageLevel,
              cTabIndex: data.cTabIndex,
              cParentForm: data.cParentForm,
              cStatic: data.cStatic,
              cOption: data.cOption,
              cMasterUrl: data.cMasterUrl,
              cDisplayColumn: data.cDisplayColumn,
              cHideRowColumnCSS: (data.cHideRowColumnCSS ? data.cHideRowColumnCSS : false),
              cRowDisable: (data.cRowDisable ? data.cRowDisable : [])
            }"
              :rowLine="row.index"
              v-model="row.item[data.slot]"
              :label="row.item[data.slot+'Label']"
              @change="OnChangeLookup(row.item[data.slot], row.index, data.slot)"
              @input="onInput"
              ref="gridSelectListOnly" />
          </template>
          <template v-else-if="data.compType=='ABSInputSelectStatic'">
            <ABSInputSelect2Only :prop="{
              dataLookUp: data.dataLookUp,
              cValidate : data.cValidate,
              cName: data.cName,
              cLabel: data.cLabel,
              cLabelSize: data.cLabelSize,
              cOrder: data.cOrder,
              cKey: data.cKey,
              cTriggered: data.cTriggered,
              cDefault: data.cDefault,
              cProtect: data.cProtect,
              cVisible: data.cVisible,
              cAsync: data.cAsync,
              cFilter: data.cFilter,
              cPageLevel: data.cPageLevel,
              cTabIndex: data.cTabIndex,
              cParentForm: data.cParentForm,
              cStatic: data.cStatic,
              cOption: data.cOption,
              cMasterUrl: data.cMasterUrl,
              cDisplayColumn: data.cDisplayColumn,
              cHideRowColumnCSS: (data.cHideRowColumnCSS ? data.cHideRowColumnCSS : false),
              cRowDisable: (data.cRowDisable ? data.cRowDisable : [])
            }"
              :rowLine="row.index"
              v-model="row.item[data.slot]"
              :label="row.item[data.slot+'Label']"
              @input="onInput"
              @change="OnChangeLookup(row.item[data.slot], row.index, data.slot)"
              ref="gridSelect2Only" />
          </template>
        </template>
      </b-table>
    </div>

  </div>
</template>

<script>
export default {
  props: {
    prop: Object,
    PageLevel: String,
    TabIndex: String,
    // items: Array
  },
  watch: {
    items() {
      this.onInput()
    }
  },
  data() {
    return {
      footClone: true,
      allColumn: [],
      fieldHeader: [],
      items: [],
      sort: "",

      // paging
      totalRows: 0,
      currentPage: 1,
      lastPage: 1,
      perPage: 2000,

      fieldDecimal: [],
      total: [],
      isCheckDisable: undefined
    };
  },
  computed: {
    isDisableTable() {
      return this.$store.getters.getListStatus
    },
    formType () {
      return this.$store.getters.getFormType
    },
    inputStatus() {
      // this.$validator.pause()
      // this.$nextTick(() => {
      //   this.$validator.errors.clear(this.prop.cParentForm)
      //   this.$validator.resume()
      // })

      if (this.$store.getters.getLevel == this.PageLevel && this.$store.getters.getTab == this.TabIndex) {
        return this.$store.getters.getStatus
      }
      else {
        return 'view'
      }
    },
  },
  methods: {
    // isCurrency (value) {
    //   var num = value.toString()
    //   var numSplit = num.split(".")
    //   var numReal = numSplit[0].replace(',','')
    //   var numDecimal = numSplit[1] ? ("." + numSplit[1]) : '.00'

    //   return numReal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + numDecimal
    // },
    OnChangeLookup(data, index, slot) {
      // console.log(data)
      // console.log(index)
      this.items[index][slot] = data.id
      this.items[index][slot+'Label'] = data.label

      this.$emit('onChangeLookup', this.items)
      this.$emit('onChangeLookup_' + slot, index)
    },
    onInput () {
      this.$emit("input", this.items)
    },
    onBlur (index, slot) {
      this.$emit("onBlur", index)
      this.$emit("onBlur_" + slot, index)
    },
    checkOrderBy () {
      if (this.prop.propList != undefined) {
        if (this.prop.propList.OrderBy != undefined) {
          this.sort = this.prop.propList.OrderBy
        }
      }
    },
    getToolbarAbsList() {
      if (this.isProcess == true) {
        return this.$parent.$children[0].$children[0]
      } else {
        return this.$parent.$parent.$parent.$parent.$parent.$parent.$children[0].$children[0]
      }
    },
    getRowSelected() {
      var data = []
      if (this.rowSelected.length > 0) {
        this.rowSelected.forEach(idx => {
          data.push(this.items[idx])
        })
        return data
      } else {
        this.alertWarning("No Data Selected")
      }
    },
    headChkBoxAction() {
      this.rowSelected = []
      if (!this.selected) {
        this.items.forEach((el, idx) => {
          this.rowSelected.push(idx)
        })
      }

      this.$emit("allCheckBoxAction", this.items)
    },
    chkBoxAction(index) {
      var x = this.rowSelected.indexOf(index);
      // alert('data_' + this.items.length)
      // alert('terpilih_' + this.rowSelected.length)
      this.selected = false;
      if (index > -1) {
        if (x < 0) {
          if (this.isCheckAsStatus != undefined) {
            if (this.items[index].hasOwnProperty(this.isCheckAsStatus.split("=")[0])) {
              this.items[index][this.isCheckAsStatus.split("=")[0]] = this.isCheckAsStatus.split("=")[1]
            }
          }
          if ((this.rowSelected.length + 1) == this.items.length) {
            this.selected = true;
          }
        }
        else {
          if (this.isCheckAsStatus != undefined) {
            if (this.items[index].hasOwnProperty(this.isCheckAsStatus.split("=")[0])) {
              this.items[index][this.isCheckAsStatus.split("=")[0]] = this.statusFalse
            }
          }
        }
      }
      
      this.$store.commit("setLevel", this.prop.PageLevel)
      this.$store.commit("setTab", this.prop.TabIndex)
      // this.$store.commit('setFormType',this.$parent.FormType)
      this.$parent.$parent.$parent.$parent.$parent.setTabIndex()
    },
    changeCheckBox(index, value, slot) {
      // if (value == 'Y') {
      //   value = 'N'
      // } else if (value == 'N') {
      //   value = 'Y'
      // } else if (value == true) {
      //   value = false
      // } else if (value == false) {
      //   value = true
      // }
      this.$emit("changeCheckbox", index, value)
      this.$emit("changeCheckbox_" + slot, index, value)
      this.onInput()
    },
    chkBoxCustomAction(index, isChecked) {
      if (isChecked == undefined) {
        isChecked = true
      } else if (index === isChecked) {
        isChecked = false
      } else if (isChecked === false) {
        isChecked = true
      }
      
      // this.change()
      this.$emit("changeCheckbox", index, isChecked)
    },
    CheckBoxActionLeftAction(index, isChecked) {
      if (isChecked == undefined) {
        isChecked = true
      } else if (index === isChecked) {
        isChecked = false
      } else if (isChecked === false) {
        isChecked = true
      }
      
      // this.change()
      this.$emit("CheckBoxActionLeftChange", index, isChecked)
    },
    chkBoxInput() {
      var datax = {
        pageLevel: this.prop.PageLevel,
        tabIndex: this.prop.TabIndex,
        checkBoxCount: this.getRowSelectedCount()
      }

      this.getToolbarAbsList().setCheckBoxClick(datax)
    },
    doGetList(search, method) {
      this.checkOrderBy()

      var param
      if (this.prop.propGetDataBy == undefined || this.prop.propGetDataBy == null) {
        param = {
          OptionSeq: this.getOptionSeq().OptionSeq,
          LineNo: this.prop.propList.LineNo,
          UserId: this.getDataUser().user_id,
          PortfolioCd: this.getDataUser().portfolio_cd,
          SubPortfolioCd: this.getDataUser().subportfolio_cd,
          CurrentPage: this.currentPage,
          PerPage: this.perPage,
          // ParamWhere: this.search,
          ParamWhere: search,
          InitialWhere: this.prop.propList.initialWhere,
          SortField: this.sort,
          SourceField: this.prop.propList.SourceField,
          ParamView: this.prop.propList.ParamView
        }
      } else {
        param = this.prop.propGetDataBy
      }

      // this.loader = true;
      this.postEncode(this.prop.propGetDataBy == undefined || this.prop.propGetDataBy == null ? this.getUrlList() : this.getUrlById() + this.prop.NoGetById, param).then(response => {
        // this.loader = false;
        if (response == null) return;

        this.responses = []
        this.responses = response

        this.allColumn = ''
        this.fieldHeader = []
        this.items = []
        this.fieldDecimal = []

        if (this.prop.showCheckBoxDelete) {
          this.fieldHeader.push({
            value: 0,
            key: "chkBoxAction"
          })
        }

        if (this.prop.propGetDataBy == undefined) {
          this.allColumn = this.responses.AllColumn.split(",")
        } else {
          if (this.responses.Data.length > 0) {
            this.allColumn = Object.keys(this.responses.Data[0])
          } else {
            this.allColumn = []
          }
        }

        if (this.prop.showNumber) {
          this.prop.cDisplayColumn = 'no,' + this.prop.cDisplayColumn
          this.allColumn.unshift('no')
        }
        
        for (var k = 0; k < this.prop.comp.length; k++) {
          if (this.prop.comp[k].compType == 'CheckBoxActionLeft') {
            this.fieldHeader.push({
              value: 0,
              key: "CheckBoxActionLeft"
            })

            if (this.prop.comp[k].checkedDefault === true) {
              for (var l = 0; l < this.responses.Data.length; l++) {
                this.responses.Data[l]._CheckBoxActionLeft = l
              }
            }

          }
        }

        this.setHeaderTable()

        for (var k = 0; k < this.prop.comp.length; k++) {
          if (this.prop.comp[k].compType == 'CheckBoxCustom') {
            this.fieldHeader.push({
              value: 0,
              key: "CheckBoxCustom"
            })
          }
        }

        for (var l = 0; l < this.responses.Data.length; l++) {
          if (this.prop.showNumber) {
            this.responses.Data[l].no = l + 1
          }
        }
        this.items = this.responses.Data
        this.recalculateTotal()

        this.$forceUpdate()
      })
    },
    setHeaderTable () {
      var displayColumn = this.prop.cDisplayColumn.split(",")
      for (var j = 0; j < displayColumn.length; j++) {
        for (var i = 0; i < this.allColumn.length; i++) {
          if (this.allColumn[i] == displayColumn[j].split("=")[0]) {
            var thClass = 'ABSthClassList notranslate'
            var tdClass = 'ABStdClassList notranslate'
            if (displayColumn[j].split("=")[1] == 'decimal') {
              thClass = 'ABSthClassList2 notranslate'
              tdClass = 'ABStdClassList2 notranslate'
            }
            this.fieldHeader.push({
              value: i + 1,
              key: this.allColumn[i],
              thClass: thClass,
              tdClass: tdClass
            })

            if (displayColumn[j].split("=")[1] == 'decimal') {
              this.fieldDecimal.push(this.allColumn[i])
            }
          }
        }
      }
    },
    recalculateTotal () {
      // cek kalau ada decimal, di looping untuk formatting decimal datanya
      this.total = []
      if (this.fieldDecimal.length != 0) {
        for (var l = 0; l < this.items.length; l++) {
          // untuk total
          if (this.prop.cTotalColumn != '') {
            for (var n = 0; n < this.prop.cTotalColumn.split(",").length; n++) {
              var value = this.items[l][this.prop.cTotalColumn.split(",")[n]]
              value = this.replaceAllString(value, ',', '')
              if (value == null) {
                value = 0
              }
              // var total = this.total[n]
              var ttl = parseFloat(value).toFixed(this.decimal)
              if (this.total[n] != undefined || this.total[n] != null) {
                var valBefore = parseFloat(this.replaceAllString(this.total[n], ',', ''), this.decimal)
                valBefore = valBefore ? valBefore : 0;
                this.total[n] = parseFloat(valBefore, this.decimal) + parseFloat(ttl, this.decimal)
              } else {
                this.total[n] = parseFloat(ttl, this.decimal) 
                // this.total[n] = value
              }
            }
          }

          // untuk formatting decimal
          for (var m = 0; m < this.fieldDecimal.length; m++) {
            // this.items[l][this.fieldDecimal[m]] = this.isCurrency(this.items[l][this.fieldDecimal[m]], this.decimal)
            var data = this.items[l][this.fieldDecimal[m]] = this.items[l][this.fieldDecimal[m]]
            if (data == null || data == '' || data == undefined) {
              continue
              // data = ''
            } else {
              data = data.toString()
            }
            var field = parseFloat(this.replaceAllString(this.items[l][this.fieldDecimal[m]], ',', ''), this.decimal).toFixed(this.decimal)
            this.items[l][this.fieldDecimal[m]] = this.isCurrency(field, this.decimal)
          }
        }

        if (this.prop.cTotalColumn != '') {
          for (var o = 0; o < this.prop.cTotalColumn.split(",").length; o++) {
            this.total[o] = this.isCurrency(this.total[o], this.decimal)
          }
        }
        
        // this.change()
        this.$emit("total", this.total)
      }
    },
    // FAUZI
    handleInput (indexField, slot, index) {
      if (this.prop.comp[indexField].cType == 'text') {
        if (this.items[index][slot]) {
          this.items[index][slot] = this.items[index][slot].toString()
        }
      }
      else {
        this.items[index][slot] = this.items[index][slot]
      }
      // this.$emit('input', this.value)
      this.onInput()
    },
    formatNumber(evt,indexField, slot, index){     
      
      evt = (evt) ? evt : window.event
      var charCode = (evt.which) ? evt.which : evt.keyCode
      
      if(this.prop.comp[indexField].cType == 'decimal' || this.prop.comp[indexField].cType == 'numeric'){
        // console.log('lala')
        
        
        if ((charCode > 31 && (charCode < 48 || charCode > 57)) && charCode !== 46) {
          evt.preventDefault()
        }
        else if(charCode == 46){
          if (this.prop.comp[indexField].cType == 'numeric') {
            evt.preventDefault()
          }
          else {
            var str = this.items[index][slot]
            if(str.indexOf('.') !== -1){
              evt.preventDefault()
            }
            else {
              return true
            }
          }
        }
        else if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || charCode == 8 || charCode == 32) {
          evt.preventDefault()
        }
        else if (charCode == 13) {
          // this.$emit('onEnterPress', this.value)
          return true
        }
        else {
          return true
        }
      }else{
          if (charCode == 13) {
            // this.$emit('onEnterPress', this.value)
            return true
          }
      }
    },
    isCurrency2 (indexField, slot, index) {
      // console.log(this.value)
      if (this.prop.comp[indexField].cType == 'decimal') {
        // console.log(this.value)
        // this.value = this.isCurrency(this.value, this.decimal)
        if(this.items[index][slot] !== ''){
          var num = this.replaceAllString(this.items[index][slot], ',', '', 'number')
          // console.log(num)
          var numSplit = null
          if (num.toString().indexOf('.') > -1) {
            numSplit = num.toString().split('.')
            if (numSplit[1].length < this.prop.comp[indexField].cDecimal) {
              // var dc = this.decimals.slice(0, (this.prop.comp[indexField].cDecimal - numSplit[1].length))

              // numSplit[1] += dc
            }
            else {
              var x = parseFloat(num).toFixed(this.prop.comp[indexField].cDecimal)
              var nn = x.toString().split('.')
              numSplit[0] = nn[0]
              numSplit[1] = nn[1]
            }
          } else {
            // numSplit = [num, this.decimals]
            numSplit = [num, '00']
          }

          // console.log(numSplit)
          var numReal = (numSplit[0] && numSplit[0] != '') ? numSplit[0] : 0
          var numDecimal = '.' + numSplit[1]

          this.items[index][slot] = numReal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + numDecimal

          this.onBlur(index, slot)
        }
      }

      // this.$emit('onBlur', this.items[index][slot])
      // this.$emit('input', this.items[index][slot])
    },
    // FAUZI
  },
  mounted: function() {
    if (this.prop.divStyle == undefined || this.prop.divStyle == null) {
      // this.prop.divStyle = 'max-height: 185px;overflow-y: scroll;'
    } else {
      this.prop.divStyle = 'max-height: ' + this.prop.divStyle + 'px;overflow-y: scroll;'
    }

    if (this.prop.cTotalColumn == undefined) {
      this.prop.cTotalColumn = ''
    }
  },
};
</script>