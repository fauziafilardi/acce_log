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
                                <b-col md="12" id="col-left"> <!-- table open -->
                                    <b-row>
                                      <b-col  md="3">
                                        <ABSInputSelectList @change="OnbatchnoChange" :prop="PI_batchno" :value="M_CB_Deposit.batchno" :label="M_CB_Deposit.batchnoLabel" ref="ref_batchno"/>
                                      </b-col>
                                      <b-col md="3">
                                        <ABSCompute :prop="PI_documentcount" v-model="M_CB_Deposit.documentcount"  ref="ref_documentcount" />
                                      </b-col>
                                      <b-col md="3">
                                        <ABSCompute :prop="PI_batchtotal" v-model="M_CB_Deposit.batchtotal"  ref="ref_batchtotal" />
                                      </b-col>
                                      <b-col md="3">
                                        <ABSinputCheckBox @input="OnbatchtotalChange" :prop="PI_batchtotal" v-model="M_CB_Deposit.batchtotal"  ref="ref_batchtotal" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSCompute :prop="PI_currentdocumentcount" v-model="M_CB_Deposit.currentdocumentcount"  ref="ref_currentdocumentcount" />
                                      </b-col>
                                      <b-col md="6">
                                        <ABSCompute :prop="PI_currentbatchtotal" v-model="M_CB_Deposit.currentbatchtotal"  ref="ref_currentbatchtotal" />
                                      </b-col>
                                    </b-row>
                                </b-col> <!-- table close -->
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OntrxtypeChange" :prop="PI_trxtype" :value="M_CB_Deposit.trxtype" :label="M_CB_Deposit.trxtypeLabel" ref="ref_trxtype"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnbankcdChange" :prop="PI_bankcd" :value="M_CB_Deposit.bankcd" :label="M_CB_Deposit.bankcdLabel" ref="ref_bankcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_paymentno" v-model="M_CB_Deposit.paymentno"  ref="ref_paymentno"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_currencycd" v-model="M_CB_Deposit.currencycd"  ref="ref_currencycd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputDateVuex :prop="PI_paymentdate" v-model="M_CB_Deposit.paymentdate"  ref="ref_paymentdate"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex @input="OncurrencyrateChange" :prop="PI_currencyrate" v-model="M_CB_Deposit.currencyrate"  ref="ref_currencyrate"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col md="6"></b-col>
                                        <b-col md="6" v-show="err1">
                                            <b-row v-show="err1">
                                                <b-col offset="4"><label class="lbl-value-view-form" style="color:red"> Rate must be greater than zero </label></b-col>
                                            </b-row>                                            
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_referenceno" v-model="M_CB_Deposit.referenceno"  ref="ref_referenceno"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_trxamt" v-model="M_CB_Deposit.trxamt"  ref="ref_trxamt"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_descs" v-model="M_CB_Deposit.descs"  ref="ref_descs"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_bankchargesamt" v-model="M_CB_Deposit.bankchargesamt"  ref="ref_bankchargesamt"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <!-- <ABSCompute :prop="PI_debtorcd" v-model="M_CB_Deposit.debtorcd"  ref="ref_debtorcd" /> -->
                                        <ABSInputSelectList @change="OndebtorcdChange" :prop="PI_debtorcd" :value="M_CB_Deposit.debtorcd" :label="M_CB_Deposit.debtorcdLabel" ref="ref_debtorcd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <!-- <ABSCompute :prop="PI_lotdescs" v-model="M_CB_Deposit.lotdescs"  ref="ref_lotdescs" /> -->
                                        <ABSInputSelectList @change="OnlotnoChange" :prop="PI_lotno" :value="M_CB_Deposit.lotno" :label="M_CB_Deposit.lotnoLabel" ref="ref_lotno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnpaymentcdChange" :prop="PI_paymentcd" :value="M_CB_Deposit.paymentcd" :label="M_CB_Deposit.paymentcdLabel" ref="ref_paymentcd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_salesorno" v-model="M_CB_Deposit.salesorno"  ref="ref_salesorno"/>
                                      </b-col>
                                    </b-row>
                                    <div class="div-collapse">
                                        <span class="master-span-form">
                                            Cheque / Reference No 
                                        </span>
                                    </div>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_custacno" v-model="M_CB_Deposit.custacno"  ref="ref_custacno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_chequereferenceno" v-model="M_CB_Deposit.chequereferenceno"  ref="ref_chequereferenceno"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputDateVuex @input="OnchequereferencedateChange" :prop="PI_chequereferencedate" v-model="M_CB_Deposit.chequereferencedate"  ref="ref_chequereferencedate" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_issuedbank" v-model="M_CB_Deposit.issuedbank"  ref="ref_issuedbank"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputDateVuex @input="OnchequeduedateChange" :prop="PI_chequeduedate" v-model="M_CB_Deposit.chequeduedate"  ref="ref_chequeduedate" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_CB_Deposit.remarks"  ref="ref_remarks" />
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
     error: false,
        err1: false,
		Module:"CB",
            propList: {
                initialWhere: "Source = 'D' AND PaymentStatus = 'N' AND SubPortfolioCd ='"+this.getDataUser().subportfolio_cd+"'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			
            RunningCd: '',

            M_CB_Deposit :{
                batchno: '',
                source: '',
                runningcd: '',
                trxtype: '',
                modulecd: '',
                paymentdate: this.getToday(),
                descs: '',
                debtorcd: '',
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
                salesorno: '',
                subportfoliocd: this.getDataUser().subportfolio_cd,
                timeedit: '',
                rowid: 0,
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
                cLabel: 'Curr. Batch Total  ', 
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
                cLabel: 'Trans. Type ', 
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
            PI_bankcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCBBank'    , 
                    ColumnDB: 'BankCd'   , 
                    InitialWhere: "SubPortfolioCd = '"+ this.getDataUser().subportfolio_cd +"' AND STATUS = 'A'"   , 
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
                cMasterUrl: '' ,
                cDisplayColumn: 'BankCd,BankName' ,
            }, 
            PI_paymentno: { 
                cValidate :'required|max:20', 
                cName: '', 
                cLabel: 'Payment No', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
                cProtect: false
            }, 
            PI_currencycd: { 
                cValidate :'max:13', 
                cName: 'currencycd', 
                cLabel: 'Currency', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
                cProtect: true 
            }, 
            PI_paymentdate: { 
                cValidate :'required', 
                cName: 'paymentdate', 
                cLabel: 'Payment Date', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cDecimal: 2, 
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_currencyrate: { 
                cValidate :'required', 
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
                cValidate :'required', 
                cName: 'trxamt', 
                cLabel: 'Trans. Amount', 
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
                    InitialWhere: "SubportfolioCd = '"+ this.getDataUser().subportfolio_cd +"' AND STATUS = 'Y'	AND DebtorCd NOT IN ( SELECT ISNULL(UnidentifiedDebtorCd, '') FROM AR_Specification	WHERE SubportfolioCd = '"+ this.getDataUser().subportfolio_cd +"')"   , 
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
                cMasterUrl: '' ,
                cDisplayColumn: 'DebtorCd,DebtorName' ,
            },             
            PI_lotno: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupTNLot'    , 
                    ColumnDB: 'LotNo'   , 
                    InitialWhere: "SubPortfolioCd = '"+this.getDataUser().subportfolio_cd+"' AND SalesStatus = 'M'	AND STATUS = 'A'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
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
                cDisplayColumn: 'LotNo,Descs' ,
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
                cLabel: 'Payment Type *', 
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
            PI_salesorno: { 
                cValidate :'max:20', 
                cName: 'salesorno', 
                cLabel: 'Sales OR No', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
                cProtect: true 
            }, 
            PI_custacno: { 
                cValidate :'max:30', 
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
                cLabel: '	Cheque / Ref. Date', 
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
      OncurrencyrateChange(data){
        this.$nextTick(() => {
          if(data == 0){
                    this.error = true
                    this.err1 = true
                } else {
                    this.err1 = false
                    this.error = false
                }
        })
        this.$forceUpdate()
        
      },
        GetBankCurrencyCd(BankCd){
          var param = {
                OptionFunctionCd: "GetBankCurrencyCd",
                ModuleCd: this.Module,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                BankCd: BankCd,
                BankCurrencyCd_Output: ''
            }

            return this.FnDynamicFunction(param)
            // .then(ress => {
            //     if (ress == null) return
            //       this.M_CB_Deposit.currencycd = ress.BankCurrencyCd
            //       this.M_CB_Deposit.bankcdLabel = this.M_CB_Deposit.bankcd != null && this.M_CB_Deposit.bankcd != '' ? BankCd + this.separator :''                   
            // })
        },
        GetRevaluationCurrencyRate(BankCd,PaymentDate){
          var param = {
                OptionFunctionCd: "GetRevaluationCurrencyRate",
                ModuleCd: this.Module,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                BankCd: BankCd,
                PaymentDate: PaymentDate,
                RevaluationCurrencyRate_Output: ''
            }

            this.FnDynamicFunction(param)
            .then(ress => {
                if (ress == null) return
                  console.log(ress)
                  this.M_CB_Deposit.currencyrate = ress.RevaluationCurrencyRate                                   
            })
        },
        OndebtorcdChange (data){
          this.$nextTick(() => {
            this.M_CB_Deposit.debtorcd = data.id
            this.M_CB_Deposit.debtorcdLabel = data.label
            if (this.inputStatus != "VIEW") {

            }
          })    
          this.$forceUpdate()
        },
        OnlotnoChange(data){
          this.$nextTick(() => {
            this.M_CB_Deposit.lotno = data.id
            this.M_CB_Deposit.lotnoLabel = data.label
            if (this.inputStatus != "VIEW") {

            }
          })
        },
        OnbatchnoChange (data) {
        this.$nextTick(() => {
            this.M_CB_Deposit.batchno = data.id
            this.M_CB_Deposit.batchnoLabel = data.label
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
            this.M_CB_Deposit.trxtype = data.id
            this.M_CB_Deposit.trxtypeLabel = data.label
            if (this.inputStatus != "VIEW") {
              // if(this.M_CB_Deposit.trxtype != ''){

              //   this.FnGetTrxTypeData(
              //       this.getDataUser().subportfolio_cd, this.Module, data.id
              //   ).then(ress => {
              //       console.log(ress)
              //       if (ress != null) {
              //           var data = ress[0]
                                              
              //           this.M_CB_Deposit.runningcd = data.RunningCd
              //           this.M_CB_Deposit.trxtypeLabel = data.TrxTypeDescs
              //           this.M_CB_Deposit.bankcd = data.DefaultBankCd

              //           if(this.M_CB_Deposit.bankcd != ''){
              //             this.GetBankCurrencyCd(this.M_CB_Deposit.bankcd)
              //             if(this.M_CB_Deposit.paymentdate != ''){
              //               this.GetRevaluationCurrencyRate(this.M_CB_Deposit.bankcd, this.M_CB_Deposit.paymentdate)
              //             }
              //           }

              //           if(this.inputStatus == "NEW"){
              //             if(this.M_CB_Deposit.runningcd != ''){
              //               this.M_CB_Deposit.runningcd = this.M_CB_Deposit.runningcd
              //               this.M_CB_Deposit.paymentno = "(AUTO)"
              //               this.PI_paymentno.cProtect = true
              //             }
              //           }                       
              //       }
              //   })
              //   this.$forceUpdate()
              // }else{
              //   this.M_CB_Deposit.trxtypeLabel = ''
              // }


          this.FnGetTrxTypeData(this.getDataUser().subportfolio_cd, this.Module, data.id).then(dt24 => 
          { 
            console.log(dt24)
            if (dt24 != null) {
              var data = dt24[0]
              console.log(data) 
               this.M_CB_Deposit.bankcd = data.DefaultBankCd
               this.M_CB_Deposit.trxtypedescs = data.TrxTypeDescs
               if (data.RunningCd != "")
                    { this.PI_paymentno.cProtect = true
                    this.M_CB_Deposit.paymentno = "(auto)"
                    this.RunningCd = data.RunningCd }
          else {
               this.PI_paymentno.cProtect = false
                    this.M_CB_Deposit.paymentno = ""
                    this.RunningCd = "" } } })

            }
        })
        this.$forceUpdate()
        },
        OnbankcdChange (data) {
        this.$nextTick(() => {
            this.M_CB_Deposit.bankcd = data.id
            this.M_CB_Deposit.bankcdLabel = data.label
            if (this.inputStatus != "VIEW") {
              this.GetBankCurrencyCd(this.M_CB_Deposit.bankcd)
              .then(ress => {
                if (ress == null) return
                  this.M_CB_Deposit.currencycd = ress.BankCurrencyCd
                  // this.M_CB_Deposit.bankcdLabel = this.M_CB_Deposit.bankcd != null && this.M_CB_Deposit.bankcd != '' ? data + this.separator :''
                  
                  if(this.M_CB_Deposit.paymentdate == ''){
                    this.getElementbyId(paymentdate).focus()  
                  }else{
                    this.FnGetCurrencyMiddleRate(
                        this.getDataUser().subportfolio_cd, this.M_CB_Deposit.paymentdate, this.M_CB_Deposit.currencycd
                    )
                    .then(ress => {
                        if (ress != null) { 
                          console.log(ress)                     
                            this.M_CB_Deposit.currencyrate = ress.CurrencyRate 
                        }                      
                    })

                    this.FnGetTaxCurrencyRate(
                        this.getDataUser().subportfolio_cd, this.M_CB_Deposit.paymentdate, this.M_CB_CashPurchaseH.currencycd
                    )
                    .then(ress => {
                        if (ress != null) {
                          console.log(ress)
                            this.M_CB_Deposit.taxrate = ress.CurrencyRate 
                        }                      
                    })

                  }
              })
            }            
            // if (this.inputStatus != "VIEW") {
            //   this.GetBankCurrencyCd(this.M_CB_Deposit.bankcd)
            //   if(this.M_CB_Deposit.paymentdate == ''){
            //     this.getElementbyId(paymentdate).focus()  
            //   }else{
            //     this.FnGetCurrencyMiddleRate(
            //         this.getDataUser().subportfolio_cd, this.M_CB_Deposit.paymentdate, this.M_CB_Deposit.currencycd
            //     )
            //     .then(ress => {
            //         if (ress != null) { 
            //           console.log(ress)                     
            //             this.M_CB_Deposit.currencyrate = ress.CurrencyRate 
            //         }                      
            //     })

            //     this.FnGetTaxCurrencyRate(
            //         this.getDataUser().subportfolio_cd, this.M_CB_Deposit.paymentdate, this.M_CB_Deposit.currencycd
            //     )
            //     .then(ress => {
            //         if (ress != null) {
            //           console.log(ress)
            //             this.M_CB_Deposit.taxrate = ress.CurrencyRate 
            //         }                      
            //     })

            //   }
            // }
        })
        this.$forceUpdate()
        },
        OnpaymentcdChange (data) {
        this.$nextTick(() => {
            this.M_CB_Deposit.paymentcd = data.id
            this.M_CB_Deposit.paymentcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{paymentcd}
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
          this.getToolbar().statusFunction[4].text = "Post"
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
          var dataPost = []
          var data = this.FormToABSList().getRowSelected()            
            
            
            data.forEach((value) => {
              console.log(value)
                dataPost.push({
                    SubportfolioCd: this.getDataUser().subportfolio_cd,
                    BatchNo: value.BatchNo,
                    PostBy: this.getDataUser().user_id,
                    _Message_: "Payment No : '"+value.PaymentNo+"'"
                })
            })

            var param ={
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                Data:dataPost
            }

            this.postJSONMulti(this.getUrlPostMulti(), param).then(response => {
                if (response == null) return
                this.$parent.resultPost()
            })
        },
        M_Insert() {
        if (this.RunningCd != "") { 
          this.FnGenerateRunningCode(
               this.getDataUser().subportfolio_cd, this.RunningCd, this.getDataUser().user_id, this.M_CB_Deposit.paymentdate
             ).then(dt9 =>
         { if (dt9 != null) {
                  this.M_CB_Deposit.paymentno = dt9.RunningCode
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                TrxType: this.M_CB_Deposit.trxtype == '' || this.M_CB_Deposit.trxtype == null ? 'NULL' : this.M_CB_Deposit.trxtype ,
                PaymentNo: this.M_CB_Deposit.paymentno,
                BatchNo: this.M_CB_Deposit.batchno == '' || this.M_CB_Deposit.batchno == null ? 0 : this.M_CB_Deposit.batchno ,
                EntryType: this.M_CB_Deposit.entrytype,
                PaymentCategory: this.M_CB_Deposit.paymentcategory,
                PaymentDate: this.M_CB_Deposit.paymentdate,
                Descs: this.M_CB_Deposit.descs,
                DebtorCd: this.M_CB_Deposit.debtorcd == '' || this.M_CB_Deposit.debtorcd == null ? 'NULL' : this.M_CB_Deposit.debtorcd ,
                PaymentCd: this.M_CB_Deposit.paymentcd == '' || this.M_CB_Deposit.paymentcd == null ? 'NULL' : this.M_CB_Deposit.paymentcd ,
                BankCd: this.M_CB_Deposit.bankcd == '' || this.M_CB_Deposit.bankcd == null ? 'NULL' : this.M_CB_Deposit.bankcd ,
                CurrencyCd: this.M_CB_Deposit.currencycd,
                CurrencyRate: this.M_CB_Deposit.currencyrate ? this.replaceAllString(this.M_CB_Deposit.currencyrate,',','','number') : 0 ,
                TaxCurrencyRate: this.M_CB_Deposit.taxcurrencyrate ? this.replaceAllString(this.M_CB_Deposit.taxcurrencyrate,',','','number') : 0 ,
                TrxAmt: this.M_CB_Deposit.trxamt ? this.replaceAllString(this.M_CB_Deposit.trxamt,',','','number') : 0 ,
                BankChargesAmt: this.M_CB_Deposit.bankchargesamt ? this.replaceAllString(this.M_CB_Deposit.bankchargesamt,',','','number') : 0 ,
                ChequeReferenceNo: this.M_CB_Deposit.chequereferenceno,
                ChequeReferenceDate: this.M_CB_Deposit.chequereferencedate == '' || this.M_CB_Deposit.chequereferencedate == null ? 'NULL' : this.M_CB_Deposit.chequereferencedate ,
                ChequeDueDate: this.M_CB_Deposit.chequeduedate == '' || this.M_CB_Deposit.chequeduedate == null ? 'NULL' : this.M_CB_Deposit.chequeduedate ,
                IssuedBank: this.M_CB_Deposit.issuedbank,
                Remarks: this.M_CB_Deposit.remarks,
                UserInput: this.getDataUser().user_id ,
                ReferenceNo: this.M_CB_Deposit.referenceno,
                LotNo: this.M_CB_Deposit.lotno,
                EntryType: 'D',
                PaymentCategory: 'I'                
            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return

				//kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultInsert(response.Message)
					
				
            })
           } })  }
        else {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                TrxType: this.M_CB_Deposit.trxtype == '' || this.M_CB_Deposit.trxtype == null ? 'NULL' : this.M_CB_Deposit.trxtype ,
                PaymentNo: this.M_CB_Deposit.paymentno,
                BatchNo: this.M_CB_Deposit.batchno == '' || this.M_CB_Deposit.batchno == null ? 0 : this.M_CB_Deposit.batchno ,
                EntryType: this.M_CB_Deposit.entrytype,
                PaymentCategory: this.M_CB_Deposit.paymentcategory,
                PaymentDate: this.M_CB_Deposit.paymentdate,
                Descs: this.M_CB_Deposit.descs,
                DebtorCd: this.M_CB_Deposit.debtorcd == '' || this.M_CB_Deposit.debtorcd == null ? 'NULL' : this.M_CB_Deposit.debtorcd ,
                PaymentCd: this.M_CB_Deposit.paymentcd == '' || this.M_CB_Deposit.paymentcd == null ? 'NULL' : this.M_CB_Deposit.paymentcd ,
                BankCd: this.M_CB_Deposit.bankcd == '' || this.M_CB_Deposit.bankcd == null ? 'NULL' : this.M_CB_Deposit.bankcd ,
                CurrencyCd: this.M_CB_Deposit.currencycd,
                CurrencyRate: this.M_CB_Deposit.currencyrate ? this.replaceAllString(this.M_CB_Deposit.currencyrate,',','','number') : 0 ,
                TaxCurrencyRate: this.M_CB_Deposit.taxcurrencyrate ? this.replaceAllString(this.M_CB_Deposit.taxcurrencyrate,',','','number') : 0 ,
                TrxAmt: this.M_CB_Deposit.trxamt ? this.replaceAllString(this.M_CB_Deposit.trxamt,',','','number') : 0 ,
                BankChargesAmt: this.M_CB_Deposit.bankchargesamt ? this.replaceAllString(this.M_CB_Deposit.bankchargesamt,',','','number') : 0 ,
                ChequeReferenceNo: this.M_CB_Deposit.chequereferenceno,
                ChequeReferenceDate: this.M_CB_Deposit.chequereferencedate == '' || this.M_CB_Deposit.chequereferencedate == null ? 'NULL' : this.M_CB_Deposit.chequereferencedate ,
                ChequeDueDate: this.M_CB_Deposit.chequeduedate == '' || this.M_CB_Deposit.chequeduedate == null ? 'NULL' : this.M_CB_Deposit.chequeduedate ,
                IssuedBank: this.M_CB_Deposit.issuedbank,
                Remarks: this.M_CB_Deposit.remarks,
                UserInput: this.getDataUser().user_id ,
                ReferenceNo: this.M_CB_Deposit.referenceno,
                LotNo: this.M_CB_Deposit.lotno,
                EntryType: 'D',
                PaymentCategory: 'I'                 
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
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                BatchNo: this.M_CB_Deposit.batchno == '' || this.M_CB_Deposit.batchno == null ? 'NULL' : this.M_CB_Deposit.batchno ,
                TrxType: this.M_CB_Deposit.trxtype == '' || this.M_CB_Deposit.trxtype == null ? 'NULL' : this.M_CB_Deposit.trxtype ,
                PaymentNo: this.M_CB_Deposit.paymentno,
                PaymentDate: this.M_CB_Deposit.paymentdate,
                Descs: this.M_CB_Deposit.descs,
                DebtorCd: this.M_CB_Deposit.debtorcd == '' || this.M_CB_Deposit.debtorcd == null ? 'NULL' : this.M_CB_Deposit.debtorcd ,
                TrxAmt: this.M_CB_Deposit.trxamt ? this.replaceAllString(this.M_CB_Deposit.trxamt,',','','number') : 0 ,
                BankChargesAmt: this.M_CB_Deposit.bankchargesamt ? this.replaceAllString(this.M_CB_Deposit.bankchargesamt,',','','number') : 0 ,
                PaymentCd: this.M_CB_Deposit.paymentcd == '' || this.M_CB_Deposit.paymentcd == null ? 'NULL' : this.M_CB_Deposit.paymentcd ,
                BankCd: this.M_CB_Deposit.bankcd == '' || this.M_CB_Deposit.bankcd == null ? 'NULL' : this.M_CB_Deposit.bankcd ,
                CurrencyCd: this.M_CB_Deposit.currencycd,
                CurrencyRate: this.M_CB_Deposit.currencyrate ? this.replaceAllString(this.M_CB_Deposit.currencyrate,',','','number') : 0 ,
                TaxCurrencyRate: this.M_CB_Deposit.taxcurrencyrate ? this.replaceAllString(this.M_CB_Deposit.taxcurrencyrate,',','','number') : 0 ,
                ChequeReferenceNo: this.M_CB_Deposit.chequereferenceno,
                ChequeReferenceDate: this.M_CB_Deposit.chequereferencedate == '' || this.M_CB_Deposit.chequereferencedate == null ? 'NULL' : this.M_CB_Deposit.chequereferencedate ,
                ChequeDueDate: this.M_CB_Deposit.chequeduedate == '' || this.M_CB_Deposit.chequeduedate == null ? 'NULL' : this.M_CB_Deposit.chequeduedate ,
                IssuedBank: this.M_CB_Deposit.issuedbank,
                Remarks: this.M_CB_Deposit.remarks,
                UserEdit: this.getDataUser().user_id ,
                EntryType: this.M_CB_Deposit.entrytype,
                LastUpdateStamp: this.M_CB_Deposit.lastupdatestamp,
                ReferenceNo: this.M_CB_Deposit.referenceno,
                LotNo: this.M_CB_Deposit.lotno,
                EntryType: 'D'                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_CB_Deposit = {
                batchno: 0,
                source: '',
                runningcd: '',
                trxtype: '',
                modulecd: '',
                paymentdate: this.getToday(),
                descs: '',
                debtorcd: '',
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
                salesorno: '',
                subportfoliocd: this.getDataUser().subportfolio_cd,
                timeedit: '',
                rowid: 0,
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
              PaymentNo: value.PaymentNo,
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
        getDataBy (record) {
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order
,                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                paymentno: record.PaymentNo
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
this.M_CB_Deposit = {
                batchno: data.batchno,
                source: data.source,
                runningcd: data.runningcd,
                trxtype: data.trxtype,
                modulecd: data.modulecd,
                paymentdate: data.paymentdate,
                descs: data.descs,
                debtorcd: data.debtorcd,
                paymentcategory: data.paymentcategory,
                paymentno: data.paymentno,
                documentcount: data.documentcount,
                batchtotal: data.batchtotal,
                batchstatus: data.batchstatus,
                paymentcd: data.paymentcd,
                bankcd: data.bankcd,
                currencycd: data.currencycd,
                currencyrate: this.isCurrency(data.currencyrate, this.decimal),
                taxrate: this.isCurrency(data.taxrate, this.decimal),
                originalcurrencyrate: this.isCurrency(data.originalcurrencyrate, this.decimal),
                trxamt: this.isCurrency(data.trxamt, this.decimal),
                netamt: this.isCurrency(data.netamt, this.decimal),
                withholdingamt: this.isCurrency(data.withholdingamt, this.decimal),
                vatamt: this.isCurrency(data.vatamt, this.decimal),
                totalamt: this.isCurrency(data.totalamt, this.decimal),
                underpaymentamt: this.isCurrency(data.underpaymentamt, this.decimal),
                bankchargesamt: this.isCurrency(data.bankchargesamt, this.decimal),
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
                lotdescs: data.lotdescs,
                salesorno: data.salesorno,
                subportfoliocd: data.subportfoliocd,
                timeedit: data.timeedit,
                rowid: data.rowid,
                custacno: data.custacno
                    }
                 

                this.M_CB_Deposit.batchnoLabel = this.M_CB_Deposit.batchno != null && this.M_CB_Deposit.batchno != '' ? data.batchno + this.separator  :'' 
                this.M_CB_Deposit.trxtypeLabel = this.M_CB_Deposit.trxtype != null && this.M_CB_Deposit.trxtype != '' ? data.trxtype + this.separator + data.trxtypedescs :'' 
                this.M_CB_Deposit.bankcdLabel = this.M_CB_Deposit.bankcd != null && this.M_CB_Deposit.bankcd != '' ? data.bankcd + this.separator + data.bankname :'' 
                this.M_CB_Deposit.paymentcdLabel = this.M_CB_Deposit.paymentcd != null && this.M_CB_Deposit.paymentcd != '' ? data.paymentcd + this.separator + data.paymentdescs :'' 
                this.M_CB_Deposit.debtorcdLabel = this.M_CB_Deposit.debtorcd != null && this.M_CB_Deposit.debtorcd != '' ? data.debtorcd + this.separator :''
                this.M_CB_Deposit.lotnoLabel = this.M_CB_Deposit.lotno != null && this.M_CB_Deposit.lotno != '' ? data.lotno + this.separator + data.lotdescs :''
         

                this.IEBy.Input = data.userinput
                this.IEBy.Edit = data.useredit

            })
        }

    },
    beforeCreate: function () {
    },
    created: function() {
	this.$store.commit('setFormType','ListProcess')
    this.getToolbar().ProcessPS()
    },
    beforeMount: function() {
    },
    mounted: function() {
        this.hideSideBarMenu()
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

