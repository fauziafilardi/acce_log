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
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_logbookno" v-model="M_MK_LogBookH.logbookno" ref="ref_logbookno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputDateVuex @input="OnlogbookdateChange" :prop="PI_logbookdate" v-model="M_MK_LogBookH.logbookdate"  ref="ref_logbookdate" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnfollowuptypeChange" :prop="PI_followuptype" :value="M_MK_LogBookH.followuptype" :label="M_MK_LogBookH.followuptypeLabel" ref="ref_followuptype"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OncontactidChange" :prop="PI_contactid" :value="M_MK_LogBookH.contactid" :label="M_MK_LogBookH.contactidLabel" ref="ref_contactid"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OncontactstatusChange" :prop="PI_contactstatus" :value="M_MK_LogBookH.contactstatus" :label="M_MK_LogBookH.contactstatusLabel" ref="ref_contactstatus"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_reason" v-model="M_MK_LogBookH.reason"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_MK_LogBookH.remarks"  ref="ref_remarks" />
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
		FormType: "List",
		Module:"MK",
            propList: {
                initialWhere: "",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex,
                OrderBy: '',
                SourceField: ''
            },
       
            IEBy: {Input: '', Edit: ''},
            RunningCdLogBook:'',   			

            M_MK_LogBookH :{
                logbookno:'',
                logbookdate:'',
                followuptype:'',
                contactid:'',
                contactstatus:'',
                reason:'',
                remarks:'',
                lastupdatestamp: '',
                mk_log_book_h_id: '',
                user_edit:'',
                user_input:''
            },

            PI_logbookno: { 
                cValidate :'required', 
                cName:'logbookno', 
                cLabel:'Log Book No.', 
                cOrder:1, 
                cKey:true,
                cProtect:false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
                cType: 'text' 
            }, 
            PI_logbookdate: { 
                cValidate :'', 
                cName: 'logbookdate', 
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
            PI_followuptype: { 
                dataLookUp: { 
                    LookUpCd: 'GetFollowUpType'    , 
                    ColumnDB: 'follow_up_type_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
                cName: 'followuptype', 
                cLabel: 'Follow Up Type', 
                cKey: false, 
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
                cMasterUrl: 'MK/MK_FollowUpType' ,
                cDisplayColumn: 'follow_up_type_cd,descs' ,
            },
            PI_contactid: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMContact'    , 
                    ColumnDB: 'contact_id'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
                cName: 'contactid', 
                cLabel: 'Customer', 
                cKey: false, 
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
                cMasterUrl: '' ,
                cDisplayColumn: 'contact_id,name' ,
            },
            PI_contactstatus: { 
                dataLookUp: { 
                    LookUpCd: 'GetContactStatusH'    , 
                    ColumnDB: 'contact_status_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
                cName: 'contactstatus', 
                cLabel: 'Customer Status', 
                cKey: false, 
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
                cMasterUrl: '' ,
                cDisplayColumn: 'contact_status_cd,descs' ,
            },
             PI_reason: { 
                cValidate :'', 
                cName:'reason', 
                cLabel:'Reason', 
                cOrder:1, 
                cKey:true,
                cProtect:false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
                cType: 'text' 
            },
            PI_remarks: { 
                cValidate :'', 
                cName:'remarks', 
                cLabel:'Remarks', 
                cLabelSize: 4, 
                cOrder:14, 
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
    }
  },
    methods: {
        GetLogBookRunningCd (){
            var param = {
            OptionFunctionCd: "GetMkSpecification",
            ModuleCd: this.Module            
          }

          this.FnDynamicFunction(param)
            .then(ress => {
              console.log(ress)
              // if(ress == null) return
              var data = ress.Data[0]
              console.log(data)
              if (ress != null){
                this.RunningCdLogBook = data.cm_running_code_h_id_log_book
                if(this.RunningCdLogBook != ""){
                  this.PI_logbookno.cProtect = true
                  this.M_MK_LogBookH.logbookno = "(auto)"
                  this.$refs.ref_logbookno.focus()
                } 
              } else {
                this.PI_logbookno.cProtect = false
                this.M_MK_LogBookH.logbookno = ""
                this.$refs.ref_logbookno.focus()
              }            
            })
        },
        OnfollowuptypeChange (data) {
            this.$nextTick(() => {
                this.M_MK_LogBookH.followuptype = data.mk_follow_up_type_id
                this.M_MK_LogBookH.followuptypeLabel = data.label
                if (this.inputStatus != "VIEW") {

                }
            })
            this.$forceUpdate()
        },
        OncontactidChange (data) {
            this.$nextTick(() => {      
                this.M_MK_LogBookH.contactid = data.cm_contact_id
                this.M_MK_LogBookH.contactidLabel = data.label          
                if (this.inputStatus != "VIEW") {

                }
            })
            this.$forceUpdate()
        },
        OncontactstatusChange (data) {
            this.$nextTick(() => {
                this.M_MK_LogBookH.contactstatus = data.mk_contact_status_h_id
                this.M_MK_LogBookH.contactstatusLabel = data.label
                if (this.inputStatus != "VIEW") {

                }
            })
            this.$forceUpdate()
        },		
	
		setToolbarButton () {
            //    this.getToolbar().statusFunction[1].disabled = false
            //    this.getToolbar().statusFunction[2].disabled = false
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
        M_Post(){
        },
        M_Refresh(){
        },
        M_ClearForm(){
            this.M_MK_LogBookH ={
                contactstatush: '',
                description: ''                
            }
        },
        M_New () {
           this.GetLogBookRunningCd()
        },
        M_Edit(){
            // this.$refs.ref_PeriodDate.focus()
            //this.$nextTick().then(() => document.getElementById("???").focus())
        },
        M_Delete (dt) {
            var data = this.FormToABSList().getRowSelected()  
            var dataDelete = []
            
            data.forEach((value) => {
            dataDelete.push({
            mk_log_book_h_id: value.row_id,
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
        M_Insert () {
            if(this.RunningCdLogBook != ''){
                var param = {
                    OptionFunctionCd: "GenerateRunningCodeById",
                    ModuleCd: "CM",
                    subportfolio_cd: this.getDataUser().subportfolio_cd,
                    running_id: this.RunningCdLogBook,
                    user_input: this.getDataUser().user_id,
                    date: this.getToday() 
                }

                this.FnDynamicFunction(param)
              .then(ress => {
                  var data = ress.Data[0]
                  console.log(data)
                  if (ress != null){
                      this.M_MK_LogBookH.logbookno = data._generate_running_code_id
                      var param = {
                        OptionSeq: this.getOptionSeq().OptionSeq,
                        LineNo: this.$parent.data.page_order,
                        subportfolio_cd: this.getDataUser().subportfolio_cd,
                        log_book_no: this.M_MK_LogBookH.logbookno,
                        log_book_date: this.M_MK_LogBookH.logbookdate,
                        mk_follow_up_type_id: this.M_MK_LogBookH.followuptype,
                        cm_contact_id: this.M_MK_LogBookH.contactid,
                        mk_contact_status_h_id: this.M_MK_LogBookH.contactstatus,
                        reason: this.M_MK_LogBookH.reason,
                        remark: this.M_MK_LogBookH.remarks,
                        user_input: this.getDataUser().user_id
                      }
                      this.postJSON(this.getUrlInsert(), param)
                        .then((response) => {
                            if(response == null) return
                            //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                            this.$parent.resultInsert(response.Message)
                        })
                  }else{
                    var param = {
                        OptionSeq: this.getOptionSeq().OptionSeq,
                        LineNo: this.$parent.data.page_order,
                        subportfolio_cd: this.getDataUser().subportfolio_cd,
                        log_book_no: this.M_MK_LogBookH.logbookno,
                        log_book_date: this.M_MK_LogBookH.logbookdate,
                        mk_follow_up_type_id: this.M_MK_LogBookH.followuptype,
                        cm_contact_id: this.M_MK_LogBookH.contactid,
                        mk_contact_status_h_id: this.M_MK_LogBookH.contactstatus,
                        reason: this.M_MK_LogBookH.reason,
                        remark: this.M_MK_LogBookH.remarks,
                        user_input: this.getDataUser().user_id
                      }
                      this.postJSON(this.getUrlInsert(), param)
                        .then((response) => {
                            if(response == null) return
                            //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                            this.$parent.resultInsert(response.Message)
                        })
                  }
              })
            } 
        },
        M_Update () {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                log_book_no: this.M_MK_LogBookH.logbookno,
                log_book_date: this.M_MK_LogBookH.logbookdate,
                mk_follow_up_type_id: this.M_MK_LogBookH.followuptype,
                cm_contact_id: this.M_MK_LogBookH.contactid,
                mk_contact_status_h_id: this.M_MK_LogBookH.contactstatus,
                reason: this.M_MK_LogBookH.reason,
                remark: this.M_MK_LogBookH.remarks,
                user_edit: this.getDataUser().user_id,
                mk_log_book_h_id: this.M_MK_LogBookH.mk_log_book_h_id,                
                lastupdatestamp: this.M_MK_LogBookH.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return
                this.$parent.resultUpdate(response.Message)
            })
        },
        M_Cancel() {},
        paramFromParent(){
        },
        rowClicked (record, index) {
        },
        doDoubleClick(){
        },		
        rowLink: function(url){            
        },
        getDataBy (record) {
            console.log(record)
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                mk_log_book_id: record.row_id 
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                console.log(data)
                this.M_MK_LogBookH ={
                    logbookno: data.log_book_no,
                    logbookdate: data.log_book_date,
                    followuptype: data.mk_follow_up_type_id,
                    contactid: data.cm_contact_id,
                    contactstatus: data.mk_contact_status_h_id,
                    reason: data.reason,
                    remarks: data.remark,
                    subportfolio_cd: data.subportfolio_cd,                    
                    lastupdatestamp: record.lastupdatestamp,
                    mk_contact_status_h_id: record.row_id,
                    user_edit: data.user_edit,
                    mk_log_book_h_id: record.row_id
                }

                this.M_MK_LogBookH.followuptypeLabel = this.M_MK_LogBookH.followuptype != null ? data.follow_up_type_cd + this.separator + data.follow_up_descs :'' 
                this.M_MK_LogBookH.contactidLabel = this.M_MK_LogBookH.contactid != null ? data.contact_id + this.separator + data.customer_name :''
                this.M_MK_LogBookH.contactstatusLabel = this.M_MK_LogBookH.contactstatus != null ? data.contact_status_cd + this.separator + data.contact_status_descs :''  

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

