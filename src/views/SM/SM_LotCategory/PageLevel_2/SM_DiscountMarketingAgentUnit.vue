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
                                        <ABSInputSelectList @change="OnlotnoChange" :prop="PI_lotno" :value="M_SM_DiscountMarketingAgentUnit.lotno" :label="M_SM_DiscountMarketingAgentUnit.lotnoLabel" ref="ref_lotno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputDateVuex @input="OnexpireddateChange" :prop="PI_expireddate" v-model="M_SM_DiscountMarketingAgentUnit.expireddate"  ref="ref_expireddate" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnexclusiveagentChange" :prop="PI_exclusiveagent" v-model="M_SM_DiscountMarketingAgentUnit.exclusiveagent"  ref="ref_exclusiveagent" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_SM_DiscountMarketingAgentUnit.remarks"  ref="ref_remarks" />
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
                initialWhere:"CategoryCd = '" + this.ValKey + "'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_SM_DiscountMarketingAgentUnit :{
                categorycd: '',
                exclusiveagent: 'Y', 
                expireddate: '', 
                lotno: '', 
                remarks: '', 
                timeedit: '', 
                timeinput: '', 
                useredit: this.getDataUser().user_id, 
                userinput: '', 
                lastupdatestamp: 0, 
                rowid: 0,
                    }
            ,
            PI_lotno: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupLotNo'    , 
                    ColumnDB: 'LotNo'   , 
                    InitialWhere: "SubPortfolioCd='"+this.getDataUser().subportfolio_cd+"' AND LotNo NOT IN ( SELECT LotNo FROM SM_DiscountMarketingAgentUnit WHERE ExclusiveAgent='Y') AND SalesStatus='A'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'LotNo,Descs',
                    OrderBy: '' 
                        }, 
                cValidate :'required', 
                cName: 'lotno', 
                cLabel: 'Unit No', 
                cKey: true, 
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
                cDisplayColumn: 'LotNo,Descs' ,
            }, 
            PI_expireddate: { 
                cValidate :'', 
                cName: 'expireddate', 
                cLabel: 'Expired Date', 
                cLabelSize: 4, 
                cOrder: 5, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_exclusiveagent: { 
                cValidate :'', 
                cName: 'exclusiveagent', 
                cId: 'rdbexclusiveagent', 
                cRadioOptions: [{ text: 'Yes', value: 'Y' },{ text: 'No', value: 'N' },], 
                cRadioDefaultOption: '', 
                cLabel:'Exclusive Agent', 
                cLabelSize: 4, 
                cDefault: '', 
                cOrder: 6, 
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
        OnlotnoChange (data) {
        this.$nextTick(() => {
            this.M_SM_DiscountMarketingAgentUnit.lotno = data.id
            this.M_SM_DiscountMarketingAgentUnit.lotnoLabel = data.label
            if (this.inputStatus != "VIEW") {
//{lotno}
            }
        })
        this.$forceUpdate()
        },
        OnexpireddateChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{expireddate}
            }
        })
        this.$forceUpdate()
        },
        OnexclusiveagentChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{exclusiveagent}
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
            this.$parent.showForm = false
			
            let data = this.$store.getters.GetPage1Data
            this.M_SM_DiscountMarketingAgentUnit.categorycd = data.CategoryCd 
            this.propList.initialWhere ="SubPortfolioCd='"+this.getDataUser().subportfolio_cd+"' AND CategoryCd = '" + data.CategoryCd + "' "
        

            this.FormToABSList().doGetList('','eb_getList')
        },		
		M_CheckboxChecked(data, status, index){

        },		
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                CategoryCd: this.M_SM_DiscountMarketingAgentUnit.categorycd,
                LotNo: this.M_SM_DiscountMarketingAgentUnit.lotno == '' || this.M_SM_DiscountMarketingAgentUnit.lotno == null ? 'NULL' : this.M_SM_DiscountMarketingAgentUnit.lotno ,
                ExpiredDate: this.M_SM_DiscountMarketingAgentUnit.expireddate == '' || this.M_SM_DiscountMarketingAgentUnit.expireddate == null ? 'NULL' : this.M_SM_DiscountMarketingAgentUnit.expireddate ,
                ExclusiveAgent: this.M_SM_DiscountMarketingAgentUnit.exclusiveagent,
                Remarks: this.M_SM_DiscountMarketingAgentUnit.remarks,
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
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                CategoryCd: this.M_SM_DiscountMarketingAgentUnit.categorycd,
                LotNo: this.M_SM_DiscountMarketingAgentUnit.lotno == '' || this.M_SM_DiscountMarketingAgentUnit.lotno == null ? 'NULL' : this.M_SM_DiscountMarketingAgentUnit.lotno ,
                ExpiredDate: this.M_SM_DiscountMarketingAgentUnit.expireddate == '' || this.M_SM_DiscountMarketingAgentUnit.expireddate == null ? 'NULL' : this.M_SM_DiscountMarketingAgentUnit.expireddate ,
                ExclusiveAgent: this.M_SM_DiscountMarketingAgentUnit.exclusiveagent,
                Remarks: this.M_SM_DiscountMarketingAgentUnit.remarks,
                UserEdit: this.getDataUser().user_id ,
                LastUpdateStamp: this.M_SM_DiscountMarketingAgentUnit.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_SM_DiscountMarketingAgentUnit = {
                    categorycd: '',
                    exclusiveagent: 'Y', 
                    expireddate: '', 
                    lotno: '', 
                    remarks: '', 
                    timeedit: '', 
                    timeinput: '', 
                    useredit: this.getDataUser().user_id, 
                    userinput: '', 
                    lastupdatestamp: 0, 
                    rowid: 0, 
                    }
            	
		},
        M_New(){
            let data = this.$store.getters.GetPage1Data
            this.M_SM_DiscountMarketingAgentUnit.categorycd = data.CategoryCd 

            this.$refs.ref_lotno.focus()

        },
        M_Edit(){
            this.$refs.ref_expireddate.focus()
        },
        M_Delete(dt){           
			var data = this.FormToABSList().getRowSelected()  
			var dataDelete = []

			
			data.forEach((value) => {
                console.log(value)
				
				dataDelete.push({
					_Message_:'',
                    SubPortfolioCd: this.getDataUser().subportfolio_cd,
                    CategoryCd: value.CategoryCd,
                    LotNo: value.LotNo == '' || value.LotNo == null ? 'NULL' : value.LotNo ,
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
,                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                categorycd: record.CategoryCd,
                lotno: record.LotNo				
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
                // console.log(data)
this.M_SM_DiscountMarketingAgentUnit = {
                categorycd: data.categorycd,
                exclusiveagent: data.exclusiveagent,
                expireddate: data.expireddate,
                lotno: data.lotno,
                remarks: data.remarks,
                timeedit: data.timeedit,
                timeinput: data.timeinput,
                useredit: data.useredit,
                userinput: data.userinput,
                lastupdatestamp: record.LastUpdateStamp,
                rowid: record.row_id
                    }
                 

                this.M_SM_DiscountMarketingAgentUnit.lotnoLabel = this.M_SM_DiscountMarketingAgentUnit.lotno != null && this.M_SM_DiscountMarketingAgentUnit.lotno != '' ? data.lotno + this.separator + data.descslotno :'' 
  

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

