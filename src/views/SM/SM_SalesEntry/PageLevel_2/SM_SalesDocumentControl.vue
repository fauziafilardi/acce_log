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
                                        <ABSInputSelectList @change="OndocumenttypecdChange" :prop="PI_documenttypecd" :value="M_SM_SalesDocumentControl.documenttypecd" :label="M_SM_SalesDocumentControl.documenttypecdLabel" ref="ref_documenttypecd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_descs" v-model="M_SM_SalesDocumentControl.descs"  ref="ref_descs"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnmandatoryfieldChange" :prop="PI_mandatoryfield" v-model="M_SM_SalesDocumentControl.mandatoryfield"  ref="ref_mandatoryfield" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputDateVuex @input="OnexpecteddateChange" :prop="PI_expecteddate" v-model="M_SM_SalesDocumentControl.expecteddate"  ref="ref_expecteddate" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_SM_SalesDocumentControl.remarks"  ref="ref_remarks" />
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
			Module:"SM",
            propList: {
                initialWhere:"LotNo = '" + this.ValKey + "'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_SM_SalesDocumentControl :{
                    documenttypecd:'',
                    descs:'',
                    mandatoryfield:'Y',
                    expecteddate:'',
                    status:'',
                    remarks:''
                    }
            ,
            PI_documenttypecd: { 
                dataLookUp: { 
                    LookUpCd: 'GetDocumentTypeCd'    , 
                    ColumnDB: 'DocumentTypeCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'DocumentTypeCd' 
                        }, 
                cValidate :'required', 
                cName: 'documenttypecd', 
                cLabel: 'Document Type Code', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 0, 
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
                cMasterUrl: 'SM/SM_DocumentType' ,
                cDisplayColumn: 'DocumentTypeCd,Descs' ,
            }, 
            PI_descs: { 
                cValidate :'required|max:60', 
                cName: 'descs', 
                cLabel: 'Description', 
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
            PI_mandatoryfield: { 
                cValidate :'', 
                cName: 'mandatoryfield', 
                cId: 'rdbmandatoryfield', 
                cRadioOptions: [{ text: 'Yes', value: 'Y' },{ text: 'No', value: 'N' },], 
                cRadioDefaultOption: 'Y', 
                cLabel:'Mandatory', 
                cLabelSize: 4, 
                cDefault: 'Y', 
                cOrder: 0, 
                cProtect: false, 
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
        OndocumenttypecdChange (data) {
        this.$nextTick(() => {
            this.M_SM_SalesDocumentControl.documenttypecd = data.id
            this.M_SM_SalesDocumentControl.documenttypecdLabel = data.id+this.separator+data.label
            if (this.inputStatus != "VIEW") {
//{documenttypecd}
            }
        })
        this.$forceUpdate()
        },
        OnmandatoryfieldChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{mandatoryfield}
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
        OnremarksChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{remarks}
            }
        })
        this.$forceUpdate()
        },
		
		setToolbarButton () {
           if(this.DataRowPage1.StatusCd=='N'){
            this.getToolbar().statusFunction[0].disabled = false
          }else{
            this.getToolbar().statusFunction[0].disabled = true
          }
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
            console.log(data)

            if(data.StatusCd == 'N'){
              this.getToolbar().FormStatus = 'EDIT'
              this.getToolbar().ProcessPS()
            } else if (data.StatusCd == 'C') {
              this.getToolbar().FormStatus = 'VIEW'
              this.getToolbar().ProcessPS()
            }else {
              this.getToolbar().FormStatus = 'VIEW'
              this.getToolbar().ProcessPS()
            }

            this.propList.initialWhere =" SubPortfolioCd='" + this.getDataUser().subportfolio_cd + "' AND OrderNo ='"+data.OrderNo+"'"
        

            this.FormToABSList().doGetList('','eb_getList')
        },		
		M_CheckboxChecked(data, status, index){

        },		
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                OrderNo: this.DataRowPage1.OrderNo,
                LotNo: this.DataRowPage1.LotNo,
                DocumentTypeCd: this.M_SM_SalesDocumentControl.documenttypecd == '' || this.M_SM_SalesDocumentControl.documenttypecd == null ? 'NULL' : this.M_SM_SalesDocumentControl.documenttypecd ,
                Descs: this.M_SM_SalesDocumentControl.descs,
                MandatoryField: this.M_SM_SalesDocumentControl.mandatoryfield,
                ExpectedDate: this.M_SM_SalesDocumentControl.expecteddate == '' || this.M_SM_SalesDocumentControl.expecteddate == null ? this.getToday() : this.M_SM_SalesDocumentControl.expecteddate ,
                ReceivedDate: 'NULL',
                ReceivedBy: "",
                DocumentNo: "",
                Remarks: this.M_SM_SalesDocumentControl.remarks,
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
                SequenceNo: this.M_SM_SalesDocumentControl.sequenceno,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                OrderNo: this.DataRowPage1.OrderNo,
                LotNo: this.DataRowPage1.LotNo,
                DocumentTypeCd: this.M_SM_SalesDocumentControl.documenttypecd == '' || this.M_SM_SalesDocumentControl.documenttypecd == null ? 'NULL' : this.M_SM_SalesDocumentControl.documenttypecd ,
                Descs: this.M_SM_SalesDocumentControl.descs,
                MandatoryField: this.M_SM_SalesDocumentControl.mandatoryfield,
                ExpectedDate: this.M_SM_SalesDocumentControl.expecteddate == '' || this.M_SM_SalesDocumentControl.expecteddate == null ? 'NULL' : this.M_SM_SalesDocumentControl.expecteddate ,
                Remarks: this.M_SM_SalesDocumentControl.remarks,
                UserEdit: this.getDataUser().user_id ,
                LastUpdateStamp: this.M_SM_SalesDocumentControl.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_SM_SalesDocumentControl = {
                    documenttypecd:'',
                    descs:'',
                    mandatoryfield:'Y',
                    expecteddate:'',
                    status:'',
                    remarks:''
                    }
            	
		},
        M_New(){
            let data = this.$store.getters.GetPage1Data
            this.M_SM_SalesDocumentControl.lotno = data.LotNo 



        },
        M_Edit(){
        },
        M_Delete(dt){           
			var data = this.FormToABSList().getRowSelected()  
			var dataDelete = []

			
			data.forEach((value) => {

				
				dataDelete.push({
					_Message_:'',
                    SequenceNo: value.SequenceNo,
                    SubPortfolioCd: this.getDataUser().subportfolio_cd,
                    OrderNo: this.DataRowPage1.OrderNo,
                    LotNo: this.DataRowPage1.LotNo,
                    DocumentTypeCd: value.DocumentTypeCd == '' || value.DocumentTypeCd == null ? 'NULL' : value.DocumentTypeCd ,
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
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order
,                sequenceno: record.SequenceNo,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                orderno: this.DataRowPage1.OrderNo,
                lotno: this.DataRowPage1.LotNo,
                documenttypecd: record.DocumentTypeCd				
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
this.M_SM_SalesDocumentControl = {
                    documenttypecd: data.documenttypecd,
                    descs: data.descs,
                    mandatoryfield: data.mandatoryfield,
                    expecteddate: data.expecteddate,
                    status: data.status,
                    sequenceno: record.SequenceNo,
                    lastupdatestamp: record.LastUpdateStamp,
                    remarks: data.remarks
                    }
                 

                this.M_SM_SalesDocumentControl.documenttypecdLabel = this.M_SM_SalesDocumentControl.documenttypecd != null && this.M_SM_SalesDocumentControl.documenttypecd != '' ? data.documenttypecd + this.separator  :'' 
  

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

