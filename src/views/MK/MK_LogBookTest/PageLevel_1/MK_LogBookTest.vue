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
                                      <ABSinputTextVuex :prop="PI_log_book_no" v-model="M_MK_LogBookTest.log_book_no"  ref="ref_log_book_no"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputDateVuex @input="Onlog_book_dateChange" :prop="PI_log_book_date" v-model="M_MK_LogBookTest.log_book_date"  ref="ref_log_book_date" />
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Onmk_follow_up_type_idChange" :prop="PI_mk_follow_up_type_id" :value="M_MK_LogBookTest.mk_follow_up_type_id" :label="M_MK_LogBookTest.mk_follow_up_type_idLabel" ref="ref_mk_follow_up_type_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Oncm_contact_idChange" :prop="PI_cm_contact_id" :value="M_MK_LogBookTest.cm_contact_id" :label="M_MK_LogBookTest.cm_contact_idLabel" ref="ref_cm_contact_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Onmk_contact_status_h_idChange" :prop="PI_mk_contact_status_h_id" :value="M_MK_LogBookTest.mk_contact_status_h_id" :label="M_MK_LogBookTest.mk_contact_status_h_idLabel" ref="ref_mk_contact_status_h_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_reason" v-model="M_MK_LogBookTest.reason"  ref="ref_reason"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSTextAreaVuex @input="OnremarkChange" :prop="PI_remark" v-model="M_MK_LogBookTest.remark"  ref="ref_remark" />
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
		cInsertKey:'',
		FormType: "List",
		Module:"MK",
            propList: {
                initialWhere: "",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
            cm_running_code_h_id_log_book: null,
       
            IEBy: {Input: '', Edit: ''},   			
            M_MK_LogBookTest: {
              mk_log_book_tes_h_id: 0,
              subportfolio_cd: this.getDataUser().subportfolio_cd,
              log_book_no: '',
              log_book_date: '',
              mk_follow_up_type_id: 0,
              follow_up_type_cd: '',
              mk_follow_up_type_id_descs: '',
              cm_contact_id: 0,
              contact_id: '',
              cm_contact_id_descs: '',
              mk_contact_status_h_id: 0,
              contact_status_cd: '',
              mk_contact_status_h_id_descs: '',
              reason: '',
              remark: '',
              row_id: 0,
              lastupdatestamp: 0,
              time_edit: '',
            },
            PI_log_book_no: { 
                cValidate :'required|max:20', 
                cName: 'log_book_no', 
                cLabel: 'Log Book No', 
                cLabelSize: 4, 
                cOrder: 1, 
                cKey: false, 
                cType: 'text',
                cVisible: false, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_log_book_date: { 
                cValidate :'', 
                cName: 'log_book_date', 
                cLabel: 'Log Book Date', 
                cLabelSize: 4, 
                cOrder: 2, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_mk_follow_up_type_id: { 
                dataLookUp: { 
                    LookUpCd: 'GetFollowUpType'    , 
                    ColumnDB: 'follow_up_type_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'follow_up_type_cd,descs,time_edit' 
                        }, 
                cValidate :'', 
                cName: 'mk_follow_up_type_id', 
                cLabel: 'Follow Up Type', 
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
                cMasterUrl: 'MK/MK_FollowUpType' ,
                cDisplayColumn: 'follow_up_type_cd,descs,time_edit' ,
            }, 

            PI_cm_contact_id: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMContact'    , 
                    ColumnDB: 'contact_id'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'contact_id,name' 
                        }, 
                cValidate :'', 
                cName: 'cm_contact_id', 
                cLabel: 'Contact', 
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
                cMasterUrl: '' ,
                cDisplayColumn: 'contact_id,name' ,
            }, 

            PI_mk_contact_status_h_id: { 
                dataLookUp: { 
                    LookUpCd: 'GetContactStatusH'    , 
                    ColumnDB: 'contact_status_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'contact_status_cd, descs, time_edit' 
                        }, 
                cValidate :'', 
                cName: 'mk_contact_status_h_id', 
                cLabel: 'Customer Status', 
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
                cMasterUrl: '' ,
                cDisplayColumn: 'contact_status_cd, descs, time_edit' ,
            }, 

            PI_reason: { 
                cValidate :'max:255', 
                cName: 'reason', 
                cLabel: 'Reason', 
                cLabelSize: 4, 
                cOrder: 6, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_remark: { 
                cValidate :'', 
                cName:'remark', 
                cLabel:'Remark', 
                cLabelSize: 4, 
                cOrder:7, 
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
        GetMKSpecification () {
          var param = {
            subportfolio_cd: this.getDataUser().subportfolio_cd,
            module_cd: this.Module
          }

          this.FnDynamicSpec(param)
          .then(ress => {
            if (ress == null) {
              this.PI_log_book_no.cProtect = false
              this.M_MK_LogBookTest.log_book_no= ""
              this.$refs.ref_log_book_no.focus()
            }
            else {
              var data = ress.Data[0]
              this.cm_running_code_h_id_log_book = data.cm_running_code_h_id_log_book
              if (this.cm_running_code_h_id_log_book && this.cm_running_code_h_id_log_book !== "" && this.cm_running_code_h_id_log_book > 0) {
                this.PI_log_book_no.cProtect = true
                this.M_MK_LogBookTest.log_book_no= "(auto)"
              }
            }
          })
        },
        Onlog_book_dateChange (data) {
          this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              //{log_book_date}
            }
          })
          this.$forceUpdate()
        },
        Onmk_follow_up_type_idChange (data) {
          this.$nextTick(() => {
            this.M_MK_LogBookTest.mk_follow_up_type_id = data.id
            this.M_MK_LogBookTest.mk_follow_up_type_idLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{mk_follow_up_type_id}
            }
          })
          this.$forceUpdate()
        },
        Oncm_contact_idChange (data) {
          this.$nextTick(() => {
            this.M_MK_LogBookTest.cm_contact_id = data.id
            this.M_MK_LogBookTest.cm_contact_idLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{cm_contact_id}
            }
          })
          this.$forceUpdate()
        },
        Onmk_contact_status_h_idChange (data) {
          this.$nextTick(() => {
            this.M_MK_LogBookTest.mk_contact_status_h_id = data.id
            this.M_MK_LogBookTest.mk_contact_status_h_idLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{mk_contact_status_h_id}
            }
          })
          this.$forceUpdate()
        },
        OnremarkChange (data) {
          this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              //{remark}
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
          if (this.cm_running_code_h_id_log_book && this.cm_running_code_h_id_log_book != "" && this.cm_running_code_h_id_log_book > 0) {
            var param = {
              OptionFunctionCd: "GenerateRunningCodeById",
              ModuleCd: "CM",
              subportfolio_cd: this.getDataUser().subportfolio_cd,
              running_id: this.cm_running_code_h_id_log_book,
              user_input: this.getDataUser().user_id,
              date: this.getToday()
            }

            this.FnDynamicFunction(param)
            .then(ress => {
              if (ress == null) return

              var data = ress.Data[0]
              this.M_MK_LogBookTest.log_book_no = data._generate_running_code_id

                          var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                log_book_no: this.M_MK_LogBookTest.log_book_no,
                log_book_date: this.M_MK_LogBookTest.log_book_date == '' || this.M_MK_LogBookTest.log_book_date == null ? 'NULL' : this.M_MK_LogBookTest.log_book_date,
                mk_follow_up_type_id: this.M_MK_LogBookTest.mk_follow_up_type_id == '' || this.M_MK_LogBookTest.mk_follow_up_type_id == null ? 'NULL' : this.M_MK_LogBookTest.mk_follow_up_type_id,
                cm_contact_id: this.M_MK_LogBookTest.cm_contact_id == '' || this.M_MK_LogBookTest.cm_contact_id == null ? 'NULL' : this.M_MK_LogBookTest.cm_contact_id,
                mk_contact_status_h_id: this.M_MK_LogBookTest.mk_contact_status_h_id == '' || this.M_MK_LogBookTest.mk_contact_status_h_id == null ? 'NULL' : this.M_MK_LogBookTest.mk_contact_status_h_id,
                reason: this.M_MK_LogBookTest.reason,
                remark: this.M_MK_LogBookTest.remark,
                user_input: this.getDataUser().user_id,

            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return
                this.$parent.resultInsert(response.Message)
				
            })
            })
          }
          else {
                        var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                log_book_no: this.M_MK_LogBookTest.log_book_no,
                log_book_date: this.M_MK_LogBookTest.log_book_date == '' || this.M_MK_LogBookTest.log_book_date == null ? 'NULL' : this.M_MK_LogBookTest.log_book_date,
                mk_follow_up_type_id: this.M_MK_LogBookTest.mk_follow_up_type_id == '' || this.M_MK_LogBookTest.mk_follow_up_type_id == null ? 'NULL' : this.M_MK_LogBookTest.mk_follow_up_type_id,
                cm_contact_id: this.M_MK_LogBookTest.cm_contact_id == '' || this.M_MK_LogBookTest.cm_contact_id == null ? 'NULL' : this.M_MK_LogBookTest.cm_contact_id,
                mk_contact_status_h_id: this.M_MK_LogBookTest.mk_contact_status_h_id == '' || this.M_MK_LogBookTest.mk_contact_status_h_id == null ? 'NULL' : this.M_MK_LogBookTest.mk_contact_status_h_id,
                reason: this.M_MK_LogBookTest.reason,
                remark: this.M_MK_LogBookTest.remark,
                user_input: this.getDataUser().user_id,

            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return
                this.$parent.resultInsert(response.Message)
				
            })
          }

        },
        M_Update() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                mk_log_book_tes_h_id: this.M_MK_LogBookTest.mk_log_book_tes_h_id,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                log_book_no: this.M_MK_LogBookTest.log_book_no,
                log_book_date: this.M_MK_LogBookTest.log_book_date == '' || this.M_MK_LogBookTest.log_book_date == null ? 'NULL' : this.M_MK_LogBookTest.log_book_date,
                mk_follow_up_type_id: this.M_MK_LogBookTest.mk_follow_up_type_id == '' || this.M_MK_LogBookTest.mk_follow_up_type_id == null ? 'NULL' : this.M_MK_LogBookTest.mk_follow_up_type_id,
                cm_contact_id: this.M_MK_LogBookTest.cm_contact_id == '' || this.M_MK_LogBookTest.cm_contact_id == null ? 'NULL' : this.M_MK_LogBookTest.cm_contact_id,
                mk_contact_status_h_id: this.M_MK_LogBookTest.mk_contact_status_h_id == '' || this.M_MK_LogBookTest.mk_contact_status_h_id == null ? 'NULL' : this.M_MK_LogBookTest.mk_contact_status_h_id,
                reason: this.M_MK_LogBookTest.reason,
                remark: this.M_MK_LogBookTest.remark,
                lastupdatestamp: this.M_MK_LogBookTest.lastupdatestamp,
                user_edit: this.getDataUser().user_id,

            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_MK_LogBookTest = {
              mk_log_book_tes_h_id: 0,
              subportfolio_cd: this.getDataUser().subportfolio_cd,
              log_book_no: '',
              log_book_date: '',
              mk_follow_up_type_id: 0,
              follow_up_type_cd: '',
              mk_follow_up_type_id_descs: '',
              cm_contact_id: 0,
              contact_id: '',
              cm_contact_id_descs: '',
              mk_contact_status_h_id: 0,
              contact_status_cd: '',
              mk_contact_status_h_id_descs: '',
              reason: '',
              remark: '',
              row_id: 0,
              lastupdatestamp: 0,
              time_edit: '',
            }
		},
        M_New(){
          this.GetMKSpecification()

        },
        M_Edit(){
        },
        M_Delete(dt){       
			var data = this.FormToABSList().getRowSelected()  
			var dataDelete = []

			
			data.forEach((value) => {

				
				dataDelete.push({
                mk_log_book_tes_h_id: value.mk_log_book_tes_h_id,
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
                mk_log_book_tes_h_id: record.mk_log_book_tes_h_id,

            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                this.M_MK_LogBookTest = {
                  mk_log_book_tes_h_id: data.mk_log_book_tes_h_id,
                  subportfolio_cd: data.subportfolio_cd,
                  log_book_no: data.log_book_no,
                  log_book_date: data.log_book_date,
                  mk_follow_up_type_id: data.mk_follow_up_type_id,
                  follow_up_type_cd: data.follow_up_type_cd,
                  mk_follow_up_type_id_descs: data.mk_follow_up_type_id_descs,
                  cm_contact_id: data.cm_contact_id,
                  contact_id: data.contact_id,
                  cm_contact_id_descs: data.cm_contact_id_descs,
                  mk_contact_status_h_id: data.mk_contact_status_h_id,
                  contact_status_cd: data.contact_status_cd,
                  mk_contact_status_h_id_descs: data.mk_contact_status_h_id_descs,
                  reason: data.reason,
                  remark: data.remark,
                  row_id: data.row_id,
                  lastupdatestamp: record.lastupdatestamp,
                  time_edit: data.time_edit,
                }

                this.M_MK_LogBookTest.mk_follow_up_type_idLabel = this.M_MK_LogBookTest.follow_up_type_cd != null && this.M_MK_LogBookTest.follow_up_type_cd != '' ? data.follow_up_type_cd + this.separator + data.mk_follow_up_type_id_descs :'' 
                this.M_MK_LogBookTest.cm_contact_idLabel = this.M_MK_LogBookTest.contact_id != null && this.M_MK_LogBookTest.contact_id != '' ? data.contact_id + this.separator + data.cm_contact_id_descs :'' 
                this.M_MK_LogBookTest.mk_contact_status_h_idLabel = this.M_MK_LogBookTest.contact_status_cd != null && this.M_MK_LogBookTest.contact_status_cd != '' ? data.contact_status_cd + this.separator + data.mk_contact_status_h_id_descs :'' 


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

