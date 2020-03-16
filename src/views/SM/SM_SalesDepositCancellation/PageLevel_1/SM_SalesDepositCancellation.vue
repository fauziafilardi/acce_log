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
                                        <ABSinputTextVuex :prop="PI_batchno" v-model="M_SM_SalesDepositCancellation.batchno"  ref="ref_batchno"/>
                                      </b-col>
                                      <b-col md="3">
                                        <ABSCompute :prop="PI_documentcount" v-model="M_SM_SalesDepositCancellation.documentcount"  ref="ref_documentcount" />
                                      </b-col>
                                      <b-col md="3">
                                        <ABSCompute :prop="PI_batchtotal" v-model="M_SM_SalesDepositCancellation.batchtotal"  ref="ref_batchtotal" />
                                      </b-col>
                                      <b-col md="3">
                                        <ABSinputCheckBox @input="OnbatchtotalChange" :prop="PI_batchtotal" v-model="M_SM_SalesDepositCancellation.batchtotal"  ref="ref_batchtotal" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSCompute :prop="PI_currentdocumentcount" v-model="M_SM_SalesDepositCancellation.currentdocumentcount"  ref="ref_currentdocumentcount" />
                                      </b-col>
                                      <b-col md="6">
                                        <ABSCompute :prop="PI_currentbatchtotal" v-model="M_SM_SalesDepositCancellation.currentbatchtotal"  ref="ref_currentbatchtotal" />
                                      </b-col>
                                    </b-row>
                                </b-col> <!-- table close -->
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_trxtype" v-model="M_SM_SalesDepositCancellation.trxtype"  ref="ref_trxtype"/>
                                      </b-col>
                                      <!-- <b-col md="3">
                                        <ABSCompute :prop="PI_trxtypedescs" v-model="M_SM_SalesDepositCancellation.trxtypedescs"  ref="ref_trxtypedescs" />
                                      </b-col> -->
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_bankcd" v-model="M_SM_SalesDepositCancellation.bankcd"  ref="ref_bankcd"/>
                                      </b-col>
                                      <!-- <b-col md="3">
                                        <ABSCompute :prop="PI_bankname" v-model="M_SM_SalesDepositCancellation.bankname"  ref="ref_bankname" />
                                      </b-col> -->
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_paymentno" v-model="M_SM_SalesDepositCancellation.paymentno"  ref="ref_paymentno"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_currencycd" v-model="M_SM_SalesDepositCancellation.currencycd"  ref="ref_currencycd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_paymentdate" v-model="M_SM_SalesDepositCancellation.paymentdate"  ref="ref_paymentdate"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_currencyrate" v-model="M_SM_SalesDepositCancellation.currencyrate"  ref="ref_currencyrate"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_referenceno" v-model="M_SM_SalesDepositCancellation.referenceno"  ref="ref_referenceno"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_trxamt" v-model="M_SM_SalesDepositCancellation.trxamt"  ref="ref_trxamt"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_descs" v-model="M_SM_SalesDepositCancellation.descs"  ref="ref_descs"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_bankchargesamt" v-model="M_SM_SalesDepositCancellation.bankchargesamt"  ref="ref_bankchargesamt"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_debtorcd" v-model="M_SM_SalesDepositCancellation.debtorcd"  ref="ref_debtorcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_paymentcd" v-model="M_SM_SalesDepositCancellation.paymentcd"  ref="ref_paymentcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OndepositallocationstatusChange" :prop="PI_depositallocationstatus" v-model="M_SM_SalesDepositCancellation.depositallocationstatus"  ref="ref_depositallocationstatus" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputDateVuex @input="OncanceldateChange" :prop="PI_canceldate" v-model="M_SM_SalesDepositCancellation.canceldate"  ref="ref_canceldate" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <!-- <ABSCompute :prop="PI_glincometranstype" v-model="M_SM_SalesDepositCancellation.glincometranstype"  ref="ref_glincometranstype" /> -->
                                        <ABSInputSelectList @change="OnglincometranstypeChange" :prop="PI_glincometranstype" :value="M_SM_SalesDepositCancellation.glincometranstype" :label="M_SM_SalesDepositCancellation.glincometranstypeLabel" ref="ref_glincometranstype"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <!-- <ABSCompute :prop="PI_refundtrxtype" v-model="M_SM_SalesDepositCancellation.refundtrxtype"  ref="ref_refundtrxtype" /> -->
                                        <ABSInputSelectList @change="OnrefundtrxtypeChange" :prop="PI_refundtrxtype" :value="M_SM_SalesDepositCancellation.refundtrxtype" :label="M_SM_SalesDepositCancellation.refundtrxtypeLabel" ref="ref_refundtrxtype"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <!-- <ABSCompute :prop="PI_refundpaymentcd" v-model="M_SM_SalesDepositCancellation.refundpaymentcd"  ref="ref_refundpaymentcd" /> -->
                                        <ABSInputSelectList @change="OnrefundpaymentcdChange" :prop="PI_refundpaymentcd" :value="M_SM_SalesDepositCancellation.refundpaymentcd" :label="M_SM_SalesDepositCancellation.refundpaymentcdLabel" ref="ref_refundpaymentcd"/>
                                      </b-col>
                                    </b-row>
                                    <div class="div-collapse">
                                        <span class="master-span-form">
                                            Cheque / Reference No 
                                        </span>
                                    </div>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_custacno" v-model="M_SM_SalesDepositCancellation.custacno"  ref="ref_custacno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_chequereferenceno" v-model="M_SM_SalesDepositCancellation.chequereferenceno"  ref="ref_chequereferenceno"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputDateVuex @input="OnchequereferencedateChange" :prop="PI_chequereferencedate" v-model="M_SM_SalesDepositCancellation.chequereferencedate"  ref="ref_chequereferencedate" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_issuedbank" v-model="M_SM_SalesDepositCancellation.issuedbank"  ref="ref_issuedbank"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_chequeduedate" v-model="M_SM_SalesDepositCancellation.chequeduedate"  ref="ref_chequeduedate"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_SM_SalesDepositCancellation.remarks"  ref="ref_remarks" />
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
                initialWhere: "PaymentSource = 'D' AND LedgerStatus = 'Y' AND SubPortfolioCd = '"+this.getDataUser().subportfolio_cd+"' AND PaymentStatus='P' AND LedgerDepositAllocationPostingStatus IN ('N','B') AND LedgerDepositAllocationStatus IN ('N','I','R') ",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: 'BatchNo ASC', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_SM_SalesDepositCancellation :{
                batchno: '0',
                source: '',
                runningcd: '',
                trxtype: '',
                modulecd: '',
                paymentdate: '',
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
                depositallocationdate: '',
                currencyrate: '0',
                taxrate: 0,
                originalcurrencyrate: 0,
                trxamt: '0',
                netamt: 0,
                withholdingamt: 0,
                vatamt: 0,
                totalamt: 0,
                underpaymentamt: 0,
                bankchargesamt: '0',
                chequereferenceno: '',
                chequereferencedate: '',
                chequeduedate: '',
                issuedbank: '',
                remarks: '',
                trxtypedescs: '',
                depositallocationstatus: 'N',
                refundtrxtype: '',
                glincometrxtype: '',
                refundpaymentcd: '',
                paymentdescs: '',
                paymenttype: '',
                bankname: '',
                runningdescs: '',
                refundtranstype: '',
                refundpaymentdescs: '',
                glincometranstype: '',
                canceldate: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                lastupdatestamp: 0,
                currentbatchtotal: '',
                currentdocumentcount: '',
                referenceno: '',
                subportfoliocd: this.getDataUser().subportfolio_cd,
                timeedit: '',
                rowid: 0,
                custacno	: ''
                    }
            ,
            PI_batchno: { 
                cValidate :'', 
                cName: 'batchno', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'numeric',
                cVisible: false, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
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
                cProtect: true, 
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
                cValidate :'', 
                cName: 'trxtype', 
                cLabel: 'Trans. Type', 
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
            PI_trxtypedescs: { 
                cLabel: '', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: false 
            }, 
            PI_bankcd: { 
                cValidate :'', 
                cName: 'bankcd', 
                cLabel: 'Bank', 
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
            PI_bankname: { 
                cLabel: '', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: false 
            }, 
            PI_paymentno: { 
                cValidate :'', 
                cName: 'paymentno', 
                cLabel: 'Payment No', 
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
                cValidate :'', 
                cName: 'paymentdate', 
                cLabel: 'Payment Date', 
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
            PI_currencyrate: { 
                cValidate :'', 
                cName: 'currencyrate', 
                cLabel: 'Currency Rate', 
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
            PI_referenceno: { 
                cValidate :'', 
                cName: 'referenceno', 
                cLabel: 'Reference No', 
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
                cValidate :'', 
                cName: 'descs', 
                cLabel: 'Description', 
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
            PI_bankchargesamt: { 
                cValidate :'', 
                cName: 'bankchargesamt', 
                cLabel: 'Bank Charges', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_debtorcd: { 
                cValidate :'', 
                cName: 'debtorcd', 
                cLabel: 'Debtor Code', 
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
            PI_paymentcd: { 
                cValidate :'', 
                cName: 'paymentcd', 
                cLabel: 'Payment Type', 
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
            PI_depositallocationstatus: { 
                cValidate :'', 
                cName: 'depositallocationstatus', 
                cId: 'rdbdepositallocationstatus', 
                cRadioOptions: [{ text: 'Income', value: 'I' },{ text: 'Refund', value: 'R' },{ text: 'Not Cancelled', value: 'N' },], 
                cRadioDefaultOption: 'N', 
                cLabel:'Deposit Cancellation', 
                cLabelSize: 4, 
                cOrder: 0, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_canceldate: { 
                cValidate :'', 
                cName: 'canceldate', 
                cLabel: 'Cancellation Date', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cVisible:  true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_glincometranstype: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMTransTypeMaster'    , 
                    ColumnDB: 'TrxType'   , 
                    InitialWhere: "ModuleCd='GL' and RunningCd is not null"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'glincometrxtype', 
                cLabel: 'Income Trans. Type', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 0, 
                cTriggered: false, 
                cDefault: '', 
                cProtect: true, 
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
            // PI_refundtrxtype: { 
            //     cLabel: 'Refund Trans. Type', 
            //     cLabelSize: 4, 
            //     cValue: '', 
            //     cPageLevel: this.PageLevel, 
            //     cTabIndex: this.TabIndex, 
            //     cVisible: true 
            // }, 
            PI_refundtrxtype: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMTransTypeMaster'    , 
                    ColumnDB: 'TrxType'   , 
                    InitialWhere: "ModuleCd='CB' and RunningCd is not null And TrxClass='C'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'refundtrxtype', 
                cLabel: 'Refund Trans. Type', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 0, 
                cTriggered: false, 
                cDefault: '', 
                cProtect: true, 
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
            PI_refundpaymentcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMPaymentType'    , 
                    ColumnDB: 'PaymentCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'refundpaymentcd', 
                cLabel: 'Refund Payment Code', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 0, 
                cTriggered: false, 
                cDefault: '', 
                cProtect: true, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cStatic: false, 
                cOption: [], 
                cMasterUrl: '' ,
                cDisplayColumn: 'PaymentCd,Descs' ,
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
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_chequereferenceno: { 
                cValidate :'', 
                cName: 'chequereferenceno', 
                cLabel: 'Cheque / Ref. No', 
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
            PI_chequereferencedate: { 
                cValidate :'', 
                cName: 'chequereferencedate', 
                cLabel: 'Cheque / Ref. Date', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cVisible:  true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_issuedbank: { 
                cValidate :'', 
                cName: 'issuedbank', 
                cLabel: 'Issue Bank', 
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
            PI_chequeduedate: { 
                cValidate :'', 
                cName: 'chequeduedate', 
                cLabel: 'Due Date', 
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
            PI_remarks: { 
                cValidate :'', 
                cName:'remarks', 
                cLabel:'Remarks', 
                cLabelSize: 4, 
                cOrder:0, 
                cKey: false, 
                cDefault: '', 
                cProtect: true, 
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
      OnglincometranstypeChange (data) {
        this.$nextTick(() => {
            this.M_SM_SalesDepositCancellation.glincometranstype = data.id
            this.M_SM_SalesDepositCancellation.glincometranstypeLabel = data.label
            if (this.inputStatus != "VIEW") {
//{accountcd}
            }
        })
        this.$forceUpdate()
        },//
        OnrefundtrxtypeChange (data) {
        this.$nextTick(() => {
            this.M_SM_SalesDepositCancellation.refundtrxtype = data.id
            this.M_SM_SalesDepositCancellation.refundtrxtypeLabel = data.label
            if (this.inputStatus != "VIEW") {
//{accountcd}
            }
        })
        this.$forceUpdate()
        },
        OnrefundpaymentcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_SalesDepositCancellation.refundpaymentcd = data.id
            this.M_SM_SalesDepositCancellation.refundpaymentcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{accountcd}
            }
        })
        this.$forceUpdate()
        },//
        OnbatchtotalChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{batchtotal}
            }
        })
        this.$forceUpdate()
        },
        OndepositallocationstatusChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              if(data=='I'){
                this.PI_canceldate.cProtect = false
                this.PI_glincometranstype.cProtect = false
                this.PI_refundtrxtype.cProtect = true
                this.PI_refundpaymentcd.cProtect = true
              }
              else if(data=='R'){
                this.PI_canceldate.cProtect = false
                this.PI_glincometranstype.cProtect = true
                this.PI_refundtrxtype.cProtect = false
                this.PI_refundpaymentcd.cProtect = false
              }
              else if(data=='N'){
                this.PI_canceldate.cProtect = true
                this.PI_glincometranstype.cProtect = true
                this.PI_refundtrxtype.cProtect = true
                this.PI_refundpaymentcd.cProtect = true
              }
//{depositallocationstatus}
            }
        })
        this.$forceUpdate()
        },
        OncanceldateChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{canceldate}
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
           this.getToolbar().statusFunction[0].disabled = true
           this.getToolbar().statusFunction[2].disabled = true
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
          var data = this.FormToABSList().getRowSelected()
            var dataPost = []

            data.forEach((value) => {
                // dt = dt + value.row_id + ','
                dataPost.push({
                    _Message_:"Payment No = "+value.PaymentNo,
                    SubPortfolioCd : this.getDataUser().subportfolio_cd,
                    PaymentNo : value.PaymentNo,
                    DepositAllocationStatus : value.LedgerDepositAllocationStatus,
                    PostBy : this.getDataUser().user_id
                })
            })

            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                Data: dataPost
            }
            
            this.postJSONMulti( this.getUrlPostMulti(), param )
            .then(response => {
                if (response == null) return

                this.$parent.resultPost()
            })
        },
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                
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
                PaymentNo: this.M_SM_SalesDepositCancellation.paymentno,
                DepositAllocationStatus: this.M_SM_SalesDepositCancellation.depositallocationstatus,
                RefundTrxType: this.M_SM_SalesDepositCancellation.refundtrxtype,
                CancellationDate: this.M_SM_SalesDepositCancellation.canceldate == '' || this.M_SM_SalesDepositCancellation.canceldate == null ? 'NULL' : this.M_SM_SalesDepositCancellation.canceldate ,
                RefundPaymentCd: this.M_SM_SalesDepositCancellation.refundpaymentcd,
                GLIncomeTrxType: this.M_SM_SalesDepositCancellation.glincometrxtype,
                UserEdit: this.getDataUser().user_id ,
                LastUpdateStamp: this.M_SM_SalesDepositCancellation.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_SM_SalesDepositCancellation = {
                batchno: '0',
                source: '',
                runningcd: '',
                trxtype: '',
                modulecd: '',
                paymentdate: '',
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
                depositallocationdate: '',
                currencyrate: '0',
                taxrate: 0,
                originalcurrencyrate: 0,
                trxamt: '0',
                netamt: 0,
                withholdingamt: 0,
                vatamt: 0,
                totalamt: 0,
                underpaymentamt: 0,
                bankchargesamt: '0',
                chequereferenceno: '',
                chequereferencedate: '',
                chequeduedate: '',
                issuedbank: '',
                remarks: '',
                trxtypedescs: '',
                depositallocationstatus: 'N',
                refundtrxtype: '',
                glincometrxtype: '',
                refundpaymentcd: '',
                paymentdescs: '',
                paymenttype: '',
                bankname: '',
                runningdescs: '',
                refundtranstype: '',
                refundpaymentdescs: '',
                glincometranstype: '',
                canceldate: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                lastupdatestamp: 0,
                currentbatchtotal: '',
                currentdocumentcount: '',
                referenceno: '',
                subportfoliocd: this.getDataUser().subportfolio_cd,
                timeedit: '',
                rowid: 0,
                custacno	: ''
                    }
            		
		},
        M_New(){
			
        },
        M_Edit(){
        },
        M_Delete(dt){       
           //nothing
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
this.M_SM_SalesDepositCancellation = {
                batchno: this.isCurrency(data.batchno, this.decimal),
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
                depositallocationdate: data.depositallocationdate,
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
                depositallocationstatus: data.depositallocationstatus,
                refundtrxtype: data.refundtrxtype,
                glincometrxtype: data.glincometrxtype,
                refundpaymentcd: data.refundpaymentcd,
                paymentdescs: data.paymentdescs,
                paymenttype: data.paymenttype,
                bankname: data.bankname,
                runningdescs: data.runningdescs,
                refundtranstype: data.refundtranstype,
                refundpaymentdescs: data.refundpaymentdescs,
                glincometranstype: data.glincometranstype,
                canceldate: data.canceldate,
                userinput: data.userinput,
                useredit: data.useredit,
                lastupdatestamp: record.LastUpdateStamp,
                currentbatchtotal: data.currentbatchtotal,
                currentdocumentcount: data.currentdocumentcount,
                referenceno: data.referenceno,
                subportfoliocd: data.subportfoliocd,
                timeedit: data.timeedit,
                rowid: this.isCurrency(data.rowid, this.decimal),
                custacno	: data.custacno	
                    }
                 

         

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

