<template>
  <div>
      <br>
      <br>
      <span v-for="(data, index) in response" :key="index">
        <b-row v-if="data.Code=='T1'" v-show="!prop.cDaily">
          <b-col md="6">
            <ABSinputRadioButtonVuex
              @input="OnRadioButtonChange"
              :prop="{
                cValidate :'', 
                cName: 'rdbSelectionType', 
                cId: 'rdbSelectionType', 
                cRadioOptions: [{ text: 'Range', value: 'R' }, { text: 'Choose', value: 'C' }], 
                cRadioDefaultOption: '',
                cLabel:'SubPortfolio Selection Type', 
                cLabelSize: 4, 
                cOrder: 0, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: prop.cPageLevel, 
                cTabIndex: prop.cTabIndex,
                cParentForm: 'FormScope_' + prop.cPageLevel + '_' + prop.cTabIndex,
                cKey: false
              }"
              v-model="selectionType" 
              ref="ref_journaltype"
            />
          </b-col>
        </b-row>
        <!-- khusus T1 -->
        <b-row v-if="data.Code =='T1'" v-show="isVisibleRangeOrChoose">
          <!-- from -->
          <b-col md="6">
            <ABSInputSelectList              
              @changeFrom="OnCodeChangeFrom"
              :prop="{ 
                      dataLookUp: { 
                        LookUpCd: data.data.dataLookUpFrom.LookUpCd,
                        ColumnDB: data.data.dataLookUpFrom.ColumnDB,
                        InitialWhere: data.data.dataLookUpFrom.InitialWhere,
                        ParamWhere: ''
                      },
                      cValidate: '',
                      cName: data.label + 'From',
                      cLabel: data.label,
                      cKey: false,
                      cOrder: 100 + index,
                      cLabelSize: 4,
                      cPageLevel: prop.cPageLevel,
                      cTabIndex: prop.cTabIndex,
                      cParentForm: 'FormScope_' + prop.cPageLevel + '_' + prop.cTabIndex,
                      cMasterUrl: undefined,
                      cDisplayColumn: 'TrxAnalysisCd,TrxAnalysisDescs',
                      cProtect: false,
                      cVisible: true
                    }"
              value=""
              :label="((data.TValueFrom == null || data.TValueFrom == '') && (data.TValueDescsFrom == null || data.TValueDescsFrom == ''))
                      ? '' : data.TValueFrom + ' | ' + data.TValueDescsFrom"
              :isTAnalysis="true"
              :urlApi="getUrlLookupList()"
              TrxAnalysisCategory=""
              :index="index"
            />
          </b-col>
          
          <!-- to -->
          <b-col md="6">
            <ABSInputSelectList
              @changeTo="OnCodeChangeTo"
              :prop="{ 
                      dataLookUp: { 
                        LookUpCd: data.data.dataLookUpTo.LookUpCd,
                        ColumnDB: data.data.dataLookUpTo.ColumnDB,
                        InitialWhere: data.data.dataLookUpTo.InitialWhere,
                        ParamWhere: ''
                      },
                      cValidate: '',
                      cName: data.label + 'To',
                      cLabel:'To',
                      cKey: false,
                      cOrder: 100 + index,
                      cLabelSize: 4,
                      cPageLevel: prop.cPageLevel,
                      cTabIndex: prop.cTabIndex,
                      cParentForm: 'FormScope_' + prop.cPageLevel + '_' + prop.cTabIndex,
                      cMasterUrl: undefined,
                      cDisplayColumn: 'TrxAnalysisCd,TrxAnalysisDescs',
                      cProtect: false,
                      cVisible: true
                    }"
              value=""
              :label="((data.TValueTo == null || data.TValueTo == '') && (data.TValueDescsTo == null || data.TValueDescsTo == ''))
                      ? '' : data.TValueTo + ' | ' + data.TValueDescsTo"
              :isTAnalysis="true"
              :urlApi="getUrlLookupList()"
              TrxAnalysisCategory=""
              :index="index"
            />
          </b-col>

        </b-row>
        <!-- selain T1 -->
        <b-row v-if="data.Code !='T1'">
          <!-- from -->
          <b-col md="6">
            <ABSInputSelectList              
              @changeFrom="OnCodeChangeFrom"
              :prop="{ 
                      dataLookUp: { 
                        LookUpCd: data.data.dataLookUpFrom.LookUpCd,
                        ColumnDB: data.data.dataLookUpFrom.ColumnDB,
                        InitialWhere: data.data.dataLookUpFrom.InitialWhere,
                        ParamWhere: ''
                      },
                      cValidate: '',
                      cName: data.label + 'From',
                      cLabel: data.label,
                      cKey: false,
                      cOrder: 100 + index,
                      cLabelSize: 4,
                      cPageLevel: prop.cPageLevel,
                      cTabIndex: prop.cTabIndex,
                      cParentForm: 'FormScope_' + prop.cPageLevel + '_' + prop.cTabIndex,
                      cMasterUrl: undefined,
                      cDisplayColumn: 'TrxAnalysisCd,TrxAnalysisDescs',
                      cProtect: false,
                      cVisible: true
                    }"
              value=""
              :label="((data.TValueFrom == null || data.TValueFrom == '') && (data.TValueDescsFrom == null || data.TValueDescsFrom == ''))
                      ? '' : data.TValueFrom + ' | ' + data.TValueDescsFrom"
              :isTAnalysis="true"
              :urlApi="getUrlLookupList()"
              TrxAnalysisCategory=""
              :index="index"
            />
          </b-col>
          
          <!-- to -->
          <b-col md="6">
            <ABSInputSelectList
              @changeTo="OnCodeChangeTo"
              :prop="{ 
                      dataLookUp: { 
                        LookUpCd: data.data.dataLookUpTo.LookUpCd,
                        ColumnDB: data.data.dataLookUpTo.ColumnDB,
                        InitialWhere: data.data.dataLookUpTo.InitialWhere,
                        ParamWhere: ''
                      },
                      cValidate: '',
                      cName: data.label + 'To',
                      cLabel:'To',
                      cKey: false,
                      cOrder: 100 + index,
                      cLabelSize: 4,
                      cPageLevel: prop.cPageLevel,
                      cTabIndex: prop.cTabIndex,
                      cParentForm: 'FormScope_' + prop.cPageLevel + '_' + prop.cTabIndex,
                      cMasterUrl: undefined,
                      cDisplayColumn: 'TrxAnalysisCd,TrxAnalysisDescs',
                      cProtect: false,
                      cVisible: true
                    }"
              value=""
              :label="((data.TValueTo == null || data.TValueTo == '') && (data.TValueDescsTo == null || data.TValueDescsTo == ''))
                      ? '' : data.TValueTo + ' | ' + data.TValueDescsTo"
              :isTAnalysis="true"
              :urlApi="getUrlLookupList()"
              TrxAnalysisCategory=""
              :index="index"
            />
          </b-col>

        </b-row>
        <b-row>
          <!-- Sub Category -->
          <b-col md="6" v-if="data.data.dataLookUpSub != undefined">
            <ABSInputSelectList
              @changeTo="OnCodeChangeSubCategory"
              :prop="{ 
                      dataLookUp: {
                        LookUpCd: data.data.dataLookUpSub.LookUpCd,
                        ColumnDB: data.data.dataLookUpSub.ColumnDB,
                        InitialWhere: data.data.dataLookUpSub.InitialWhere,
                        ParamWhere: ''
                      },
                      cValidate: '',
                      cName: data.label + 'SubCategory',
                      cLabel:'Sub Category',
                      cKey: false,
                      cOrder: 100 + index,
                      cLabelSize: 4,
                      cPageLevel: prop.cPageLevel,
                      cTabIndex: prop.cTabIndex,
                      cParentForm: 'FormScope_' + prop.cPageLevel + '_' + prop.cTabIndex,
                      cMasterUrl: undefined,
                      cDisplayColumn: 'TrxAnalysisSubCategory,Descs',
                      cProtect: false,
                      cVisible: true
                    }"
              value=""
              :label="((data.TValueSubCategory == null || data.TValueSubCategory == '') && (data.TValueDescsSubCategory == null || data.TValueDescsSubCategory == ''))
                      ? '' : data.TValueSubCategory + ' | ' + data.TValueDescsSubCategory"
              :isTAnalysis="true"
              :urlApi="getUrlLookupList()"
              TrxAnalysisCategory=""
              :index="index"
            />
          </b-col>
        </b-row>

        <b-row v-if="data.Code=='T1'" v-show="!isVisibleRangeOrChoose">
          <b-col md="6">
            <ABSInputSelect2
              @change="OnPredefinedChange"
              @clear="onClear"
              :prop="{
                dataLookUp: null, 
                cValidate :'', 
                cName: 'selectPredefinedSubportfolioGroup', 
                cLabel: 'Choose Predefined SubPortfolio Group ', 
                cLabelSize: 4, 
                cOrder: 24, 
                cKey: false, 
                cTriggered: false, 
                cDefault: 'S', 
                cProtect: false, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: prop.cPageLevel, 
                cTabIndex: prop.cTabIndex, 
                cParentForm: 'FormScope_' + prop.cPageLevel + '_' + prop.cTabIndex, 
                cStatic: true,
                cOption: data.data.Predefined,
                cMasterUrl: undefined,
                cDisplayColumn: ''
              }"
              :value="predefinedSubportfolioGroup"
            />
          </b-col>
        </b-row>

        <br v-if="data.Code=='T1'" v-show="!isVisibleRangeOrChoose" />
        <b-row v-if="data.Code=='T1'" v-show="!isVisibleRangeOrChoose">
          <b-col md="12" offset="1">
            <ABSinputCheckBoxList
              :prop="{
                cValidate :'', 
                  cName: 'chkboxChoose', 
                  cLabel: 'Choose', 
                  cLabelSize: 4,
                  cOptions: data.data.dataCheckbox, 
                  cOrder: 0, 
                  cKey: false, 
                  cVisible: true, 
                  cProtect: false,
                  cPageLevel: prop.cPageLevel, 
                  cTabIndex: prop.cTabIndex, 
                  cParentForm: 'FormScope_' + prop.cPageLevel + '_' + prop.cTabIndex,
                  cDataShowInRow: 2
              }"
              v-model="choose"
              ref="chkList" />
          </b-col>
        </b-row>
      </span>
     <!-- </b-col>
  </b-row> -->
  </div>
