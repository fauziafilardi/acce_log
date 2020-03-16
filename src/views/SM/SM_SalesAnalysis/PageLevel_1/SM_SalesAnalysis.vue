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
                                        <ABSInputSelect2 @change="OnsalesanalysiscategoryChange" :prop="PI_salesanalysiscategory" :value="M_SM_SalesAnalysis.salesanalysiscategory" :label="M_SM_SalesAnalysis.salesanalysiscategoryLabel" ref="ref_salesanalysiscategory"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_descs" v-model="M_SM_SalesAnalysis.descs"  ref="ref_descs"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_shortdescs" v-model="M_SM_SalesAnalysis.shortdescs"  ref="ref_shortdescs"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_SM_SalesAnalysis.remarks"  ref="ref_remarks" />
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
                initialWhere: "SubPortfolioCd='"+this.getDataUser().subportfolio_cd+"'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_SM_SalesAnalysis :{
                descs: '',
                remarks: '',
                salesanalysiscategory: 'X0',
                shortdescs: '',
                subportfoliocd: '',
                useredit: this.getDataUser().user_id,
                userinput: '',
                lastupdatestamp: 0,
                rowid: 0,
                    }
            ,
            PI_salesanalysiscategory: { 
                cValidate :'required', 
                cName: 'salesanalysiscategory', 
                cLabel: 'Sales Analysis Category', 
                cLabelSize: 4, 
                cOrder: 1, 
                cKey: true, 
                cTriggered: false, 
                cDefault: '', 
                cProtect: false, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cStatic: true, 
                cOption: [{ label: 'X0', id: 'X0' },{ label: 'X1', id: 'X1' },{ label: 'X2', id: 'X2' },{ label: 'X3', id: 'X3' },{ label: 'X4', id: 'X4' },{ label: 'X5', id: 'X5' },{ label: 'X6', id: 'X6' },{ label: 'X7', id: 'X7' },{ label: 'X8', id: 'X8' }], 
                cMasterUrl: '' ,
                cDisplayColumn: '' ,
            }, 
            PI_descs: { 
                cValidate :'required|max:60', 
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
            PI_shortdescs: { 
                cValidate :'', 
                cName: 'shortdescs', 
                cLabel: 'Short Description', 
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
            PI_remarks: { 
                cValidate :'', 
                cName:'remarks', 
                cLabel:'Remarks', 
                cLabelSize: 4, 
                cOrder:4, 
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
        OnsalesanalysiscategoryChange (data) {
        this.$nextTick(() => {
            this.M_SM_SalesAnalysis.salesanalysiscategory = data.id
            this.M_SM_SalesAnalysis.salesanalysiscategoryLabel = data.label
            if (this.inputStatus != "VIEW") {
//{salesanalysiscategory}
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
                SalesAnalysisCategory: this.M_SM_SalesAnalysis.salesanalysiscategory,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                Descs: this.M_SM_SalesAnalysis.descs,
                ShortDescs: this.M_SM_SalesAnalysis.shortdescs,
                Remarks: this.M_SM_SalesAnalysis.remarks,
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
                SalesAnalysisCategory: this.M_SM_SalesAnalysis.salesanalysiscategory,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                Descs: this.M_SM_SalesAnalysis.descs,
                ShortDescs: this.M_SM_SalesAnalysis.shortdescs,
                Remarks: this.M_SM_SalesAnalysis.remarks,
                UserEdit: this.getDataUser().user_id ,
                LastUpdateStamp: this.M_SM_SalesAnalysis.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_SM_SalesAnalysis = {
                descs: '',
                remarks: '',
                salesanalysiscategory: 'X0',
                shortdescs: '',
                subportfoliocd: '',
                useredit: this.getDataUser().user_id,
                userinput: '',
                lastupdatestamp: 0,
                rowid: 0,
                    }
            	
	
		},
        M_New(){
			this.$refs.ref_salesanalysiscategory.focus()
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
					_Message_:'',
                    SalesAnalysisCategory: value.SalesAnalysisCategory,
                    SubPortfolioCd: this.getDataUser().subportfolio_cd,
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
            console.log(record)
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order
,                salesanalysiscategory: record.SalesAnalysisCategory,
                SubPortfolioCd: this.getDataUser().subportfolio_cd
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                console.log(data)
this.M_SM_SalesAnalysis = {
                descs: data.descs, 
                remarks: data.remarks, 
                salesanalysiscategory: data.salesanalysiscategory, 
                shortdescs: data.shortdescs, 
                subportfoliocd: data.subportfoliocd, 
                useredit: data.useredit, 
                userinput: data.userinput, 
                lastupdatestamp: record.LastUpdateStamp, 
                rowid: record.row_id, 
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

