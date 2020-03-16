<template>
    <div>        
    <ABSListVuex
      :prop="propList"
      :title = "data.query_name"
      @rowClicked="$parent.rowClicked"
      @rowDblClicked="$parent.doDoubleClick"
      @rowLinkClick="$parent.rowLink"
      @pageSize="$parent.M_PageSize"
      @pagination="$parent.M_Pagination"
      @filter="$parent.M_Advance_Filter"
      @headTable="$parent.M_Head_Table"
      @refreshColumn="$parent.refreshColumn"
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
                                <b-col md="12" id="col-left">
                                    <b-row>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_TaxType" v-model="M_CM_TaxMasterDetail.TaxType" ref='ref_TaxType'/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_Descs" v-model="M_CM_TaxMasterDetail.Descs" ref='ref_Descs'/>
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
                                        <ABSInputSelectList @change="OnVATPrefixCdChange" :prop="PI_VATPrefixCd" :value="M_CM_TaxMasterDetail.VATPrefixCd" :label="M_CM_TaxMasterDetail.VATPrefixCdLabel"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnVATAccountCdChange" :prop="PI_VATAccountCd" :value="M_CM_TaxMasterDetail.VATAccountCd" :label="M_CM_TaxMasterDetail.VATAccountCdLabel"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnVATReversalPrefixCdChange" :prop="PI_VATReversalPrefixCd" :value="M_CM_TaxMasterDetail.VATReversalPrefixCd" :label="M_CM_TaxMasterDetail.VATReversalPrefixCdLabel"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnVATReversalAccountCdChange" :prop="PI_VATReversalAccountCd" :value="M_CM_TaxMasterDetail.VATReversalAccountCd" :label="M_CM_TaxMasterDetail.VATReversalAccountCdLabel"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnPrepaidWithholdingPrefixCdChange" :prop="PI_PrepaidWithholdingPrefixCd" :value="M_CM_TaxMasterDetail.PrepaidWithholdingPrefixCd" :label="M_CM_TaxMasterDetail.PrepaidWithholdingPrefixCdLabel"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnPrepaidWithholdingAccountCdChange" :prop="PI_PrepaidWithholdingAccountCd" :value="M_CM_TaxMasterDetail.PrepaidWithholdingAccountCd" :label="M_CM_TaxMasterDetail.PrepaidWithholdingAccountCdLabel"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnExpenseWithholdingPrefixCdChange" :prop="PI_ExpenseWithholdingPrefixCd" :value="M_CM_TaxMasterDetail.ExpenseWithholdingPrefixCd" :label="M_CM_TaxMasterDetail.ExpenseWithholdingPrefixCdLabel"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnExpenseWithholdingAccountCdChange" :prop="PI_ExpenseWithholdingAccountCd" :value="M_CM_TaxMasterDetail.ExpenseWithholdingAccountCd" :label="M_CM_TaxMasterDetail.ExpenseWithholdingAccountCdLabel"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnAccruedWithholdingPrefixCdChange" :prop="PI_AccruedWithholdingPrefixCd" :value="M_CM_TaxMasterDetail.AccruedWithholdingPrefixCd" :label="M_CM_TaxMasterDetail.AccruedWithholdingPrefixCdLabel"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnAccruedWithholdingAccountCdChange" :prop="PI_AccruedWithholdingAccountCd" :value="M_CM_TaxMasterDetail.AccruedWithholdingAccountCd" :label="M_CM_TaxMasterDetail.AccruedWithholdingAccountCdLabel"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnAccruedWithholdingOthersPrefixCdChange" :prop="PI_AccruedWithholdingOthersPrefixCd" :value="M_CM_TaxMasterDetail.AccruedWithholdingOthersPrefixCd" :label="M_CM_TaxMasterDetail.AccruedWithholdingOthersPrefixCdLabel"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnAccruedWithholdingOthersAccountCdChange" :prop="PI_AccruedWithholdingOthersAccountCd" :value="M_CM_TaxMasterDetail.AccruedWithholdingOthersAccountCd" :label="M_CM_TaxMasterDetail.AccruedWithholdingOthersAccountCdLabel"/>
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
                                            <ABSInputSelectList @change="OnExpenseWithholdingStraightLineAccountCdChange" :prop="PI_ExpenseWithholdingStraightLineAccountCd" :value="M_CM_TaxMasterDetail.ExpenseWithholdingStraightLineAccountCd" :label="M_CM_TaxMasterDetail.ExpenseWithholdingStraightLineAccountCdLabel"/>
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
                                            <ABSInputSelectList @change="OnAccruedWithholdingStraightLineAccountCdChange" :prop="PI_AccruedWithholdingStraightLineAccountCd" :value="M_CM_TaxMasterDetail.AccruedWithholdingStraightLineAccountCd" :label="M_CM_TaxMasterDetail.AccruedWithholdingStraightLineAccountCdLabel"/>
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
                initialWhere:"tax_cd = '" + this.ValKey + "'",
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
                RowId: 0,
                cm_tax_master_h_id: ''
                    }
            ,
            PI_TaxType: { 
                cValidate :'required|max:5', 
                cName:'TaxType', 
                cLabel:'Tax Type', 
                cOrder:1, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
                cKey: true 
            }, 
            PI_Descs: { 
                cValidate :'required|max:60', 
                cName:'Deeescs', 
                cLabel:'Description', 
                cOrder:2, 
                cKey:false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_TaxRate: { 
                cValidate :'max:3|max_value:100', 
                cName:'TaxRate', 
                cLabel:'Tax Rate (%)', 
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
                cOrder:4, 
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
                cOrder:5, 
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
                cOrder:6, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cMasterUrl:'CM/CM_SubModuleAccountPrefix' ,
                // cDisplayColumn:'prefix_cd,chart_of_account_prefix' ,
                cDisplayColumn:'prefix_cd' ,
                cProtect: false
            }, 
            PI_VATAccountCd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCode'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "status = 'A'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName:'VATAccountCd', 
                cLabel:'VAT Account Code', 
                cKey:false, 
                cOrder:7, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cMasterUrl:'CM/CM_ChartOfAccount' ,
                // cDisplayColumn:'account_cd,descs1' ,
                cDisplayColumn:'account_cd' ,
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
                cOrder:8, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cMasterUrl:'CM/CM_SubModuleAccountPrefix' ,
                // cDisplayColumn:'prefix_cd,chart_of_account_prefix',
                cDisplayColumn:'prefix_cd',
                cProtect: false
            }, 
            PI_VATReversalAccountCd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCode'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "status = 'A'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName:'VATReversalAccountCd', 
                cLabel:'VAT Reversal Account Code', 
                cKey:false, 
                cOrder:9, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cMasterUrl:'CM/CM_ChartOfAccount' ,
                // cDisplayColumn:'account_cd,descs1' ,
                cDisplayColumn:'account_cd' ,
                cProtect: false
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
                cLabel:'Prepaid WHT Account Prefix', 
                cKey:false, 
                cOrder:10, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cMasterUrl:'CM/CM_SubModuleAccountPrefix' ,
                // cDisplayColumn:'prefix_cd,chart_of_account_prefix',
                cDisplayColumn:'prefix_cd',
                cProtect: true
            }, 
            PI_PrepaidWithholdingAccountCd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCode'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "status = 'A'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName:'PrepaidWithholdingAccountCd', 
                cLabel:'Prepaid WHT Account Code', 
                cKey:false, 
                cOrder:11, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cMasterUrl:'CM/CM_ChartOfAccount' ,
                // cDisplayColumn:'account_cd,descs1' ,
                cDisplayColumn:'account_cd' ,
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
                cLabel:'Expense WHT Account Prefix', 
                cKey:false, 
                cOrder:12, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cMasterUrl:'CM/CM_SubModuleAccountPrefix' ,
                // cDisplayColumn:'prefix_cd,chart_of_account_prefix',
                cDisplayColumn:'prefix_cd',
                cProtect: true
            }, 
            PI_ExpenseWithholdingAccountCd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCode'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "status = 'A'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName:'ExpenseWithholdingAccountCd', 
                cLabel:'Expense WHT Account Code', 
                cKey:false, 
                cOrder:13, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cMasterUrl:'CM/CM_ChartOfAccount' ,
                // cDisplayColumn:'account_cd,descs1' ,
                cDisplayColumn:'account_cd' ,
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
                cLabel:'Accrued WHT Account Prefix', 
                cKey:false, 
                cOrder:14, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cMasterUrl:'CM/CM_SubModuleAccountPrefix' ,
                // cDisplayColumn:'prefix_cd,chart_of_account_prefix' ,
                cDisplayColumn:'prefix_cd' ,
                cProtect: true
            }, 
            PI_AccruedWithholdingAccountCd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCode'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "status = 'A'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName:'AccruedWithholdingAccountCd', 
                cLabel:'Accrued WHT Account Code', 
                cKey:false, 
                cOrder:15, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cMasterUrl:'CM/CM_ChartOfAccount' ,
                // cDisplayColumn:'account_cd,descs1' ,
                cDisplayColumn:'account_cd' ,
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
                cLabel:'Accrued WHT Others Account Prefix', 
                cKey:false, 
                cOrder:16, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cMasterUrl:'CM/CM_SubModuleAccountPrefix' ,
                // cDisplayColumn:'prefix_cd,chart_of_account_prefix' ,
                cDisplayColumn:'prefix_cd' ,
                cProtect: true
            }, 
            PI_AccruedWithholdingOthersAccountCd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCode'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "status = 'A'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName:'AccruedWithholdingOthersAccountCd', 
                cLabel:'Accrued WHT Others Account Code', 
                cKey:false, 
                cOrder:17, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cMasterUrl:'CM/CM_ChartOfAccount' ,
                // cDisplayColumn:'account_cd,descs1' ,
                cDisplayColumn:'account_cd' ,
                cProtect: true
            }, 
            PI_ExpenseWithholdingStraightLineAccountCd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCode'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "status = 'A'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName:'ExpenseWithholdingStraightLineAccountCd', 
                cLabel:'Expense WHT Straight Line Account Code', 
                cKey:false, 
                cOrder:18, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cMasterUrl:'CM/CM_ChartOfAccount' ,
                // cDisplayColumn:'account_cd,descs1' ,
                cDisplayColumn:'account_cd' ,
            }, 
            PI_AccruedWithholdingStraightLineAccountCd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCode'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "status = 'A'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName:'AccruedWithholdingStraightLineAccountCd', 
                cLabel:'Accrued WHT Straight Line Account Code', 
                cKey:false, 
                cOrder:19, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cMasterUrl:'CM/CM_ChartOfAccount' ,
                // cDisplayColumn:'account_cd,descs1' ,
                cDisplayColumn:'account_cd' ,
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
            
            var VATReversalFlag = this.M_CM_TaxMasterDetail.VATReversalFlag
            
            this.$nextTick(() => {
                if(data == 'W'){                    
                    this.PI_VATReversalFlag.cProtect = true

                    this.PI_VATAccountCd.cProtect = true            
                    this.PI_VATReversalAccountCd.cProtect =	true

                    this.PI_VATPrefixCd.cProtect = true
                    this.PI_VATReversalPrefixCd.cProtect =	true

                    this.PI_PrepaidWithholdingPrefixCd.cProtect =	false
                    this.PI_ExpenseWithholdingPrefixCd.cProtect =	false		
                    this.PI_AccruedWithholdingPrefixCd.cProtect =	false
                    this.PI_PrepaidWithholdingAccountCd.cProtect = false
                    this.PI_ExpenseWithholdingAccountCd.cProtect = false
                    this.PI_AccruedWithholdingAccountCd.cProtect = false
                    this.PI_AccruedWithholdingOthersAccountCd.cProtect = false
                    this.PI_AccruedWithholdingOthersPrefixCd.cProtect = false

                    this.M_CM_TaxMasterDetail.VATReversalFlag = 'N'


                } else if(data == 'V' || data == 'O') {                                      
                    if(VATReversalFlag == 'N'){
                        this.PI_VATReversalPrefixCd.cProtect =	true
                        this.PI_VATReversalAccountCd.cProtect =	true
                    } else {
                        this.PI_VATReversalPrefixCd.cProtect = false
                        this.PI_VATReversalAccountCd.cProtect =	false
                    }
                                       
                    this.PI_VATPrefixCd.cProtect = false
                    this.PI_VATAccountCd.cProtect = false
                    
                    this.PI_VATReversalFlag.cProtect = false

                    this.PI_VATReversalPrefixCd.cProtect =	true
                    this.PI_VATReversalAccountCd.cProtect =	true

                    this.PI_PrepaidWithholdingAccountCd.cProtect = true
                    this.PI_PrepaidWithholdingPrefixCd.cProtect = true
                    this.PI_ExpenseWithholdingPrefixCd.cProtect = true
                    this.PI_ExpenseWithholdingAccountCd.cProtect = true
                    this.PI_AccruedWithholdingPrefixCd.cProtect = true
                    this.PI_AccruedWithholdingAccountCd.cProtect = true
                    this.PI_AccruedWithholdingOthersPrefixCd.cProtect = true
                    this.PI_AccruedWithholdingOthersAccountCd.cProtect = true
                    // this.PI_ExpenseWithholdingStraightLineAccountCd.cProtect = true
                    // this.PI_AccruedWithholdingStraightLineAccountCd.cProtect = true
                }
               
            })
            this.$forceUpdate()
        },
        OnVATReversalFlagInput (data) {
            this.$nextTick(() => {
                if(data == 'Y'){
                    this.PI_VATReversalPrefixCd.cProtect = false
                    this.PI_VATReversalAccountCd.cProtect =	false
                } else {
                    this.PI_VATReversalPrefixCd.cProtect = true
                    this.PI_VATReversalAccountCd.cProtect =	true
                }
            })
            this.$forceUpdate()
        },
        OnVATPrefixCdChange (data) {
            this.$nextTick(() => {
                this.M_CM_TaxMasterDetail.VATPrefixCd = data.gl_chart_of_account_prefix_id
                this.M_CM_TaxMasterDetail.VATPrefixCdLabel = data.label
            //{VATPrefixCd}
            })
            this.$forceUpdate()
        },
        OnVATAccountCdChange (data) {
            this.$nextTick(() => {
                this.M_CM_TaxMasterDetail.VATAccountCd = data.gl_chart_of_account_id
                this.M_CM_TaxMasterDetail.VATAccountCdLabel = data.label
                //{VATAccountCd}
            })
            this.$forceUpdate()
        },
        OnVATReversalPrefixCdChange (data) {
            this.$nextTick(() => {
                this.M_CM_TaxMasterDetail.VATReversalPrefixCd = data.gl_chart_of_account_prefix_id
                this.M_CM_TaxMasterDetail.VATReversalPrefixCdLabel = data.label
                //{VATReversalPrefixCd}
            })
            this.$forceUpdate()
        },
        OnVATReversalAccountCdChange (data) {
            this.$nextTick(() => {
                this.M_CM_TaxMasterDetail.VATReversalAccountCd = data.gl_chart_of_account_id
                this.M_CM_TaxMasterDetail.VATReversalAccountCdLabel = data.label
                //{VATReversalAccountCd}
            })
            this.$forceUpdate()
        },
        OnPrepaidWithholdingPrefixCdChange (data) {
            this.$nextTick(() => {
                this.M_CM_TaxMasterDetail.PrepaidWithholdingPrefixCd = data.gl_chart_of_account_prefix_id
                this.M_CM_TaxMasterDetail.PrepaidWithholdingPrefixCdLabel = data.label
                //{PrepaidWithholdingPrefixCd}
            })
            this.$forceUpdate()
        },
        OnPrepaidWithholdingAccountCdChange (data) {
            this.$nextTick(() => {
                this.M_CM_TaxMasterDetail.PrepaidWithholdingAccountCd = data.gl_chart_of_account_id
                this.M_CM_TaxMasterDetail.PrepaidWithholdingAccountCdLabel = data.label
                //{PrepaidWithholdingAccountCd}
            })
            this.$forceUpdate()
        },
        OnExpenseWithholdingPrefixCdChange (data) {
                this.$nextTick(() => {
                    this.M_CM_TaxMasterDetail.ExpenseWithholdingPrefixCd = data.gl_chart_of_account_prefix_id
                    this.M_CM_TaxMasterDetail.ExpenseWithholdingPrefixCdLabel = data.label
                    //{ExpenseWithholdingPrefixCd}
                })
                this.$forceUpdate()
        },
        OnExpenseWithholdingAccountCdChange (data) {
            this.$nextTick(() => {
                this.M_CM_TaxMasterDetail.ExpenseWithholdingAccountCd = data.gl_chart_of_account_id
                this.M_CM_TaxMasterDetail.ExpenseWithholdingAccountCdLabel = data.label
                //{ExpenseWithholdingAccountCd}
            })
            this.$forceUpdate()
        },
        OnAccruedWithholdingPrefixCdChange (data) {
            this.$nextTick(() => {
                this.M_CM_TaxMasterDetail.AccruedWithholdingPrefixCd = data.gl_chart_of_account_prefix_id
                this.M_CM_TaxMasterDetail.AccruedWithholdingPrefixCdLabel = data.label
                //{AccruedWithholdingPrefixCd}
            })
            this.$forceUpdate()
        },
        OnAccruedWithholdingAccountCdChange (data) {
            this.$nextTick(() => {
                this.M_CM_TaxMasterDetail.AccruedWithholdingAccountCd = data.gl_chart_of_account_id
                this.M_CM_TaxMasterDetail.AccruedWithholdingAccountCdLabel = data.label
                //{AccruedWithholdingAccountCd}
            })
            this.$forceUpdate()
        },
        OnAccruedWithholdingOthersPrefixCdChange (data) {
            this.$nextTick(() => {
                this.M_CM_TaxMasterDetail.AccruedWithholdingOthersPrefixCd = data.gl_chart_of_account_prefix_id
                this.M_CM_TaxMasterDetail.AccruedWithholdingOthersPrefixCdLabel = data.label
                //{AccruedWithholdingOthersPrefixCd}
            })
            this.$forceUpdate()
        },
        OnAccruedWithholdingOthersAccountCdChange (data) {
            this.$nextTick(() => {
                this.M_CM_TaxMasterDetail.AccruedWithholdingOthersAccountCd = data.gl_chart_of_account_id
                this.M_CM_TaxMasterDetail.AccruedWithholdingOthersAccountCdLabel = data.label
                //{AccruedWithholdingOthersAccountCd}
            })
            this.$forceUpdate()
        },
        OnExpenseWithholdingStraightLineAccountCdChange (data) {
            this.$nextTick(() => {
                this.M_CM_TaxMasterDetail.ExpenseWithholdingStraightLineAccountCd = data.gl_chart_of_account_id
                this.M_CM_TaxMasterDetail.ExpenseWithholdingStraightLineAccountCdLabel = data.label
                //{ExpenseWithholdingStraightLineAccountCd}
            })
            this.$forceUpdate()
        },
        OnAccruedWithholdingStraightLineAccountCdChange (data) {
            this.$nextTick(() => {
                this.M_CM_TaxMasterDetail.AccruedWithholdingStraightLineAccountCd = data.gl_chart_of_account_id
                this.M_CM_TaxMasterDetail.AccruedWithholdingStraightLineAccountCdLabel = data.label
                //{AccruedWithholdingStraightLineAccountCd}
            })
            this.$forceUpdate()
        },
		
		setToolbarButton () {
           //this.getToolbar().statusFunction[4].disabled = false
		},
        M_Head_Table () {
        },
        M_PageSize () {
        },
        M_TabClick () {
        },
        M_Pagination () {
        },
        M_Advance_Filter () {
        },
        M_Search (data) {
        },
        M_Refresh () {
        },
        // SaveData () {
        M_Insert () {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                tax_cd: this.M_CM_TaxMasterDetail.TaxCd,
                tax_type: this.M_CM_TaxMasterDetail.TaxType,
                descs: this.M_CM_TaxMasterDetail.Descs,
                tax_rate: parseFloat(this.M_CM_TaxMasterDetail.TaxRate ? this.replaceAllString(this.M_CM_TaxMasterDetail.TaxRate, ",", "", 'number') : 0) ,
                tax_class: this.M_CM_TaxMasterDetail.TaxClass,
                vat_reversal_flag: this.M_CM_TaxMasterDetail.VATReversalFlag,
                vat_account_id: this.M_CM_TaxMasterDetail.VATAccountCd && this.M_CM_TaxMasterDetail.VATAccountCd !== '' ? this.M_CM_TaxMasterDetail.VATAccountCd : 'NULL',
                vat_prefix_id: this.M_CM_TaxMasterDetail.VATPrefixCd && this.M_CM_TaxMasterDetail.VATPrefixCd !== '' ? this.M_CM_TaxMasterDetail.VATPrefixCd : 'NULL',
                vat_reversal_account_id: this.M_CM_TaxMasterDetail.VATReversalAccountCd && this.M_CM_TaxMasterDetail.VATReversalAccountCd !== '' ? this.M_CM_TaxMasterDetail.VATReversalAccountCd : 'NULL', 
                vat_reversal_prefix_id: this.M_CM_TaxMasterDetail.VATReversalPrefixCd && this.M_CM_TaxMasterDetail.VATReversalPrefixCd !== '' ? this.M_CM_TaxMasterDetail.VATReversalPrefixCd : 'NULL',
                prepaid_withholding_account_id: this.M_CM_TaxMasterDetail.PrepaidWithholdingAccountCd && this.M_CM_TaxMasterDetail.PrepaidWithholdingAccountCd !== '' ? this.M_CM_TaxMasterDetail.PrepaidWithholdingAccountCd : 'NULL',
                prepaid_withholding_prefix_id: this.M_CM_TaxMasterDetail.PrepaidWithholdingPrefixCd && this.M_CM_TaxMasterDetail.PrepaidWithholdingPrefixCd !== '' ? this.M_CM_TaxMasterDetail.PrepaidWithholdingPrefixCd : 'NULL',
                expense_withholding_account_id: this.M_CM_TaxMasterDetail.ExpenseWithholdingAccountCd && this.M_CM_TaxMasterDetail.ExpenseWithholdingAccountCd !== '' ? this.M_CM_TaxMasterDetail.ExpenseWithholdingAccountCd : 'NULL',
                expense_withholding_prefix_id: this.M_CM_TaxMasterDetail.ExpenseWithholdingPrefixCd && this.M_CM_TaxMasterDetail.ExpenseWithholdingPrefixCd !== '' ? this.M_CM_TaxMasterDetail.ExpenseWithholdingPrefixCd : 'NULL',
                accrued_withholding_account_id: this.M_CM_TaxMasterDetail.AccruedWithholdingAccountCd && this.M_CM_TaxMasterDetail.AccruedWithholdingAccountCd !== '' ? this.M_CM_TaxMasterDetail.AccruedWithholdingAccountCd : 'NULL',
                accrued_withholding_prefix_id: this.M_CM_TaxMasterDetail.AccruedWithholdingPrefixCd && this.M_CM_TaxMasterDetail.AccruedWithholdingPrefixCd !== '' ? this.M_CM_TaxMasterDetail.AccruedWithholdingPrefixCd : 'NULL',
                accrued_withholding_others_account_id: this.M_CM_TaxMasterDetail.AccruedWithholdingOthersAccountCd && this.M_CM_TaxMasterDetail.AccruedWithholdingOthersAccountCd !== '' ? this.M_CM_TaxMasterDetail.AccruedWithholdingOthersAccountCd : 'NULL',
                accrued_withholding_others_prefix_id: this.M_CM_TaxMasterDetail.AccruedWithholdingOthersPrefixCd && this.M_CM_TaxMasterDetail.AccruedWithholdingOthersPrefixCd !== '' ? this.M_CM_TaxMasterDetail.AccruedWithholdingOthersPrefixCd : 'NULL',
                user_input: this.getDataUser().user_id ,
                expense_withholding_straight_line_account_id: this.M_CM_TaxMasterDetail.ExpenseWithholdingStraightLineAccountCd && this.M_CM_TaxMasterDetail.ExpenseWithholdingStraightLineAccountCd !== '' ? this.M_CM_TaxMasterDetail.ExpenseWithholdingStraightLineAccountCd : 'NULL',
                accrued_withholding_straight_line_account_id: this.M_CM_TaxMasterDetail.AccruedWithholdingStraightLineAccountCd && this.M_CM_TaxMasterDetail.AccruedWithholdingStraightLineAccountCd !== '' ? this.M_CM_TaxMasterDetail.AccruedWithholdingStraightLineAccountCd : 'NULL',
                cm_tax_master_h_id: this.M_CM_TaxMasterDetail.cm_tax_master_h_id                
            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return
                
                this.$parent.resultInsert(response.Message)
            })

        },
        // UpdateData () {
        M_Update () {
            
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                tax_cd: this.M_CM_TaxMasterDetail.TaxCd,
                tax_type: this.M_CM_TaxMasterDetail.TaxType,
                descs: this.M_CM_TaxMasterDetail.Descs,
                tax_rate: parseFloat(this.M_CM_TaxMasterDetail.TaxRate ? this.replaceAllString(this.M_CM_TaxMasterDetail.TaxRate, ",", "", 'number') : 0),
                tax_class: this.M_CM_TaxMasterDetail.TaxClass,
                vat_reversal_flag: this.M_CM_TaxMasterDetail.VATReversalFlag,
                vat_account_id: this.M_CM_TaxMasterDetail.VATAccountCd && this.M_CM_TaxMasterDetail.VATAccountCd !== '' ? this.M_CM_TaxMasterDetail.VATAccountCd : 'NULL',
                vat_prefix_id: this.M_CM_TaxMasterDetail.VATPrefixCd && this.M_CM_TaxMasterDetail.VATPrefixCd !== '' ? this.M_CM_TaxMasterDetail.VATPrefixCd : 'NULL',
                vat_reversal_account_id: this.M_CM_TaxMasterDetail.VATReversalAccountCd && this.M_CM_TaxMasterDetail.VATReversalAccountCd !== '' ? this.M_CM_TaxMasterDetail.VATReversalAccountCd : 'NULL',
                vat_reversal_prefix_id: this.M_CM_TaxMasterDetail.VATReversalPrefixCd && this.M_CM_TaxMasterDetail.VATReversalPrefixCd !== '' ? this.M_CM_TaxMasterDetail.VATReversalPrefixCd : 'NULL',
                prepaid_withholding_account_id: this.M_CM_TaxMasterDetail.PrepaidWithholdingAccountCd && this.M_CM_TaxMasterDetail.PrepaidWithholdingAccountCd !== '' ? this.M_CM_TaxMasterDetail.PrepaidWithholdingAccountCd : 'NULL',
                prepaid_withholding_prefix_id: this.M_CM_TaxMasterDetail.PrepaidWithholdingPrefixCd && this.M_CM_TaxMasterDetail.PrepaidWithholdingPrefixCd !== '' ? this.M_CM_TaxMasterDetail.PrepaidWithholdingPrefixCd : 'NULL',
                expense_withholding_account_id: this.M_CM_TaxMasterDetail.ExpenseWithholdingAccountCd && this.M_CM_TaxMasterDetail.ExpenseWithholdingAccountCd !== '' ? this.M_CM_TaxMasterDetail.ExpenseWithholdingAccountCd : 'NULL',
                expense_withholding_prefix_id: this.M_CM_TaxMasterDetail.ExpenseWithholdingPrefixCd && this.M_CM_TaxMasterDetail.ExpenseWithholdingPrefixCd !== '' ? this.M_CM_TaxMasterDetail.ExpenseWithholdingPrefixCd : 'NULL',
                accrued_withholding_account_id: this.M_CM_TaxMasterDetail.AccruedWithholdingAccountCd && this.M_CM_TaxMasterDetail.AccruedWithholdingAccountCd !== '' ? this.M_CM_TaxMasterDetail.AccruedWithholdingAccountCd : 'NULL',
                accrued_withholding_prefix_id: this.M_CM_TaxMasterDetail.AccruedWithholdingPrefixCd && this.M_CM_TaxMasterDetail.AccruedWithholdingPrefixCd !== '' ? this.M_CM_TaxMasterDetail.AccruedWithholdingPrefixCd : 'NULL',
                accrued_withholding_others_account_id: this.M_CM_TaxMasterDetail.AccruedWithholdingOthersAccountCd && this.M_CM_TaxMasterDetail.AccruedWithholdingOthersAccountCd !== '' ? this.M_CM_TaxMasterDetail.AccruedWithholdingOthersAccountCd : 'NULL',
                accrued_withholding_others_prefix_id: this.M_CM_TaxMasterDetail.AccruedWithholdingOthersPrefixCd && this.M_CM_TaxMasterDetail.AccruedWithholdingOthersPrefixCd !== '' ? this.M_CM_TaxMasterDetail.AccruedWithholdingOthersPrefixCd : 'NULL',
                user_edit: this.getDataUser().user_id ,
                lastupdatestamp: this.M_CM_TaxMasterDetail.LastUpdateStamp,
                expense_withholding_straight_line_account_id: this.M_CM_TaxMasterDetail.ExpenseWithholdingStraightLineAccountCd && this.M_CM_TaxMasterDetail.ExpenseWithholdingStraightLineAccountCd !== '' ? this.M_CM_TaxMasterDetail.ExpenseWithholdingStraightLineAccountCd : 'NULL',
                accrued_withholding_straight_line_account_id: this.M_CM_TaxMasterDetail.AccruedWithholdingStraightLineAccountCd && this.M_CM_TaxMasterDetail.AccruedWithholdingStraightLineAccountCd !== '' ? this.M_CM_TaxMasterDetail.AccruedWithholdingStraightLineAccountCd : 'NULL'                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                this.$parent.resultUpdate(response.Message)
            })

        },
		M_ClearForm(){
            this.M_CM_TaxMasterDetail ={
                TaxCd: '',
                TaxType: '',
                Descs: '',
                TaxRate: '',
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
                RowId: 0,
                cm_tax_master_h_id:''
            }		
		},
        M_New () {
			let data = this.$store.getters.GetPage1Data
            this.M_CM_TaxMasterDetail.TaxCd = data.tax_cd
            this.M_CM_TaxMasterDetail.cm_tax_master_h_id = data.row_id

            this.$refs.ref_TaxType.focus()
        },
        M_Edit () {
            this.$refs.ref_Descs.focus()
        },
        M_Delete (dt) {
            var data = this.FormToABSList().getRowSelected()  
            var dataDelete = []

            
            data.forEach((value) => {
                dataDelete.push({
                    tax_cd: value.tax_cd,
                    // subportfolio_cd: this.getDataUser().subportfolio_cd,
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
        
        paramFromParent () {
            this.$parent.showForm = false
            let data = this.$store.getters.GetPage1Data
            this.M_CM_TaxMasterDetail.TaxCd = data.tax_cd 
            // this.propList.initialWhere =" tax_cd = '" + data.tax_cd + "' "
            this.propList.initialWhere =" cm_tax_master_h_id = '" + data.row_id + "' "
        
            this.FormToABSList().doGetList('','eb_getList')
        },
		M_Cancel() {},
        rowClicked (record, index) {
            if (record.tax_class == 'VAT') {
                this.getAbsMasterPage().FormLevel3 = false
            }
        },
        rowLink (url) {
        },
        doDoubleClick: function (data, index) {},
        getDataBy (record) {
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                tax_cd: record.tax_cd,
                tax_type: record.tax_type				
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
                    this.M_CM_TaxMasterDetail = {
                    TaxCd: data.tax_cd,
                    TaxType: data.tax_type,
                    Descs: data.descs,
                    TaxRate: this.isCurrency(data.tax_rate),
                    TaxClass: data.tax_class,
                    VATReversalFlag: data.vat_reversal_flag,
                    VATAccountCd: data.vat_account_id,
                    VATAccountCdLabel: data.vat_account_cd,
                    VATPrefixCd: data.vat_prefix_id,
                    VATPrefixCdLabel: data.vat_prefix_cd,
                    VATReversalAccountCd: data.vat_reversal_account_id,
                    VATReversalAccountCdLabel: data.vat_reversal_account_cd,
                    VATReversalPrefixCd: data.vat_reversal_prefix_id,
                    VATReversalPrefixCdLabel: data.vat_reversal_prefix_cd,
                    PrepaidWithholdingAccountCd: data.prepaid_withholding_account_id,
                    PrepaidWithholdingAccountCdLabel: data.prepaid_withholding_account_cd,
                    PrepaidWithholdingPrefixCd: data.prepaid_withholding_prefix_id,
                    PrepaidWithholdingPrefixCdLabel: data.prepaid_withholding_prefix_cd,
                    ExpenseWithholdingAccountCd: data.expense_withholding_account_id,
                    ExpenseWithholdingAccountCdLabel: data.expense_withholding_account_cd,
                    ExpenseWithholdingPrefixCd: data.expense_withholding_prefix_id,
                    ExpenseWithholdingPrefixCdLabel: data.expense_withholding_prefix_cd,
                    AccruedWithholdingAccountCd: data.accrued_withholding_account_id,
                    AccruedWithholdingAccountCdLabel: data.accrued_withholding_account_cd,
                    AccruedWithholdingPrefixCd: data.accrued_withholding_prefix_id,
                    AccruedWithholdingPrefixCdLabel: data.accrued_withholding_prefix_cd,
                    UserInput: data.user_input,
                    UserEdit: data.user_edit,
                    TimeInput: data.time_input,
                    TimeEdit: data.time_edit,
                    LastUpdateStamp: record.lastupdatestamp,
                    AccruedWithholdingOthersAccountCd: data.accrued_withholding_others_account_id,
                    AccruedWithholdingOthersAccountCdLabel: data.accrued_withholding_others_account_cd,
                    AccruedWithholdingOthersPrefixCd: data.accrued_withholding_others_prefix_id,
                    AccruedWithholdingOthersPrefixCdLabel: data.accrued_withholding_others_prefix_cd,
                    ControlSequenceNo: data.control_sequence_no,
                    ExpenseWithholdingStraightLineAccountCd: data.expense_withholding_straight_line_account_id,
                    ExpenseWithholdingStraightLineAccountCdLabel: data.expense_withholding_straight_line_account_cd,
                    AccruedWithholdingStraightLineAccountCd: data.accrued_withholding_straight_line_account_id,
                    AccruedWithholdingStraightLineAccountCdLabel: data.accrued_withholding_straight_line_account_cd,
                    RowId: data.row_id,
                    cm_tax_master_h_id: data.cm_tax_master_h_id
                }
                this.IEBy.Input = data.user_input
                this.IEBy.Edit = data.user_edit

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

