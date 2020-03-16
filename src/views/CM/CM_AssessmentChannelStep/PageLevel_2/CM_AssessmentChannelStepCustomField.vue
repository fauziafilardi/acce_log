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
                                        <ABSinputTextVuex :prop="PI_caption" v-model="M_CM_AssessmentChannelStepCustomField.caption"  ref="ref_caption"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_score" v-model="M_CM_AssessmentChannelStepCustomField.score"  ref="ref_score"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_CM_AssessmentChannelStepCustomField.remarks"  ref="ref_remarks" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_length" v-model="M_CM_AssessmentChannelStepCustomField.length"  ref="ref_length"/>
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
    props: {PageLevel:'', TabIndex: '', data: ''},
    data() {
        return {
			ValKey:null,
            FormType: "List",
			Module:"CM",
            propList: {
                initialWhere:"FormSequenceNo = '" + this.ValKey + "'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_CM_AssessmentChannelStepCustomField :{
                fieldsequenceno: 0,
                formsequenceno: 0,
                caption: '',
                datatype: '',
                length: '0',
                score: '',
                mandatory: '',
                lookupstatus: '',
                lookuptable: '',
                lookupfield: '',
                lookupcondition: '',
                defaultdescs: '',
                defaultnumeric: '',
                defaultdate: '',
                remarks: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                lastupdatestamp: ''
                    }
            ,
            PI_caption: { 
                cValidate :'required|max:60', 
                cName: 'caption', 
                cLabel: 'Caption', 
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
            PI_score: { 
                cValidate :'required|max:60', 
                cName: 'score', 
                cLabel: ' Score', 
                cLabelSize: 4, 
                cOrder: 2, 
                cKey: false, 
                cType: 'numeric',
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
                cOrder:3, 
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
            PI_length: { 
                cValidate :'', 
                cName: 'length', 
                cLabel: 'Length', 
                cLabelSize: 4, 
                cOrder: 4, 
                cKey: false, 
                cType: 'numeric',
                cVisible: false, 
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
    },
	DataRow(){
		return this.$store.getters.GetPage2Data
	},
    DataRowPage1(){
		return this.$store.getters.GetPage1Data
	}
  },
    methods: {
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
            this.$parent.showForm = false
			
            let data = this.$store.getters.GetPage1Data
            this.M_CM_AssessmentChannelStepCustomField.formsequenceno = data.FormSequenceNo
            this.M_CM_AssessmentChannelStepCustomField.datatype = data.DataType
            this.M_CM_AssessmentChannelStepCustomField.mandatory = data.Mandatory 
            this.propList.initialWhere =" FormSequenceNo = '" + data.FormSequenceNo + "' "
        

            this.FormToABSList().doGetList('','eb_getList')
        },		       
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                FormSequenceNo: this.M_CM_AssessmentChannelStepCustomField.formsequenceno,
                Caption: this.M_CM_AssessmentChannelStepCustomField.caption,                
                DataType: 'D',
                Length: '255',
                Score: this.M_CM_AssessmentChannelStepCustomField.score == '' || this.M_CM_AssessmentChannelStepCustomField.score == null ? 0 : this.M_CM_AssessmentChannelStepCustomField.score,
                Mandatory: 'Y',
                LookupStatus: 'Y',
                LookupTable: 'WF_FormControlFieldLookup',
                LookupField: 'Descs',
                LookupCondition: this.M_CM_AssessmentChannelStepCustomField.lookupcondition,                
                DefaultDescs: this.M_CM_AssessmentChannelStepCustomField.defaultdescs,
                DefaultNumeric: this.M_CM_AssessmentChannelStepCustomField.defaultnumeric == '' ? 'NULL' : this.M_CM_AssessmentChannelStepCustomField.defaultnumeric,
                DefaultDate: this.M_CM_AssessmentChannelStepCustomField.defaultdate == '' ? 'NULL' : this.M_CM_AssessmentChannelStepCustomField.defaultnumeric,
                Remarks: this.M_CM_AssessmentChannelStepCustomField.remarks,
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
                FieldSequenceNo: this.M_CM_AssessmentChannelStepCustomField.fieldsequenceno,
                FormSequenceNo: this.M_CM_AssessmentChannelStepCustomField.formsequenceno,
                Caption: this.M_CM_AssessmentChannelStepCustomField.caption,
                DataType: 'D',
                Length: '255',
                Score: this.M_CM_AssessmentChannelStepCustomField.score == '' || this.M_CM_AssessmentChannelStepCustomField.score == null ? 0 : this.M_CM_AssessmentChannelStepCustomField.score,
                Mandatory: 'Y',
                LookupStatus: 'Y',
                LookupTable: 'WF_FormControlFieldLookup',
                LookupField: 'Descs',
                LookupCondition: this.M_CM_AssessmentChannelStepCustomField.lookupcondition,
                DefaultDescs: this.M_CM_AssessmentChannelStepCustomField.defaultdescs,
                DefaultNumeric: this.M_CM_AssessmentChannelStepCustomField.defaultnumeric == '' || this.M_CM_AssessmentChannelStepCustomField.defaultnumeric == null ? 'NULL' : this.M_CM_AssessmentChannelStepCustomField.defaultnumeric,
                DefaultDate: this.M_CM_AssessmentChannelStepCustomField.defaultdate == '' || this.M_CM_AssessmentChannelStepCustomField.defaultdate == null ? 'NULL' : this.M_CM_AssessmentChannelStepCustomField.defaultnumeric,
                Remarks: this.M_CM_AssessmentChannelStepCustomField.remarks,
                UserEdit: this.getDataUser().user_id ,
                LastUpdateStamp: this.M_CM_AssessmentChannelStepCustomField.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })

        },
		M_ClearForm(){
            this.M_CM_AssessmentChannelStepCustomField = {
                fieldsequenceno: 0,
                formsequenceno: 0,
                caption: '',
                datatype: '',
                length: '0',
                score: '',
                mandatory: '',
                lookupstatus: '',
                lookuptable: '',
                lookupfield: '',
                lookupcondition: '',
                defaultdescs: '',
                defaultnumeric: '',
                defaultdate: '',
                remarks: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                lastupdatestamp: ''
                    }
            		
		},
        M_New(){
            let data = this.$store.getters.GetPage1Data
            this.M_CM_AssessmentChannelStepCustomField.formsequenceno = data.FormSequenceNo
            this.M_CM_AssessmentChannelStepCustomField.datatype = data.DataType
            this.M_CM_AssessmentChannelStepCustomField.mandatory = data.Mandatory  

            this.$refs.ref_caption.focus()

        },
        M_Edit(){
            this.$refs.ref_caption.focus()
        },
        M_Delete(dt){           

            var data = this.FormToABSList().getRowSelected()  
        var dataDelete = []

        
        data.forEach((value) => {
          dataDelete.push({
          FormSequenceNo: value.FormSequenceNo,
          FieldSequenceNo: value.FieldSequenceNo,
          LastUpdateStamp: value.LastUpdateStamp,
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
,                fieldsequenceno: record.FieldSequenceNo,
                formsequenceno: record.FormSequenceNo				
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
this.M_CM_AssessmentChannelStepCustomField = {
                fieldsequenceno: data.fieldsequenceno,
                formsequenceno: data.formsequenceno,
                caption: data.caption,
                datatype: data.datatype,
                length: data.length,
                score: data.score,
                mandatory: data.mandatory,
                lookupstatus: data.lookupstatus,
                lookuptable: data.lookuptable,
                lookupfield: data.lookupfield,
                lookupcondition: data.lookupcondition,
                defaultdescs: data.defaultdescs,
                defaultnumeric: data.defaultnumeric,
                defaultdate: data.defaultdate,
                remarks: data.remarks,
                userinput: data.userinput,
                useredit: data.useredit,
                timeinput: data.timeinput,
                timeedit: data.timeedit,
                lastupdatestamp: record.LastUpdateStamp
                    }
                 

  

                this.IEBy.Input = data.userinput
                this.IEBy.Edit = data.useredit

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

