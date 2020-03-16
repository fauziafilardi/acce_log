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
                                <b-col md="12" id="col-left"> <!-- table open -->
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_address" v-model="M_SM_MailSetup.address"  ref="ref_address"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_name" v-model="M_SM_MailSetup.name"  ref="ref_name"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_descs" v-model="M_SM_MailSetup.descs"  ref="ref_descs"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_replyto" v-model="M_SM_MailSetup.replyto"  ref="ref_replyto"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_outgoingserver" v-model="M_SM_MailSetup.outgoingserver"  ref="ref_outgoingserver"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnsslChange" :prop="PI_ssl" v-model="M_SM_MailSetup.ssl"  ref="ref_ssl" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_port" v-model="M_SM_MailSetup.port"  ref="ref_port"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_username" v-model="M_SM_MailSetup.username"  ref="ref_username"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_password" v-model="M_SM_MailSetup.password"  ref="ref_password"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_newpassword" v-model="M_SM_MailSetup.newpassword"  ref="ref_newpassword"/>
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
            FormType: "Form",
			Module:"SM",	
            IEBy: {Input: '', Edit: ''},

            M_SM_MailSetup :{
                    descs: '',
                    lastupdatestamp: 0,
                    mailaddress: '',
                    name: '',
                    outgoingserver: '',
                    password: '',
                    port: '',
                    replyto: '',
                    ssl: '',
                    useredit: this.getDataUser().user_id,
                    userinput: '',
                    username: '',
                    }
            ,					
            PI_address: { 
                cValidate :'required|max:150', 
                cName: 'address', 
                cLabel: 'Mail Address.', 
                cLabelSize: 4, 
                cOrder: 1, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_name: { 
                cValidate :'required|max:60', 
                cName: 'name', 
                cLabel: 'Name', 
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
            PI_descs: { 
                cValidate :'max:60', 
                cName: 'descs', 
                cLabel: 'Description', 
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
            PI_replyto: { 
                cValidate :'max:60', 
                cName: 'replyto', 
                cLabel: 'Reply To', 
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
            PI_outgoingserver: { 
                cValidate :'required|max:60', 
                cName: 'outgoingserver', 
                cLabel: 'Mail Server ', 
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
            PI_ssl: { 
                cValidate :'', 
                cName: 'ssl', 
                cId: 'rdbssl', 
                cRadioOptions: [{ text: 'Yes', value: '1' },{ text: 'No', value: '0' },], 
                cRadioDefaultOption: '', 
                cLabel:'SSL Enable:', 
                cLabelSize: 4, 
                cDefault: '', 
                cOrder: 6, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_port: { 
                cValidate :'', 
                cName: 'port', 
                cLabel: 'Port', 
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
            PI_username: { 
                cValidate :'required|max:60', 
                cName: 'username', 
                cLabel: 'User Name', 
                cLabelSize: 4, 
                cOrder: 8, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_password: { 
                cValidate :'', 
                cName: 'password', 
                cLabel: 'New Password ', 
                cLabelSize: 4, 
                cOrder: 9, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_newpassword: { 
                cValidate :'', 
                cName: 'newpassword', 
                cLabel: 'Confirm New Password', 
                cLabelSize: 4, 
                cOrder: 10, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
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
        OnsslChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{ssl}
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
        M_Post(dt){
        },
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                Name: this.M_SM_MailSetup.name,
                Address: this.M_SM_MailSetup.address,
                Descs: this.M_SM_MailSetup.descs,
                ReplyTo: this.M_SM_MailSetup.replyto,
                Port: this.M_SM_MailSetup.port,
                SSL: this.M_SM_MailSetup.ssl,
                Username: this.M_SM_MailSetup.username,
                OutgoingServer: this.M_SM_MailSetup.outgoingserver,
                Password: this.M_SM_MailSetup.password,
                UserInput: this.getDataUser().user_id,
                LastUpdateStamp: this.M_SM_MailSetup.lastupdatestamp                
            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return
                
                this.alertSuccess(response.Message)
                .then(() => {
                    this.getToolbar().FormStatus = 'EDIT'
                    this.getToolbar().ProcessPS()
                    this.$store.commit('setStatus', 'view')
					this.$store.commit('setEventStatus', 'Save')

                    this.FormToMasterPage().ValidasiPage()
										
					
                })
            })
        },
        M_Update() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                Name: this.M_SM_MailSetup.name,
                Address: this.M_SM_MailSetup.address,
                Descs: this.M_SM_MailSetup.descs,
                ReplyTo: this.M_SM_MailSetup.replyto,
                Port: this.M_SM_MailSetup.port,
                SSL: this.M_SM_MailSetup.ssl,
                Username: this.M_SM_MailSetup.username,
                OutgoingServer: this.M_SM_MailSetup.outgoingserver,
                Password: this.M_SM_MailSetup.password,
                UserInput: this.getDataUser().user_id,
                UserEdit: this.getDataUser().user_id ,
                LastUpdateStamp: this.M_SM_MailSetup.lastupdatestamp                
            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return

                this.alertSuccess(response.Message)
                .then(() => {
                    this.getToolbar().setButton(false)
                    this.$store.commit('setStatus', 'view')

                    this.FormToMasterPage().ValidasiPage()
					
                })
            })
        },
		M_ClearForm(){
			this.$nextTick(() => {
            this.M_SM_MailSetup = {
                    descs: '',
                    lastupdatestamp: 0,
                    mailaddress: '',
                    name: '',
                    outgoingserver: '',
                    password: '',
                    port: '',
                    replyto: '',
                    ssl: '',
                    useredit: this.getDataUser().user_id,
                    userinput: this.getDataUser().user_id,
                    username: '',
                    }
            	
		   })
		   this.$forceUpdate()	
		},
        M_New(){
          this.$refs.ref_address.focus()
        },
        M_Edit(){
          this.$refs.ref_address.focus()
        },
        M_Delete(dt){       

            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                SubPortfolioCd:this.getDataUser().subportfolio_cd,
                PortfolioCd:this.getDataUser().portfolio_cd,
                LineNo: this.$parent.data.page_order,
                Data: dt
				//,SourceValue:''
            }
            
            this.postJSONMulti( this.getUrlDeleteMulti(), param )
            .then(response => {
                if (response == null) return
				var message = "Deleting Data Successfully"   				
				//kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
				this.$parent.resultDelete(message)
				


            })
        },        
        getDataBy (record) {
          // console.log(record)
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order

            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                // console.log(data)
                 if(response.Data.length > 0){

                    // this.$store.commit('setStatus', 'EDIT')
                    this.getToolbar().FormStatus = 'EDIT'
                    this.getToolbar().ProcessPS()
this.M_SM_MailSetup = {
              descs: data.descs,
              lastupdatestamp: data.lastupdatestamp,
              address: data.mailaddress,
              name: data.name,
              outgoingserver: data.outgoingserver,
              password: data.password,
              port: data.port,
              replyto: data.replyto,
              ssl: data.ssl,
              useredit: data.useredit,
              userinput: data.userinput,
              username: data.username,
                    }
                 

         

                this.IEBy.Input = data.UserInput
                this.IEBy.Edit = data.UserEdit
                }
            else {
                    // this.$store.commit('setStatus', 'NEW')
                    this.getToolbar().FormStatus = 'NEW'
                    this.getToolbar().ProcessPS()
                }

            })
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
