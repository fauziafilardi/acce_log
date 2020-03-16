<template>
    <div>
        <div :style="'margin-top:10px;'" class="el" mousetip mousetip-msg="I'm a tooltip">
            <div class="div-collapse" v-b-toggle.collapse1>
                <span style="float:Left; color: #81b3e9 !important;letter-spacing: 1px;margin-top: 2px;margin-left: 3px" >
                    Unit Master Generator <font-awesome-icon icon="sort-down" class="icon-style-1__master" /> 
                </span>
            </div>
            <b-collapse id="collapse1" :visible="true">
                <b-row  style="padding-left: 10px; padding-bottom: 10px; !important;">              
                    <b-col md="12" id="col-left" class="bColMasterForm">
                        <b-form :data-vv-scope="'FormScope_' + PageLevel + '_' + TabIndex" :data-vv-value-path="'FormScope_' + PageLevel + '_' + TabIndex">
                            <b-row  style="padding-left: 10px; padding-bottom: 10px; !important;">              
                                <b-col md="12" id="col-left"> <!-- table open -->
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnbaseunitnoChange" :prop="PI_baseunitno" :value="M_SM_UnitGenerator.baseunitno" :label="M_SM_UnitGenerator.baseunitnoLabel" ref="ref_baseunitno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputCheckBox @input="OnosellingpriceChange" :prop="PI_osellingprice" v-model="M_SM_UnitGenerator.osellingprice"  ref="ref_osellingprice" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex @input="OnnumberofdigitChange" :prop="PI_numberofdigit" v-model="M_SM_UnitGenerator.numberofdigit"  ref="ref_numberofdigit"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex @input="OnformatChange" :prop="PI_format" v-model="M_SM_UnitGenerator.format"  ref="ref_format"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col md="6">
                                            <b-row>
                                                <b-col md="4" class="lbl-col-align"></b-col>                                                
                                                <b-col><label class="lbl-value-view-form">$N(Running Number) $B(Block) $L(Level)</label></b-col>
                                            </b-row>                                              
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex @input="OnoutputlengthChange" :prop="PI_outputlength" v-model="M_SM_UnitGenerator.outputlength"  ref="ref_outputlength"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_startunitno" v-model="M_SM_UnitGenerator.startunitno"  ref="ref_startunitno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_unitno" v-model="M_SM_UnitGenerator.unitno"  ref="ref_unitno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_skip" v-model="M_SM_UnitGenerator.skip"  ref="ref_skip"/>
                                      </b-col>
                                    </b-row>
                                </b-col> <!-- table close -->
                                                                    
                            </b-row>
                            <ABSTAnalysis :prop="PTAnalysis" />
                        </b-form>
                    </b-col>                
                </b-row>
            </b-collapse>
        </div>
    </div>
</template>

<script>

