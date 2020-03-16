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
                                <b-col md="12" id="col-left"> <!-- table open -->
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnmsgtypeChange" :prop="PI_msgtype" v-model="M_SM_MailSetting.msgtype"  ref="ref_msgtype" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_mailsettingcd" v-model="M_SM_MailSetting.mailsettingcd"  ref="ref_mailsettingcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_subject" v-model="M_SM_MailSetting.subject"  ref="ref_subject"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_mailfrom" v-model="M_SM_MailSetting.mailfrom"  ref="ref_mailfrom"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_cc" v-model="M_SM_MailSetting.cc"  ref="ref_cc"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_bcc" v-model="M_SM_MailSetting.bcc"  ref="ref_bcc"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnbodyChange" :prop="PI_body" v-model="M_SM_MailSetting.body"  ref="ref_body" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col md="4" style="margin-left: 198px;">
                                            <label :class="inputStatus=='VIEW' ? 'lbl-view-form' : 'text-field-form'" for="">Note : [Enter] = Enter, [Tab] = Tab</label>
                                      </b-col>
                                    </b-row>
                                </b-col> <!-- table close -->
                  
							</b-row>
							<ABSTAnalysis :prop="PTAnalysis" />
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
		Module:"SM",
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

            M_SM_MailSetting :{
                bcc: '',
                body: '',
                cc: '',
                mailfrom: '',
                mailsettingcd: '',
                msgtype: 'E',
                password: '',
                port: '',
                smtpserver: '',
                subject: '',
                timeedit: '',
                timeinput: '',
                useredit: this.getDataUser().user_id,
                userinput: '',
                lastupdatestamp: 0,
                rowid: 0,
                    }
            ,
            PI_msgtype: { 
                cValidate :'', 
                cName: 'msgtype', 
                cId: 'rdbmsgtype', 
                cRadioOptions: [{ text: 'Email', value: 'E' },{ text: 'SMS', value: 'S' },], 
                cRadioDefaultOption: 'E', 
                cLabel:'Message Type', 
                cLabelSize: 4, 
                cDefault: '', 
                cOrder: 1, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_mailsettingcd: { 
                cValidate :'required|max:5', 
                cName: 'mailsettingcd', 
                cLabel: 'Mail Setting Code ', 
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
            PI_subject: { 
                cValidate :'required', 
                cName: 'subject', 
                cLabel: 'Subject', 
                cLabelSize: 4, 
                cOrder: 3, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_mailfrom: { 
                cValidate :'', 
                cName: 'mailfrom', 
                cLabel: 'From', 
                cLabelSize: 4, 
                cOrder: 4, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_cc: { 
                cValidate :'', 
                cName: 'cc', 
                cLabel: 'CC', 
                cLabelSize: 4, 
                cOrder: 5, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_bcc: { 
                cValidate :'', 
                cName: 'bcc', 
                cLabel: 'BCC', 
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
            PI_body: { 
                cValidate :'', 
                cName:'body', 
                cLabel:'Body', 
                cLabelSize: 4, 
                cOrder:7, 
                cKey: false, 
                cDefault: '', 
                cProtect: false, 
                cVisible: true, 
                cResize: false, 
                cReadOnly: false, 
                cRows: 8, 
                cMaxRows: 8, 
                cSize: 'md', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
            }, 

			PTAnalysis: {
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cPageMasterSeq: this.data.PageMasterSeq,
                cFormPageNo: this.data.PageOrder,
				cProtect: false
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
    },
	DataRow(){
		return this.$store.getters.GetPage1Data
	},
	GetDataBy1(){
		return this.$store.getters.GetPage1GetDataBy
	}
  },
    methods: {		
        OnmsgtypeChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{msgtype}
            }
        })
        this.$forceUpdate()
        },
        OnChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{}
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
		M_CheckboxChecked(data, status, index){

        },		
        M_Post(dt){
        },
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                MailSettingCd: this.M_SM_MailSetting.mailsettingcd,
                MailFrom: this.M_SM_MailSetting.mailfrom,
                Password: this.M_SM_MailSetting.password,
                Subject: this.M_SM_MailSetting.subject,
                CC: this.M_SM_MailSetting.cc,
                BCC: this.M_SM_MailSetting.bcc,
                Body: this.M_SM_MailSetting.body,
                MsgType: this.M_SM_MailSetting.msgtype,
                UserInput: this.getDataUser().user_id                 
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
                MailSettingCd: this.M_SM_MailSetting.mailsettingcd,
                MailFrom: this.M_SM_MailSetting.mailfrom,
                Password: this.M_SM_MailSetting.password,
                Subject: this.M_SM_MailSetting.subject,
                CC: this.M_SM_MailSetting.cc,
                BCC: this.M_SM_MailSetting.bcc,
                Body: this.M_SM_MailSetting.body,
                MsgType: this.M_SM_MailSetting.msgtype,
                UserEdit: this.getDataUser().user_id ,
                LastUpdateStamp: this.M_SM_MailSetting.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_SM_MailSetting = {
                bcc: '',
                body: '',
                cc: '',
                mailfrom: '',
                mailsettingcd: '',
                msgtype: 'E',
                password: '',
                port: '',
                smtpserver: '',
                subject: '',
                timeedit: '',
                timeinput: '',
                useredit: this.getDataUser().user_id,
                userinput: '',
                lastupdatestamp: 0,
                rowid: 0,
                    }
            	
	
		},
        M_New(){
          this.$refs.ref_msgtype.focus()
        },
        M_Edit(){
          this.$refs.ref_msgtype.focus()
        },
        M_Delete(dt){       
			var data = this.FormToABSList().getRowSelected()  
			var dataDelete = []

			
			data.forEach((value) => {

				console.log(value)
				dataDelete.push({
					_Message_:'',
                    MailSettingCd: value.MailSettingCode,
                    LastUpdateStamp: value.LastUpdateStamp,


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
          console.log(record)
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order
,                mailsettingcd: record.MailSettingCd
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                var msgtypestatus = ""

                if(record.Msgtitik_Type) {
                  if(record.Msgtitik_Type == 'SMS') {
                    msgtypestatus = "S"
                  }
                  else{
                    msgtypestatus = "E"
                  }
                }
                console.log(data)
this.M_SM_MailSetting = {
                bcc: data.bcc, 
                body: data.body, 
                cc: data.cc, 
                mailfrom: data.mailfrom, 
                mailsettingcd: data.mailsettingcd, 
                msgtype: msgtypestatus, 
                password: data.password, 
                port: data.port, 
                smtpserver: data.smtpserver, 
                subject: data.subject, 
                timeedit: data.timeedit, 
                timeinput: data.timeinput, 
                useredit: data.useredit, 
                userinput: data.userinput, 
                lastupdatestamp: record.LastUpdateStamp,
                rowid: record.row_id
                }
                 

         

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

