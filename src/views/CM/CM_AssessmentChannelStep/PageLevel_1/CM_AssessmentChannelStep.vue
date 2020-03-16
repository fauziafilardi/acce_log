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
                                        <ABSInputSelectList @change="OnassessmentcdChange" :prop="PI_assessmentcd" :value="M_CM_AssessmentChannelStep.assessmentcd" :label="M_CM_AssessmentChannelStep.assessmentcdLabel" ref="ref_assessmentcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_descs" v-model="M_CM_AssessmentChannelStep.descs"  ref="ref_descs"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnmandatoryChange" :prop="PI_mandatory" v-model="M_CM_AssessmentChannelStep.mandatory"  ref="ref_mandatory" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_sortsequenceno" v-model="M_CM_AssessmentChannelStep.sortsequenceno"  ref="ref_sortsequenceno"/>
                                      </b-col>
                                    </b-row>
                                    <!-- <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnparentsequencenoChange" :prop="PI_parentsequenceno" :value="M_CM_AssessmentChannelStep.parentsequenceno" :label="M_CM_AssessmentChannelStep.parentsequencenoLabel" ref="ref_parentsequenceno"/>
                                      </b-col>
                                    </b-row> -->
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
		Module:"CM",
            propList: {
                initialWhere: "WorkFlowType= 'S'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_CM_AssessmentChannelStep :{
                assessmentcd: '',
                formsequenceno: 0,
                descs: '',
                mandatory: 'Y',
                parentsequenceno: 0,
                sortsequenceno: '1',
                timeedit: '',
                remarks:'',
                lastupdatestamp: 0
                    }
            ,
            PI_assessmentcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetAssessmentCd'    , 
                    ColumnDB: 'AssessmentCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
                cName: 'assessmentcd', 
                cLabel: 'Assessment Code', 
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
                cMasterUrl: '' ,
                cDisplayColumn: 'AssessmentCd,Descs' ,
            }, 
            PI_descs: { 
                cValidate :'required|max:255', 
                cName: 'descs', 
                cLabel: 'Description', 
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
            PI_mandatory: { 
                cValidate :'', 
                cName: 'mandatory', 
                cId: 'rdbmandatory', 
                cRadioOptions: [{ text: 'Yes', value: 'Y' },{ text: 'No', value: 'N' },], 
                cRadioDefaultOption: 'Y', 
                cLabel:'Mandatory', 
                cLabelSize: 4, 
                cOrder: 3, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_sortsequenceno: { 
                cValidate :'required|max:15', 
                cName: 'sortsequenceno', 
                cLabel: 'Sort Sequence No', 
                cLabelSize: 4, 
                cOrder: 4, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            // PI_parentsequenceno: { 
            //     dataLookUp: { 
            //         LookUpCd: 'xxx'    , 
            //         ColumnDB: 'xxx'   , 
            //         InitialWhere: ""   , 
            //         ParamWhere: ''  
            //             }, 
            //     cValidate :'', 
            //     cName: 'parentsequenceno', 
            //     cLabel: 'Parent Sequence No', 
            //     cKey: false, 
            //     cLabelSize: 4, 
            //     cOrder: 0, 
            //     cTriggered: false, 
            //     cDefault: '', 
            //     cProtect: false, 
            //     cVisible:  false, 
            //     cAsync:  false, 
            //     cFilter: true, 
            //     cPageLevel: this.PageLevel, 
            //     cTabIndex: this.TabIndex, 
            //     cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
            //     cStatic: false, 
            //     cOption: [], 
            //     cMasterUrl: '' ,
            //     cDisplayColumn: '' ,
            // }, 

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
		return this.$store.getters.GetPage1Data
	}
  },
    methods: {		
        OnassessmentcdChange (data) {
        this.$nextTick(() => {
            this.M_CM_AssessmentChannelStep.assessmentcd = data.id
            this.M_CM_AssessmentChannelStep.assessmentcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{assessmentcd}
            }
        })
        this.$forceUpdate()
        },
        OnmandatoryChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{mandatory}
            }
        })
        this.$forceUpdate()
        },
        OnparentsequencenoChange (data) {
        this.$nextTick(() => {
            this.M_CM_AssessmentChannelStep.parentsequenceno = data.id
            this.M_CM_AssessmentChannelStep.parentsequencenoLabel = data.label
            if (this.inputStatus != "VIEW") {
//{parentsequenceno}
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
                AssessmentCd: this.M_CM_AssessmentChannelStep.assessmentcd == '' || this.M_CM_AssessmentChannelStep.assessmentcd == null ? 'NULL' : this.M_CM_AssessmentChannelStep.assessmentcd ,
                Descs: this.M_CM_AssessmentChannelStep.descs,
                Mandatory: this.M_CM_AssessmentChannelStep.mandatory,
                WorkFlowType: 'S',
                ParentSequenceNo: this.M_CM_AssessmentChannelStep.parentsequenceno == '' || this.M_CM_AssessmentChannelStep.parentsequenceno == null ? 'NULL' : this.M_CM_AssessmentChannelStep.parentsequenceno ,
                SortSequenceNo: this.M_CM_AssessmentChannelStep.sortsequenceno,
                Remarks: this.M_CM_AssessmentChannelStep.remarks,
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
                FormSequenceNo: this.M_CM_AssessmentChannelStep.formsequenceno,
                AssessmentCd: this.M_CM_AssessmentChannelStep.assessmentcd == '' || this.M_CM_AssessmentChannelStep.assessmentcd == null ? 'NULL' : this.M_CM_AssessmentChannelStep.assessmentcd ,
                Descs: this.M_CM_AssessmentChannelStep.descs,
                WorkFlowType: 'S',
                Mandatory: this.M_CM_AssessmentChannelStep.mandatory,
                ParentSequenceNo: this.M_CM_AssessmentChannelStep.parentsequenceno == '' || this.M_CM_AssessmentChannelStep.parentsequenceno == null ? 'NULL' : this.M_CM_AssessmentChannelStep.parentsequenceno ,
                SortSequenceNo: this.M_CM_AssessmentChannelStep.sortsequenceno,
                UserEdit: this.getDataUser().user_id ,
                LastUpdateStamp: this.M_CM_AssessmentChannelStep.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })

        },
		M_ClearForm(){
            this.M_CM_AssessmentChannelStep = {
                assessmentcd: '',
                formsequenceno: 0,
                descs: '',
                mandatory: 'Y',
                parentsequenceno: 0,
                sortsequenceno: '1',
                timeedit: '',
                lastupdatestamp: 0,
                remarks: ''
                    }
            		
		},
        M_New(){
			this.$refs.ref_assessmentcd.focus()
        },
        M_Edit(){
            this.$refs.ref_descs.focus()
        },
        M_Delete(dt){       

            var data = this.FormToABSList().getRowSelected()  
        var dataDelete = []

        
        data.forEach((value) => {
          dataDelete.push({
          FormSequenceNo: value.FormSequenceNo,
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
,                formsequenceno: record.FormSequenceNo
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
this.M_CM_AssessmentChannelStep = {
                assessmentcd: data.assessmentcd,
                formsequenceno: data.formsequenceno,
                descs: data.descs,
                mandatory: data.mandatory,
                parentsequenceno: data.parentsequenceno,
                sortsequenceno: data.sortsequenceno,
                timeedit: data.timeedit,
                lastupdatestamp: record.LastUpdateStamp
                    }
                 

                this.M_CM_AssessmentChannelStep.assessmentcdLabel = this.M_CM_AssessmentChannelStep.assessmentcd != null ? data.assessmentcd + this.separator + data.assessmentdescs :'' 
                // this.M_CM_AssessmentChannelStep.parentsequencenoLabel = this.M_CM_AssessmentChannelStep.parentsequenceno != null ? data.parentsequenceno + this.separator  :'' 
         

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

