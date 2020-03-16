<template>
    <div>        
    <ABSListVuex
      :prop = "propList"
      :title = "data.query_name"
      @rowClicked = "$parent.rowClicked"
      @rowDblClicked = "$parent.doDoubleClick"
      @rowLinkClick = "$parent.rowLink"
      @pageSize = "$parent.M_PageSize"
      @pagination = "$parent.M_Pagination"
      @filter = "$parent.M_Advance_Filter"
      @headTable = "$parent.M_Head_Table"
      @refreshColumn = "$parent.refreshColumn"
      @checkboxChecked = "$parent.checkboxChecked"
    />


        <div v-show="$parent.showForm"  :style="'margin-top:10px;'" class="el" mousetip mousetip-msg="I'm a tooltip">
            <div class="div-collapse" v-b-toggle.collapse1>
                <span class="master-span" v-show="IEBy.Input && IEBy.Edit">
                    Input By : {{IEBy.Input}} | Edit By : {{IEBy.Edit}} <font-awesome-icon icon="sort-down" class="icon-style-1__master" /> 
                </span>
            </div>
            <b-collapse id="collapse1" :visible="true">
                <b-row  style="padding-left: 10px; padding-bottom: 10px; !important;">     
					<b-col md="12" id="col-left" class="bColMasterForm">	
						<b-form :data-vv-scope="'FormScope_' + PageLevel + '_' + TabIndex" :data-vv-value-path="'FormScope_' + PageLevel + '_' + TabIndex">
                            <b-row style="padding-left:10px;">					
                                <b-col md="12" id="col-left"> <!-- table open -->
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnchargetypeChange" :prop="PI_chargetype" v-model="M_SM_SalesPaymentScheme.chargetype"  ref="ref_chargetype" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OntrxtypeChange" :prop="PI_trxtype" :value="M_SM_SalesPaymentScheme.trxtype" :label="M_SM_SalesPaymentScheme.trxtypeLabel" ref="ref_trxtype"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_descs" v-model="M_SM_SalesPaymentScheme.descs"  ref="ref_descs"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnbookingfeeChange" :prop="PI_bookingfee" v-model="M_SM_SalesPaymentScheme.bookingfee"  ref="ref_bookingfee" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnbookingfeetrxtypeChange" :prop="PI_bookingfeetrxtype" :value="M_SM_SalesPaymentScheme.bookingfeetrxtype" :label="M_SM_SalesPaymentScheme.bookingfeetrxtypeLabel" ref="ref_bookingfeetrxtype"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OncredittermsChange" :prop="PI_creditterms" :value="M_SM_SalesPaymentScheme.creditterms" :label="M_SM_SalesPaymentScheme.credittermsLabel" ref="ref_creditterms"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnchargebasisChange" :prop="PI_chargebasis" v-model="M_SM_SalesPaymentScheme.chargebasis"  ref="ref_chargebasis" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_paymentpercentage" v-model="M_SM_SalesPaymentScheme.paymentpercentage"  ref="ref_paymentpercentage"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnpaymentcycleChange" :prop="PI_paymentcycle" v-model="M_SM_SalesPaymentScheme.paymentcycle"  ref="ref_paymentcycle" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_paymentfrequency" v-model="M_SM_SalesPaymentScheme.paymentfrequency"  ref="ref_paymentfrequency"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_paymentinterval" v-model="M_SM_SalesPaymentScheme.paymentinterval"  ref="ref_paymentinterval"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_paymentday" v-model="M_SM_SalesPaymentScheme.paymentday"  ref="ref_paymentday"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_paymentmonth" v-model="M_SM_SalesPaymentScheme.paymentmonth"  ref="ref_paymentmonth"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_SM_SalesPaymentScheme.remarks"  ref="ref_remarks" />
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
    props: {PageLevel:'', TabIndex: '', data: ''},
    data() {
        return {
			ValKey:null,
            FormType: "List",
			Module:"SM",
            propList: {
                initialWhere:"LotNo = '" + this.ValKey + "'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
            dataSpec:[],
            IEBy: {Input: '', Edit: ''},   			

            M_SM_SalesPaymentScheme :{
                sequenceno:0,
                paymentday: '0',
                chargetype: 'U',
                trxtype: '',
                descs: '',
                bookingfee: 'N',
                bookingfeetrxtype: '',
                creditterms: '',
                chargebasis: 'P',
                paymentpercentage: '0',
                paymentcycle: 'M',
                paymentfrequency: '1',
                paymentinterval: '1',
                paymentday: '0',
                paymentmonth: '0',
                remarks: ''
                    }
            ,
            PI_chargetype: { 
                cValidate :'', 
                cName: 'chargetype', 
                cId: 'rdbchargetype', 
                cRadioOptions: [{ text: 'Unit', value: 'U' },{ text: 'VO', value: 'V' },{ text: 'Others', value: 'O' },], 
                cRadioDefaultOption: 'U', 
                cLabel:'Charge Type', 
                cLabelSize: 4, 
                cDefault: 'U', 
                cOrder: 0, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_trxtype: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMTransTypeMaster'    , 
                    ColumnDB: 'TrxType'   , 
                    InitialWhere: " ModuleCd ='SM' "   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'TrxType,Descs' 
                        }, 
                cValidate :'', 
                cName: 'trxtype', 
                cLabel: 'Trans Type', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 0, 
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
                cDisplayColumn: 'TrxType,Descs' ,
            }, 
            PI_descs: { 
                cValidate :'', 
                cName: 'descs', 
                cLabel: 'Description', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_bookingfee: { 
                cValidate :'', 
                cName: 'bookingfee', 
                cId: 'rdbbookingfee', 
                cRadioOptions: [{ text: 'No', value: 'N' },{ text: 'Yes', value: 'Y' },], 
                cRadioDefaultOption: 'N', 
                cLabel:'Booking Fee', 
                cLabelSize: 4, 
                cDefault: 'N', 
                cOrder: 0, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_bookingfeetrxtype: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMTransTypeMaster'    , 
                    ColumnDB: 'TrxType'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'TransactionType,Descs' 
                        }, 
                cValidate :'', 
                cName: 'bookingfeetrxtype', 
                cLabel: 'Booking Fee Trans Type', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 0, 
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
                cDisplayColumn: 'TransactionType,Descs' ,
            }, 
            PI_creditterms: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMCreditTerms'    , 
                    ColumnDB: 'CreditTermsCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'CreditTermsCd,Descs' 
                        }, 
                cValidate :'', 
                cName: 'creditterms', 
                cLabel: 'Credit Terms', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 0, 
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
                cMasterUrl: 'CM/CM_CreditTerms' ,
                cDisplayColumn: 'CreditTermsCd,Descs' ,
            }, 
            PI_chargebasis: { 
                cValidate :'', 
                cName: 'chargebasis', 
                cId: 'rdbchargebasis', 
                cRadioOptions: [{ text: 'Percentage', value: 'P' },{ text: 'Fixed', value: 'F' },], 
                cRadioDefaultOption: 'P', 
                cLabel:'Charge Basis', 
                cLabelSize: 4, 
                cDefault: 'P', 
                cOrder: 0, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_paymentpercentage: { 
                cValidate :'', 
                cName: 'paymentpercentage', 
                cLabel: 'Payment Value', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_paymentcycle: { 
                cValidate :'', 
                cName: 'paymentcycle', 
                cId: 'rdbpaymentcycle', 
                cRadioOptions: [{ text: 'Once', value: 'O' },{ text: 'Weekly', value: 'W' },{ text: 'Monthly', value: 'M' },], 
                cRadioDefaultOption: 'M', 
                cLabel:'Payment Cycle', 
                cLabelSize: 4, 
                cDefault: 'M', 
                cOrder: 0, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_paymentfrequency: { 
                cValidate :'', 
                cName: 'paymentfrequency', 
                cLabel: 'Payment Frequency', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_paymentinterval: { 
                cValidate :'', 
                cName: 'paymentinterval', 
                cLabel: 'Payment Interval', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_paymentday: { 
                cValidate :'', 
                cName: 'paymentday', 
                cLabel: 'Payment Day', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_paymentmonth: { 
                cValidate :'', 
                cName: 'paymentmonth', 
                cLabel: 'Payment Month', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_remarks: { 
                cValidate :'', 
                cName:'remarks', 
                cLabel:'Remarks', 
                cLabelSize: 4, 
                cOrder:0, 
                cKey: false, 
                cDefault: '', 
                cProtect: false, 
                cVisible: true, 
                cResize: false, 
                cReadOnly: false, 
                cRows: 3, 
                cMaxRows: 3, 
                cSize: 'md', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
            }, 

			PTAnalysis: {
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cPageMasterSeq: this.data.PageMasterSeq,
                cFormPageNo: this.data.PageOrder,
				cProtect: false
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
    },
	DataRow(){
		return this.$store.getters.GetPage2Data
	},
    DataRowPage1(){
		return this.$store.getters.GetPage1Data
	}
	,GetDataBy1(){
		return this.$store.getters.GetPage1GetDataBy
	}
  },
    methods: {
        OnchargetypeChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{chargetype}
            }
        })
        this.$forceUpdate()
        },
        OntrxtypeChange (data) {
        this.$nextTick(() => {
          console.log(data)
            this.M_SM_SalesPaymentScheme.trxtype = data.id
            this.M_SM_SalesPaymentScheme.trxtypeLabel = data.label
            this.M_SM_SalesPaymentScheme.descs = data.Descs
            if (this.inputStatus != "VIEW") {
//{trxtype}
            }
        })
        this.$forceUpdate()
        },
        OnbookingfeeChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{bookingfee}
            }
        })
        this.$forceUpdate()
        },
        OnbookingfeetrxtypeChange (data) {
        this.$nextTick(() => {
          console.log(data)
            this.M_SM_SalesPaymentScheme.bookingfeetrxtype = data.id
            this.M_SM_SalesPaymentScheme.bookingfeetrxtypeLabel = data.label
            if (this.inputStatus != "VIEW") {
//{bookingfeetrxtype}
            }
        })
        this.$forceUpdate()
        },
        OncredittermsChange (data) {
        this.$nextTick(() => {
            this.M_SM_SalesPaymentScheme.creditterms = data.id
            this.M_SM_SalesPaymentScheme.credittermsLabel = data.label
            if (this.inputStatus != "VIEW") {
//{creditterms}
            }
        })
        this.$forceUpdate()
        },
        OnchargebasisChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{chargebasis}
            }
        })
        this.$forceUpdate()
        },
        OnpaymentcycleChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{paymentcycle}
            }
        })
        this.$forceUpdate()
        },
        OnremarksChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{remarks}
            }
        })
        this.$forceUpdate()
        },
		
		setToolbarButton () {
           //this.getToolbar().statusFunction[4].disabled = false
          //  let data = this.$store.getters.GetPage1Data
          console.log(this.DataRowPage1.StatusCd)
          if(this.DataRowPage1.StatusCd=='N'){
            this.getToolbar().statusFunction[0].disabled = false
          }else{
            this.getToolbar().statusFunction[0].disabled = true
          }
           
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
            this.$parent.showForm = false
			
            let data = this.$store.getters.GetPage1Data

            console.log(data)

            if(data.StatusCd == 'N'){
              this.getToolbar().FormStatus = 'EDIT'
              this.getToolbar().ProcessPS()
            } else if (data.StatusCd == 'C') {
              this.getToolbar().FormStatus = 'VIEW'
              this.getToolbar().ProcessPS()
            }else {
              this.getToolbar().FormStatus = 'VIEW'
              this.getToolbar().ProcessPS()
            }

            this.propList.initialWhere =" SubPortfolioCd='" + this.getDataUser().subportfolio_cd + "' AND  ModuleCd='SM' AND OrderNo ='"+data.OrderNo+"'"
        
            this.PI_bookingfeetrxtype.dataLookUp.initialWhere = "ModuleCd='SM' and TrxType in (Select TrxType from SM_SalesPaymentScheme Where OrderNo='" +data.OrderNo+ "' AND SubportfolioCd='" +this.getDataUser().subportfolio_cd+ "' AND BookingFee = 'Y')" 
            this.FormToABSList().doGetList('','eb_getList')
            this.GetSpecificationData()
        },		
		M_CheckboxChecked(data, status, index){

        },		
        GetSpecificationData(){ 
          var param = {
            OptionFunctionCd: "GetSMSpecification",
            ModuleCd: this.Module,
            SubPortfolioCd: this.getDataUser().subportfolio_cd
          }

          this.FnDynamicFunction(param)
            .then(ress => {
                if (ress == null || ress.length==0) {
                  this.alertError('Please setup the Sales Specification first.')
                  this.isError = true
                  return
                }else{
                  this.isError = false
                }
                // var data = ress[0]
                this.dataSpec = ress[0]
                this.M_SM_SalesPaymentScheme.creditterms = this.dataSpec.CreditTermsCd
                this.M_SM_SalesPaymentScheme.credittermsLabel = this.dataSpec.CreditTermsCd

              
            })
        },
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                OrderNo: this.DataRowPage1.OrderNo,
                LotNo: this.DataRowPage1.LotNo,
                TrxType: this.M_SM_SalesPaymentScheme.trxtype == '' || this.M_SM_SalesPaymentScheme.trxtype == null ? 'NULL' : this.M_SM_SalesPaymentScheme.trxtype ,
                ModuleCd: this.Module,
                Descs: this.M_SM_SalesPaymentScheme.descs,
                ChargeType: this.M_SM_SalesPaymentScheme.chargetype,
                ChargeBasis: this.M_SM_SalesPaymentScheme.chargebasis,
                BookingFee: this.M_SM_SalesPaymentScheme.bookingfee,
                BookingFeeTrxType: this.M_SM_SalesPaymentScheme.bookingfeetrxtype == '' || this.M_SM_SalesPaymentScheme.bookingfeetrxtype == null ? 'NULL' : this.M_SM_SalesPaymentScheme.bookingfeetrxtype ,
                PaymentPercentage: this.M_SM_SalesPaymentScheme.paymentpercentage,
                PaymentAmt: this.M_SM_SalesPaymentScheme.paymentpercentage,
                PaymentFrequency: this.M_SM_SalesPaymentScheme.paymentfrequency,
                CreditTermsCd: this.M_SM_SalesPaymentScheme.creditterms,
                PaymentCycle: this.M_SM_SalesPaymentScheme.paymentcycle,
                PaymentInterval: this.M_SM_SalesPaymentScheme.paymentinterval,
                PaymentDay: this.M_SM_SalesPaymentScheme.paymentday,
                PaymentMonth: this.M_SM_SalesPaymentScheme.paymentmonth,
                Remarks: this.M_SM_SalesPaymentScheme.remarks,
                UserInput: this.getDataUser().user_id ,
                CopyFromLotScheme: '',//this.M_SM_SalesPaymentScheme.copyfromlotscheme,
                MCBillingDate:''// this.M_SM_SalesPaymentScheme.mcbillingdate                
            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return

				//kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultInsert(response.Message)
					
				
            })
        },
        M_Update() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                OrderNo: this.DataRowPage1.OrderNo,
                SequenceNo: this.M_SM_SalesPaymentScheme.sequenceno,
                LotNo: this.DataRowPage1.LotNo,
                TrxType: this.M_SM_SalesPaymentScheme.trxtype == '' || this.M_SM_SalesPaymentScheme.trxtype == null ? 'NULL' : this.M_SM_SalesPaymentScheme.trxtype ,
                ModuleCd: this.Module,
                Descs: this.M_SM_SalesPaymentScheme.descs,
                ChargeType: this.M_SM_SalesPaymentScheme.chargetype,
                ChargeBasis: this.M_SM_SalesPaymentScheme.chargebasis,
                BookingFee: this.M_SM_SalesPaymentScheme.bookingfee,
                BookingFeeTrxType: this.M_SM_SalesPaymentScheme.bookingfeetrxtype == '' || this.M_SM_SalesPaymentScheme.bookingfeetrxtype == null ? 'NULL' : this.M_SM_SalesPaymentScheme.bookingfeetrxtype ,
                PaymentPercentage: this.M_SM_SalesPaymentScheme.paymentpercentage,
                PaymentAmt: this.M_SM_SalesPaymentScheme.paymentpercentage,
                PaymentFrequency: this.M_SM_SalesPaymentScheme.paymentfrequency,
                CreditTermsCd: this.M_SM_SalesPaymentScheme.creditterms,
                PaymentCycle: this.M_SM_SalesPaymentScheme.paymentcycle,
                PaymentInterval: this.M_SM_SalesPaymentScheme.paymentinterval,
                PaymentDay: this.M_SM_SalesPaymentScheme.paymentday,
                PaymentMonth: this.M_SM_SalesPaymentScheme.paymentmonth,
                Remarks: this.M_SM_SalesPaymentScheme.remarks,
                UserEdit: this.getDataUser().user_id ,
                LastUpdateStamp: this.M_SM_SalesPaymentScheme.lastupdatestamp,
                TrxTypePrevious: this.M_SM_SalesPaymentScheme.trxtypeprevious                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_SM_SalesPaymentScheme = {
                paymentday: '0',
                chargetype: 'U',
                trxtype: '',
                descs: '',
                bookingfee: 'N',
                bookingfeetrxtype: '',
                creditterms: '',
                chargebasis: 'P',
                paymentpercentage: '0',
                paymentcycle: 'M',
                paymentfrequency: '1',
                paymentinterval: '1',
                paymentday: '0',
                paymentmonth: '0',
                remarks: ''
                    }
            	
		},
        M_New(){
            let data = this.$store.getters.GetPage1Data
            this.M_SM_SalesPaymentScheme.lotno = data.LotNo 



        },
        M_Edit(){
        },
        M_Delete(dt){           
			var data = this.FormToABSList().getRowSelected()  
			var dataDelete = []

			
			data.forEach((value) => {

				
				dataDelete.push({
					_Message_:'',
                    SubPortfolioCd: this.getDataUser().subportfolio_cd,
                    OrderNo: this.DataRowPage1.OrderNo,
                    LotNo: this.DataRowPage1.LotNo,
                    SequenceNo: value.SequenceNo,
                    TrxType: value.TrxType == '' || value.TrxType == null ? 'NULL' : value.TrxType ,
                    LastUpdateStamp: value.LastUpdateStamp,
                    TrxTypePrevious: value.TrxType == '' || value.TrxType == null ? 'NULL' : value.TrxType ,


                })
			})
			
			var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                Data: dataDelete
            }
            
            this.postJSONMulti( this.getUrlDeleteMulti(), param )
            .then(response => {
                if (response == null) return

                this.$parent.resultDelete()
            })
        },        
        getDataBy (record) {
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order
,                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                orderno: record.OrderNo,
                lotno: record.LotNo,
                trxtype: record.TrxType,
                sequenceno: record.SequenceNo				
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
this.M_SM_SalesPaymentScheme = {
                sequenceno :record.SequenceNo,
                lastupdatestamp: record.LastUpdateStamp,
                trxtypeprevious: record.TrxType,
                paymentday: data.paymentday,
                chargetype: data.chargetype,
                trxtype: data.trxtype,
                descs: data.descs,
                bookingfee: data.bookingfee,
                bookingfeetrxtype: data.bookingfeetrxtype,
                creditterms: data.credittermscd,
                chargebasis: data.chargebasis,
                paymentpercentage: this.isCurrency(data.paymentpercentage, this.decimal),
                paymentcycle: data.paymentcycle,
                paymentfrequency: this.isCurrency(data.paymentfrequency, this.decimal),
                paymentinterval: this.isCurrency(data.paymentinterval, this.decimal),
                paymentday: this.isCurrency(data.paymentday, this.decimal),
                paymentmonth: this.isCurrency(data.paymentmonth, this.decimal),
                remarks: data.remarks
                    }
                 

                this.M_SM_SalesPaymentScheme.trxtypeLabel = this.M_SM_SalesPaymentScheme.trxtype != null && this.M_SM_SalesPaymentScheme.trxtype != '' ? data.trxtype + this.separator  :'' 
                this.M_SM_SalesPaymentScheme.bookingfeetrxtypeLabel = this.M_SM_SalesPaymentScheme.bookingfeetrxtype != null && this.M_SM_SalesPaymentScheme.bookingfeetrxtype != '' ? data.bookingfeetrxtype + this.separator  :'' 
                this.M_SM_SalesPaymentScheme.credittermsLabel = this.M_SM_SalesPaymentScheme.creditterms != null && this.M_SM_SalesPaymentScheme.creditterms != '' ? data.credittermscd + this.separator + data.credittermsdescs :'' 
  

                this.IEBy.Input = data.userinput
                this.IEBy.Edit = data.useredit

            })
        }
		
    },
    created: function() {
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

