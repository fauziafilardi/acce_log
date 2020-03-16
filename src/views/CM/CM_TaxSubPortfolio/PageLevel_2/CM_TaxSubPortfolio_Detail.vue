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
    />


        <div v-show="$parent.showForm"  :style="'margin-top:10px;'" class="el" mousetip mousetip-msg="I'm a tooltip">
            <div class="div-collapse" v-b-toggle.collapse1>
                <span>
                    <span style="float:Left; color: #81b3e9 !important;letter-spacing: 1px;margin-top: 2px;margin-left: 3px" >
                        Record Information <font-awesome-icon icon="sort-down" class="icon-style-1__master" /> 
                    </span>
                    <!-- <span v-show="IEBy.Input && IEBy.Edit" class="master-span">
                        Input By : {{IEBy.Input}} | Edit By : {{IEBy.Edit}} <font-awesome-icon icon="sort-down" class="icon-style-1__master" /> 
                    </span> -->
                    <span class="master-span">
                        Input By : {{IEBy.Input}} | Edit By : {{IEBy.Edit}} <font-awesome-icon icon="sort-down" class="icon-style-1__master" /> 
                    </span>
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
                                        <ABSinputTextVuex :prop="PI_taxtype" v-model="M_CM_TaxSubPortfolio_Detail.taxtype"  ref="ref_taxtype"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_descs" v-model="M_CM_TaxSubPortfolio_Detail.descs"  ref="ref_descs"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_taxrate" v-model="M_CM_TaxSubPortfolio_Detail.taxrate"  ref="ref_taxrate"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSCompute :prop="PI_taxclass" v-model="M_CM_TaxSubPortfolio_Detail.taxclass"  ref="ref_taxclass" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSCompute :prop="PI_vatreversalflag" v-model="M_CM_TaxSubPortfolio_Detail.vatreversalflag"  ref="ref_vatreversalflag" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnvatprefixcdChange" :prop="PI_vatprefixcd" :value="M_CM_TaxSubPortfolio_Detail.vatprefixcd" :label="M_CM_TaxSubPortfolio_Detail.vatprefixcdLabel" ref="ref_vatprefixcd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnvataccountcdChange" :prop="PI_vataccountcd" :value="M_CM_TaxSubPortfolio_Detail.vataccountcd" :label="M_CM_TaxSubPortfolio_Detail.vataccountcdLabel" ref="ref_vataccountcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnvatreversalprefixcdChange" :prop="PI_vatreversalprefixcd" :value="M_CM_TaxSubPortfolio_Detail.vatreversalprefixcd" :label="M_CM_TaxSubPortfolio_Detail.vatreversalprefixcdLabel" ref="ref_vatreversalprefixcd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnvatreversalaccountcdChange" :prop="PI_vatreversalaccountcd" :value="M_CM_TaxSubPortfolio_Detail.vatreversalaccountcd" :label="M_CM_TaxSubPortfolio_Detail.vatreversalaccountcdLabel" ref="ref_vatreversalaccountcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnprepaidwithholdingprefixcdChange" :prop="PI_prepaidwithholdingprefixcd" :value="M_CM_TaxSubPortfolio_Detail.prepaidwithholdingprefixcd" :label="M_CM_TaxSubPortfolio_Detail.prepaidwithholdingprefixcdLabel" ref="ref_prepaidwithholdingprefixcd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnprepaidwithholdingaccountcdChange" :prop="PI_prepaidwithholdingaccountcd" :value="M_CM_TaxSubPortfolio_Detail.prepaidwithholdingaccountcd" :label="M_CM_TaxSubPortfolio_Detail.prepaidwithholdingaccountcdLabel" ref="ref_prepaidwithholdingaccountcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnexpensewithholdingprefixcdChange" :prop="PI_expensewithholdingprefixcd" :value="M_CM_TaxSubPortfolio_Detail.expensewithholdingprefixcd" :label="M_CM_TaxSubPortfolio_Detail.expensewithholdingprefixcdLabel" ref="ref_expensewithholdingprefixcd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnexpensewithholdingaccountcdChange" :prop="PI_expensewithholdingaccountcd" :value="M_CM_TaxSubPortfolio_Detail.expensewithholdingaccountcd" :label="M_CM_TaxSubPortfolio_Detail.expensewithholdingaccountcdLabel" ref="ref_expensewithholdingaccountcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnaccruedwithholdingprefixcdChange" :prop="PI_accruedwithholdingprefixcd" :value="M_CM_TaxSubPortfolio_Detail.accruedwithholdingprefixcd" :label="M_CM_TaxSubPortfolio_Detail.accruedwithholdingprefixcdLabel" ref="ref_accruedwithholdingprefixcd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnaccruedwithholdingaccountcdChange" :prop="PI_accruedwithholdingaccountcd" :value="M_CM_TaxSubPortfolio_Detail.accruedwithholdingaccountcd" :label="M_CM_TaxSubPortfolio_Detail.accruedwithholdingaccountcdLabel" ref="ref_accruedwithholdingaccountcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnaccruedwithholdingothersprefixcdChange" :prop="PI_accruedwithholdingothersprefixcd" :value="M_CM_TaxSubPortfolio_Detail.accruedwithholdingothersprefixcd" :label="M_CM_TaxSubPortfolio_Detail.accruedwithholdingothersprefixcdLabel" ref="ref_accruedwithholdingothersprefixcd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnaccruedwithholdingothersaccountcdChange" :prop="PI_accruedwithholdingothersaccountcd" :value="M_CM_TaxSubPortfolio_Detail.accruedwithholdingothersaccountcd" :label="M_CM_TaxSubPortfolio_Detail.accruedwithholdingothersaccountcdLabel" ref="ref_accruedwithholdingothersaccountcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                      </b-col>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnexpensewithholdingstraightlineaccountcdChange" :prop="PI_expensewithholdingstraightlineaccountcd" :value="M_CM_TaxSubPortfolio_Detail.expensewithholdingstraightlineaccountcd" :label="M_CM_TaxSubPortfolio_Detail.expensewithholdingstraightlineaccountcdLabel" ref="ref_expensewithholdingstraightlineaccountcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                      </b-col>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnaccruedwithholdingstraightlineaccountcdChange" :prop="PI_accruedwithholdingstraightlineaccountcd" :value="M_CM_TaxSubPortfolio_Detail.accruedwithholdingstraightlineaccountcd" :label="M_CM_TaxSubPortfolio_Detail.accruedwithholdingstraightlineaccountcdLabel" ref="ref_accruedwithholdingstraightlineaccountcd"/>
                                      </b-col>
                                    </b-row>
                                </b-col> <!-- table close -->
                  
							</b-row>
							<!-- <ABSTAnalysis :prop="PTAnalysis" /> -->
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
                initialWhere:"cm_tax_master_h_id = '" + this.ValKey + "'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_CM_TaxSubPortfolio_Detail :{
                subportfoliocd: this.getDataUser().subportfolio_cd,
                taxcd: '',
                taxtype: '',
                vatreversalflag: '',
                vataccountcd: '',
                vatprefixcd: '',
                vatreversalaccountcd: '',
                vatreversalprefixcd: '',
                prepaidwithholdingaccountcd: '',
                prepaidwithholdingprefixcd: '',
                expensewithholdingaccountcd: '',
                expensewithholdingprefixcd: '',
                accruedwithholdingaccountcd: '',
                accruedwithholdingprefixcd: '',
                accruedwithholdingothersaccountcd: '',
                accruedwithholdingothersprefixcd: '',
                descs: '',
                taxrate: '0',
                taxclass: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                lastupdatestamp: 0,
                expensewithholdingstraightlineaccountcd: '',
                accruedwithholdingstraightlineaccountcd: '',
                rowid: 0,
                cm_tax_master_h_id:''
                    }
            ,
            PI_taxtype: { 
                cValidate :'required|max:5', 
                cName: 'taxtype', 
                cLabel: 'Tax Type', 
                cLabelSize: 4, 
                cOrder: 1, 
                cKey: true, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_descs: { 
                cValidate :'required|max:60', 
                cName: 'descs', 
                cLabel: 'Description', 
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
            PI_taxrate: { 
                cValidate :'', 
                cName: 'taxrate', 
                cLabel: 'Tax Rate', 
                cLabelSize: 4, 
                cOrder: 3, 
                cKey: true, 
                cType: 'decimal',
                cLastLabel: '%',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_taxclass: { 
                cLabel: 'Tax Class', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_vatreversalflag: { 
                cLabel: 'VAT Reversal Flag', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_vatprefixcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountPrefix'    , 
                    ColumnDB: 'PrefixCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'vatprefixcd', 
                cLabel: 'VAT Account Prefix', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 4, 
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
                cMasterUrl: 'CM/CM_SubModuleAccountPrefix' ,
                cDisplayColumn: 'prefix_cd' ,
            }, 
            PI_vataccountcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCodeBySubportfolio'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "status = 'A' AND subportfolio_cd = '"+this.getDataUser().subportfolio_cd+"'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'vataccountcd', 
                cLabel: 'VAT Account Code', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 5, 
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
                cMasterUrl: 'CM/CM_ChartOfAccount' ,
                cDisplayColumn: 'account_cd' ,
            }, 
            PI_vatreversalprefixcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountPrefix'    , 
                    ColumnDB: 'PrefixCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'vatreversalprefixcd', 
                cLabel: 'VAT Reversal Account Prefix', 
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
                cMasterUrl: 'CM/CM_SubModuleAccountPrefix' ,
                cDisplayColumn: 'prefix_cd' ,
            }, 
            PI_vatreversalaccountcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCodeBySubportfolio'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "status = 'A' AND subportfolio_cd = '"+this.getDataUser().subportfolio_cd+"'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'vatreversalaccountcd', 
                cLabel: 'VAT Reversal Account Code', 
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
                cMasterUrl: 'CM/CM_ChartOfAccount' ,
                cDisplayColumn: 'account_cd' ,
            }, 
            PI_prepaidwithholdingprefixcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountPrefix'    , 
                    ColumnDB: 'PrefixCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'prepaidwithholdingprefixcd', 
                cLabel: 'Prepaid Withholding Account Prefix', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 8, 
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
                cMasterUrl: 'CM/CM_SubModuleAccountPrefix' ,
                cDisplayColumn: 'prefix_cd' ,
            }, 
            PI_prepaidwithholdingaccountcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCodeBySubportfolio'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "status = 'A' AND subportfolio_cd = '"+this.getDataUser().subportfolio_cd+"'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'prepaidwithholdingaccountcd', 
                cLabel: 'Prepaid Withholding Account Code', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 9, 
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
                cMasterUrl: 'CM/CM_ChartOfAccount' ,
                cDisplayColumn: 'account_cd' ,
            }, 
            PI_expensewithholdingprefixcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountPrefix'    , 
                    ColumnDB: 'PrefixCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'expensewithholdingprefixcd', 
                cLabel: 'Expense Withholding Account Prefix', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 10, 
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
                cMasterUrl: 'CM/CM_SubModuleAccountPrefix' ,
                cDisplayColumn: 'prefix_cd' ,
            }, 
            PI_expensewithholdingaccountcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCodeBySubportfolio'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "status = 'A' AND subportfolio_cd = '"+this.getDataUser().subportfolio_cd+"'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'expensewithholdingaccountcd', 
                cLabel: 'Expense Withholding Account Code', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 11, 
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
                cMasterUrl: 'CM/CM_ChartOfAccount' ,
                cDisplayColumn: 'account_cd' ,
            }, 
            PI_accruedwithholdingprefixcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountPrefix'    , 
                    ColumnDB: 'PrefixCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'accruedwithholdingprefixcd', 
                cLabel: 'Accrued Withholding Account Prefix', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 12, 
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
                cMasterUrl: 'CM/CM_SubModuleAccountPrefix' ,
                cDisplayColumn: 'prefix_cd' ,
            }, 
            PI_accruedwithholdingaccountcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCodeBySubportfolio'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "status = 'A' AND subportfolio_cd = '"+this.getDataUser().subportfolio_cd+"'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'accruedwithholdingaccountcd', 
                cLabel: 'Accrued Withholding Account Code', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 13, 
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
                cMasterUrl: 'CM/CM_ChartOfAccount' ,
                cDisplayColumn: 'account_cd' ,
            }, 
            PI_accruedwithholdingothersprefixcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountPrefix'    , 
                    ColumnDB: 'PrefixCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'accruedwithholdingothersprefixcd', 
                cLabel: 'Accrued Withholding Others Prefix Code', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 14, 
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
                cMasterUrl: 'CM/CM_SubModuleAccountPrefix' ,
                cDisplayColumn: 'prefix_cd' ,
            }, 
            PI_accruedwithholdingothersaccountcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCodeBySubportfolio'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "status = 'A' AND subportfolio_cd = '"+this.getDataUser().subportfolio_cd+"'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'accruedwithholdingothersaccountcd', 
                cLabel: 'Accrued Withholding Others Account Code', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 15, 
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
                cMasterUrl: 'CM/CM_ChartOfAccount' ,
                cDisplayColumn: 'account_cd' ,
            }, 
            PI_expensewithholdingstraightlineaccountcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCodeBySubportfolio'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "status = 'A' AND subportfolio_cd = '"+this.getDataUser().subportfolio_cd+"'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'expensewithholdingstraightlineaccountcd', 
                cLabel: 'Expense Withholding Straight Line Account Code', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 16, 
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
                cMasterUrl: 'CM/CM_ChartOfAccount' ,
                cDisplayColumn: 'account_cd' ,
            }, 
            PI_accruedwithholdingstraightlineaccountcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCodeBySubportfolio'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "status = 'A' AND subportfolio_cd = '"+this.getDataUser().subportfolio_cd+"'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'accruedwithholdingstraightlineaccountcd', 
                cLabel: 'Accrued Withholding Straight Line Account Code', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 17, 
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
                cMasterUrl: 'CM/CM_ChartOfAccount' ,
                cDisplayColumn: 'account_cd' ,
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
        OnvatprefixcdChange (data) {
        if (this.M_CM_TaxSubPortfolio_Detail.vatprefixcd == data.gl_chart_of_account_prefix_id) return
        this.$nextTick(() => {
            this.M_CM_TaxSubPortfolio_Detail.vatprefixcd = data.gl_chart_of_account_prefix_id
            this.M_CM_TaxSubPortfolio_Detail.vatprefixcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{vatprefixcd}
            }
        })
        this.$forceUpdate()
        },
        OnvataccountcdChange (data) {
        if (this.M_CM_TaxSubPortfolio_Detail.vataccountcd == data.gl_subportfolio_chart_of_account_id) return
        this.$nextTick(() => {
            this.M_CM_TaxSubPortfolio_Detail.vataccountcd = data.gl_subportfolio_chart_of_account_id
            this.M_CM_TaxSubPortfolio_Detail.vataccountcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{vataccountcd}
            }
        })
        this.$forceUpdate()
        },
        OnvatreversalprefixcdChange (data) {
        if (this.M_CM_TaxSubPortfolio_Detail.vatreversalprefixcd == data.gl_chart_of_account_prefix_id) return
        this.$nextTick(() => {
            this.M_CM_TaxSubPortfolio_Detail.vatreversalprefixcd = data.gl_chart_of_account_prefix_id
            this.M_CM_TaxSubPortfolio_Detail.vatreversalprefixcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{vatreversalprefixcd}
            }
        })
        this.$forceUpdate()
        },
        OnvatreversalaccountcdChange (data) {
        if (this.M_CM_TaxSubPortfolio_Detail.vatreversalaccountcd == data.gl_subportfolio_chart_of_account_id) return
        this.$nextTick(() => {
            this.M_CM_TaxSubPortfolio_Detail.vatreversalaccountcd = data.gl_subportfolio_chart_of_account_id
            this.M_CM_TaxSubPortfolio_Detail.vatreversalaccountcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{vatreversalaccountcd}
            }
        })
        this.$forceUpdate()
        },
        OnprepaidwithholdingprefixcdChange (data) {
        if (this.M_CM_TaxSubPortfolio_Detail.prepaidwithholdingprefixcd == data.gl_chart_of_account_prefix_id) return
        this.$nextTick(() => {
            this.M_CM_TaxSubPortfolio_Detail.prepaidwithholdingprefixcd = data.gl_chart_of_account_prefix_id
            this.M_CM_TaxSubPortfolio_Detail.prepaidwithholdingprefixcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{prepaidwithholdingprefixcd}
            }
        })
        this.$forceUpdate()
        },
        OnprepaidwithholdingaccountcdChange (data) {
        if (this.M_CM_TaxSubPortfolio_Detail.prepaidwithholdingaccountcd == data.gl_subportfolio_chart_of_account_id) return
        this.$nextTick(() => {
            this.M_CM_TaxSubPortfolio_Detail.prepaidwithholdingaccountcd = data.gl_subportfolio_chart_of_account_id
            this.M_CM_TaxSubPortfolio_Detail.prepaidwithholdingaccountcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{prepaidwithholdingaccountcd}
            }
        })
        this.$forceUpdate()
        },
        OnexpensewithholdingprefixcdChange (data) {
        if (this.M_CM_TaxSubPortfolio_Detail.expensewithholdingprefixcd == data.gl_chart_of_account_prefix_id) return
        this.$nextTick(() => {
            this.M_CM_TaxSubPortfolio_Detail.expensewithholdingprefixcd = data.gl_chart_of_account_prefix_id
            this.M_CM_TaxSubPortfolio_Detail.expensewithholdingprefixcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{expensewithholdingprefixcd}
            }
        })
        this.$forceUpdate()
        },
        OnexpensewithholdingaccountcdChange (data) {
        if (this.M_CM_TaxSubPortfolio_Detail.expensewithholdingaccountcd == data.gl_subportfolio_chart_of_account_id) return
        this.$nextTick(() => {
            this.M_CM_TaxSubPortfolio_Detail.expensewithholdingaccountcd = data.gl_subportfolio_chart_of_account_id
            this.M_CM_TaxSubPortfolio_Detail.expensewithholdingaccountcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{expensewithholdingaccountcd}
            }
        })
        this.$forceUpdate()
        },
        OnaccruedwithholdingprefixcdChange (data) {
        if (this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingprefixcd == data.gl_chart_of_account_prefix_id) return
        this.$nextTick(() => {
            this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingprefixcd = data.gl_chart_of_account_prefix_id
            this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingprefixcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{accruedwithholdingprefixcd}
            }
        })
        this.$forceUpdate()
        },
        OnaccruedwithholdingaccountcdChange (data) {
        if (this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingaccountcd == data.gl_subportfolio_chart_of_account_id) return
        this.$nextTick(() => {
            this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingaccountcd = data.gl_subportfolio_chart_of_account_id
            this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingaccountcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{accruedwithholdingaccountcd}
            }
        })
        this.$forceUpdate()
        },
        OnaccruedwithholdingothersprefixcdChange (data) {
        if (this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingothersprefixcd == data.gl_chart_of_account_prefix_id) return
        this.$nextTick(() => {
            this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingothersprefixcd = data.gl_chart_of_account_prefix_id
            this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingothersprefixcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{accruedwithholdingothersprefixcd}
            }
        })
        this.$forceUpdate()
        },
        OnaccruedwithholdingothersaccountcdChange (data) {
        if (this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingothersaccountcd == data.gl_subportfolio_chart_of_account_id) return
        this.$nextTick(() => {
            this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingothersaccountcd = data.gl_subportfolio_chart_of_account_id
            this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingothersaccountcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{accruedwithholdingothersaccountcd}
            }
        })
        this.$forceUpdate()
        },
        OnexpensewithholdingstraightlineaccountcdChange (data) {
        if (this.M_CM_TaxSubPortfolio_Detail.expensewithholdingstraightlineaccountcd == data.gl_subportfolio_chart_of_account_id) return
        this.$nextTick(() => {
            this.M_CM_TaxSubPortfolio_Detail.expensewithholdingstraightlineaccountcd = data.gl_subportfolio_chart_of_account_id
            this.M_CM_TaxSubPortfolio_Detail.expensewithholdingstraightlineaccountcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{expensewithholdingstraightlineaccountcd}
            }
        })
        this.$forceUpdate()
        },
        OnaccruedwithholdingstraightlineaccountcdChange (data) {
        if (this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingstraightlineaccountcd == data.gl_subportfolio_chart_of_account_id) return
        this.$nextTick(() => {
            this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingstraightlineaccountcd = data.gl_subportfolio_chart_of_account_id
            this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingstraightlineaccountcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{accruedwithholdingstraightlineaccountcd}
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
            this.$parent.showForm = false
			
            let data = this.$store.getters.GetPage1Data
            this.M_CM_TaxSubPortfolio_Detail.taxcd = data.tax_cd 
            // this.propList.initialWhere =" tax_cd = '" + data.tax_cd + "' "
            this.propList.initialWhere = "cm_tax_master_h_id = '"+ data.row_id +"'"
        

            this.FormToABSList().doGetList('','eb_getList')
        },		       
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                tax_cd: this.M_CM_TaxSubPortfolio_Detail.taxcd,
                tax_type: this.M_CM_TaxSubPortfolio_Detail.taxtype,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                vat_account_id: this.M_CM_TaxSubPortfolio_Detail.vataccountcd == '' || this.M_CM_TaxSubPortfolio_Detail.vataccountcd == null ? 'NULL' : this.M_CM_TaxSubPortfolio_Detail.vataccountcd ,
                vat_prefix_id: this.M_CM_TaxSubPortfolio_Detail.vatprefixcd == '' || this.M_CM_TaxSubPortfolio_Detail.vatprefixcd == null ? 'NULL' : this.M_CM_TaxSubPortfolio_Detail.vatprefixcd ,
                vat_reversal_account_id: this.M_CM_TaxSubPortfolio_Detail.vatreversalaccountcd == '' || this.M_CM_TaxSubPortfolio_Detail.vatreversalaccountcd == null ? 'NULL' : this.M_CM_TaxSubPortfolio_Detail.vatreversalaccountcd ,
                vat_reversal_prefix_id: this.M_CM_TaxSubPortfolio_Detail.vatreversalprefixcd == '' || this.M_CM_TaxSubPortfolio_Detail.vatreversalprefixcd == null ? 'NULL' : this.M_CM_TaxSubPortfolio_Detail.vatreversalprefixcd ,
                prepaid_withholding_account_id: this.M_CM_TaxSubPortfolio_Detail.prepaidwithholdingaccountcd == '' || this.M_CM_TaxSubPortfolio_Detail.prepaidwithholdingaccountcd == null ? 'NULL' : this.M_CM_TaxSubPortfolio_Detail.prepaidwithholdingaccountcd ,
                prepaid_withholding_prefix_id: this.M_CM_TaxSubPortfolio_Detail.prepaidwithholdingprefixcd == '' || this.M_CM_TaxSubPortfolio_Detail.prepaidwithholdingprefixcd == null ? 'NULL' : this.M_CM_TaxSubPortfolio_Detail.prepaidwithholdingprefixcd ,
                expense_withholding_account_id: this.M_CM_TaxSubPortfolio_Detail.expensewithholdingaccountcd == '' || this.M_CM_TaxSubPortfolio_Detail.expensewithholdingaccountcd == null ? 'NULL' : this.M_CM_TaxSubPortfolio_Detail.expensewithholdingaccountcd ,
                expense_withholding_prefix_id: this.M_CM_TaxSubPortfolio_Detail.expensewithholdingprefixcd == '' || this.M_CM_TaxSubPortfolio_Detail.expensewithholdingprefixcd == null ? 'NULL' : this.M_CM_TaxSubPortfolio_Detail.expensewithholdingprefixcd ,
                accrued_withholding_account_id: this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingaccountcd == '' || this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingaccountcd == null ? 'NULL' : this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingaccountcd ,
                accrued_withholding_prefix_id: this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingprefixcd == '' || this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingprefixcd == null ? 'NULL' : this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingprefixcd ,
                accrued_withholding_others_account_id: this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingothersaccountcd == '' || this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingothersaccountcd == null ? 'NULL' : this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingothersaccountcd ,
                accrued_withholding_others_prefix_id: this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingothersprefixcd == '' || this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingothersprefixcd == null ? 'NULL' : this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingothersprefixcd ,
                user_input: this.getDataUser().user_id ,
                expense_withholding_straight_line_account_id: this.M_CM_TaxSubPortfolio_Detail.expensewithholdingstraightlineaccountcd == '' || this.M_CM_TaxSubPortfolio_Detail.expensewithholdingstraightlineaccountcd == null ? 'NULL' : this.M_CM_TaxSubPortfolio_Detail.expensewithholdingstraightlineaccountcd ,
                accrued_withholding_straight_line_account_id: this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingstraightlineaccountcd == '' || this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingstraightlineaccountcd == null ? 'NULL' : this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingstraightlineaccountcd,
                cm_tax_master_h_id: this.M_CM_TaxSubPortfolio_Detail.cm_tax_master_h_id                 

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
                tax_cd: this.M_CM_TaxSubPortfolio_Detail.taxcd,
                tax_type: this.M_CM_TaxSubPortfolio_Detail.taxtype,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                vat_account_id: this.M_CM_TaxSubPortfolio_Detail.vataccountcd == '' || this.M_CM_TaxSubPortfolio_Detail.vataccountcd == null ? 'NULL' : this.M_CM_TaxSubPortfolio_Detail.vataccountcd ,
                vat_prefix_id: this.M_CM_TaxSubPortfolio_Detail.vatprefixcd == '' || this.M_CM_TaxSubPortfolio_Detail.vatprefixcd == null ? 'NULL' : this.M_CM_TaxSubPortfolio_Detail.vatprefixcd ,
                vat_reversal_account_id: this.M_CM_TaxSubPortfolio_Detail.vatreversalaccountcd == '' || this.M_CM_TaxSubPortfolio_Detail.vatreversalaccountcd == null ? 'NULL' : this.M_CM_TaxSubPortfolio_Detail.vatreversalaccountcd ,
                vat_reversal_prefix_id: this.M_CM_TaxSubPortfolio_Detail.vatreversalprefixcd == '' || this.M_CM_TaxSubPortfolio_Detail.vatreversalprefixcd == null ? 'NULL' : this.M_CM_TaxSubPortfolio_Detail.vatreversalprefixcd ,
                prepaid_withholding_account_id: this.M_CM_TaxSubPortfolio_Detail.prepaidwithholdingaccountcd == '' || this.M_CM_TaxSubPortfolio_Detail.prepaidwithholdingaccountcd == null ? 'NULL' : this.M_CM_TaxSubPortfolio_Detail.prepaidwithholdingaccountcd ,
                prepaid_withholding_prefix_id: this.M_CM_TaxSubPortfolio_Detail.prepaidwithholdingprefixcd == '' || this.M_CM_TaxSubPortfolio_Detail.prepaidwithholdingprefixcd == null ? 'NULL' : this.M_CM_TaxSubPortfolio_Detail.prepaidwithholdingprefixcd ,
                expense_withholding_account_id: this.M_CM_TaxSubPortfolio_Detail.expensewithholdingaccountcd == '' || this.M_CM_TaxSubPortfolio_Detail.expensewithholdingaccountcd == null ? 'NULL' : this.M_CM_TaxSubPortfolio_Detail.expensewithholdingaccountcd ,
                expense_withholding_prefix_id: this.M_CM_TaxSubPortfolio_Detail.expensewithholdingprefixcd == '' || this.M_CM_TaxSubPortfolio_Detail.expensewithholdingprefixcd == null ? 'NULL' : this.M_CM_TaxSubPortfolio_Detail.expensewithholdingprefixcd ,
                accrued_withholding_account_id: this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingaccountcd == '' || this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingaccountcd == null ? 'NULL' : this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingaccountcd ,
                accrued_withholding_prefix_id: this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingprefixcd == '' || this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingprefixcd == null ? 'NULL' : this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingprefixcd ,
                accrued_withholding_others_account_id: this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingothersaccountcd == '' || this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingothersaccountcd == null ? 'NULL' : this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingothersaccountcd ,
                accrued_withholding_others_prefix_id: this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingothersprefixcd == '' || this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingothersprefixcd == null ? 'NULL' : this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingothersprefixcd ,
                user_input: this.getDataUser().user_id ,
                user_edit: this.getDataUser().user_id ,
                lastupdatestamp: this.M_CM_TaxSubPortfolio_Detail.lastupdatestamp,
                expense_withholding_straight_line_account_id: this.M_CM_TaxSubPortfolio_Detail.expensewithholdingstraightlineaccountcd == '' || this.M_CM_TaxSubPortfolio_Detail.expensewithholdingstraightlineaccountcd == null ? 'NULL' : this.M_CM_TaxSubPortfolio_Detail.expensewithholdingstraightlineaccountcd ,
                accrued_withholding_straight_line_account_id: this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingstraightlineaccountcd == '' || this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingstraightlineaccountcd == null ? 'NULL' : this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingstraightlineaccountcd                 
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })

        },
		M_ClearForm(){
            this.M_CM_TaxSubPortfolio_Detail = {
                subportfoliocd: this.getDataUser().subportfolio_cd,
                taxcd: '',
                taxtype: '',
                vatreversalflag: '',
                vataccountcd: '',
                vatprefixcd: '',
                vatreversalaccountcd: '',
                vatreversalprefixcd: '',
                prepaidwithholdingaccountcd: '',
                prepaidwithholdingprefixcd: '',
                expensewithholdingaccountcd: '',
                expensewithholdingprefixcd: '',
                accruedwithholdingaccountcd: '',
                accruedwithholdingprefixcd: '',
                accruedwithholdingothersaccountcd: '',
                accruedwithholdingothersprefixcd: '',
                descs: '',
                taxrate: '0',
                taxclass: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                lastupdatestamp: 0,
                expensewithholdingstraightlineaccountcd: '',
                accruedwithholdingstraightlineaccountcd: '',
                rowid: 0
            }
            		
		},
        M_New(){
            let data = this.$store.getters.GetPage1Data
            this.M_CM_TaxSubPortfolio_Detail.taxcd = data.tax_cd
            this.M_CM_TaxSubPortfolio_Detail.cm_tax_master_h_id = data.row_id
        },
        M_Edit(){
        },
        M_Delete(dt){           

            var data = this.FormToABSList().getRowSelected()  
            var dataDelete = []

            
            data.forEach((value) => {
                dataDelete.push({
                    tax_cd: value.tax_cd,
                    SubPortfolioCd: this.getDataUser().subportfolio_cd,
                    tax_type: value.tax_type,
                    lastupdatestamp: value.lastupdatestamp,
                    _Message_: ''
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
            console.log(record)
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                tax_cd: record.tax_cd,
                tax_type: record.tax_type,
                subportfolio_cd: record.subportfolio_cd				
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
                console.log(data)
                var taxclass = ""
                  if(data.tax_class){
                    if(data.tax_class == 'W'){
                      taxclass = "WithHolding"
                    }
                    else if(data.tax_class == 'V'){
                      taxclass = "VAT"
                    }
                    else if(data.tax_class == 'O'){
                      taxclass = "Other VAT"
                    }
                  }

                var vatreversalflag = ""
                if(data.vat_reversal_flag){
                    if(data.vat_reversal_flag == 'Y'){
                      vatreversalflag = "Yes"
                    }
                    else if(data.vat_reversal_flag == 'N'){
                      vatreversalflag = "No"
                    }
                  }

                this.M_CM_TaxSubPortfolio_Detail = {
                    subportfoliocd: data.subportfolio_cd,
                    taxcd: data.tax_cd,
                    taxtype: data.tax_type,
                    vatreversalflag: vatreversalflag,
                    vataccountcd: data.vat_account_id,
                    vatprefixcd: data.vat_prefix_id,
                    vatreversalaccountcd: data.vat_reversal_account_id,
                    vatreversalprefixcd: data.vat_reversal_prefix_id,
                    prepaidwithholdingaccountcd: data.prepaid_withholding_account_id,
                    prepaidwithholdingprefixcd: data.prepaid_withholding_prefix_id,
                    expensewithholdingaccountcd: data.expense_withholding_account_id,
                    expensewithholdingprefixcd: data.expense_withholding_prefix_id,
                    accruedwithholdingaccountcd: data.accrued_withholding_account_id,
                    accruedwithholdingprefixcd: data.accrued_withholding_prefix_id,
                    accruedwithholdingothersaccountcd: data.accrued_withholding_others_account_id,
                    accruedwithholdingothersprefixcd: data.accrued_withholding_others_prefix_id,
                    descs: data.descs,
                    taxrate: this.isCurrency(data.tax_rate, data.decimal),
                    taxclass: taxclass,
                    userinput: data.user_input,
                    useredit: data.user_edit,
                    timeinput: data.time_input,
                    timeedit: data.time_edit,
                    lastupdatestamp: data.lastupdatestamp,
                    expensewithholdingstraightlineaccountcd: data.expense_withholding_straight_line_account_id,
                    accruedwithholdingstraightlineaccountcd: data.accrued_withholding_straight_line_account_id,
                    rowid: data.row_id
                }
                 

                this.M_CM_TaxSubPortfolio_Detail.vatprefixcdLabel = this.M_CM_TaxSubPortfolio_Detail.vatprefixcd != null ? data.vat_prefix_cd   :'' 
                this.M_CM_TaxSubPortfolio_Detail.vataccountcdLabel = this.M_CM_TaxSubPortfolio_Detail.vataccountcd != null ? data.vat_account_cd   :'' 
                this.M_CM_TaxSubPortfolio_Detail.vatreversalprefixcdLabel = this.M_CM_TaxSubPortfolio_Detail.vatreversalprefixcd != null ? data.vat_reversal_prefix_cd   :'' 
                this.M_CM_TaxSubPortfolio_Detail.vatreversalaccountcdLabel = this.M_CM_TaxSubPortfolio_Detail.vatreversalaccountcd != null ? data.vat_reversal_account_cd   :'' 
                this.M_CM_TaxSubPortfolio_Detail.prepaidwithholdingprefixcdLabel = this.M_CM_TaxSubPortfolio_Detail.prepaidwithholdingprefixcd != null ? data.prepaid_withholding_prefix_cd   :'' 
                this.M_CM_TaxSubPortfolio_Detail.prepaidwithholdingaccountcdLabel = this.M_CM_TaxSubPortfolio_Detail.prepaidwithholdingaccountcd != null ? data.prepaid_withholding_account_cd   :'' 
                this.M_CM_TaxSubPortfolio_Detail.expensewithholdingprefixcdLabel = this.M_CM_TaxSubPortfolio_Detail.expensewithholdingprefixcd != null ? data.expense_withholding_prefix_cd   :'' 
                this.M_CM_TaxSubPortfolio_Detail.expensewithholdingaccountcdLabel = this.M_CM_TaxSubPortfolio_Detail.expensewithholdingaccountcd != null ? data.expense_withholding_account_cd   :'' 
                this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingprefixcdLabel = this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingprefixcd != null ? data.accrued_withholding_prefix_cd   :'' 
                this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingaccountcdLabel = this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingaccountcd != null ? data.accrued_withholding_account_cd   :'' 
                this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingothersprefixcdLabel = this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingothersprefixcd != null ? data.accrued_withholding_others_prefix_cd   :'' 
                this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingothersaccountcdLabel = this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingothersaccountcd != null ? data.accrued_withholding_others_account_cd   :'' 
                this.M_CM_TaxSubPortfolio_Detail.expensewithholdingstraightlineaccountcdLabel = this.M_CM_TaxSubPortfolio_Detail.expensewithholdingstraightlineaccountcd != null ? data.expense_withholding_straight_line_account_cd   :'' 
                this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingstraightlineaccountcdLabel = this.M_CM_TaxSubPortfolio_Detail.accruedwithholdingstraightlineaccountcd != null ? data.accrued_withholding_straight_line_account_cd   :'' 
  
                if(data.tax_class == 'W'){                    
                    this.PI_vatreversalflag.cProtect = true

                    this.PI_vataccountcd.cProtect = true            
                    this.PI_vatreversalaccountcd.cProtect =	true

                    this.PI_vatprefixcd.cProtect = true
                    this.PI_vatreversalprefixcd.cProtect =	true

                    this.PI_prepaidwithholdingprefixcd.cProtect =	false
                    this.PI_expensewithholdingprefixcd.cProtect =	false		
                    this.PI_accruedwithholdingprefixcd.cProtect =	false
                    this.PI_prepaidwithholdingaccountcd.cProtect = false
                    this.PI_expensewithholdingaccountcd.cProtect = false
                    this.PI_accruedwithholdingaccountcd.cProtect = false
                    this.PI_accruedwithholdingothersaccountcd.cProtect = false
                    this.PI_accruedwithholdingothersprefixcd.cProtect = false

                } else if(data.tax_class == 'V' || data.tax_class == 'O') {                                      
                    if(vatreversalflag == 'No'){
                        this.PI_vatreversalprefixcd.cProtect =	true
                        this.PI_vatreversalaccountcd.cProtect =	true
                    } else {
                        this.PI_vatreversalprefixcd.cProtect = false
                        this.PI_vatreversalaccountcd.cProtect =	false
                    }
                                       
                    this.PI_vatprefixcd.cProtect = false
                    this.PI_vataccountcd.cProtect = false
                    
                    this.PI_vatreversalflag.cProtect = false

                    this.PI_prepaidwithholdingaccountcd.cProtect = true
                    this.PI_prepaidwithholdingprefixcd.cProtect = true
                    this.PI_expensewithholdingprefixcd.cProtect = true
                    this.PI_expensewithholdingaccountcd.cProtect = true
                    this.PI_accruedwithholdingprefixcd.cProtect = true
                    this.PI_accruedwithholdingaccountcd.cProtect = true
                    this.PI_accruedwithholdingothersprefixcd.cProtect = true
                    this.PI_accruedwithholdingothersaccountcd.cProtect = true
                    // this.PI_ExpenseWithholdingStraightLineAccountCd.cProtect = true
                    // this.PI_AccruedWithholdingStraightLineAccountCd.cProtect = true
                }
               
                this.IEBy.Input = data.user_input
                this.IEBy.Edit = data.user_edit

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

