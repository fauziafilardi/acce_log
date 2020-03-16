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
                                        <ABSInputSelectList @change="OnrunningcdChange" :prop="PI_runningcd" :value="M_CM_AssessmentEntry.runningcd" :label="M_CM_AssessmentEntry.runningcdLabel" ref="ref_runningcd"/>
                                      </b-col>
                                      <!-- <b-col md="6">
                                        <ABSCompute :prop="PI_xxx115272" v-model="M_CM_AssessmentEntry.xxx115272"  ref="ref_xxx115272" />
                                      </b-col> -->
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_assessmentno" v-model="M_CM_AssessmentEntry.assessmentno"  ref="ref_assessmentno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputDateVuex @input="OnassessmentdateChange" :prop="PI_assessmentdate" v-model="M_CM_AssessmentEntry.assessmentdate"  ref="ref_assessmentdate" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnassessmentcdChange" :prop="PI_assessmentcd" :value="M_CM_AssessmentEntry.assessmentcd" :label="M_CM_AssessmentEntry.assessmentcdLabel" ref="ref_assessmentcd"/>
                                      </b-col>
                                      <!-- <b-col md="6">
                                        <ABSCompute :prop="PI_xxx115289" v-model="M_CM_AssessmentEntry.xxx115289"  ref="ref_xxx115289" />
                                      </b-col> -->
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex :prop="PI_descs" v-model="M_CM_AssessmentEntry.descs"  ref="ref_descs"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSCompute :prop="PI_passingscore" v-model="M_CM_AssessmentEntry.passingscore"  ref="ref_passingscore" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_CM_AssessmentEntry.remarks"  ref="ref_remarks" />
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
		Module:"CM",
            propList: {
                initialWhere: "Status = 'N' and SubportfolioCd='"+ this.getDataUser().subportfolio_cd +"'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_CM_AssessmentEntry :{
                subportfoliocd: this.getDataUser().subportfolio_cd,
                runningcd: '',
                assessmentno: '',
                assessmentdate: '',
                assessmentcd: '',
                assessmentdescs: '',
                runningdescs: '',
                descs: '',
                passingscore: '',
                remarks: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeedit: '',
                lastupdatestamp: 0,
                rowid: 0
                    }
            ,
            PI_runningcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMRunningCode'    , 
                    ColumnDB: 'RunningCd'   , 
                    InitialWhere: "ModuleCd is null OR ModuleCd = 'CM'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'runningcd', 
                cLabel: 'Running Code', 
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
                cMasterUrl: 'CM/CM_RunningCd' ,
                cDisplayColumn: 'RunningCd,Descs' ,
            }, 
            // PI_xxx115272: { 
            //     cLabel: '', 
            //     cLabelSize: 4, 
            //     cValue: '', 
            //     cPageLevel: this.PageLevel, 
            //     cTabIndex: this.TabIndex, 
            //     cVisible: true 
            // }, 
            PI_assessmentno: { 
                cValidate :'required|max:20', 
                cName: 'assessmentno', 
                cLabel: 'Assessment No', 
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
            PI_assessmentdate: { 
                cValidate :'required', 
                cName: 'assessmentdate', 
                cLabel: 'Assessment Date', 
                cLabelSize: 4, 
                cOrder: 3, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_assessmentcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetCMAssessment'    , 
                    ColumnDB: 'AssessmentCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
                cName: 'assessmentcd', 
                cLabel: 'Assessment Code', 
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
                cDisplayColumn: 'AssessmentCd,Descs' ,
            }, 
            // PI_xxx115289: { 
            //     cLabel: '', 
            //     cLabelSize: 4, 
            //     cValue: '', 
            //     cPageLevel: this.PageLevel, 
            //     cTabIndex: this.TabIndex, 
            //     cVisible: true 
            // }, 
            PI_descs: { 
                cValidate :'max:150', 
                cName: 'descs', 
                cLabel: 'Description', 
                cLabelSize: 4, 
                cOrder: 5, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false,
                cResize: false, 
                cReadOnly: false, 
                cRows: 2, 
                cMaxRows: 2, 
                cSize: 'md', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_passingscore: { 
                cValidate :'max:10',
                cLabel: 'Passing Score', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_remarks: { 
                cValidate :'', 
                cName:'remarks', 
                cLabel:'Remarks', 
                cLabelSize: 4, 
                cOrder:6, 
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
        OnrunningcdChange (data) {
            console.log(data)
        this.$nextTick(() => {
            this.M_CM_AssessmentEntry.runningcd = data.id
            this.M_CM_AssessmentEntry.runningcdLabel = data.label
            if (this.inputStatus != "VIEW") {
        this.M_CM_AssessmentEntry.assessmentno = "(Auto Number)"
        this.PI_assessmentno.cProtect = true

            }
        })
        this.$forceUpdate()
        },
        OnassessmentdateChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{assessmentdate}
            }
        })
        this.$forceUpdate()
        },
        OnassessmentcdChange (data) {
        this.$nextTick(() => {
            this.M_CM_AssessmentEntry.assessmentcd = data.id
            this.M_CM_AssessmentEntry.assessmentcdLabel = data.label
            if (this.inputStatus != "VIEW") {
                this.M_CM_AssessmentEntry.passingscore = data.PassingScore
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
        if (this.M_CM_AssessmentEntry.runningcd != "")
             { this.FnGenerateRunningCode(this.getDataUser().subportfolio_cd,this.M_CM_AssessmentEntry.runningcd,this.getDataUser().user_id,this.M_CM_AssessmentEntry.assessmentdate).then(dt9 =>
         { if (dt9 != null) {
                  this.M_CM_AssessmentEntry.assessmentno = dt9.RunningCode
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                RunningCd: this.M_CM_AssessmentEntry.runningcd == '' || this.M_CM_AssessmentEntry.runningcd == null ? 'NULL' : this.M_CM_AssessmentEntry.runningcd ,
                AssessmentNo: this.M_CM_AssessmentEntry.assessmentno,
                AssessmentDate: this.M_CM_AssessmentEntry.assessmentdate == '' || this.M_CM_AssessmentEntry.assessmentdate == null ? 'NULL' : this.M_CM_AssessmentEntry.assessmentdate ,
                AssessmentCd: this.M_CM_AssessmentEntry.assessmentcd == '' || this.M_CM_AssessmentEntry.assessmentcd == null ? 'NULL' : this.M_CM_AssessmentEntry.assessmentcd ,
                Descs: this.M_CM_AssessmentEntry.descs,
                PassingScore: this.M_CM_AssessmentEntry.passingscore ? this.replaceAllString(this.M_CM_AssessmentEntry.passingscore, ',', '', 'number') : 0,
                Remarks: this.M_CM_AssessmentEntry.remarks,
                Status: 'N',
                UserInput: this.getDataUser().user_id                 
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
        else {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                RunningCd: this.M_CM_AssessmentEntry.runningcd == '' || this.M_CM_AssessmentEntry.runningcd == null ? 'NULL' : this.M_CM_AssessmentEntry.runningcd ,
                AssessmentNo: this.M_CM_AssessmentEntry.assessmentno,
                AssessmentDate: this.M_CM_AssessmentEntry.assessmentdate == '' || this.M_CM_AssessmentEntry.assessmentdate == null ? 'NULL' : this.M_CM_AssessmentEntry.assessmentdate ,
                AssessmentCd: this.M_CM_AssessmentEntry.assessmentcd == '' || this.M_CM_AssessmentEntry.assessmentcd == null ? 'NULL' : this.M_CM_AssessmentEntry.assessmentcd ,
                Descs: this.M_CM_AssessmentEntry.descs,
                PassingScore: this.M_CM_AssessmentEntry.passingscore ? this.replaceAllString(this.M_CM_AssessmentEntry.passingscore, ',', '', 'number') : 0,
                Remarks: this.M_CM_AssessmentEntry.remarks,
                Status: 'N',
                UserInput: this.getDataUser().user_id                 
            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return

				//kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultInsert(response.Message)
					
				
            })
      }

        },
        M_Update() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                RunningCd: this.M_CM_AssessmentEntry.runningcd == '' || this.M_CM_AssessmentEntry.runningcd == null ? 'NULL' : this.M_CM_AssessmentEntry.runningcd ,
                AssessmentNo: this.M_CM_AssessmentEntry.assessmentno,
                AssessmentDate: this.M_CM_AssessmentEntry.assessmentdate == '' || this.M_CM_AssessmentEntry.assessmentdate == null ? 'NULL' : this.M_CM_AssessmentEntry.assessmentdate ,
                AssessmentCd: this.M_CM_AssessmentEntry.assessmentcd == '' || this.M_CM_AssessmentEntry.assessmentcd == null ? 'NULL' : this.M_CM_AssessmentEntry.assessmentcd ,
                Descs: this.M_CM_AssessmentEntry.descs,
                PassingScore: this.M_CM_AssessmentEntry.passingscore ? this.replaceAllString(this.M_CM_AssessmentEntry.passingscore, ',', '', 'number') : 0,
                Remarks: this.M_CM_AssessmentEntry.remarks,
                UserEdit: this.getDataUser().user_id ,
                LastUpdateStamp: this.M_CM_AssessmentEntry.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })

        },
		M_ClearForm(){
            this.M_CM_AssessmentEntry = {
                subportfoliocd: this.getDataUser().subportfolio_cd,
                runningcd: '',
                assessmentno: '',
                assessmentdate: '',
                assessmentcd: '',
                assessmentdescs: '',
                runningdescs: '',
                descs: '',
                passingscore: '',
                remarks: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeedit: '',
                lastupdatestamp: 0,
                rowid: 0
                    }
            		
		},
        M_New(){
			this.$refs.ref_runningcd.focus()
        },
        M_Edit(){
            this.$refs.ref_assessmentdate.focus()
        },
        M_Delete(dt){       

            var data = this.FormToABSList().getRowSelected()  
        var dataDelete = []

        
        data.forEach((value) => {
          dataDelete.push({
          SubPortfolioCd: value.SubportfolioCd,
          AssessmentNo: value.AssessmentNo,
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
,                subportfoliocd: record.SubportfolioCd,
                assessmentno: record.AssessmentNo
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
this.M_CM_AssessmentEntry = {
                subportfoliocd: data.subportfoliocd,
                runningcd: data.runningcd,
                assessmentno: data.assessmentno,
                assessmentdate: data.assessmentdate,
                assessmentcd: data.assessmentcd,
                assessmentdescs: data.assessmentdescs,
                runningdescs: data.runningdescs,
                descs: data.descs,
                passingscore: this.isCurrency(data.passingscore, this.decimal),
                remarks: data.remarks,
                userinput: data.userinput,
                useredit: data.useredit,
                timeedit: data.timeedit,
                lastupdatestamp: record.LastUpdateStamp,
                rowid: data.rowid
                    }
                 

                this.M_CM_AssessmentEntry.runningcdLabel = this.M_CM_AssessmentEntry.runningcd != null ? data.runningcd + this.separator + data.runningdescs :'' 
                this.M_CM_AssessmentEntry.assessmentcdLabel = this.M_CM_AssessmentEntry.assessmentcd != null ? data.assessmentcd + this.separator + data.assessmentdescs :'' 
         

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

