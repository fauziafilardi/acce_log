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
                                        <ABSInputSelectList @change="OntrxtypeChange" :prop="PI_trxtype" :value="M_AR_InvoiceD.trxtype" :label="M_AR_InvoiceD.trxtypeLabel" ref="ref_trxtype"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_descs" v-model="M_AR_InvoiceD.descs"  ref="ref_descs"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnjournaltypeChange" :prop="PI_journaltype" v-model="M_AR_InvoiceD.journaltype"  ref="ref_journaltype" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnbillingmethodChange" :prop="PI_billingmethod" v-model="M_AR_InvoiceD.billingmethod"  ref="ref_billingmethod" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OntermspaymentChange" :prop="PI_termspayment" v-model="M_AR_InvoiceD.termspayment"  ref="ref_termspayment" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnamortizestatusChange" :prop="PI_amortizestatus" v-model="M_AR_InvoiceD.amortizestatus"  ref="ref_amortizestatus" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputDateVuex @input="OntrxdatefromChange" :prop="PI_trxdatefrom" v-model="M_AR_InvoiceD.trxdatefrom"  ref="ref_trxdatefrom" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_amortizemonthlyamt" v-model="M_AR_InvoiceD.amortizemonthlyamt"  ref="ref_amortizemonthlyamt"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_trxamt" v-model="M_AR_InvoiceD.trxamt"  ref="ref_trxamt"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OntaxcdChange" :prop="PI_taxcd" :value="M_AR_InvoiceD.taxcd" :label="M_AR_InvoiceD.taxcdLabel" ref="ref_taxcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnincludediscountChange" :prop="PI_includediscount" v-model="M_AR_InvoiceD.includediscount"  ref="ref_includediscount" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OndiscountcdChange" :prop="PI_discountcd" :value="M_AR_InvoiceD.discountcd" :label="M_AR_InvoiceD.discountcdLabel" ref="ref_discountcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_discountamt" v-model="M_AR_InvoiceD.discountamt"  ref="ref_discountamt"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_amountafterdisc" v-model="M_AR_InvoiceD.amountafterdisc"  ref="ref_amountafterdisc"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_netamt" v-model="M_AR_InvoiceD.netamt"  ref="ref_netamt"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_vatamt" v-model="M_AR_InvoiceD.vatamt"  ref="ref_vatamt"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_totalamt" v-model="M_AR_InvoiceD.totalamt"  ref="ref_totalamt"/>
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
			Module:"CM",
            propList: {
                initialWhere:"JournalCategory = '" + this.ValKey + "'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_AR_InvoiceD :{
                subportfoliocd: this.getDataUser().subportfolio_cd,
                debitno: '',
                billingsequenceno: 0,
                debitsequenceno: 0,
                trxtype: '',
                descs: '',
                taxcd: '',
                journaltype: 'I',
                billingmethod: 'F',
                termspayment: 'I',
                amortizestatus: 'M',
                trxdatefrom: '',
                trxdateto: '',
                includediscount: 'Y',
                discountcd: '',
                discountamt: '0',
                trxamt: '0',
                netamt: '',
                vatamt: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                journalcategory: '',
                trxtypedescs: '',
                taxdescs: '',
                category: '',
                discountdescs: '',
                defaultamortizedatefrom: '',
                amortizemonthlyamt: '0',
                lastupdatestamp: 0,
                rowid: 0
                    }
            ,
            PI_trxtype: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMTransTypeBySubPortfolio'    , 
                    ColumnDB: 'TrxType'   , 
                    InitialWhere: "SUBPORTFOLIOCD = '"+this.getDataUser().subportfolio_cd+"' AND MODULECD = @MODULECD"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
                cName: 'trxtype', 
                cLabel: 'Trans. Type', 
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
                cMasterUrl: 'AR/AR_TransactionTypeSubPortfolioMaintenance' ,
                cDisplayColumn: 'TrxType,Descs' ,
            }, 
            PI_descs: { 
                cValidate :'', 
                cName: 'descs', 
                cLabel: 'Description', 
                cLabelSize: 4, 
                cOrder: 2, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_journaltype: { 
                cValidate :'', 
                cName: 'journaltype', 
                cId: 'rdbjournaltype', 
                cRadioOptions: [{ text: 'Income', value: 'I' }, { text: 'Deffered', value: 'D' }], 
                cRadioDefaultOption: 'I', 
                cLabel:'		Journal Type', 
                cLabelSize: 4, 
                cOrder: 3, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_billingmethod: { 
                cValidate :'', 
                cName: 'billingmethod', 
                cId: 'rdbbillingmethod', 
                cRadioOptions: [{ text: 'Full Month', value: 'F' }, { text: 'Cut-Off Date', value: 'C' }], 
                cRadioDefaultOption: 'F', 
                cLabel:'Amortize Method', 
                cLabelSize: 4, 
                cOrder: 4, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_termspayment: { 
                cValidate :'', 
                cName: 'termspayment', 
                cId: 'rdbtermspayment', 
                cRadioOptions: [{ text: 'In Advance', value: 'I' }, { text: 'In Arrear', value: 'A' }], 
                cRadioDefaultOption: 'I', 
                cLabel:'Terms of Payment', 
                cLabelSize: 4, 
                cOrder: 5, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_amortizestatus: { 
                cValidate :'', 
                cName: 'amortizestatus', 
                cId: 'rdbamortizestatus', 
                cRadioOptions: [{ text: 'Manual', value: 'M' }, { text: 'Auto', value: 'A' }], 
                cRadioDefaultOption: 'M', 
                cLabel:'Amortize Status', 
                cLabelSize: 4, 
                cOrder: 6, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_trxdatefrom: { 
                cValidate :'required', 
                cName: 'trxdatefrom', 
                cLabel: 'Amortize Date From', 
                cLabelSize: 4, 
                cOrder: 7, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_amortizemonthlyamt: { 
                cValidate :'required', 
                cName: 'amortizemonthlyamt', 
                cLabel: 'Amortize Monthly Amount', 
                cLabelSize: 4, 
                cOrder: 8, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_trxamt: { 
                cValidate :'required', 
                cName: 'trxamt', 
                cLabel: 'Trans. Amount', 
                cLabelSize: 4, 
                cOrder: 9, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_taxcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMTaxCode'    , 
                    ColumnDB: 'TaxCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
                cName: 'taxcd', 
                cLabel: 'Tax', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 10, 
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
                cMasterUrl: 'CM/CM_TaxMaster' ,
                cDisplayColumn: 'TaxCd, Descs' ,
            }, 
            PI_includediscount: { 
                cValidate :'', 
                cName: 'includediscount', 
                cId: 'rdbincludediscount', 
                cRadioOptions: [{ text: 'Yes', value: 'Y' }, { text: 'No', value: 'N' }], 
                cRadioDefaultOption: 'Y', 
                cLabel:'Include Discount', 
                cLabelSize: 4, 
                cOrder: 11, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_discountcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMDiscount'    , 
                    ColumnDB: 'DiscountCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'discountcd', 
                cLabel: 'Discount Code', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 12, 
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
                cMasterUrl: 'CM/CM_Discount' ,
                cDisplayColumn: 'DiscountCd,Descs' ,
            }, 
            PI_discountamt: { 
                cValidate :'required', 
                cName: 'discountamt', 
                cLabel: 'Discount Amount', 
                cLabelSize: 4, 
                cOrder: 13, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_amountafterdisc: { 
                cLabel: 'Amount After Discount', 
                cLabelSize: 4, 
                cValue: '', 
                cType: 'decimal',
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_netamt: { 
                cLabel: 'Net Amount', 
                cLabelSize: 4, 
                cValue: '', 
                cType: 'decimal',
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_vatamt: { 
                cLabel: 'VAT Amount', 
                cLabelSize: 4, 
                cValue: '', 
                cType: 'decimal',
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_totalamt: { 
                cLabel: 'Total Amount', 
                cLabelSize: 4, 
                cValue: '', 
                cType: 'decimal',
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
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
    },
	DataRow(){
		return this.$store.getters.GetPage2Data
	},
    DataRowPage1(){
		return this.$store.getters.GetPage1Data
	}
  },
    methods: {
        OntrxtypeChange (data) {
        this.$nextTick(() => {
            this.M_AR_InvoiceD.trxtype = data.id
            this.M_AR_InvoiceD.trxtypeLabel = data.label
            if (this.inputStatus != "VIEW") {
//{trxtype}
            }
        })
        this.$forceUpdate()
        },
        OnjournaltypeChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{journaltype}
            }
        })
        this.$forceUpdate()
        },
        OnbillingmethodChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{billingmethod}
            }
        })
        this.$forceUpdate()
        },
        OntermspaymentChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{termspayment}
            }
        })
        this.$forceUpdate()
        },
        OnamortizestatusChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{amortizestatus}
            }
        })
        this.$forceUpdate()
        },
        OntrxdatefromChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{trxdatefrom}
            }
        })
        this.$forceUpdate()
        },
        OntaxcdChange (data) {
        this.$nextTick(() => {
            this.M_AR_InvoiceD.taxcd = data.id
            this.M_AR_InvoiceD.taxcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{taxcd}
            }
        })
        this.$forceUpdate()
        },
        OnincludediscountChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{includediscount}
            }
        })
        this.$forceUpdate()
        },
        OndiscountcdChange (data) {
        this.$nextTick(() => {
            this.M_AR_InvoiceD.discountcd = data.id
            this.M_AR_InvoiceD.discountcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{discountcd}
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
            this.M_AR_InvoiceD.journalcategory = data.JournalCategory 
            this.propList.initialWhere =" JournalCategory = '" + data.JournalCategory + "' "
        

            this.FormToABSList().doGetList('','eb_getList')
        },		       
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                DebitNo: this.M_AR_InvoiceD.debitno,
                TrxType: this.M_AR_InvoiceD.trxtype == '' || this.M_AR_InvoiceD.trxtype == null ? 'NULL' : this.M_AR_InvoiceD.trxtype ,
                ModuleCd: this.M_AR_InvoiceD.modulecd,
                Descs: this.M_AR_InvoiceD.descs,
                TaxCd: this.M_AR_InvoiceD.taxcd == '' || this.M_AR_InvoiceD.taxcd == null ? 'NULL' : this.M_AR_InvoiceD.taxcd ,
                JournalType: this.ARFieldHelper.JOURNAL_TYPE_INCOME,
                AmortizeStatus: this.ARFieldHelper.AMORTIZE_STATUS_MANUAL,
                BillingMethod: this.ARFieldHelper.BILLING_METHOD_FULL_MONTH,
                TermsPayment: this.ARFieldHelper.TERMS_PAYMENT_IN_ARREAR,
                TrxDateFrom: this.M_AR_InvoiceD.trxdatefrom == '' || this.M_AR_InvoiceD.trxdatefrom == null ? 'NULL' : this.M_AR_InvoiceD.trxdatefrom ,
                TrxDateTo: this.M_AR_InvoiceD.trxdateto,
                AmortizeMonthlyAmt: this.M_AR_InvoiceD.amortizemonthlyamt ? this.replaceAllString(this.M_AR_InvoiceD.amortizemonthlyamt,',','','number') : 0 ,
                IncludeDiscount: this.M_AR_InvoiceD.includediscount,
                DiscountCd: this.M_AR_InvoiceD.discountcd == '' || this.M_AR_InvoiceD.discountcd == null ? 'NULL' : this.M_AR_InvoiceD.discountcd ,
                DiscountAmt: this.M_AR_InvoiceD.discountamt ? this.replaceAllString(this.M_AR_InvoiceD.discountamt,',','','number') : 0 ,
                TrxAmt: this.M_AR_InvoiceD.trxamt ? this.replaceAllString(this.M_AR_InvoiceD.trxamt,',','','number') : 0 ,
                UserInput: this.getDataUser().user_id ,
                BillingSequenceNo: this.M_AR_InvoiceD.billingsequenceno                
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
                DebitNo: this.M_AR_InvoiceD.debitno,
                DebitSequenceNo: this.M_AR_InvoiceD.debitsequenceno,
                TrxType: this.M_AR_InvoiceD.trxtype == '' || this.M_AR_InvoiceD.trxtype == null ? 'NULL' : this.M_AR_InvoiceD.trxtype ,
                ModuleCd: this.M_AR_InvoiceD.modulecd,
                Descs: this.M_AR_InvoiceD.descs,
                TaxCd: this.M_AR_InvoiceD.taxcd == '' || this.M_AR_InvoiceD.taxcd == null ? 'NULL' : this.M_AR_InvoiceD.taxcd ,
                JournalType: this.ARFieldHelper.JOURNAL_TYPE_INCOME,
                AmortizeStatus: this.ARFieldHelper.AMORTIZE_STATUS_MANUAL,
                BillingMethod: this.ARFieldHelper.BILLING_METHOD_FULL_MONTH,
                TermsPayment: this.ARFieldHelper.TERMS_PAYMENT_IN_ARREAR,
                TrxDateFrom: this.M_AR_InvoiceD.trxdatefrom == '' || this.M_AR_InvoiceD.trxdatefrom == null ? 'NULL' : this.M_AR_InvoiceD.trxdatefrom ,
                TrxDateTo: this.M_AR_InvoiceD.trxdateto,
                AmortizeMonthlyAmt: this.M_AR_InvoiceD.amortizemonthlyamt ? this.replaceAllString(this.M_AR_InvoiceD.amortizemonthlyamt,',','','number') : 0 ,
                IncludeDiscount: this.M_AR_InvoiceD.includediscount,
                DiscountCd: this.M_AR_InvoiceD.discountcd == '' || this.M_AR_InvoiceD.discountcd == null ? 'NULL' : this.M_AR_InvoiceD.discountcd ,
                DiscountAmt: this.M_AR_InvoiceD.discountamt ? this.replaceAllString(this.M_AR_InvoiceD.discountamt,',','','number') : 0 ,
                TrxAmt: this.M_AR_InvoiceD.trxamt ? this.replaceAllString(this.M_AR_InvoiceD.trxamt,',','','number') : 0 ,
                UserEdit: this.getDataUser().user_id ,
                LastUpdateStamp: this.M_AR_InvoiceD.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_AR_InvoiceD = {
                subportfoliocd: this.getDataUser().subportfolio_cd,
                debitno: '',
                billingsequenceno: 0,
                debitsequenceno: 0,
                trxtype: '',
                descs: '',
                taxcd: '',
                journaltype: 'I',
                billingmethod: 'F',
                termspayment: 'I',
                amortizestatus: 'M',
                trxdatefrom: '',
                trxdateto: '',
                includediscount: 'Y',
                discountcd: '',
                discountamt: '0',
                trxamt: '0',
                netamt: '',
                vatamt: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                journalcategory: '',
                trxtypedescs: '',
                taxdescs: '',
                category: '',
                discountdescs: '',
                defaultamortizedatefrom: '',
                amortizemonthlyamt: '0',
                lastupdatestamp: 0,
                rowid: 0
                    }
            		
		},
        M_New(){
            let data = this.$store.getters.GetPage1Data
            this.M_AR_InvoiceD.journalcategory = data.JournalCategory 

            this.$refs.ref_trxtype.focus()

        },
        M_Edit(){
          this.$refs.ref_trxtype.focus()
        },
        M_Delete(dt){           

            var data = this.FormToABSList().getRowSelected()  
            var dataDelete = []

            
            data.forEach((value) => {
            dataDelete.push({
            DebitSequenceNo: value.DebitSequenceNo,
            UserEdit: this.getDataUser().user_id,
            LastUpdateStamp: value.LastUpdateStamp,
            _Message_: ""
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
,                debitsequenceno: record.DebitSequenceNo,
                debitno: record.DebitNo,
                journalcategory: record.JournalCategory				
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
this.M_AR_InvoiceD = {
                subportfoliocd: data.subportfoliocd,
                debitno: data.debitno,
                billingsequenceno: data.billingsequenceno,
                debitsequenceno: data.debitsequenceno,
                trxtype: data.trxtype,
                descs: data.descs,
                taxcd: data.taxcd,
                journaltype: data.journaltype,
                billingmethod: data.billingmethod,
                termspayment: data.termspayment,
                amortizestatus: data.amortizestatus,
                trxdatefrom: data.trxdatefrom,
                trxdateto: data.trxdateto,
                includediscount: data.includediscount,
                discountcd: data.discountcd,
                discountamt: data.discountamt,
                trxamt: data.trxamt,
                netamt: data.netamt,
                vatamt: data.vatamt,
                userinput: data.userinput,
                useredit: data.useredit,
                journalcategory: data.journalcategory,
                trxtypedescs: data.trxtypedescs,
                taxdescs: data.taxdescs,
                category: data.category,
                discountdescs: data.discountdescs,
                defaultamortizedatefrom: data.defaultamortizedatefrom,
                amortizemonthlyamt: data.amortizemonthlyamt,
                lastupdatestamp: record.LastUpdateStamp,
                rowid: data.rowid
                    }
                 

                this.M_AR_InvoiceD.trxtypeLabel = this.M_AR_InvoiceD.trxtype != null ? data.trxtype + this.separator  :'' 
                this.M_AR_InvoiceD.taxcdLabel = this.M_AR_InvoiceD.taxcd != null ? data.taxcd + this.separator  :'' 
                this.M_AR_InvoiceD.discountcdLabel = this.M_AR_InvoiceD.discountcd != null ? data.discountcd + this.separator  :'' 
  

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

