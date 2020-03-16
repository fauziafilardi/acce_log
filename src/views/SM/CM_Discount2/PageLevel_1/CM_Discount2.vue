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
                                        <ABSinputTextVuex :prop="PI_discountcd" v-model="M_CM_Discount2.discountcd"  ref="ref_discountcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_descs" v-model="M_CM_Discount2.descs"  ref="ref_descs"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OntypeChange" :prop="PI_type" v-model="M_CM_Discount2.type"  ref="ref_type" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_discountamt" v-model="M_CM_Discount2.discountamt"  ref="ref_discountamt"/>
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
                                      <b-col md="1" style="text-align: center !important;">1</b-col>                                      
                                      <b-col md="1" style="text-align: center !important;">2</b-col>                                      
                                      <b-col md="1" style="text-align: center !important;">3</b-col>                                      
                                      <b-col md="1" style="text-align: center !important;">4</b-col>                                      
                                      <b-col md="1" style="text-align: center !important;">5</b-col>                                      
                                      <b-col md="1" style="text-align: center !important;">6</b-col>                                      
                                    </b-row>
                                    <b-row>
                                      <b-col md="2">
                                        <ABSLabelOnly
                                        :prop="{cLabel: '% Discount Matrix', 
                                          cLabelSize: 4, 
                                          cValue: '', 
                                          cPageLevel: PageLevel, 
                                          cTabIndex: TabIndex, 
                                          cVisible: true,
                                          cClass: 'lbl-col-align'}"
                                        />
                                      </b-col>
                                      <b-col md="1">                                        
                                        <ABSTextBoxOnly @input="Ondiscountrate1Change" :prop="PI_discountrate1" v-model="M_CM_Discount2.discountrate1"  ref="ref_discountrate1"/>
                                      </b-col>
                                      <b-col md="1">
                                        <ABSTextBoxOnly @input="Ondiscountrate2Change" :prop="PI_discountrate2" v-model="M_CM_Discount2.discountrate2"  ref="ref_discountrate2"/>
                                      </b-col>
                                      <b-col md="1">
                                        <ABSTextBoxOnly @input="Ondiscountrate3Change" :prop="PI_discountrate3" v-model="M_CM_Discount2.discountrate3"  ref="ref_discountrate3"/>
                                      </b-col>
                                      <b-col md="1">
                                        <ABSTextBoxOnly @input="Ondiscountrate4Change" :prop="PI_discountrate4" v-model="M_CM_Discount2.discountrate4"  ref="ref_discountrate4"/>
                                      </b-col>
                                      <b-col md="1">
                                        <ABSTextBoxOnly @input="Ondiscountrate5Change" :prop="PI_discountrate5" v-model="M_CM_Discount2.discountrate5"  ref="ref_discountrate5"/>
                                      </b-col>
                                      <b-col md="1">
                                        <ABSTextBoxOnly :prop="PI_discountrate6" v-model="M_CM_Discount2.discountrate6"  ref="ref_discountrate6"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OndefferedprefixcdChange" :prop="PI_defferedprefixcd" :value="M_CM_Discount2.defferedprefixcd" :label="M_CM_Discount2.defferedprefixcdLabel" ref="ref_defferedprefixcd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OndefferedaccountcdChange" :prop="PI_defferedaccountcd" :value="M_CM_Discount2.defferedaccountcd" :label="M_CM_Discount2.defferedaccountcdLabel" ref="ref_defferedaccountcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnprefixcdChange" :prop="PI_prefixcd" :value="M_CM_Discount2.prefixcd" :label="M_CM_Discount2.prefixcdLabel" ref="ref_prefixcd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnaccountcdChange" :prop="PI_accountcd" :value="M_CM_Discount2.accountcd" :label="M_CM_Discount2.accountcdLabel" ref="ref_accountcd"/>
                                      </b-col>
                                    </b-row>
                                    <div class="div-collapse">
                                        <span class="master-span-form">
                                            Discount User Assignment
                                        </span>
                                    </div>
                                </b-col> 
                                <b-col md="12" id="col-left"> <!-- table open -->
                                <b-row style="padding-left:10px;">					
                                <b-col md="12" id="col-left"> <!-- table open -->
                                   <b-row style="padding-left:10px;">					
                                <b-col md="12" id="col-left">                                    
                                    <b-row style="padding-top:10px; padding-right: 10px; padding-left: 25px; padding-bottom: 10px; !important;">
                                        <!-- Subportfolio : {{subportfolio}} -->
                                    </b-row>
                                    <b-row>
                                    <b-col md="4" style="padding-right: 15px !important;">
                                        <input
                                            v-model="search"
                                            type="text"
                                            class="form-control text-field-form"
                                            style="margin-left: 20px !important;"
                                            placeholder="Search..."
                                            autofocus
                                            autocomplete="off"
                                            @keyup.enter="onSearchEnter"
                                            :disabled="ButtonDisabled"
                                            ref="ref_search"
                                            >
                                    </b-col>
                                    </b-row>
                                    <b-row style="padding-top:10px; padding-right: 10px; padding-left: 20px; padding-bottom: 10px; !important;">                                        
                                      <b-col md="4">
                                        Available User
                                        <ABSMultiSelect
                                            v-model="leftData"
                                            :options="leftDataOptions"
                                            size=10
                                            class="selectCustom"
                                        />
                                      </b-col>
                                      <b-col md="1" style="padding: 120px 8px;">
                                        <b-button id="satu" :disabled="ButtonDisabled" size="sm" variant="primary" @click="moveAllToRight" style="width:50px">
                                            &gt;&gt;
                                        </b-button>
                                        <br>
                                        <b-button :disabled="ButtonDisabled" size="sm" variant="primary" @click="moveToRight" style="width:50px;margin-top:10px;">
                                            &gt;
                                        </b-button>
                                        <br>
                                        <b-button :disabled="ButtonDisabled" size="sm" variant="primary" @click="moveToLeft" style="width:50px;margin-top:10px;">
                                            &lt;
                                        </b-button>
                                        <br>
                                        <b-button :disabled="ButtonDisabled" size="sm" variant="primary" @click="moveAllToLeft" style="width:50px;margin-top:10px;">
                                            &lt;&lt;
                                        </b-button>
                                      </b-col>
                                      <b-col md="4">
                                        Assigned User
                                        <ABSMultiSelect
                                            v-model="rightData"
                                            :options="rightDataOptions"
                                            size=10
                                            class="selectCustom"
                                        />
                                      </b-col>
                                    </b-row>
                                  </b-col>
							                  </b-row>
                              </b-col> <!-- table close -->
							              </b-row>
                            </b-col> <!-- table close -->
                          <div class="div-collapse">
                              <span class="master-span-form">
                                  Transaction Analysis
                              </span>
                          </div>
                  
							</b-row>
							<ABSTAnalysisLookUp ref="analysisLookUp" :prop="PTAnalysis" v-model="dataT"/>
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
    allDataOptions: [],
    leftData: [],
    leftDataOptions: [],
    rightData: [],
    rightDataOptions: [],
    search: '',
    // DataRow: [],
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
            rowSelected: '',			

            M_CM_Discount2 :{
                discountcd: '',
                descs: '',
                type: 'P',
                discountamt: 0,
                discountrate1: 0,
                discountrate2: 0,
                discountrate3: 0,
                discountrate4: 0,
                discountrate5: 0,
                discountrate6: 0,
                accountcd: '',
                prefixcd: '',
                defferedaccountcd: '',
                defferedprefixcd: '',
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
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                lastupdatestamp: '',
                controlsequenceno: 0,
                rowid: 0
                    }
            ,
            PI_discountcd: { 
                cValidate :'required|max:5', 
                cName: 'discountcd', 
                cLabel: 'Discount Code', 
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
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_type: { 
                cValidate :'', 
                cName: 'type', 
                cId: 'rdbtype', 
                cRadioOptions: [{ text: 'Percent', value: 'P' }, { text: 'Fixed', value: 'F' }], 
                cRadioDefaultOption: 'P', 
                cLabel:'	Discount Type', 
                cLabelSize: 4, 
                cOrder: 3, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_discountamt: { 
                cValidate :'max:18|min_value:1|max_value:1000000', 
                cName: 'discountamt', 
                cLabel: 'Discount Amount', 
                cLabelSize: 4, 
                cOrder: 4, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_discountrate1: { 
                cValidate :'max:6|max_value:100', 
                cName: 'discountrate1', 
                cLabel: '1', 
                cLabelSize: 4, 
                cOrder: 5, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_discountrate2: { 
                cValidate :'|max_value:100', 
                cName: 'discountrate2', 
                cLabel: '2', 
                cLabelSize: 1, 
                cOrder: 6, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_discountrate3: { 
                cValidate :'|max_value:100', 
                cName: 'discountrate3', 
                cLabel: '3', 
                cLabelSize: 1, 
                cOrder: 7, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_discountrate4: { 
                cValidate :'|max_value:100', 
                cName: 'discountrate4', 
                cLabel: '4', 
                cLabelSize: 1, 
                cOrder: 8, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_discountrate5: { 
                cValidate :'|max_value:100', 
                cName: 'discountrate5', 
                cLabel: '5', 
                cLabelSize: 1, 
                cOrder: 9, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_discountrate6: { 
                cValidate :'|max_value:100', 
                cName: 'discountrate6', 
                cLabel: '6', 
                cLabelSize: 1, 
                cOrder:10, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_defferedprefixcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountPrefix'    , 
                    ColumnDB: 'PrefixCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'PrefixCd,ChartOfAccountPrefix' 
                        }, 
                cValidate :'', 
                cName: 'defferedprefixcd', 
                cLabel: 'Deffered Discount Account Prefix', 
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
                cMasterUrl: 'GL/GL_SubModuleAccountPrefix' ,
                // cDisplayColumn: 'PrefixCd,ChartOfAccountPrefix' ,
                cDisplayColumn: 'PrefixCd' ,
            }, 
            PI_defferedaccountcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCode'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "Status = 'A'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'AccountCd,Description_1' 
                        }, 
                cValidate :'', 
                cName: 'defferedaccountcd', 
                cLabel: 'Deffered Discount Account Code', 
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
                cMasterUrl: 'GL/GL_ChartofAccount' ,
                // cDisplayColumn: 'AccountCd,Description_1' ,
                cDisplayColumn: 'AccountCd' ,
            }, 
            PI_prefixcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountPrefix'    , 
                    ColumnDB: 'PrefixCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'PrefixCd,ChartOfAccountPrefix' 
                        }, 
                cValidate :'', 
                cName: 'prefixcd', 
                cLabel: 'Expense Discount Account Prefix ', 
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
                cMasterUrl: 'GL/GL_SubModuleAccountPrefix' ,
                // cDisplayColumn: 'PrefixCd,ChartOfAccountPrefix' ,
                cDisplayColumn: 'PrefixCd' ,
            }, 
            PI_accountcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCode'    , 
                    ColumnDB: 'AccountCd'   , 
                    InitialWhere: "Status = 'A'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'AccountCd,Description_1' 
                        }, 
                cValidate :'', 
                cName: 'accountcd', 
                cLabel: 'Expense Discount Account Code ', 
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
                cMasterUrl: 'GL/GL_ChartofAccount' ,
                // cDisplayColumn: 'AccountCd,Description_1' ,
                cDisplayColumn: 'AccountCd' ,
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
	  },
    ButtonDisabled() {
      if (this.inputStatus == 'VIEW') {
          return true
      }
      else {
          return false
      }
    }
  },
    methods: {
      onSearchEnter () {  
            if (this.ButtonDisabled) return
            // this.getAllColumn(this.search)
            this.getRightColumn(this.search)

        },
        getDataList (search) {
          // console.log(this.DataRow)
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                UserId: this.getDataUser().user_id,
                PortfolioCd: this.getDataUser().portfolio_cd,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                LineNo: 1,
                InitialWhere: "UserID like '%" + search + "%' OR UserName like '%" + search + "%'",
                ParamView: "'"+this.M_CM_Discount2.discountcd+"'",
                SortField: 'UserID'
            }
            this.postEncode( this.getUrlDataList(), param )
            .then( response => {
                this.$store.commit('setStatusLoader', false)
                if (response == null) return
                this.allDataOptions = response.Data
                // console.log(this.allDataOptions)
                this.leftDataOptions = []
                var status = false
                for (var x = 0; x < this.allDataOptions.length; x++) {
                    status = false
                    for (var y = 0; y < this.rightDataOptions.length; y++) {
                    // console.log(this.allDataOptions[x].UserID,this.rightDataOptions[y].value)
                        if (this.allDataOptions[x].UserID == this.rightDataOptions[y].value) {  
                            status = true
                            break
                        }
                    }
                    if (status == false) {
                        this.leftDataOptions.push({
                            value: this.allDataOptions[x].UserID,                             
                            key: this.allDataOptions[x].UserID + ' - ' + this.allDataOptions[x].UserName,
                        })
                    }
                }
                this.$forceUpdate()
            })
        },
        getRightColumn (DiscountCd) {
            
            this.$store.commit('setStatusLoader', true)           
            
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                UserId: this.getDataUser().user_id,
                PortfolioCd: this.getDataUser().portfolio_cd,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                LineNo: 2,  
                InitialWhere: "DiscountCd = '"+DiscountCd+"'",
                ParamView: "",
                SortField: 'UserID',
            }

            this.postEncode( this.getUrlDataList(), param )
            .then( response => {
                if (response == null) return
                var data = response.Data
                this.rightDataOptions = []
                for (var x = 0; x < data.length; x++) {
                    this.rightDataOptions.push({
                        value: data[x].UserID,                        
                        key: data[x].UserID + ' - ' + data[x].UserName, 
                        // RowId: data[x].UserID,
                    })
                }
                this.getDataList('')
            })
        },
        moveAllToRight () {
            for (var x = 0; x < this.leftDataOptions.length; x++) {
                var data = this.leftDataOptions[x]
                this.rightDataOptions.push({
                    value: data.value,
                    key: data.key,
                    RowId: data.row_id,
                })
            }
            this.leftDataOptions = []
            this.$forceUpdate()
        },
        moveToRight () {
            for (var x = 0; x < this.leftData.length; x++) {
                var index = -1
                var data
                for (var y = 0; y < this.leftDataOptions.length; y++) {
                    if (this.leftData[x] == this.leftDataOptions[y].value) {
                        data = this.leftDataOptions[y]
                        index = y
                    }
                }
                this.rightDataOptions.push({
                    value: data.value,
                    key: data.key,
                    RowId: data.row_id,
                })
                this.leftDataOptions.splice(index, 1)
            }
            this.$forceUpdate()
        },
        moveToLeft () {
            for (var x = 0; x < this.rightData.length; x++) {
                var index = -1
                var data
                for (var y = 0; y < this.rightDataOptions.length; y++) {
                    if (this.rightData[x] == this.rightDataOptions[y].value) {
                        data = this.rightDataOptions[y]
                        index = y
                    }
                }
                this.leftDataOptions.push({
                    value: data.value,
                    key: data.key,
                    RowId: data.row_id,
                })
                this.rightDataOptions.splice(index, 1)
            }
            this.$forceUpdate()
        },
        moveAllToLeft () {
            for (var x = 0; x < this.rightDataOptions.length; x++) {
                var data = this.rightDataOptions[x]
                this.leftDataOptions.push({
                    value: data.value,
                    key: data.key,
                    RowId: data.row_id,
                })
            }
            this.rightDataOptions = []
            this.$forceUpdate()
        },
        Ondiscountrate1Change(data){
          this.$nextTick(() => {
            if(data > 0){
                this.PI_discountrate2.cProtect = false
              }else{
                this.PI_discountrate2.cProtect = true
                this.PI_discountrate3.cProtect = true
                this.PI_discountrate4.cProtect = true
                this.PI_discountrate5.cProtect = true
                this.PI_discountrate6.cProtect = true

                this.M_CM_Discount2.discountrate2 = ''
                this.M_CM_Discount2.discountrate3 = ''
                this.M_CM_Discount2.discountrate4 = ''
                this.M_CM_Discount2.discountrate5 = ''
                this.M_CM_Discount2.discountrate6 = ''
              }
            if (this.inputStatus != "VIEW") {
              
            }
          })
        },
        Ondiscountrate2Change(data){
          
          this.$nextTick(() => {
            if(data > 0){
                this.PI_discountrate3.cProtect = false
              }else{
                this.PI_discountrate3.cProtect = true
                this.PI_discountrate4.cProtect = true
                this.PI_discountrate5.cProtect = true
                this.PI_discountrate6.cProtect = true

                this.M_CM_Discount2.discountrate3 = ''
                this.M_CM_Discount2.discountrate4 = ''
                this.M_CM_Discount2.discountrate5 = ''
                this.M_CM_Discount2.discountrate6 = ''
              }
            if (this.inputStatus != "VIEW") {
              
            }
          })
        },
        Ondiscountrate3Change(data){
          
          this.$nextTick(() => {
            if(data > 0){
                this.PI_discountrate4.cProtect = false
              }else{
                this.PI_discountrate4.cProtect = true
                this.PI_discountrate5.cProtect = true
                this.PI_discountrate6.cProtect = true

                this.M_CM_Discount2.discountrate4 = ''
                this.M_CM_Discount2.discountrate5 = ''
                this.M_CM_Discount2.discountrate6 = ''
              }
            if (this.inputStatus != "VIEW") {
              
            }
          })
        },
        Ondiscountrate4Change(data){
          
          this.$nextTick(() => {
            if(data > 0){
                this.PI_discountrate5.cProtect = false
              }else{
                this.PI_discountrate5.cProtect = true
                this.PI_discountrate6.cProtect = true

                this.M_CM_Discount2.discountrate5 = ''
                this.M_CM_Discount2.discountrate6 = '' 
              }
            if (this.inputStatus != "VIEW") {
              
            }
          })
        },
        Ondiscountrate5Change(data){
          
          this.$nextTick(() => {
            if(data > 0){
                this.PI_discountrate6.cProtect = false
              }else{
                this.PI_discountrate6.cProtect = true

                this.M_CM_Discount2.discountrate6 = ''
              }
            if (this.inputStatus != "VIEW") {
              
            }
          })
        },		
        OntypeChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
        if (data == "F")
             { this.PI_discountrate1.cValidate = ""
             this.$refs.ref_discountrate1.isRequired = false
             this.PI_discountamt.cValidate = "required"
             this.$refs.ref_discountamt.isRequired = true
             this.PI_discountamt.cProtect = false
             this.M_CM_Discount2.discountrate1 = ""
             this.M_CM_Discount2.discountrate2 = ""
             this.M_CM_Discount2.discountrate3 = ""
             this.M_CM_Discount2.discountrate4 = ""
             this.M_CM_Discount2.discountrate5 = ""
             this.M_CM_Discount2.discountrate6 = ""
             this.PI_discountrate1.cProtect = true
             this.PI_discountrate2.cProtect = true
             this.PI_discountrate3.cProtect = true
             this.PI_discountrate4.cProtect = true
             this.PI_discountrate5.cProtect = true
             this.PI_discountrate6.cProtect = true }
        else {
             this.PI_discountrate1.cValidate = "required"
             this.$refs.ref_discountrate1.isRequired = true
             this.PI_discountamt.cValidate = ""
             this.$refs.ref_discountamt.isRequired = false
             this.M_CM_Discount2.discountamt = ""
             this.PI_discountamt.cProtect = true
             this.PI_discountrate1.cProtect = false
             this.PI_discountrate2.cProtect = true
             this.PI_discountrate3.cProtect = true
             this.PI_discountrate4.cProtect = true
             this.PI_discountrate5.cProtect = true
             this.PI_discountrate6.cProtect = true }

            }
        })
        this.$forceUpdate()
        },
        OndefferedprefixcdChange (data) {
        this.$nextTick(() => {
            this.M_CM_Discount2.defferedprefixcd = data.id
            this.M_CM_Discount2.defferedprefixcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{defferedprefixcd}
            }
        })
        this.$forceUpdate()
        },
        OndefferedaccountcdChange (data) {
        this.$nextTick(() => {
            this.M_CM_Discount2.defferedaccountcd = data.id
            this.M_CM_Discount2.defferedaccountcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{defferedaccountcd}
            }
        })
        this.$forceUpdate()
        },
        OnprefixcdChange (data) {
        this.$nextTick(() => {
            this.M_CM_Discount2.prefixcd = data.id
            this.M_CM_Discount2.prefixcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{prefixcd}
            }
        })
        this.$forceUpdate()
        },
        OnaccountcdChange (data) {
        this.$nextTick(() => {
            this.M_CM_Discount2.accountcd = data.id
            this.M_CM_Discount2.accountcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{accountcd}
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
      this.rowClicked()
      this.search = ''	
		},		
		doDoubleClick(){
        },
        rowClicked (record, index) {
          // console.log(record)
          this.getRightColumn(record.DiscountCd)
        },
        rowLink: function(url){
            this.$refs.modalTest.show()
        },		
		paramFromParent(){
        },		
        M_Post(){
        },
        M_Insert() {
          var dataPost = []
          var param2 = []
          var param3 = []

          if (this.M_CM_Discount2.type == "F")
              { this.M_CM_Discount2.discountrate1 = 0
              this.M_CM_Discount2.discountrate2 = 0
              this.M_CM_Discount2.discountrate3 = 0
              this.M_CM_Discount2.discountrate4 = 0
              this.M_CM_Discount2.discountrate5 = 0
              this.M_CM_Discount2.discountrate6 = 0 }
          else {
              this.M_CM_Discount2.discountamt = 0 }
              var param1 = {			
                  _Method_: 'SAVE',
                  _LineNo_: this.$parent.data.page_order,
                  OptionSeq: this.getOptionSeq().OptionSeq,
                  LineNo: this.$parent.data.page_order,
                  DiscountCd: this.M_CM_Discount2.discountcd,
                  Descs: this.M_CM_Discount2.descs,
                  Type: this.M_CM_Discount2.type,
                  DiscountAmt: this.M_CM_Discount2.discountamt ? this.replaceAllString(this.M_CM_Discount2.discountamt,',','','number') : 0 ,
                  DiscountRate1: this.M_CM_Discount2.discountrate1 ? this.replaceAllString(this.M_CM_Discount2.discountrate1,',','','number') : 0 ,
                  DiscountRate2: this.M_CM_Discount2.discountrate2 ? this.replaceAllString(this.M_CM_Discount2.discountrate2,',','','number') : 0 ,
                  DiscountRate3: this.M_CM_Discount2.discountrate3 ? this.replaceAllString(this.M_CM_Discount2.discountrate3,',','','number') : 0 ,
                  DiscountRate4: this.M_CM_Discount2.discountrate4 ? this.replaceAllString(this.M_CM_Discount2.discountrate4,',','','number') : 0 ,
                  DiscountRate5: this.M_CM_Discount2.discountrate5 ? this.replaceAllString(this.M_CM_Discount2.discountrate5,',','','number') : 0 ,
                  DiscountRate6: this.M_CM_Discount2.discountrate6 ? this.replaceAllString(this.M_CM_Discount2.discountrate6,',','','number') : 0 ,
                  AccountCd: this.M_CM_Discount2.accountcd == '' || this.M_CM_Discount2.accountcd == null ? 'NULL' : this.M_CM_Discount2.accountcd ,
                  PrefixCd: this.M_CM_Discount2.prefixcd == '' || this.M_CM_Discount2.prefixcd == null ? 'NULL' : this.M_CM_Discount2.prefixcd ,
                  DefferedAccountCd: this.M_CM_Discount2.defferedaccountcd == '' || this.M_CM_Discount2.defferedaccountcd == null ? 'NULL' : this.M_CM_Discount2.defferedaccountcd ,
                  DefferedPrefixCd: this.M_CM_Discount2.defferedprefixcd == '' || this.M_CM_Discount2.defferedprefixcd == null ? 'NULL' : this.M_CM_Discount2.defferedprefixcd ,
                  T0: this.getDataUser().portfolio_cd,
                  T1: this.getDataUser().subportfolio_cd,
                  T2 : '',
                  T3 : '',
                  T4 : '',
                  T5 : '',
                  T6 : '',
                  T7 : '',
                  T8 : '',
                  T9 : '',
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
                  UserInput: this.getDataUser().user_id                 
              }

              for (let x = 0 ; x < this.leftDataOptions.length ; x ++) {
              param2.push({
                  _Method_: 'DELETE2',
                  _LineNo_: this.$parent.data.page_order,
                  SubPortfolioCd: this.getDataUser().subportfolio_cd,
                  UserID: this.leftDataOptions[x].value,
                  DiscountCd: this.M_CM_Discount2.discountcd
                })
              }

              for (let x = 0 ; x < this.rightDataOptions.length ; x ++) {
                  param3.push({
                      _Method_: 'SAVE2',
                      _LineNo_: this.$parent.data.page_order,
                      UserID: this.rightDataOptions[x].value,
                      DiscountCd: this.M_CM_Discount2.discountcd,
                      SubPortfolioCd: this.getDataUser().subportfolio_cd,
                      UserInput: this.getDataUser().user_id
                  })
              }

              dataPost.push({
                  A_Insert: param1,
                  B_Looping: param2,
                  C_Looping: param3.length > 0 ? param3 : null
              })

              var param = {
                  OptionSeq: this.getOptionSeq().OptionSeq,
                  LineNo: this.$parent.data.page_order,
                  Data: dataPost
              }
                  
              this.postJSONMulti (this.getUrlProsesDataPostMulti(), param)
              .then(response => {
                  if (response == null) return
                  // this.alertSuccess('Success...!')
                  this.$parent.resultInsert("Success...!")
              })


        },
        M_Update() {
          var dataPost = []
          var param2 = []
          var param3 = []

          if (this.M_CM_Discount2.type == "F")
              { this.M_CM_Discount2.discountrate1 = 0
              this.M_CM_Discount2.discountrate2 = 0
              this.M_CM_Discount2.discountrate3 = 0
              this.M_CM_Discount2.discountrate4 = 0
              this.M_CM_Discount2.discountrate5 = 0
              this.M_CM_Discount2.discountrate6 = 0 }
          else {
              this.M_CM_Discount2.discountamt = 0 }
              var param1 = {			
                  _Method_: 'UPDATE',
                  _LineNo_: this.$parent.data.page_order,
                  OptionSeq: this.getOptionSeq().OptionSeq,
                  LineNo: this.$parent.data.page_order,
                  DiscountCd: this.M_CM_Discount2.discountcd,
                  Descs: this.M_CM_Discount2.descs,
                  Type: this.M_CM_Discount2.type,
                  DiscountAmt: this.M_CM_Discount2.discountamt ? this.replaceAllString(this.M_CM_Discount2.discountamt,',','','number') : 0 ,
                  DiscountRate1: this.M_CM_Discount2.discountrate1 ? this.replaceAllString(this.M_CM_Discount2.discountrate1,',','','number') : 0 ,
                  DiscountRate2: this.M_CM_Discount2.discountrate2 ? this.replaceAllString(this.M_CM_Discount2.discountrate2,',','','number') : 0 ,
                  DiscountRate3: this.M_CM_Discount2.discountrate3 ? this.replaceAllString(this.M_CM_Discount2.discountrate3,',','','number') : 0 ,
                  DiscountRate4: this.M_CM_Discount2.discountrate4 ? this.replaceAllString(this.M_CM_Discount2.discountrate4,',','','number') : 0 ,
                  DiscountRate5: this.M_CM_Discount2.discountrate5 ? this.replaceAllString(this.M_CM_Discount2.discountrate5,',','','number') : 0 ,
                  DiscountRate6: this.M_CM_Discount2.discountrate6 ? this.replaceAllString(this.M_CM_Discount2.discountrate6,',','','number') : 0 ,
                  AccountCd: this.M_CM_Discount2.accountcd == '' || this.M_CM_Discount2.accountcd == null ? 'NULL' : this.M_CM_Discount2.accountcd ,
                  PrefixCd: this.M_CM_Discount2.prefixcd == '' || this.M_CM_Discount2.prefixcd == null ? 'NULL' : this.M_CM_Discount2.prefixcd ,
                  DefferedAccountCd: this.M_CM_Discount2.defferedaccountcd == '' || this.M_CM_Discount2.defferedaccountcd == null ? 'NULL' : this.M_CM_Discount2.defferedaccountcd ,
                  DefferedPrefixCd: this.M_CM_Discount2.defferedprefixcd == '' || this.M_CM_Discount2.defferedprefixcd == null ? 'NULL' : this.M_CM_Discount2.defferedprefixcd ,
                  T0: this.getDataUser().portfolio_cd,
                  T1: this.getDataUser().subportfolio_cd,
                  T2 : '',
                  T3 : '',
                  T4 : '',
                  T5 : '',
                  T6 : '',
                  T7 : '',
                  T8 : '',
                  T9 : '',
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
                  UserEdit: this.getDataUser().user_id ,
                  LastUpdateStamp: this.M_CM_Discount2.lastupdatestamp                
              }

              for (let x = 0 ; x < this.leftDataOptions.length ; x ++) {
              param2.push({
                  _Method_: 'DELETE2',
                  _LineNo_: this.$parent.data.page_order,
                  SubPortfolioCd: this.getDataUser().subportfolio_cd,
                  UserID: this.leftDataOptions[x].value,
                  DiscountCd: this.M_CM_Discount2.discountcd
                })
              }

              for (let x = 0 ; x < this.rightDataOptions.length ; x ++) {
                  param3.push({
                      _Method_: 'SAVE2',
                      _LineNo_: this.$parent.data.page_order,
                      UserID: this.rightDataOptions[x].value,
                      DiscountCd: this.M_CM_Discount2.discountcd,
                      SubPortfolioCd: this.getDataUser().subportfolio_cd,
                      UserInput: this.getDataUser().user_id
                  })
              }

              dataPost.push({
                  A_Update: param1,
                  B_Looping: param2,
                  C_Looping: param3.length > 0 ? param3 : null
              })

              var param = {
                  OptionSeq: this.getOptionSeq().OptionSeq,
                  LineNo: this.$parent.data.page_order,
                  Data: dataPost
              }
                  
              this.postJSONMulti (this.getUrlProsesDataPostMulti(), param)
              .then(response => {
                  if (response == null) return
                  // this.alertSuccess('Success...!')
                  this.$parent.resultUpdate("Success...!")
              })


        },
		M_ClearForm(){
            this.M_CM_Discount2 = {
                discountcd: '',
                descs: '',
                type: 'P',
                discountamt: '',
                discountrate1: '',
                discountrate2: '',
                discountrate3: '',
                discountrate4: '',
                discountrate5: '',
                discountrate6: '',
                accountcd: '',
                prefixcd: '',
                defferedaccountcd: '',
                defferedprefixcd: '',
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
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                lastupdatestamp: '',
                controlsequenceno: 0,
                rowid: 0
                    }
              this.$refs.analysisLookUp.resetData()	
		    },
        M_New(){
          this.$refs.ref_discountcd.focus()
          this.getRightColumn('')
        },
        M_Edit(){
          this.$refs.ref_descs.focus()

          if(this.M_CM_Discount2.type == 'F'){
            this.PI_discountamt.cProtect = false
            this.PI_discountrate1.cProtect = true
            this.PI_discountrate2.cProtect = true
            this.PI_discountrate3.cProtect = true
            this.PI_discountrate4.cProtect = true
            this.PI_discountrate5.cProtect = true
            this.PI_discountrate6.cProtect = true
          }else{
            this.PI_discountamt.cProtect = true
            this.PI_discountrate1.cProtect = false
            this.PI_discountrate2.cProtect = false
            this.PI_discountrate3.cProtect = false
            this.PI_discountrate4.cProtect = false
            this.PI_discountrate5.cProtect = false
            this.PI_discountrate6.cProtect = false

          }
        },
        M_Delete(dt){       

        var data = this.FormToABSList().getRowSelected()  
        var dataDelete = []

        
        data.forEach((value) => {
          dataDelete.push({
          DiscountCd: value.DiscountCd,
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
,                discountcd: record.DiscountCd
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
this.M_CM_Discount2 = {
                discountcd: data.discountcd,
                descs: data.descs,
                type: data.type,
                discountamt: this.isCurrency(data.discountamt, this.decimal),
                discountrate1: this.isCurrency(data.discountrate1, this.decimal),
                discountrate2: this.isCurrency(data.discountrate2, this.decimal),
                discountrate3: this.isCurrency(data.discountrate3, this.decimal),
                discountrate4: this.isCurrency(data.discountrate4, this.decimal),
                discountrate5: this.isCurrency(data.discountrate5, this.decimal),
                discountrate6: this.isCurrency(data.discountrate6, this.decimal),
                accountcd: data.accountcd,
                prefixcd: data.prefixcd,
                defferedaccountcd: data.defferedaccountcd,
                defferedprefixcd: data.defferedprefixcd,
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
                userinput: data.userinput,
                useredit: data.useredit,
                timeinput: data.timeinput,
                timeedit: data.timeedit,
                lastupdatestamp: record.LastUpdateStamp,
                controlsequenceno: data.controlsequenceno,
                rowid: data.rowid
                    }
               for (let a = 2; a <= 30; a++) {
                    this.dataT['T'+a] = data['t'+a]
                    this.dataT['T'+a+'label'] = data['t'+a]
                }

                 if(data.discountrate1 >= 0){
                    this.PI_discountrate2.cProtect = false
                  }else{
                    this.PI_discountrate2.cProtect = true
                    this.PI_discountrate3.cProtect = true
                    this.PI_discountrate4.cProtect = true
                    this.PI_discountrate5.cProtect = true
                    this.PI_discountrate6.cProtect = true

                    this.M_CM_Discount2.discountrate2 = ''
                    this.M_CM_Discount2.discountrate3 = ''
                    this.M_CM_Discount2.discountrate4 = ''
                    this.M_CM_Discount2.discountrate5 = ''
                    this.M_CM_Discount2.discountrate6 = ''
                  }

                  if(data.discountrate2 >= 0){
                  this.PI_discountrate3.cProtect = true
                  }else{
                    this.PI_discountrate3.cProtect = true
                    this.PI_discountrate4.cProtect = true
                    this.PI_discountrate5.cProtect = true
                    this.PI_discountrate6.cProtect = true

                    this.M_CM_Discount2.discountrate3 = ''
                    this.M_CM_Discount2.discountrate4 = ''
                    this.M_CM_Discount2.discountrate5 = ''
                    this.M_CM_Discount2.discountrate6 = ''
                  }

                  if(data.discountrate3 >= 0){
                  this.PI_discountrate4.cProtect = true
                  }else{
                    this.PI_discountrate4.cProtect = true
                    this.PI_discountrate5.cProtect = true
                    this.PI_discountrate6.cProtect = true

                    this.M_CM_Discount2.discountrate4 = ''
                    this.M_CM_Discount2.discountrate5 = ''
                    this.M_CM_Discount2.discountrate6 = ''
                  }

                  if(data.discountrate4 >= 0){
                  this.PI_discountrate5.cProtect = false
                  }else{
                    this.PI_discountrate5.cProtect = true
                    this.PI_discountrate6.cProtect = true

                    this.M_CM_Discount2.discountrate5 = ''
                    this.M_CM_Discount2.discountrate6 = ''
                  }

                  if(data.discountrate5 >= 0){
                  this.PI_discountrate6.cProtect = false
                  }else{
                    this.PI_discountrate6.cProtect = true

                    this.M_CM_Discount2.discountrate6 = ''
                  }

                  this.M_CM_Discount2.defferedprefixcdLabel = this.M_CM_Discount2.defferedprefixcd != null && this.M_CM_Discount2.defferedprefixcd != '' ? data.defferedprefixcd   :'' 
                this.M_CM_Discount2.defferedaccountcdLabel = this.M_CM_Discount2.defferedaccountcd != null && this.M_CM_Discount2.defferedaccountcd != '' ? data.defferedaccountcd   :'' 
                this.M_CM_Discount2.prefixcdLabel = this.M_CM_Discount2.prefixcd != null && this.M_CM_Discount2.prefixcd != '' ? data.prefixcd   :'' 
                this.M_CM_Discount2.accountcdLabel = this.M_CM_Discount2.accountcd != null && this.M_CM_Discount2.accountcd != '' ? data.accountcd  :''

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

