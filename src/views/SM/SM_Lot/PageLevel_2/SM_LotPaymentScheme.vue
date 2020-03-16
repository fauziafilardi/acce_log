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
                                        <ABSinputRadioButtonVuex @input="OnchargetypeChange" :prop="PI_chargetype" v-model="M_SM_LotPaymentScheme.chargetype"  ref="ref_chargetype" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnsalestypecdChange" :prop="PI_salestypecd" :value="M_SM_LotPaymentScheme.salestypecd" :label="M_SM_LotPaymentScheme.salestypecdLabel" ref="ref_salestypecd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OntrxtypeChange" :prop="PI_trxtype" :value="M_SM_LotPaymentScheme.trxtype" :label="M_SM_LotPaymentScheme.trxtypeLabel" ref="ref_trxtype"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_descs" v-model="M_SM_LotPaymentScheme.descs"  ref="ref_descs"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnbookingfeeChange" :prop="PI_bookingfee" v-model="M_SM_LotPaymentScheme.bookingfee"  ref="ref_bookingfee" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnbftrxtypeChange" :prop="PI_bftrxtype" :value="M_SM_LotPaymentScheme.bftrxtype" :label="M_SM_LotPaymentScheme.bftrxtypeLabel" ref="ref_bftrxtype"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OncredittermscdChange" :prop="PI_credittermscd" :value="M_SM_LotPaymentScheme.credittermscd" :label="M_SM_LotPaymentScheme.credittermscdLabel" ref="ref_credittermscd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnchargebasisChange" :prop="PI_chargebasis" v-model="M_SM_LotPaymentScheme.chargebasis"  ref="ref_chargebasis" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_paymentpercentage" v-model="M_SM_LotPaymentScheme.paymentpercentage"  ref="ref_paymentpercentage"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnpaymentcycleChange" :prop="PI_paymentcycle" v-model="M_SM_LotPaymentScheme.paymentcycle"  ref="ref_paymentcycle" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_paymentfrequency" v-model="M_SM_LotPaymentScheme.paymentfrequency"  ref="ref_paymentfrequency"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_paymentinterval" v-model="M_SM_LotPaymentScheme.paymentinterval"  ref="ref_paymentinterval"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_paymentday" v-model="M_SM_LotPaymentScheme.paymentday"  ref="ref_paymentday"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_paymentmonth" v-model="M_SM_LotPaymentScheme.paymentmonth"  ref="ref_paymentmonth"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_SM_LotPaymentScheme.remarks"  ref="ref_remarks" />
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
       
            IEBy: {Input: '', Edit: ''},   			

            M_SM_LotPaymentScheme :{
                    bftrxtypedescs: '',
                    bookingfee: 'N',
                    bookingfeetrxtype: '',
                    chargebasis: 'P',
                    chargetype: 'U',
                    credittermscd: '',
                    credittermsdescs: '',
                    descs: '',
                    modulecd: '',
                    paymentamt: '0',
                    paymentcycle: 'M',
                    paymentday: '0',
                    paymentfrequency: '0',
                    paymentinterval: '0',
                    paymentmonth: '0',
                    paymentpercentage: '0',
                    remarks: '',
                    salestypecd: '',
                    salestypedescs: '',
                    sequenceno: 0,
                    subportfoliocd: this.getDataUser().subportfolio_cd,
                    trxtype: '',
                    trxtypedescs: '',
                    useredit: this.getDataUser().user_id,
                    userinput: '',
                    lastupdatestamp: 0,
                    }
            ,
            PI_chargetype: { 
                cValidate :'', 
                cName: 'chargetypeee', 
                cId: 'rdbchargetype', 
                cRadioOptions: [{ text: 'Unit', value: 'U' },{ text: 'VO', value: 'V' },{ text: 'Others', value: 'O' },], 
                cRadioDefaultOption: 'U', 
                cLabel:'Charge Type', 
                cLabelSize: 4, 
                cDefault: '', 
                cOrder: 1, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_salestypecd: { 
                dataLookUp: { 
                    LookUpCd: 'GetSalesTypeCd'    , 
                    ColumnDB: 'SalesTypeCd'   , 
                    InitialWhere: "SubPortfolioCd='"+this.getDataUser().subportfolio_cd+"'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'SalesTypeCd' 
                        }, 
                cValidate :'required', 
                cName: 'salestypecd', 
                cLabel: 'Sales Type', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 2, 
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
                cMasterUrl: 'SM/SM_SalesType' ,
                cDisplayColumn: 'SalesTypeCd' ,
            }, 
            PI_trxtype: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMTransTypeMaster'    , 
                    ColumnDB: 'TrxType'   , 
                    InitialWhere: "ModuleCd='SM'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'TrxType,Descs' 
                        }, 
                cValidate :'required', 
                cName: 'trxtype', 
                cLabel: 'Transaction Type', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 3, 
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
                cMasterUrl: 'SM/SM_TransactionTypeMaster' ,
                cDisplayColumn: 'TransactionType,Descs' ,
            }, 
            PI_descs: { 
                cValidate :'', 
                cName: 'descs', 
                cLabel: 'Description', 
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
            PI_bookingfee: { 
                cValidate :'', 
                cName: 'bookingfee', 
                cId: 'rdbbookingfee', 
                cRadioOptions: [{ text: 'No', value: 'N' },{ text: 'Yes', value: 'Y' },], 
                cRadioDefaultOption: 'B', 
                cLabel:'Booking Fee', 
                cLabelSize: 4, 
                cDefault: '', 
                cOrder: 5, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_bftrxtype: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMTransTypeMaster'    , 
                    ColumnDB: 'TrxType'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'TransactionType,Descs' 
                        }, 
                cValidate :'', 
                cName: 'bftrxtype', 
                cLabel: 'Booking Fee Trans Type', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 6, 
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
            PI_credittermscd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMCreditTerms'    , 
                    ColumnDB: 'CreditTermsCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'CreditTermsCd,Descs' 
                        }, 
                cValidate :'', 
                cName: 'credittermscd', 
                cLabel: 'Credit Terms', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 7, 
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
                cDefault: '', 
                cOrder: 8, 
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
                cOrder: 9, 
                cKey: false, 
                cType: 'decimal',
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
                cDefault: '', 
                cOrder: 10, 
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
                cOrder: 11, 
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
                cOrder: 12, 
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
                cOrder: 13, 
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
                cLabel: 'Default Payment Month', 
                cLabelSize: 4, 
                cOrder: 14, 
                cKey: false, 
                cType: 'numeric',
                cLastLabel: '/ after Order Date',
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
                cOrder:15, 
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
        OnsalestypecdChange (data) {
        this.$nextTick(() => {
            this.M_SM_LotPaymentScheme.salestypecd = data.id
            this.M_SM_LotPaymentScheme.salestypecdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{salestypecd}
            }
        })
        this.$forceUpdate()
        },
        OntrxtypeChange (data) {
        this.$nextTick(() => {
            this.M_SM_LotPaymentScheme.trxtype = data.id
            this.M_SM_LotPaymentScheme.trxtypeLabel = data.label
            if (this.inputStatus != "VIEW") {
//{trxtype}
                this.M_SM_LotPaymentScheme.descs = data.Descs
            }
        })
        this.$forceUpdate()
        },
        OnbookingfeeChange (data) {
          // console.log(data)
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{bookingfee}
              if(data == 'N'){
                this.PI_bftrxtype.cProtect = false
              }
              else{
                this.PI_bftrxtype.cProtect = true
              }
            }
        })
        this.$forceUpdate()
        },
        OnbftrxtypeChange (data) {
        this.$nextTick(() => {
            this.M_SM_LotPaymentScheme.bftrxtype = data.id
            this.M_SM_LotPaymentScheme.bftrxtypeLabel = data.label
            if (this.inputStatus != "VIEW") {
//{bftrxtype}
            }
        })
        this.$forceUpdate()
        },
        OncredittermscdChange (data) {
        this.$nextTick(() => {
            this.M_SM_LotPaymentScheme.credittermscd = data.id
            this.M_SM_LotPaymentScheme.credittermscdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{credittermscd}
            }
        })
        this.$forceUpdate()
        },
        OnchargebasisChange (data) {
          // console.log(data)
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{chargebasis}
            }
        })
        this.$forceUpdate()
        },
        OnpaymentcycleChange (data) {
          // console.log(data)
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{paymentcycle}
              if(data == 'O'){
                this.PI_paymentfrequency.cProtect = true                
              }
              else{
                this.PI_paymentfrequency.cProtect = false
              }
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
            // console.log(data)
            this.M_SM_LotPaymentScheme.lotno = data.LotNo 
            this.propList.initialWhere =" LotNo = '" + data.LotNo + "' "
        
            // this.GetSpecificationData()
            this.FormToABSList().doGetList('','eb_getList')
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
                // console.log(this.dataSpec)
                this.M_SM_LotPaymentScheme.credittermscd = this.dataSpec.CreditTermsCd
                this.M_SM_LotPaymentScheme.credittermscdLabel = this.dataSpec.CreditTermsCd
                this.M_SM_LotPaymentScheme.generatecontractschedulebasedon = this.dataSpec.GenerateContractScheduleBasedOn

              
            })
        },	
        M_Insert() {
                    console.log(this.M_SM_LotPaymentScheme)
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                LotNo: this.M_SM_LotPaymentScheme.lotno,
                ChargeType: this.M_SM_LotPaymentScheme.chargetype,
                SalesTypeCd: this.M_SM_LotPaymentScheme.salestypecd == '' || this.M_SM_LotPaymentScheme.salestypecd == null ? 'NULL' : this.M_SM_LotPaymentScheme.salestypecd ,
                TrxType: this.M_SM_LotPaymentScheme.trxtype == '' || this.M_SM_LotPaymentScheme.trxtype == null ? 'NULL' : this.M_SM_LotPaymentScheme.trxtype ,
                Descs: this.M_SM_LotPaymentScheme.descs,
                BookingFee: this.M_SM_LotPaymentScheme.bookingfee,
                BFTrxType: this.M_SM_LotPaymentScheme.bftrxtype == '' || this.M_SM_LotPaymentScheme.bftrxtype == null ? 'NULL' : this.M_SM_LotPaymentScheme.bftrxtype ,
                ChargeBasis: this.M_SM_LotPaymentScheme.chargebasis,
                PaymentPercentage: this.M_SM_LotPaymentScheme.paymentpercentage ? this.replaceAllString(this.M_SM_LotPaymentScheme.paymentpercentage,',','','number') : 0 ,
                PaymentAmt: this.M_SM_LotPaymentScheme.paymentamt  ? this.replaceAllString(this.M_SM_LotPaymentScheme.paymentamt,',','','number') : 0 ,
                PaymentFrequency: this.M_SM_LotPaymentScheme.paymentfrequency,
                CreditTermsCd: this.M_SM_LotPaymentScheme.credittermscd == '' || this.M_SM_LotPaymentScheme.credittermscd == null ? 'NULL' : this.M_SM_LotPaymentScheme.credittermscd ,
                PaymentCycle: this.M_SM_LotPaymentScheme.paymentcycle,
                PaymentInterval: this.M_SM_LotPaymentScheme.paymentinterval,
                PaymentDay: this.M_SM_LotPaymentScheme.paymentday,
                PaymentMonth: this.M_SM_LotPaymentScheme.paymentmonth,
                Remarks: this.M_SM_LotPaymentScheme.remarks,
                UserInput: this.getDataUser().user_id                 
            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return

				//kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultInsert(response.Message)
					
				
            })
        },
        M_Update() {
          console.log(this.M_SM_LotPaymentScheme)
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                SequenceNo: this.M_SM_LotPaymentScheme.sequenceno,
                LotNo: this.M_SM_LotPaymentScheme.lotno,
                ChargeType: this.M_SM_LotPaymentScheme.chargetype,
                SalesTypeCd: this.M_SM_LotPaymentScheme.salestypecd == '' || this.M_SM_LotPaymentScheme.salestypecd == null ? 'NULL' : this.M_SM_LotPaymentScheme.salestypecd ,
                TrxType: this.M_SM_LotPaymentScheme.trxtype == '' || this.M_SM_LotPaymentScheme.trxtype == null ? 'NULL' : this.M_SM_LotPaymentScheme.trxtype ,
                Descs: this.M_SM_LotPaymentScheme.descs,
                BookingFee: this.M_SM_LotPaymentScheme.bookingfee,
                BFTrxType: this.M_SM_LotPaymentScheme.bftrxtype == '' || this.M_SM_LotPaymentScheme.bftrxtype == null ? 'NULL' : this.M_SM_LotPaymentScheme.bftrxtype ,
                ChargeBasis: this.M_SM_LotPaymentScheme.chargebasis,
                PaymentPercentage: this.M_SM_LotPaymentScheme.paymentpercentage ? this.replaceAllString(this.M_SM_LotPaymentScheme.paymentpercentage,',','','number') : 0 ,
                PaymentAmt: this.M_SM_LotPaymentScheme.paymentamt  ? this.replaceAllString(this.M_SM_LotPaymentScheme.paymentamt,',','','number') : 0 ,
                PaymentFrequency: this.M_SM_LotPaymentScheme.paymentfrequency,
                CreditTermsCd: this.M_SM_LotPaymentScheme.credittermscd == '' || this.M_SM_LotPaymentScheme.credittermscd == null ? 'NULL' : this.M_SM_LotPaymentScheme.credittermscd ,
                PaymentCycle: this.M_SM_LotPaymentScheme.paymentcycle,
                PaymentInterval: this.M_SM_LotPaymentScheme.paymentinterval,
                PaymentDay: this.M_SM_LotPaymentScheme.paymentday,
                PaymentMonth: this.M_SM_LotPaymentScheme.paymentmonth,
                Remarks: this.M_SM_LotPaymentScheme.remarks,
                UserEdit: this.getDataUser().user_id ,
                LastUpdateStamp: this.M_SM_LotPaymentScheme.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_SM_LotPaymentScheme = {
                    bftrxtypedescs: '',
                    bookingfee: 'N',
                    bookingfeetrxtype: '',
                    chargebasis: 'P',
                    chargetype: 'U',
                    credittermscd: '',
                    credittermsdescs: '',
                    descs: '',
                    modulecd: '',
                    paymentamt: '',
                    paymentcycle: 'M',
                    paymentday: '',
                    paymentfrequency: '',
                    paymentinterval: '',
                    paymentmonth: '',
                    paymentpercentage: '0.00',
                    remarks: '',
                    salestypecd: '',
                    salestypedescs: '',
                    sequenceno: '',
                    subportfoliocd: this.getDataUser().subportfolio_cd,
                    trxtype: '',
                    trxtypedescs: '',
                    useredit: this.getDataUser().user_id,
                    userinput: '',
                    lastupdatestamp: 0,
                    }
            	
		},
        M_New(){
            let data = this.$store.getters.GetPage1Data
            this.M_SM_LotPaymentScheme.lotno = data.LotNo 

            this.$refs.ref_chargetype.focus()
            this.PI_bftrxtype.dataLookUp.initialWhere = "ModuleCd='SM' and TrxType in (Select TrxType from SM_SalesPaymentScheme Where OrderNo='" +data.OrderNo+ "' AND SubportfolioCd='" +this.getDataUser().subportfolio_cd+ "' AND BookingFee = 'Y')" 
            this.GetSpecificationData()
        },
        M_Edit(){
          let data = this.$store.getters.GetPage1Data
          this.M_SM_LotPaymentScheme.lotno = data.LotNo

          this.$refs.ref_chargetype.focus()
          this.PI_bftrxtype.dataLookUp.initialWhere = "ModuleCd='SM' and TrxType in (Select TrxType from SM_SalesPaymentScheme Where OrderNo='" +data.OrderNo+ "' AND SubportfolioCd='" +this.getDataUser().subportfolio_cd+ "' AND BookingFee = 'Y')" 
          this.GetSpecificationData()
        },
        M_Delete(dt){           
          var data = this.FormToABSList().getRowSelected()  
          var dataDelete = []

          data.forEach((value) => {
            // console.log(value)
            
                    dataDelete.push({
                      _Message_:'',
                        SubPortfolioCd: this.getDataUser().subportfolio_cd,
                        LotNo: value.LotNo,
                        SequenceNo: value.SequenceNo,
                        TrxType: value.TrxType == '' || value.TrxType == null ? 'NULL' : value.TrxType ,
                        LastUpdateStamp: value.LastUpdateStamp,
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
          // console.log(record)
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order
,                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                sequenceno: record.SequenceNo,
                lotno: record.LotNo,
                trxtype: record.TrxType,
                salestypecd: record.SalesTypeCd				
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
                // console.log(data)
this.M_SM_LotPaymentScheme = {
                bftrxtypedescs: data.bftrxtypedescs,
                bookingfee: data.bookingfee,
                bookingfeetrxtype: data.bookingfeetrxtype,
                chargebasis: data.chargebasis,
                chargetype: data.chargetype,
                credittermscd: data.credittermscd,
                credittermsdescs: data.credittermsdescs,
                descs: data.descs,
                modulecd: data.modulecd,
                paymentamt: data.paymentamt,
                paymentcycle: data.paymentcycle,
                paymentday: data.paymentday,
                paymentfrequency: data.paymentfrequency,
                paymentinterval: data.paymentinterval,
                paymentmonth: data.paymentmonth,
                paymentpercentage: this.isCurrency(data.paymentpercentage, this.decimal),
                remarks: data.remarks,
                salestypecd: data.salestypecd,
                salestypedescs: data.salestypedescs,
                sequenceno: data.sequenceno,
                subportfoliocd: data.subportfoliocd,
                trxtype: data.trxtype,
                trxtypedescs: data.trxtypedescs,
                useredit: data.useredit,
                userinput: data.userinput,
                lastupdatestamp: record.LastUpdateStamp
                    }
                 

                this.M_SM_LotPaymentScheme.salestypecdLabel = this.M_SM_LotPaymentScheme.salestypecd != null && this.M_SM_LotPaymentScheme.salestypecd != '' ? data.salestypecd + this.separator + data.salestypedescs :'' 
                this.M_SM_LotPaymentScheme.trxtypeLabel = this.M_SM_LotPaymentScheme.trxtype != null && this.M_SM_LotPaymentScheme.trxtype != '' ? data.trxtype + this.separator + data.trxtypedescs :'' 
                this.M_SM_LotPaymentScheme.bftrxtypeLabel = this.M_SM_LotPaymentScheme.bftrxtype != null && this.M_SM_LotPaymentScheme.bftrxtype != '' ? data.bookingfeetrxtype + this.separator + data.bftrxtypedescs :'' 
                this.M_SM_LotPaymentScheme.credittermscdLabel = this.M_SM_LotPaymentScheme.credittermscd != null && this.M_SM_LotPaymentScheme.credittermscd != '' ? data.credittermscd + this.separator + data.credittermsdescs  :'' 

                if(data.bookingfee == 'Y'){
                  this.PI_bftrxtype.cProtect = true
                }else{
                  this.PI_bftrxtype.cProtect = false
                }

                if(data.paymentcycle == 'O'){
                  this.paymentfrequency.cProtect = true
                }else{
                  this.paymentfrequency.cProtect = false
                }

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
        this.GetSpecificationData()
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

