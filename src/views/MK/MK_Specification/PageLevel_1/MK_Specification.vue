<template>
    <div>
        <div :style="'margin-top:10px;'" class="el" mousetip mousetip-msg="I'm a tooltip">
            <div class="div-collapse" v-b-toggle.collapse1>
                <span class="master-span" v-show="IEBy.Input && IEBy.Edit">
                    Input By : {{IEBy.Input}} | Edit By : {{IEBy.Edit}} <font-awesome-icon icon="sort-down" class="icon-style-1__master" /> 
                </span>
            </div>
            <b-collapse id="collapse1" :visible="true">
                <b-row  style="padding-left: 10px; padding-bottom: 10px; !important;">              
                    <b-col md="12" id="col-left" class="bColMasterForm">
                        <b-form :data-vv-scope="'FormScope_' + PageLevel + '_' + TabIndex" :data-vv-value-path="'FormScope_' + PageLevel + '_' + TabIndex">
                            <b-row  style="padding-left: 10px; padding-bottom: 10px; !important;">              
                                <b-col md="12" id="col-left">
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_maxdailypoint" v-model="M_MK_Specification.maxdailypoint" ref="ref_maxdailypoint"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col md="6">
                                        <ABSinputCheckBox @input="OnworkdaysChange" :prop="PI_workdays" v-model="M_MK_Specification.workdays"  ref="ref_workdays" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OncontactdaysapprovalChange" :prop="PI_contactdaysapproval" v-model="M_MK_Specification.contactdaysapproval"  ref="ref_contactdaysapproval" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnautoassignChange" :prop="PI_autoassign" v-model="M_MK_Specification.autoassign"  ref="ref_autoassign" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_maxchangedays" v-model="M_MK_Specification.maxchangedays" ref="ref_maxchangedays" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_targetcustomer" v-model="M_MK_Specification.targetcustomer" ref="ref_targetcustomer" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_targetnewprospect" v-model="M_MK_Specification.targetnewprospect" ref="ref_targetnewcustomer" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_targetdealprospect" v-model="M_MK_Specification.targetdealprospect" ref="ref_targetdealcustomer" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_targetsalesvalue" v-model="M_MK_Specification.targetsalesvalue" ref="ref_targetsalesvalue" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OncustquotationrunningcdChange" :prop="PI_custquotationrunningcd" :value="M_MK_Specification.custquotationrunningcd" :label="M_MK_Specification.custquotationrunningcdLabel" ref="ref_custquotationrunningcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnlogbookrunningcdChange" :prop="PI_logbookrunningcd" :value="M_MK_Specification.logbookrunningcd" :label="M_MK_Specification.logbookrunningcdLabel" ref="ref_logbookrunningcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OncustomerrequestrunningcdChange" :prop="PI_customerrequestrunningcd" :value="M_MK_Specification.customerrequestrunningcd" :label="M_MK_Specification.customerrequestrunningcdLabel" ref="ref_customerrequestrunningcd"/>
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
            FormType: "Form",
			Module:"MK",

            M_MK_Specification :{
                rowid: 0,
                subportfoliocode: this.getDataUser().subportfolio_cd,
                maxdailypoint: '',
                workdays: [],
                contactdaysapproval: '',
                autoassign: '',
                maxchangedays: '',
                custquotationrunningcd: '',
                custquotationdescs: '',
                logbookrunningcd: '',
                customerrequestrunningcd: '',
                customerrequestrunningcdLabel: '',
                logbookdescs: '',
                targetcustomer: '',
                targetnewprospect: '',
                targetdealprospect: '',
                targetsalesvalue: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                lastupdatestamp: 0,
                    }
            ,			
            IEBy: {Input: '', Edit: ''},

            PI_maxdailypoint: {
                cValidate :'', 
                cName: 'maxdailypoint', 
                cLabel: 'Maximum Daily Point', 
                cLabelSize: 4, 
                cOrder: 1, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex   
            },
            PI_workdays: {
                cValidate :'', 
                cName: 'workdays', 
                cOptions: [{ text: 'Monday', value: 'M' }, { text: 'Tuesday', value: 'T' }, { text: 'Wednesday', value: 'W' }, { text: 'Thursday', value: 'H' }, { text: 'Friday', value: 'F' }, { text: 'Saturday', value: 'S' }, { text: 'Sunday', value: 'U' }],
                cLabel:'Work Days', 
                cLabelSize: 4, 
                cOrder: 2, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_contactdaysapproval: { 
                cValidate :'', 
                cName: 'contactdaysapproval', 
                cId: 'rdbcontactdaysapproval', 
                cRadioOptions: [{ text: 'Yes', value: 'Y' }, { text: 'No', value: 'N' }], 
                cLabel:'Contact Days Approval', 
                cLabelSize: 4, 
                cOrder: 3, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_autoassign: {
                cValidate :'', 
                cName: 'autoassign', 
                cId: 'rdbautoassign', 
                cRadioOptions: [{ text: 'Yes', value: 'Y' }, { text: 'No', value: 'N' }], 
                cRadioDefaultOption: '', 
                cLabel:'Auto Assign', 
                cLabelSize: 4, 
                cOrder: 4, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex   
            },
            PI_maxchangedays: {
              cValidate :'', 
                cName: 'maxchangedays', 
                cLabel: 'Max Change Days', 
                cLabelSize: 4, 
                cOrder: 5, 
                cKey: true, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex   
            },
            PI_targetcustomer: {
              cValidate :'', 
                cName: 'targetcustomer', 
                cLabel: 'Target Customer', 
                cLabelSize: 4, 
                cOrder: 6, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex   
            },
            PI_targetnewprospect: {
                cValidate :'', 
                cName: 'targetnewprospect', 
                cLabel: 'Target New Prospect', 
                cLabelSize: 4, 
                cOrder: 7, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex   
            },
            PI_targetdealprospect: {
              cValidate :'', 
                cName: 'targetdealprospect', 
                cLabel: 'Target Deal Prospect', 
                cLabelSize: 4, 
                cOrder: 8, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex   
            },
            PI_targetsalesvalue: {
              cValidate :'', 
                cName: 'targetsalesvalue', 
                cLabel: 'Target Sales Value', 
                cLabelSize: 4, 
                cOrder: 9, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex   
            },
            PI_custquotationrunningcd: {
              dataLookUp: { 
                    LookUpCd: 'GetLookupCMRunningCode'    , 
                    ColumnDB: 'running_cd'   , 
                    InitialWhere: "(module_cd is null OR module_cd = 'MK')"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'custquotationrunningcd', 
                cLabel: 'Customer Quotation Running Code', 
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
                cMasterUrl: 'CM/CM_RunningCd' ,
                cDisplayColumn: 'running_cd,descs' ,
            },
            PI_logbookrunningcd: {
              dataLookUp: { 
                    LookUpCd: 'GetLookupCMRunningCode'    , 
                    ColumnDB: 'running_cd'   , 
                    InitialWhere: "(module_cd is null OR module_cd = 'MK')"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'logbookrunningcd', 
                cLabel: 'Log Book Running Code', 
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
                cMasterUrl: 'CM/CM_RunningCd' ,
                cDisplayColumn: 'running_cd,descs' ,
            },
            PI_customerrequestrunningcd: {
              dataLookUp: { 
                    LookUpCd: 'GetLookupCMRunningCode'    , 
                    ColumnDB: 'running_cd'   , 
                    InitialWhere: "(module_cd is null OR module_cd = 'MK')"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'customerrequestrunningcd', 
                cLabel: 'Customer Request Running Code', 
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
                cMasterUrl: 'CM/CM_RunningCd' ,
                cDisplayColumn: 'running_cd,descs' ,
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
        OnworkdaysChange (data) {
            this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{workdays}
            }
        })
        this.$forceUpdate()
        },
        OncontactdaysapprovalChange (data) {
            this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{contactdaysapproval}
            }
        })
        this.$forceUpdate()
        },
        OnautoassignChange (data) {
            this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{autoassign}
            }
        })
        this.$forceUpdate()
        },
        OncustquotationrunningcdChange (data) {
            this.$nextTick(() => {
                this.M_MK_Specification.custquotationrunningcd = data.id
                this.M_MK_Specification.custquotationrunningcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{custquotationrunningcd}
            }
        })
        this.$forceUpdate()
        },
        OnlogbookrunningcdChange (data) {
            this.$nextTick(() => {
                this.M_MK_Specification.logbookrunningcd = data.id
                this.M_MK_Specification.logbookrunningcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{logbookrunningcd}
            }
        })
        this.$forceUpdate()
        },
        OncustomerrequestrunningcdChange (data) {
            this.$nextTick(() => {
                this.M_MK_Specification.customerrequestrunningcd = data.id
                this.M_MK_Specification.customerrequestrunningcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{logbookrunningcd}
            }
        })
        this.$forceUpdate()
        },
		setToolbarButton () {
           //this.getToolbar().statusFunction[4].disabled = false
		},		
        M_Post(){            
        },
        M_Refresh(){
        },
        M_New(){            
        },
        M_Edit(){
            this.$refs.ref_maxdailypoint.focus()
        },
        M_Delete(dt){
            var data = this.FormToABSList().getRowSelected()
            var dataDelete = []

            data.forEach((value) => {
                dataDelete.push({
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
        M_Insert () {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                subportfolio_code: this.getDataUser().subportfolio_cd,
                max_daily_point: this.M_MK_Specification.maxdailypoint,
                wd_monday: this.M_MK_Specification.workdays.indexOf('M') >= 0 ? 'Y' : 'N',
                wd_tuesday: this.M_MK_Specification.workdays.indexOf('T') >= 0 ? 'Y' : 'N',
                wd_wednesday: this.M_MK_Specification.workdays.indexOf('W') >= 0 ? 'Y' : 'N',
                wd_thursday: this.M_MK_Specification.workdays.indexOf('H') >= 0 ? 'Y' : 'N',
                wd_friday: this.M_MK_Specification.workdays.indexOf('F') >= 0 ? 'Y' : 'N',
                wd_saturday: this.M_MK_Specification.workdays.indexOf('S') >= 0 ? 'Y' : 'N',
                wd_sunday: this.M_MK_Specification.workdays.indexOf('U') >= 0 ? 'Y' : 'N',
                contact_days_approval: this.M_MK_Specification.contactdaysapproval,
                auto_assign: this.M_MK_Specification.autoassign,
                max_change_days: this.M_MK_Specification.maxchangedays,
                cm_running_code_h_id_quotation: this.M_MK_Specification.custquotationrunningcd == '' || this.M_MK_Specification.custquotationrunningcd == null ? 'NULL' : this.M_MK_Specification.custquotationrunningcd,
                cm_running_code_h_id_log_book: this.M_MK_Specification.logbookrunningcd == '' || this.M_MK_Specification.logbookrunningcd == null ? 'NULL' : this.M_MK_Specification.logbookrunningcd,
                mk_running_code_customer_request: this.M_MK_Specification.customerrequestrunningcd == '' || this.M_MK_Specification.customerrequestrunningcd == null ? 'NULL' : this.M_MK_Specification.customerrequestrunningcd,
                target_customer: this.M_MK_Specification.targetcustomer,
                target_new_prospect: this.M_MK_Specification.targetnewprospect,
                target_deal_prospect: this.M_MK_Specification.targetdealprospect,
                target_sales_value: this.M_MK_Specification.targetsalesvalue,
                user_id: this.getDataUser().user_id        
            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return
                this.getToolbar().FormStatus = 'EDIT'
                this.getToolbar().ProcessPS()
                this.$parent.resultInsert(response.Message)
            })
        },
        M_Update () {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                mk_specification_id: this.M_MK_Specification.rowid,
                subportfolio_code: this.getDataUser().subportfolio_cd,
                max_daily_point: this.M_MK_Specification.maxdailypoint,
                wd_monday: this.M_MK_Specification.workdays.indexOf('M') >= 0 ? 'Y' : 'N',
                wd_tuesday: this.M_MK_Specification.workdays.indexOf('T') >= 0 ? 'Y' : 'N',
                wd_wednesday: this.M_MK_Specification.workdays.indexOf('W') >= 0 ? 'Y' : 'N',
                wd_thursday: this.M_MK_Specification.workdays.indexOf('H') >= 0 ? 'Y' : 'N',
                wd_friday: this.M_MK_Specification.workdays.indexOf('F') >= 0 ? 'Y' : 'N',
                wd_saturday: this.M_MK_Specification.workdays.indexOf('S') >= 0 ? 'Y' : 'N',
                wd_sunday: this.M_MK_Specification.workdays.indexOf('U') >= 0 ? 'Y' : 'N',
                contact_days_approval: this.M_MK_Specification.contactdaysapproval,
                auto_assign: this.M_MK_Specification.autoassign,
                max_change_days: this.M_MK_Specification.maxchangedays,
                cm_running_code_h_id_quotation: this.M_MK_Specification.custquotationrunningcd == '' || this.M_MK_Specification.custquotationrunningcd == null ? 'NULL' : this.M_MK_Specification.custquotationrunningcd,
                cm_running_code_h_id_log_book: this.M_MK_Specification.logbookrunningcd == '' || this.M_MK_Specification.logbookrunningcd == null ? 'NULL' : this.M_MK_Specification.logbookrunningcd,
                mk_running_code_customer_request: this.M_MK_Specification.customerrequestrunningcd == '' || this.M_MK_Specification.customerrequestrunningcd == null ? 'NULL' : this.M_MK_Specification.customerrequestrunningcd,
                target_customer: this.M_MK_Specification.targetcustomer,
                target_new_prospect: this.M_MK_Specification.targetnewprospect,
                target_deal_prospect: this.M_MK_Specification.targetdealprospect,
                target_sales_value: this.M_MK_Specification.targetsalesvalue,
                user_edit: this.getDataUser().user_id,
                lastupdatestamp: this.M_MK_Specification.lastupdatestamp,
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return
                this.getToolbar().FormStatus = 'EDIT'
                this.getToolbar().ProcessPS()
                this.$parent.resultUpdate(response.Message)
            })			
        },
        paramFromParent(){
        },
        rowLink: function(url){
        },
        getDataBy () {
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order
            }            

            this.postJSON( this.getUrlById(), param )
                .then( response => {

                if(response == null) return
                var data = response.Data[0]
                // console.log(data);

                if(response.Data.length > 0){
                    // this.$store.commit('setStatus', 'EDIT')
                    this.getToolbar().FormStatus = 'EDIT'
                    this.getToolbar().ProcessPS()

                    var workdd = []

                    if (data.wd_monday == 'Y'){
                        workdd.push('M')
                    }
                    if (data.wd_tuesday == 'Y'){
                        workdd.push('T')
                    }
                    if (data.wd_wednesday == 'Y'){
                        workdd.push('W')
                    }
                    if (data.wd_thursday == 'Y'){
                        workdd.push('H')
                    }
                    if (data.wd_friday == 'Y'){
                        workdd.push('F')
                    }
                    if (data.wd_saturday == 'Y'){
                        workdd.push('S')
                    }
                    if (data.wd_sunday == 'Y'){
                        workdd.push('U')
                    }
                    
                this.M_MK_Specification = {
                    rowid: data.mk_specification_id,
                    subportfoliocode: data.subportfolio_code,
                    maxdailypoint: data.max_daily_point,
                    workdays: workdd,
                    contactdaysapproval: data.contact_days_approval,
                    autoassign: data.auto_assign,
                    maxchangedays: data.max_change_days,
                    custquotationrunningcd: data.cm_running_code_h_id_quotation,
                    custquotationdescs: data.cust_quotation_descs,
                    logbookrunningcd: data.cm_running_code_h_id_log_book,
                    customerrequestrunningcd: data.mk_running_code_customer_request,
                    logbookdescs: data.log_book_descs,
                    targetcustomer: data.target_customer,
                    targetnewprospect: data.target_new_prospect,
                    targetdealprospect: data.target_deal_prospect,
                    targetsalesvalue: data.target_sales_value,
                    userinput: data.user_input,
                    useredit: data.user_edit,
                    timeinput: data.time_input,
                    timeedit: data.time_edit,
                    lastupdatestamp: data.lastupdatestamp,
                }   

                    this.M_MK_Specification.custquotationrunningcdLabel = this.M_MK_Specification.custquotationrunningcd != null && this.M_MK_Specification.custquotationrunningcd != "" ? data.cust_quotation_running_cd + this.separator + data.cust_quotation_descs :'' 
                    this.M_MK_Specification.logbookrunningcdLabel = this.M_MK_Specification.logbookrunningcd != null && this.M_MK_Specification.logbookrunningcd != "" ? data.log_book_running_cd + this.separator + data.log_book_descs :'' 
                    this.M_MK_Specification.customerrequestrunningcdLabel = this.M_MK_Specification.customerrequestrunningcd != null && this.M_MK_Specification.customerrequestrunningcd != "" ? data.customer_request_cd + this.separator + data.customer_request_cd_descs :'' 

                    this.IEBy.Input = data.user_input 
                    this.IEBy.Edit = data.user_edit
                }
                else {
                    // this.$store.commit('setStatus', 'NEW')
                    this.getToolbar().FormStatus = 'NEW'
                    this.getToolbar().ProcessPS()
                }
            })
        },
        setToolbarButton () {            
        }
    },
    beforeCreate: function () {
    },
    created: function() {
        this.$store.commit('setFormType','Form')
        // this.isDetail = true
    },
    beforeMount: function() {
    },
    mounted: function() {
        this.getDataBy()
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