export default {
    props: {PageLevel: '', TabIndex: '', data: ''},
    data() {
        return {
			cInsertKey:'',
            FormType: "Form",
			Module:"SM",	
            IEBy: {Input: '', Edit: ''},

            M_SM_UnitGenerator :{
                baseunitno: '',
                osellingprice: ['S','P','F','A','C','L'],
                numberofdigit: '',
                format: '',
                outputlength: '',
                startunitno: '',
                unitno: '',
                skip: '0',
                lastupdatestamps: 0,
                userinput: '',
                useredit: '',
                rowid: 0,
                    }
            ,					
            PI_baseunitno: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupTNLot'    , 
                    ColumnDB: 'LotNo'   , 
                    InitialWhere: "SubPortfolioCd='"+this.getDataUser().subportfolio_cd+"'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'LotNo,Descs' 
                        }, 
                cValidate :'required', 
                cName: 'baseunitno', 
                cLabel: 'Base Unit No', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 1, 
                cTriggered: false, 
                cDefault: '', 
                cProtect: false, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cStatic: false, 
                cOption: [], 
                cMasterUrl: '' ,
                cDisplayColumn: 'LotNo,Descs' ,
            }, 
            PI_osellingprice: { 
                cValidate :'', 
                cName: 'osellingprice', 
                cLabel: 'Include Unit Detail', 
                cLabelSize: 4, 
                cOptions: [{ text: 'Selling Price ', value: 'S' }, { text: 'Payment Scheme ', value: 'P' }, { text: 'Facility', value: 'F' }, { text: 'Accessory', value: 'A' }, { text: 'Accomodation', value: 'C' }, { text: 'Layout', value: 'L' }], 
                cOrder: 2, 
                cKey: false, 
                cVisible: true, 
                cProtect: false, 
                cDefault: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_numberofdigit: { 
                cValidate :'required|max_value:10', 
                cName: 'numberofdigit', 
                cLabel: 'Number of Digit', 
                cLabelSize: 4, 
                cOrder: 3, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_format: { 
                cValidate :'required', 
                cName: 'format', 
                cLabel: 'Format', 
                cLabelSize: 4, 
                cOrder: 4, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_outputlength: { 
                cLabel: 'Output Length', 
                cLabelSize: 4, 
                cValue: '', 
                cType: 'decimal',
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cVisible: true 
            }, 
            PI_startunitno: { 
                cValidate :'required|min_value:1', 
                cName: 'startunitno', 
                cLabel: 'Start Unit No', 
                cLabelSize: 4, 
                cOrder: 5, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_unitno: { 
                cValidate :'required|min_value:1', 
                cName: 'unitno', 
                cLabel: 'No of Unit(s)', 
                cLabelSize: 4, 
                cOrder: 6, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_skip: { 
                cValidate :'required|min_value:0', 
                cName: 'skip', 
                cLabel: 'Skip', 
                cLabelSize: 4, 
                cOrder: 7, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            
            PTAnalysis: {
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cPageMasterSeq: this.data.PageMasterSeq,
                cFormPageNo: this.data.PageOrder
            }
        }
    },
	computed : {
    inputStatus() {
      if(this.$store.getters.getLevel == this.PageLevel && this.$store.getters.getTab == this.TabIndex){
        return this.$store.getters.getStatus.toUpperCase()
      }
      else {
        return 'VIEW'
      }
    }
  },
    methods: {		
        OnbaseunitnoChange (data) {
        this.$nextTick(() => {
            this.M_SM_UnitGenerator.baseunitno = data.id
            this.M_SM_UnitGenerator.baseunitnoLabel = data.label
            if (this.inputStatus != "VIEW") {
//{baseunitno}
            }
        })
        this.$forceUpdate()
        },
        OnosellingpriceChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{osellingprice}
            }
        })
        this.$forceUpdate()
        },
        OnformatChange(data){          
          this.$nextTick(() => {
            if(data.includes('$N') || data.includes('$n')){
                var n = data.indexOf('$N')
                console.log(n)
                this.M_SM_UnitGenerator.outputlength = parseInt(this.M_SM_UnitGenerator.numberofdigit) + parseInt(n)
            }
          })
          this.$forceUpdate()
        },
        OnnumberofdigitChange(data){
        this.$nextTick(() => {
          this.PI_unitno.cValidate = "required|min_value:1|max:"+data+""        
          if(this.M_SM_UnitGenerator.format != ''){
              var n = this.M_SM_UnitGenerator.format.indexOf('$N')
              console.log(n)
              this.M_SM_UnitGenerator.outputlength = parseInt(data) + parseInt(n)
          //   }
          }
        })
        this.$forceUpdate()
      },
      OnoutputlengthChange(data){
        this.$nextTick(() => {
          
        })
        this.$forceUpdate()
      },
		setToolbarButton () {
            this.getToolbar().doEdit(true)
           //this.getToolbar().statusFunction[4].disabled = false
		},
        M_Head_Table () {
        },
        M_PageSize(){
        },
        M_TabClick(){
        },
        M_Pagination(){
        },
        M_Advance_Filter(){
        },
        M_Search(data){
        },
        M_Refresh(){
        },
		M_Cancel() {			
		},		
		doDoubleClick(){
        },
        rowClicked (record, index) {
        },
        rowLink: function(url){
            this.$refs.modalTest.show()
        },		
		paramFromParent(){
        },		
        M_Post(dt){
        },
        M_Insert() {
        },
        M_Update() {
            if(this.M_SM_UnitGenerator.outputlength.length > 10){
                this.alertError("Maximum length 10 including format and digit")
                  return
            }
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfolioCd: this.M_SM_UnitGenerator.subportfoliocd,
                BaseUnitNo: this.M_SM_UnitGenerator.baseunitno == '' || this.M_SM_UnitGenerator.baseunitno == null ? 'NULL' : this.M_SM_UnitGenerator.baseunitno ,
                FormatUnit: this.M_SM_UnitGenerator.formatunit,
                OutputLength: this.M_SM_UnitGenerator.outputlength ? this.replaceAllString(this.M_SM_UnitGenerator.outputlength,',','','number') : 0 ,
                NumberOfDigit: this.M_SM_UnitGenerator.numberofdigit ? this.replaceAllString(this.M_SM_UnitGenerator.numberofdigit,',','','number') : 0 ,
                StartUnitNo: this.M_SM_UnitGenerator.startunitno ? this.replaceAllString(this.M_SM_UnitGenerator.startunitno,',','','number') : 0 ,
                TotalUnit: this.M_SM_UnitGenerator.totalunit ? this.replaceAllString(this.M_SM_UnitGenerator.totalunit,',','','number') : 0 ,
                UserInput: this.getDataUser().user_id ,
                Skip: this.M_SM_UnitGenerator.skip ? this.replaceAllString(this.M_SM_UnitGenerator.skip,',','','number') : 0 ,
                SellingPrice: this.M_SM_UnitGenerator.osellingprice.indexOf('S') >= 0 ? 'Y' : 'N',
                PaymentScheme: this.M_SM_UnitGenerator.osellingprice.indexOf('P') >= 0 ? 'Y' : 'N',
                Accessory: this.M_SM_UnitGenerator.osellingprice.indexOf('F') >= 0 ? 'Y' : 'N',
                Accomodation: this.M_SM_UnitGenerator.osellingprice.indexOf('A') >= 0 ? 'Y' : 'N',
                Facility: this.M_SM_UnitGenerator.osellingprice.indexOf('C') >= 0 ? 'Y' : 'N',
                Layout: this.M_SM_UnitGenerator.osellingprice.indexOf('L') >= 0 ? 'Y' : 'N'                
            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return
                    this.$parent.resultInsert("Generated - Success")
                // this.alertSuccess(response.Message)
                // .then(() => {
                    // this.getToolbar().FormStatus = 'EDIT'
                    // this.getToolbar().ProcessPS()
                    // this.$store.commit('setStatus', 'view')
					// this.$store.commit('setEventStatus', 'Save')

                    // this.FormToMasterPage().ValidasiPage()
										
					
                // })
            })
        },
		M_ClearForm(){
			this.$nextTick(() => {
                this.M_SM_UnitGenerator = {
                    baseunitno: '',
                    osellingprice: ['S','P','F','A','C','L'],
                    numberofdigit: '',
                    format: '',
                    outputlength: '',
                    startunitno: '',
                    unitno: '',
                    skip: '0',
                    lastupdatestamps: 0,
                    userinput: '',
                    useredit: '',
                    rowid: 0,
                        }
            	
		   })
		   this.$forceUpdate()	
		},
        M_New(){
			// this.$refs.ref_baseunitno.focus()
        },
        M_Edit(){
            // this.$refs.ref_baseunitno.focus()
        },
        M_Delete(dt){ 
        },        
        getDataBy (record) {
        }
    },
    beforeCreate: function () {
    },
    created: function() {
        this.$store.commit('setFormType','Form')
        this.getToolbar().ProcessPS()
        // this.isDetail = true
    },
    beforeMount: function() {
    },
    mounted: function() {
        this.hideSideBarMenu()
		
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
