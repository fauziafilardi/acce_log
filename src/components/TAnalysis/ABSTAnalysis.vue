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
        
        <!-- Y=>drop down -->
        <b-col md="6" v-if="data.TStatus=='Y'">
          <!-- <b-form-input
            validate="required|min:1|max:20"
            :class="{'input': true, 'error-text-field': errors.has('T_' + index)}"
            type="text"
            v-bind:name="'T_' + index"
            class="text-field-form"
            @input="handleInput"
          /> -->
          <!-- {{data.Descs}} -->

            <!-- :prop="PI_Code" -->
          <ABSInputSelectList
            @change="OnCodeChange"
            :prop="{ 
                    dataLookUp: {
                      LookUpCd: '',
                      ColumnDB: '',
                      InitialWhere: '',
                      ParamWhere: ''
                    },
                    cValidate: data.TMandatory == 'Y' ? 'required' : '',
                    cName: 'T_' + data.TrxAnalysisCategory,
                    cLabel: data.Descs,
                    cKey: false,
                    cLabelSize: 4,
                    cOrder: 100 + index,
                    cTriggered: false, 
                    cDefault: '',
                    cProtect: prop.cProtect,
                    cVisible: true,
                    cAsync: false,
                    cPageLevel: prop.cPageLevel,
                    cTabIndex: prop.cTabIndex,
                    cParentForm: 'FormScope_' + prop.cPageLevel + '_' + prop.cTabIndex,
                    cStatic: false,
                    cOption: [],

                    cMasterUrl: undefined,
                    cDisplayColumn: 'TrxAnalysisCd,Descs'
                  }"
            value=""
            :label="((data.TValue == null || data.TValue == '') && (data.TValueDescs == null || data.TValueDescs == ''))
                    ? '' : data.TValue + ' | ' + data.TValueDescs"

            :isTAnalysis="true"
            :urlApi="getUrlTanalysisLookup()"
            :TrxAnalysisCategory="data.TrxAnalysisCategory"
            :index="index"
          />
            <!-- :prop="PI_Code" -->
        </b-col>
        <!-- C=>visible tapi tipenya input text(text field) -->
        <b-col md="6" v-else-if="data.TStatus=='C'">
          <!-- <b-form-input
            type="text"
            v-bind:name="'T_' + index"
            class="text-field-form"
            :disabled="true"
          /> -->

          
                <!-- cName: data.TCode,
                cLabel: data.Descs, -->
          <ABSinputTextVuex :prop="
            { 
                cValidate: '',
                cName: data.TrxAnalysisCategory,
                cLabel: data.Descs,
                cOrder: 1,
                cLabelSize: 4,
                cProtect: true,
                cVisible: true,
                cPageLevel: prop.cPageLevel,
                cTabIndex: prop.cTabIndex,
                cParentForm: 'FormScope_' + prop.cPageLevel + '_' + prop.cTabIndex
            }"
            v-model="data.TValue"/>
        </b-col>
        <!-- M->nothing show -->
        <b-col md="6" v-else>
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
      cPageMasterSeq: String,
      cFormPageNo: String,
      cProtect: Boolean
    }
  },
  computed : {
    inputStatus() {
      if (this.$store.getters.getLevel == this.prop.cPageLevel && this.$store.getters.getTab == this.prop.cTabIndex) {
        if (this.$store.getters.getStatus == 'new') {
          this.tAdd()
        }
        return this.$store.getters.getStatus
      }
      else {
        return 'view'
      }
    },
    getRowClickCount () {
      return this.$store.getters.getRowClickCount
    },
    // response: {
    //   get () {
    //     return this.$store.getters.getDataT
    //   },
    //   set (value) {
    //     this.$store.commit('setDataT', value)
    //   }
    // }
  },
  data () {
    return {
      // PI_Code: {
      //   dataLookUp: { 
      //     LookUpCd: '',
      //     ColumnDB: '',
      //     InitialWhere: '',
      //     ParamWhere: ''
      //   },
      //   cValidate: '',
      //   cName: '',
      //   cLabel: '',
      //   cKey: false,
      //   cOrder: 1,
      //   cPageLevel: this.prop.cPageLevel,
      //   cTabIndex: this.prop.cTabIndex,
      //   cParentForm: 'FormScope_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex,
      //   cMasterUrl: '',
      //   cDisplayColumn: '',
      //   cProtect: false
      // },
      // code: null,

      // id: null,
      // label: null,

      response: null
    }
  },
  watch: {
    inputStatus (newData, oldData) {
      if (newData.toLowerCase() == 'new') {
        if (this.$store.getters.getLevel == this.prop.cPageLevel && this.$store.getters.getTab == this.prop.cTabIndex) {
          // this.tAdd()
        }
      }
    },
    getRowClickCount (newData, oldData) {
      if (this.$store.getters.getLevel == this.prop.cPageLevel && this.$store.getters.getTab == this.prop.cTabIndex) {
        // this.tEdit()
      }
    }
  },
  methods : {
    OnCodeChange (data) {
      this.response[data._index].TValue = data.id
      this.response[data._index].TValueDescs = data.Descs
      this.$store.commit('setDataT', this.response)
    },
    tAdd () {
      var param = {
        TSubPortfolioCd: this.getDataUser().subportfolio_cd,
        TPageMasterSeq: this.prop.cPageMasterSeq,
        TFormPageNo: this.prop.cFormPageNo
      }
      this.postEncode(this.getUrlTanalysisAdd(), param)
      .then((response) => {
          if(response == null) return

          this.response = response.Data
          this.$store.commit('setDataT', this.response)
      })
    },
    tEdit () {
      var param = {
        TSubPortfolioCd: this.getDataUser().subportfolio_cd,
        TPageMasterSeq: this.prop.cPageMasterSeq,
        TFormPageNo: this.prop.cFormPageNo,
        // CurrencyCd: 'TERG'
      }
      
      var keys = Object.keys(this.$store.getters.getParamGetDataBy)
      for (var j = 0; j < keys.length; j++) {

        if (keys[j] == 'OptionSeq' || keys[j] == 'LineNo') {
        } else {
          param[keys[j]] = this.$store.getters.getParamGetDataBy[keys[j]]
        }
      }
      
      this.postEncode(this.getUrlTanalysisEdit(), param)
      .then((response) => {
          if(response == null) {
            return
          }
          else {
            if (response.Data == null) {
              return
            }
            else {
              if (response.Data.length < 1) {
                return
              }
            }
          }

          this.response = response.Data
          this.$store.commit('setDataT', this.response)
      })
    }
  }
}
</script>

