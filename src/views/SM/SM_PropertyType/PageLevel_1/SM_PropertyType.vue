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
                                        <ABSinputTextVuex :prop="PI_propertytypecd" v-model="M_SM_PropertyType.propertytypecd"  ref="ref_propertytypecd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_descs" v-model="M_SM_PropertyType.descs"  ref="ref_descs"/>
                                      </b-col>
                                    </b-row>
                                    <div class="div-collapse">
                                        <span class="master-span-form">
                                            Unit 
                                        </span>
                                    </div>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnunitaraccountcdChange" :prop="PI_unitaraccountcd" :value="M_SM_PropertyType.unitaraccountcd" :label="M_SM_PropertyType.unitaraccountcdLabel" ref="ref_unitaraccountcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnunitdefferedincomeaccountcdChange" :prop="PI_unitdefferedincomeaccountcd" :value="M_SM_PropertyType.unitdefferedincomeaccountcd" :label="M_SM_PropertyType.unitdefferedincomeaccountcdLabel" ref="ref_unitdefferedincomeaccountcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnlandsalesaccountcdChange" :prop="PI_landsalesaccountcd" :value="M_SM_PropertyType.landsalesaccountcd" :label="M_SM_PropertyType.landsalesaccountcdLabel" ref="ref_landsalesaccountcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnbuildingsalesaccountcdChange" :prop="PI_buildingsalesaccountcd" :value="M_SM_PropertyType.buildingsalesaccountcd" :label="M_SM_PropertyType.buildingsalesaccountcdLabel" ref="ref_buildingsalesaccountcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OntaxcdChange" :prop="PI_taxcd" :value="M_SM_PropertyType.taxcd" :label="M_SM_PropertyType.taxcdLabel" ref="ref_taxcd"/>
                                      </b-col>
                                    </b-row>
                                    <div class="div-collapse">
                                        <span class="master-span-form">
                                            V.O
                                        </span>
                                    </div>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnvoaraccountcdChange" :prop="PI_voaraccountcd" :value="M_SM_PropertyType.voaraccountcd" :label="M_SM_PropertyType.voaraccountcdLabel" ref="ref_voaraccountcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnvodefferedincomeaccountcdChange" :prop="PI_vodefferedincomeaccountcd" :value="M_SM_PropertyType.vodefferedincomeaccountcd" :label="M_SM_PropertyType.vodefferedincomeaccountcdLabel" ref="ref_vodefferedincomeaccountcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnvosalesaccountcdChange" :prop="PI_vosalesaccountcd" :value="M_SM_PropertyType.vosalesaccountcd" :label="M_SM_PropertyType.vosalesaccountcdLabel" ref="ref_vosalesaccountcd"/>
                                      </b-col>
                                    </b-row>
                                    <div class="div-collapse">
                                        <span class="master-span-form">
                                            
                                        </span>
                                    </div>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnotheraccountcdChange" :prop="PI_otheraccountcd" :value="M_SM_PropertyType.otheraccountcd" :label="M_SM_PropertyType.otheraccountcdLabel" ref="ref_otheraccountcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OninterestaccountcdChange" :prop="PI_interestaccountcd" :value="M_SM_PropertyType.interestaccountcd" :label="M_SM_PropertyType.interestaccountcdLabel" ref="ref_interestaccountcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnoverpaymentaccountcdChange" :prop="PI_overpaymentaccountcd" :value="M_SM_PropertyType.overpaymentaccountcd" :label="M_SM_PropertyType.overpaymentaccountcdLabel" ref="ref_overpaymentaccountcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnunderpaymentaccountcdChange" :prop="PI_underpaymentaccountcd" :value="M_SM_PropertyType.underpaymentaccountcd" :label="M_SM_PropertyType.underpaymentaccountcdLabel" ref="ref_underpaymentaccountcd"/>
                                      </b-col>
                                    </b-row>
                                    <div class="div-collapse">
                                        <span class="master-span-form">
                                            Sales Termination
                                        </span>
                                    </div>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnnonrefundableaccountcdChange" :prop="PI_nonrefundableaccountcd" :value="M_SM_PropertyType.nonrefundableaccountcd" :label="M_SM_PropertyType.nonrefundableaccountcdLabel" ref="ref_nonrefundableaccountcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnrefundableaccountcdChange" :prop="PI_refundableaccountcd" :value="M_SM_PropertyType.refundableaccountcd" :label="M_SM_PropertyType.refundableaccountcdLabel" ref="ref_refundableaccountcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_SM_PropertyType.remarks"  ref="ref_remarks" />
                                      </b-col>
                                    </b-row>
                                    <div class="div-collapse">
                                        <span class="master-span-form">
                                            Transaction Analysis 
                                        </span>
                                    </div>
                                </b-col> <!-- table close -->
                  
							</b-row>
							<ABSTAnalysisLookUp ref="analysisLookUp" :prop="PTAnalysis" v-model="dataT" @input="OnAnalysisInput"/>
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
                initialWhere: "SubportfolioCd='"+this.getDataUser().subportfolio_cd+"'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_SM_PropertyType :{
                buildingsalesaccountcd: '',
                buildingsalesaccountdescs: '',
                descs: '',
                interestaccountcd: '',
                interestaccountdescs: '',
                landsalesaccountcd: '',
                landsalesaccountdescs: '',
                nonrefundableaccountcd: '',
                nonrefundableaccountdescs: '',
                otheraccountcd: '',
                otheraccountdescs: '',
                overpaymentaccountcd: '',
                overpaymentaccountdescs: '',
                propertytypecd: '',
                refundableaccountcd: '',
                refundableaccountdescs: '',
                remarks: '',
                subportfoliocd: '',
                t0: '',
                t1: '',
                t2: '',
                t3: '',
                t4: '',
                t5: '',
                t6: '',
                t7: '',
                t8: '',
                t9: '',
                t10: '',
                t11: '',
                t12: '',
                t13: '',
                t14: '',
                t15: '',
                t16: '',
                t17: '',
                t18: '',
                t19: '',
                t20: '',
                t21: '',
                t22: '',
                t23: '',
                t24: '',
                t25: '',
                t26: '',
                t27: '',
                t28: '',
                t29: '',
                t30: '',
                underpaymentaccountcd: '',
                underpaymentaccountdescs: '',
                unitaraccountcd: '',
                unitaraccountdescs: '',
                unitdefferedincomeaccountcd: '',
                unitdefferedincomeaccountdescs: '',
                useredit: this.getDataUser().user_id,
                userinput: '',
                voaraccountcd: '',
                voaraccountdescs: '',
                vodefferedincomeaccountcd: '',
                vodefferedincomeaccountdescs: '',
                vosalesaccountcd: '',
                vosalesaccountdescs: '',
                lastupdatestamp: 0,
                rowid: 0,
                taxcd: ''
                    }
            ,
            PI_propertytypecd: { 
                cValidate :'required|max:8', 
                cName: 'propertytypecd', 
                cLabel: 'Property Type Code', 
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
                cValidate :'required', 
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
            PI_unitaraccountcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCode'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "Status = 'A'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'AccountCd,Description_1' 
                        }, 
                cValidate :'', 
                cName: 'unitaraccountcd', 
                cLabel: 'AR Account Code', 
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
                cMasterUrl: 'GL/GL_ChartOfAccount' ,
                cDisplayColumn: 'AccountCd,Description_1' ,
            }, 
            PI_unitdefferedincomeaccountcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCode'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "Status = 'A'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'AccountCd,Description_1' 
                        }, 
                cValidate :'', 
                cName: 'unitdefferedincomeaccountcd', 
                cLabel: 'Deffered Income Account Code', 
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
                cMasterUrl: 'GL/GL_ChartOfAccount' ,
                cDisplayColumn: 'AccountCd,Description_1' ,
            }, 
            PI_landsalesaccountcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCode'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "Status = 'A'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'AccountCd,Description_1' 
                        }, 
                cValidate :'', 
                cName: 'landsalesaccountcd', 
                cLabel: 'Land Sales Account Code', 
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
                cMasterUrl: 'GL/GL_ChartOfAccount' ,
                cDisplayColumn: 'AccountCd,Description_1' ,
            }, 
            PI_buildingsalesaccountcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCode'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "Status = 'A'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'AccountCd,Description_1' 
                        }, 
                cValidate :'', 
                cName: 'buildingsalesaccountcd', 
                cLabel: 'Building Sales Account Code', 
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
                cMasterUrl: 'GL/GL_ChartOfAccount' ,
                cDisplayColumn: 'AccountCd,Description_1' ,
            }, 
            PI_taxcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMTaxCode'    , 
                    ColumnDB: 'TaxCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'taxcd', 
                cLabel: 'Tax', 
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
                cMasterUrl: 'CM/CM_TaxMaster' ,
                cDisplayColumn: 'TaxCd, Descs' ,
            }, 
            PI_voaraccountcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCode'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "Status = 'A'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'AccountCd,Description_1' 
                        }, 
                cValidate :'', 
                cName: 'voaraccountcd', 
                cLabel: 'AR Account Code', 
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
                cMasterUrl: 'GL/GL_ChartOfAccount' ,
                cDisplayColumn: 'AccountCd,Description_1' ,
            }, 
            PI_vodefferedincomeaccountcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCode'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "Status = 'A'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'AccountCd,Description_1' 
                        }, 
                cValidate :'', 
                cName: 'vodefferedincomeaccountcd', 
                cLabel: 'Deffered Income Account Code', 
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
                cMasterUrl: 'GL/GL_ChartOfAccount' ,
                cDisplayColumn: 'AccountCd,Description_1' ,
            }, 
            PI_vosalesaccountcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCode'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "Status = 'A'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'AccountCd,Description_1' 
                        }, 
                cValidate :'', 
                cName: 'vosalesaccountcd', 
                cLabel: 'Sales Account Code', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 9, 
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
                cMasterUrl: 'GL/GL_ChartOfAccount' ,
                cDisplayColumn: 'AccountCd,Description_1' ,
            }, 
            PI_otheraccountcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCode'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "Status = 'A'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'AccountCd,Description_1' 
                        }, 
                cValidate :'', 
                cName: 'otheraccountcd', 
                cLabel: 'Other Account Code', 
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
                cMasterUrl: 'GL/GL_ChartOfAccount' ,
                cDisplayColumn: 'AccountCd,Description_1' ,
            }, 
            PI_interestaccountcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCode'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "Status = 'A'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'AccountCd,Description_1' 
                        }, 
                cValidate :'', 
                cName: 'interestaccountcd', 
                cLabel: 'Interest Account Code', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 11, 
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
                cMasterUrl: 'GL/GL_ChartOfAccount' ,
                cDisplayColumn: 'AccountCd,Description_1' ,
            }, 
            PI_overpaymentaccountcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCode'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "Status = 'A'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'AccountCd,Description_1' 
                        }, 
                cValidate :'', 
                cName: 'overpaymentaccountcd', 
                cLabel: 'Over Payment Account Code', 
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
                cMasterUrl: 'GL/GL_ChartOfAccount' ,
                cDisplayColumn: 'AccountCd,Description_1' ,
            }, 
            PI_underpaymentaccountcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCode'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "Status = 'A'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'AccountCd,Description_1' 
                        }, 
                cValidate :'', 
                cName: 'underpaymentaccountcd', 
                cLabel: 'Under Payment Account Code', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 13, 
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
                cMasterUrl: 'GL/GL_ChartOfAccount' ,
                cDisplayColumn: 'AccountCd,Description_1' ,
            }, 
            PI_nonrefundableaccountcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCode'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "Status = 'A'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'AccountCd,Description_1' 
                        }, 
                cValidate :'', 
                cName: 'nonrefundableaccountcd', 
                cLabel: 'Non Refundable Account Code', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 14, 
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
                cMasterUrl: 'GL/GL_ChartOfAccount' ,
                cDisplayColumn: 'AccountCd,Description_1' ,
            }, 
            PI_refundableaccountcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCode'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "Status = 'A'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'AccountCd,Description_1' 
                        }, 
                cValidate :'', 
                cName: 'refundableaccountcd', 
                cLabel: 'Refundable Account Code', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 15, 
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
                cMasterUrl: 'GL/GL_ChartOfAccount' ,
                cDisplayColumn: 'AccountCd,Description_1' ,
            }, 
            PI_remarks: { 
                cValidate :'', 
                cName:'remarks', 
                cLabel:'Remarks', 
                cLabelSize: 4, 
                cOrder:16, 
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
                cAnalysisType: 'Analysis Category'
            },

            dataT: {}

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
        OnunitaraccountcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_PropertyType.unitaraccountcd = data.id
            this.M_SM_PropertyType.unitaraccountcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{unitaraccountcd}
            }
        })
        this.$forceUpdate()
        },
        OnunitdefferedincomeaccountcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_PropertyType.unitdefferedincomeaccountcd = data.id
            this.M_SM_PropertyType.unitdefferedincomeaccountcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{unitdefferedincomeaccountcd}
            }
        })
        this.$forceUpdate()
        },
        OnlandsalesaccountcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_PropertyType.landsalesaccountcd = data.id
            this.M_SM_PropertyType.landsalesaccountcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{landsalesaccountcd}
            }
        })
        this.$forceUpdate()
        },
        OnbuildingsalesaccountcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_PropertyType.buildingsalesaccountcd = data.id
            this.M_SM_PropertyType.buildingsalesaccountcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{buildingsalesaccountcd}
            }
        })
        this.$forceUpdate()
        },
        OntaxcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_PropertyType.taxcd = data.id
            this.M_SM_PropertyType.taxcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{taxcd}   
            }
        })
        this.$forceUpdate()
        },
        OnvoaraccountcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_PropertyType.voaraccountcd = data.id
            this.M_SM_PropertyType.voaraccountcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{voaraccountcd}
            }
        })
        this.$forceUpdate()
        },
        OnvodefferedincomeaccountcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_PropertyType.vodefferedincomeaccountcd = data.id
            this.M_SM_PropertyType.vodefferedincomeaccountcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{vodefferedincomeaccountcd}
            }
        })
        this.$forceUpdate()
        },
        OnvosalesaccountcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_PropertyType.vosalesaccountcd = data.id
            this.M_SM_PropertyType.vosalesaccountcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{vosalesaccountcd}
            }
        })
        this.$forceUpdate()
        },
        OnotheraccountcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_PropertyType.otheraccountcd = data.id
            this.M_SM_PropertyType.otheraccountcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{otheraccountcd}
            }
        })
        this.$forceUpdate()
        },
        OninterestaccountcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_PropertyType.interestaccountcd = data.id
            this.M_SM_PropertyType.interestaccountcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{interestaccountcd}
            }
        })
        this.$forceUpdate()
        },
        OnoverpaymentaccountcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_PropertyType.overpaymentaccountcd = data.id
            this.M_SM_PropertyType.overpaymentaccountcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{overpaymentaccountcd}
            }
        })
        this.$forceUpdate()
        },
        OnunderpaymentaccountcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_PropertyType.underpaymentaccountcd = data.id
            this.M_SM_PropertyType.underpaymentaccountcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{underpaymentaccountcd}
            }
        })
        this.$forceUpdate()
        },
        OnnonrefundableaccountcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_PropertyType.nonrefundableaccountcd = data.id
            this.M_SM_PropertyType.nonrefundableaccountcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{nonrefundableaccountcd}
            }
        })
        this.$forceUpdate()
        },
        OnrefundableaccountcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_PropertyType.refundableaccountcd = data.id
            this.M_SM_PropertyType.refundableaccountcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{refundableaccountcd}
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
            // console.log(this.M_SM_PropertyType)
            // console.log(this.dataT)
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                PropertyTypeCd: this.M_SM_PropertyType.propertytypecd,
                Descs: this.M_SM_PropertyType.descs,
                UnitARAccountCd: this.M_SM_PropertyType.unitaraccountcd == '' || this.M_SM_PropertyType.unitaraccountcd == null ? 'NULL' : this.M_SM_PropertyType.unitaraccountcd ,
                UnitDefferedIncomeAccountCd: this.M_SM_PropertyType.unitdefferedincomeaccountcd == '' || this.M_SM_PropertyType.unitdefferedincomeaccountcd == null ? 'NULL' : this.M_SM_PropertyType.unitdefferedincomeaccountcd ,
                LandSalesAccountCd: this.M_SM_PropertyType.landsalesaccountcd == '' || this.M_SM_PropertyType.landsalesaccountcd == null ? 'NULL' : this.M_SM_PropertyType.landsalesaccountcd ,
                BuildingSalesAccountCd: this.M_SM_PropertyType.buildingsalesaccountcd == '' || this.M_SM_PropertyType.buildingsalesaccountcd == null ? 'NULL' : this.M_SM_PropertyType.buildingsalesaccountcd ,
                VOARAccountCd: this.M_SM_PropertyType.voaraccountcd == '' || this.M_SM_PropertyType.voaraccountcd == null ? 'NULL' : this.M_SM_PropertyType.voaraccountcd ,
                VODefferedIncomeAccountCd: this.M_SM_PropertyType.vodefferedincomeaccountcd == '' || this.M_SM_PropertyType.vodefferedincomeaccountcd == null ? 'NULL' : this.M_SM_PropertyType.vodefferedincomeaccountcd ,
                VOSalesAccountCd: this.M_SM_PropertyType.vosalesaccountcd == '' || this.M_SM_PropertyType.vosalesaccountcd == null ? 'NULL' : this.M_SM_PropertyType.vosalesaccountcd ,
                OtherAccountCd: this.M_SM_PropertyType.otheraccountcd == '' || this.M_SM_PropertyType.otheraccountcd == null ? 'NULL' : this.M_SM_PropertyType.otheraccountcd ,
                InterestAccountCd: this.M_SM_PropertyType.interestaccountcd == '' || this.M_SM_PropertyType.interestaccountcd == null ? 'NULL' : this.M_SM_PropertyType.interestaccountcd ,
                OverPaymentAccountCd: this.M_SM_PropertyType.overpaymentaccountcd == '' || this.M_SM_PropertyType.overpaymentaccountcd == null ? 'NULL' : this.M_SM_PropertyType.overpaymentaccountcd ,
                UnderPaymentAccountCd: this.M_SM_PropertyType.underpaymentaccountcd == '' || this.M_SM_PropertyType.underpaymentaccountcd == null ? 'NULL' : this.M_SM_PropertyType.underpaymentaccountcd ,
                NonRefundableAccountCd: this.M_SM_PropertyType.nonrefundableaccountcd == '' || this.M_SM_PropertyType.nonrefundableaccountcd == null ? 'NULL' : this.M_SM_PropertyType.nonrefundableaccountcd ,
                RefundableAccountCd: this.M_SM_PropertyType.refundableaccountcd == '' || this.M_SM_PropertyType.refundableaccountcd == null ? 'NULL' : this.M_SM_PropertyType.refundableaccountcd ,
                T0: this.getDataUser().portfolio_cd,
                T1: this.getDataUser().subportfolio_cd,
                T2: this.dataT.T2,
                T3: this.dataT.T3,
                T4: this.dataT.T4,
                T5: this.dataT.T5,
                T6: this.dataT.T6,
                T7: this.dataT.T7,
                T8: this.dataT.T8,
                T9: this.dataT.T9,
                T10: this.dataT.T10,
                T11: this.dataT.T11,
                T12: this.dataT.T12,
                T13: this.dataT.T13,
                T14: this.dataT.T14,
                T15: this.dataT.T15,
                T16: this.dataT.T16,
                T17: this.dataT.T17,
                T18: this.dataT.T18,
                T19: this.dataT.T19,
                T20: this.dataT.T20,
                T21: this.dataT.T21,
                T22: this.dataT.T22,
                T23: this.dataT.T23,
                T24: this.dataT.T24,
                T25: this.dataT.T25,
                T26: this.dataT.T26,
                T27: this.dataT.T27,
                T28: this.dataT.T28,
                T29: this.dataT.T29,
                T30: this.dataT.T30,
                Remarks: this.M_SM_PropertyType.remarks,
                UserInput: this.getDataUser().user_id,
                TaxCd: this.M_SM_PropertyType.taxcd == '' || this.M_SM_PropertyType.taxcd == null ? 'NULL' : this.M_SM_PropertyType.taxcd                  
            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return

				//kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultInsert(response.Message)
					
				
            })
        },
        M_Update() {
            // console.log(this.M_SM_PropertyType)
            // console.log(this.dataT)
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                PropertyTypeCd: this.M_SM_PropertyType.propertytypecd,
                Descs: this.M_SM_PropertyType.descs,
                UnitARAccountCd: this.M_SM_PropertyType.unitaraccountcd == '' || this.M_SM_PropertyType.unitaraccountcd == null ? 'NULL' : this.M_SM_PropertyType.unitaraccountcd ,
                UnitDefferedIncomeAccountCd: this.M_SM_PropertyType.unitdefferedincomeaccountcd == '' || this.M_SM_PropertyType.unitdefferedincomeaccountcd == null ? 'NULL' : this.M_SM_PropertyType.unitdefferedincomeaccountcd ,
                LandSalesAccountCd: this.M_SM_PropertyType.landsalesaccountcd == '' || this.M_SM_PropertyType.landsalesaccountcd == null ? 'NULL' : this.M_SM_PropertyType.landsalesaccountcd ,
                BuildingSalesAccountCd: this.M_SM_PropertyType.buildingsalesaccountcd == '' || this.M_SM_PropertyType.buildingsalesaccountcd == null ? 'NULL' : this.M_SM_PropertyType.buildingsalesaccountcd ,
                VOARAccountCd: this.M_SM_PropertyType.voaraccountcd == '' || this.M_SM_PropertyType.voaraccountcd == null ? 'NULL' : this.M_SM_PropertyType.voaraccountcd ,
                VODefferedIncomeAccountCd: this.M_SM_PropertyType.vodefferedincomeaccountcd == '' || this.M_SM_PropertyType.vodefferedincomeaccountcd == null ? 'NULL' : this.M_SM_PropertyType.vodefferedincomeaccountcd ,
                VOSalesAccountCd: this.M_SM_PropertyType.vosalesaccountcd == '' || this.M_SM_PropertyType.vosalesaccountcd == null ? 'NULL' : this.M_SM_PropertyType.vosalesaccountcd ,
                OtherAccountCd: this.M_SM_PropertyType.otheraccountcd == '' || this.M_SM_PropertyType.otheraccountcd == null ? 'NULL' : this.M_SM_PropertyType.otheraccountcd ,
                InterestAccountCd: this.M_SM_PropertyType.interestaccountcd == '' || this.M_SM_PropertyType.interestaccountcd == null ? 'NULL' : this.M_SM_PropertyType.interestaccountcd ,
                OverPaymentAccountCd: this.M_SM_PropertyType.overpaymentaccountcd == '' || this.M_SM_PropertyType.overpaymentaccountcd == null ? 'NULL' : this.M_SM_PropertyType.overpaymentaccountcd ,
                UnderPaymentAccountCd: this.M_SM_PropertyType.underpaymentaccountcd == '' || this.M_SM_PropertyType.underpaymentaccountcd == null ? 'NULL' : this.M_SM_PropertyType.underpaymentaccountcd ,
                NonRefundableAccountCd: this.M_SM_PropertyType.nonrefundableaccountcd == '' || this.M_SM_PropertyType.nonrefundableaccountcd == null ? 'NULL' : this.M_SM_PropertyType.nonrefundableaccountcd ,
                RefundableAccountCd: this.M_SM_PropertyType.refundableaccountcd == '' || this.M_SM_PropertyType.refundableaccountcd == null ? 'NULL' : this.M_SM_PropertyType.refundableaccountcd ,
                T0: this.getDataUser().portfolio_cd,
                T1: this.getDataUser().subportfolio_cd,
                T2: this.dataT.T2,
                T3: this.dataT.T3,
                T4: this.dataT.T4,
                T5: this.dataT.T5,
                T6: this.dataT.T6,
                T7: this.dataT.T7,
                T8: this.dataT.T8,
                T9: this.dataT.T9,
                T10: this.dataT.T10,
                T11: this.dataT.T11,
                T12: this.dataT.T12,
                T13: this.dataT.T13,
                T14: this.dataT.T14,
                T15: this.dataT.T15,
                T16: this.dataT.T16,
                T17: this.dataT.T17,
                T18: this.dataT.T18,
                T19: this.dataT.T19,
                T20: this.dataT.T20,
                T21: this.dataT.T21,
                T22: this.dataT.T22,
                T23: this.dataT.T23,
                T24: this.dataT.T24,
                T25: this.dataT.T25,
                T26: this.dataT.T26,
                T27: this.dataT.T27,
                T28: this.dataT.T28,
                T29: this.dataT.T29,
                T30: this.dataT.T30,
                Remarks: this.M_SM_PropertyType.remarks,
                UserEdit: this.getDataUser().user_id ,
                LastUpdateStamp: this.M_SM_PropertyType.lastupdatestamp,
                TaxCd: this.M_SM_PropertyType.taxcd == '' || this.M_SM_PropertyType.taxcd == null ? 'NULL' : this.M_SM_PropertyType.taxcd ,                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_SM_PropertyType = {
                buildingsalesaccountcd: '',
                buildingsalesaccountdescs: '',
                descs: '',
                interestaccountcd: '',
                interestaccountdescs: '',
                landsalesaccountcd: '',
                landsalesaccountdescs: '',
                nonrefundableaccountcd: '',
                nonrefundableaccountdescs: '',
                otheraccountcd: '',
                otheraccountdescs: '',
                overpaymentaccountcd: '',
                overpaymentaccountdescs: '',
                propertytypecd: '',
                refundableaccountcd: '',
                refundableaccountdescs: '',
                remarks: '',
                subportfoliocd: '',
                t0: '',
                t1: '',
                t2: '',
                t3: '',
                t4: '',
                t5: '',
                t6: '',
                t7: '',
                t8: '',
                t9: '',
                t10: '',
                t11: '',
                t12: '',
                t13: '',
                t14: '',
                t15: '',
                t16: '',
                t17: '',
                t18: '',
                t19: '',
                t20: '',
                t21: '',
                t22: '',
                t23: '',
                t24: '',
                t25: '',
                t26: '',
                t27: '',
                t28: '',
                t29: '',
                t30: '',
                underpaymentaccountcd: '',
                underpaymentaccountdescs: '',
                unitaraccountcd: '',
                unitaraccountdescs: '',
                unitdefferedincomeaccountcd: '',
                unitdefferedincomeaccountdescs: '',
                useredit: this.getDataUser().user_id,
                userinput: '',
                voaraccountcd: '',
                voaraccountdescs: '',
                vodefferedincomeaccountcd: '',
                vodefferedincomeaccountdescs: '',
                vosalesaccountcd: '',
                vosalesaccountdescs: '',
                lastupdatestamp: 0,
                rowid: 0,
                
                    }
                    this.$refs.analysisLookUp.resetData()
            	
	
		},
        M_New(){
			this.$refs.ref_propertytypecd.focus()
        },
        M_Edit(){
            this.$refs.ref_descs.focus()
        },
        M_Delete(dt){       
			var data = this.FormToABSList().getRowSelected()  
			var dataDelete = []

			
			data.forEach((value) => {
                // console.log(value)
				
				dataDelete.push({
					_Message_:'',
                    SubPortfolioCd: this.getDataUser().subportfolio_cd,
                    PropertyTypeCd: value.PropertyTypeCd,
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
                propertytypecd: record.PropertyTypeCd
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                // console.log(data)
this.M_SM_PropertyType = {
                buildingsalesaccountcd: data.buildingsalesaccountcd,
                buildingsalesaccountdescs: data.buildingsalesaccountdescs,
                descs: data.descs,
                interestaccountcd: data.interestaccountcd,
                interestaccountdescs: data.interestaccountdescs,
                landsalesaccountcd: data.landsalesaccountcd,
                landsalesaccountdescs: data.landsalesaccountdescs,
                nonrefundableaccountcd: data.nonrefundableaccountcd,
                nonrefundableaccountdescs: data.nonrefundableaccountdescs,
                otheraccountcd: data.otheraccountcd,
                otheraccountdescs: data.otheraccountdescs,
                overpaymentaccountcd: data.overpaymentaccountcd,
                overpaymentaccountdescs: data.overpaymentaccountdescs,
                propertytypecd: data.propertytypecd,
                refundableaccountcd: data.refundableaccountcd,
                refundableaccountdescs: data.refundableaccountdescs,
                remarks: data.remarks,
                subportfoliocd: data.subportfoliocd,
                t0: data.t0,
                t1: data.t1,
                t2: data.t2,
                t3: data.t3,
                t4: data.t4,
                t5: data.t5,
                t6: data.t6,
                t7: data.t7,
                t8: data.t8,
                t9: data.t9,
                t10: data.t10,
                t11: data.t11,
                t12: data.t12,
                t13: data.t13,
                t14: data.t14,
                t15: data.t15,
                t16: data.t16,
                t17: data.t17,
                t18: data.t18,
                t19: data.t19,
                t20: data.t20,
                t21: data.t21,
                t22: data.t22,
                t23: data.t23,
                t24: data.t24,
                t25: data.t25,
                t26: data.t26,
                t27: data.t27,
                t28: data.t28,
                t29: data.t29,
                t30: data.t30,
                underpaymentaccountcd: data.underpaymentaccountcd,
                underpaymentaccountdescs: data.underpaymentaccountdescs,
                taxcd: data.taxcd,
                unitaraccountcd: data.unitaraccountcd,
                unitaraccountdescs: data.unitaraccountdescs,
                unitdefferedincomeaccountcd: data.unitdefferedincomeaccountcd,
                unitdefferedincomeaccountdescs: data.unitdefferedincomeaccountdescs,
                useredit: data.useredit,
                userinput: data.userinput,
                voaraccountcd: data.voaraccountcd,
                voaraccountdescs: data.voaraccountdescs,
                vodefferedincomeaccountcd: data.vodefferedincomeaccountcd,
                vodefferedincomeaccountdescs: data.vodefferedincomeaccountdescs,
                vosalesaccountcd: data.vosalesaccountcd,
                vosalesaccountdescs: data.vosalesaccountdescs,
                lastupdatestamp: record.LastUpdateStamp,
                rowid: record.row_id,
                    }
                 
                 for (let a = 2; a <= 30; a++) {
                    this.dataT['T'+a] = data['t'+a]
                    this.dataT['T'+a+'label'] = data['t'+a]
                }

                this.M_SM_PropertyType.unitaraccountcdLabel = this.M_SM_PropertyType.unitaraccountcd != null && this.M_SM_PropertyType.unitaraccountcd != '' ? data.unitaraccountcd + this.separator + data.unitaraccountdescs :'' 
                this.M_SM_PropertyType.unitdefferedincomeaccountcdLabel = this.M_SM_PropertyType.unitdefferedincomeaccountcd != null && this.M_SM_PropertyType.unitdefferedincomeaccountcd != '' ? data.unitdefferedincomeaccountcd + this.separator + data.unitdefferedincomeaccountdescs :'' 
                this.M_SM_PropertyType.landsalesaccountcdLabel = this.M_SM_PropertyType.landsalesaccountcd != null && this.M_SM_PropertyType.landsalesaccountcd != '' ? data.landsalesaccountcd + this.separator + data.landsalesaccountdescs :'' 
                this.M_SM_PropertyType.buildingsalesaccountcdLabel = this.M_SM_PropertyType.buildingsalesaccountcd != null && this.M_SM_PropertyType.buildingsalesaccountcd != '' ? data.buildingsalesaccountcd + this.separator + data.buildingsalesaccountdescs :'' 
                this.M_SM_PropertyType.voaraccountcdLabel = this.M_SM_PropertyType.voaraccountcd != null && this.M_SM_PropertyType.voaraccountcd != '' ? data.voaraccountcd + this.separator + data.voaraccountdescs :'' 
                this.M_SM_PropertyType.vodefferedincomeaccountcdLabel = this.M_SM_PropertyType.vodefferedincomeaccountcd != null && this.M_SM_PropertyType.vodefferedincomeaccountcd != '' ? data.vodefferedincomeaccountcd + this.separator + data.vodefferedincomeaccountdescs :'' 
                this.M_SM_PropertyType.vosalesaccountcdLabel = this.M_SM_PropertyType.vosalesaccountcd != null && this.M_SM_PropertyType.vosalesaccountcd != '' ? data.vosalesaccountcd + this.separator + data.vosalesaccountdescs :'' 
                this.M_SM_PropertyType.otheraccountcdLabel = this.M_SM_PropertyType.otheraccountcd != null && this.M_SM_PropertyType.otheraccountcd != '' ? data.otheraccountcd + this.separator + data.otheraccountdescs :'' 
                this.M_SM_PropertyType.interestaccountcdLabel = this.M_SM_PropertyType.interestaccountcd != null && this.M_SM_PropertyType.interestaccountcd != '' ? data.interestaccountcd + this.separator + data.interestaccountdescs :'' 
                this.M_SM_PropertyType.overpaymentaccountcdLabel = this.M_SM_PropertyType.overpaymentaccountcd != null && this.M_SM_PropertyType.overpaymentaccountcd != '' ? data.overpaymentaccountcd + this.separator + data.overpaymentaccountdescs :'' 
                this.M_SM_PropertyType.underpaymentaccountcdLabel = this.M_SM_PropertyType.underpaymentaccountcd != null && this.M_SM_PropertyType.underpaymentaccountcd != '' ? data.underpaymentaccountcd + this.separator + data.underpaymentaccountdescs :'' 
                this.M_SM_PropertyType.nonrefundableaccountcdLabel = this.M_SM_PropertyType.nonrefundableaccountcd != null && this.M_SM_PropertyType.nonrefundableaccountcd != '' ? data.nonrefundableaccountcd + this.separator + data.nonrefundableaccountdescs :'' 
                this.M_SM_PropertyType.refundableaccountcdLabel = this.M_SM_PropertyType.refundableaccountcd != null && this.M_SM_PropertyType.refundableaccountcd != '' ? data.refundableaccountcd + this.separator + data.refundableaccountdescs :'' 

                this.M_SM_PropertyType.taxcdLabel = this.M_SM_PropertyType.taxcd != null && this.M_SM_PropertyType.taxcd != '' ? data.taxcd + this.separator  :'' 
         
                this.$refs.analysisLookUp.OnInput()

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

