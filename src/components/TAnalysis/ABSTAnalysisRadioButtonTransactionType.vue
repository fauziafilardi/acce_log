<template>
  <div>
      <br>
      <br>
      <b-row v-for="(data, index) in response" :key="index">
        <b-col md="6">
          <ABSinputRadioButtonVuex
              @input="OnRadioButtonChange"
              :prop="{
                cValidate :'', 
                cName: index, 
                cId: index, 
                cRadioOptions: [{ text: 'Yes', value: 'Y' }, { text: 'No', value: 'N' }, { text:'Transaction Type', value: 'T' }], 
                cRadioDefaultOption: '',
                cLabel:data.Descs,
                cLabelSize: 4, 
                cOrder: 0, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: prop.cPageLevel, 
                cTabIndex: prop.cTabIndex,
                cParentForm: 'FormScope_' + prop.cPageLevel + '_' + prop.cTabIndex,
                cKey: false
              }"
              v-model="data.value"
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
      // cPageMasterSeq: String,
      // cFormPageNo: String,
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
    }
  },
  data () {
    return {
      response: null,
      dataToFront: {}
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
  },
  methods : {
    OnRadioButtonChange () {
      for (var j = 0; j < this.response.length; j++) {
        var resp = this.response[j].value

        var data = this.response[j].TrxAnalysisCategory + 'status'
        this.dataToFront[data] = resp
      }
      this.$emit('input', this.dataToFront)
      // this.$forceUpdate()
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
          this.response[j].value = 'T'

          var data = this.response[j].TrxAnalysisCategory + 'status'
          this.dataToFront[data] = 'T'
        }
        // alert(JSON.stringify(this.dataToFront))
        this.$emit('input', this.dataToFront)
      })
    }
  },
  mounted: function() {
    this.getData()
  }
}
</script>

