<template>
  <div class="height--full">
    <div class="header--content">
      <div class="header--content__breadcrumbs">
        {{TitleHeader}}
      </div>
    </div>
      <div class="content-app-form__body" style="background-color: white;padding-top: 1px !important;margin-left: 15px;margin-right: 15px;height: 95%;overflow-y: auto;overflow-x: hidden;padding-bottom: 1%;">
        <b-collapse id="collapse1" :visible="true">
        <b-row style="margin-left:20px;margin-top: 20px;">					
          <b-col md="12" id="col-left">
            <b-form :data-vv-scope="'FormScope_' + 1 + '_' + 1" :data-vv-value-path="'FormScope_' + 1 + '_' + 1">
            <b-row v-for="(dataRow, idx) in RowData" :key="idx">
              <template v-for="(data, index) in response">
                <template v-if="dataRow == data.RowNo">
                  <template v-if="data.isColumn == 'True'">
                    <template v-if="data.ColumnType=='Tag'">
                      <div class="div-collapse" :key="index">
                        <span class="master-span-form">
                          {{data.Label}}
                        </span>
                      </div>
                    </template>
                    <template v-if="data.ColumnType=='Label'">
                      <b-col md="6" :key="index" :offset="index > 1 ? ((response[index-1].RowNo != data.RowNo && parseInt(data.position) % 2 == 0) ? '6' : '') : ''">
                        <span>
                          <b-row>
                            <b-col md="4" offset="4">
                              <ABSLabelOnly :prop="{cLabel: data.Label,
                                cLabelSize: 4,
                                cValue: '',
                                cPageLevel: 1,
                                cTabIndex: 1,
                                cVisible: true,
                                cClass: ''}"
                              />
                            </b-col>
                          </b-row>
                        </span>
                      </b-col>
                    </template>
                    <template v-if="data.ColumnType=='LookUp'">
                      <b-col md="6" :key="index" :offset="index > 1 ? ((response[index-1].RowNo != data.RowNo && parseInt(data.position) % 2 == 0) ? '6' : '') : ''">
                        <ABSInputSelectList @change="OnLookUpChange(models[data.ParamName], index, data.ParamName)"
                          :prop="{
                              dataLookUp: {
                                LookUpCd: data.LookUpCd,
                                ColumnDB: data.LookUpDB,
                                InitialWhere: data.LookUpInitialWhere2,
                                ParamWhere: '',
                                OrderBy: data.LookUpSortField,
                                SourceField: data.sourceField,
                                DisplayLookUp: data.DisplayLookUp,
                                ParamView: data.ParamViewLookUp2
                              },
                              cValidate : (data.isRequired && data.isRequired == 'True' ? 'required' : ''),
                              cName: data.ParamName,
                              cLabel: data.Label,
                              cKey: false,
                              cLabelSize: '4',
                              cOrder: data.TabOrder,
                              cTriggered: false,
                              cDefault: '',
                              cProtect: (data.isDisabled && data.isDisabled == 'True' ? true : false),
                              cVisible: (data.isVisible && data.isVisible == 'True' ? true : false),
                              cAsync: false,
                              cFilter: false,
                              cPageLevel: 1,
                              cTabIndex: 1,
                              cParentForm: 'FormScope_' + 1 + '_' + 1,
                              cStatic: false,
                              cOption: [],
                              cDisplayColumn: data.DisplayColumn,
                              cHideRowColumnCSS: false,
                              cRowDisable: []
                          }"
                          v-model="models[data.ParamName]"
                          :label="models[data.ParamName+'Label']"
                        />
                      </b-col>
                    </template>
                    <template v-if="data.ColumnType=='String'">
                      <b-col md="6" :key="index" :offset="index > 1 ? ((response[index-1].RowNo != data.RowNo && parseInt(data.position) % 2 == 0) ? '6' : '') : ''">
                        <ABSinputTextVuex
                          :prop="{
                            cValidate: (data.MaxLength && data.MaxLength != '' && data.MaxLength != 0 ? 'max:' + data.MaxLength : '') + (data.isRequired && data.isRequired == 'True' ? '|required' : ''),
                            cName: data.ParamName,
                            cLabel: data.Label,
                            cLabelSize: '4',
                            cOrder: data.TabOrder,
                            cKey: false,
                            cType: 'text',
                            cDefault: '',
                            cProtect: (data.isDisabled && data.isDisabled == 'True' ? true : false),
                            cVisible: (data.isVisible && data.isVisible == 'True' ? true : false),
                            cPageLevel: '1',
                            cTabIndex: '1',
                            cParentForm: 'FormScope_' + 1 + '_' + 1,
                            cDecimal: '0',
                            cLastLabel: '',
                            cStyle: '',
                            cIsAlwaysShow: false
                          }"
                          @input="OnInputTextChange(models[data.ParamName], data.ParamName)"
                          v-model="models[data.ParamName]"
                          :ref="'ref_'+data.ParamName"
                        />
                      </b-col>
                    </template>
                    <template v-if="data.ColumnType=='Numeric'">
                      <b-col md="6" :key="index" :offset="index > 1 ? ((response[index-1].RowNo != data.RowNo && parseInt(data.position) % 2 == 0) ? '6' : '') : ''">
                        <ABSinputTextVuex
                          :prop="{
                            cValidate: (data.MaxLength && data.MaxLength != '' && data.MaxLength != 0 ? 'max:' + data.MaxLength : '') + (data.isRequired && data.isRequired == 'True' ? '|required' : ''),
                            cName: data.ParamName,
                            cLabel: data.Label,
                            cLabelSize: '4',
                            cOrder: data.TabOrder,
                            cKey: false,
                            cType: 'numeric',
                            cDefault: '',
                            cProtect: (data.isDisabled && data.isDisabled == 'True' ? true : false),
                            cVisible: (data.isVisible && data.isVisible == 'True' ? true : false),
                            cPageLevel: '1',
                            cTabIndex: '1',
                            cParentForm: 'FormScope_' + 1 + '_' + 1,
                            cDecimal: '0',
                            cLastLabel: '',
                            cStyle: '',
                            cIsAlwaysShow: false
                          }"
                          @input="OnInputTextChange(models[data.ParamName], data.ParamName)"
                          v-model="models[data.ParamName]"
                          :ref="'ref_'+data.ParamName"
                        />
                      </b-col>
                    </template>
                    <template v-if="data.ColumnType=='Decimal'">
                      <b-col md="6" :key="index" :offset="index > 1 ? ((response[index-1].RowNo != data.RowNo && parseInt(data.position) % 2 == 0) ? '6' : '') : ''">
                        <ABSinputTextVuex
                          :prop="{
                            cValidate: (data.MaxLength && data.MaxLength != '' && data.MaxLength != 0 ? 'max:' + data.MaxLength : '') + (data.isRequired && data.isRequired == 'True' ? '|required' : ''),
                            cName: data.ParamName,
                            cLabel: data.Label,
                            cLabelSize: '4',
                            cOrder: data.TabOrder,
                            cKey: false,
                            cType: 'decimal',
                            cDefault: '',
                            cProtect: (data.isDisabled && data.isDisabled == 'True' ? true : false),
                            cVisible: (data.isVisible && data.isVisible == 'True' ? true : false),
                            cPageLevel: '1',
                            cTabIndex: '1',
                            cParentForm: 'FormScope_' + 1 + '_' + 1,
                            cDecimal: '2',
                            cLastLabel: '',
                            cStyle: '',
                            cIsAlwaysShow: false
                          }"
                          @input="OnInputTextChange(models[data.ParamName], data.ParamName)"
                          v-model="models[data.ParamName]"
                          :ref="'ref_'+data.ParamName"
                        />
                      </b-col>
                    </template>
                    <template v-if="data.ColumnType=='DateRange'">
                      <b-col md="6" :key="index" :offset="index > 1 ? ((response[index-1].RowNo != data.RowNo && parseInt(data.position) % 2 == 0) ? '6' : '') : ''">
                        <ABSinputDateRangeVuex
                          :prop="{
                            cValidate: (data.MaxLength && data.MaxLength != '' && data.MaxLength != 0 ? 'max:' + data.MaxLength : '') + (data.isRequired && data.isRequired == 'True' ? '|required' : ''),
                            cName: data.ParamName,
                            cLabel: data.Label,
                            cLabelSize: '4',
                            cOrder: data.TabOrder,
                            cKey: false,
                            cVisible: (data.isVisible && data.isVisible == 'True' ? true : false),
                            cProtect: (data.isDisabled && data.isDisabled == 'True' ? true : false),
                            cFormat: 'dd/MM/yyyy',
                            cPageLevel: 1,
                            cTabIndex: 1,
                            cParentForm: 'FormScope_' + 1 + '_' + 1
                          }"
                          :valueFrom="models[data.ParamName.split(',')[0].trim()]"
                          :valueTo="models[data.ParamName.split(',')[1].trim()]"
                          @from="OnDateRangeFrom"
                          @to="OnDateRangeTo"
                          @input="OnDateRangeFromInput"
                        />
                      </b-col>
                    </template>
                    <template v-if="data.ColumnType=='DateTime'">
                      <b-col md="6" :key="index" :offset="index > 1 ? ((response[index-1].RowNo != data.RowNo && parseInt(data.position) % 2 == 0) ? '6' : '') : ''">
                        <ABSinputDateVuex
                          @input="OnInputDateChange(models[data.ParamName], data.ParamName)"
                          :prop="{
                            cValidate : (data.isRequired && data.isRequired == 'True' ? 'required' : ''),
                            cName: data.ParamName,
                            cLabel: data.Label,
                            cLabelSize: 4,
                            cOrder: data.TabOrder,
                            cKey: false,
                            cVisible:  true,
                            cProtect: (data.isDisabled && data.isDisabled == 'True' ? true : false),
                            cFormat: 'dd/MM/yyyy',
                            cPageLevel: 1,
                            cTabIndex: 1,
                            cParentForm: 'FormScope_' + 1 + '_' + 1
                          }"
                          v-model="models[data.ParamName]"
                        />
                      </b-col>
                    </template>
                    <template v-if="data.ColumnType=='Dropdown'">
                      <b-col md="6" :key="index" :offset="index > 1 ? ((response[index-1].RowNo != data.RowNo && parseInt(data.position) % 2 == 0) ? '6' : '') : ''">
                        <ABSInputSelect2 @change="OnLookUpChange(models[data.ParamName], index, data.ParamName)"
                          :prop="{
                            dataLookUp: null,
                            cValidate : (data.isRequired && data.isRequired == 'True' ? 'required' : ''),
                            cName: data.ParamName,
                            cLabel: data.Label,
                            cKey: false,
                            cLabelSize: '4',
                            cOrder: data.TabOrder,
                            cTriggered: false,
                            cDefault: '',
                            cProtect: (data.isDisabled && data.isDisabled == 'True' ? true : false),
                            cVisible: (data.isVisible && data.isVisible == 'True' ? true : false),
                            cAsync: false,
                            cFilter: false,
                            cPageLevel: 1,
                            cTabIndex: 1,
                            cParentForm: 'FormScope_' + 1 + '_' + 1,
                            cStatic: true,
                            cOption: toArray(data.setValue),
                            cDisplayColumn: '',
                            cHideRowColumnCSS: false,
                            cRowDisable: []
                          }"
                          v-model="models[data.ParamName]"
                          :label="models[data.ParamName+'Label']"
                        />
                      </b-col>
                    </template>
                    <template v-if="data.ColumnType=='RadioButtonList'">
                      <b-col md="6" :key="index" :offset="index > 1 ? ((response[index-1].RowNo != data.RowNo && parseInt(data.position) % 2 == 0) ? '6' : '') : ''">
                        <ABSinputRadioButtonVuex
                          @input="OnInputRadioChange(models[data.ParamName], data.ParamName)"
                          :prop="{
                            cId: data.ParamName + index + data.RowNo + data.position,
                            cName: data.ParamName,
                            cValidate: (data.isRequired && data.isRequired == 'True' ? 'required' : ''),
                            cRadioOptions: toArray(data.setValue),
                            cLabel: data.Label,
                            cLabelSize: '4',
                            cOrder: data.TabOrder,
                            cKey: false,
                            cVisible: true,
                            cRadioDefaultOption: '',
                            cPageLevel: 1,
                            cTabIndex: 1,
                            cParentForm: 'FormScope_' + 1 + '_' + 1,
                            cProtect: (data.isDisabled && data.isDisabled == 'True' ? true : false),
                            cShowClearButton: false
                          }"
                          v-model="models[data.ParamName]"
                        />
                      </b-col>
                    </template>
                    <template v-if="data.ColumnType=='CheckBox'">
                      <b-col md="6" :key="index" :offset="index > 1 ? ((response[index-1].RowNo != data.RowNo && parseInt(data.position) % 2 == 0) ? '6' : '') : ''">
                        <ABSinputCheckBox
                          @input="OnCheckBoxChange(models[data.ParamName], data.ParamName)"
                          :prop="{
                            cName: data.ParamName,
                            cValidate: (data.isRequired && data.isRequired == 'True' ? 'required' : ''),
                            cOptions: toArray(data.setValue),
                            cLabel: data.Label,
                            cLabelSize: '4',
                            cOrder: data.TabOrder,
                            cKey: false,
                            cVisible: true,
                            cDefault: [],
                            cPageLevel: 1,
                            cTabIndex: 1,
                            cParentForm: 'FormScope_' + 1 + '_' + 1,
                            cProtect: (data.isDisabled && data.isDisabled == 'True' ? true : false)
                          }"
                          v-model="models[data.ParamName]"
                        />
                      </b-col>
                    </template>
                  </template>
                </template>
              </template>
            </b-row>
            
            <b-row>
              <b-col md="12" style="text-align:center;padding-top:10px;padding-bottom:10px">
                <ABSButton
                  text="Generate Report"
                  icon="list"
                  classButton="button button--refresh"
                  classIcon="icon-style-1"
                  @click="M_GenerateReport"
                  styleButton="width: 200px !important;"
                />
              </b-col>
            </b-row>
          </b-form>
          </b-col>
        </b-row>
        </b-collapse>
        <div class="div-collapse" v-b-toggle.collapse1>
          <span class="master-span">
            <!-- nput By : {{IEBy.Input}} | Edit By : {{IEBy.Edit}}--> <font-awesome-icon icon="sort-down" class="icon-style-1__master" />  
          </span>
        </div>
        <!-- <b-collapse id="collapse1" :visible="true"> -->
          <ABSPreviewReport :cVisible="reportVisible" :cSrc="dataUrl" />
        <!-- </b-collapse> -->
        <!-- <b-row>
          <b-col md="12" style="margin-left: 15px;"> -->
            <!-- <ABSPreviewReport :cVisible="reportVisible" :cSrc="dataUrl" /> -->
          <!-- </b-col>
        </b-row> -->
    </div>
    <!-- <ABSPreviewReport :cVisible="reportVisible" :cSrc="dataUrl" /> -->
  </div>
