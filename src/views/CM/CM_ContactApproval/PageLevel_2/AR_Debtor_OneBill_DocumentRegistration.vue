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
                                        <ABSInputSelectList @change="OndocumenttypeChange" :prop="PI_documenttype" :value="M_AR_Debtor_OneBill_DocumentRegistration.documenttype" :label="M_AR_Debtor_OneBill_DocumentRegistration.documenttypeLabel" ref="ref_documenttype"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_descs" v-model="M_AR_Debtor_OneBill_DocumentRegistration.descs"  ref="ref_descs"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_documentfilename" v-model="M_AR_Debtor_OneBill_DocumentRegistration.documentfilename"  ref="ref_documentfilename"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_AR_Debtor_OneBill_DocumentRegistration.remarks"  ref="ref_remarks" />
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
    props: {PageLevel:'', TabIndex: '', data: ''},
    data() {
        return {
			ValKey:null,
            FormType: "List",
			Module:"CM",
            propList: {
                initialWhere:"sequence_registration_no = '" + this.ValKey + "'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_AR_Debtor_OneBill_DocumentRegistration :{
                sequenceregistrationno: 0,
                sequenceno: 0,
                descs: '',
                documentfilename: '',
                remarks: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                lastupdatestamp: 0,
                controlsequenceno: 0,
                rowid: 0
                    }
            ,
            PI_documenttype: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupDocumentType'    , 
                    ColumnDB: 'document_type'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
                cName: 'documenttype', 
                cLabel: 'Document Type', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 101, 
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
                cDisplayColumn: 'document_type_cd,descs' ,
            }, 
            PI_descs: { 
                cValidate :'required|max:150', 
                cName: 'descs', 
                cLabel: 'Description', 
                cLabelSize: 4, 
                cOrder: 102, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_remarks: { 
                cValidate :'', 
                cName:'remarks', 
                cLabel:'Remarks', 
                cLabelSize: 4, 
                cOrder: 103, 
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
		return this.$store.getters.GetPage2Data
	},
    DataRowPage1(){
		return this.$store.getters.GetPage1Data
	}
  },
    methods: {
        OndocumenttypeChange (data) {
        this.$nextTick(() => {
            this.M_AR_Debtor_OneBill_DocumentRegistration.documenttype = data.id
            this.M_AR_Debtor_OneBill_DocumentRegistration.documenttypeLabel = data.label
            if (this.inputStatus != "VIEW") {
//{documenttype}
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
           this.getToolbar().statusFunction[0].disabled = true
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
            this.$parent.showForm = false
			
            let data = this.$store.getters.GetPage1Data
            this.M_AR_Debtor_OneBill_DocumentRegistration.sequenceregistrationno = data.sequence_registration_no 
            this.propList.initialWhere =" sequence_registration_no = '" + data.sequence_registration_no + "' "
        

            this.FormToABSList().doGetList('','eb_getList')
        },		       
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                sequence_registration_no: this.M_AR_Debtor_OneBill_DocumentRegistration.sequenceregistrationno,
                document_type: this.M_AR_Debtor_OneBill_DocumentRegistration.documenttype == '' || this.M_AR_Debtor_OneBill_DocumentRegistration.documenttype == null ? 'NULL' : this.M_AR_Debtor_OneBill_DocumentRegistration.documenttype ,
                descs: this.M_AR_Debtor_OneBill_DocumentRegistration.descs,
                document_file_name: this.M_AR_Debtor_OneBill_DocumentRegistration.documentfilename,
                remarks: this.M_AR_Debtor_OneBill_DocumentRegistration.remarks,
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
                sequence_registration_no: this.M_AR_Debtor_OneBill_DocumentRegistration.sequenceregistrationno,
                sequence_no: this.M_AR_Debtor_OneBill_DocumentRegistration.sequenceno,
                document_type: this.M_AR_Debtor_OneBill_DocumentRegistration.documenttype == '' || this.M_AR_Debtor_OneBill_DocumentRegistration.documenttype == null ? 'NULL' : this.M_AR_Debtor_OneBill_DocumentRegistration.documenttype ,
                descs: this.M_AR_Debtor_OneBill_DocumentRegistration.descs,
                document_file_name: this.M_AR_Debtor_OneBill_DocumentRegistration.documentfilename,
                remarks: this.M_AR_Debtor_OneBill_DocumentRegistration.remarks,
                user_edit: this.getDataUser().user_id ,
                lastupdatestamp: this.M_AR_Debtor_OneBill_DocumentRegistration.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_AR_Debtor_OneBill_DocumentRegistration = {
                sequenceregistrationno: 0,
                sequenceno: 0,
                descs: '',
                documentfilename: '',
                remarks: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                lastupdatestamp: 0,
                controlsequenceno: 0,
                rowid: 0
                    }
            		
		},
        M_New(){
            let data = this.$store.getters.GetPage1Data
            this.M_AR_Debtor_OneBill_DocumentRegistration.sequenceregistrationno = data.sequence_registration_no 

            this.$refs.ref_documenttype.focus()

        },
        M_Edit(){
            this.$refs.ref_descs.focus()
        },
        M_Delete(dt){           

           var data = this.FormToABSList().getRowSelected()  
			var dataDelete = []

			
			data.forEach((value) => {	
                console.log(value)		
				dataDelete.push({
                // contact_id: value.contact_id,
                // document_type: value.document_type,
                // document_file_name: value.document_file_name,
                // sequence_no: value.sequence_no,
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
,                sequence_registration_no: record.sequence_registration_no,
                document_type: record.document_type,
                sequence_no: record.sequence_no				
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
this.M_AR_Debtor_OneBill_DocumentRegistration = {
                sequenceregistrationno: data.sequence_registration_no,
                sequenceno: data.sequence_no,
                descs: data.descs,
                documentfilename: data.document_file_name,
                remarks: data.remarks,
                userinput: data.user_input,
                useredit: data.user_edit,
                timeinput: data.time_input,
                timeedit: data.time_edit,
                lastupdatestamp: record.lastupdatestamp,
                controlsequenceno: data.control_sequence_no,
                rowid: data.row_id
                    }
                 

                this.M_AR_Debtor_OneBill_DocumentRegistration.documenttypeLabel = this.M_AR_Debtor_OneBill_DocumentRegistration.documenttype != null ? data.document_type + this.separator  :'' 
  

                this.IEBy.Input = data.user_input
                this.IEBy.Edit = data.user_edit

            })
        }
		
    },
    created: function() {
    },
    beforeMount: function() {
    },
    mounted: function() {
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

