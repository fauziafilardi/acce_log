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
                                      <ABSinputTextVuex :prop="PI_prefix_cd" v-model="M_CM_SubModuleAccountPrefix.prefix_cd"  ref="ref_prefix_cd"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_chart_of_account_prefix" v-model="M_CM_SubModuleAccountPrefix.chart_of_account_prefix"  ref="ref_chart_of_account_prefix"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_descs" v-model="M_CM_SubModuleAccountPrefix.descs"  ref="ref_descs"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_account_descs" v-model="M_CM_SubModuleAccountPrefix.account_descs"  ref="ref_account_descs"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Onaccount_typeChange" :prop="PI_account_type" :value="M_CM_SubModuleAccountPrefix.account_type" :label="M_CM_SubModuleAccountPrefix.account_typeLabel" ref="ref_account_type"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Onlink_account_cdChange" :prop="PI_link_account_cd" :value="M_CM_SubModuleAccountPrefix.link_account_cd" :label="M_CM_SubModuleAccountPrefix.link_account_cdLabel" ref="ref_link_account_cd"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Oncurrency_cdChange" :prop="PI_currency_cd" :value="M_CM_SubModuleAccountPrefix.currency_cd" :label="M_CM_SubModuleAccountPrefix.currency_cdLabel" ref="ref_currency_cd"/>
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
		cInsertKey:'id=gl_chart_of_account_prefix_id,label=prefix_cd+|+descs',
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
            M_CM_SubModuleAccountPrefix: {
              control_sequence_no: 0,
              a6: '',
              a7: '',
              a8: '',
              a9: '',
              a0: '',
              a1: '',
              a2: '',
              a3: '',
              a4: '',
              gl_chart_of_account_prefix_id: 0,
              a5: '',
              prefix_cd: '',
              chart_of_account_prefix: 0,
              descs: '',
              account_descs: '',
              account_type: '',
              link_account_cd: '',
              link_account_cd_cd: '',
              link_account_cd_descs: '',
              currency_cd: '',
              currency_cd_cd: '',
              currency_cd_descs: '',
              row_id: 0,
              lastupdatestamp: 0,
              time_edit: '',
              user_input: '',
              user_edit: '',
            },
            PI_prefix_cd: { 
                cValidate :'required|max:8', 
                cName: 'prefix_cd', 
                cLabel: 'Account Prefix Code', 
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

            PI_chart_of_account_prefix: { 
                cValidate :'required|max:10', 
                cName: 'chart_of_account_prefix', 
                cLabel: 'Account Prefix', 
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

            PI_descs: { 
                cValidate :'required|max:60', 
                cName: 'descs', 
                cLabel: 'Account Prefix Description', 
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

            PI_account_descs: { 
                cValidate :'required|max:60', 
                cName: 'account_descs', 
                cLabel: 'Account Description ', 
                cLabelSize: 4, 
                cOrder: 4, 
                cKey: true, 
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
                cOrder: 5, 
                cKey: true, 
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
                cOption: [{ label: 'Asset', id: 'A' },{ label: 'Liabilities', id: 'L' },{ label: 'Capital', id: 'P' },{ label: 'Income', id: 'I' },{ label: 'Expense', id: 'E' },{ label: 'Debtor', id: 'D' },{ label: 'Creditor', id: 'C'}], 
                cMasterUrl: '' ,
                cDisplayColumn: '' ,
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
                cMasterUrl: 'CM/CM_CurrencyMaster' ,
                cDisplayColumn: 'currency_cd,descs' ,
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
        Onlink_account_cdChange (data) {
          this.$nextTick(() => {
            this.M_CM_SubModuleAccountPrefix.link_account_cd = data.id
            this.M_CM_SubModuleAccountPrefix.link_account_cdLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{link_account_cd}
            }
          })
          this.$forceUpdate()
        },
        Oncurrency_cdChange (data) {
          this.$nextTick(() => {
            this.M_CM_SubModuleAccountPrefix.currency_cd = data.id
            this.M_CM_SubModuleAccountPrefix.currency_cdLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{currency_cd}
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
                prefix_cd: this.M_CM_SubModuleAccountPrefix.prefix_cd,
                chart_of_account_prefix: this.M_CM_SubModuleAccountPrefix.chart_of_account_prefix,
                account_descs: this.M_CM_SubModuleAccountPrefix.account_descs,
                descs: this.M_CM_SubModuleAccountPrefix.descs,
                account_type: this.M_CM_SubModuleAccountPrefix.account_type,
                a0: this.M_CM_SubModuleAccountPrefix.a0,
                a1: this.M_CM_SubModuleAccountPrefix.a1,
                a2: this.M_CM_SubModuleAccountPrefix.a2,
                a3: this.M_CM_SubModuleAccountPrefix.a3,
                a4: this.M_CM_SubModuleAccountPrefix.a4,
                a5: this.M_CM_SubModuleAccountPrefix.a5,
                a6: this.M_CM_SubModuleAccountPrefix.a6,
                a7: this.M_CM_SubModuleAccountPrefix.a7,
                a8: this.M_CM_SubModuleAccountPrefix.a8,
                a9: this.M_CM_SubModuleAccountPrefix.a9,
                link_account_cd: this.M_CM_SubModuleAccountPrefix.link_account_cd == '' || this.M_CM_SubModuleAccountPrefix.link_account_cd == null ? 'NULL' : this.M_CM_SubModuleAccountPrefix.link_account_cd,
                currency_cd: this.M_CM_SubModuleAccountPrefix.currency_cd == '' || this.M_CM_SubModuleAccountPrefix.currency_cd == null ? 'NULL' : this.M_CM_SubModuleAccountPrefix.currency_cd,
                user_input: this.getDataUser().user_id,
                control_sequence_no: this.M_CM_SubModuleAccountPrefix.control_sequence_no,

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
                gl_chart_of_account_prefix_id: this.M_CM_SubModuleAccountPrefix.gl_chart_of_account_prefix_id,
                prefix_cd: this.M_CM_SubModuleAccountPrefix.prefix_cd,
                chart_of_account_prefix: this.M_CM_SubModuleAccountPrefix.chart_of_account_prefix,
                account_descs: this.M_CM_SubModuleAccountPrefix.account_descs,
                descs: this.M_CM_SubModuleAccountPrefix.descs,
                account_type: this.M_CM_SubModuleAccountPrefix.account_type,
                a0: this.M_CM_SubModuleAccountPrefix.a0,
                a1: this.M_CM_SubModuleAccountPrefix.a1,
                a2: this.M_CM_SubModuleAccountPrefix.a2,
                a3: this.M_CM_SubModuleAccountPrefix.a3,
                a4: this.M_CM_SubModuleAccountPrefix.a4,
                a5: this.M_CM_SubModuleAccountPrefix.a5,
                a6: this.M_CM_SubModuleAccountPrefix.a6,
                a7: this.M_CM_SubModuleAccountPrefix.a7,
                a8: this.M_CM_SubModuleAccountPrefix.a8,
                a9: this.M_CM_SubModuleAccountPrefix.a9,
                link_account_cd: this.M_CM_SubModuleAccountPrefix.link_account_cd == '' || this.M_CM_SubModuleAccountPrefix.link_account_cd == null ? 'NULL' : this.M_CM_SubModuleAccountPrefix.link_account_cd,
                currency_cd: this.M_CM_SubModuleAccountPrefix.currency_cd == '' || this.M_CM_SubModuleAccountPrefix.currency_cd == null ? 'NULL' : this.M_CM_SubModuleAccountPrefix.currency_cd,
                lastupdatestamp: this.M_CM_SubModuleAccountPrefix.lastupdatestamp,
                user_edit: this.getDataUser().user_id,
                control_sequence_no: this.M_CM_SubModuleAccountPrefix.control_sequence_no,

            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return
				
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_CM_SubModuleAccountPrefix = {
              control_sequence_no: 0,
              a6: '',
              a7: '',
              a8: '',
              a9: '',
              a0: '',
              a1: '',
              a2: '',
              a3: '',
              a4: '',
              gl_chart_of_account_prefix_id: 0,
              a5: '',
              prefix_cd: '',
              chart_of_account_prefix: 0,
              descs: '',
              account_descs: '',
              account_type: '',
              link_account_cd: '',
              link_account_cd_cd: '',
              link_account_cd_descs: '',
              currency_cd: '',
              currency_cd_cd: '',
              currency_cd_descs: '',
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
                gl_chart_of_account_prefix_id: value.gl_chart_of_account_prefix_id,
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
                gl_chart_of_account_prefix_id: record.gl_chart_of_account_prefix_id,

            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                this.M_CM_SubModuleAccountPrefix = {
                  control_sequence_no: data.control_sequence_no,
                  a6: data.a6,
                  a7: data.a7,
                  a8: data.a8,
                  a9: data.a9,
                  a0: data.a0,
                  a1: data.a1,
                  a2: data.a2,
                  a3: data.a3,
                  a4: data.a4,
                  gl_chart_of_account_prefix_id: data.gl_chart_of_account_prefix_id,
                  a5: data.a5,
                  prefix_cd: data.prefix_cd,
                  chart_of_account_prefix: data.chart_of_account_prefix,
                  descs: data.descs,
                  account_descs: data.account_descs,
                  account_type: data.account_type,
                  link_account_cd: data.link_account_cd,
                  link_account_cd_cd: data.link_account_cd_cd,
                  link_account_cd_descs: data.link_account_cd_descs,
                  currency_cd: data.currency_cd,
                  currency_cd_cd: data.currency_cd_cd,
                  currency_cd_descs: data.currency_cd_descs,
                  row_id: data.row_id,
                  lastupdatestamp: record.lastupdatestamp,
                  time_edit: data.time_edit,
                  user_input: data.user_input,
                  user_edit: data.user_edit,
                }

                this.M_CM_SubModuleAccountPrefix.link_account_cdLabel = this.M_CM_SubModuleAccountPrefix.link_account_cd_cd != null && this.M_CM_SubModuleAccountPrefix.link_account_cd_cd != '' ? data.link_account_cd_cd + this.separator + data.link_account_cd_descs :'' 
                this.M_CM_SubModuleAccountPrefix.currency_cdLabel = this.M_CM_SubModuleAccountPrefix.currency_cd_cd != null && this.M_CM_SubModuleAccountPrefix.currency_cd_cd != '' ? data.currency_cd_cd + this.separator + data.currency_cd_descs :'' 


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

