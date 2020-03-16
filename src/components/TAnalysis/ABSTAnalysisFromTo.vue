<template>
  <!-- <div style="margin-left:10px;"> -->
  <div>
  <!-- <b-row>
    <b-col  md="6"> -->
      <!-- <div class="div-collapse">
        <span class="master-span-form">
          Transaction Analysis
        </span>
        {{inputStatus}} ___ {{getRowClickCount}}
      </div> -->
      <br>
      <br>
        <!-- <b-row v-show="prop.cVisible">
          <b-col md="4" class="lbl-col-align">
          </b-col>
        </b-row> -->
      <b-row v-for="(data, index) in response" :key="index">
        <!-- {{data.TStatus}}
        {{data.TrxAnalysisCategory}} -->
        
        <!-- from -->
        <b-col md="6">
          <ABSInputSelectList
            @changeFrom="OnCodeChangeFrom"
            :prop="{ 
                    dataLookUp: { 
                      LookUpCd: lookupcd,
                      ColumnDB: columndb,
                      InitialWhere: initwherecolumn + ' = \'' + data[initwherecolumn] + '\'',
                      ParamWhere: '',
                      SourceField: columndb + ',Descs,TimeEdit',
                      DisplayLookUp: columndb + ',Descs'
                    },
                    cValidate: '',
                    cName: data[initwherecolumn] + 'From',
                    cLabel: data.Descs + ' From',
                    cKey: false,
                    cOrder: 100 + index,
                    cLabelSize: 4,
                    cPageLevel: prop.cPageLevel,
                    cTabIndex: prop.cTabIndex,
                    cParentForm: 'FormScope_' + prop.cPageLevel + '_' + prop.cTabIndex,
                    cMasterUrl: masterurl,
                    cDisplayColumn: columndb + ',Descs',
                    cProtect: false,
                    cVisible: true
                  }"
            value=""
            :label="((data.TValueFrom == null || data.TValueFrom == '') && (data.TValueDescsFrom == null || data.TValueDescsFrom == ''))
                    ? '' : data.TValueFrom + ' | ' + data.TValueDescsFrom"
            :isTAnalysis="true"
            :urlApi="getUrlLookupList()"
            :TrxAnalysisCategory="data[initwherecolumn]"
            :index="index"
          />
          <!-- :label="((response[index].TValue == null || response[index].TValue == '') && (response[index].TValueDescs == null || response[index].TValueDescs == ''))
                    ? '' : response[index].TValue + ' | ' + response[index].TValueDescs" -->
          <!-- :label="((data.TValue == null || data.TValue == '') && (data.TValueDescs == null || data.TValueDescs == ''))
                    ? '' : data.TValue + ' | ' + data.TValueDescs" -->
        </b-col>
        
        <!-- to -->
        <b-col md="6">
          <ABSInputSelectList
            @changeTo="OnCodeChangeTo"
            :prop="{ 
                    dataLookUp: { 
                      LookUpCd: lookupcd,
                      ColumnDB: columndb,
                      InitialWhere: initwherecolumn + ' = \'' + data[initwherecolumn] + '\'',
                      ParamWhere: '',
                      SourceField: columndb + ',Descs,TimeEdit',
                      DisplayLookUp: columndb + ',Descs'
                    },
                    cValidate: '',
                    cName: data[initwherecolumn] + 'To',
                    cLabel:'To',
                    cKey: false,
                    cOrder: 100 + index,
                    cLabelSize: 4,
                    cPageLevel: prop.cPageLevel,
                    cTabIndex: prop.cTabIndex,
                    cParentForm: 'FormScope_' + prop.cPageLevel + '_' + prop.cTabIndex,
                    cMasterUrl: masterurl,
                    cDisplayColumn: columndb + ',Descs',
                    cProtect: false,
                    cVisible: true
                  }"
            value=""
            :label="((data.TValueTo == null || data.TValueTo == '') && (data.TValueDescsTo == null || data.TValueDescsTo == ''))
                    ? '' : data.TValueTo + ' | ' + data.TValueDescsTo"
            :isTAnalysis="true"
            :urlApi="getUrlLookupList()"
            :TrxAnalysisCategory="data[initwherecolumn]"
            :index="index"
          />
        </b-col>
      </b-row>
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
      isManual: Boolean,
      optionData: Array
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
    // getRowClickCount () {
    //   return this.$store.getters.getRowClickCount
    // },
    // response: {
    //   get () {
    //     return this.$store.getters.getDataT
    //   },
    //   set (value) {
    //     this.$store.commit('setDataT', value)
    //   }
    // },
    lookupcd() {
      if (this.prop.cAnalysisType == 'Account Analysis') {
        return 'GetLookupGLAccountAnalysis'
      }
      else if (this.prop.cAnalysisType == 'Analysis Category' || this.prop.cAnalysisType == 'Analysis Category All') {
        return 'GetLookupGLTransactionAnalysis'
      }
      else if (this.prop.cAnalysisType == 'Stock Analysis') {
        return 'GetLookupICStockAnalysisCode'
      }
      else if (this.prop.cAnalysisType == 'Debtor Analysis') {
        return 'GetLookupARDebtorAnalysisCode'
      }
      else if (this.prop.cAnalysisType == 'Creditor Analysis') {
        return ''
      }
      else if (this.prop.cAnalysisType == 'Item Analysis') {
        return 'GetLookupPOItemAnalysisCode'
      }
      else if (this.prop.cAnalysisType == 'Supplier Analysis') {
        return 'GetLookupPOSupplierAnalysisCode'
      }
      else if (this.prop.cAnalysisType == 'Lot Analysis') {
        return 'GetLookupTNLotAnalysis'
      }
      else if (this.prop.cAnalysisType == 'Tag Analysis') {
        return 'GetLookupMMTagAnalysisCode'
      }
      else if (this.prop.cAnalysisType == 'Fixed Asset Analysis') {
        return 'GetLookupFAAnalysisCode'
      }
    },
    columndb() {
      if (this.prop.cAnalysisType == 'Account Analysis') {
        return 'AccountAnalysisCd'
      }
      else if (this.prop.cAnalysisType == 'Analysis Category' || this.prop.cAnalysisType == 'Analysis Category All') {
        return 'TrxAnalysisCd'
      }
      else if (this.prop.cAnalysisType == 'Stock Analysis') {
        return 'StockAnalysisCd'
      }
      else if (this.prop.cAnalysisType == 'Debtor Analysis') {
        return 'DebtorAnalysisCd'
      }
      else if (this.prop.cAnalysisType == 'Creditor Analysis') {
        return ''
      }
      else if (this.prop.cAnalysisType == 'Item Analysis') {
        return 'ItemAnalysisCd'
      }
      else if (this.prop.cAnalysisType == 'Supplier Analysis') {
        return 'SupplierAnalysisCd'
      }
      else if (this.prop.cAnalysisType == 'Lot Analysis') {
        return 'LotAnalysisCd'
      }
      else if (this.prop.cAnalysisType == 'Tag Analysis') {
        return 'TagAnalysisCd'
      }
      else if (this.prop.cAnalysisType == 'Fixed Asset Analysis') {
        return 'FixedAssetAnalysisCd'
      }
    },
    initwherecolumn() {
      if (this.prop.cAnalysisType == 'Account Analysis') {
        return 'AccountAnalysisCategory'
      }
      else if (this.prop.cAnalysisType == 'Analysis Category' || this.prop.cAnalysisType == 'Analysis Category All') {
        return 'TrxAnalysisCategory'
      }
      else if (this.prop.cAnalysisType == 'Stock Analysis') {
        return 'StockAnalysisCategory'
      }
      else if (this.prop.cAnalysisType == 'Debtor Analysis') {
        return 'DebtorAnalysisCategory'
      }
      else if (this.prop.cAnalysisType == 'Creditor Analysis') {
        return 'CreditorAnalysisCategory'
      }
      else if (this.prop.cAnalysisType == 'Item Analysis') {
        return 'ItemAnalysisCategory'
      }
      else if (this.prop.cAnalysisType == 'Supplier Analysis') {
        return 'SupplierAnalysisCategory'
      }
      else if (this.prop.cAnalysisType == 'Lot Analysis') {
        return 'LotAnalysisCategory'
      }
      else if (this.prop.cAnalysisType == 'Tag Analysis') {
        return 'TagAnalysisCategory'
      }
      else if (this.prop.cAnalysisType == 'Fixed Asset Analysis') {
        return 'FixedAssetAnalysisCategory'
      }
    },
    masterurl() {
      if (this.prop.cAnalysisType == 'Account Analysis') {
        return '/GL/GL_AccountAnalysis'
      }
      else if (this.prop.cAnalysisType == 'Analysis Category' || this.prop.cAnalysisType == 'Analysis Category All') {
        return '/GL/GL_AnalysisCategory'
      }
      else if (this.prop.cAnalysisType == 'Stock Analysis') {
        return '/IC/IC_StockAnalysis'
      }
      else if (this.prop.cAnalysisType == 'Debtor Analysis') {
        return '/AR/AR_DebtorAnalysis'
      }
      else if (this.prop.cAnalysisType == 'Creditor Analysis') {
        return ''
      }
      else if (this.prop.cAnalysisType == 'Item Analysis') {
        return '/PO/PO_ItemAnalysis'
      }
      else if (this.prop.cAnalysisType == 'Supplier Analysis') {
        return '/PO/PO_SupplierAnalysis'
      }
      else if (this.prop.cAnalysisType == 'Lot Analysis') {
        return '/TN/TN_LotAnalysis'
      }
      else if (this.prop.cAnalysisType == 'Tag Analysis') {
        return '/MM/MM_TagAnalysis'
      }
      else if (this.prop.cAnalysisType == 'Fixed Asset Analysis') {
        return '/FA/FA_Analysis'
      }
    }
  },
  data () {
    return {
      PI_Code: { 
        dataLookUp: { 
          LookUpCd: '',
          ColumnDB: '',
          InitialWhere: '',
          ParamWhere: ''
        },
        cValidate: '',
        cName: '',
        cLabel: '',
        cKey: false,
        cOrder: 1,
        cPageLevel: this.prop.cPageLevel,
        cTabIndex: this.prop.cTabIndex,
        cParentForm: 'FormScope_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex,
        cMasterUrl: '',
        cDisplayColumn: '',
        cProtect: false
      },
      // code: null,

      // id: null,
      // label: null,

      response: null
    }
  },
  watch: {
    // inputStatus (newData, oldData) {
    //   if (newData.toLowerCase() == 'new') {
    //     if (this.$store.getters.getLevel == this.prop.cPageLevel && this.$store.getters.getTab == this.prop.cTabIndex) {
    //       this.tAdd()
    //     }
    //   }
    // },
    // getRowClickCount (newData, oldData) {
    //   if (this.$store.getters.getLevel == this.prop.cPageLevel && this.$store.getters.getTab == this.prop.cTabIndex) {
    //     this.tEdit()
    //   }
    // }
  },
  methods : {
    OnCodeChangeFrom (data) {
      this.response[data._index].TValueFrom = data.id
      this.response[data._index].TValueDescsFrom = data.Descs
      
      this.response[data._index].TValueTo = data.id
      this.response[data._index].TValueDescsTo = data.Descs
      this.$emit('input', this.response)
      // this.$store.commit('setDataT', this.response)
      this.$forceUpdate()
    },
    OnCodeChangeTo (data) {
      this.response[data._index].TValueTo = data.id
      this.response[data._index].TValueDescsTo = data.Descs
      this.$emit('input', this.response)
      // this.$store.commit('setDataT', this.response)
      this.$forceUpdate()
    },
    getData () {
      if (this.prop.isManual == true) {
        this.response = this.prop.optionData
        this.$emit('input', this.response)
        this.$forceUpdate()
        // console.log('data', this.optionData)
        // console.log(this.response)
      }
      else {
        var param = {
          OptionSeq: this.getOptionSeq().OptionSeq,
          LineNo: 1,
          AnalysisType: this.prop.cAnalysisType,
          SubportfolioCd: this.getDataUser().subportfolio_cd
        }
        this.postEncode( this.getUrlTViewFromTo(), param )
        .then((response) => {
            if(response == null) return

            this.response = response.Data
            this.$emit('input', this.response)
            // this.$store.commit('setDataT', this.response)
        })
      }
    }
    // tAdd () {
    //   var param = {
    //     TSubPortfolioCd: this.getDataUser().subportfolio_cd,
    //     TPageMasterSeq: this.prop.cPageMasterSeq,
    //     TFormPageNo: this.prop.cFormPageNo
    //   }
    //   this.postEncode(this.getUrlTanalysisAdd(), param)
    //   .then((response) => {
    //       if(response == null) return

    //       this.response = response.Data
    //       this.$store.commit('setDataT', this.response)
    //   })
    // },
    // tEdit () {
    //   var param = {
    //     TSubPortfolioCd: this.getDataUser().subportfolio_cd,
    //     TPageMasterSeq: this.prop.cPageMasterSeq,
    //     TFormPageNo: this.prop.cFormPageNo,
    //     // CurrencyCd: 'TERG'
    //   }
      
    //   var keys = Object.keys(this.$store.getters.getParamGetDataBy)
    //   for (var j = 0; j < keys.length; j++) {

    //     if (keys[j] == 'OptionSeq' || keys[j] == 'LineNo') {
    //     } else {
    //       param[keys[j]] = this.$store.getters.getParamGetDataBy[keys[j]]
    //     }
    //   }
      
    //   this.postEncode(this.getUrlTanalysisEdit(), param)
    //   .then((response) => {
    //       if(response == null) return

    //       this.response = response.Data
    //       this.$store.commit('setDataT', this.response)
    //   })
    // }
  },
  mounted: function() {
    this.prop.isManual = this.prop.isManual ? this.prop.isManual : false
    this.getData()
  }
}
</script>

