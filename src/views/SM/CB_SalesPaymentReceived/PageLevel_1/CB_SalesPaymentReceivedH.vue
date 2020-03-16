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
                                        <ABSInputSelectList @change="OnbatchnoChange" :prop="PI_batchno" :value="M_CB_SalesPaymentReceivedH.batchno" :label="M_CB_SalesPaymentReceivedH.batchnoLabel" ref="ref_batchno"/>
                                      </b-col>
                                      <b-col md="3">
                                        <ABSCompute :prop="PI_documentcount" v-model="M_CB_SalesPaymentReceivedH.documentcount"  ref="ref_documentcount" />
                                      </b-col>
                                      <b-col md="3">
                                        <ABSCompute :prop="PI_batchtotal" v-model="M_CB_SalesPaymentReceivedH.batchtotal"  ref="ref_batchtotal" />
                                      </b-col>
                                      <b-col md="3">
                                        <ABSinputCheckBox @input="OnbatchtotalChange" :prop="PI_batchtotal" v-model="M_CB_SalesPaymentReceivedH.batchtotal"  ref="ref_batchtotal" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSCompute :prop="PI_currentdocumentcount" v-model="M_CB_SalesPaymentReceivedH.currentdocumentcount"  ref="ref_currentdocumentcount" />
                                      </b-col>
                                      <b-col md="6">
                                        <ABSCompute :prop="PI_currentbatchtotal" v-model="M_CB_SalesPaymentReceivedH.currentbatchtotal"  ref="ref_currentbatchtotal" />
                                      </b-col>
                                    </b-row>
                                </b-col> <!-- table close -->
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputCheckBox @input="OnstatusChange" :prop="PI_status" v-model="M_CB_SalesPaymentReceivedH.status"  ref="ref_status" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <!-- <ABSCompute :prop="PI_trxtype" v-model="M_CB_SalesPaymentReceivedH.trxtype"  ref="ref_trxtype" /> -->
                                        <ABSInputSelectList @change="OnTrxTypeChange" :prop="PI_trxtype" :value="M_CB_SalesPaymentReceivedH.trxtype" :label="M_CB_SalesPaymentReceivedH.trxtypeLabel" ref="ref_trxtype"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_trxamt" v-model="M_CB_SalesPaymentReceivedH.trxamt"  ref="ref_trxamt"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_paymentno" v-model="M_CB_SalesPaymentReceivedH.paymentno"  ref="ref_paymentno"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_bankchargesamt" v-model="M_CB_SalesPaymentReceivedH.bankchargesamt"  ref="ref_bankchargesamt"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputDateVuex :prop="PI_paymentdate" v-model="M_CB_SalesPaymentReceivedH.paymentdate"  ref="ref_paymentdate"/>
                                      </b-col>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_overpaymentamt" v-model="M_CB_SalesPaymentReceivedH.overpaymentamt"  ref="ref_overpaymentamt"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_referenceno" v-model="M_CB_SalesPaymentReceivedH.referenceno"  ref="ref_referenceno"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_underpaymentamt" v-model="M_CB_SalesPaymentReceivedH.underpaymentamt"  ref="ref_underpaymentamt"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_descs" v-model="M_CB_SalesPaymentReceivedH.descs"  ref="ref_descs"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_totalallocationamt" v-model="M_CB_SalesPaymentReceivedH.totalallocationamt"  ref="ref_totalallocationamt"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <!-- <ABSCompute :prop="PI_debtorcd" v-model="M_CB_SalesPaymentReceivedH.debtorcd"  ref="ref_debtorcd" /> -->
                                        <ABSInputSelectList @change="OndebtorcdChange" :prop="PI_debtorcd" :value="M_CB_SalesPaymentReceivedH.debtorcd" :label="M_CB_SalesPaymentReceivedH.debtorcdLabel" ref="ref_debtorcd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_totalallocatedamt" v-model="M_CB_SalesPaymentReceivedH.totalallocatedamt"  ref="ref_totalallocatedamt"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnpaymentcdChange" :prop="PI_paymentcd" :value="M_CB_SalesPaymentReceivedH.paymentcd" :label="M_CB_SalesPaymentReceivedH.paymentcdLabel" ref="ref_paymentcd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_balance" v-model="M_CB_SalesPaymentReceivedH.balance"  ref="ref_balance"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <!-- <ABSCompute :prop="PI_bankcd" v-model="M_CB_SalesPaymentReceivedH.bankcd"  ref="ref_bankcd" /> -->
                                        <ABSInputSelectList @change="OnbankcdChange" :prop="PI_bankcd" :value="M_CB_SalesPaymentReceivedH.bankcd" :label="M_CB_SalesPaymentReceivedH.bankcdLabel" ref="ref_bankcd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_salesorno" v-model="M_CB_SalesPaymentReceivedH.salesorno"  ref="ref_salesorno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_currencycd" v-model="M_CB_SalesPaymentReceivedH.currencycd"  ref="ref_currencycd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_currencyrate" v-model="M_CB_SalesPaymentReceivedH.currencyrate"  ref="ref_currencyrate"/>
                                      </b-col>
                                    </b-row>
                                    <div class="div-collapse">
                                        <span class="master-span-form">
                                            Cheque / Reference No
                                        </span>
                                    </div>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_customerbankaccountno" v-model="M_CB_SalesPaymentReceivedH.customerbankaccountno"  ref="ref_customerbankaccountno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_chequereferenceno" v-model="M_CB_SalesPaymentReceivedH.chequereferenceno"  ref="ref_chequereferenceno"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputDateVuex @input="OnchequereferencedateChange" :prop="PI_chequereferencedate" v-model="M_CB_SalesPaymentReceivedH.chequereferencedate"  ref="ref_chequereferencedate" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_issuedbank" v-model="M_CB_SalesPaymentReceivedH.issuedbank"  ref="ref_issuedbank"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputDateVuex @input="OnchequeduedateChange" :prop="PI_chequeduedate" v-model="M_CB_SalesPaymentReceivedH.chequeduedate"  ref="ref_chequeduedate" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_CB_SalesPaymentReceivedH.remarks"  ref="ref_remarks" />
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
		FormType: "List",
		Module:"SM",
            propList: {
                initialWhere: "Source = 'S' AND PaymentStatus IN ('B','E') AND SubPortfolioCd = '" + this.getDataUser().subportfolio_cd + "'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			
            RunningCd: '',

            M_CB_SalesPaymentReceivedH :{
                batchno: 0,
                source: '',
                runningcd: '',
                trxtype: '',
                trxtypeLabel: '',
                modulecd: '',
                paymentdate: '',
                descs: '',
                debtorcd: '',
                debtorcdLabel: '',
                paymentcategory: '',
                paymentno: '',
                documentcount: 0,
                batchtotal: '',
                batchstatus: '',
                paymentcd: '',
                bankcd: '',
                bankcdLabel: '',
                currencycd: '',
                currencyrate: '0',
                taxrate: '',
                originalcurrencyrate: '',
                trxamt: '0',
                netamt: '',
                withholdingamt: '',
                vatamt: '',
                totalamt: '',
                overpaymentamt: '0',
                underpaymentamt: '0',
                bankchargesamt: '0',
                chequereferenceno: '',
                chequereferencedate: '',
                chequeduedate: '',
                issuedbank: '',
                remarks: '',
                trxtypedescs: '',
                paymentdescs: '',
                paymenttype: '',
                customerbankaccountno: '',
                bankname: '',
                runningdescs: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                lastupdatestamp: 0,
                currentbatchtotal: 0,
                currentdocumentcount: 0,
                referenceno: '',
                totalallocationamt: '0',
                totalallocatedamt: '0',
                status: '',
                debtorname: '',
                salesorno: '',
                subportfoliocd: this.getDataUser().subportfolio_cd,
                basecurrencycd: '',
                currencyoperator: '',
                timeedit: '',
                rowid: 0,
                balance: '0'
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
                cOrder: 1, 
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
            PI_status: { 
                cValidate :'', 
                cName: 'status', 
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
            // PI_trxtype: { 
            //     cLabel: 'Trans. Type', 
            //     cLabelSize: 4, 
            //     cValue: '', 
            //     cPageLevel: this.PageLevel, 
            //     cTabIndex: this.TabIndex, 
            //     cVisible: true 
            // },
            PI_trxtype: {
              dataLookUp: {
                  LookUpCd: 'GetLookupCBSalesPaymentReceivedTrxType',
                  ColumnDB: 'TrxType',
                  InitialWhere: "SubPortfolioCd = '" + this.getDataUser().subportfolio_cd + "'",
                  ParamWhere: ''
              },
              cValidate: 'required',
              cName: 'transType',
              cLabel: 'Trans. Type',
              cKey: true,
              cLabelSize: 4,
              cOrder: 8,
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
              cMasterUrl: 'CB/CB_SubPortofolioTransType',
              cDisplayColumn: 'TrxType,Descs',
            },
            PI_trxamt: { 
                cValidate :'', 
                cName: 'trxamt', 
                cLabel: 'Trans. Amount', 
                cLabelSize: 4, 
                cOrder: 10, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_paymentno: { 
                cValidate :'max:20', 
                cName: 'paymentno', 
                cLabel: 'Payment No', 
                cLabelSize: 4, 
                cOrder: 3, 
                cKey: true, 
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
                cLabel: 'Bank Charges Amount', 
                cLabelSize: 4, 
                cOrder: 11, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_paymentdate: { 
                cValidate :'required', 
                cName: 'paymentdate', 
                cLabel: 'Payment Date ', 
                cLabelSize: 4, 
                cOrder: 4, 
                cKey: false,
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_overpaymentamt: { 
                cValidate :'', 
                cName: 'overpaymentamt', 
                cLabel: 'Over Payment Amount', 
                cLabelSize: 4, 
                cOrder: 12, 
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
                cOrder: 5, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_underpaymentamt: { 
                cValidate :'', 
                cName: 'underpaymentamt', 
                cLabel: 'Under Payment Amount', 
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
            PI_descs: { 
                cValidate :'max:150', 
                cName: 'descs', 
                cLabel: 'Description', 
                cLabelSize: 4, 
                cOrder: 6, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_totalallocationamt: { 
                cValidate :'', 
                cName: 'totalallocationamt', 
                cLabel: 'Total Allocation Amount', 
                cLabelSize: 4, 
                cOrder: 14, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_debtorcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupARDebtor'    , 
                    ColumnDB: 'DebtorCd'   , 
                    InitialWhere: "SUBPORTFOLIOCD='"+this.getDataUser().subportfolio_cd+"' And Status='Y' And DebtorCd Not IN (Select ISNULL(UnidentifiedDebtorCd,'') From AR_Specification Where SubportfolioCd='" +this.getDataUser().subportfolio_cd+ "')",
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
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
            PI_totalallocatedamt: { 
                cValidate :'', 
                cName: 'totalallocatedamt', 
                cLabel: 'Allocated Amount', 
                cLabelSize: 4, 
                cOrder: 15, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
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
                cOrder: 8, 
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
            PI_balance: { 
                cValidate :'', 
                cName: 'balance', 
                cLabel: 'Balance', 
                cLabelSize: 4, 
                cOrder: 16, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_bankcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCBBank'    , 
                    ColumnDB: 'BankCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
                cName: 'bankcd', 
                cLabel: 'Bank', 
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
            PI_salesorno: { 
                cValidate :'max:20', 
                cName: 'salesorno', 
                cLabel: 'Sales OR No', 
                cLabelSize: 4, 
                cOrder: 9, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_currencycd: { 
                cValidate :'max:13', 
                cName: 'currencycd', 
                cLabel: 'Currency', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'text',
                cVisible: true, 
                cProtect: true, 
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
            PI_customerbankaccountno: { 
                cValidate :'max:30', 
                cName: 'customerbankaccountno', 
                cLabel: 'Customer Bank A/C', 
                cLabelSize: 4, 
                cOrder: 17, 
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
                cOrder: 18, 
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
                cLabel: 'Cheque / Ref. Date', 
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
                cOrder: 19, 
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
                cOrder: 21, 
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
                cOrder:22, 
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
        this.M_CB_SalesPaymentReceivedH.batchno = data.id
        this.M_CB_SalesPaymentReceivedH.batchnoLabel = data.label
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
    OndebtorcdChange (data) {
    this.$nextTick(() => {
        this.M_CB_SalesPaymentReceivedH.debtorcd = data.id
        this.M_CB_SalesPaymentReceivedH.debtorcdLabel = data.label
        if (this.inputStatus != "VIEW") {
//{debtorcd}
        }
    })
    this.$forceUpdate()
    },
    OnbankcdChange (data) {
    this.$nextTick(() => {
        this.M_CB_SalesPaymentReceivedH.bankcd = data.id
        this.M_CB_SalesPaymentReceivedH.bankcdLabel = data.label
        if (this.inputStatus != "VIEW") {
//{debtorcd}
        }
    })
    this.$forceUpdate()
    },
    OnstatusChange (data) {
    this.$nextTick(() => {
        if (this.inputStatus != "VIEW") {
//{status}
        }
    })
    this.$forceUpdate()
    },
    OnTrxTypeChange (data) {
      this.$nextTick(() => {
        this.M_CB_SalesPaymentReceivedH.trxtype = data.id
        this.M_CB_SalesPaymentReceivedH.trxtypeLabel = data.label
        if (this.inputStatus != "VIEW") {
          this.FnGetTrxTypeData(this.getDataUser().subportfolio_cd, "CB", data.id).then(dt => {
            if (dt != null) { 
              var dta = dt[0]
              this.M_CB_SalesPaymentReceivedH.runningcd = dta.RunningCd
              this.M_CB_SalesPaymentReceivedH.trxtypeLabel = data.id + this.separator + dta.TrxTypeDescs
              this.M_CB_SalesPaymentReceivedH.bankcd = dta.DefaultBankCd
              this.M_CB_SalesPaymentReceivedH.bankcdLabel = dta.DefaultBankCd && dta.DefaultBankCd != "" ? dta.DefaultBankCd + this.separator : ""

              if (this.inputStatus != "EDIT") {
                if (dta.RunningCd != '') {
                  this.M_CB_SalesPaymentReceivedH.paymentno = "(auto)"
                  this.PI_paymentno.cProtect = true
                }
                else {
                  this.M_CB_SalesPaymentReceivedH.paymentno = ""
                  this.PI_paymentno.cProtect = false
                }
              }
              
              if (dta.DefaultBankCd && dta.DefaultBankCd != "") {
                var paramcurrencycd = {
                  OptionFunctionCd: "GetBankCurrencyCd",
                  ModuleCd: "CB",
                  SubPortfolioCd: this.getDataUser().subportfolio_cd,
                  BankCd: dta.DefaultBankCd,
                  BankCurrencyCd_Output: ""
                }

                this.FnDynamicFunction(paramcurrencycd)
                .then(currCd => {
                    if (currCd == null) return
                    this.M_CB_SalesPaymentReceivedH.currencycd = currCd.BankCurrencyCd
                    if (this.M_CB_SalesPaymentReceivedH.paymentdate && this.M_CB_SalesPaymentReceivedH.paymentdate != "") {
                      var paramcurrencyrate = {
                        OptionFunctionCd: "GetRevaluationCurrencyRate",
                        ModuleCd: "CB",
                        RevaluationCurrencyRate_Output: "",
                        BankCd: currCd.BankCurrencyCd,
                        SubPortfolioCd: this.getDataUser().subportfolio_cd,
                        PaymentDate: this.M_CB_SalesPaymentReceivedH.paymentdate
                      }

                      this.FnDynamicFunction(paramcurrencyrate).then(dtCurrRate => {
                        this.M_CB_SalesPaymentReceivedH.currencyrate = this.isCurrency(dtCurrRate.RevaluationCurrencyRate, this.decimal)
                      })
                    }
                })
              }
            }
          })
        }
      })
      this.$forceUpdate()
    },
    OnpaymentcdChange (data) {
    this.$nextTick(() => {
        this.M_CB_SalesPaymentReceivedH.paymentcd = data.id
        this.M_CB_SalesPaymentReceivedH.paymentcdLabel = data.label
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
  this.getToolbar().statusFunction[4].disabled = false
  this.getToolbar().statusFunction[4].text = "Post"
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
            dataPost.push({
                SubPortfolioCd : this.getDataUser().subportfolio_cd,
                BatchNo : value.BatchNo,
                PostBy: this.getDataUser().user_id,
                _Message_: "Payment No " + value.PaymentNo
            })
          })

          var param = {
              OptionSeq: this.getOptionSeq().OptionSeq,
              LineNo: 0,
              Data: dataPost
          }

          this.postJSONMulti(this.getUrlPostMulti(), param).then(response => {
              if (response == null) return
              this.$store.commit('setEventStatus', 'POST')
              this.FormToABSList().doGetList("", "eb_getList")
          })
        },
        M_Insert() {
          if (this.M_CB_SalesPaymentReceivedH.runningcd != "") {
            this.FnGenerateRunningCode(
              this.getDataUser().subportfolio_cd,
              this.M_CB_SalesPaymentReceivedH.runningcd,
              this.getDataUser().user_id,
              this.M_CB_SalesPaymentReceivedH.paymentdate
            ).then(dt9 => {
              if (dt9 != null) {
                  this.M_CB_SalesPaymentReceivedH.paymentno = dt9.RunningCode

                  var param = {			
                    OptionSeq: this.getOptionSeq().OptionSeq,
                    LineNo: this.$parent.data.page_order,
                    SubPortfolioCd: this.getDataUser().subportfolio_cd,
                    TrxType: this.M_CB_SalesPaymentReceivedH.trxtype == '' || this.M_CB_SalesPaymentReceivedH.trxtype == null ? 'NULL' : this.M_CB_SalesPaymentReceivedH.trxtype,
                    PaymentNo: this.M_CB_SalesPaymentReceivedH.paymentno,
                    BatchNo: 0,
                    PaymentDate: this.M_CB_SalesPaymentReceivedH.paymentdate == '' || this.M_CB_SalesPaymentReceivedH.paymentdate == null ? 'NULL' : this.M_CB_SalesPaymentReceivedH.paymentdate,
                    Descs: this.M_CB_SalesPaymentReceivedH.descs,
                    DebtorCd: this.M_CB_SalesPaymentReceivedH.debtorcd == '' || this.M_CB_SalesPaymentReceivedH.debtorcd == null ? 'NULL' : this.M_CB_SalesPaymentReceivedH.debtorcd,
                    BankChargesAmt: this.M_CB_SalesPaymentReceivedH.bankchargesamt ? this.replaceAllString(this.M_CB_SalesPaymentReceivedH.bankchargesamt,',','','number') : 0 ,
                    OverPaymentAmt: this.M_CB_SalesPaymentReceivedH.overpaymentamt ? this.replaceAllString(this.M_CB_SalesPaymentReceivedH.overpaymentamt,',','','number') : 0 ,
                    UnderPaymentAmt: this.M_CB_SalesPaymentReceivedH.underpaymentamt ? this.replaceAllString(this.M_CB_SalesPaymentReceivedH.underpaymentamt,',','','number') : 0 ,
                    PaymentCd: this.M_CB_SalesPaymentReceivedH.paymentcd == '' || this.M_CB_SalesPaymentReceivedH.paymentcd == null ? 'NULL' : this.M_CB_SalesPaymentReceivedH.paymentcd ,
                    BankCd: this.M_CB_SalesPaymentReceivedH.bankcd == '' || this.M_CB_SalesPaymentReceivedH.bankcd == null ? 'NULL' : this.M_CB_SalesPaymentReceivedH.bankcd,
                    CurrencyCd: this.M_CB_SalesPaymentReceivedH.currencycd,
                    CurrencyRate: this.M_CB_SalesPaymentReceivedH.currencyrate ? this.replaceAllString(this.M_CB_SalesPaymentReceivedH.currencyrate,',','','number') : 0 ,
                    TrxAmt: this.M_CB_SalesPaymentReceivedH.trxamt ? this.replaceAllString(this.M_CB_SalesPaymentReceivedH.trxamt,',','','number') : 0 ,
                    TaxCurrencyRate: this.M_CB_SalesPaymentReceivedH.taxcurrencyrate ? this.replaceAllString(this.M_CB_SalesPaymentReceivedH.taxcurrencyrate,',','','number') : 0,
                    ChequeReferenceNo: this.M_CB_SalesPaymentReceivedH.chequereferenceno,
                    ChequeReferenceDate: this.M_CB_SalesPaymentReceivedH.chequereferencedate == '' || this.M_CB_SalesPaymentReceivedH.chequereferencedate == null ? 'NULL' : this.M_CB_SalesPaymentReceivedH.chequereferencedate ,
                    ChequeDueDate: this.M_CB_SalesPaymentReceivedH.chequeduedate == '' || this.M_CB_SalesPaymentReceivedH.chequeduedate == null ? 'NULL' : this.M_CB_SalesPaymentReceivedH.chequeduedate ,
                    IssuedBank: this.M_CB_SalesPaymentReceivedH.issuedbank,
                    Remarks: this.M_CB_SalesPaymentReceivedH.remarks,
                    UserInput: this.getDataUser().user_id ,
                    EntryType: "S",
                    PaymentCategory: "I",
                    ReferenceNo: this.M_CB_SalesPaymentReceivedH.referenceno,
                    CustomerBankAccountNo: this.M_CB_SalesPaymentReceivedH.customerbankaccountno
                  }

                  this.postJSON(this.getUrlInsert(), param)
                  .then((response) => {
                    if(response == null) return
                    this.$parent.resultInsert(response.Message)
                  })
              }
            })
          }
          else {
            var param = {			
              OptionSeq: this.getOptionSeq().OptionSeq,
              LineNo: this.$parent.data.page_order,
              SubPortfolioCd: this.getDataUser().subportfolio_cd,
              TrxType: this.M_CB_SalesPaymentReceivedH.trxtype == '' || this.M_CB_SalesPaymentReceivedH.trxtype == null ? 'NULL' : this.M_CB_SalesPaymentReceivedH.trxtype,
              PaymentNo: this.M_CB_SalesPaymentReceivedH.paymentno,
              BatchNo: 0,
              PaymentDate: this.M_CB_SalesPaymentReceivedH.paymentdate == '' || this.M_CB_SalesPaymentReceivedH.paymentdate == null ? 'NULL' : this.M_CB_SalesPaymentReceivedH.paymentdate,
              Descs: this.M_CB_SalesPaymentReceivedH.descs,
              DebtorCd: this.M_CB_SalesPaymentReceivedH.debtorcd == '' || this.M_CB_SalesPaymentReceivedH.debtorcd == null ? 'NULL' : this.M_CB_SalesPaymentReceivedH.debtorcd,
              BankChargesAmt: this.M_CB_SalesPaymentReceivedH.bankchargesamt ? this.replaceAllString(this.M_CB_SalesPaymentReceivedH.bankchargesamt,',','','number') : 0 ,
              OverPaymentAmt: this.M_CB_SalesPaymentReceivedH.overpaymentamt ? this.replaceAllString(this.M_CB_SalesPaymentReceivedH.overpaymentamt,',','','number') : 0 ,
              UnderPaymentAmt: this.M_CB_SalesPaymentReceivedH.underpaymentamt ? this.replaceAllString(this.M_CB_SalesPaymentReceivedH.underpaymentamt,',','','number') : 0 ,
              PaymentCd: this.M_CB_SalesPaymentReceivedH.paymentcd == '' || this.M_CB_SalesPaymentReceivedH.paymentcd == null ? 'NULL' : this.M_CB_SalesPaymentReceivedH.paymentcd ,
              BankCd: this.M_CB_SalesPaymentReceivedH.bankcd == '' || this.M_CB_SalesPaymentReceivedH.bankcd == null ? 'NULL' : this.M_CB_SalesPaymentReceivedH.bankcd,
              CurrencyCd: this.M_CB_SalesPaymentReceivedH.currencycd,
              CurrencyRate: this.M_CB_SalesPaymentReceivedH.currencyrate ? this.replaceAllString(this.M_CB_SalesPaymentReceivedH.currencyrate,',','','number') : 0 ,
              TrxAmt: this.M_CB_SalesPaymentReceivedH.trxamt ? this.replaceAllString(this.M_CB_SalesPaymentReceivedH.trxamt,',','','number') : 0 ,
              TaxCurrencyRate: this.M_CB_SalesPaymentReceivedH.taxcurrencyrate ? this.replaceAllString(this.M_CB_SalesPaymentReceivedH.taxcurrencyrate,',','','number') : 0,
              ChequeReferenceNo: this.M_CB_SalesPaymentReceivedH.chequereferenceno,
              ChequeReferenceDate: this.M_CB_SalesPaymentReceivedH.chequereferencedate == '' || this.M_CB_SalesPaymentReceivedH.chequereferencedate == null ? 'NULL' : this.M_CB_SalesPaymentReceivedH.chequereferencedate ,
              ChequeDueDate: this.M_CB_SalesPaymentReceivedH.chequeduedate == '' || this.M_CB_SalesPaymentReceivedH.chequeduedate == null ? 'NULL' : this.M_CB_SalesPaymentReceivedH.chequeduedate ,
              IssuedBank: this.M_CB_SalesPaymentReceivedH.issuedbank,
              Remarks: this.M_CB_SalesPaymentReceivedH.remarks,
              UserInput: this.getDataUser().user_id ,
              EntryType: "S",
              PaymentCategory: "I",
              ReferenceNo: this.M_CB_SalesPaymentReceivedH.referenceno,
              CustomerBankAccountNo: this.M_CB_SalesPaymentReceivedH.customerbankaccountno
            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
              if(response == null) return
              this.$parent.resultInsert(response.Message)
            })
          }
        },
        M_Update() {
          var param = {
            OptionSeq: this.getOptionSeq().OptionSeq,
            LineNo: this.$parent.data.page_order,
            SubPortfolioCd: this.getDataUser().subportfolio_cd,
            BatchNo: this.M_CB_SalesPaymentReceivedH.batchno == '' || this.M_CB_SalesPaymentReceivedH.batchno == null ? 'NULL' : this.M_CB_SalesPaymentReceivedH.batchno,
            TrxType: this.M_CB_SalesPaymentReceivedH.trxtype == '' || this.M_CB_SalesPaymentReceivedH.trxtype == null ? 'NULL' : this.M_CB_SalesPaymentReceivedH.trxtype,
            PaymentNo: this.M_CB_SalesPaymentReceivedH.paymentno,
            PaymentDate: this.M_CB_SalesPaymentReceivedH.paymentdate == '' || this.M_CB_SalesPaymentReceivedH.paymentdate == null ? 'NULL' : this.M_CB_SalesPaymentReceivedH.paymentdate,
            Descs: this.M_CB_SalesPaymentReceivedH.descs,
            DebtorCd: this.M_CB_SalesPaymentReceivedH.debtorcd == '' || this.M_CB_SalesPaymentReceivedH.debtorcd == null ? 'NULL' : this.M_CB_SalesPaymentReceivedH.debtorcd,
            TrxAmt: this.M_CB_SalesPaymentReceivedH.trxamt ? this.replaceAllString(this.M_CB_SalesPaymentReceivedH.trxamt,',','','number') : 0 ,
            BankChargesAmt: this.M_CB_SalesPaymentReceivedH.bankchargesamt ? this.replaceAllString(this.M_CB_SalesPaymentReceivedH.bankchargesamt,',','','number') : 0 ,
            OverPaymentAmt: this.M_CB_SalesPaymentReceivedH.overpaymentamt ? this.replaceAllString(this.M_CB_SalesPaymentReceivedH.overpaymentamt,',','','number') : 0 ,
            UnderPaymentAmt: this.M_CB_SalesPaymentReceivedH.underpaymentamt ? this.replaceAllString(this.M_CB_SalesPaymentReceivedH.underpaymentamt,',','','number') : 0 ,
            PaymentCd: this.M_CB_SalesPaymentReceivedH.paymentcd == '' || this.M_CB_SalesPaymentReceivedH.paymentcd == null ? 'NULL' : this.M_CB_SalesPaymentReceivedH.paymentcd ,
            BankCd: this.M_CB_SalesPaymentReceivedH.bankcd == '' || this.M_CB_SalesPaymentReceivedH.bankcd == null ? 'NULL' : this.M_CB_SalesPaymentReceivedH.bankcd,
            CurrencyCd: this.M_CB_SalesPaymentReceivedH.currencycd,
            CurrencyRate: this.M_CB_SalesPaymentReceivedH.currencyrate ? this.replaceAllString(this.M_CB_SalesPaymentReceivedH.currencyrate,',','','number') : 0 ,
            TaxCurrencyRate: this.M_CB_SalesPaymentReceivedH.taxcurrencyrate ? this.replaceAllString(this.M_CB_SalesPaymentReceivedH.taxcurrencyrate,',','','number') : 0,
            ChequeReferenceNo: this.M_CB_SalesPaymentReceivedH.chequereferenceno,
            ChequeReferenceDate: this.M_CB_SalesPaymentReceivedH.chequereferencedate == '' || this.M_CB_SalesPaymentReceivedH.chequereferencedate == null ? 'NULL' : this.M_CB_SalesPaymentReceivedH.chequereferencedate ,
            ChequeDueDate: this.M_CB_SalesPaymentReceivedH.chequeduedate == '' || this.M_CB_SalesPaymentReceivedH.chequeduedate == null ? 'NULL' : this.M_CB_SalesPaymentReceivedH.chequeduedate ,
            IssuedBank: this.M_CB_SalesPaymentReceivedH.issuedbank,
            Remarks: this.M_CB_SalesPaymentReceivedH.remarks,
            UserEdit: this.getDataUser().user_id ,
            EntryType: "S",
            ReferenceNo: this.M_CB_SalesPaymentReceivedH.referenceno,
            LastUpdateStamp: this.M_CB_SalesPaymentReceivedH.lastupdatestamp,
            CustomerBankAccountNo: this.M_CB_SalesPaymentReceivedH.customerbankaccountno
          }

          this.postJSON(this.getUrlUpdate(), param)
          .then((response) => {
            if(response == null) return
            this.$parent.resultUpdate(response.Message)
          })
        },
        M_ClearForm(){
          this.M_CB_SalesPaymentReceivedH = {
            batchno: 0,
            source: '',
            runningcd: '',
            trxtype: '',
            modulecd: '',
            paymentdate: '',
            descs: '',
            debtorcd: '',
            debtorcdLabel: '',
            paymentcategory: '',
            paymentno: '',
            documentcount: 0,
            batchtotal: '',
            batchstatus: '',
            paymentcd: '',
            bankcd: '',
            bankcdLabel: '',
            currencycd: '',
            currencyrate: '0',
            taxrate: '',
            originalcurrencyrate: '',
            trxamt: '0',
            netamt: '',
            withholdingamt: '',
            vatamt: '',
            totalamt: '',
            overpaymentamt: '0',
            underpaymentamt: '0',
            bankchargesamt: '0',
            chequereferenceno: '',
            chequereferencedate: '',
            chequeduedate: '',
            issuedbank: '',
            remarks: '',
            trxtypedescs: '',
            paymentdescs: '',
            paymenttype: '',
            customerbankaccountno: '',
            bankname: '',
            runningdescs: '',
            userinput: '',
            useredit: this.getDataUser().user_id,
            lastupdatestamp: 0,
            currentbatchtotal: 0,
            currentdocumentcount: 0,
            referenceno: '',
            totalallocationamt: '0',
            totalallocatedamt: '0',
            status: '',
            debtorname: '',
            salesorno: '',
            subportfoliocd: this.getDataUser().subportfolio_cd,
            basecurrencycd: '',
            currencyoperator: '',
            timeedit: '',
            rowid: 0,
            balance: '0'
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
              EntryType: 'S',
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
this.M_CB_SalesPaymentReceivedH = {
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
                taxrate: data.taxrate,
                originalcurrencyrate: data.originalcurrencyrate,
                trxamt: this.isCurrency(data.trxamt, this.decimal),
                netamt: this.isCurrency(data.netamt, this.decimal),
                withholdingamt: this.isCurrency(data.withholdingamt, this.decimal),
                vatamt: this.isCurrency(data.vatamt, this.decimal),
                totalamt: this.isCurrency(data.totalamt, this.decimal),
                overpaymentamt: this.isCurrency(data.overpaymentamt, this.decimal),
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
                customerbankaccountno: data.customerbankaccountno,
                bankname: data.bankname,
                runningdescs: data.runningdescs,
                userinput: data.userinput,
                useredit: data.useredit,
                lastupdatestamp: record.LastUpdateStamp,
                currentbatchtotal: data.currentbatchtotal,
                currentdocumentcount: data.currentdocumentcount,
                referenceno: data.referenceno,
                totalallocationamt: this.isCurrency(data.totalallocationamt, this.decimal),
                totalallocatedamt: this.isCurrency(data.totalallocatedamt, this.decimal),
                status: data.status,
                debtorname: data.debtorname,
                salesorno: data.salesorno,
                subportfoliocd: data.subportfoliocd,
                basecurrencycd: data.basecurrencycd,
                currencyoperator: data.currencyoperator,
                timeedit: data.timeedit,
                rowid: data.rowid,
                balance: this.isCurrency((data.TotalAllocationAmt - data.TotalAllocatedAmt), this.decimal,'a')
                    }
                    
                this.M_CB_SalesPaymentReceivedH.batchnoLabel = this.M_CB_SalesPaymentReceivedH.batchno != null && this.M_CB_SalesPaymentReceivedH.batchno != '' ? data.batchno + this.separator  :'' 
                this.M_CB_SalesPaymentReceivedH.paymentcdLabel = this.M_CB_SalesPaymentReceivedH.paymentcd != null && this.M_CB_SalesPaymentReceivedH.paymentcd != '' ? data.paymentcd + this.separator + data.paymentdescs :'' 
                this.M_CB_SalesPaymentReceivedH.trxtypeLabel = this.M_CB_SalesPaymentReceivedH.trxtype != null && this.M_CB_SalesPaymentReceivedH.trxtype != '' ? data.trxtype + this.separator + data.trxtypedescs :'' 
                this.M_CB_SalesPaymentReceivedH.debtorcdLabel = this.M_CB_SalesPaymentReceivedH.debtorcd != null && this.M_CB_SalesPaymentReceivedH.debtorcd != '' ? data.debtorcd + this.separator + data.debtorname :'' 
                this.M_CB_SalesPaymentReceivedH.bankcdLabel = this.M_CB_SalesPaymentReceivedH.bankcd != null && this.M_CB_SalesPaymentReceivedH.bankcd != '' ? data.bankcd + this.separator + data.bankname :'' 

                this.IEBy.Input = data.userinput
                this.IEBy.Edit = data.useredit

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