</template>

<script>
export default {
  props: {
    prop: {
      cPageLevel: String,
      cTabIndex: String,
      // cPageMasterSeq: String,
      // cFormPageNo: String,
      cAnalysisType: String,
      cDaily: Boolean
    }
  },
  watch: {
    choose(newData, oldData) {
      for (var x = 0; x < this.response.length; x++) {
        if (this.response[x].Code == 'T1') {
          this.dataToFront[x].T1Choose = newData
          this.$emit('input', this.dataToFront)
        }
      }
    }
  },
  computed : {
    inputStatus() {
      if (this.$store.getters.getLevel == this.prop.cPageLevel && this.$store.getters.getTab == this.prop.cTabIndex) {
        return this.$store.getters.getStatus
      }
      else {
        return 'view'
      }
    },
    getFormatCode () {
      return this.$store.getters.getFormatCode
    },
  },
  data () {
    return {
      response: null,
      selectionType: 'R',
      predefinedSubportfolioGroup: null,
      choose: [],
      dataToFront: [],
      isVisibleRangeOrChoose: true // true=>range false=>choose
    }
  },
  methods : {
    OnRadioButtonChange (data) {
      this.isVisibleRangeOrChoose = !this.isVisibleRangeOrChoose
    },
    OnPredefinedChange (data) {
      this.$refs.chkList[0].$data.dataChkBox = data.id.split(',')

      for (var x = 0; x < this.response.length; x++) {
        if (this.dataToFront[x].Code == 'T1') {
          this.dataToFront[x].T1Choose = data.id.split(',')
        }
      }
      this.$emit('input', this.dataToFront)
      this.$forceUpdate()
    },
    OnCodeChangeFrom (data) {
      var code = this.dataToFront[data._index].Code + 'From'
      this.dataToFront[data._index][code] = data.id

      var codeTo = this.dataToFront[data._index].Code + 'To'
      this.dataToFront[data._index][codeTo] = data.id

      this.response[data._index].TValueFrom = data.id
      this.response[data._index].TValueDescsFrom = data.Descs
      
      this.response[data._index].TValueTo = data.id
      this.response[data._index].TValueDescsTo = data.Descs

      this.$emit('input', this.dataToFront)
      this.$forceUpdate()
    },
    OnCodeChangeTo (data) {
      var code = this.dataToFront[data._index].Code + 'To'
      this.dataToFront[data._index][code] = data.id
      this.response[data._index].TValueTo = data.id
      this.response[data._index].TValueDescsTo = data.Descs
      this.$emit('input', this.dataToFront)
      this.$forceUpdate()
    },
    OnCodeChangeSubCategory (data) {
      var code = this.dataToFront[data._index].Code + 'Sub'
      this.dataToFront[data._index][code] = data.id
      this.response[data._index].TValueSubCategory = data.id
      this.response[data._index].TValueDescsSubCategory = data.Descs
      this.$emit('input', this.dataToFront)
      this.$forceUpdate()
    },
    getData (formatCode) {
      var param = {
        FormatCode: formatCode
      }
      this.postEncode(this.getUrlTFilterExecutor(), param)
      .then((response) => {
        if(response == null) return

        this.response = response.Data

        for (var x = 0; x < this.response.length; x++) {
          var from = this.response[x].Code + 'From'
          var to = this.response[x].Code + 'To'
          var sub = this.response[x].Code + 'Sub'
          var choose = this.response[x].Code + 'Choose'

          this.dataToFront.push({
            Code: this.response[x].Code,
            [from]: '',
            [to]: '',
            [sub]: '',
            [choose]: ''
          })
        }
        this.isVisibleRangeOrChoose = true
        this.selectionType = 'R'
        this.$emit('input', this.dataToFront)
      })
    },
    onClear () {
      // belum di coding
      // this.selected = {id:"", label:""}
      // this.$emit('change', {id:"", label:""})
    }
  }
}
</script>

