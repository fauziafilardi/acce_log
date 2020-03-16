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
                                        <ABSInputSelectList @change="OncontactidChange" :prop="PI_contactid" :value="M_SM_MarketingAgent.contactid" :label="M_SM_MarketingAgent.contactidLabel" ref="ref_contactid"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_referenceno" v-model="M_SM_MarketingAgent.referenceno"  ref="ref_referenceno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnreferralcontactidChange" :prop="PI_referralcontactid" :value="M_SM_MarketingAgent.referralcontactid" :label="M_SM_MarketingAgent.referralcontactidLabel" ref="ref_referralcontactid"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputDateVuex @input="OnstartdateChange" :prop="PI_startdate" v-model="M_SM_MarketingAgent.startdate"  ref="ref_startdate" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputDateVuex @input="OnlastcommissiondateChange" :prop="PI_lastcommissiondate" v-model="M_SM_MarketingAgent.lastcommissiondate"  ref="ref_lastcommissiondate" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OncommissionpaidtoChange" :prop="PI_commissionpaidto" v-model="M_SM_MarketingAgent.commissionpaidto"  ref="ref_commissionpaidto" />
                                      </b-col>
                                    </b-row>
                                    <b-row style="height: 20px !important;">
                                        <b-col md="2">
                                            <ABSLabelOnly
                                            :prop="{cLabel: '', 
                                            cLabelSize: 4, 
                                            cValue: '', 
                                            cPageLevel: PageLevel, 
                                            cTabIndex: TabIndex, 
                                            cVisible: true,
                                            cClass: 'lbl-col-align'}"
                                            />
                                        </b-col>
                                        <b-col md="1" style="text-align: center !important;">Commission</b-col>                                           
                                        <b-col md="1" style="text-align: center !important;">Tax Code </b-col>
                                        <b-col md="1" style="text-align: center !important;">Trans. Code</b-col>                                            
                                    </b-row>
                                    <b-row>
                                        <b-col md="2">
                                            <ABSLabelOnly
                                            :prop="{cLabel: 'Sales Commission Agent / Marketing', 
                                            cLabelSize: 4, 
                                            cValue: '', 
                                            cPageLevel: PageLevel, 
                                            cTabIndex: TabIndex, 
                                            cVisible: true,
                                            cClass: 'lbl-col-align'}"
                                            />
                                        </b-col>
                                        <b-col  md="1">
                                            <ABSTextBoxOnly :prop="PI_salescommissionpercentage" v-model="M_SM_MarketingAgent.salescommissionpercentage"  ref="ref_salescommissionpercentage"/>
                                        </b-col>
                                        <b-col md="1">
                                            <ABSInputSelectListOnly @change="OnmkttaxcdChange" :prop="PI_mkttaxcd" :value="M_SM_MarketingAgent.mkttaxcd" :label="M_SM_MarketingAgent.mkttaxcdLabel" ref="ref_mkttaxcd"/>
                                        </b-col>
                                        <b-col md="2">
                                            <ABSInputSelectListOnly @change="OnmkttrxtypeChange" :prop="PI_mkttrxtype" :value="M_SM_MarketingAgent.mkttrxtype" :label="M_SM_MarketingAgent.mkttrxtypeLabel" ref="ref_mkttrxtype"/>
                                        </b-col>            
                                    </b-row>                                    
                                    <b-row>
                                        <b-col md="2">
                                            <ABSLabelOnly
                                            :prop="{cLabel: 'Sales Commission Referral', 
                                            cLabelSize: 4, 
                                            cValue: '', 
                                            cPageLevel: PageLevel, 
                                            cTabIndex: TabIndex, 
                                            cVisible: true,
                                            cClass: 'lbl-col-align'}"
                                            />
                                        </b-col>
                                      <b-col  md="1">
                                        <ABSTextBoxOnly :prop="PI_salesreferralpercentage" v-model="M_SM_MarketingAgent.salesreferralpercentage"  ref="ref_salesreferralpercentage"/>
                                      </b-col>
                                      <b-col md="1">
                                        <ABSInputSelectListOnly @change="OnreferraltaxcdChange" :prop="PI_referraltaxcd" :value="M_SM_MarketingAgent.referraltaxcd" :label="M_SM_MarketingAgent.referraltaxcdLabel" ref="ref_referraltaxcd"/>
                                      </b-col>
                                      <b-col md="2">
                                        <ABSInputSelectListOnly @change="OnreferraltrxtypeChange" :prop="PI_referraltrxtype" :value="M_SM_MarketingAgent.referraltrxtype" :label="M_SM_MarketingAgent.referraltrxtypeLabel" ref="ref_referraltrxtype"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OncreditorcdChange" :prop="PI_creditorcd" :value="M_SM_MarketingAgent.creditorcd" :label="M_SM_MarketingAgent.creditorcdLabel" ref="ref_creditorcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OncategorycdChange" :prop="PI_categorycd" :value="M_SM_MarketingAgent.categorycd" :label="M_SM_MarketingAgent.categorycdLabel" ref="ref_categorycd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnstatusChange" :prop="PI_status" v-model="M_SM_MarketingAgent.status"  ref="ref_status" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnreasoncdChange" :prop="PI_reasoncd" :value="M_SM_MarketingAgent.reasoncd" :label="M_SM_MarketingAgent.reasoncdLabel" ref="ref_reasoncd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_reasondescs" v-model="M_SM_MarketingAgent.reasondescs"  ref="ref_reasondescs"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_SM_MarketingAgent.remarks"  ref="ref_remarks" />
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
                initialWhere: "AgentType = 'M' AND SubPortfolioCd='"+this.getDataUser().subportfolio_cd+"'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_SM_MarketingAgent :{
                contactid: '',
                referenceno: '',
                referralcontactid: '',
                startdate: '',
                lastcommissiondate: '',
                commissionpaidto: 'A',
                salescommissionpercentage: '',
                mkttaxcd: '',
                mkttrxtype: '',
                salesreferralpercentage: '',
                referraltaxcd: '',
                referraltrxtype: '',
                creditorcd: '',
                categorycd: '',
                status: 'A',
                reasoncd: '',
                reasondescs: '',
                remarks: '',
                lastupdatestamp:''
                    }
            ,
            PI_contactid: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMContact'    , 
                    ColumnDB: 'ContactId'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'ContactId,Name' 
                        }, 
                cValidate :'required', 
                cName: 'contactid', 
                cLabel: 'Agent ID', 
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
                cMasterUrl: 'CM/CM_Contact' ,
                cDisplayColumn: 'ContactId,Name' ,
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
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_referralcontactid: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMContact'    , 
                    ColumnDB: 'ContactId'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'ContactId,Name' 
                        }, 
                cValidate :'', 
                cName: 'referralcontactid', 
                cLabel: 'Referral Contact ID', 
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
                cMasterUrl: 'CM/CM_Contact' ,
                cDisplayColumn: 'ContactId,Name' ,
            }, 
            PI_startdate: { 
                cValidate :'', 
                cName: 'startdate', 
                cLabel: 'Start Date', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_lastcommissiondate: { 
                cValidate :'', 
                cName: 'lastcommissiondate', 
                cLabel: 'Last Commission Date', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_commissionpaidto: { 
                cValidate :'', 
                cName: 'commissionpaidto', 
                cId: 'rdbcommissionpaidto', 
                cRadioOptions: [{ text: 'Agent', value: 'A' },{ text: 'Marketing', value: 'M' },], 
                cRadioDefaultOption: 'A', 
                cLabel:'Commission paid to', 
                cLabelSize: 4, 
                cDefault: '', 
                cOrder: 0, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_salescommissionpercentage: { 
                cValidate :'', 
                cName: 'salescommissionpercentage', 
                cLabel: 'Sales Commission Agent / Marketing', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
                cLastLabelShow: true,
                cLastLabel: '%'
            }, 
            PI_mkttaxcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMTaxCode'    , 
                    ColumnDB: 'TaxCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'TaxCd' 
                        }, 
                cValidate :'', 
                cName: 'mkttaxcd', 
                cLabel: '', 
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
                cDisplayColumn: 'TaxCd' ,
            }, 
            PI_mkttrxtype: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMTransTypeBySubPortfolio'    , 
                    ColumnDB: 'TrxType'   , 
                    InitialWhere: "SubPortfolioCd='"+ this.getDataUser().subportfolio_cd +"' AND ModuleCd = 'AP' AND TrxClass= 'I'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'TransactionType,Descs' 
                        }, 
                cValidate :'', 
                cName: 'mkttrxtype', 
                cLabel: '', 
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
            PI_salesreferralpercentage: { 
                cValidate :'', 
                cName: 'salesreferralpercentage', 
                cLabel: 'Sales Commission Referral', 
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
            PI_referraltaxcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMTaxCode'    , 
                    ColumnDB: 'TaxCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'TaxCd' 
                        }, 
                cValidate :'', 
                cName: 'referraltaxcd', 
                cLabel: '', 
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
                cDisplayColumn: 'TaxCd' ,
            }, 
            PI_referraltrxtype: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMTransTypeBySubPortfolio'    , 
                    ColumnDB: 'TrxType'   , 
                    InitialWhere: "SubPortfolioCd='"+ this.getDataUser().subportfolio_cd +"' AND ModuleCd = 'AP' AND TrxClass= 'I'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'TransactionType,Descs' 
                        }, 
                cValidate :'', 
                cName: 'referraltrxtype', 
                cLabel: '', 
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
            PI_creditorcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupAPCreditor'    , 
                    ColumnDB: 'CreditorCd'   , 
                    InitialWhere: "SubPortfolioCd='"+ this.getDataUser().subportfolio_cd +"' AND STATUS = 'A'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'CreditorCd,Name' 
                        }, 
                cValidate :'required', 
                cName: 'creditorcd', 
                cLabel: 'Creditor Code ( Agent )', 
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
                cMasterUrl: 'AP/AP_Creditor' ,
                cDisplayColumn: 'CreditorCd,Name' ,
            }, 
            PI_categorycd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGroup'    , 
                    ColumnDB: 'CategoryCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'CategoryCd,Descs' 
                        }, 
                cValidate :'', 
                cName: 'categorycd', 
                cLabel: 'Unit Sales Group', 
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
                cDisplayColumn: 'CategoryCd,Descs' ,
            }, 
            PI_status: { 
                cValidate :'', 
                cName: 'status', 
                cId: 'rdbstatus', 
                cRadioOptions: [{ text: 'Active', value: 'A' }, { text: 'Non Active', value: 'N' }], 
                cRadioDefaultOption: 'A', 
                cLabel:'Status', 
                cLabelSize: 4, 
                cDefault: '', 
                cOrder: 0, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_reasoncd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMReason'    , 
                    ColumnDB: 'ReasonCd'   , 
                    InitialWhere: "ModuleCd = 'TN'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'ReasonCd,Descs' 
                        }, 
                cValidate :'', 
                cName: 'reasoncd', 
                cLabel: 'Reason', 
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
                cMasterUrl: 'CM/CM_Reason' ,
                cDisplayColumn: 'ReasonCd,Descs' ,
            }, 
            PI_reasondescs: { 
                cValidate :'max:150', 
                cName: 'reasondescs', 
                cLabel: 'Reason Description', 
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
		return this.$store.getters.GetPage1Data
	},
	GetDataBy1(){
		return this.$store.getters.GetPage1GetDataBy
	}
  },
    methods: {
        DisableReasonCd (){
            if(this.M_SM_MarketingAgent.status == 'A'){
                this.PI_reasoncd.cProtect = true
                this.PI_reasondescs.cProtect = true                
            } else {
                this.PI_reasoncd.cProtect = false
                this.PI_reasondescs.cProtect = false
                this.PI_reasoncd.cValidate = 'required'
                this.PI_reasondescs.cValidate = 'required|max:150'
            }
        },		
        OncontactidChange (data) {
        this.$nextTick(() => {
            this.M_SM_MarketingAgent.contactid = data.id
            this.M_SM_MarketingAgent.contactidLabel = data.label
            if (this.inputStatus != "VIEW") {
//{contactid}
            }
        })
        this.$forceUpdate()
        },
        OnreferralcontactidChange (data) {
        this.$nextTick(() => {
            this.M_SM_MarketingAgent.referralcontactid = data.id
            this.M_SM_MarketingAgent.referralcontactidLabel = data.label
            if (this.inputStatus != "VIEW") {
//{referralcontactid}
            }
        })
        this.$forceUpdate()
        },
        OnstartdateChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{startdate}
            }
        })
        this.$forceUpdate()
        },
        OnlastcommissiondateChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{lastcommissiondate}
            }
        })
        this.$forceUpdate()
        },
        OncommissionpaidtoChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{commissionpaidto}
            }
        })
        this.$forceUpdate()
        },
        OnmkttaxcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_MarketingAgent.mkttaxcd = data.id
            this.M_SM_MarketingAgent.mkttaxcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{mkttaxcd}
            }
        })
        this.$forceUpdate()
        },
        OnmkttrxtypeChange (data) {
        this.$nextTick(() => {
            this.M_SM_MarketingAgent.mkttrxtype = data.id
            this.M_SM_MarketingAgent.mkttrxtypeLabel = data.label
            if (this.inputStatus != "VIEW") {
//{mkttrxtype}
            }
        })
        this.$forceUpdate()
        },
        OnreferraltaxcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_MarketingAgent.referraltaxcd = data.id
            this.M_SM_MarketingAgent.referraltaxcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{referraltaxcd}
            }
        })
        this.$forceUpdate()
        },
        OnreferraltrxtypeChange (data) {
        this.$nextTick(() => {
            this.M_SM_MarketingAgent.referraltrxtype = data.id
            this.M_SM_MarketingAgent.referraltrxtypeLabel = data.label
            if (this.inputStatus != "VIEW") {
//{referraltrxtype}
            }
        })
        this.$forceUpdate()
        },
        OncreditorcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_MarketingAgent.creditorcd = data.id
            this.M_SM_MarketingAgent.creditorcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{creditorcd}
            }
        })
        this.$forceUpdate()
        },
        OncategorycdChange (data) {
        this.$nextTick(() => {
            this.M_SM_MarketingAgent.categorycd = data.id
            this.M_SM_MarketingAgent.categorycdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{categorycd}
            }
        })
        this.$forceUpdate()
        },
        OnstatusChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
                if(data == 'A'){
                    this.PI_reasoncd.cProtect = true
                    this.PI_reasondescs.cProtect = true
                    this.M_SM_MarketingAgent.reasoncd = ''
                    this.M_SM_MarketingAgent.reasondescs = ''
                    this.PI_reasoncd.cValidate = ''
                    this.PI_reasondescs.cValidate = 'max:150'

                } else {
                    this.PI_reasoncd.cProtect = false
                    this.PI_reasondescs.cProtect = false
                    this.PI_reasoncd.cValidate = 'required'
                    this.PI_reasondescs.cValidate = 'required|max:150'
                }
            }
        })
        this.$forceUpdate()
        },
        OnreasoncdChange (data) {
        this.$nextTick(() => {
            this.M_SM_MarketingAgent.reasoncd = data.id
            this.M_SM_MarketingAgent.reasoncdLabel = data.label
            this.M_SM_MarketingAgent.reasondescs = data.Descs
            if (this.inputStatus != "VIEW") {
//{reasoncd}
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
		M_CheckboxChecked(data, status, index){

        },		
        M_Post(dt){
        },
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                ContactId: this.M_SM_MarketingAgent.contactid == '' || this.M_SM_MarketingAgent.contactid == null ? 'NULL' : this.M_SM_MarketingAgent.contactid ,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                ReferenceNo: this.M_SM_MarketingAgent.referenceno,
                StartDate: this.M_SM_MarketingAgent.startdate == '' || this.M_SM_MarketingAgent.startdate == null ? 'NULL' : this.M_SM_MarketingAgent.startdate ,
                CommissionType: 'P',
                CommissionValue: 0,
                Status: this.M_SM_MarketingAgent.status,
                ReasonCd: this.M_SM_MarketingAgent.reasoncd == '' || this.M_SM_MarketingAgent.reasoncd == null ? 'NULL' : this.M_SM_MarketingAgent.reasoncd ,
                ReasonDescs: this.M_SM_MarketingAgent.reasondescs,
                Remarks: this.M_SM_MarketingAgent.remarks,
                UserInput: this.getDataUser().user_id ,
                LastCommissionDate: this.M_SM_MarketingAgent.lastcommissiondate == '' || this.M_SM_MarketingAgent.lastcommissiondate == null ? 'NULL' : this.M_SM_MarketingAgent.lastcommissiondate ,
                CategoryCd: this.M_SM_MarketingAgent.categorycd == '' || this.M_SM_MarketingAgent.categorycd == null ? 'NULL' : this.M_SM_MarketingAgent.categorycd ,
                AgentType: 'M',
                ReferralContactID: this.M_SM_MarketingAgent.referralcontactid == '' || this.M_SM_MarketingAgent.referralcontactid == null ? 'NULL' : this.M_SM_MarketingAgent.referralcontactid ,
                CommissionPaidTo: this.M_SM_MarketingAgent.commissionpaidto,
                SalesCommissionPercentage: this.M_SM_MarketingAgent.salescommissionpercentage,
                SalesReferralPercentage: this.M_SM_MarketingAgent.salesreferralpercentage,
                CreditorCd: this.M_SM_MarketingAgent.creditorcd == '' || this.M_SM_MarketingAgent.creditorcd == null ? 'NULL' : this.M_SM_MarketingAgent.creditorcd ,
                MktTaxCd: this.M_SM_MarketingAgent.mkttaxcd == '' || this.M_SM_MarketingAgent.mkttaxcd == null ? 'NULL' : this.M_SM_MarketingAgent.mkttaxcd ,
                MktTrxType: this.M_SM_MarketingAgent.mkttrxtype == '' || this.M_SM_MarketingAgent.mkttrxtype == null ? 'NULL' : this.M_SM_MarketingAgent.mkttrxtype ,
                ReferralTaxCd: this.M_SM_MarketingAgent.referraltaxcd == '' || this.M_SM_MarketingAgent.referraltaxcd == null ? 'NULL' : this.M_SM_MarketingAgent.referraltaxcd ,
                ReferralTrxType: this.M_SM_MarketingAgent.referraltrxtype == '' || this.M_SM_MarketingAgent.referraltrxtype == null ? 'NULL' : this.M_SM_MarketingAgent.referraltrxtype                 
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
                ContactId: this.M_SM_MarketingAgent.contactid == '' || this.M_SM_MarketingAgent.contactid == null ? 'NULL' : this.M_SM_MarketingAgent.contactid ,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                ReferenceNo: this.M_SM_MarketingAgent.referenceno,
                StartDate: this.M_SM_MarketingAgent.startdate == '' || this.M_SM_MarketingAgent.startdate == null ? 'NULL' : this.M_SM_MarketingAgent.startdate ,
                CommissionType: 'P',
                CommissionValue: 0,
                Status: this.M_SM_MarketingAgent.status,
                ReasonCd: this.M_SM_MarketingAgent.reasoncd == '' || this.M_SM_MarketingAgent.reasoncd == null ? 'NULL' : this.M_SM_MarketingAgent.reasoncd ,
                ReasonDescs: this.M_SM_MarketingAgent.reasondescs,
                Remarks: this.M_SM_MarketingAgent.remarks,
                UserEdit: this.getDataUser().user_id ,
                LastUpdateStamp: this.M_SM_MarketingAgent.lastupdatestamp,
                LastCommissionDate: this.M_SM_MarketingAgent.lastcommissiondate == '' || this.M_SM_MarketingAgent.lastcommissiondate == null ? 'NULL' : this.M_SM_MarketingAgent.lastcommissiondate ,
                CategoryCd: this.M_SM_MarketingAgent.categorycd == '' || this.M_SM_MarketingAgent.categorycd == null ? 'NULL' : this.M_SM_MarketingAgent.categorycd ,
                AgentType: 'M',
                ReferralContactID: this.M_SM_MarketingAgent.referralcontactid == '' || this.M_SM_MarketingAgent.referralcontactid == null ? 'NULL' : this.M_SM_MarketingAgent.referralcontactid ,
                CommissionPaidTo: this.M_SM_MarketingAgent.commissionpaidto,
                SalesCommissionPercentage: this.M_SM_MarketingAgent.salescommissionpercentage,
                SalesReferralPercentage: this.M_SM_MarketingAgent.salesreferralpercentage,
                CreditorCd: this.M_SM_MarketingAgent.creditorcd == '' || this.M_SM_MarketingAgent.creditorcd == null ? 'NULL' : this.M_SM_MarketingAgent.creditorcd ,
                MktTaxCd: this.M_SM_MarketingAgent.mkttaxcd == '' || this.M_SM_MarketingAgent.mkttaxcd == null ? 'NULL' : this.M_SM_MarketingAgent.mkttaxcd ,
                MktTrxType: this.M_SM_MarketingAgent.mkttrxtype == '' || this.M_SM_MarketingAgent.mkttrxtype == null ? 'NULL' : this.M_SM_MarketingAgent.mkttrxtype ,
                ReferralTaxCd: this.M_SM_MarketingAgent.referraltaxcd == '' || this.M_SM_MarketingAgent.referraltaxcd == null ? 'NULL' : this.M_SM_MarketingAgent.referraltaxcd ,
                ReferralTrxType: this.M_SM_MarketingAgent.referraltrxtype == '' || this.M_SM_MarketingAgent.referraltrxtype == null ? 'NULL' : this.M_SM_MarketingAgent.referraltrxtype                 
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_SM_MarketingAgent = {
                contactid: '',
                referenceno: '',
                referralcontactid: '',
                startdate: '',
                lastcommissiondate: '',
                commissionpaidto: 'A',
                salescommissionpercentage: '',
                mkttaxcd: '',
                mkttrxtype: '',
                salesreferralpercentage: '',
                referraltaxcd: '',
                referraltrxtype: '',
                creditorcd: '',
                categorycd: '',
                status: 'A',
                reasoncd: '',
                reasondescs: '',
                remarks: '',
                lastupdatestamp:''
                    }
            	
	
		},
        M_New(){
            this.DisableReasonCd()			
        },
        M_Edit(){
        },
        M_Delete(dt){       
			var data = this.FormToABSList().getRowSelected()  
			var dataDelete = []

			
			data.forEach((value) => {

				
				dataDelete.push({
					_Message_:'',
                    ContactId: value.ContactID == '' || value.ContactID == null ? 'NULL' : value.ContactID ,
                    SubPortfolioCd: this.getDataUser().subportfolio_cd,
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
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order
,                contactid: record.ContactID,
                SubPortfolioCd: this.getDataUser().subportfolio_cd
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
this.M_SM_MarketingAgent = {
                contactid: data.contactid,
                referenceno: data.referenceno,
                referralcontactid: data.referralcontactid,
                startdate: data.startdate,
                lastcommissiondate: data.lastcommissiondate,
                commissionpaidto: data.commissionpaidto,
                salescommissionpercentage: this.isCurrency(data.salescommissionpercentage, this.decimal),
                mkttaxcd: data.mkttaxcd,
                mkttrxtype: data.mkttrxtype,
                salesreferralpercentage: this.isCurrency(data.salesreferralpercentage, this.decimal),
                referraltaxcd: data.referraltaxcd,
                referraltrxtype: data.referraltrxtype,
                creditorcd: data.creditorcd,
                categorycd: data.categorycd,
                status: data.status,
                reasoncd: data.reasoncd,
                reasondescs: data.reasondescs,
                remarks: data.remarks,
                lastupdatestamp: record.LastUpdateStamp
                    }
                 

                this.M_SM_MarketingAgent.contactidLabel = this.M_SM_MarketingAgent.contactid != null && this.M_SM_MarketingAgent.contactid != '' ? data.contactid + this.separator + data.contactname :'' 
                this.M_SM_MarketingAgent.referralcontactidLabel = this.M_SM_MarketingAgent.referralcontactid != null && this.M_SM_MarketingAgent.referralcontactid != '' ? data.referralcontactid + this.separator + data.referralcontactidname :'' 
                this.M_SM_MarketingAgent.mkttaxcdLabel = this.M_SM_MarketingAgent.mkttaxcd != null && this.M_SM_MarketingAgent.mkttaxcd != '' ? data.mkttaxcd :'' 
                this.M_SM_MarketingAgent.mkttrxtypeLabel = this.M_SM_MarketingAgent.mkttrxtype != null && this.M_SM_MarketingAgent.mkttrxtype != '' ? data.mkttrxtype + this.separator + data.mkttrxtypedescs :'' 
                this.M_SM_MarketingAgent.referraltaxcdLabel = this.M_SM_MarketingAgent.referraltaxcd != null && this.M_SM_MarketingAgent.referraltaxcd != '' ? data.referraltaxcd :'' 
                this.M_SM_MarketingAgent.referraltrxtypeLabel = this.M_SM_MarketingAgent.referraltrxtype != null && this.M_SM_MarketingAgent.referraltrxtype != '' ? data.referraltrxtype + this.separator + data.referraltrxtypedescs :'' 
                this.M_SM_MarketingAgent.creditorcdLabel = this.M_SM_MarketingAgent.creditorcd != null && this.M_SM_MarketingAgent.creditorcd != '' ? data.creditorcd + this.separator + data.creditorname :'' 
                this.M_SM_MarketingAgent.categorycdLabel = this.M_SM_MarketingAgent.categorycd != null && this.M_SM_MarketingAgent.categorycd != '' ? data.categorycd + this.separator + data.categorydescs :'' 
                this.M_SM_MarketingAgent.reasoncdLabel = this.M_SM_MarketingAgent.reasoncd != null && this.M_SM_MarketingAgent.reasoncd != '' ? data.reasoncd + this.separator + data.reasondescs :'' 
         

                this.IEBy.Input = data.userinput
                this.IEBy.Edit = data.useredit

            })
        }

    },
    beforeCreate: function () {
    },
    created: function() {
        this.DisableReasonCd()
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

