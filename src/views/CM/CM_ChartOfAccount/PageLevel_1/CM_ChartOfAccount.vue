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
                                <b-col md="6" id="col-left">
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_account_cd" v-model="M_CM_ChartOfAccount.account_cd"  ref="ref_account_cd"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_descs1" v-model="M_CM_ChartOfAccount.descs1"  ref="ref_descs1"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_descs2" v-model="M_CM_ChartOfAccount.descs2"  ref="ref_descs2"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Onaccount_typeChange" :prop="PI_account_type" :value="M_CM_ChartOfAccount.account_type" :label="M_CM_ChartOfAccount.account_typeLabel" ref="ref_account_type"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputRadioButtonVuex @input="OnstatusChange" :prop="PI_status" v-model="M_CM_ChartOfAccount.status"  ref="ref_status" />
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputRadioButtonVuex @input="Onsuppress_revaluationChange" :prop="PI_suppress_revaluation" v-model="M_CM_ChartOfAccount.suppress_revaluation"  ref="ref_suppress_revaluation" />
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Onlink_account_cdChange" :prop="PI_link_account_cd" :value="M_CM_ChartOfAccount.link_account_cd" :label="M_CM_ChartOfAccount.link_account_cdLabel" ref="ref_link_account_cd"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Oncurrency_cdChange" :prop="PI_currency_cd" :value="M_CM_ChartOfAccount.currency_cd" :label="M_CM_ChartOfAccount.currency_cdLabel" ref="ref_currency_cd"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputDateVuex @input="Onlast_transaction_dateChange" :prop="PI_last_transaction_date" v-model="M_CM_ChartOfAccount.last_transaction_date"  ref="ref_last_transaction_date" />
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputRadioButtonVuex @input="Onbudget_controlChange" :prop="PI_budget_control" v-model="M_CM_ChartOfAccount.budget_control"  ref="ref_budget_control" />
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
    props: {PageLevel: '', TabIndex: '', data: ''},
    data() {
        return {
		cInsertKey:'id=gl_chart_of_account_id,label=account_cd+|+descs',
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
            M_CM_ChartOfAccount: {
              a9: '',
              currency_cd: '',
              last_transaction_date: '',
              status: '',
              control_sequence_no: 0,
              deferredin_come_status: '',
              a5: '',
              a6: '',
              a7: '',
              a8: '',
              link_account_cd: '',
              gl_chart_of_account_id: 0,
              budget_control: '',
              a0: '',
              a1: '',
              a2: '',
              a3: '',
              a4: '',
              account_cd: '',
              descs1: '',
              descs2: '',
              account_type: '',
              suppress_revaluation: '',
              row_id: 0,
              lastupdatestamp: 0,
              time_edit: '',
              user_input: '',
              user_edit: '',
            },
            PI_account_cd: { 
                cValidate :'required|max:20', 
                cName: 'account_cd', 
                cLabel: 'Account Code', 
                cLabelSize: 4, 
                cOrder: 1, 
                cKey: true, 
                cType: 'text',
                cVisible: true, 
                cDefault: '', 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_descs1: { 
                cValidate :'required|max:60', 
                cName: 'descs1', 
                cLabel: 'Account Description 1', 
                cLabelSize: 4, 
                cOrder: 2, 
                cKey: true, 
                cType: 'text',
                cVisible: true, 
                cDefault: '', 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_descs2: { 
                cValidate :'required|max:60', 
                cName: 'descs2', 
                cLabel: 'Account Description 2', 
                cLabelSize: 4, 
                cOrder: 3, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cDefault: '', 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_account_type: { 
                dataLookUp: null, 
                cValidate :'required', 
                cName: 'account_type', 
                cLabel: 'Account Type', 
                cLabelSize: 4, 
                cOrder: 4, 
                cKey: false, 
                cTriggered: false, 
                cDefault: '', 
                cProtect: false, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cStatic: true, 
                cOption: [{ label: 'Asset', id: 'A' },{ label: 'Liabilities', id: 'L' },{ label: 'Capital', id: 'P' },{ label: 'Income', id: 'I' },{ label: 'Expense', id: 'E' },{ label: 'Debtor', id: 'D' },{ label: 'Creditor', id:'C'}], 
                cMasterUrl: '' ,
                cDisplayColumn: '' ,
            }, 

            PI_status: { 
                cValidate :'required', 
                cName: 'status', 
                cId: 'rdbstatus', 
                cRadioOptions: [{ text: 'Active', value: 'A' },{ text: 'Suspend', value: 'S' },{ text: 'Header', value: 'H' }], 
                cRadioDefaultOption: '', 
                cLabel:'Status', 
                cLabelSize: 4, 
                cDefault: '', 
                cOrder: 5, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_suppress_revaluation: { 
                cValidate :'required', 
                cName: 'suppress_revaluation', 
                cId: 'rdbsuppress_revaluation', 
                cRadioOptions: [{ text: 'Yes', value: 'Y' },{ text: 'No', value: 'N' }], 
                cRadioDefaultOption: '', 
                cLabel:'Suppress Revaluation', 
                cLabelSize: 4, 
                cDefault: '', 
                cOrder: 6, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_link_account_cd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGLAccountCd'    , 
                    ColumnDB: 'account_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'account_cd,descs1' 
                        }, 
                cValidate :'', 
                cName: 'link_account_cd', 
                cLabel: 'Link Account Code', 
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
                cDisplayColumn: 'account_cd,descs1' ,
            }, 

            PI_currency_cd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMCurrencyCd'    , 
                    ColumnDB: 'currency_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'currency_cd,descs' 
                        }, 
                cValidate :'', 
                cName: 'currency_cd', 
                cLabel: 'Currency', 
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
                cMasterUrl: 'CM/CM_CurrencyMaster' ,
                cDisplayColumn: 'currency_cd,descs' ,
            }, 

            PI_last_transaction_date: { 
                cValidate :'', 
                cName: 'last_transaction_date', 
                cLabel: 'Last Transaction Date', 
                cLabelSize: 4, 
                cOrder: 9, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_budget_control: { 
                cValidate :'required', 
                cName: 'budget_control', 
                cId: 'rdbbudget_control', 
                cRadioOptions: [{ text: 'No', value: 'N' },{ text: 'By Account Code', value: 'A' },{ text: 'By Account Code and Transaction Analysis', value: 'T' }], 
                cRadioDefaultOption: '', 
                cLabel:'Budget Control', 
                cLabelSize: 4, 
                cDefault: '', 
                cOrder: 10, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 


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
        OnstatusChange (data) {
          this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              //{status}
            }
          })
          this.$forceUpdate()
        },
        Onsuppress_revaluationChange (data) {
          this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              //{suppress_revaluation}
            }
          })
          this.$forceUpdate()
        },
        Onlink_account_cdChange (data) {
          this.$nextTick(() => {
            this.M_CM_ChartOfAccount.link_account_cd = data.id
            this.M_CM_ChartOfAccount.link_account_cdLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{link_account_cd}
            }
          })
          this.$forceUpdate()
        },
        Oncurrency_cdChange (data) {
          this.$nextTick(() => {
            this.M_CM_ChartOfAccount.currency_cd = data.id
            this.M_CM_ChartOfAccount.currency_cdLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{currency_cd}
            }
          })
          this.$forceUpdate()
        },
        Onlast_transaction_dateChange (data) {
          this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              //{last_transaction_date}
            }
          })
          this.$forceUpdate()
        },
        Onbudget_controlChange (data) {
          this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              //{budget_control}
            }
          })
          this.$forceUpdate()
        },
	
		setToolbarButton () {
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
                account_cd: this.M_CM_ChartOfAccount.account_cd,
                descs1: this.M_CM_ChartOfAccount.descs1,
                descs2: this.M_CM_ChartOfAccount.descs2,
                account_type: this.M_CM_ChartOfAccount.account_type,
                budget_control: this.M_CM_ChartOfAccount.budget_control,
                a0: this.M_CM_ChartOfAccount.a0,
                a1: this.M_CM_ChartOfAccount.a1,
                a2: this.M_CM_ChartOfAccount.a2,
                a3: this.M_CM_ChartOfAccount.a3,
                a4: this.M_CM_ChartOfAccount.a4,
                a5: this.M_CM_ChartOfAccount.a5,
                a6: this.M_CM_ChartOfAccount.a6,
                a7: this.M_CM_ChartOfAccount.a7,
                a8: this.M_CM_ChartOfAccount.a8,
                a9: this.M_CM_ChartOfAccount.a9,
                link_account_cd: this.M_CM_ChartOfAccount.link_account_cd == '' || this.M_CM_ChartOfAccount.link_account_cd == null ? 'NULL' : this.M_CM_ChartOfAccount.link_account_cd,
                currency_cd: this.M_CM_ChartOfAccount.currency_cd == '' || this.M_CM_ChartOfAccount.currency_cd == null ? 'NULL' : this.M_CM_ChartOfAccount.currency_cd,
                last_transaction_date: this.M_CM_ChartOfAccount.last_transaction_date == '' || this.M_CM_ChartOfAccount.last_transaction_date == null ? 'NULL' : this.M_CM_ChartOfAccount.last_transaction_date,
                status: this.M_CM_ChartOfAccount.status,
                suppress_revaluation: this.M_CM_ChartOfAccount.suppress_revaluation,
                user_input: this.getDataUser().user_id,
                control_sequence_no: this.M_CM_ChartOfAccount.control_sequence_no,
                deferredin_come_status: this.M_CM_ChartOfAccount.deferredin_come_status,

            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return
				
                this.$parent.resultInsert(response.Message)
				
            })
        },
        M_Update() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                gl_chart_of_account_id: this.M_CM_ChartOfAccount.gl_chart_of_account_id,
                account_cd: this.M_CM_ChartOfAccount.account_cd,
                descs1: this.M_CM_ChartOfAccount.descs1,
                descs2: this.M_CM_ChartOfAccount.descs2,
                account_type: this.M_CM_ChartOfAccount.account_type,
                budget_control: this.M_CM_ChartOfAccount.budget_control,
                a0: this.M_CM_ChartOfAccount.a0,
                a1: this.M_CM_ChartOfAccount.a1,
                a2: this.M_CM_ChartOfAccount.a2,
                a3: this.M_CM_ChartOfAccount.a3,
                a4: this.M_CM_ChartOfAccount.a4,
                a5: this.M_CM_ChartOfAccount.a5,
                a6: this.M_CM_ChartOfAccount.a6,
                a7: this.M_CM_ChartOfAccount.a7,
                a8: this.M_CM_ChartOfAccount.a8,
                a9: this.M_CM_ChartOfAccount.a9,
                link_account_cd: this.M_CM_ChartOfAccount.link_account_cd == '' || this.M_CM_ChartOfAccount.link_account_cd == null ? 'NULL' : this.M_CM_ChartOfAccount.link_account_cd,
                currency_cd: this.M_CM_ChartOfAccount.currency_cd == '' || this.M_CM_ChartOfAccount.currency_cd == null ? 'NULL' : this.M_CM_ChartOfAccount.currency_cd,
                last_transaction_date: this.M_CM_ChartOfAccount.last_transaction_date == '' || this.M_CM_ChartOfAccount.last_transaction_date == null ? 'NULL' : this.M_CM_ChartOfAccount.last_transaction_date,
                status: this.M_CM_ChartOfAccount.status,
                suppress_revaluation: this.M_CM_ChartOfAccount.suppress_revaluation,
                lastupdatestamp: this.M_CM_ChartOfAccount.lastupdatestamp,
                user_edit: this.getDataUser().user_id,
                control_sequence_no: this.M_CM_ChartOfAccount.control_sequence_no,
                deferredin_come_status: this.M_CM_ChartOfAccount.deferredin_come_status,

            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return
				
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_CM_ChartOfAccount = {
              a9: '',
              currency_cd: '',
              last_transaction_date: '',
              status: '',
              control_sequence_no: 0,
              deferredin_come_status: '',
              a5: '',
              a6: '',
              a7: '',
              a8: '',
              link_account_cd: '',
              gl_chart_of_account_id: 0,
              budget_control: '',
              a0: '',
              a1: '',
              a2: '',
              a3: '',
              a4: '',
              account_cd: '',
              descs1: '',
              descs2: '',
              account_type: '',
              suppress_revaluation: '',
              row_id: 0,
              lastupdatestamp: 0,
              time_edit: '',
              user_input: '',
              user_edit: '',
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
                gl_chart_of_account_id: value.gl_chart_of_account_id,
                lastupdatestamp: value.lastupdatestamp,

					_Message_:''

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
                gl_chart_of_account_id: record.gl_chart_of_account_id,

            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                this.M_CM_ChartOfAccount = {
                  a9: data.a9,
                  currency_cd: data.currency_cd,
                  last_transaction_date: data.last_transaction_date,
                  status: data.status,
                  control_sequence_no: data.control_sequence_no,
                  deferredin_come_status: data.deferredin_come_status,
                  a5: data.a5,
                  a6: data.a6,
                  a7: data.a7,
                  a8: data.a8,
                  link_account_cd: data.link_account_cd,
                  gl_chart_of_account_id: data.gl_chart_of_account_id,
                  budget_control: data.budget_control,
                  a0: data.a0,
                  a1: data.a1,
                  a2: data.a2,
                  a3: data.a3,
                  a4: data.a4,
                  account_cd: data.account_cd,
                  descs1: data.descs1,
                  descs2: data.descs2,
                  account_type: data.account_type,
                  suppress_revaluation: data.suppress_revaluation,
                  row_id: data.row_id,
                  lastupdatestamp: record.lastupdatestamp,
                  time_edit: data.time_edit,
                  user_input: data.user_input,
                  user_edit: data.user_edit,
                }

                this.M_CM_ChartOfAccount.link_account_cdLabel = this.M_CM_ChartOfAccount.link_account_cd_cd != null && this.M_CM_ChartOfAccount.link_account_cd_cd != '' ? data.link_account_cd_cd + this.separator + data.link_account_cd_descs :'' 
                this.M_CM_ChartOfAccount.currency_cdLabel = this.M_CM_ChartOfAccount.currency_cd_cd != null && this.M_CM_ChartOfAccount.currency_cd_cd != '' ? data.currency_cd_cd + this.separator + data.currency_cd_descs :'' 


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

