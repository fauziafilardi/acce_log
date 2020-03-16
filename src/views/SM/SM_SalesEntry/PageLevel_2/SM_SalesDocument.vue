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
                                        <ABSinputTextVuex :prop="PI_descs" v-model="M_SM_SalesDocument.descs"  ref="ref_descs"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSFileUpload :prop="PI_documentfilename" @fileName="getFileName" 
                                                                        v-model="M_SM_SalesDocument.documentfilename" 
                                                                        :file="M_SM_SalesDocument.picturefilename" 
                                                                        :image="M_SM_SalesDocument.referencefilename"
                                                                         ref="ref_documentfilename" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSCompute :prop="PI_tbox1" v-model="M_SM_SalesDocument.tbox1"  ref="ref_tbox1"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_SM_SalesDocument.remarks"  ref="ref_remarks" />
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

            M_SM_SalesDocument :{
                picturefilename: '',
                descs: '',
                tbox1: '',
                remarks: '',
                documentfilename: '',
                referencefilename:''
                    }
            ,
            PI_descs: { 
                cValidate :'required|max:150', 
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
            PI_documentfilename: { 
                cValidate :'required', 
                cName:'documentfilename', 
                cLabel: 'File Name', 
                cSubPortfolio:this.getDataUser().subportfolio_cd,
                cPath:"SaveLocation/SubPortfolio/"+this.getDataUser().subportfolio_cd+"/Contract/",
                cLabelSize: 4, 
                cOrder:0, 
                cVisible: true, 
                cModule: 'SM', 
                cPlaceholder: 'Choose a file...', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            // PI_tbox1: { 
            //     cValidate :'', 
            //     cName: 'tbox1', 
            //     cLabel: 'Existing Doc. Name', 
            //     cLabelSize: 4, 
            //     cOrder: 0, 
            //     cKey: false, 
            //     cType: 'text',
            //     cVisible: true, 
            //     cProtect: false, 
            //     cPageLevel: this.PageLevel, 
            //     cTabIndex: this.TabIndex, 
            //     cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            // }, 
            PI_tbox1: { 
                cLabel: 'Existing Doc. Name', 
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
            
            this.propList.initialWhere =" SubPortfolioCd='" + this.getDataUser().subportfolio_cd + "' AND ApplicationNo ='"+data.OrderNo+"'"
            this.PI_documentfilename.cPath += data.OrderNo+"/"
            console.log(this.PI_documentfilename.cPath)
        

            this.FormToABSList().doGetList('','eb_getList')
        },		
		M_CheckboxChecked(data, status, index){

        },		
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                OrderNo: this.DataRowPage1.OrderNo,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                Descs: this.M_SM_SalesDocument.descs,
                DocumentFileName: this.M_SM_SalesDocument.documentfilename,
                Remarks: this.M_SM_SalesDocument.remarks,
                UserInput: this.getDataUser().user_id ,
                LotNo: this.DataRowPage1.LotNo                
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
                OrderNo: this.DataRowPage1.OrderNo,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                SequenceNo: this.M_SM_SalesDocument.sequenceno,
                Descs: this.M_SM_SalesDocument.descs,
                DocumentFileName: this.M_SM_SalesDocument.documentfilename,
                Remarks: this.M_SM_SalesDocument.remarks,
                UserEdit: this.getDataUser().user_id ,
                LastUpdateStamp: this.M_SM_SalesDocument.lastupdatestamp,
                LotNo: this.DataRowPage1.LotNo                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_SM_SalesDocument = {
                picturefilename: '',
                descs: '',
                tbox1: '',
                remarks: '',
                documentfilename: ''
                    }
            	
		},
        M_New(){
            let data = this.$store.getters.GetPage1Data
            this.M_SM_SalesDocument.lotno = data.LotNo 



        },
        M_Edit(){
        },
        M_Delete(dt){           
			var data = this.FormToABSList().getRowSelected()  
			var dataDelete = []

			
			data.forEach((value) => {

				
				dataDelete.push({
					_Message_:'',
                    OrderNo: this.DataRowPage1.OrderNo,
                    SubPortfolioCd: this.getDataUser().subportfolio_cd,
                    SequenceNo: value.SequenceNo,
                    LastUpdateStamp: value.LastUpdateStamp,
                    LotNo: this.DataRowPage1.LotNo,


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
,                orderno: this.DataRowPage1.OrderNo,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                sequenceno: record.SequenceNo,
                lotno: this.DataRowPage1.LotNo				
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
this.M_SM_SalesDocument = {
                picturefilename: data.documentfilename,
                descs: data.descs,
                tbox1: data.documentfilename,
                remarks: data.remarks,
                documentfilename: data.documentfilename,
                sequenceno: record.SequenceNo,
                lastupdatestamp:record.LastUpdateStamp
                    }
                 

  

                this.IEBy.Input = data.userinput
                this.IEBy.Edit = data.useredit

            })
        }
        ,getFileName(fileName) {
            console.log(fileName)
         this.M_SM_SalesDocument.picturefilename = fileName 
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

