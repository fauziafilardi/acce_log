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
                                        <ABSinputTextVuex :prop="PI_documenttypecd" v-model="M_SM_DocumentControlD.documenttypecd"  ref="ref_documenttypecd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_descs" v-model="M_SM_DocumentControlD.descs"  ref="ref_descs"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnmandatoryChange" :prop="PI_mandatory" v-model="M_SM_DocumentControlD.mandatory"  ref="ref_mandatory" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputDateVuex @input="OnexpecteddateChange" :prop="PI_expecteddate" v-model="M_SM_DocumentControlD.expecteddate"  ref="ref_expecteddate" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnreceivingstatusChange" :prop="PI_receivingstatus" v-model="M_SM_DocumentControlD.receivingstatus"  ref="ref_receivingstatus" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputDateVuex @input="OnreceiveddateChange" :prop="PI_receiveddate" v-model="M_SM_DocumentControlD.receiveddate"  ref="ref_receiveddate" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_receivedby" v-model="M_SM_DocumentControlD.receivedby"  ref="ref_receivedby"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_documentno" v-model="M_SM_DocumentControlD.documentno"  ref="ref_documentno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputDateVuex @input="OndocumentdateChange" :prop="PI_documentdate" v-model="M_SM_DocumentControlD.documentdate"  ref="ref_documentdate" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_SM_DocumentControlD.remarks"  ref="ref_remarks" />
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
            DataRow:null,
			ValKey:null,
            FormType: "List",
			Module:"SM",
            propList: {
                initialWhere:"OrderNo = '" + this.ValKey + "'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_SM_DocumentControlD :{
                documenttypecd: '',
                descs: '',
                mandatory: '',
                expecteddate: '',
                receivingstatus: 'N',
                receiveddate: '',
                receivedby: '',
                documentno: '',
                documentdate: '',
                remarks: '',
                sequenceno: '',
                orderno: '',
                lotno: '',
                lastupdatestamp: ''
                    }
            ,
            PI_documenttypecd: { 
                cValidate :'required', 
                cName: 'documenttypecd', 
                cLabel: 'Document Type Code', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_descs: { 
                cValidate :'required|max:60', 
                cName: 'descs', 
                cLabel: 'Description', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
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
                cRadioDefaultOption: '', 
                cLabel:'Mandatory', 
                cLabelSize: 4, 
                cDefault: '', 
                cOrder: 0, 
                cProtect: true, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_expecteddate: { 
                cValidate :'', 
                cName: 'expecteddate', 
                cLabel: 'Expected Date', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_receivingstatus: { 
                cValidate :'', 
                cName: 'receivingstatus', 
                cId: 'rdbreceivingstatus', 
                cRadioOptions: [{ text: 'Yes', value: 'Y' },{ text: 'No', value: 'N' },], 
                cRadioDefaultOption: '', 
                cLabel:'Received Status', 
                cLabelSize: 4, 
                cDefault: 'N', 
                cOrder: 0, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_receiveddate: { 
                cValidate :'required', 
                cName: 'receiveddate', 
                cLabel: 'Received Date', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_receivedby: { 
                cValidate :'required', 
                cName: 'receivedby', 
                cLabel: 'Received By ', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_documentno: { 
                cValidate :'required|max:60', 
                cName: 'documentno', 
                cLabel: 'Document No ', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_documentdate: { 
                cValidate :'', 
                cName: 'documentdate', 
                cLabel: 'Document Date', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cVisible:  true, 
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
                cOrder:0, 
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
		return this.$store.getters.GetPage2Data
	},
    DataRowPage1(){
		return this.$store.getters.GetPage1Data
	}
	,GetDataBy1(){
		return this.$store.getters.GetPage1GetDataBy
	}
  },
    methods: {
        OnmandatoryChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{mandatory}
            }
        })
        this.$forceUpdate()
        },
        OnexpecteddateChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{expecteddate}
            }
        })
        this.$forceUpdate()
        },
        OnreceivingstatusChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{receivingstatus}
            }
        })
        this.$forceUpdate()
        },
        OnreceiveddateChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{receiveddate}
            }
        })
        this.$forceUpdate()
        },
        OndocumentdateChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{documentdate}
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
           this.getToolbar().statusFunction[2].disabled = true
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
            this.DataRow = data
            console.log(this.DataRow)
            this.M_SM_DocumentControlD.lotno = this.DataRow.LotNo
            this.propList.initialWhere ="SubPortfolioCd = '"+ this.getDataUser().subportfolio_cd +"' AND OrderNo = '" + data.OrderNo + "' "
        

            this.FormToABSList().doGetList('','eb_getList')
        },		
		M_CheckboxChecked(data, status, index){

        },		
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                
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
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                SequenceNo: this.M_SM_DocumentControlD.sequenceno,
                OrderNo: this.M_SM_DocumentControlD.orderno,
                LotNo: this.M_SM_DocumentControlD.lotno,
                DocumentTypeCd: this.M_SM_DocumentControlD.documenttypecd,
                ReceivingStatus: this.M_SM_DocumentControlD.receivingstatus,
                ReceivedDate: this.M_SM_DocumentControlD.receiveddate == '' || this.M_SM_DocumentControlD.receiveddate == null ? 'NULL' : this.M_SM_DocumentControlD.receiveddate ,
                ReceivedBy: this.M_SM_DocumentControlD.receivedby,
                DocumentNo: this.M_SM_DocumentControlD.documentno,
                DocumentDate: this.M_SM_DocumentControlD.documentdate == '' || this.M_SM_DocumentControlD.documentdate == null ? 'NULL' : this.M_SM_DocumentControlD.documentdate ,
                Remarks: this.M_SM_DocumentControlD.remarks,
                UserEdit: this.getDataUser().user_id ,
                LastUpdateStamp: this.M_SM_DocumentControlD.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_SM_DocumentControlD = {
                documenttypecd: '',
                descs: '',
                mandatory: '',
                expecteddate: '',
                receivingstatus: 'N',
                receiveddate: '',
                receivedby: '',
                documentno: '',
                documentdate: '',
                remarks: '',
                sequenceno: '',
                orderno: '',
                lotno: '',
                lastupdatestamp: ''
                    }
            	
		},
        M_New(){
            let data = this.$store.getters.GetPage1Data
            this.M_SM_DocumentControlD.lotno = data.LotNo 



        },
        M_Edit(){
        },
        M_Delete(dt){           
			var data = this.FormToABSList().getRowSelected()  
			var dataDelete = []

			
			data.forEach((value) => {

				
				dataDelete.push({
					_Message_:'',


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
,                sequenceno: record.SequenceNo,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                orderno: record.OrderNo,
                lotno: this.DataRow.LotNo,
                documenttypecd: record.DocumentTypeCd				
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
this.M_SM_DocumentControlD = {
                documenttypecd: data.documenttypecd,
                descs: data.descs,
                mandatory: data.mandatoryfield,
                expecteddate: data.expecteddate,
                receivingstatus: data.receivingstatus,
                receiveddate: data.receiveddate,
                receivedby: data.receivedby,
                documentno: data.documentno,
                documentdate: data.documentdate,
                remarks: data.remarks,
                sequenceno: record.SequenceNo,
                orderno: record.OrderNo,
                lotno: this.DataRow.LotNo,
                lastupdatestamp: record.LastUpdateStamp

                    }
                if(data.receivingstatus == '' || data.receivingstatus ==  null){
                    this.M_SM_DocumentControlD.receivingstatus = 'N'
                }else{
                    this.M_SM_DocumentControlD.receivingstatus =  data.receivingstatus
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

