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
                                        <ABSInputSelectList @change="OntrxtypeChange" :prop="PI_trxtype" :value="M_SM_TokenPurchase.trxtype" :label="M_SM_TokenPurchase.trxtypeLabel" ref="ref_trxtype"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnbankcdChange" :prop="PI_bankcd" :value="M_SM_TokenPurchase.bankcd" :label="M_SM_TokenPurchase.bankcdLabel" ref="ref_bankcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_paymentno" v-model="M_SM_TokenPurchase.paymentno"  ref="ref_paymentno"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_currencycd" v-model="M_SM_TokenPurchase.currencycd"  ref="ref_currencycd"/>
                                      </b-col>
                                       </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputDateVuex :prop="PI_paymentdate" v-model="M_SM_TokenPurchase.paymentdate"  ref="ref_paymentdate"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_currencyrate" v-model="M_SM_TokenPurchase.currencyrate"  ref="ref_currencyrate"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_referenceno" v-model="M_SM_TokenPurchase.referenceno"  ref="ref_referenceno"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_trxamt" v-model="M_SM_TokenPurchase.trxamt"  ref="ref_trxamt"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_descs" v-model="M_SM_TokenPurchase.descs"  ref="ref_descs"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_bankchargesamt" v-model="M_SM_TokenPurchase.bankchargesamt"  ref="ref_bankchargesamt"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnpaymentcdChange" :prop="PI_paymentcd" :value="M_SM_TokenPurchase.paymentcd" :label="M_SM_TokenPurchase.paymentcdLabel" ref="ref_paymentcd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OncontactidChange" :prop="PI_contactid" :value="M_SM_TokenPurchase.contactid" :label="M_SM_TokenPurchase.contactidLabel" ref="ref_contactid"/>
                                      </b-col>
                                    </b-row>
                                    <div class="div-collapse">
                                        <span class="master-span-form">
                                            Cheque / Reference No
                                        </span>
                                    </div>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_custacno" v-model="M_SM_TokenPurchase.custacno"  ref="ref_custacno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_chequereferenceno" v-model="M_SM_TokenPurchase.chequereferenceno"  ref="ref_chequereferenceno"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputDateVuex @input="OnchequereferencedateChange" :prop="PI_chequereferencedate" v-model="M_SM_TokenPurchase.chequereferencedate"  ref="ref_chequereferencedate" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_issuedbank" v-model="M_SM_TokenPurchase.issuedbank"  ref="ref_issuedbank"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputDateVuex @input="OnchequeduedateChange" :prop="PI_chequeduedate" v-model="M_SM_TokenPurchase.chequeduedate"  ref="ref_chequeduedate" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_SM_TokenPurchase.remarks"  ref="ref_remarks" />
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
		FormType: "ListProcess",
		Module:"SM",
            propList: {
                initialWhere: "Source='D' AND Status='New' AND SubPortfolioCd='"+this.getDataUser().subportfolio_cd+"'" ,
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   

            MobileAuctionTokenAmt: '',
            SpecTrue: false,

            M_SM_TokenPurchase :{
                subportfoliocd: this.getDataUser().subportfolio_cd,
                contactid: '',
                batchno: '',
                source: '',
                runningcd: '',
                trxtype: '',
                modulecd: '',
                paymentdate: '',
                descs: '',
                debtorcd: '',
                debtorname: '',
                paymentcategory: '',
                paymentno: '',
                documentcount: '',
                batchtotal: '',
                batchstatus: '',
                paymentcd: '',
                bankcd: '',
                currencycd: '',
                currencyrate: '0',
                taxrate: '',
                originalcurrencyrate: '',
                trxamt: '0',
                netamt: '',
                withholdingamt: '',
                vatamt: '',
                totalamt: '',
                underpaymentamt: '',
                bankchargesamt: '0',
                chequereferenceno: '',
                chequereferencedate: '',
                chequeduedate: '',
                issuedbank: '',
                remarks: '',
                taxcurrencyrate: '',
                trxtypedescs: '',
                paymentdescs: '',
                paymenttype: '',
                bankname: '',
                runningdescs: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                lastupdatestamp: 0,
                currentbatchtotal: '',
                currentdocumentcount: '',
                referenceno: '',
                lotno: '',
                lotdescs: '',
                unitcount: 0,
                contactname: '',
                custacno: ''
                    }
            ,
            PI_batchno: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCBBatch'    , 
                    ColumnDB: 'BatchNo'   , 
                    InitialWhere: "SUBPORTFOLIOCD='"+this.getDataUser().subportfolio_cd+"'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'batchno', 
                cLabel: '', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 0, 
                cTriggered: false, 
                cDefault: '', 
                cProtect: false, 
                cVisible:  false, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cStatic: false, 
                cOption: [], 
                cMasterUrl: 'CB/CB_BatchMaster' ,
                cDisplayColumn: 'BatchNo,DocumentCount' ,
            }, 
            PI_documentcount: { 
                cLabel: 'Doc. Count', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: false 
            }, 
            PI_batchtotal: { 
                cLabel: 'Batch Total', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: false 
            }, 
            PI_batchtotal: { 
                cValidate :'', 
                cName: 'batchtotal', 
                cLabel: '', 
                cLabelSize: 4, 
                cOptions: [], 
                cOrder: 0, 
                cKey: false, 
                cVisible: false, 
                cProtect: false, 
                cDefault: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_currentdocumentcount: { 
                cLabel: 'Curr. Doc. Count', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: false 
            }, 
            PI_currentbatchtotal: { 
                cLabel: 'Curr. Batch Total', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: false 
            }, 
            PI_trxtype: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMTransTypeBySubPortfolio'    , 
                    ColumnDB: 'TrxType'   , 
                    InitialWhere: "SUBPORTFOLIOCD = '"+this.getDataUser().subportfolio_cd+"' AND MODULECD = 'CB' AND TrxClass = 'T' and Status='A'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
                cName: 'trxtype', 
                cLabel: 'Trans. Type', 
                cKey: true, 
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
                cMasterUrl: 'CB/CB_SubPortofolioTransType' ,
                cDisplayColumn: 'TrxType,Descs' ,
            }, 
            PI_bankcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCBBank'    , 
                    ColumnDB: 'BankCd'   , 
                    InitialWhere: "SubPortfolioCd='" +this.getDataUser().subportfolio_cd+ "' And STATUS = 'A'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
                cName: 'bankcd', 
                cLabel: 'Bank ', 
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
                cMasterUrl: 'CB/CB_Bank' ,
                cDisplayColumn: 'BankCd,ContactId' ,
            }, 
            PI_paymentno: { 
                cValidate :'required|max:20', 
                cName: 'paymentno', 
                cLabel: 'Token No', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_currencycd: { 
                cValidate :'', 
                cName: 'currencycd', 
                cLabel: 'Currency', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_paymentdate: { 
                cValidate :'required', 
                cName: 'paymentdate', 
                cLabel: 'Token Date ', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false,
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_currencyrate: { 
                cValidate :'required|greater:1', 
                cName: 'currencyrate', 
                cLabel: 'Currency Rate ', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_referenceno: { 
                cValidate :'max:20', 
                cName: 'referenceno', 
                cLabel: 'Reference No', 
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
            PI_trxamt: { 
                cValidate :'', 
                cName: 'trxamt', 
                cLabel: 'Trans. Amount', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_descs: { 
                cValidate :'max:150', 
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
            PI_bankchargesamt: { 
                cValidate :'', 
                cName: 'bankchargesamt', 
                cLabel: 'Bank Charges', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_debtorcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupARDebtor'    , 
                    ColumnDB: 'DebtorCd'   , 
                    InitialWhere: "SUBPORTFOLIOCD='"+this.getDataUser().subportfolio_cd+"'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'debtorcd', 
                cLabel: 'Debtor Code', 
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
                cMasterUrl: 'AR/AR_Debtor' ,
                cDisplayColumn: 'DebtorCd,DebtorName' ,
            }, 
            PI_lotno: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupTNLot'    , 
                    ColumnDB: 'LotNo'   , 
                    InitialWhere: "SUBPORTFOLIOCD = '"+this.getDataUser().subportfolio_cd+"'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'lotno', 
                cLabel: 'Unit', 
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
                cDisplayColumn: 'LotNo,LotType' ,
            }, 
            PI_paymentcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMPaymentType'    , 
                    ColumnDB: 'PaymentCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
                cName: 'paymentcd', 
                cLabel: 'Payment Type ', 
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
                cMasterUrl: 'CM/CM_PaymentType' ,
                cDisplayColumn: 'PaymentCd,Descs' ,
            }, 
            PI_unitcount: { 
                cLabel: '', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: false 
            }, 
            PI_contactid: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupContactID'    , 
                    ColumnDB: 'ContactID'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  ,
                    ParamView: "'"+ this.getDataUser().subportfolio_cd +"'"
                        }, 
                cValidate :'', 
                cName: 'contactid', 
                cLabel: 'Participant ID', 
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
                cDisplayColumn: 'ContactId,Name' ,
            }, 
            PI_custacno: { 
                cValidate :'', 
                cName: 'custacno', 
                cLabel: 'Customer Bank A/C', 
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
            PI_chequereferenceno: { 
                cValidate :'max:20', 
                cName: 'chequereferenceno', 
                cLabel: 'Cheque / Ref. No', 
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
            PI_chequereferencedate: { 
                cValidate :'', 
                cName: 'chequereferencedate', 
                cLabel: 'Cheque / Ref Date', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_issuedbank: { 
                cValidate :'max:30', 
                cName: 'issuedbank', 
                cLabel: 'Issue Bank', 
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
            PI_chequeduedate: { 
                cValidate :'', 
                cName: 'chequeduedate', 
                cLabel: 'Due Date', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cVisible:  true, 
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
		return this.$store.getters.GetPage1Data
	}
  },
    methods: {		
        OnbatchnoChange (data) {
        this.$nextTick(() => {
            this.M_SM_TokenPurchase.batchno = data.id
            this.M_SM_TokenPurchase.batchnoLabel = data.label
            if (this.inputStatus != "VIEW") {
//{batchno}
            }
        })
        this.$forceUpdate()
        },
        OnbatchtotalChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{batchtotal}
            }
        })
        this.$forceUpdate()
        },
        OntrxtypeChange (data) {
        this.$nextTick(() => {
            this.M_SM_TokenPurchase.trxtype = data.id
            this.M_SM_TokenPurchase.trxtypeLabel = data.label
            if (this.inputStatus != "VIEW") {
        this.FnGetTrxTypeData(this.getDataUser().subportfolio_cd, 'CB', data.id).then(dt => {
                if (dt != null) { 
                  var dta = dt[0]
                  console.log(dta)
                  this.M_SM_TokenPurchase.runningcd = dta.RunningCd
                  this.M_SM_TokenPurchase.trxtypeLabel = data.id + this.separator + dta.TrxTypeDescs
                //   this.M_SM_TokenPurchase.descs = dta.TrxTypeDescs
                  this.M_SM_TokenPurchase.bankcd = dta.DefaultBankCd
                  this.M_SM_TokenPurchase.bankcdLabel = dta.DefaultBankCd && dta.DefaultBankCd != "" ? dta.DefaultBankCd + this.separator : ""

                  if (this.inputStatus != "EDIT") {
                    if (dta.RunningCd != '') {
                      this.M_SM_TokenPurchase.paymentno = "(auto)"
                      this.PI_paymentno.cProtect = true
                    }
                    else {
                      this.M_SM_TokenPurchase.paymentno = ""
                      this.PI_paymentno.cProtect = false
                    }
                  }
                  

            }
        })
        this.$forceUpdate()
        }
        })
        },
        OnbankcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_TokenPurchase.bankcd = data.id
            this.M_SM_TokenPurchase.bankcdLabel = data.label
            if (this.inputStatus != "VIEW") {

                this.GetBankCurrencyCd (data)
//{bankcd}
            }
        })
        this.$forceUpdate()
        },
        OndebtorcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_TokenPurchase.debtorcd = data.id
            this.M_SM_TokenPurchase.debtorcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{debtorcd}
            }
        })
        this.$forceUpdate()
        },
        OnlotnoChange (data) {
        this.$nextTick(() => {
            this.M_SM_TokenPurchase.lotno = data.id
            this.M_SM_TokenPurchase.lotnoLabel = data.label
            if (this.inputStatus != "VIEW") {
//{lotno}
            }
        })
        this.$forceUpdate()
        },
        OnpaymentcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_TokenPurchase.paymentcd = data.id
            this.M_SM_TokenPurchase.paymentcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{paymentcd}
            }
        })
        this.$forceUpdate()
        },
        OncontactidChange (data) {
        this.$nextTick(() => {
            this.M_SM_TokenPurchase.contactid = data.id
            this.M_SM_TokenPurchase.contactidLabel = data.label
            if (this.inputStatus != "VIEW") {
//{contactid}
            }
        })
        this.$forceUpdate()
        },
        OnchequereferencedateChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{chequereferencedate}
            }
        })
        this.$forceUpdate()
        },
        OnchequeduedateChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{chequeduedate}
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
        },		
        M_Post(dt) {
            var data = this.FormToABSList().getRowSelected()
            var dataPost = []
            
            data.forEach((value) => {
                // dt = dt + value.row_id + ','
                dataPost.push({
                    _Message_ : "Payment No = "+value.PaymentNo,
                    SubPortfolioCd : this.getDataUser().subportfolio_cd,
                    PaymentNo: value.PaymentNo,
                    UserEdit:this.getDataUser().user_id,
                    Source: value.Source
                })
            })

            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: 0,
                Data:dataPost
            }

            this.postJSONMulti(this.getUrlPostMulti(), param).then(response => {
                if (response == null) return
                this.$parent.resultPost()

            })

        },
        M_Insert() {
            // console.log(this.M_SM_TokenPurchase)
            if (this.M_SM_TokenPurchase.runningcd != "") {
            this.FnGenerateRunningCode(
              this.getDataUser().subportfolio_cd,
              this.M_SM_TokenPurchase.runningcd,
              this.getDataUser().user_id,
              this.M_SM_TokenPurchase.paymentdate
            ).then(dt => {
              if (dt == null) return

              this.M_SM_TokenPurchase.paymentno = dt.RunningCode
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                ContactID: this.M_SM_TokenPurchase.contactid == '' || this.M_SM_TokenPurchase.contactid == null ? '' : this.M_SM_TokenPurchase.contactid ,
                TrxType: this.M_SM_TokenPurchase.trxtype == '' || this.M_SM_TokenPurchase.trxtype == null ? 'NULL' : this.M_SM_TokenPurchase.trxtype ,
                PaymentNo: this.M_SM_TokenPurchase.paymentno,
                BatchNo: this.M_SM_TokenPurchase.batchno == '' || this.M_SM_TokenPurchase.batchno == null ? 'NULL' : this.M_SM_TokenPurchase.batchno ,
                EntryType: this.M_SM_TokenPurchase.entrytype,
                PaymentCategory: this.M_SM_TokenPurchase.paymentcategory,
                PaymentDate: this.M_SM_TokenPurchase.paymentdate,
                Descs: this.M_SM_TokenPurchase.descs,
                DebtorCd: this.M_SM_TokenPurchase.debtorcd == '' || this.M_SM_TokenPurchase.debtorcd == null ? 'NULL' : this.M_SM_TokenPurchase.debtorcd ,
                PaymentCd: this.M_SM_TokenPurchase.paymentcd == '' || this.M_SM_TokenPurchase.paymentcd == null ? 'NULL' : this.M_SM_TokenPurchase.paymentcd ,
                BankCd: this.M_SM_TokenPurchase.bankcd == '' || this.M_SM_TokenPurchase.bankcd == null ? 'NULL' : this.M_SM_TokenPurchase.bankcd ,
                CurrencyCd: this.M_SM_TokenPurchase.currencycd,
                CurrencyRate: this.M_SM_TokenPurchase.currencyrate ? this.replaceAllString(this.M_SM_TokenPurchase.currencyrate,',','','number') : 0 ,
                TaxCurrencyRate: this.M_SM_TokenPurchase.taxcurrencyrate,
                TrxAmt: this.M_SM_TokenPurchase.trxamt ? this.replaceAllString(this.M_SM_TokenPurchase.trxamt,',','','number') : 0 ,
                BankChargesAmt: this.M_SM_TokenPurchase.bankchargesamt ? this.replaceAllString(this.M_SM_TokenPurchase.bankchargesamt,',','','number') : 0 ,
                ChequeReferenceNo: this.M_SM_TokenPurchase.chequereferenceno,
                ChequeReferenceDate: this.M_SM_TokenPurchase.chequereferencedate == '' || this.M_SM_TokenPurchase.chequereferencedate == null ? 'NULL' : this.M_SM_TokenPurchase.chequereferencedate ,
                ChequeDueDate: this.M_SM_TokenPurchase.chequeduedate == '' || this.M_SM_TokenPurchase.chequeduedate == null ? 'NULL' : this.M_SM_TokenPurchase.chequeduedate ,
                IssuedBank: this.M_SM_TokenPurchase.issuedbank,
                Remarks: this.M_SM_TokenPurchase.remarks,
                UserInput: this.getDataUser().user_id ,
                ReferenceNo: this.M_SM_TokenPurchase.referenceno,
                LotNo: this.M_SM_TokenPurchase.lotno == '' || this.M_SM_TokenPurchase.lotno == null ? 'NULL' : this.M_SM_TokenPurchase.lotno                 
            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return

				//kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultInsert(response.Message)
					
				
                })
           })
        }
        else {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                ContactID: this.M_SM_TokenPurchase.contactid == '' || this.M_SM_TokenPurchase.contactid == null ? '' : this.M_SM_TokenPurchase.contactid ,
                TrxType: this.M_SM_TokenPurchase.trxtype == '' || this.M_SM_TokenPurchase.trxtype == null ? 'NULL' : this.M_SM_TokenPurchase.trxtype ,
                PaymentNo: this.M_SM_TokenPurchase.paymentno,
                BatchNo: this.M_SM_TokenPurchase.batchno == '' || this.M_SM_TokenPurchase.batchno == null ? 'NULL' : this.M_SM_TokenPurchase.batchno ,
                EntryType: this.M_SM_TokenPurchase.entrytype,
                PaymentCategory: this.M_SM_TokenPurchase.paymentcategory,
                PaymentDate: this.M_SM_TokenPurchase.paymentdate,
                Descs: this.M_SM_TokenPurchase.descs,
                DebtorCd: this.M_SM_TokenPurchase.debtorcd == '' || this.M_SM_TokenPurchase.debtorcd == null ? 'NULL' : this.M_SM_TokenPurchase.debtorcd ,
                PaymentCd: this.M_SM_TokenPurchase.paymentcd == '' || this.M_SM_TokenPurchase.paymentcd == null ? 'NULL' : this.M_SM_TokenPurchase.paymentcd ,
                BankCd: this.M_SM_TokenPurchase.bankcd == '' || this.M_SM_TokenPurchase.bankcd == null ? 'NULL' : this.M_SM_TokenPurchase.bankcd ,
                CurrencyCd: this.M_SM_TokenPurchase.currencycd,
                CurrencyRate: this.M_SM_TokenPurchase.currencyrate ? this.replaceAllString(this.M_SM_TokenPurchase.currencyrate,',','','number') : 0 ,
                TaxCurrencyRate: this.M_SM_TokenPurchase.taxcurrencyrate,
                TrxAmt: this.M_SM_TokenPurchase.trxamt ? this.replaceAllString(this.M_SM_TokenPurchase.trxamt,',','','number') : 0 ,
                BankChargesAmt: this.M_SM_TokenPurchase.bankchargesamt ? this.replaceAllString(this.M_SM_TokenPurchase.bankchargesamt,',','','number') : 0 ,
                ChequeReferenceNo: this.M_SM_TokenPurchase.chequereferenceno,
                ChequeReferenceDate: this.M_SM_TokenPurchase.chequereferencedate == '' || this.M_SM_TokenPurchase.chequereferencedate == null ? 'NULL' : this.M_SM_TokenPurchase.chequereferencedate ,
                ChequeDueDate: this.M_SM_TokenPurchase.chequeduedate == '' || this.M_SM_TokenPurchase.chequeduedate == null ? 'NULL' : this.M_SM_TokenPurchase.chequeduedate ,
                IssuedBank: this.M_SM_TokenPurchase.issuedbank,
                Remarks: this.M_SM_TokenPurchase.remarks,
                UserInput: this.getDataUser().user_id ,
                ReferenceNo: this.M_SM_TokenPurchase.referenceno,
                LotNo: this.M_SM_TokenPurchase.lotno == '' || this.M_SM_TokenPurchase.lotno == null ? 'NULL' : this.M_SM_TokenPurchase.lotno                 
            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return

				//kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultInsert(response.Message)
					
				
            })
      }

        },
        M_Update() {
          // console.log(this.M_SM_TokenPurchase)
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                ContactID: this.M_SM_TokenPurchase.contactid == '' || this.M_SM_TokenPurchase.contactid == null ? '' : this.M_SM_TokenPurchase.contactid ,
                BatchNo: this.M_SM_TokenPurchase.batchno == '' || this.M_SM_TokenPurchase.batchno == null ? 'NULL' : this.M_SM_TokenPurchase.batchno ,
                EntryType: 'D',
                TrxType: this.M_SM_TokenPurchase.trxtype == '' || this.M_SM_TokenPurchase.trxtype == null ? 'NULL' : this.M_SM_TokenPurchase.trxtype ,
                PaymentNo: this.M_SM_TokenPurchase.paymentno,
                PaymentDate: this.M_SM_TokenPurchase.paymentdate,
                Descs: this.M_SM_TokenPurchase.descs,
                DebtorCd: this.M_SM_TokenPurchase.debtorcd == '' || this.M_SM_TokenPurchase.debtorcd == null ? 'NULL' : this.M_SM_TokenPurchase.debtorcd ,
                TrxAmt: this.M_SM_TokenPurchase.trxamt ? this.replaceAllString(this.M_SM_TokenPurchase.trxamt,',','','number') : 0 ,
                BankChargesAmt: this.M_SM_TokenPurchase.bankchargesamt ? this.replaceAllString(this.M_SM_TokenPurchase.bankchargesamt,',','','number') : 0 ,
                PaymentCd: this.M_SM_TokenPurchase.paymentcd == '' || this.M_SM_TokenPurchase.paymentcd == null ? 'NULL' : this.M_SM_TokenPurchase.paymentcd ,
                BankCd: this.M_SM_TokenPurchase.bankcd == '' || this.M_SM_TokenPurchase.bankcd == null ? 'NULL' : this.M_SM_TokenPurchase.bankcd ,
                CurrencyCd: this.M_SM_TokenPurchase.currencycd,
                CurrencyRate: this.M_SM_TokenPurchase.currencyrate ? this.replaceAllString(this.M_SM_TokenPurchase.currencyrate,',','','number') : 0 ,
                TaxCurrencyRate: '0',
                ChequeReferenceNo: this.M_SM_TokenPurchase.chequereferenceno,
                ChequeReferenceDate: this.M_SM_TokenPurchase.chequereferencedate == '' || this.M_SM_TokenPurchase.chequereferencedate == null ? 'NULL' : this.M_SM_TokenPurchase.chequereferencedate ,
                ChequeDueDate: this.M_SM_TokenPurchase.chequeduedate == '' || this.M_SM_TokenPurchase.chequeduedate == null ? 'NULL' : this.M_SM_TokenPurchase.chequeduedate ,
                IssuedBank: this.M_SM_TokenPurchase.issuedbank,
                Remarks: this.M_SM_TokenPurchase.remarks,
                UserEdit: this.getDataUser().user_id ,
                LastUpdateStamp: this.M_SM_TokenPurchase.lastupdatestamp,
                ReferenceNo: this.M_SM_TokenPurchase.referenceno,
                LotNo: this.M_SM_TokenPurchase.lotno == '' || this.M_SM_TokenPurchase.lotno == null ? 'NULL' : this.M_SM_TokenPurchase.lotno                 
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_SM_TokenPurchase = {
                subportfoliocd: this.getDataUser().subportfolio_cd,
                contactid: '',
                batchno: '',
                source: '',
                runningcd: '',
                trxtype: '',
                modulecd: '',
                paymentdate: this.getToday(),
                descs: '',
                debtorcd: '',
                debtorname: '',
                paymentcategory: '',
                paymentno: '',
                documentcount: '',
                batchtotal: '',
                batchstatus: '',
                paymentcd: '',
                bankcd: '',
                currencycd: '',
                currencyrate: '',
                taxrate: '',
                entrytype: 'D',
                originalcurrencyrate: '',
                trxamt: this.MobileAuctionTokenAmt,
                netamt: '',
                withholdingamt: '',
                vatamt: '',
                totalamt: '',
                underpaymentamt: '',
                bankchargesamt: '0',
                chequereferenceno: '',
                chequereferencedate: '',
                chequeduedate: '',
                issuedbank: '',
                remarks: '',
                trxtypedescs: '',
                paymentdescs: '',
                paymenttype: '',
                bankname: '',
                runningdescs: '',
                taxcurrencyrate: '0',
                userinput: '',
                useredit: this.getDataUser().user_id,
                lastupdatestamp: 0,
                currentbatchtotal: '',
                currentdocumentcount: '',
                referenceno: '',
                lotno: '',
                lotdescs: '',
                unitcount: 0,
                contactname: '',
                custacno: ''
                    }
            		
		},
        M_New(){
			
        },
        M_Edit(){
        },
        M_Delete(dt){       

          var data = this.FormToABSList().getRowSelected()
          var dataDelete = []          

          data.forEach((value) => {
            dataDelete.push({
              SubPortfolioCd: this.getDataUser().subportfolio_cd,
              EntryType: 'D',
            //   ContactID: 'NULL',
              PaymentNo:value.TokenNo,
              BatchNo: value.BatchNo,
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
        getSpec () {
        var param = {
                OptionFunctionCd: 'GetSMSpecification',
                ModuleCd: this.Module,
                SubPortfolioCd: this.getDataUser().subportfolio_cd
            }

            this.FnDynamicFunction(param)
            .then(FnOpt2 => {
                if (FnOpt2 == null) return
                if (FnOpt2 != null) { 
                    if (FnOpt2.length <= 0) {
                      this.SpecTrue = false
                      
                    }
                    else {
                      var data = FnOpt2[0]
                      this.MobileAuctionTokenAmt = this.isCurrency(data.MobileAuctionTokenAmt)
                      this.SpecTrue = true
                    //   this.propList.initialWhere = "SubPortfolioCd = '" + this.getDataUser().subportfolio_cd + "'"
                    
                    }
                }
            })
    },
    GetBankCurrencyCd(BankCd){
          var param = {
                OptionFunctionCd: "GetBankCurrencyCd",
                ModuleCd: 'CB',
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                BankCd: this.M_SM_TokenPurchase.bankcd,
                BankCurrencyCd_Output: ''
            }

            this.FnDynamicFunction(param)
                    .then(currCd => {
                        if (currCd == null) return
                        this.M_SM_TokenPurchase.currencycd = currCd.BankCurrencyCd
                        if (this.M_SM_TokenPurchase.paymentdate && this.M_SM_TokenPurchase.paymentdate != "") {
                            
                          this.FnGetCurrencyMiddleRate(this.getDataUser().subportfolio_cd, this.M_SM_TokenPurchase.paymentdate, currCd.BankCurrencyCd).then(dtCurrRate => {
                            this.M_SM_TokenPurchase.currencyrate = this.isCurrency(dtCurrRate.CurrencyRate, this.decimal)
                          })
                        }
                    })
        },
        getDataBy (record) {
            console.log(record)
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order
,               subportfoliocd: record.SubPortfolioCd,
                contactid: record.ContactID,
                paymentno: record.TokenNo
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                console.log(data)
this.M_SM_TokenPurchase = {
                subportfoliocd: record.SubPortfolioCd,
                batchno: data.batchno,
                source: data.source,
                runningcd: data.runningcd,
                trxtype: data.trxtype,
                modulecd: data.modulecd,
                paymentdate: data.paymentdate,
                descs: data.descs,
                debtorcd: data.debtorcd,
                debtorname: data.debtorname,
                paymentcategory: data.paymentcategory,
                paymentno: data.paymentno,
                documentcount: data.documentcount,
                batchtotal: data.batchtotal,
                batchstatus: data.batchstatus,
                paymentcd: data.paymentcd,
                bankcd: data.bankcd,
                currencycd: data.currencycd,
                currencyrate: this.isCurrency(data.currencyrate),
                taxrate: data.taxrate,
                originalcurrencyrate: data.originalcurrencyrate,
                trxamt: this.isCurrency(data.trxamt),
                netamt: data.netamt,
                withholdingamt: data.withholdingamt,
                vatamt: data.vatamt,
                totalamt: data.totalamt,
                underpaymentamt: data.underpaymentamt,
                bankchargesamt: this.isCurrency(data.bankchargesamt),
                chequereferenceno: data.chequereferenceno,
                chequereferencedate: data.chequereferencedate,
                chequeduedate: data.chequeduedate,
                issuedbank: data.issuedbank,
                remarks: data.remarks,
                trxtypedescs: data.trxtypedescs,
                paymentdescs: data.paymentdescs,
                paymenttype: data.paymenttype,
                bankname: data.bankname,
                runningdescs: data.runningdescs,
                userinput: data.userinput,
                useredit: data.useredit,
                lastupdatestamp: record.LastUpdateStamp,
                currentbatchtotal: data.currentbatchtotal,
                currentdocumentcount: data.currentdocumentcount,
                referenceno: data.referenceno,
                lotno: data.lotno,
                taxcurrencyrate: data.taxcurrencyrate,
                lotdescs: data.lotdescs,
                unitcount: data.unitcount,
                contactname: data.contactname,
                custacno: data.custacno
                    }
                 

                this.M_SM_TokenPurchase.batchnoLabel = this.M_SM_TokenPurchase.batchno != null && this.M_SM_TokenPurchase.batchno != '' ? data.batchno + this.separator  :'' 
                this.M_SM_TokenPurchase.trxtypeLabel = this.M_SM_TokenPurchase.trxtype != null && this.M_SM_TokenPurchase.trxtype != '' ? data.trxtype + this.separator + data.trxtypedescs :'' 
                this.M_SM_TokenPurchase.bankcdLabel = this.M_SM_TokenPurchase.bankcd != null && this.M_SM_TokenPurchase.bankcd != '' ? data.bankcd + this.separator + data.bankname :'' 
                this.M_SM_TokenPurchase.debtorcdLabel = this.M_SM_TokenPurchase.debtorcd != null && this.M_SM_TokenPurchase.debtorcd != '' ? data.debtorcd + this.separator + data.debtorname :'' 
                this.M_SM_TokenPurchase.lotnoLabel = this.M_SM_TokenPurchase.lotno != null && this.M_SM_TokenPurchase.lotno != '' ? data.lotno + this.separator + data.lotdescs :'' 
                this.M_SM_TokenPurchase.paymentcdLabel = this.M_SM_TokenPurchase.paymentcd != null && this.M_SM_TokenPurchase.paymentcd != '' ? data.paymentcd + this.separator + data.paymentdescs :'' 
                this.M_SM_TokenPurchase.contactidLabel = this.M_SM_TokenPurchase.contactid != null && this.M_SM_TokenPurchase.contactid != '' ? data.contactid + this.separator + data.contactname :'' 
         

                this.IEBy.Input = data.UserInput
                this.IEBy.Edit = data.UserEdit

            })
        }

    },
    


    beforeCreate: function () {
    },
    created: function() {
	this.$store.commit('setFormType','List')
    this.getToolbar().ProcessPS()
    },
    beforeMount: function() {
    },
    mounted: function() {
        this.hideSideBarMenu()
        this.getSpec()
        this.FormToABSList().doGetList('','eb_getList')

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