</template>

<script>

export default {
  data() {
    return {
      dataUrl:'',//'https://www.google.com&rs:Command=Render&rs:ClearSession=true&rc:Toolbar=false',
      // xx: 'http://192.168.6.98/ReportPams/ReportsTemplate?oid=cfcd208495d565ef66e7dff9f98764da&ParamWhere=PortfolioName:PT. Absolute Connection^SubPortfolioName:PT. Absolute Connection^SubportfolioAddress:^SubportfolioCd:001',
      // field: null,
      // fieldArray: [],
      // html: [],
      PageLevel: '',
      TabIndex: '',
      reportParam: null,
      reportVisible: true,
      TitleHeader:'',

      response: [],
      models: {},
      onChangeModels: {},
      RowData: []
    }
  },
  watch: {
    models: function(newData, oldData) {
      this.$emit('input', this.models)
    },
    '$route.query.oid'() {
        this.fnLoadData()
    }
  },
  methods: {
    OnInputTextChange(data, paramName){},
    OnInputDateChange(data, paramName){},
    OnInputRadioChange(data, paramName){},
    OnCheckBoxChange(data, paramName){},
    OnLookUpChange(data, index, paramName){
      // console.log('ahoy')
      // this.$nextTick(() => {
        // console.log(data)
        // console.log(index)
        // console.log(paramName)
        this.models[paramName] = data.id
        this.models[paramName+'Label'] = data.label
        this.onChangeModels[paramName] = data
        var end = false
        var paramNameToSet = ''
        var hasChange = []


        if (this.response[index].OnChangeTriggerField && this.response[index].OnChangeTriggerField != '') {
          var onChangeField = this.response[index].OnChangeTriggerField.split(',')
          // hasChange = onChangeField
          if (onChangeField.length > 0) {
            for (let x = 0 ; x < onChangeField.length ; x ++) {
              paramNameToSet = onChangeField[x]
              var indexField = this.response.map(zz => zz.ParamName).indexOf(onChangeField[x])
              var idxMany = 0

              if (indexField == -1) {
                // console.log('yes2')
                for(let idSpliter = 0; idSpliter < this.response.length; idSpliter++) {
                  // if (this.response[idSpliter].ParamName.includes(onChangeField[x])) {
                    // console.log('yes2')
                    if (this.response[idSpliter].ColumnType == 'DateRange') {
                      // console.log('yes3S')
                      if (this.response[idSpliter].ParamName.split(',').includes(onChangeField[x])) {
                        // console.log('yes3S-2', idSpliter)
                        if (this.response[idSpliter].SetColumnValue && this.response[idSpliter].SetColumnValue != '') {
                          // console.log(onChangeField[x], this.response[idSpliter].SetColumnValue)
                          // console.log(data)
                          this.models[onChangeField[x]] = this.momentDateFormat(data[this.response[idSpliter].SetColumnValue], 'DD/MM/YYYY')
                          // this.$forceUpdate()
                        }
                        end = true
                        break
                      }
                      else {
                        var paramDR = this.response[idSpliter].ParamName.split(',')
                        // console.log('yes3S-2X', paramDR)
                        // console.log(idSpliter)
                        for (let DR = 0; DR < paramDR.length; DR++) {
                          // console.log(onChangeField[x])
                          // console.log('yesxxxx', paramDR[DR])
                          if (onChangeField[x].includes(paramDR[DR])) {
                            if (this.response[idSpliter].SetColumnValue && this.response[idSpliter].SetColumnValue != '') {
                              var colVal = this.response[idSpliter].SetColumnValue.split('|')[DR]
                              // console.log(colVal)
                              if (colVal != '') {
                                var idAct = onChangeField[x].split(paramDR[DR])[1]
                                var dataAct = colVal.split(',')[idAct-1]
                                // console.log('yes5', idAct)
                                if (dataAct != '') {
                                  this.models[paramDR[DR]] = this.momentDateFormat(data[dataAct], 'DD/MM/YYYY')
                                  // this.$forceUpdate()
                                }
                              }
                            }
                            end = true
                            break
                          }
                        }
                      }
                    }
                    else {
                      if (onChangeField[x].includes(this.response[idSpliter].ParamName)) {
                        // console.log('yes3X')
                        indexField = idSpliter
                        idxMany = onChangeField[x].split(this.response[idSpliter].ParamName)[1]
                        paramNameToSet = this.response[idSpliter].ParamName
                        hasChange.push({'ParamName': paramName, 'ColumnChange': paramNameToSet})
                        break
                      }
                    }
                  // }
                }

                // console.log(end)
                // console.log(indexField)
                // console.log(idxMany)
                // console.log(paramNameToSet)

                // if (end) return
                // if (indexField == -1) return
                if (!end && indexField > -1) {
                  if (this.response[indexField].SetColumnValue && this.response[indexField].SetColumnValue != '') {
                    var colVal = this.response[indexField].SetColumnValue.split('|')[idxMany-1]
                    // console.log('yes4',colVal)
                    //Trigger Value To LookUp
                    if (this.response[indexField].ColumnType == 'LookUp') {
                      var ColValue = colVal.split(',')
                      // console.log('yes5',ColValue)
                      if (ColValue.length > 0) {
                        for ( let cv = 0 ; cv < ColValue.length ; cv ++) {
                          var lu = ColValue[cv].split('=')
                          if (lu[0] == 'id') {
                            this.models[paramNameToSet] = data[lu[1]]
                          }
                          else if (lu[0] == 'label') {
                            this.models[paramNameToSet+'Label'] = data[lu[1]]
                          }
                          // this.$forceUpdate()
                        }
                      }
                    }
                    //End Trigger Value To LookUp

                    //Trigger Value To Text, Date, Radio
                    else {
                      this.models[onChangeField[x]] = data[this.response[indexField].SetColumnValue]
                      // this.$forceUpdate()
                    }
                    //End Trigger Value To Text, Date, Radio
                  }
                }
              }
              else {
                hasChange.push({'ParamName': paramName, 'ColumnChange': onChangeField[x]})
                if (this.response[indexField].SetColumnValue && this.response[indexField].SetColumnValue != '') {

                  //Trigger Value To LookUp
                  if (this.response[indexField].ColumnType == 'LookUp') {
                    var ColValue = this.response[indexField].SetColumnValue.split(',')
                    if (ColValue.length > 0) {
                      for ( let cv = 0 ; cv < ColValue.length ; cv ++) {
                        var lu = ColValue[cv].split('=')
                        if (lu[0] == 'id') {
                          this.models[onChangeField[x]] = data[lu[1]]
                        }
                        else if (lu[0] == 'label') {
                          this.models[onChangeField[x]+'Label'] = data[lu[1]]
                        }
                        // this.$forceUpdate()
                      }
                    }
                  }
                  //End Trigger Value To LookUp

                  //Trigger Value To Text, Date, Radio
                  else {
                    this.models[onChangeField[x]] = data[this.response[indexField].SetColumnValue]
                    // this.$forceUpdate()
                  }
                  //End Trigger Value To Text, Date, Radio
                }
              }
            }
          }
        }

        if (this.response[index].OnChangeTriggerInitialWhere && this.response[index].OnChangeTriggerInitialWhere != '') {
          // console.log('yes1')
          //OnChange To Trigger Any Where Parameter

          var onChangeWhere = this.response[index].OnChangeTriggerInitialWhere.split(',')
          if (onChangeWhere.length > 0) {
            // console.log('yes2',onChangeWhere)
            for (let x = 0 ; x < onChangeWhere.length ; x ++) {
              var indexFieldWhere = this.response.map(zz => zz.ParamName).indexOf(onChangeWhere[x])

              if (this.response[indexFieldWhere].SetColumnWhere && this.response[indexFieldWhere].SetColumnWhere != '') {
                // console.log('yes3',indexFieldWhere)
                //Trigger Where To LookUp
                if (this.response[indexFieldWhere].ColumnType == 'LookUp') {
                  var newWhere = this.response[indexFieldWhere].LookUpInitialWhere
                  var splitInitialWhere = this.response[indexFieldWhere].LookUpInitialWhere.trim().split(' ')
                  var setWhere = this.response[indexFieldWhere].SetColumnWhere.trim().split(' ')
                  for (let sw = 0; sw < setWhere.length; sw++) {
                    // console.log(setWhere[sw])
                    var cols = setWhere[sw].split('=')[0].trim()
                    //check initialwhere
                    for (let iw = 0; iw < splitInitialWhere.length; iw++) {
                      if (splitInitialWhere[iw+1]){
                        if (splitInitialWhere[iw+1].toUpperCase().includes('AND')) {
                          if (splitInitialWhere[iw].split('=')[0].trim() == cols.toUpperCase()) {
                            newWhere = newWhere.replace(splitInitialWhere[iw] + ' AND', '')
                          }
                        }
                        else {
                          if (splitInitialWhere[iw].split('=')[0].trim() == cols.toUpperCase()) {
                            newWhere = newWhere.replace(splitInitialWhere[iw], '')
                          }
                        }
                      }
                      else {
                        if (splitInitialWhere[iw-1]){
                          if (splitInitialWhere[iw-1].toUpperCase().includes('AND')) {
                            if (splitInitialWhere[iw].split('=')[0].trim() == cols.toUpperCase()) {
                              newWhere = newWhere.replace('AND ' + splitInitialWhere[iw], '')
                            }
                          }
                          else {
                            if (splitInitialWhere[iw].split('=')[0].trim() == cols.toUpperCase()) {
                              newWhere = newWhere.replace(splitInitialWhere[iw], '')
                            }
                          }
                        }
                        else {
                          if (splitInitialWhere[iw].split('=')[0].trim() == cols.toUpperCase()) {
                            newWhere = newWhere.replace(splitInitialWhere[iw], '')
                          }
                        }
                      }
                    }

                    newWhere = newWhere && newWhere != '' ? newWhere.trim() + ' AND ' : newWhere.trim()

                    if (setWhere[sw].includes('^')) {
                      // var forReplace = setWhere[sw].match(/(?=\^)(.*)(?=\^)/g)[0]
                      var forReplace = setWhere[sw].match(new RegExp(/\^(.*)\^/))[1]
                      if (forReplace && forReplace != ''){
                        // forReplace = forReplace.substring(1, (forReplace.length - 1))
                        // console.log(forReplace)
                        if (forReplace.includes('.')) {
                          //Set Where With OnChange Data
                          // if (paramName == forReplace.split('.')[0]) {
                            var isWhere = this.onChangeModels[forReplace.split('.')[0]][forReplace.split('.')[1]]
                            // console.log(isWhere)
                            if (isWhere && isWhere != '') {
                              newWhere += cols + "='" + this.onChangeModels[forReplace.split('.')[0]][forReplace.split('.')[1]] + "' AND "
                            }
                            else {
                              var idChange = hasChange.map(x => x.ColumnChange).indexOf(forReplace.split('.')[0])
                              // console.log(idChange)
                              if (idChange > -1) {
                                newWhere += cols + "='" + this.onChangeModels[hasChange[idChange].ParamName][forReplace.split('.')[1]] + "' AND "
                              }
                            }
                          // }
                        }
                        else {
                          // Set Where With Model Data
                          // console.log('data',data)
                          newWhere += cols + "='" + data[forReplace] + "' AND "
                        }
                      }
                    }
                    else {
                      newWhere += ' ' + setWhere[sw] + " AND "
                    }

                    // console.log(newWhere)

                    if (sw == (setWhere.length - 1)) {
                      newWhere = newWhere.substring(0, (newWhere.length - 4))
                      // console.log('final',newWhere)
                      this.response[indexFieldWhere].LookUpInitialWhere2 = newWhere
                    }
                  }

                  // this.response[indexFieldWhere].LookUpInitialWhere2 = this.response[indexFieldWhere].LookUpInitialWhere + " " + newWhere
                }
                //End Trigger Where To LookUp
              }
            }
          }
        }

        this.M_CheckParamView()

      this.$forceUpdate()
    },
    OnDateRangeFrom(data, paramName){
      // console.log(data)
      // console.log(paramName)
      // this.$nextTick(() => {
      this.models[paramName.split(',')[0].trim()] = data
      this.models[paramName.split(',')[1].trim()] = data

      for(let x = 0 ; x < this.response.length ; x ++) {
        if (this.response[x].ColumnType == 'DateRange' && this.response[x].ParamName.includes(paramName)) {
          var index = x
          if (this.response[index].OnChangeTriggerField && this.response[index].OnChangeTriggerField != '') {
            var onChangeField = this.response[index].OnChangeTriggerField.split(',')

            if (onChangeField.length > 0) {
              for (let x = 0 ; x < onChangeField.length ; x ++) {
                this.models[onChangeField[x]] = this.momentDateFormatting(data, 'DD/MM/YYYY')
              }
            }
          }

          break
        }
      }
      // })

      this.$forceUpdate()
    },
    OnDateRangeFromInput(data, slot) {
      // console.log(slot,data)
    },
    OnDateRangeTo(data, paramName){
      // console.log(data)
      // console.log(paramName)
      // this.$nextTick(() => {
      this.models[paramName.split(',')[1].trim()] = data

      for(let x = 0 ; x < this.response.length ; x ++) {
        if (this.response[x].ColumnType == 'DateRange' && this.response[x].ParamName.includes(paramName)) {
          var index = x
          if (this.response[index].OnChangeTriggerField && this.response[index].OnChangeTriggerField != '') {
            var onChangeField = this.response[index].OnChangeTriggerField.split(',')

            if (onChangeField.length > 0) {
              for (let x = 0 ; x < onChangeField.length ; x ++) {
                this.models[onChangeField[x]] = this.momentDateFormatting(data, 'DD/MM/YYYY')
              }
            }
          }

          break
        }
      }
      // })

      this.$forceUpdate()
    },
    M_ClearForm () {
    },
    M_GenerateReport () {
      console.log(this.models)
      var scopeForm = "FormScope_" + 1 + "_" + 1

      this.$validator._base.validateAll(scopeForm).then((result) => {
        if (!result) return
        
        var params = ""
        var reportPath = "/" + this.response[0].PathReport + "/" + this.response[0].ReportName
        
        var paramToGetPath = {
          OptionSeq : this.getOptionSeq().OptionSeq
        }

        this.postEncode(this.getUrlConditionForReportPath(), paramToGetPath)
        .then((ress) => {
          var data;
          if (ress) {
            if (ress.Data.length > 0) {
              var cond = ress.Data
              cond.forEach((data, index) => {
                var state1 = true;
                var state2 = true;
                var state3 = true;

                if(data.OptionFunctionCd && data.OptionFunctionCd != ''){
                  var strParam = data.ParameterFunction && data.ParameterFunction != '' ? data.ParameterFunction.split(',') : []
                  var param = {}
                  if (strParam.length > 0) {
                    strParam.forEach((parm, i) => {
                      var p = parm.split('=')
                      param[p[0].trim()] = this.GetParameter(p[1].trim())
                    })

                    this.FnDynamicFunction(param)
                    .then(ress => {
                      if (ress) {
                        if (ress.length > 0) {
                          var dynamicData = ress[0]
                          if (
                            (dynamicData[data.ParamA] && dynamicData[data.ParamA] != '') &&
                            (dynamicData[data.ValueA] && dynamicData[data.ValueA] != '')
                          ){
                            state1 = false
                            if (this.models[dynamicData[data.ParamA]] == dynamicData[data.ValueA]) {
                              state1 = true
                            }
                          }

                          if (
                            (dynamicData[data.ParamB] && dynamicData[data.ParamB] != '') &&
                            (dynamicData[data.ValueB] && dynamicData[data.ValueB] != '')
                          ){
                            state2 = false
                            if (this.models[dynamicData[data.ParamB]] == dynamicData[data.ValueB]) {
                              state2 = true
                            }
                          }

                          if (
                            (dynamicData[data.ParamC] && dynamicData[data.ParamC] != '') &&
                            (dynamicData[data.ValueC] && dynamicData[data.ValueC] != '')
                          ){
                            state3 = false
                            if (this.models[dynamicData[data.ParamC]] == dynamicData[data.ValueC]) {
                              state3 = true
                            }
                          }

                          if (state1 && state2 && state3) {
                            reportPath = data.ReportPath
                          }
                        }
                      }
                    })
                  }
                }
                else {
                  if (
                    (data.ParamA && data.ParamA != '') &&
                    (data.ValueA && data.ValueA != '')
                  ){
                    state1 = false
                    if (this.models[data.ParamA] == data.ValueA) {
                      state1 = true
                    }
                  }

                  if (
                    (data.ParamB && data.ParamB != '') &&
                    (data.ValueB && data.ValueB != '')
                  ){
                    state2 = false
                    if (this.models[data.ParamB] == data.ValueB) {
                      state2 = true
                    }
                  }

                  if (
                    (data.ParamC && data.ParamC != '') &&
                    (data.ValueC && data.ValueC != '')
                  ){
                    state3 = false
                    if (this.models[data.ParamC] == data.ValueC) {
                      state3 = true
                    }
                  }

                  if (state1 && state2 && state3) {
                    reportPath = data.ReportPath
                  }
                }
              })

              // data = ress.Data[0]
              // if (!data.ScriptCondition || data.ScriptCondition == '') {}
              // else {
                // var str = data.ScriptCondition
                
                // if (this.response[0].CntReportPath > 1) {
                //   var arrCondition = str.split('^')
                //   var col = ''
                //   var val = ''

                //   arrCondition.forEach((data, index) => {
                //     if (data.includes('else if') || data.includes('if')) {
                //       var dt = data.substring(data.indexOf('(')+1, data.indexOf(')'))
                //       col = dt.split('==')[0].trim()
                //       val = dt.split('==')[1].trim()
                //     }
                //     else {
                //       var condition = data.split(';')
                //       if (condition.length > 0) {
                //         condition.forEach((dt, index) => {
                //           //saat ini hanya untuk reportpath
                //           var setCol = dt.split('=')[0].trim()
                //           var setVal = dt.split('=')[1].trim()
                //           if (this.models[col] == val) {
                //             // console.log(setCol, setVal)
                //             reportPath = setVal
                //           }
                //         })
                //       }
                //     }
                //   })
                // }
              // }
            }
          }

          // console.log(this.response)
          // console.log(this.models)

          // for (let idx = 0; idx < this.response.length; idx++) {
          //   if (this.response[idx].isParam == 'True') {
          //     if (this.response[idx].ColumnType == 'DateRange') {
          //       var name = this.response[idx].ParamName.split(',')
          //       params += name[0].trim() + ":" + this.models[name[0].trim()] + "^"
          //       params += name[1].trim() + ":" + this.models[name[1].trim()]
          //     }
          //     else {
          //       params += this.response[idx].ParamName + ":" + this.models[this.response[idx].ParamName]
          //     }

          //     if (idx < (this.response.length - 1)) {
          //       params += "^"
          //     }
          //   }
          // }
          for (let idx = 0; idx < this.response.length; idx++) {
            var yesno = 0
            var isDT = 0
            if (this.response[idx].ColumnType.toUpperCase().includes('Date')) {
              isDT = 1
            }

            if (this.response[idx].isParam == 'True') {
              yesno = 1

              if (this.response[idx].DefaultValue.toUpperCase().includes('ORDER BY')) {
                var orderbyy = 'ORDER BY '
                var exst = this.response[idx].DefaultValue
                var varOrderBy = exst.match(new RegExp(/\{(.*)\}/))[0].split(',')
                for (let vob = 0; vob < varOrderBy.length; vob++) {
                  var varParam = varOrderBy[vob].match(new RegExp(/\{(.*)\}/))[1]

                  if (!orderbyy.includes(this.models[varParam.trim()])) {
                    orderbyy += this.models[varParam.trim()] + ','
                  }

                  if (vob == (varOrderBy.length-1)) {
                    orderbyy = orderbyy.slice(0,-1)
                  }
                }
                
                // params += yesno + "|" + isDT + "|" + this.response[idx].ParamName + ":" + orderbyy
                this.models[this.response[idx].ParamName] = orderbyy
              }
              else {
                if (this.response[idx].DefaultValue.includes('{') && this.response[idx].DefaultValue.includes('}')){
                  var pN = this.response[idx].DefaultValue.match(new RegExp(/\{(.*)\}/))[1]
                  var idxPN = this.response.map(x => x.ParamName).indexOf(pN)
                  if (this.response[idxPN].ColumnType == "CheckBox") {
                    var val = this.response[idx].DefaultValue.split('=')[1]
                    this.models[this.response[idx].ParamName] = this.models[pN].includes(val) ? 'Y' : 'N'
                  }
                }
              }
            }
            // if (this.response[idx].isParam == 'True') {
              if (this.response[idx].ColumnType == 'DateRange') {
                var name = this.response[idx].ParamName.split(',')
                params += yesno + "|" + isDT  + "|" +  name[0].trim() + ":" + this.models[name[0].trim()] + "^"
                params += yesno + "|" + isDT  + "|" + name[1].trim() + ":" + this.models[name[1].trim()] 
              }
              else {
                params += yesno + "|" + isDT  + "|" + this.response[idx].ParamName + ":" + this.models[this.response[idx].ParamName]
              }

              if (idx < (this.response.length - 1)) {
                params += "^"
              }
            // }
          }

          var param = {
            OptionSeq : this.getOptionSeq().OptionSeq,
            ParamWhere: params,
            ReportPath: reportPath
          }

          this.postEncode(this.getUrlSaveParamTemp(), param)
          .then((response) => {
            if(response == null) return
            var data = response.Data[0].Id
            this.dataUrl = this.GenerateReportTemplate(this.getOptionSeq().OptionSeq, data)
            console.log(this.dataUrl)
            this.reportVisible = true
          })
        })
      })
    },
    loadData() {
        // getUrlParameterHTML
        var param = {
          OptionSeq: this.getOptionSeq().OptionSeq,
          SubPortfolioCd: this.getDataUser().subportfolio_cd,
          UserId: this.getDataUser().user_id,
          // ParamWhere: "isParam=1"
        }

        this.postEncode(this.getUrlParameterHTML(), param)
        .then((response) => {
            if(response == null) return
            this.response = response.Data
            for (let a = 0; a < this.response.length; a ++) {
              if (a == 0) {
                this.RowData.push(this.response[a].RowNo)
              }
              else {
                if (this.RowData.indexOf(this.response[a].RowNo) < 0) {
                  this.RowData.push(this.response[a].RowNo)
                }
              }
              
              var iWhere = this.ReplaceParameter(this.response[a].LookUpInitialWhere, true)
              this.response[a].LookUpInitialWhere = iWhere
              this.response[a].LookUpInitialWhere2 = iWhere

              this.response[a].DefaultValue = this.response[a].DefaultValue && this.response[a].DefaultValue != '' ? this.response[a].DefaultValue : ''

              if (this.response[a].ColumnType == 'LookUp') {
                this.models[this.response[a].ParamName.trim()] = this.ReplaceParameter(this.response[a].DefaultValue, false)
                this.models[this.response[a].ParamName.trim()+'Label'] = this.ReplaceParameter(this.response[a].DefaultValue, false)

                this.onChangeModels[this.response[a].ParamName.trim()] = {}

                if (this.response[a].ParamViewLookUp && this.response[a].ParamViewLookUp != '') {
                  var pView = this.response[a].ParamViewLookUp.trim().split(',')
                  var pView2 = ""
                  for (let pv = 0; pv < pView.length; pv ++) {
                    if (pView[pv].includes('^')) {
                      pView2 += this.ReplaceParameter(pView[pv], true) + ','
                    }
                    else if (pView[pv].includes('{') && pView[pv].includes('}')) {
                      var pN = pView[pv].trim().match(new RegExp(/\{(.*)\}/))[1]
                      var idxPN = this.response.map(x => x.ParamName).indexOf(pN)
                      if (this.models[pN] && this.models[pN] != '') {
                        pView2 += "'" + this.models[pN] + "',"
                      }
                      else {
                        if (this.response[idxPN].DefaultValue && this.response[idxPN].DefaultValue != '') {
                          pView2 += "'" + this.ReplaceParameter(this.response[idxPN].DefaultValue, false) + "',"
                        }
                        else {
                          pView2 += "'',"
                        }
                      }
                    }
                  }
                  this.response[a].ParamViewLookUp2 = pView2.slice(0,-1)
                }
              }
              else if (this.response[a].ColumnType == 'DateRange') {
                if (this.response[a].isColumn === 'True') {
                  var par = this.response[a].ParamName.split(',')
                  this.models[par[0].trim()] = ''
                  this.models[par[1].trim()] = ''
                }
              }
              else if (this.response[a].ColumnType == 'Dropdown') {
                this.models[this.response[a].ParamName.trim()] = this.ReplaceParameter(this.response[a].DefaultValue, false)
              }
              else if (this.response[a].ColumnType == 'CheckBox') {
                this.models[this.response[a].ParamName.trim()] = []
              }
              else {
                this.models[this.response[a].ParamName.trim()] = this.ReplaceParameter(this.response[a].DefaultValue, false)
              }
            }
        })
    },
    toArray(string) {
      var x = []
      var arrString = string.split(',')
      if (arrString.length > 0) {
        var str = ""
        for (let a = 0; a < arrString.length; a ++) {
          if (arrString[a].includes('{')) {
            str = arrString[a]
          }
          else if (arrString[a].includes('}')) {
            str += ',' + arrString[a]
            
            x.push(JSON.parse(str))
          }
          else {
            str += ',' + arrString[a]
          }
        }
      }

      return x
    },
    GetPageInfo(){
      var param = {
        Oid: this.getOptionSeq().OptionSeq,
        UserId: this.getDataUser().user_id,
        SubPortfolioCd: this.getDataUser().subportfolio_cd,
      }

      this.postEncode(this.getPageInfoByOption(), param).then(response => {
        if (response == null) return

          var data = response.Data[0]
          this.TitleHeader = data.ModuleName + ' | ' + data.TextMenu
      })
    },
    ReplaceParameter(string, isParam = false) {
      if (string && string != '') {
        if (isParam) {
          string = string.replace(/\^PortfolioCd\^/g, "'" + this.getDataUser().portfolio_cd + "'")
          string = string.replace(/\^PortfolioName\^/g, "'" + this.getDataUser().PortfolioName + "'")
          string = string.replace(/\^SubPortfolioCd\^/g, "'" + this.getDataUser().subportfolio_cd + "'")
          // string = string.replace(/\^SubPortfolioName\^/g, "'" + this.getDataUser().SubPortfolioName + "'")
          string = string.replace(/\^Name\^/g, "'" + this.getDataUser().SubPortfolioName + "'")
          string = string.replace(/\^UserId\^/g, "'" + this.getDataUser().user_id + "'")
          string = string.replace(/\^Username\^/g, "'" + this.getDataUser().user_name + "'")
          string = string.replace(/\^Address1\^/g, "'" + this.getDataUser().Address1 + "'")
          string = string.replace(/\^Address2\^/g, "'" + this.getDataUser().Address2 + "'")
          string = string.replace(/\^Address3\^/g, "'" + this.getDataUser().Address3 + "'")
          string = string.replace(/\^Address4\^/g, "'" + this.getDataUser().Address4 + "'")
          string = string.replace(/\^ZipCode\^/g, "'" + this.getDataUser().ZipCode + "'")
          string = string.replace(/\^PhoneNo\^/g, "'" + this.getDataUser().PhoneNo + "'")
          string = string.replace(/\^FaxNo\^/g, "'" + this.getDataUser().FaxNo + "'")
          string = string.replace(/\^Year\^/g, "'" + parseInt(this.momentDateFormatting(new Date(), 'YYYY')).toString() + "'")
          string = string.replace(/\^Day\^/g, "'" + parseInt(this.momentDateFormatting(new Date(), 'DD')).toString() + "'")
          string = string.replace(/\^Month\^/g, "'" + parseInt(this.momentDateFormatting(new Date(), 'MM')).toString() + "'")
          string = string.replace(/\^Today\^/g, "'" + this.momentDateFormatting(new Date(), 'YYYY-MM-DD') + "'")
        }
        else {
          string = string.replace(/\^PortfolioCd\^/g, this.getDataUser().portfolio_cd)
          string = string.replace(/\^PortfolioName\^/g, this.getDataUser().PortfolioName)
          string = string.replace(/\^SubPortfolioCd\^/g, this.getDataUser().subportfolio_cd)
          // string = string.replace(/\^SubPortfolioName\^/g, this.getDataUser().SubPortfolioName)
          string = string.replace(/\^Name\^/g, this.getDataUser().SubPortfolioName)
          string = string.replace(/\^UserId\^/g, this.getDataUser().user_id)
          string = string.replace(/\^Username\^/g, this.getDataUser().user_name)
          string = string.replace(/\^Address1\^/g, this.getDataUser().Address1)
          string = string.replace(/\^Address2\^/g, this.getDataUser().Address2)
          string = string.replace(/\^Address3\^/g, this.getDataUser().Address3)
          string = string.replace(/\^Address4\^/g, this.getDataUser().Address4)
          string = string.replace(/\^ZipCode\^/g, this.getDataUser().ZipCode)
          string = string.replace(/\^PhoneNo\^/g, this.getDataUser().PhoneNo)
          string = string.replace(/\^FaxNo\^/g, this.getDataUser().FaxNo)
          string = string.replace(/\^Year\^/g, parseInt(this.momentDateFormatting(new Date(), 'YYYY')).toString())
          string = string.replace(/\^Day\^/g, parseInt(this.momentDateFormatting(new Date(), 'DD')).toString())
          string = string.replace(/\^Month\^/g, parseInt(this.momentDateFormatting(new Date(), 'MM')).toString())
          string = string.replace(/\^Today\^/g, this.momentDateFormatting(new Date(), 'YYYY-MM-DD'))
        }
      }
      else {
        string = ''
      }

      return string
    },
    M_CheckParamView() {
      for (let a = 0; a < this.response.length ; a++) {
        if (this.response[a].ColumnType == 'LookUp') {
          if (this.response[a].ParamViewLookUp && this.response[a].ParamViewLookUp != '') {
            var pView = this.response[a].ParamViewLookUp.trim().split(',')
            var pView2 = ""
            for (let pv = 0; pv < pView.length; pv ++) {
              if (pView[pv].includes('^')) {
                pView2 += this.ReplaceParameter(pView[pv], true) + ','
              }
              else if (pView[pv].includes('{') && pView[pv].includes('}')) {
                var pN = pView[pv].trim().match(new RegExp(/\{(.*)\}/))[1]
                var idxPN = this.response.map(x => x.ParamName).indexOf(pN)
                if (this.models[pN] && this.models[pN] != '') {
                  pView2 += "'" + this.models[pN] + "',"
                }
                else {
                  if (this.response[idxPN].DefaultValue && this.response[idxPN].DefaultValue != '') {
                    pView2 += "'" + this.ReplaceParameter(this.response[idxPN].DefaultValue, false) + "',"
                  }
                  else {
                    pView2 += "'',"
                  }
                }
              }
            }
            this.response[a].ParamViewLookUp2 = pView2.slice(0,-1)
          }
        }
      }
    },
    GetParameter(string) {
      if (string.toUpperCase() == '^PORTFOLIOCD^') {
        return this.getDataUser().portfolio_cd
      }
      else if (string.toUpperCase() == '^PORTFOLIONAME^') {
        return this.getDataUser().PortfolioName
      }
      else if (string.toUpperCase() == '^SUBPORTFOLIOCD^') {
        return this.getDataUser().subportfolio_cd
      }
      else if (string.toUpperCase() == '^NAME^') {
        return this.getDataUser().SubPortfolioName
      }
      else if (string.toUpperCase() == '^USERID^') {
        return this.getDataUser().user_id
      }
      else if (string.toUpperCase() == '^USERNAME^') {
        return this.getDataUser().user_name
      }
      else if (string.toUpperCase() == '^ADDRESS1^') {
        return this.getDataUser().Address1
      }
      else if (string.toUpperCase() == '^ADDRESS2^') {
        return this.getDataUser().Address2
      }
      else if (string.toUpperCase() == '^ADDRESS3^') {
        return this.getDataUser().Address3
      }
      else if (string.toUpperCase() == '^ADDRESS4^') {
        return this.getDataUser().Address4
      }
      else if (string.toUpperCase() == '^ZIPCODE^') {
        return this.getDataUser().ZipCode
      }
      else if (string.toUpperCase() == '^PHONENO^') {
        return this.getDataUser().PhoneNo
      }
      else if (string.toUpperCase() == '^FAXNO^') {
        return this.getDataUser().FaxNo
      }
      else {
        return string
      }
    },
    fnLoadData(){
      this.dataUrl = this.getUrlReportBlankPage()
          // var obj = this.toArray('{ "label": "Invoice No", "id": "A.DebitNo" },{ "label": "Application No", "id": "A.ApplicationNo" }')
          // console.log(obj)
          this.loadData()
          this.GetPageInfo()
    }
  },
  beforeCreate: function () {
    this.PageLevel = 1
    this.TabIndex = 1
  },
  created: function() {
    // console.log('aaa',this.getUrlReportBlankPage())
   this.fnLoadData()
  },
  beforeMount: function() {
  },
  mounted: function() {
    
    this.hideSideBarMenu()
    // this.doGetHtml()

    this.$store.commit('setStatus', 'new')
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
  .button {
    width: 200px !important;
  }

  #ReportViewer1 .ToolBarButtonsCell{
    position: fixed !important;
    width: 100% !important;
  }

</style>
