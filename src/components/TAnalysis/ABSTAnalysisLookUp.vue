<template>
  <div>
      <br>
      <br>
      <b-row v-for="(data, index) in response" :key="index">
        <b-col md="6">
          <ABSInputSelectList
                @change="OnSelectListChange"
                :prop="{
                    dataLookUp: { 
                        LookUpCd: lookupcd,
                        ColumnDB: columndb,
                        InitialWhere: initwherecolumn + ' = \'' + data[initwherecolumn] + '\'',
                        ParamWhere: '',
                        SourceField: columndb + ',Descs,TimeEdit',
                        DisplayLookUp: columndb + ',Descs,TimeEdit'
                    }, 
                    cValidate :'',
                    cName: data[initwherecolumn] + '_' + index,
                    cLabel: data.Descs,
                    cKey: false,
                    cLabelSize: 4,
                    cOrder: 0,
                    cTriggered: false,
                    cDefault: '',
                    cProtect: false,
                    cVisible:  true,
                    cAsync:  false,
                    cFilter: false,
                    cPageLevel: prop.cPageLevel,
                    cTabIndex: prop.cTabIndex,
                    cParentForm: 'FormScope_' + prop.cPageLevel + '_' + prop.cTabIndex,
                    cStatic: false,
                    cOption: [],
                    cMasterUrl: masterurl,
                    cDisplayColumn: columndb+',Descs'
                }"
                :value="dataToFront[data[initwherecolumn]]"
                :label="dataToFront[data[initwherecolumn] + 'label']"
                @input="OnInput"
                :isTAnalysis="true"
                :urlApi="getUrlLookupList()"
                :TrxAnalysisCategory="data[initwherecolumn]"
                :index="index"
            />
        </b-col>
        
        <b-col md="6">
        </b-col>
      </b-row>
  </div>
</template>

<script>
export default {
  props: {
    prop: {
      cPageLevel: String,
      cTabIndex: String,
      cAnalysisType: String
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
      else if (this.prop.cAnalysisType == 'Trx Analysis SubPortfolio') {
        return 'GetLookupGLTransactionAnalysisBySubportfolio'
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
      else if (this.prop.cAnalysisType == 'Trx Analysis SubPortfolio') {
        return 'TrxAnalysisCd'
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
      else if (this.prop.cAnalysisType == 'Trx Analysis SubPortfolio') {
        return 'TrxAnalysisCategory'
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
      else if (this.prop.cAnalysisType == 'Trx Analysis SubPortfolio') {
        return '/GL/GL_AccountAnalysis'
      }
    }
  },
  data () {
    return {
      response: null,
      dataToFront: {}
    }
  },
  watch: {
        // dataToFront(newData, oldData) {
        //     console.log(newData)
        //     this.$emit("input", newData)
        // }
    // inputStatus (newData, oldData) {
    //   if (newData.toLowerCase() == 'new') {
    //     if (this.$store.getters.getLevel == this.prop.cPageLevel && this.$store.getters.getTab == this.prop.cTabIndex) {
    //       this.tAdd()
    //     }
    //   }
    // },
  },
  methods : {
      OnInput() {
        //   console.log(this.dataToFront)
          this.$forceUpdate()
          this.$emit('input', this.dataToFront)
      },
      resetData () {
        for (var j = 0; j < this.response.length; j++) {
        //   this.response[j].value = ''
        //   this.response[j].label = ''

          var data = this.response[j][this.initwherecolumn]
          this.dataToFront[data] = ''
          this.dataToFront[data + 'label'] = ''
        }
        // alert(JSON.stringify(this.dataToFront))
        this.$forceUpdate()
        this.$emit('input', this.dataToFront)
      },
    OnRadioButtonChange () {
      for (var j = 0; j < this.response.length; j++) {
        var resp = this.response[j].value

        var data = this.response[j][this.initwherecolumn] + 'status'
        this.dataToFront[data] = resp
      }
      this.$emit('input', this.dataToFront)
      // this.$forceUpdate()
    },
    OnSelectListChange(data) {
        // console.log(data)
        var idx = data._index
        var slot = this.response[idx][this.initwherecolumn]

        this.dataToFront[slot] = data.id
        this.dataToFront[slot + 'label'] = data.label

        this.$forceUpdate()
        this.$emit('input', this.dataToFront)
    },
    getData () {
      var param = {
      }
      this.postEncode(this.getUrlAnalysisGL_TransactionType(), param).then(response => {
        // response from API
        if (response == null) return
        // this.response = response.Data
        this.response = response.Data

        for (var j = 0; j < this.response.length; j++) {
        //   this.response[j].value = ''
        //   this.response[j].label = ''

          var data = this.response[j][this.initwherecolumn]
          this.dataToFront[data] = ''
          this.dataToFront[data + 'label'] = ''
        }
        // alert(JSON.stringify(this.dataToFront))
        this.$forceUpdate()
        this.$emit('input', this.dataToFront)
      })
    }
  },
  mounted: function() {
    // this.getData()
    console.log(this.prop.cAnalysisType)
  },
  created: function() {
      this.getData()
  }
}
</script>

