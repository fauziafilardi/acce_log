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
                                        <ABSinputTextVuex :prop="PI_descs" v-model="M_SM_ReminderBilling.descs"  ref="ref_descs"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="12">
                                          <b-row>
                                            <b-col md="2" class="lbl-col-align">
                                                <label :class="inputStatus=='VIEW' ? 'lbl-view-form' : 'text-field-form'" for="">Interval (hari)</label>
                                            </b-col>
                                            <b-col md="2" style="margin-left: 10px;">
                                                <ABSTextBoxOnly :prop="PI_interval" v-model="M_SM_ReminderBilling.interval"  ref="ref_interval"/>
                                            </b-col>
                                            <b-col md="6">
                                                <label :class="inputStatus=='VIEW' ? 'lbl-view-form' : 'text-field-form'" for="">sebelum Jatuh Tempo</label>
                                            </b-col> 
                                          </b-row>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnmessageidChange" :prop="PI_messageid" :value="M_SM_ReminderBilling.messageid" :label="M_SM_ReminderBilling.messageidLabel" ref="ref_messageid"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnstatusChange" :prop="PI_status" v-model="M_SM_ReminderBilling.status"  ref="ref_status" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_SM_ReminderBilling.remarks"  ref="ref_remarks" />
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

            M_SM_ReminderBilling :{
                descs: '',
                interval: '',
                lastupdatestamp: 0,
                messageid: '',
                remarks: '',
                sequenceno: '',
                status: 'A',
                statusdescs: '',
                subject: '',
                timeedit: '',
                timeinput: '',
                useredit: this.getDataUser().user_id,
                userinput: '',
                    }
            ,
            PI_descs: { 
                cValidate :'required', 
                cName: 'descs', 
                cLabel: 'Description', 
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
            PI_interval: { 
                cValidate :'required|max:8', 
                cName: 'interval', 
                cLabel: 'Interval (hari)', 
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
            PI_messageid: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupMailSetting'    , 
                    ColumnDB: 'MailSettingCd'   , 
                    InitialWhere: "ISNULL(isSMS,'')='N'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'MailSettingCd,MailFrom' 
                        }, 
                cValidate :'', 
                cName: 'messageid', 
                cLabel: 'Pesan', 
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
                cMasterUrl: '' ,
                cDisplayColumn: 'MailSettingCd,MailFrom' ,
            }, 
            PI_status: { 
                cValidate :'required', 
                cName: 'status', 
                cId: 'rdbstatus', 
                cRadioOptions: [{ text: 'Aktif', value: 'A' },{ text: 'Tidak Aktif', value: 'N' },], 
                cRadioDefaultOption: 'A', 
                cLabel:'Status', 
                cLabelSize: 4, 
                cDefault: '', 
                cOrder: 4, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_remarks: { 
                cValidate :'', 
                cName:'remarks', 
                cLabel:'Remarks', 
                cLabelSize: 4, 
                cOrder:5, 
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
        OnmessageidChange (data) {
        this.$nextTick(() => {
            this.M_SM_ReminderBilling.messageid = data.id
            this.M_SM_ReminderBilling.messageidLabel = data.label
            if (this.inputStatus != "VIEW") {
//{messageid}
            }
        })
        this.$forceUpdate()
        },
        OnstatusChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{status}
            }
        })
        this.$forceUpdate()
        },
        OnremarksChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{remarks}
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
                Descs: this.M_SM_ReminderBilling.descs,
                Interval: this.M_SM_ReminderBilling.interval,
                MessageID: this.M_SM_ReminderBilling.messageid == '' || this.M_SM_ReminderBilling.messageid == null ? 'NULL' : this.M_SM_ReminderBilling.messageid ,
                Remarks: this.M_SM_ReminderBilling.remarks,
                Status: this.M_SM_ReminderBilling.status,
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
                SequenceNo: this.M_SM_ReminderBilling.sequenceno,
                Descs: this.M_SM_ReminderBilling.descs,
                Interval: this.M_SM_ReminderBilling.interval,
                MessageID: this.M_SM_ReminderBilling.messageid == '' || this.M_SM_ReminderBilling.messageid == null ? 'NULL' : this.M_SM_ReminderBilling.messageid ,
                Remarks: this.M_SM_ReminderBilling.remarks,
                Status: this.M_SM_ReminderBilling.status,
                UserEdit: this.getDataUser().user_id ,
                LastUpdateStamp: this.M_SM_ReminderBilling.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_SM_ReminderBilling = {
                descs: '',
                interval: '',
                lastupdatestamp: 0,
                messageid: '',
                remarks: '',
                sequenceno: '',
                status: 'A',
                statusdescs: '',
                subject: '',
                timeedit: '',
                timeinput: '',
                useredit: this.getDataUser().user_id,
                userinput: '',
                    }
            	
	
		},
        M_New(){
			this.$refs.ref_descs.focus()
        },
        M_Edit(){
            this.$refs.ref_descs.focus()
        },
        M_Delete(dt){       
			var data = this.FormToABSList().getRowSelected()  
			var dataDelete = []

			
			data.forEach((value) => {

				// console.log(data)
				dataDelete.push({
					_Message_:'',
                    SequenceNo: value.SequenceNo,
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
            // console.log(record)
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order
,                sequenceno: record.SequenceNo
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                // console.log(data)
this.M_SM_ReminderBilling = {
                descs: data.descs,
                interval: data.interval,
                lastupdatestamp: record.LastUpdateStamp,
                messageid: data.messageid,
                remarks: data.remarks,
                sequenceno: data.sequenceno,
                status: data.status,
                statusdescs: data.statusdescs,
                subject: data.subject,
                timeedit: data.timeedit,
                timeinput: data.timeinput,
                useredit: data.usereditis,
                userinput: data.userinput,
                    }
                 

                this.M_SM_ReminderBilling.messageidLabel = this.M_SM_ReminderBilling.messageid != null && this.M_SM_ReminderBilling.messageid != '' ? data.messageid + this.separator + data.subject :'' 
         

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

