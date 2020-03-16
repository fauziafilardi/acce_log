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
                                        <ABSInputSelectList @change="Oncurrency_cdChange" :prop="PI_currency_cd" :value="M_CM_Currency.currency_cd" :label="M_CM_Currency.currency_cdLabel" ref="ref_currency_cd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_descs" v-model="M_CM_Currency.descs"  ref="ref_descs" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_currency_sign" v-model="M_CM_Currency.currency_sign"  ref="ref_currency_sign" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnoperatorChange" :prop="PI_operator" v-model="M_CM_Currency.operator"  ref="ref_operator" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_rate" v-model="M_CM_Currency.rate"  ref="ref_rate"/>
                                      </b-col>
                                    </b-row>
                                    <div class="div-collapse">
                                        <span class="master-span-form">
                                            GL Revaluation Account Code
                                        </span>
                                    </div>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="Ongl_forex_gain_account_cdChange" :prop="PI_gl_forex_gain_account_cd" :value="M_CM_Currency.gl_forex_gain_account_cd" :label="M_CM_Currency.gl_forex_gain_account_cdLabel" ref="ref_gl_forex_gain_account_cd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="Ongl_forex_loss_account_cdChange" :prop="PI_gl_forex_loss_account_cd" :value="M_CM_Currency.gl_forex_loss_account_cd" :label="M_CM_Currency.gl_forex_loss_account_cdLabel" ref="ref_gl_forex_loss_account_cd"/>
                                      </b-col>
                                    </b-row>
                                    <div class="div-collapse">
                                        <span class="master-span-form">
                                            Sub Module Forex Account Code
                                        </span>
                                    </div>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="Onrealize_forex_gain_prefix_cdChange" :prop="PI_realize_forex_gain_prefix_cd" :value="M_CM_Currency.realize_forex_gain_prefix_cd" :label="M_CM_Currency.realize_forex_gain_prefix_cdLabel" ref="ref_realize_forex_gain_prefix_cd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="Onrealize_forex_gain_account_cdChange" :prop="PI_realize_forex_gain_account_cd" :value="M_CM_Currency.realize_forex_gain_account_cd" :label="M_CM_Currency.realize_forex_gain_account_cdLabel" ref="ref_realize_forex_gain_account_cd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="Onrealize_forex_loss_prefix_cdChange" :prop="PI_realize_forex_loss_prefix_cd" :value="M_CM_Currency.realize_forex_loss_prefix_cd" :label="M_CM_Currency.realize_forex_loss_prefix_cdLabel" ref="ref_realize_forex_loss_prefix_cd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="Onrealize_forex_loss_account_cdChange" :prop="PI_realize_forex_loss_account_cd" :value="M_CM_Currency.realize_forex_loss_account_cd" :label="M_CM_Currency.realize_forex_loss_account_cdLabel" ref="ref_realize_forex_loss_account_cd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="Onunrealize_forex_gain_prefix_cdChange" :prop="PI_unrealize_forex_gain_prefix_cd" :value="M_CM_Currency.unrealize_forex_gain_prefix_cd" :label="M_CM_Currency.unrealize_forex_gain_prefix_cdLabel" ref="ref_unrealize_forex_gain_prefix_cd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="Onunrealize_forex_gain_account_cdChange" :prop="PI_unrealize_forex_gain_account_cd" :value="M_CM_Currency.unrealize_forex_gain_account_cd" :label="M_CM_Currency.unrealize_forex_gain_account_cdLabel" ref="ref_unrealize_forex_gain_account_cd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="Onunrealize_forex_loss_prefix_cdChange" :prop="PI_unrealize_forex_loss_prefix_cd" :value="M_CM_Currency.unrealize_forex_loss_prefix_cd" :label="M_CM_Currency.unrealize_forex_loss_prefix_cdLabel" ref="ref_unrealize_forex_loss_prefix_cd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="Onunrealize_forex_loss_account_cdChange" :prop="PI_unrealize_forex_loss_account_cd" :value="M_CM_Currency.unrealize_forex_loss_account_cd" :label="M_CM_Currency.unrealize_forex_loss_account_cdLabel" ref="ref_unrealize_forex_loss_account_cd"/>
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
    props: {PageLevel: '', TabIndex: '', data: ''},
    data() {
        return {
		cInsertKey:'id=currency_cd, label=currency_cd+|+descs',
		FormType: "List",
		Module:"CM",
            propList: {
                initialWhere: "subportfolio_cd='" + this.getDataUser().subportfolio_cd+ "'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_CM_Currency :{
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                currency_cd: '',
                descs: '',
                currency_sign: '',
                unit_name: '',
                sub_unit_name: '',
                operator: '*',
                rate: '0',
                realize_forex_gain_account_cd: '',
                realize_forex_loss_account_cd: '',
                unrealize_forex_gain_account_cd: '',
                unrealize_forex_loss_account_cd: '',
                realize_forex_gain_prefix_cd: '',
                realize_forex_loss_prefix_cd: '',
                unrealize_forex_gain_prefix_cd: '',
                unrealize_forex_loss_prefix_cd: '',
                gl_forex_gain_account_cd: '',
                gl_forex_loss_account_cd: '',
                user_input: '',
                user_edit: this.getDataUser().user_id,
                time_input: '',
                time_edit: '',
                lastupdatestamp: 0,                
            }
            ,
            PI_currency_cd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMCurrency'    , 
                    ColumnDB: 'currency_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
                cName: 'currency_cd', 
                cLabel: 'Currency Code', 
                cKey: true, 
                cLabelSize: 4, 
                cOrder: 1, 
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
                cMasterUrl: 'CM/CM_CurrencyMaster' ,
                cDisplayColumn: 'currency_cd,descs' ,
            }, 
            PI_descs: { 
                cLabel: 'Description', 
                cLabelSize: 4, 
                cValue: '', 
                cProtect: true,
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_currency_sign: { 
                cLabel: 'Currency Sign', 
                cLabelSize: 4, 
                cValue: '', 
                cProtect: true,
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_operator: { 
                cValidate :'', 
                cName: 'operator', 
                cId: 'rdboperator', 
                cRadioOptions: [{ text: 'Multiply (*)', value: '*' }, { text: 'Divide (/)', value: '/' }], 
                cRadioDefaultOption: '*', 
                cLabel:'operator', 
                cLabelSize: 4, 
                cOrder: 2, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_rate: { 
                cValidate :'required|max:13', 
                cName: 'rate', 
                cLabel: 'rate', 
                cLabelSize: 4, 
                cOrder: 3, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_gl_forex_gain_account_cd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCodeBySubportfolio'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "STATUS = 'A' AND subportfolio_cd = '"+this.getDataUser().subportfolio_cd+"'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'gl_forex_gain_account_cd', 
                cLabel: 'Forex Gain A/c Code', 
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
                cMasterUrl: 'CM/CM_ChartOfAccount' ,
                cDisplayColumn: 'account_cd,description_1' ,
            }, 
            PI_gl_forex_loss_account_cd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCodeBySubportfolio'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "STATUS = 'A' AND subportfolio_cd = '"+this.getDataUser().subportfolio_cd+"'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'gl_forex_loss_account_cd', 
                cLabel: 'Forex Loss A/c Code', 
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
                cDisplayColumn: 'account_cd,description_1' ,
            }, 
            PI_realize_forex_gain_prefix_cd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountPrefix'    , 
                    ColumnDB: 'PrefixCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'realize_forex_gain_prefix_cd', 
                cLabel: 'Realize Forex Gain A/c Prefix', 
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
                cDisplayColumn: 'prefix_cd,chart_of_account_prefix' ,
            }, 
            PI_realize_forex_gain_account_cd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCodeBySubportfolio'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "STATUS = 'A' AND subportfolio_cd = '"+this.getDataUser().subportfolio_cd+"'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'realize_forex_gain_account_cd', 
                cLabel: 'Realize Forex Gain A/c Code', 
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
                cDisplayColumn: 'account_cd,description_1' ,
            }, 
            PI_realize_forex_loss_prefix_cd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountPrefix'    , 
                    ColumnDB: 'PrefixCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'realize_forex_loss_prefix_cd', 
                cLabel: 'Realize Forex Loss A/c Prefix', 
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
                cMasterUrl: 'CM/CM_SubModuleAccountPrefix' ,
                cDisplayColumn: 'prefix_cd,chart_of_account_prefix' ,
            }, 
            PI_realize_forex_loss_account_cd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCodeBySubportfolio'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "STATUS = 'A' AND subportfolio_cd = '"+this.getDataUser().subportfolio_cd+"'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'realize_forex_loss_account_cd', 
                cLabel: 'Realize Forex Loss A/c Code', 
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
                cMasterUrl: 'CM/CM_ChartOfAccount' ,
                cDisplayColumn: 'account_cd,description_1' ,
            }, 
            PI_unrealize_forex_gain_prefix_cd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountPrefix'    , 
                    ColumnDB: 'PrefixCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'unrealize_forex_gain_prefix_cd', 
                cLabel: 'unrealize Forex Gain A/c Prefix', 
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
                cMasterUrl: 'CM/CM_SubModuleAccountPrefix' ,
                cDisplayColumn: 'prefix_cd,chart_of_account_prefix' ,
            }, 
            PI_unrealize_forex_gain_account_cd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCodeBySubportfolio'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "STATUS = 'A' AND subportfolio_cd = '"+this.getDataUser().subportfolio_cd+"'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'unrealize_forex_gain_account_cd', 
                cLabel: 'unrealize Forex Gain A/c Code', 
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
                cMasterUrl: 'CM/CM_ChartOfAccount' ,
                cDisplayColumn: 'account_cd,description_1' ,
            }, 
            PI_unrealize_forex_loss_prefix_cd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountPrefix'    , 
                    ColumnDB: 'PrefixCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'unrealize_forex_loss_prefix_cd', 
                cLabel: 'unrealize Forex Loss A/c Prefix', 
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
                cMasterUrl: 'CM/CM_SubModuleAccountPrefix' ,
                cDisplayColumn: 'prefix_cd,chart_of_account_prefix' ,
            }, 
            PI_unrealize_forex_loss_account_cd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCodeBySubportfolio'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "STATUS = 'A' AND subportfolio_cd = '"+this.getDataUser().subportfolio_cd+"'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'unrealize_forex_loss_account_cd', 
                cLabel: 'unrealize Forex Loss A/c Code', 
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
                cMasterUrl: 'CM/CM_ChartOfAccount' ,
                cDisplayColumn: 'account_cd,description_1' ,
            }
            // , 

			// PTAnalysis: {
            //     cPageLevel: this.PageLevel,
            //     cTabIndex: this.TabIndex,
            //     cPageMasterSeq: this.data.PageMasterSeq,
            //     cFormPageNo: this.data.PageOrder
            // }
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
        Oncurrency_cdChange (data) {
        if (this.M_CM_Currency.currency_cd == data.id) return
        this.$nextTick(() => {
            this.M_CM_Currency.currency_cd = data.id
            this.M_CM_Currency.currency_cdLabel = data.label
            if (this.inputStatus != "VIEW") {
        this.M_CM_Currency.descs = data.descs
        this.M_CM_Currency.currency_sign = data.currency_sign

            }
        })
        this.$forceUpdate()
        },
        OnoperatorChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{operator}
            }
        })
        this.$forceUpdate()
        },
        Ongl_forex_gain_account_cdChange (data) {
            console.log(data)
        if (this.M_CM_Currency.gl_forex_gain_account_cd == data.id) return
        this.$nextTick(() => {
            this.M_CM_Currency.gl_forex_gain_account_cd = data.id
            this.M_CM_Currency.gl_forex_gain_account_cdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{gl_forex_gain_account_cd}
            }
        })
        this.$forceUpdate()
        },
        Ongl_forex_loss_account_cdChange (data) {
        if (this.M_CM_Currency.gl_forex_loss_account_cd == data.id) return
        this.$nextTick(() => {
            this.M_CM_Currency.gl_forex_loss_account_cd = data.id
            this.M_CM_Currency.gl_forex_loss_account_cdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{gl_forex_loss_account_cd}
            }
        })
        this.$forceUpdate()
        },
        Onrealize_forex_gain_prefix_cdChange (data) {
        if (this.M_CM_Currency.realize_forex_gain_prefix_cd == data.id) return
        this.$nextTick(() => {
            this.M_CM_Currency.realize_forex_gain_prefix_cd = data.id
            this.M_CM_Currency.realize_forex_gain_prefix_cdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{realize_forex_gain_prefix_cd}
            }
        })
        this.$forceUpdate()
        },
        Onrealize_forex_gain_account_cdChange (data) {
        if (this.M_CM_Currency.realize_forex_gain_account_cd == data.id) return
        this.$nextTick(() => {
            this.M_CM_Currency.realize_forex_gain_account_cd = data.id
            this.M_CM_Currency.realize_forex_gain_account_cdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{realize_forex_gain_account_cd}
            }
        })
        this.$forceUpdate()
        },
        Onrealize_forex_loss_prefix_cdChange (data) {
        if (this.M_CM_Currency.realize_forex_loss_prefix_cd == data.id) return
        this.$nextTick(() => {
            this.M_CM_Currency.realize_forex_loss_prefix_cd = data.id
            this.M_CM_Currency.realize_forex_loss_prefix_cdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{realize_forex_loss_prefix_cd}
            }
        })
        this.$forceUpdate()
        },
        Onrealize_forex_loss_account_cdChange (data) {
        if (this.M_CM_Currency.realize_forex_loss_account_cd == data.id) return
        this.$nextTick(() => {
            this.M_CM_Currency.realize_forex_loss_account_cd = data.id
            this.M_CM_Currency.realize_forex_loss_account_cdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{realize_forex_loss_account_cd}
            }
        })
        this.$forceUpdate()
        },
        Onunrealize_forex_gain_prefix_cdChange (data) {
        if (this.M_CM_Currency.unrealize_forex_gain_prefix_cd == data.id) return
        this.$nextTick(() => {
            this.M_CM_Currency.unrealize_forex_gain_prefix_cd = data.id
            this.M_CM_Currency.unrealize_forex_gain_prefix_cdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{unrealize_forex_gain_prefix_cd}
            }
        })
        this.$forceUpdate()
        },
        Onunrealize_forex_gain_account_cdChange (data) {
        if (this.M_CM_Currency.unrealize_forex_gain_account_cd == data.id) return
        this.$nextTick(() => {
            this.M_CM_Currency.unrealize_forex_gain_account_cd = data.id
            this.M_CM_Currency.unrealize_forex_gain_account_cdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{unrealize_forex_gain_account_cd}
            }
        })
        this.$forceUpdate()
        },
        Onunrealize_forex_loss_prefix_cdChange (data) {
        if (this.M_CM_Currency.unrealize_forex_loss_prefix_cd == data.id) return
        this.$nextTick(() => {
            this.M_CM_Currency.unrealize_forex_loss_prefix_cd = data.id
            this.M_CM_Currency.unrealize_forex_loss_prefix_cdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{unrealize_forex_loss_prefix_cd}
            }
        })
        this.$forceUpdate()
        },
        Onunrealize_forex_loss_account_cdChange (data) {
        if (this.M_CM_Currency.unrealize_forex_loss_account_cd == data.id) return
        this.$nextTick(() => {
            this.M_CM_Currency.unrealize_forex_loss_account_cd = data.id
            this.M_CM_Currency.unrealize_forex_loss_account_cdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{unrealize_forex_loss_account_cd}
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
        M_Post(){
        },
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                currency_id: this.M_CM_Currency.currency_cd == '' || this.M_CM_Currency.currency_cd == null ? 'NULL' : this.M_CM_Currency.currency_cd ,
                operator: this.M_CM_Currency.operator,
                rate: this.M_CM_Currency.rate ? this.replaceAllString(this.M_CM_Currency.rate,',','','number') : 0 ,
                realize_forex_gain_account_id: this.M_CM_Currency.realize_forex_gain_account_cd == '' || this.M_CM_Currency.realize_forex_gain_account_cd == null ? 'NULL' : this.M_CM_Currency.realize_forex_gain_account_cd ,
                realize_forex_loss_account_id: this.M_CM_Currency.realize_forex_loss_account_cd == '' || this.M_CM_Currency.realize_forex_loss_account_cd == null ? 'NULL' : this.M_CM_Currency.realize_forex_loss_account_cd ,
                unrealize_forex_gain_account_id: this.M_CM_Currency.unrealize_forex_gain_account_cd == '' || this.M_CM_Currency.unrealize_forex_gain_account_cd == null ? 'NULL' : this.M_CM_Currency.unrealize_forex_gain_account_cd ,
                unrealize_forex_loss_account_id: this.M_CM_Currency.unrealize_forex_loss_account_cd == '' || this.M_CM_Currency.unrealize_forex_loss_account_cd == null ? 'NULL' : this.M_CM_Currency.unrealize_forex_loss_account_cd ,
                realize_forex_gain_prefix_id: this.M_CM_Currency.realize_forex_gain_prefix_cd == '' || this.M_CM_Currency.realize_forex_gain_prefix_cd == null ? 'NULL' : this.M_CM_Currency.realize_forex_gain_prefix_cd ,
                realize_forex_loss_prefix_id: this.M_CM_Currency.realize_forex_loss_prefix_cd == '' || this.M_CM_Currency.realize_forex_loss_prefix_cd == null ? 'NULL' : this.M_CM_Currency.realize_forex_loss_prefix_cd ,
                unrealize_forex_gain_prefix_id: this.M_CM_Currency.unrealize_forex_gain_prefix_cd == '' || this.M_CM_Currency.unrealize_forex_gain_prefix_cd == null ? 'NULL' : this.M_CM_Currency.unrealize_forex_gain_prefix_cd ,
                unrealize_forex_loss_prefix_id: this.M_CM_Currency.unrealize_forex_loss_prefix_cd == '' || this.M_CM_Currency.unrealize_forex_loss_prefix_cd == null ? 'NULL' : this.M_CM_Currency.unrealize_forex_loss_prefix_cd ,
                gl_forex_gain_account_id: this.M_CM_Currency.gl_forex_gain_account_cd == '' || this.M_CM_Currency.gl_forex_gain_account_cd == null ? 'NULL' : this.M_CM_Currency.gl_forex_gain_account_cd ,
                gl_forex_loss_account_id: this.M_CM_Currency.gl_forex_loss_account_cd == '' || this.M_CM_Currency.gl_forex_loss_account_cd == null ? 'NULL' : this.M_CM_Currency.gl_forex_loss_account_cd ,
                user_input: this.getDataUser().user_id                 
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
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                currency_id: this.M_CM_Currency.currency_cd == '' || this.M_CM_Currency.currency_cd == null ? 'NULL' : this.M_CM_Currency.currency_cd ,
                operator: this.M_CM_Currency.operator,
                rate: this.M_CM_Currency.rate ? this.replaceAllString(this.M_CM_Currency.rate,',','','number') : 0 ,
                realize_forex_gain_account_id: this.M_CM_Currency.realize_forex_gain_account_cd == '' || this.M_CM_Currency.realize_forex_gain_account_cd == null ? 'NULL' : this.M_CM_Currency.realize_forex_gain_account_cd ,
                realize_forex_loss_account_id: this.M_CM_Currency.realize_forex_loss_account_cd == '' || this.M_CM_Currency.realize_forex_loss_account_cd == null ? 'NULL' : this.M_CM_Currency.realize_forex_loss_account_cd ,
                unrealize_forex_gain_account_id: this.M_CM_Currency.unrealize_forex_gain_account_cd == '' || this.M_CM_Currency.unrealize_forex_gain_account_cd == null ? 'NULL' : this.M_CM_Currency.unrealize_forex_gain_account_cd ,
                unrealize_forex_loss_account_id: this.M_CM_Currency.unrealize_forex_loss_account_cd == '' || this.M_CM_Currency.unrealize_forex_loss_account_cd == null ? 'NULL' : this.M_CM_Currency.unrealize_forex_loss_account_cd ,
                realize_forex_gain_prefix_id: this.M_CM_Currency.realize_forex_gain_prefix_cd == '' || this.M_CM_Currency.realize_forex_gain_prefix_cd == null ? 'NULL' : this.M_CM_Currency.realize_forex_gain_prefix_cd ,
                realize_forex_loss_prefix_id: this.M_CM_Currency.realize_forex_loss_prefix_cd == '' || this.M_CM_Currency.realize_forex_loss_prefix_cd == null ? 'NULL' : this.M_CM_Currency.realize_forex_loss_prefix_cd ,
                unrealize_forex_gain_prefix_id: this.M_CM_Currency.unrealize_forex_gain_prefix_cd == '' || this.M_CM_Currency.unrealize_forex_gain_prefix_cd == null ? 'NULL' : this.M_CM_Currency.unrealize_forex_gain_prefix_cd ,
                unrealize_forex_loss_prefix_id: this.M_CM_Currency.unrealize_forex_loss_prefix_cd == '' || this.M_CM_Currency.unrealize_forex_loss_prefix_cd == null ? 'NULL' : this.M_CM_Currency.unrealize_forex_loss_prefix_cd ,
                gl_forex_gain_account_id: this.M_CM_Currency.gl_forex_gain_account_cd == '' || this.M_CM_Currency.gl_forex_gain_account_cd == null ? 'NULL' : this.M_CM_Currency.gl_forex_gain_account_cd ,
                gl_forex_loss_account_id: this.M_CM_Currency.gl_forex_loss_account_cd == '' || this.M_CM_Currency.gl_forex_loss_account_cd == null ? 'NULL' : this.M_CM_Currency.gl_forex_loss_account_cd ,
                user_edit: this.getDataUser().user_id ,
                lastupdatestamp: this.M_CM_Currency.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })

        },
		M_ClearForm(){
            this.M_CM_Currency = {
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                currency_cd: '',
                descs: '',
                currency_sign: '',
                unit_name: '',
                sub_unit_name: '',
                operator: '*',
                rate: '0',
                realize_forex_gain_account_cd: '',
                realize_forex_loss_account_cd: '',
                unrealize_forex_gain_account_cd: '',
                unrealize_forex_loss_account_cd: '',
                realize_forex_gain_prefix_cd: '',
                realize_forex_loss_prefix_cd: '',
                unrealize_forex_gain_prefix_cd: '',
                unrealize_forex_loss_prefix_cd: '',
                gl_forex_gain_account_cd: '',
                gl_forex_loss_account_cd: '',
                user_input: '',
                user_edit: this.getDataUser().user_id,
                time_input: '',
                time_edit: '',
                lastupdatestamp: 0,
                
                    }
            		
		},
        M_New(){
            this.$refs.ref_currency_cd.focus()
			
        },
        M_Edit(){
            this.$refs.ref_operator.focus()
        },
        M_Delete(dt){       

            var data = this.FormToABSList().getRowSelected()  
            var dataDelete = []

            
            data.forEach((value) => {
            dataDelete.push({
            subportfolio_cd: this.getDataUser().subportfolio_cd,
            currency_cd: value.currency_cd,
            lastupdatestamp: value.lastupdatestamp,
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
,                subportfolio_cd: record.subportfolio_cd,
                currency_id: record.currency_id
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
this.M_CM_Currency = {
                subportfolio_cd: data.subportfolio_cd,
                currency_cd: data.currency_id,
                descs: data.descs,
                currency_sign: data.currency_sign,
                unit_name: data.unit_name,
                sub_unit_name: data.sub_unit_name,
                operator: data.operator,
                rate: this.isCurrency(data.rate, data.decimal),
                realize_forex_gain_account_cd: data.realize_forex_gain_account_id,
                realize_forex_loss_account_cd: data.realize_forex_loss_account_id,
                unrealize_forex_gain_account_cd: data.unrealize_forex_gain_account_id,
                unrealize_forex_loss_account_cd: data.unrealize_forex_loss_account_id,
                realize_forex_gain_prefix_cd: data.realize_forex_gain_prefix_id,
                realize_forex_loss_prefix_cd: data.realize_forex_loss_prefix_id,
                unrealize_forex_gain_prefix_cd: data.unrealize_forex_gain_prefix_id,
                unrealize_forex_loss_prefix_cd: data.unrealize_forex_loss_prefix_id,
                gl_forex_gain_account_cd: data.gl_forex_gain_account_id,
                gl_forex_loss_account_cd: data.gl_forex_loss_account_id,
                user_input: data.user_input,
                user_edit: data.user_edit,
                time_input: data.time_input,
                time_edit: data.time_edit,
                lastupdatestamp: record.lastupdatestamp,
              
                    }
                 

                this.M_CM_Currency.currency_cdLabel = this.M_CM_Currency.currency_cd != null ? data.currency_cd   :'' 
                this.M_CM_Currency.gl_forex_gain_account_cdLabel = this.M_CM_Currency.gl_forex_gain_account_cd != null ? data.gl_forex_gain_account_cd  :'' 
                this.M_CM_Currency.gl_forex_loss_account_cdLabel = this.M_CM_Currency.gl_forex_loss_account_cd != null ? data.gl_forex_loss_account_cd  :'' 
                this.M_CM_Currency.realize_forex_gain_prefix_cdLabel = this.M_CM_Currency.realize_forex_gain_prefix_cd != null ? data.realize_forex_gain_prefix_cd  :'' 
                this.M_CM_Currency.realize_forex_gain_account_cdLabel = this.M_CM_Currency.realize_forex_gain_account_cd != null ? data.realize_forex_gain_account_cd  :'' 
                this.M_CM_Currency.realize_forex_loss_prefix_cdLabel = this.M_CM_Currency.realize_forex_loss_prefix_cd != null ? data.realize_forex_loss_prefix_cd  :'' 
                this.M_CM_Currency.realize_forex_loss_account_cdLabel = this.M_CM_Currency.realize_forex_loss_account_cd != null ? data.realize_forex_loss_account_cd  :'' 
                this.M_CM_Currency.unrealize_forex_gain_prefix_cdLabel = this.M_CM_Currency.unrealize_forex_gain_prefix_cd != null ? data.unrealize_forex_gain_prefix_cd  :'' 
                this.M_CM_Currency.unrealize_forex_gain_account_cdLabel = this.M_CM_Currency.unrealize_forex_gain_account_cd != null ? data.unrealize_forex_gain_account_cd  :'' 
                this.M_CM_Currency.unrealize_forex_loss_prefix_cdLabel = this.M_CM_Currency.unrealize_forex_loss_prefix_cd != null ? data.unrealize_forex_loss_prefix_cd  :'' 
                this.M_CM_Currency.unrealize_forex_loss_account_cdLabel = this.M_CM_Currency.unrealize_forex_loss_account_cd != null ? data.unrealize_forex_loss_account_cd  :'' 
         

                this.IEBy.Input = data.user_input
                this.IEBy.Edit = data.user_edit

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

