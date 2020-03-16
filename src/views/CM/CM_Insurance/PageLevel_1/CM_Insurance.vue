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
                                <b-col md="12" id="col-left"> <!-- table open -->
                                    <b-row>
                                      <b-col  md="6">
                                        <!-- <ABSInputSelect2 @change="OncontactidChange" :prop="PI_contactid" :value="M_CM_Insurance.contactid" ref="ref_contactid" /> -->
                                        <ABSInputSelectList @change="OncontactidChange" :prop="PI_contactid" :value="M_CM_Insurance.contactid" :label="M_CM_Insurance.contactidLabel" ref="ref_contactid"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex @input="OnreferencenoChange" :prop="PI_referenceno" v-model="M_CM_Insurance.referenceno"  ref="ref_referenceno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col  md="6">
                                            <ABSinputDateVuex @input="OnstartdateChange" :prop="PI_startdate" v-model="M_CM_Insurance.startdate"  ref="ref_startdate" />
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnstatusChange" :prop="PI_status" v-model="M_CM_Insurance.status"  ref="ref_status" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnreasoncdChange" :prop="PI_reasoncd" :value="M_CM_Insurance.reasoncd" :label="M_CM_Insurance.reasoncdLabel" ref="ref_reasoncd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex @input="OnreasondescsChange" :prop="PI_reasondescs" v-model="M_CM_Insurance.reasondescs"  ref="ref_reasondescs"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_CM_Insurance.remarks"  ref="ref_remarks" />
                                      </b-col>
                                    </b-row>
                                </b-col> <!-- table close -->
                  
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

            M_CM_Insurance :{
                contactid: '',
                referenceno: '',
                startdate: '',
                terminateby: '',
                terminatedate: '',
                reasoncd: '',
                reasondescs: '',
                status: 'A',
                remarks: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                lastupdatestamp: 0,
                cmreasondescs: '',
                contactname: '',
                rowid: 0
                    }
            ,
            PI_contactid: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMContact'    , 
                    ColumnDB: 'contact_id'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
                cName: 'contactid', 
                cLabel: 'Contact ID', 
                cKey: true, 
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
                cMasterUrl: 'CM/CM_Contact' ,
                cDisplayColumn: 'contact_id,name' ,
            }, 
            PI_referenceno: { 
                cValidate :'max:20', 
                cName: 'referenceno', 
                cLabel: 'Reference No', 
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
            PI_startdate: { 
                cValidate :'required', 
                cName: 'startdate', 
                cLabel: 'Start Date', 
                cLabelSize: 4, 
                cOrder: 3, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            }, 
            PI_status: { 
                cValidate :'', 
                cName: 'status', 
                cId: 'rdbstatus', 
                cRadioOptions: [{ text: 'Active', value: 'A' }, { text: 'Non Active', value: 'N' }], 
                cRadioDefaultOption: 'A', 
                cLabel:'Status', 
                cLabelSize: 4, 
                cOrder: 4, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_reasoncd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMReason'    , 
                    ColumnDB: 'reason_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'reasoncd', 
                cLabel: 'Reason Code', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 5, 
                cTriggered: false, 
                cDefault: '', 
                cProtect: true, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cStatic: false, 
                cOption: [], 
                cMasterUrl: 'CM/CM_Reason' ,
                cDisplayColumn: 'reason_cd,descs' ,
            }, 
            PI_reasondescs: { 
                cValidate :'max:60', 
                cName: 'reasondescs', 
                cLabel: 'Reason Description', 
                cLabelSize: 4, 
                cOrder: 6, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_remarks: { 
                cValidate :'', 
                cName:'remarks', 
                cLabel:'Remarks', 
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
	}
  },
    methods: {		
        OncontactidChange (data) {
        this.$nextTick(() => {
            this.M_CM_Insurance.contactid = data.id
            this.M_CM_Insurance.contactidLabel = data.label
            if (this.inputStatus != "VIEW") {
//{contactid}
            }
        })
        this.$forceUpdate()
        },
        OnreferencenoChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{referenceno}
            }
        })
        this.$forceUpdate()
        },
        OnstartdateChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{startdate}
            }
        })
        this.$forceUpdate()
        },
        OnstatusChange (data) {
        this.M_CM_Insurance.status = data
            this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
                if ( data == 'N') {
                    this.PI_reasoncd.cProtect = false
                    this.PI_reasondescs.cProtect = false
                    this.PI_reasoncd.cValidate = 'required'
                    this.PI_reasondescs.cValidate = 'required'

                } 
                else {
                    this.PI_reasoncd.cProtect = true
                    this.PI_reasondescs.cProtect = true
                    this.PI_reasoncd.cValidate = ''
                    this.PI_reasondescs.cValidate = ''
                    this.M_CM_Insurance.reasoncd = ""
                    this.M_CM_Insurance.reasoncdLabel = ""
                    this.M_CM_Insurance.reasondescs = ""
                }
            }
        })
        this.$forceUpdate()
        },
        OnreasoncdChange (data) {
        this.$nextTick(() => {
            this.M_CM_Insurance.reasoncd = data.id
            this.M_CM_Insurance.reasoncdLabel = data.id
            this.M_CM_Insurance.reasondescs = data.descs
            if (this.inputStatus != "VIEW") {
//{reasoncd}
            }
        })
        this.$forceUpdate()
        },
        OnreasondescsChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{reasondescs}
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
        M_Post(){
        },
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                contact_id: this.M_CM_Insurance.contactid == '' || this.M_CM_Insurance.contactid == null ? 'NULL' : this.M_CM_Insurance.contactid ,
                reference_no: this.M_CM_Insurance.referenceno,
                start_date: this.M_CM_Insurance.startdate,
                reason_cd: this.M_CM_Insurance.reasoncd == '' || this.M_CM_Insurance.reasoncd == null ? 'NULL' : this.M_CM_Insurance.reasoncd ,
                reason_descs: this.M_CM_Insurance.reasondescs,
                status: this.M_CM_Insurance.status,
                remarks: this.M_CM_Insurance.remarks,
                user_input: this.getDataUser().user_id                 
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
                contact_id: this.M_CM_Insurance.contactid == '' || this.M_CM_Insurance.contactid == null ? 'NULL' : this.M_CM_Insurance.contactid ,
                reference_no: this.M_CM_Insurance.referenceno,
                start_date: this.M_CM_Insurance.startdate,
                reason_cd: this.M_CM_Insurance.reasoncd == '' || this.M_CM_Insurance.reasoncd == null ? 'NULL' : this.M_CM_Insurance.reasoncd ,
                reason_descs: this.M_CM_Insurance.reasondescs,
                status: this.M_CM_Insurance.status,
                remarks: this.M_CM_Insurance.remarks,
                user_edit: this.getDataUser().user_id ,
                lastupdatestamp: this.M_CM_Insurance.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })

        },
		M_ClearForm(){
            this.M_CM_Insurance = {
                contactid: '',
                referenceno: '',
                startdate: '',
                terminateby: '',
                terminatedate: '',
                reasoncd: '',
                reasondescs: '',
                status: 'A',
                remarks: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                lastupdatestamp: 0,
                cmreasondescs: '',
                contactname: '',
                rowid: 0
                    }
            		
		},
        M_New(){
			this.$refs.ref_contactid.focus()
        },
        M_Edit(){
            this.$refs.ref_referenceno.focus()
        },
        M_Delete(dt){       

            var data = this.FormToABSList().getRowSelected()  
			    var dataDelete = []

			
			data.forEach((value) => {
				dataDelete.push({
                    contact_id: value.contact_id,
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
                LineNo: this.$parent.data.page_order
,               contact_id: record.contact_id
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
this.M_CM_Insurance = {
                contactid: data.contact_id,
                referenceno: data.reference_no,
                startdate: data.start_date,
                terminateby: data.terminate_by,
                terminatedate: data.terminate_date,
                reasoncd: data.reason_cd,
                reasondescs: data.reason_descs,
                status: data.status,
                remarks: data.remarks,
                userinput: data.user_input,
                useredit: data.user_edit,
                timeinput: data.time_input,
                timeedit: data.time_edit,
                lastupdatestamp: data.lastupdatestamp,
                cmreasondescs: data.contact_name,
                contactname: data.cm_reason_descs,
                rowid: data.row_idd
                    }
                 
                this.M_CM_Insurance.contactidLabel = this.M_CM_Insurance.contactid != null ? data.contact_id + this.separator + data.contact_name :'' 
                this.M_CM_Insurance.reasoncdLabel = this.M_CM_Insurance.reasoncd != null ? data.reason_cd :'' 

                if ( data.status == 'N') {
                    this.PI_reasoncd.cProtect = false
                    this.PI_reasondescs.cProtect = false
                    this.PI_reasoncd.cValidate = 'required'
                    this.PI_reasondescs.cValidate = 'required'

                } 
                else {
                    this.PI_reasoncd.cProtect = true
                    this.PI_reasondescs.cProtect = true
                    this.PI_reasoncd.cValidate = ''
                    this.PI_reasondescs.cValidate = ''
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

