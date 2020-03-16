<template>
    <div>        
    <ABSListVuex
      :prop = "propList"
      :title = "data.query_name"
      @rowClicked = "rowClicked"
      @rowDblClicked = "doDoubleClick"
      @rowLinkClick = "rowLink"
      @pageSize = "M_PageSize"
      @pagination = "M_Pagination"
      @filter = "M_Advance_Filter"
      @headTable = "M_Head_Table"
    />


        <div v-show="$parent.isDetail"  :style="'margin-top:10px;'" class="el" mousetip mousetip-msg="I'm a tooltip">
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
                                <b-col md="12" id="col-left">
                                    <b-row>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_TaxType" v-model="M_CM_TaxMasterDetail.TaxType"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_Descs" v-model="M_CM_TaxMasterDetail.Descs"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_TaxRate" v-model="M_CM_TaxMasterDetail.TaxRate"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnTaxClassInput" :prop="PI_TaxClass" v-model="M_CM_TaxMasterDetail.TaxClass" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnVATReversalFlagInput" :prop="PI_VATReversalFlag" v-model="M_CM_TaxMasterDetail.VATReversalFlag" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelect2 @change="OnVATPrefixCdChange" :prop="PI_VATPrefixCd" :value="M_CM_TaxMasterDetail.VATPrefixCd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnVATAccountCdChange" :prop="PI_VATAccountCd" :value="M_CM_TaxMasterDetail.VATAccountCd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col md="6">
                                        <ABSInputSelect2 @change="OnVATReversalPrefixCdChange" :prop="PI_VATReversalPrefixCd" :value="M_CM_TaxMasterDetail.VATReversalPrefixCd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnVATReversalAccountCdChange" :prop="PI_VATReversalAccountCd" :value="M_CM_TaxMasterDetail.VATReversalAccountCd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col md="6">
                                        <ABSInputSelect2 @change="OnPrepaidWithholdingPrefixCdChange" :prop="PI_PrepaidWithholdingPrefixCd" :value="M_CM_TaxMasterDetail.PrepaidWithholdingPrefixCd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnPrepaidWithholdingAccountCdChange" :prop="PI_PrepaidWithholdingAccountCd" :value="M_CM_TaxMasterDetail.PrepaidWithholdingAccountCd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col md="6">
                                        <ABSInputSelect2 @change="OnExpenseWithholdingPrefixCdChange" :prop="PI_ExpenseWithholdingPrefixCd" :value="M_CM_TaxMasterDetail.ExpenseWithholdingPrefixCd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnExpenseWithholdingAccountCdChange" :prop="PI_ExpenseWithholdingAccountCd" :value="M_CM_TaxMasterDetail.ExpenseWithholdingAccountCd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col md="6">
                                        <ABSInputSelect2 @change="OnAccruedWithholdingPrefixCdChange" :prop="PI_AccruedWithholdingPrefixCd" :value="M_CM_TaxMasterDetail.AccruedWithholdingPrefixCd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnAccruedWithholdingAccountCdChange" :prop="PI_AccruedWithholdingAccountCd" :value="M_CM_TaxMasterDetail.AccruedWithholdingAccountCd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col md="6">
                                        <ABSInputSelect2 @change="OnAccruedWithholdingOthersPrefixCdChange" :prop="PI_AccruedWithholdingOthersPrefixCd" :value="M_CM_TaxMasterDetail.AccruedWithholdingOthersPrefixCd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnAccruedWithholdingOthersAccountCdChange" :prop="PI_AccruedWithholdingOthersAccountCd" :value="M_CM_TaxMasterDetail.AccruedWithholdingOthersAccountCd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col md="6">
                                            <b-row>
                                                <b-col md="4" class="lbl-col-align"></b-col>                                                
                                                <b-col><label class="lbl-value-view-form"></label></b-col>
                                            </b-row>                                              
                                        </b-col>
                                        <b-col md="6">
                                            <ABSInputSelectList @change="OnExpenseWithholdingStraightLineAccountCdChange" :prop="PI_ExpenseWithholdingStraightLineAccountCd" :value="M_CM_TaxMasterDetail.ExpenseWithholdingStraightLineAccountCd"/>
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col md="6">
                                            <b-row>
                                                <b-col md="4" class="lbl-col-align"></b-col>                                                
                                                <b-col><label class="lbl-value-view-form"></label></b-col>
                                            </b-row>                                              
                                        </b-col>
                                        <b-col  md="6">
                                            <ABSInputSelectList @change="OnAccruedWithholdingStraightLineAccountCdChange" :prop="PI_AccruedWithholdingStraightLineAccountCd" :value="M_CM_TaxMasterDetail.AccruedWithholdingStraightLineAccountCd"/>
                                        </b-col>
                                    </b-row>
                                </b-col>
                  
							</b-row>
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
                initialWhere:"TaxCd = '" + this.ValKey + "'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_CM_TaxMasterDetail :{
                TaxCd: '',
                TaxType: '',
                Descs: '',
                TaxRate: '0',
                TaxClass: 'V',
                VATReversalFlag: 'Y',
                VATAccountCd: '',
                VATPrefixCd: '',
                VATReversalAccountCd: '',
                VATReversalPrefixCd: '',
                PrepaidWithholdingAccountCd: '',
                PrepaidWithholdingPrefixCd: '',
                ExpenseWithholdingAccountCd: '',
                ExpenseWithholdingPrefixCd: '',
                AccruedWithholdingAccountCd: '',
                AccruedWithholdingPrefixCd: '',
                T0: '',
                T1: '',
                T2: '',
                T3: '',
                T4: '',
                T5: '',
                T6: '',
                T7: '',
                T8: '',
                T9: '',
                T10: '',
                T11: '',
                T12: '',
                T13: '',
                T14: '',
                T15: '',
                T16: '',
                T17: '',
                T18: '',
                T19: '',
                T20: '',
                T21: '',
                T22: '',
                T23: '',
                T24: '',
                T25: '',
                T26: '',
                T27: '',
                T28: '',
                T29: '',
                T30: '',
                UserInput: '',
                UserEdit: this.getDataUser().user_id,
                TimeInput: '',
                TimeEdit: '',
                LastUpdateStamp: 0,
                AccruedWithholdingOthersAccountCd: '',
                AccruedWithholdingOthersPrefixCd: '',
                ControlSequenceNo: 0,
                ExpenseWithholdingStraightLineAccountCd: '',
                AccruedWithholdingStraightLineAccountCd: '',
                RowId: 0
                    }
            ,
            PI_TaxType: { 
                cValidate :'required|max:5', 
                cName:'TaxType', 
                cLabel:'Tax Type', 
                cOrder:1, 
                cKey:false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
                cKey: true 
            }, 
            PI_Descs: { 
                cValidate :'required', 
                cName:'Descs', 
                cLabel:'Description', 
                cOrder:2, 
                cKey:false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_TaxRate: { 
                cValidate :'', 
                cName:'TaxRate', 
                cLabel:'Tax Rate', 
                cOrder:3, 
                cKey:false, 
                cType: 'decimal',
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_TaxClass: { 
                cValidate :'', 
                cName:'TaxClass', 
                cId:'rdbTaxClass', 
                cRadioOptions: [{ text: 'Witholding', value: 'W' },{ text: 'VAT', value: 'V' },{ text: 'Other VAT', value: 'O' },], 
                cLabel:'Tax Class', 
                cOrder:0, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_VATReversalFlag: { 
                cValidate :'', 
                cName:'Reversal Flag', 
                cId:'rdbVATReversalFlag', 
                cRadioOptions: [{ text: 'Yes', value: 'Y' }, { text: 'No', value: 'N' }], 
                cLabel:'Reversal Flag', 
                cOrder:6, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
                cProtect: false 
            }, 
            PI_VATPrefixCd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountPrefix'    , 
                    ColumnDB: 'PrefixCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName:'VATPrefixCd', 
                cLabel:'VAT Account Prefix', 
                cKey:false, 
                cOrder:7, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cMasterUrl:'GL/GL_SubModuleAccountPrefix' ,
                cDisplayColumn:'PrefixCd,ChartOfAccountPrefix' ,
                cProtect: false
            }, 
            PI_VATAccountCd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCode'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "Status = 'A'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName:'VATAccountCd', 
                cLabel:'VAT Account Code', 
                cKey:false, 
                cOrder:8, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cMasterUrl:'GL/GL_ChartOfAccount' ,
                cDisplayColumn:'AccountCd,Descs1' ,
                cProtect: false
            }, 
            PI_VATReversalPrefixCd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountPrefix'    , 
                    ColumnDB: 'PrefixCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName:'VATReversalPrefixCd', 
                cLabel:'VAT Reversal Account Prefix', 
                cKey:false, 
                cOrder:9, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cMasterUrl:'GL/GL_SubModuleAccountPrefix' ,
                cDisplayColumn:'PrefixCd,ChartOfAccountPrefix',
                cProtect: true
            }, 
            PI_VATReversalAccountCd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCode'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "Status = 'A'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName:'VATReversalAccountCd', 
                cLabel:'VAT Reversal Account Code', 
                cKey:false, 
                cOrder:10, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cMasterUrl:'GL/GL_ChartOfAccount' ,
                cDisplayColumn:'AccountCd,Descs1' ,
                cProtect: true
            }, 
            PI_PrepaidWithholdingPrefixCd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountPrefix'    , 
                    ColumnDB: 'PrefixCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName:'PrepaidWithholdingPrefixCd', 
                cLabel:'Prepaid Witholding Account Prefix', 
                cKey:false, 
                cOrder:11, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cMasterUrl:'GL/GL_SubModuleAccountPrefix' ,
                cDisplayColumn:'PrefixCd,ChartOfAccountPrefix',
                cProtect: true
            }, 
            PI_PrepaidWithholdingAccountCd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCode'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "Status = 'A'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName:'PrepaidWithholdingAccountCd', 
                cLabel:'Prepaid Witholding Account Code', 
                cKey:false, 
                cOrder:12, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cMasterUrl:'GL/GL_ChartOfAccount' ,
                cDisplayColumn:'AccountCd,Descs1' ,
                cProtect: true
            }, 
            PI_ExpenseWithholdingPrefixCd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountPrefix'    , 
                    ColumnDB: 'PrefixCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName:'ExpenseWithholdingPrefixCd', 
                cLabel:'Expense Witholding Account Prefix', 
                cKey:false, 
                cOrder:13, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cMasterUrl:'GL/GL_SubModuleAccountPrefix' ,
                cDisplayColumn:'PrefixCd,ChartOfAccountPrefix',
                cProtect: true
            }, 
            PI_ExpenseWithholdingAccountCd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCode'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "Status = 'A'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName:'ExpenseWithholdingAccountCd', 
                cLabel:'Expense Witholding Account Code', 
                cKey:false, 
                cOrder:14, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cMasterUrl:'GL/GL_ChartOfAccount' ,
                cDisplayColumn:'AccountCd,Descs1' ,
                cProtect: true
            }, 
            PI_AccruedWithholdingPrefixCd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountPrefix'    , 
                    ColumnDB: 'PrefixCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName:'AccruedWithholdingPrefixCd', 
                cLabel:'Accrued Witholding Account Prefix', 
                cKey:false, 
                cOrder:15, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cMasterUrl:'GL/GL_SubModuleAccountPrefix' ,
                cDisplayColumn:'PrefixCd,ChartOfAccountPrefix' ,
                cProtect: true
            }, 
            PI_AccruedWithholdingAccountCd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCode'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "Status = 'A'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName:'AccruedWithholdingAccountCd', 
                cLabel:'Accrued Witholding Account Code', 
                cKey:false, 
                cOrder:16, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cMasterUrl:'GL/GL_ChartOfAccount' ,
                cDisplayColumn:'AccountCd,Descs1' ,
                cProtect: true
            }, 
            PI_AccruedWithholdingOthersPrefixCd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountPrefix'    , 
                    ColumnDB: 'PrefixCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName:'AccruedWithholdingOthersPrefixCd', 
                cLabel:'Accrued Witholding Others Account Prefix', 
                cKey:false, 
                cOrder:17, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cMasterUrl:'GL/GL_SubModuleAccountPrefix' ,
                cDisplayColumn:'PrefixCd,ChartOfAccountPrefix' ,
                cProtect: true
            }, 
            PI_AccruedWithholdingOthersAccountCd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCode'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "Status = 'A'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName:'AccruedWithholdingOthersAccountCd', 
                cLabel:'Accrued Witholding Others Account Code', 
                cKey:false, 
                cOrder:18, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cMasterUrl:'GL/GL_ChartOfAccount' ,
                cDisplayColumn:'AccountCd,Descs1' ,
                cProtect: true
            }, 
            PI_ExpenseWithholdingStraightLineAccountCd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCode'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "Status = 'A'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName:'ExpenseWithholdingStraightLineAccountCd', 
                cLabel:'Expense Witholding Straight Line Account Code', 
                cKey:false, 
                cOrder:18, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cMasterUrl:'GL/GL_ChartOfAccount' ,
                cDisplayColumn:'AccountCd,Descs1' ,
            }, 
            PI_AccruedWithholdingStraightLineAccountCd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCode'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "Status = 'A'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName:'AccruedWithholdingStraightLineAccountCd', 
                cLabel:'Accrued Witholding Straight Line Account Code', 
                cKey:false, 
                cOrder:18, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cMasterUrl:'GL/GL_ChartOfAccount' ,
                cDisplayColumn:'AccountCd,Descs1' ,
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
    }
  },
    methods: {
        OnTaxClassInput (data){
            if(data == 'W'){
                this.PI_VATPrefixCd.cProtect = true
                this.PI_VATAccountCd.cProtect = true                    

                this.PI_VATReversalFlag.cProtect = true

                this.PI_VATReversalPrefixCd.cProtect =	false			
                this.PI_PrepaidWithholdingPrefixCd.cProtect =	false		
                this.PI_ExpenseWithholdingPrefixCd.cProtect =	false		
                this.PI_AccruedWithholdingPrefixCd.cProtect =	false
                this.PI_VATReversalAccountCd.cProtect =	false
                this.PI_PrepaidWithholdingAccountCd.cProtect = false
                this.PI_ExpenseWithholdingAccountCd.cProtect = false
                this.PI_AccruedWithholdingAccountCd.cProtect = false
                this.PI_AccruedWithholdingOthersAccountCd.cProtect = false
                this.PI_AccruedWithholdingOthersPrefixCd.cProtect = false


            } else {                    
                this.PI_VATPrefixCd.cProtect = false
                this.PI_VATAccountCd.cProtect = false
                
                this.PI_VATReversalPrefixCd.cProtect =	true
                this.PI_PrepaidWithholdingAccountCd.cProtect = true
                this.PI_PrepaidWithholdingPrefixCd.cProtect = true
                this.PI_ExpenseWithholdingPrefixCd.cProtect = true
                this.PI_ExpenseWithholdingAccountCd.cProtect = true
                this.PI_AccruedWithholdingPrefixCd.cProtect = true
                this.PI_AccruedWithholdingAccountCd.cProtect = true
                this.PI_AccruedWithholdingOthersPrefixCd.cProtect = true
                this.PI_AccruedWithholdingOthersAccountCd.cProtect = true
                this.PI_ExpenseWithholdingStraightLineAccountCd.cProtect = true
                this.PI_AccruedWithholdingStraightLineAccountCd.cProtect = true
            }
        },
        OnVATReversalFlagInput (data) {
            if(data == 'N'){
                this.PI_VATReversalPrefixCd.cProtect =	true
            } else {
                this.PI_VATReversalPrefixCd.cProtect =	false
            }
        },
        OnVATPrefixCdChange (data) {
        this.$nextTick(() => {
            this.M_CM_TaxMasterDetail.VATPrefixCd = data.id
            this.M_CM_TaxMasterDetail.VATPrefixCdLabel = data.label
//{VATPrefixCd}
        })
        this.$forceUpdate()
        },
        OnVATAccountCdChange (data) {
        this.$nextTick(() => {
            this.M_CM_TaxMasterDetail.VATAccountCd = data.id
            this.M_CM_TaxMasterDetail.VATAccountCdLabel = data.label
//{VATAccountCd}
        })
        this.$forceUpdate()
        },
        OnVATReversalPrefixCdChange (data) {
        this.$nextTick(() => {
            this.M_CM_TaxMasterDetail.VATReversalPrefixCd = data.id
            this.M_CM_TaxMasterDetail.VATReversalPrefixCdLabel = data.label
//{VATReversalPrefixCd}
        })
        this.$forceUpdate()
        },
        OnVATReversalAccountCdChange (data) {
        this.$nextTick(() => {
            this.M_CM_TaxMasterDetail.VATReversalAccountCd = data.id
            this.M_CM_TaxMasterDetail.VATReversalAccountCdLabel = data.label
//{VATReversalAccountCd}
        })
        this.$forceUpdate()
        },
        OnPrepaidWithholdingPrefixCdChange (data) {
        this.$nextTick(() => {
            this.M_CM_TaxMasterDetail.PrepaidWithholdingPrefixCd = data.id
            this.M_CM_TaxMasterDetail.PrepaidWithholdingPrefixCdLabel = data.label
//{PrepaidWithholdingPrefixCd}
        })
        this.$forceUpdate()
        },
        OnPrepaidWithholdingAccountCdChange (data) {
        this.$nextTick(() => {
            this.M_CM_TaxMasterDetail.PrepaidWithholdingAccountCd = data.id
            this.M_CM_TaxMasterDetail.PrepaidWithholdingAccountCdLabel = data.label
//{PrepaidWithholdingAccountCd}
        })
        this.$forceUpdate()
        },
        OnExpenseWithholdingPrefixCdChange (data) {
        this.$nextTick(() => {
            this.M_CM_TaxMasterDetail.ExpenseWithholdingPrefixCd = data.id
            this.M_CM_TaxMasterDetail.ExpenseWithholdingPrefixCdLabel = data.label
//{ExpenseWithholdingPrefixCd}
        })
        this.$forceUpdate()
        },
        OnExpenseWithholdingAccountCdChange (data) {
        this.$nextTick(() => {
            this.M_CM_TaxMasterDetail.ExpenseWithholdingAccountCd = data.id
            this.M_CM_TaxMasterDetail.ExpenseWithholdingAccountCdLabel = data.label
//{ExpenseWithholdingAccountCd}
        })
        this.$forceUpdate()
        },
        OnAccruedWithholdingPrefixCdChange (data) {
        this.$nextTick(() => {
            this.M_CM_TaxMasterDetail.AccruedWithholdingPrefixCd = data.id
            this.M_CM_TaxMasterDetail.AccruedWithholdingPrefixCdLabel = data.label
//{AccruedWithholdingPrefixCd}
        })
        this.$forceUpdate()
        },
        OnAccruedWithholdingAccountCdChange (data) {
        this.$nextTick(() => {
            this.M_CM_TaxMasterDetail.AccruedWithholdingAccountCd = data.id
            this.M_CM_TaxMasterDetail.AccruedWithholdingAccountCdLabel = data.label
//{AccruedWithholdingAccountCd}
        })
        this.$forceUpdate()
        },
        OnAccruedWithholdingOthersPrefixCdChange (data) {
        this.$nextTick(() => {
            this.M_CM_TaxMasterDetail.AccruedWithholdingOthersPrefixCd = data.id
            this.M_CM_TaxMasterDetail.AccruedWithholdingOthersPrefixCdLabel = data.label
//{AccruedWithholdingOthersPrefixCd}
        })
        this.$forceUpdate()
        },
        OnAccruedWithholdingOthersAccountCdChange (data) {
        this.$nextTick(() => {
            this.M_CM_TaxMasterDetail.AccruedWithholdingOthersAccountCd = data.id
            this.M_CM_TaxMasterDetail.AccruedWithholdingOthersAccountCdLabel = data.label
//{AccruedWithholdingOthersAccountCd}
        })
        this.$forceUpdate()
        },
        OnExpenseWithholdingStraightLineAccountCdChange (data) {
        this.$nextTick(() => {
            this.M_CM_TaxMasterDetail.ExpenseWithholdingStraightLineAccountCd = data.id
            this.M_CM_TaxMasterDetail.ExpenseWithholdingStraightLineAccountCdLabel = data.label
//{ExpenseWithholdingStraightLineAccountCd}
        })
        this.$forceUpdate()
        },
        OnAccruedWithholdingStraightLineAccountCdChange (data) {
        this.$nextTick(() => {
            this.M_CM_TaxMasterDetail.AccruedWithholdingStraightLineAccountCd = data.id
            this.M_CM_TaxMasterDetail.AccruedWithholdingStraightLineAccountCdLabel = data.label
//{AccruedWithholdingStraightLineAccountCd}
        })
        this.$forceUpdate()
        },
		
		setToolbarButton () {
           //this.getToolbar().statusFunction[4].disabled = false
		},
        M_Head_Table () {
            this.$store.commit('setEventStatus', 'HEADTABLE')
            this.$store.commit('setLevel',this.PageLevel)
            this.$parent.isDetail = false
            this.FormToMasterPage().ValidasiPage()
        },
        M_PageSize(){
			this.$store.commit('setEventStatus', 'PAGESIZE')
            this.$store.commit('setLevel',this.PageLevel)
            this.$parent.isDetail = false
            this.FormToMasterPage().ValidasiPage()
        },
        M_TabClick(){
        },
        M_Pagination(){
			this.$store.commit('setEventStatus', 'PAGINATION')
            this.$store.commit('setLevel',this.PageLevel)
            this.$parent.isDetail = false
            this.FormToMasterPage().ValidasiPage()
        },
        M_Advance_Filter(){
        },
        M_Search(data){
            this.$store.commit('setEventStatus', 'ONSEARCHENTER')
           this.$store.commit('setLevel',this.PageLevel)
           this.$parent.isDetail = false
           this.FormToMasterPage().ValidasiPage()
           this.FormToABSList().doGetList(data,'eb_getList')
       },
        M_Refresh(){
            this.$parent.isDetail = false
            this.FormToABSList().doGetList('','refresh')
        },
        SaveData () {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                TaxCd: this.M_CM_TaxMasterDetail.TaxCd,
                TaxType: this.M_CM_TaxMasterDetail.TaxType,
                Descs: this.M_CM_TaxMasterDetail.Descs,
                TaxRate: this.M_CM_TaxMasterDetail.TaxRate ? this.replaceAllString(this.M_CM_TaxMasterDetail.TaxRate, ",", "").split(".")[0] : 0 ,
                TaxClass: this.M_CM_TaxMasterDetail.TaxClass,
                VATReversalFlag: this.M_CM_TaxMasterDetail.VATReversalFlag,
                VATAccountCd: this.M_CM_TaxMasterDetail.VATAccountCd,
                VATPrefixCd: this.M_CM_TaxMasterDetail.VATPrefixCd,
                VATReversalAccountCd: this.M_CM_TaxMasterDetail.VATReversalAccountCd,
                VATReversalPrefixCd: this.M_CM_TaxMasterDetail.VATReversalPrefixCd,
                PrepaidWithholdingAccountCd: this.M_CM_TaxMasterDetail.PrepaidWithholdingAccountCd,
                PrepaidWithholdingPrefixCd: this.M_CM_TaxMasterDetail.PrepaidWithholdingPrefixCd,
                ExpenseWithholdingAccountCd: this.M_CM_TaxMasterDetail.ExpenseWithholdingAccountCd,
                ExpenseWithholdingPrefixCd: this.M_CM_TaxMasterDetail.ExpenseWithholdingPrefixCd,
                AccruedWithholdingAccountCd: this.M_CM_TaxMasterDetail.AccruedWithholdingAccountCd,
                AccruedWithholdingPrefixCd: this.M_CM_TaxMasterDetail.AccruedWithholdingPrefixCd,
                AccruedWithholdingOthersAccountCd: this.M_CM_TaxMasterDetail.AccruedWithholdingOthersAccountCd,
                AccruedWithholdingOthersPrefixCd: this.M_CM_TaxMasterDetail.AccruedWithholdingOthersPrefixCd,
                UserInput: this.getDataUser().user_id ,
                ExpenseWithholdingStraightLineAccountCd: this.M_CM_TaxMasterDetail.ExpenseWithholdingStraightLineAccountCd,
                AccruedWithholdingStraightLineAccountCd: this.M_CM_TaxMasterDetail.AccruedWithholdingStraightLineAccountCd                
            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return
                
                this.FormToABSList().doGetList('','save')

                this.alertSuccess(response.Message)
                .then(() => {
                    this.getToolbar().setButton(false)
                    this.$store.commit('setListDisable', false)
                    this.$store.commit('setStatus', 'view')
					this.$store.commit('setEventStatus', 'Save')
                    this.FormToABSList().doGetList('','eb_getList')
                    this.$parent.isDetail = false

                    this.FormToMasterPage().ValidasiPage()
										
					
                })
            })

        },
        UpdateData () {
            
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                TaxCd: this.M_CM_TaxMasterDetail.TaxCd,
                TaxType: this.M_CM_TaxMasterDetail.TaxType,
                Descs: this.M_CM_TaxMasterDetail.Descs,
                TaxRate: this.M_CM_TaxMasterDetail.TaxRate ? this.replaceAllString(this.M_CM_TaxMasterDetail.TaxRate, ",", "").split(".")[0] : 0 ,
                TaxClass: this.M_CM_TaxMasterDetail.TaxClass,
                VATReversalFlag: this.M_CM_TaxMasterDetail.VATReversalFlag,
                VATAccountCd: this.M_CM_TaxMasterDetail.VATAccountCd,
                VATPrefixCd: this.M_CM_TaxMasterDetail.VATPrefixCd,
                VATReversalAccountCd: this.M_CM_TaxMasterDetail.VATReversalAccountCd,
                VATReversalPrefixCd: this.M_CM_TaxMasterDetail.VATReversalPrefixCd,
                PrepaidWithholdingAccountCd: this.M_CM_TaxMasterDetail.PrepaidWithholdingAccountCd,
                PrepaidWithholdingPrefixCd: this.M_CM_TaxMasterDetail.PrepaidWithholdingPrefixCd,
                ExpenseWithholdingAccountCd: this.M_CM_TaxMasterDetail.ExpenseWithholdingAccountCd,
                ExpenseWithholdingPrefixCd: this.M_CM_TaxMasterDetail.ExpenseWithholdingPrefixCd,
                AccruedWithholdingAccountCd: this.M_CM_TaxMasterDetail.AccruedWithholdingAccountCd,
                AccruedWithholdingPrefixCd: this.M_CM_TaxMasterDetail.AccruedWithholdingPrefixCd,
                AccruedWithholdingOthersAccountCd: this.M_CM_TaxMasterDetail.AccruedWithholdingOthersAccountCd,
                AccruedWithholdingOthersPrefixCd: this.M_CM_TaxMasterDetail.AccruedWithholdingOthersPrefixCd,
                UserEdit: this.getDataUser().user_id ,
                LastUpdateStamp: this.M_CM_TaxMasterDetail.LastUpdateStamp,
                ExpenseWithholdingStraightLineAccountCd: this.M_CM_TaxMasterDetail.ExpenseWithholdingStraightLineAccountCd,
                AccruedWithholdingStraightLineAccountCd: this.M_CM_TaxMasterDetail.AccruedWithholdingStraightLineAccountCd                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                this.alertSuccess(response.Message)
                .then(() => {
                    this.getToolbar().setButton(false)
                    this.$store.commit('setListDisable', false)
                    this.$store.commit('setStatus', 'view')

                    this.FormToABSList().doGetList('','update')
                    this.$parent.isDetail = false

                    this.FormToMasterPage().ValidasiPage()
					
                })
            })

        },
		m_ClearForm(){
            this.M_CM_TaxMasterDetail ={
                TaxCd: '',
                TaxType: '',
                Descs: '',
                TaxRate: '0',
                TaxClass: 'V',
                VATReversalFlag: 'Y',
                VATAccountCd: '',
                VATPrefixCd: '',
                VATReversalAccountCd: '',
                VATReversalPrefixCd: '',
                PrepaidWithholdingAccountCd: '',
                PrepaidWithholdingPrefixCd: '',
                ExpenseWithholdingAccountCd: '',
                ExpenseWithholdingPrefixCd: '',
                AccruedWithholdingAccountCd: '',
                AccruedWithholdingPrefixCd: '',
                T0: '',
                T1: '',
                T2: '',
                T3: '',
                T4: '',
                T5: '',
                T6: '',
                T7: '',
                T8: '',
                T9: '',
                T10: '',
                T11: '',
                T12: '',
                T13: '',
                T14: '',
                T15: '',
                T16: '',
                T17: '',
                T18: '',
                T19: '',
                T20: '',
                T21: '',
                T22: '',
                T23: '',
                T24: '',
                T25: '',
                T26: '',
                T27: '',
                T28: '',
                T29: '',
                T30: '',
                UserInput: '',
                UserEdit: this.getDataUser().user_id,
                TimeInput: '',
                TimeEdit: '',
                LastUpdateStamp: 0,
                AccruedWithholdingOthersAccountCd: '',
                AccruedWithholdingOthersPrefixCd: '',
                ControlSequenceNo: 0,
                ExpenseWithholdingStraightLineAccountCd: '',
                AccruedWithholdingStraightLineAccountCd: '',
                RowId: 0
                    }
            		
		},
        M_New(){
            this.$parent.state = 'NEW'
            this.$parent.isDetail = true
			this.m_ClearForm()
			let data = this.$store.getters.GetPage1Data
            this.M_CM_TaxMasterDetail.TaxCd = data.TaxCd 


			
            this.FormToMasterPage().ValidasiPage()
				
            //this.$nextTick().then(() => {document.getElementById("TaxCd").focus()})
        },
        M_Edit(){
            //this.$nextTick().then(() => {
            //    document.getElementById("???").focus()
            //})
        },
        M_Delete(){
            var data = this.FormToABSList().getRowSelected()
            var dataDelete = []

            data.forEach((value) => {
                dataDelete.push({
                TaxCd: value.TaxCd,
                TaxType: value.TaxType,
                LastUpdateStamp: value.LastUpdateStamp,
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
        M_Save(){
            // if(this.$parent.state !== 'NEW'){
			if(this.inputStatus == 'EDIT')
			{
                this.UpdateData()
            }
            else 
			{
                this.SaveData()
            }
            this.FormToMasterPage().ValidasiPage()
        },
        paramFromParent(){
            this.$parent.isDetail = false
            let data = this.$store.getters.GetPage1Data
            this.M_CM_TaxMasterDetail.TaxCd = data.TaxCd 
            this.propList.initialWhere =" TaxCd = '" + data.TaxCd + "' "
        
            this.FormToABSList().doGetList('','eb_getList')
        },
		M_Cancel() {},
        rowClicked (record, index) {
            this.$parent.state = 'UPDATE'
            this.$parent.isDetail = true
            
            this.$store.commit('SetPage2Data', record)
            this.$store.commit('setEventStatus', 'rowClick')
            this.$store.commit('setLevel',this.PageLevel)
            this.getDataBy(record)
            this.$store.commit('setDisableChildData', record.TaxType)
            //selalu taro paling bawah
            this.FormToMasterPage().ValidasiPage()
        },
        rowLink: function(url){
            this.$refs.modalTest.show()
        },
        getDataBy (record) {
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                TaxCd: record.TaxCd,
                TaxType: record.TaxType				
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
this.M_CM_TaxMasterDetail ={
                TaxCd: data.TaxCd,
                TaxType: data.TaxType,
                Descs: data.Descs,
                TaxRate: this.isCurrency(data.TaxRate),
                TaxClass: data.TaxClass,
                VATReversalFlag: data.VATReversalFlag,
                VATAccountCd: data.VATAccountCd,
                VATPrefixCd: data.VATPrefixCd,
                VATReversalAccountCd: data.VATReversalAccountCd,
                VATReversalPrefixCd: data.VATReversalPrefixCd,
                PrepaidWithholdingAccountCd: data.PrepaidWithholdingAccountCd,
                PrepaidWithholdingPrefixCd: data.PrepaidWithholdingPrefixCd,
                ExpenseWithholdingAccountCd: data.ExpenseWithholdingAccountCd,
                ExpenseWithholdingPrefixCd: data.ExpenseWithholdingPrefixCd,
                AccruedWithholdingAccountCd: data.AccruedWithholdingAccountCd,
                AccruedWithholdingPrefixCd: data.AccruedWithholdingPrefixCd,
                T0: data.T0,
                T1: data.T1,
                T2: data.T2,
                T3: data.T3,
                T4: data.T4,
                T5: data.T5,
                T6: data.T6,
                T7: data.T7,
                T8: data.T8,
                T9: data.T9,
                T10: data.T10,
                T11: data.T11,
                T12: data.T12,
                T13: data.T13,
                T14: data.T14,
                T15: data.T15,
                T16: data.T16,
                T17: data.T17,
                T18: data.T18,
                T19: data.T19,
                T20: data.T20,
                T21: data.T21,
                T22: data.T22,
                T23: data.T23,
                T24: data.T24,
                T25: data.T25,
                T26: data.T26,
                T27: data.T27,
                T28: data.T28,
                T29: data.T29,
                T30: data.T30,
                UserInput: data.UserInput,
                UserEdit: data.UserEdit,
                TimeInput: data.TimeInput,
                TimeEdit: data.TimeEdit,
                LastUpdateStamp: record.LastUpdateStamp,
                AccruedWithholdingOthersAccountCd: data.AccruedWithholdingOthersAccountCd,
                AccruedWithholdingOthersPrefixCd: data.AccruedWithholdingOthersPrefixCd,
                ControlSequenceNo: data.ControlSequenceNo,
                ExpenseWithholdingStraightLineAccountCd: data.ExpenseWithholdingStraightLineAccountCd,
                AccruedWithholdingStraightLineAccountCd: data.AccruedWithholdingStraightLineAccountCd,
                RowId: data.row_id
                    }
                 

  

                this.IEBy.Input = data.userinput
                this.IEBy.Edit = data.useredit

            })
        },
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

