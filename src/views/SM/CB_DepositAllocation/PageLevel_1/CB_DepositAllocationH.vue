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
                                        <ABSinputCheckBox @input="OndepositallocationpostingstatusChange" :prop="PI_depositallocationpostingstatus" v-model="M_CB_DepositAllocationH.depositallocationpostingstatus"  ref="ref_depositallocationpostingstatus" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col md="6">
                                        <ABSinputTextVuex @input="OntrxtypeChange" :prop="PI_trxtype" v-model="M_CB_DepositAllocationH.trxtypeLabel"  ref="ref_trxtype"/>
                                      </b-col>
                                      <!-- <b-col md="4">
                                        <ABSCompute :prop="PI_trxtypedescs" v-model="M_CB_DepositAllocationH.trxtypedescs"  ref="ref_trxtypedescs" />
                                      </b-col> -->
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_trxamt" v-model="M_CB_DepositAllocationH.trxamt"  ref="ref_trxamt"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_paymentno" v-model="M_CB_DepositAllocationH.paymentno"  ref="ref_paymentno"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_bankchargesamt" v-model="M_CB_DepositAllocationH.bankchargesamt"  ref="ref_bankchargesamt"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputDateVuex :prop="PI_paymentdate" v-model="M_CB_DepositAllocationH.paymentdate"  ref="ref_paymentdate"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_overpaymentamt" v-model="M_CB_DepositAllocationH.overpaymentamt"  ref="ref_overpaymentamt"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputDateVuex @input="OndepositallocationdateChange" :prop="PI_depositallocationdate" v-model="M_CB_DepositAllocationH.depositallocationdate"  ref="ref_depositallocationdate" />
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_underpaymentamt" v-model="M_CB_DepositAllocationH.underpaymentamt"  ref="ref_underpaymentamt"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_referenceno" v-model="M_CB_DepositAllocationH.referenceno"  ref="ref_referenceno"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_totalallocationamt" v-model="M_CB_DepositAllocationH.totalallocationamt"  ref="ref_totalallocationamt"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_descs" v-model="M_CB_DepositAllocationH.descs"  ref="ref_descs"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_totalallocatedamt" v-model="M_CB_DepositAllocationH.totalallocatedamt"  ref="ref_totalallocatedamt"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OndebtorcdChange" :prop="PI_debtorcd" :value="M_CB_DepositAllocationH.debtorcd" :label="M_CB_DepositAllocationH.debtorcdLabel" ref="ref_debtorcd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_balance" v-model="M_CB_DepositAllocationH.balance"  ref="ref_balance"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_paymentcd" v-model="M_CB_DepositAllocationH.paymentcdLabel"  ref="ref_paymentcd"/>
                                      </b-col>
                                      <!-- <b-col md="4">
                                        <ABSCompute :prop="PI_paymentdescs" v-model="M_CB_DepositAllocationH.paymentdescs"  ref="ref_paymentdescs" />
                                      </b-col> -->
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_salesorno" v-model="M_CB_DepositAllocationH.salesorno"  ref="ref_salesorno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_bankcd" v-model="M_CB_DepositAllocationH.bankcdLabel"  ref="ref_bankcd"/>
                                      </b-col>
                                      <!-- <b-col md="6">
                                        <ABSCompute :prop="PI_bankcd" v-model="M_CB_DepositAllocationH.bankcd"  ref="ref_bankcd" />
                                      </b-col> -->
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_currencycd" v-model="M_CB_DepositAllocationH.currencycd"  ref="ref_currencycd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_currencyrate" v-model="M_CB_DepositAllocationH.currencyrate"  ref="ref_currencyrate"/>
                                      </b-col>
                                    </b-row>
                                    <div class="div-collapse">
                                        <span class="master-span-form">
                                            Cheque / Reference No
                                        </span>
                                    </div>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_customerbankaccountno" v-model="M_CB_DepositAllocationH.customerbankaccountno"  ref="ref_customerbankaccountno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_chequereferenceno" v-model="M_CB_DepositAllocationH.chequereferenceno"  ref="ref_chequereferenceno"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputDateVuex :prop="PI_chequereferencedate" v-model="M_CB_DepositAllocationH.chequereferencedate"  ref="ref_chequereferencedate"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_issuedbank" v-model="M_CB_DepositAllocationH.issuedbank"  ref="ref_issuedbank"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputDateVuex :prop="PI_chequeduedate" v-model="M_CB_DepositAllocationH.chequeduedate"  ref="ref_chequeduedate"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_CB_DepositAllocationH.remarks"  ref="ref_remarks" />
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
                initialWhere: "SubPortfolioCd = '" + this.getDataUser().subportfolio_cd + "'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			
            RunningCd: '',

            M_CB_DepositAllocationH :{
                batchno: 0,
                source: '',
                runningcd: '',
                trxtype: '',
                trxtypeLabel: '',
                paymentcdLabel: '',
                bankcdLabel: '',
                modulecd: '',
                paymentdate: '',
                depositallocationdate: '',
                descs: '',
                debtorcd: '',
                debtorcdLabel: '',
                debtorname: '',
                paymentcategory: '',
                paymentno: '',
                documentcount: 0,
                batchtotal: 0,
                batchstatus: '',
                paymentcd: '',
                bankcd: '',
                currencycd: '',
                currencyrate: '0',
                taxrate: 0,
                originalcurrencyrate: 0,
                trxamt: '0',
                netamt: 0,
                withholdingamt: 0,
                vatamt: 0,
                totalamt: 0,
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
                depositallocationpostingstatus: '',
                salesorno: '',
                subportfoliocd: this.getDataUser().subportfolio_cd,
                timeedit: '',
                balance: '0'
                    }
            ,
            PI_depositallocationpostingstatus: { 
                cValidate :'', 
                cName: 'depositallocationpostingstatus', 
                cLabel: '', 
                cLabelSize: 4, 
                cOptions: [], 
                cOrder: 0, 
                cKey: true, 
                cVisible: true, 
                cProtect: false, 
                cDefault: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_trxtype: { 
                cValidate :'required', 
                cName: 'trxtype', 
                cLabel: 'Trans. Type', 
                cLabelSize: 4, 
                cOrder: 2, 
                cKey: true, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
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
            PI_trxamt: { 
                cValidate :'', 
                cName: 'trxamt', 
                cLabel: 'Trans. Amount', 
                cLabelSize: 4, 
                cOrder: 10, 
                cKey: true, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_paymentno: { 
                cValidate :'required', 
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
                cKey: true, 
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
                cKey: true,
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
            PI_depositallocationdate: { 
                cValidate :'required', 
                cName: 'depositallocationdate', 
                cLabel: 'Deposit Alloc. Date ', 
                cLabelSize: 4, 
                cOrder: 4, 
                cKey: false, 
                cVisible:  true, 
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
            PI_referenceno: { 
                cValidate :'', 
                cName: 'referenceno', 
                cLabel: 'Reference No', 
                cLabelSize: 4, 
                cOrder: 5, 
                cKey: true, 
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
                cKey: true, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_descs: { 
                cValidate :'', 
                cName: 'descs', 
                cLabel: 'Description', 
                cLabelSize: 4, 
                cOrder: 6, 
                cKey: true, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_totalallocatedamt: { 
                cValidate :'', 
                cName: 'totalallocatedamt', 
                cLabel: 'Allocated Amount', 
                cLabelSize: 4, 
                cOrder: 15, 
                cKey: true, 
                cType: 'decimal',
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
            PI_balance: { 
                cValidate :'', 
                cName: 'balance', 
                cLabel: 'Balance', 
                cLabelSize: 4, 
                cOrder: 16, 
                cKey: true, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_paymentcd: { 
                cValidate :'', 
                cName: 'paymentcd', 
                cLabel: 'Payment Type ', 
                cLabelSize: 4, 
                cOrder: 8, 
                cKey: true, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_paymentdescs: { 
                cLabel: '', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: false 
            }, 
            PI_salesorno: { 
                cValidate :'', 
                cName: 'salesorno', 
                cLabel: 'Sales OR No', 
                cLabelSize: 4, 
                cOrder: 8, 
                cKey: true, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_bankcd: { 
                cValidate :'required', 
                cName: 'bankcd', 
                cLabel: 'Bank ', 
                cLabelSize: 4, 
                cOrder: 9, 
                cKey: true, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
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
                cKey: true, 
                cType: 'text',
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
                cKey: true, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_customerbankaccountno: { 
                cValidate :'', 
                cName: 'customerbankaccountno', 
                cLabel: 'Customer Bank A/C', 
                cLabelSize: 4, 
                cOrder: 17, 
                cKey: true, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_chequereferenceno: { 
                cValidate :'', 
                cName: 'chequereferenceno', 
                cLabel: 'Cheque / Ref. No', 
                cLabelSize: 4, 
                cOrder: 18, 
                cKey: true, 
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
                cOrder: 20, 
                cKey: true, 
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_issuedbank: { 
                cValidate :'', 
                cName: 'issuedbank', 
                cLabel: 'Issue Bank', 
                cLabelSize: 4, 
                cOrder: 19, 
                cKey: true, 
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
                cKey: true, 
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
                cOrder:22, 
                cKey: true, 
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
        OndebtorcdChange (data) {
        this.$nextTick(() => {
            this.M_CB_DepositAllocationH.debtorcd = data.id
            this.M_CB_DepositAllocationH.debtorcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{debtorcd}
            }
        })
        this.$forceUpdate()
        },		
        OndepositallocationpostingstatusChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{depositallocationpostingstatus}
            }
        })
        this.$forceUpdate()
        },
        OntrxtypeChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
        this.FnGetTrxTypeData(this.getDataUser().subportfolio_cd).then(dt24 => 
        { if (dt24 != null) { 
             this.M_CB_DepositAllocationH.trxtypedescs = dt25.TrxTypeDescs
             if (dt24.RunningCd != "")
                  { this.RunningCd = dt24.RunningCd
                  this.PI_paymentno.cProtect = true
                  this.M_CB_DepositAllocationH.paymentno = "(auto)" }
        else {
             this.RunningCd = ""
                  this.PI_paymentno.cProtect = false
                  this.M_CB_DepositAllocationH.paymentno = "" } } })

            }
        })
        this.$forceUpdate()
        },
        OndepositallocationdateChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{depositallocationdate}
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
          this.getToolbar().statusFunction[0].disabled = true
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
              dataPost.push({
                  SubPortfolioCd: this.getDataUser().subportfolio_cd,
                  PaymentNo: value.PaymentNo,
                  PostBy: this.getDataUser().user_id,
                  _Message_: "Payment No = "+value.PaymentNo
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
        },
        M_Update() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                TrxType: this.M_CB_DepositAllocationH.trxtype,
                PaymentNo: this.M_CB_DepositAllocationH.paymentno,
                PaymentDate: this.M_CB_DepositAllocationH.paymentdate == '' || this.M_CB_DepositAllocationH.paymentdate == null ? 'NULL' : this.M_CB_DepositAllocationH.paymentdate,
                DepositAllocDate: this.M_CB_DepositAllocationH.depositallocationdate == '' || this.M_CB_DepositAllocationH.depositallocationdate == null ? 'NULL' : this.M_CB_DepositAllocationH.depositallocationdate ,
                Descs: this.M_CB_DepositAllocationH.descs,
                DebtorCd: this.M_CB_DepositAllocationH.debtorcd == '' || this.M_CB_DepositAllocationH.debtorcd == null ? 'NULL' : this.M_CB_DepositAllocationH.debtorcd,
                TrxAmt: this.M_CB_DepositAllocationH.trxamt ? this.replaceAllString(this.M_CB_DepositAllocationH.trxamt,',','','number') : 0 ,
                BankChargesAmt: this.M_CB_DepositAllocationH.bankchargesamt ? this.replaceAllString(this.M_CB_DepositAllocationH.bankchargesamt,',','','number') : 0 ,
                OverPaymentAmt: this.M_CB_DepositAllocationH.overpaymentamt ? this.replaceAllString(this.M_CB_DepositAllocationH.overpaymentamt,',','','number') : 0 ,
                UnderPaymentAmt: this.M_CB_DepositAllocationH.underpaymentamt ? this.replaceAllString(this.M_CB_DepositAllocationH.underpaymentamt,',','','number') : 0 ,
                PaymentCd: this.M_CB_DepositAllocationH.paymentcd == '' || this.M_CB_DepositAllocationH.paymentcd == null ? 'NULL' : this.M_CB_DepositAllocationH.paymentcd,
                BankCd: this.M_CB_DepositAllocationH.bankcd == '' || this.M_CB_DepositAllocationH.bankcd == null ? 'NULL' : this.M_CB_DepositAllocationH.bankcd,
                CurrencyCd: this.M_CB_DepositAllocationH.currencycd == '' || this.M_CB_DepositAllocationH.currencycd == null ? 'NULL' : this.M_CB_DepositAllocationH.currencycd,
                CurrencyRate: this.M_CB_DepositAllocationH.currencyrate ? this.replaceAllString(this.M_CB_DepositAllocationH.currencyrate,',','','number') : 0 ,
                TaxCurrencyRate: 0, //this.M_CB_DepositAllocationH.taxcurrencyrate,
                ChequeReferenceNo: this.M_CB_DepositAllocationH.chequereferenceno,
                ChequeReferenceDate: this.M_CB_DepositAllocationH.chequereferencedate == '' || this.M_CB_DepositAllocationH.chequereferencedate == null ? 'NULL' : this.M_CB_DepositAllocationH.chequereferencedate,
                ChequeDueDate: this.M_CB_DepositAllocationH.chequeduedate == '' || this.M_CB_DepositAllocationH.chequeduedate == null ? 'NULL' : this.M_CB_DepositAllocationH.chequeduedate,
                IssuedBank: this.M_CB_DepositAllocationH.issuedbank,
                Remarks: this.M_CB_DepositAllocationH.remarks,
                UserEdit: this.getDataUser().user_id ,
                EntryType: "D", //this.M_CB_DepositAllocationH.entrytype,
                ReferenceNo: this.M_CB_DepositAllocationH.referenceno,
                LastUpdateStamp: this.M_CB_DepositAllocationH.lastupdatestamp,
                CustomerBankAccountNo: this.M_CB_DepositAllocationH.customerbankaccountno                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
              if(response == null) return
              this.$parent.resultUpdate(response.Message)
            })
        },
		M_ClearForm(){
            this.M_CB_DepositAllocationH = {
                batchno: 0,
                source: '',
                runningcd: '',
                trxtype: '',
                trxtypeLabel: '',
                paymentcdLabel: '',
                bankcdLabel: '',
                modulecd: '',
                paymentdate: '',
                depositallocationdate: '',
                descs: '',
                debtorcd: '',
                debtorcdLabel: '',
                debtorname: '',
                paymentcategory: '',
                paymentno: '',
                documentcount: 0,
                batchtotal: 0,
                batchstatus: '',
                paymentcd: '',
                bankcd: '',
                currencycd: '',
                currencyrate: '0',
                taxrate: 0,
                originalcurrencyrate: 0,
                trxamt: '0',
                netamt: 0,
                withholdingamt: 0,
                vatamt: 0,
                totalamt: 0,
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
                depositallocationpostingstatus: '',
                salesorno: '',
                subportfoliocd: this.getDataUser().subportfolio_cd,
                timeedit: '',
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
              PaymentNo: value.BatchNo,
              // BatchNo: value.BatchNo,
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
this.M_CB_DepositAllocationH = {
                batchno: data.batchno,
                source: data.source,
                runningcd: data.runningcd,
                trxtype: data.trxtype,
                modulecd: data.modulecd,
                paymentdate: data.paymentdate,
                depositallocationdate: data.depositallocationdate,
                descs: data.descs,
                debtorcd: data.debtorcd,
                debtorname: data.debtorname,
                paymentcategory: data.paymentcategory,
                paymentno: data.paymentno,
                documentcount: this.isCurrency(data.documentcount, this.decimal),
                batchtotal: this.isCurrency(data.batchtotal, this.decimal),
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
                currentbatchtotal: this.isCurrency(data.currentbatchtotal, this.decimal),
                currentdocumentcount: this.isCurrency(data.currentdocumentcount, this.decimal),
                referenceno: data.referenceno,
                totalallocationamt: this.isCurrency(data.totalallocationamt, this.decimal),
                totalallocatedamt: this.isCurrency(data.totalallocatedamt, this.decimal),
                status: data.status,
                depositallocationpostingstatus: data.depositallocationpostingstatus,
                salesorno: data.salesorno,
                subportfoliocd: data.subportfoliocd,
                timeedit: data.timeedit,
                balance: this.isCurrency((data.totalallocationamt - data.totalallocatedamt), this.decimal)
                    }
                
                this.M_CB_DepositAllocationH.trxtypeLabel = data.trxtype && data.trxtype != "" ? data.trxtype + this.separator + data.trxtypedescs : ""
                this.M_CB_DepositAllocationH.debtorcdLabel = data.debtorcd && data.debtorcd != "" ? data.debtorcd + this.separator + data.debtorname : ""
                this.M_CB_DepositAllocationH.paymentcdLabel = data.paymentcd && data.paymentcd != "" ? data.paymentcd + this.separator + data.paymentdescs : ""
                this.M_CB_DepositAllocationH.bankcdLabel = data.bankcd && data.bankcd != "" ? data.bankcd + this.separator + data.bankname : ""

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

