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
                                        <ABSinputTextVuex :prop="PI_currencycd" v-model="M_CM_CurrencyMaster_AccountSetup.currencycd"  ref="ref_currencycd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_descs" v-model="M_CM_CurrencyMaster_AccountSetup.descs"  ref="ref_descs"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_currencysign" v-model="M_CM_CurrencyMaster_AccountSetup.currencysign"  ref="ref_currencysign"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnoperatorChange" :prop="PI_operator" v-model="M_CM_CurrencyMaster_AccountSetup.operator"  ref="ref_operator" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_rate" v-model="M_CM_CurrencyMaster_AccountSetup.rate"  ref="ref_rate"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_unitname" v-model="M_CM_CurrencyMaster_AccountSetup.unitname"  ref="ref_unitname"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_subunitname" v-model="M_CM_CurrencyMaster_AccountSetup.subunitname"  ref="ref_subunitname"/>
                                      </b-col>
                                    </b-row>
                                <!-- </b-col>
                                <b-col md="12" id="col-left"></b-col> -->
                                <div class="div-collapse" style="padding-left:10px">
                                    <b>GL Revaluation Account Code </b>
                                </div>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnglforexgainaccountcdChange" :prop="PI_glforexgainaccountcd" :value="M_CM_CurrencyMaster_AccountSetup.glforexgainaccountcd" :label="M_CM_CurrencyMaster_AccountSetup.glforexgainaccountcdLabel" ref="ref_glforexgainaccountcd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnglforexlossaccountcdChange" :prop="PI_glforexlossaccountcd" :value="M_CM_CurrencyMaster_AccountSetup.glforexlossaccountcd" :label="M_CM_CurrencyMaster_AccountSetup.glforexlossaccountcdLabel" ref="ref_glforexlossaccountcd"/>
                                      </b-col>
                                    </b-row>
                                    <div class="div-collapse" style="padding-left:10px">
                                        <b>Sub Module Forex Account Code</b>
                                    </div>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnrealizeforexgainprefixcdChange" :prop="PI_realizeforexgainprefixcd" :value="M_CM_CurrencyMaster_AccountSetup.realizeforexgainprefixcd" :label="M_CM_CurrencyMaster_AccountSetup.realizeforexgainprefixcdLabel" ref="ref_realizeforexgainprefixcd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnrealizeforexgainaccountcdChange" :prop="PI_realizeforexgainaccountcd" :value="M_CM_CurrencyMaster_AccountSetup.realizeforexgainaccountcd" :label="M_CM_CurrencyMaster_AccountSetup.realizeforexgainaccountcdLabel" ref="ref_realizeforexgainaccountcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnrealizeforexlossprefixcdChange" :prop="PI_realizeforexlossprefixcd" :value="M_CM_CurrencyMaster_AccountSetup.realizeforexlossprefixcd" :label="M_CM_CurrencyMaster_AccountSetup.realizeforexlossprefixcdLabel" ref="ref_realizeforexlossprefixcd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnrealizeforexlossaccountcdChange" :prop="PI_realizeforexlossaccountcd" :value="M_CM_CurrencyMaster_AccountSetup.realizeforexlossaccountcd" :label="M_CM_CurrencyMaster_AccountSetup.realizeforexlossaccountcdLabel" ref="ref_realizeforexlossaccountcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnunrealizeforexgainprefixcdChange" :prop="PI_unrealizeforexgainprefixcd" :value="M_CM_CurrencyMaster_AccountSetup.unrealizeforexgainprefixcd" :label="M_CM_CurrencyMaster_AccountSetup.unrealizeforexgainprefixcdLabel" ref="ref_unrealizeforexgainprefixcd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnunrealizeforexgainaccountcdChange" :prop="PI_unrealizeforexgainaccountcd" :value="M_CM_CurrencyMaster_AccountSetup.unrealizeforexgainaccountcd" :label="M_CM_CurrencyMaster_AccountSetup.unrealizeforexgainaccountcdLabel" ref="ref_unrealizeforexgainaccountcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnunrealizeforexlossprefixcdChange" :prop="PI_unrealizeforexlossprefixcd" :value="M_CM_CurrencyMaster_AccountSetup.unrealizeforexlossprefixcd" :label="M_CM_CurrencyMaster_AccountSetup.unrealizeforexlossprefixcdLabel" ref="ref_unrealizeforexlossprefixcd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnunrealizeforexlossaccountcdChange" :prop="PI_unrealizeforexlossaccountcd" :value="M_CM_CurrencyMaster_AccountSetup.unrealizeforexlossaccountcd" :label="M_CM_CurrencyMaster_AccountSetup.unrealizeforexlossaccountcdLabel" ref="ref_unrealizeforexlossaccountcd"/>
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
		cInsertKey:'',
		FormType: "List",
		Module:"CM",
            propList: {
                initialWhere: "",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_CM_CurrencyMaster_AccountSetup :{
                currencycd: '',
                descs: '',
                currencysign: '',
                operator: '*',
                rate: '0',
                unitname: '',
                subunitname: '',
                realizeforexgainaccountcd: '',
                realizeforexlossaccountcd: '',
                unrealizeforexgainaccountcd: '',
                unrealizeforexlossaccountcd: '',
                realizeforexgainprefixcd: '',
                realizeforexlossprefixcd: '',
                unrealizeforexgainprefixcd: '',
                unrealizeforexlossprefixcd: '',
                glforexgainaccountcd: '',
                glforexlossaccountcd: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeedit: '',
                lastupdatestamp: 0,
                rowid: 0
                    }
            ,
            PI_currencycd: { 
                cValidate :'required|max:4', 
                cName: 'currencycd', 
                cLabel: 'Currency Code', 
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
            PI_currencysign: { 
                cValidate :'', 
                cName: 'currencysign', 
                cLabel: 'Currency Sign', 
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
            PI_operator: { 
                cValidate :'', 
                cName: 'operator', 
                cId: 'rdboperator', 
                cRadioOptions: [{ text: 'Multiply (*)', value: '*' }, { text: 'Divide (/)', value: '/' }], 
                cRadioDefaultOption: '*', 
                cLabel:'	Operator', 
                cLabelSize: 4, 
                cOrder: 4, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
                cKey: true 
            }, 
            PI_rate: { 
                cValidate :'required|max:25', 
                cName: 'rate', 
                cLabel: 'Rate', 
                cLabelSize: 4, 
                cOrder: 5, 
                cKey: true, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_unitname: { 
                cValidate :'', 
                cName: 'unitname', 
                cLabel: 'Unit Name', 
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
            PI_subunitname: { 
                cValidate :'', 
                cName: 'subunitname', 
                cLabel: 'Sub Unit Name', 
                cLabelSize: 4, 
                cOrder: 7, 
                cKey: true, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_glforexgainaccountcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCode'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "status = 'A'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'glforexgainaccountcd', 
                cLabel: 'Forex Gain Account Code', 
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
                cMasterUrl: 'CM/CM_ChartOfAccount' ,
                cDisplayColumn: 'account_cd,description_1' ,
            }, 
            PI_glforexlossaccountcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCode'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "status = 'A'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'glforexlossaccountcd', 
                cLabel: 'Forex Loss Account Code', 
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
            PI_realizeforexgainprefixcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountPrefix'    , 
                    ColumnDB: 'PrefixCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'realizeforexgainprefixcd', 
                cLabel: 'Realize Forex Gain Account Prefix', 
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
            PI_realizeforexgainaccountcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCode'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "status = 'A'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'realizeforexgainaccountcd', 
                cLabel: 'Realize Forex Gain Account Code', 
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
            PI_realizeforexlossprefixcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountPrefix'    , 
                    ColumnDB: 'PrefixCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'realizeforexlossprefixcd', 
                cLabel: 'Realize Forex Loss Account Prefix', 
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
            PI_realizeforexlossaccountcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCode'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "status = 'A'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'realizeforexlossaccountcd', 
                cLabel: 'Realize Forex Loss Account Code', 
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
            }, 
            PI_unrealizeforexgainprefixcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountPrefix'    , 
                    ColumnDB: 'PrefixCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'unrealizeforexgainprefixcd', 
                cLabel: 'UnRealize Forex Gain Account Prefix', 
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
                cMasterUrl: 'CM/CM_SubModuleAccountPrefix' ,
                cDisplayColumn: 'prefix_cd,chart_of_account_prefix' ,
            }, 
            PI_unrealizeforexgainaccountcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCode'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "status = 'A'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'unrealizeforexgainaccountcd', 
                cLabel: 'UnRealize Forex Gain Account Code', 
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
                cMasterUrl: 'CM/CM_ChartOfAccount' ,
                cDisplayColumn: 'account_cd,description_1' ,
            }, 
            PI_unrealizeforexlossprefixcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountPrefix'    , 
                    ColumnDB: 'PrefixCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'unrealizeforexlossprefixcd', 
                cLabel: 'UnRealize Forex Loss Account Prefix', 
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
                cMasterUrl: 'CM/CM_SubModuleAccountPrefix' ,
                cDisplayColumn: 'prefix_cd,chart_of_account_prefix' ,
            }, 
            PI_unrealizeforexlossaccountcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCode'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "status = 'A'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'unrealizeforexlossaccountcd', 
                cLabel: 'UnRealize Forex Loss Account Code', 
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
                cDisplayColumn: 'account_cd,description_1' ,
            }, 

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
        OnoperatorChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{operator}
            }
        })
        this.$forceUpdate()
        },
        OnglforexgainaccountcdChange (data) {
        if (this.M_CM_CurrencyMaster_AccountSetup.glforexgainaccountcd == data.gl_chart_of_account_id) return
        this.$nextTick(() => {
            this.M_CM_CurrencyMaster_AccountSetup.glforexgainaccountcd = data.gl_chart_of_account_id
            this.M_CM_CurrencyMaster_AccountSetup.glforexgainaccountcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{glforexgainaccountcd}
            }
        })
        this.$forceUpdate()
        },
        OnglforexlossaccountcdChange (data) {
        if (this.M_CM_CurrencyMaster_AccountSetup.glforexlossaccountcd == data.gl_chart_of_account_id) return
        this.$nextTick(() => {
            this.M_CM_CurrencyMaster_AccountSetup.glforexlossaccountcd = data.gl_chart_of_account_id
            this.M_CM_CurrencyMaster_AccountSetup.glforexlossaccountcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{glforexlossaccountcd}
            }
        })
        this.$forceUpdate()
        },
        OnrealizeforexgainprefixcdChange (data) {
        if (this.M_CM_CurrencyMaster_AccountSetup.realizeforexgainprefixcd == data.gl_chart_of_account_prefix_id) return
        this.$nextTick(() => {
            this.M_CM_CurrencyMaster_AccountSetup.realizeforexgainprefixcd = data.gl_chart_of_account_prefix_id
            this.M_CM_CurrencyMaster_AccountSetup.realizeforexgainprefixcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{realizeforexgainprefixcd}
            }
        })
        this.$forceUpdate()
        },
        OnrealizeforexgainaccountcdChange (data) {
        if (this.M_CM_CurrencyMaster_AccountSetup.realizeforexgainaccountcd == data.gl_chart_of_account_id) return
        this.$nextTick(() => {
            this.M_CM_CurrencyMaster_AccountSetup.realizeforexgainaccountcd = data.gl_chart_of_account_id
            this.M_CM_CurrencyMaster_AccountSetup.realizeforexgainaccountcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{realizeforexgainaccountcd}
            }
        })
        this.$forceUpdate()
        },
        OnrealizeforexlossprefixcdChange (data) {
        if (this.M_CM_CurrencyMaster_AccountSetup.realizeforexlossprefixcd == data.gl_chart_of_account_prefix_id) return
        this.$nextTick(() => {
            this.M_CM_CurrencyMaster_AccountSetup.realizeforexlossprefixcd = data.gl_chart_of_account_prefix_id
            this.M_CM_CurrencyMaster_AccountSetup.realizeforexlossprefixcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{realizeforexlossprefixcd}
            }
        })
        this.$forceUpdate()
        },
        OnrealizeforexlossaccountcdChange (data) {
        if (this.M_CM_CurrencyMaster_AccountSetup.realizeforexlossaccountcd == data.gl_chart_of_account_id) return
        this.$nextTick(() => {
            this.M_CM_CurrencyMaster_AccountSetup.realizeforexlossaccountcd = data.gl_chart_of_account_id
            this.M_CM_CurrencyMaster_AccountSetup.realizeforexlossaccountcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{realizeforexlossaccountcd}
            }
        })
        this.$forceUpdate()
        },
        OnunrealizeforexgainprefixcdChange (data) {
        if (this.M_CM_CurrencyMaster_AccountSetup.unrealizeforexgainprefixcd == data.gl_chart_of_account_prefix_id) return
        this.$nextTick(() => {
            this.M_CM_CurrencyMaster_AccountSetup.unrealizeforexgainprefixcd = data.gl_chart_of_account_prefix_id
            this.M_CM_CurrencyMaster_AccountSetup.unrealizeforexgainprefixcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{unrealizeforexgainprefixcd}
            }
        })
        this.$forceUpdate()
        },
        OnunrealizeforexgainaccountcdChange (data) {
        if (this.M_CM_CurrencyMaster_AccountSetup.unrealizeforexgainaccountcd == data.gl_chart_of_account_id) return
        this.$nextTick(() => {
            this.M_CM_CurrencyMaster_AccountSetup.unrealizeforexgainaccountcd = data.gl_chart_of_account_id
            this.M_CM_CurrencyMaster_AccountSetup.unrealizeforexgainaccountcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{unrealizeforexgainaccountcd}
            }
        })
        this.$forceUpdate()
        },
        OnunrealizeforexlossprefixcdChange (data) {
            console.log(data)
        if (this.M_CM_CurrencyMaster_AccountSetup.unrealizeforexlossprefixcd == data.gl_chart_of_account_prefix_id) return
        this.$nextTick(() => {
            this.M_CM_CurrencyMaster_AccountSetup.unrealizeforexlossprefixcd = data.gl_chart_of_account_prefix_id
            this.M_CM_CurrencyMaster_AccountSetup.unrealizeforexlossprefixcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{unrealizeforexlossprefixcd}
            }
        })
        this.$forceUpdate()
        },
        OnunrealizeforexlossaccountcdChange (data) {
        if (this.M_CM_CurrencyMaster_AccountSetup.unrealizeforexlossaccountcd == data.gl_chart_of_account_id) return
        this.$nextTick(() => {
            this.M_CM_CurrencyMaster_AccountSetup.unrealizeforexlossaccountcd = data.gl_chart_of_account_id
            this.M_CM_CurrencyMaster_AccountSetup.unrealizeforexlossaccountcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{unrealizeforexlossaccountcd}
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
        M_Post(){
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
                currency_cd: this.M_CM_CurrencyMaster_AccountSetup.currencycd,
                realize_forex_gain_account_id: this.M_CM_CurrencyMaster_AccountSetup.realizeforexgainaccountcd == '' || this.M_CM_CurrencyMaster_AccountSetup.realizeforexgainaccountcd == null ? 'NULL' : this.M_CM_CurrencyMaster_AccountSetup.realizeforexgainaccountcd ,
                realize_forex_loss_account_id: this.M_CM_CurrencyMaster_AccountSetup.realizeforexlossaccountcd == '' || this.M_CM_CurrencyMaster_AccountSetup.realizeforexlossaccountcd == null ? 'NULL' : this.M_CM_CurrencyMaster_AccountSetup.realizeforexlossaccountcd ,
                unrealize_forex_gain_account_id: this.M_CM_CurrencyMaster_AccountSetup.unrealizeforexgainaccountcd == '' || this.M_CM_CurrencyMaster_AccountSetup.unrealizeforexgainaccountcd == null ? 'NULL' : this.M_CM_CurrencyMaster_AccountSetup.unrealizeforexgainaccountcd ,
                unrealize_forex_loss_account_id: this.M_CM_CurrencyMaster_AccountSetup.unrealizeforexlossaccountcd == '' || this.M_CM_CurrencyMaster_AccountSetup.unrealizeforexlossaccountcd == null ? 'NULL' : this.M_CM_CurrencyMaster_AccountSetup.unrealizeforexlossaccountcd ,
                realize_forex_gain_prefix_id: this.M_CM_CurrencyMaster_AccountSetup.realizeforexgainprefixcd == '' || this.M_CM_CurrencyMaster_AccountSetup.realizeforexgainprefixcd == null ? 'NULL' : this.M_CM_CurrencyMaster_AccountSetup.realizeforexgainprefixcd ,
                realize_forex_loss_prefix_id: this.M_CM_CurrencyMaster_AccountSetup.realizeforexlossprefixcd == '' || this.M_CM_CurrencyMaster_AccountSetup.realizeforexlossprefixcd == null ? 'NULL' : this.M_CM_CurrencyMaster_AccountSetup.realizeforexlossprefixcd ,
                unrealize_forex_gain_prefix_id: this.M_CM_CurrencyMaster_AccountSetup.unrealizeforexgainprefixcd == '' || this.M_CM_CurrencyMaster_AccountSetup.unrealizeforexgainprefixcd == null ? 'NULL' : this.M_CM_CurrencyMaster_AccountSetup.unrealizeforexgainprefixcd ,
                unrealize_forex_loss_prefix_id: this.M_CM_CurrencyMaster_AccountSetup.unrealizeforexlossprefixcd == '' || this.M_CM_CurrencyMaster_AccountSetup.unrealizeforexlossprefixcd == null ? 'NULL' : this.M_CM_CurrencyMaster_AccountSetup.unrealizeforexlossprefixcd ,
                gl_forex_gain_account_id: this.M_CM_CurrencyMaster_AccountSetup.glforexgainaccountcd == '' || this.M_CM_CurrencyMaster_AccountSetup.glforexgainaccountcd == null ? 'NULL' : this.M_CM_CurrencyMaster_AccountSetup.glforexgainaccountcd ,
                gl_forex_loss_account_id: this.M_CM_CurrencyMaster_AccountSetup.glforexlossaccountcd == '' || this.M_CM_CurrencyMaster_AccountSetup.glforexlossaccountcd == null ? 'NULL' : this.M_CM_CurrencyMaster_AccountSetup.glforexlossaccountcd ,
                user_edit: this.getDataUser().user_id ,
                lastupdatestamp: this.M_CM_CurrencyMaster_AccountSetup.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })

        },
		M_ClearForm(){
            this.M_CM_CurrencyMaster_AccountSetup = {
                currencycd: '',
                descs: '',
                currencysign: '',
                operator: '*',
                rate: '0',
                unitname: '',
                subunitname: '',
                realizeforexgainaccountcd: '',
                realizeforexlossaccountcd: '',
                unrealizeforexgainaccountcd: '',
                unrealizeforexlossaccountcd: '',
                realizeforexgainprefixcd: '',
                realizeforexlossprefixcd: '',
                unrealizeforexgainprefixcd: '',
                unrealizeforexlossprefixcd: '',
                glforexgainaccountcd: '',
                glforexlossaccountcd: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeedit: '',
                lastupdatestamp: 0,
                rowid: 0
                    }
            		
		},
        M_New(){
			this.$refs.ref_currencycd.focus()
        },
        M_Edit(){
            this.$refs.ref_glforexgainaccountcd.focus()
        },
        M_Delete(dt){       

            var data = this.FormToABSList().getRowSelected()  
            var dataDelete = []

            
            data.forEach((value) => {
            dataDelete.push({
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
                LineNo: this.$parent.data.page_order,
                currency_cd: record.currency_cd
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                this.M_CM_CurrencyMaster_AccountSetup = {
                    currencycd: data.currency_cd,
                    descs: data.descs,
                    currencysign: data.currency_sign,
                    operator: data.operator,
                    rate: this.isCurrency(data.rate, data.decimal),
                    unitname: data.unit_name,
                    subunitname: data.sub_unit_name,
                    realizeforexgainaccountcd: data.realize_forex_gain_account_id,
                    realizeforexlossaccountcd: data.realize_forex_loss_account_id,
                    unrealizeforexgainaccountcd: data.unrealize_forex_gain_account_id,
                    unrealizeforexlossaccountcd: data.unrealize_forex_loss_account_id,
                    realizeforexgainprefixcd: data.realize_forex_gain_prefix_id,
                    realizeforexlossprefixcd: data.realize_forex_loss_prefix_id,
                    unrealizeforexgainprefixcd: data.unrealize_forex_gain_prefix_id,
                    unrealizeforexlossprefixcd: data.unrealize_forex_loss_prefix_id,
                    glforexgainaccountcd: data.gl_forex_gain_account_id,
                    glforexlossaccountcd: data.gl_forex_loss_account_id,
                    userinput: data.user_input,
                    useredit: data.user_edit,
                    timeedit: data.time_edit,
                    lastupdatestamp: record.lastupdatestamp,
                    rowid: data.row_id
                }
                 

                this.M_CM_CurrencyMaster_AccountSetup.glforexgainaccountcdLabel = this.M_CM_CurrencyMaster_AccountSetup.glforexgainaccountcd != null ? data.gl_forex_gain_account_cd :'' 
                this.M_CM_CurrencyMaster_AccountSetup.glforexlossaccountcdLabel = this.M_CM_CurrencyMaster_AccountSetup.glforexlossaccountcd != null ? data.gl_forex_loss_account_cd :'' 
                this.M_CM_CurrencyMaster_AccountSetup.realizeforexgainprefixcdLabel = this.M_CM_CurrencyMaster_AccountSetup.realizeforexgainprefixcd != null ? data.realize_forex_gain_prefix_cd :'' 
                this.M_CM_CurrencyMaster_AccountSetup.realizeforexgainaccountcdLabel = this.M_CM_CurrencyMaster_AccountSetup.realizeforexgainaccountcd != null ? data.realize_forex_gain_account_cd :'' 
                this.M_CM_CurrencyMaster_AccountSetup.realizeforexlossprefixcdLabel = this.M_CM_CurrencyMaster_AccountSetup.realizeforexlossprefixcd != null ? data.realize_forex_loss_prefix_cd :'' 
                this.M_CM_CurrencyMaster_AccountSetup.realizeforexlossaccountcdLabel = this.M_CM_CurrencyMaster_AccountSetup.realizeforexlossaccountcd != null ? data.realize_forex_loss_account_cd :'' 
                this.M_CM_CurrencyMaster_AccountSetup.unrealizeforexgainprefixcdLabel = this.M_CM_CurrencyMaster_AccountSetup.unrealizeforexgainprefixcd != null ? data.unrealize_forex_gain_prefix_cd :'' 
                this.M_CM_CurrencyMaster_AccountSetup.unrealizeforexgainaccountcdLabel = this.M_CM_CurrencyMaster_AccountSetup.unrealizeforexgainaccountcd != null ? data.unrealize_forex_gain_account_cd :'' 
                this.M_CM_CurrencyMaster_AccountSetup.unrealizeforexlossprefixcdLabel = this.M_CM_CurrencyMaster_AccountSetup.unrealizeforexlossprefixcd != null ? data.unrealize_forex_loss_prefix_cd :'' 
                this.M_CM_CurrencyMaster_AccountSetup.unrealizeforexlossaccountcdLabel = this.M_CM_CurrencyMaster_AccountSetup.unrealizeforexlossaccountcd != null ? data.unrealize_forex_loss_account_cd :'' 
         

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

