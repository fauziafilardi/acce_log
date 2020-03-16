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
                                        <ABSInputSelectList @change="OnaccessorycdChange" :prop="PI_accessorycd" :value="M_SM_LotAccessory.accessorycd" :label="M_SM_LotAccessory.accessorycdLabel" ref="ref_accessorycd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_qty" v-model="M_SM_LotAccessory.qty"  ref="ref_qty"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSCompute :prop="PI_hostatus" v-model="M_SM_LotAccessory.hostatus"  ref="ref_hostatus" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSCompute :prop="PI_hodate" v-model="M_SM_LotAccessory.hodate"  ref="ref_hodate" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSCompute :prop="PI_endofwarrantyperiod" v-model="M_SM_LotAccessory.endofwarrantyperiod"  ref="ref_endofwarrantyperiod" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_SM_LotAccessory.remarks"  ref="ref_remarks" />
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

            M_SM_LotAccessory :{
                subportfoliocd: this.getDataUser().subportfolio_cd,
                lotno: '',
                accessorycd: '',
                accessorydesc: '',
                qty: '0',
                hostatus: '',
                hodate: '',
                endofwarrantyperiod: 'Month',
                remarks: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                lastupdatestamp: 0,
                rowid: 0
                    }
            ,
            PI_accessorycd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupTNAccessoryBySubportfolio'    , 
                    ColumnDB: 'AccessoryCd'   , 
                    InitialWhere: "SubportfolioCd='"+this.getDataUser().subportfolio_cd+"'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'AccessoryCd,Descs' 
                        }, 
                cValidate :'required', 
                cName: 'accessorrrycd', 
                cLabel: 'Accessory', 
                cKey: true, 
                cLabelSize: 4, 
                cOrder: 51, 
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
                cMasterUrl: 'SM/SM_Accessory' ,
                cDisplayColumn: 'AccessoryCd,Descs' ,
            }, 
            PI_qty: { 
                cValidate :'required', 
                cName: 'qttty', 
                cLabel: 'Quantity', 
                cLabelSize: 4, 
                cOrder: 52, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_hostatus: { 
                cLabel: 'H/O Status', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_hodate: { 
                cLabel: 'H/O Date', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_endofwarrantyperiod: { 
                cLabel: 'End of Warranty Period', 
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
                cOrder:53, 
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
        OnaccessorycdChange (data) {
        this.$nextTick(() => {
            this.M_SM_LotAccessory.accessorycd = data.id
            this.M_SM_LotAccessory.accessorycdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{accessorycd}
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
            this.M_SM_LotAccessory.lotno = data.LotNo 
            this.propList.initialWhere ="SubPortfolioCd='"+this.getDataUser().subportfolio_cd+"' AND LotNo = '" + data.LotNo + "' "
        

            this.FormToABSList().doGetList('','eb_getList')
        },		
		M_CheckboxChecked(data, status, index){

        },		
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfolioCD: this.getDataUser().subportfolio_cd,
                LotNo: this.M_SM_LotAccessory.lotno,
                AccessoryCd: this.M_SM_LotAccessory.accessorycd == '' || this.M_SM_LotAccessory.accessorycd == null ? 'NULL' : this.M_SM_LotAccessory.accessorycd ,
                Qty: this.M_SM_LotAccessory.qty,
                Remarks: this.M_SM_LotAccessory.remarks,
                UserInput: this.getDataUser().user_id ,
                UserEdit: this.getDataUser().user_id                 
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
                SubPortfolioCD: this.getDataUser().subportfolio_cd,
                LotNo: this.M_SM_LotAccessory.lotno,
                AccessoryCd: this.M_SM_LotAccessory.accessorycd == '' || this.M_SM_LotAccessory.accessorycd == null ? 'NULL' : this.M_SM_LotAccessory.accessorycd ,
                Qty: this.M_SM_LotAccessory.qty,
                Remarks: this.M_SM_LotAccessory.remarks,
                UserEdit: this.getDataUser().user_id ,
                LastUpdateStamp: this.M_SM_LotAccessory.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_SM_LotAccessory = {
                subportfoliocd: this.getDataUser().subportfolio_cd,
                lotno: '',
                accessorycd: '',
                accessorydesc: '',
                qty: '0',
                hostatus: '',
                hodate: '',
                endofwarrantyperiod: 'Month',
                remarks: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                lastupdatestamp: 0,
                rowid: 0
                    }
            	
		},
        M_New(){
            let data = this.$store.getters.GetPage1Data
            this.M_SM_LotAccessory.lotno = data.LotNo 

            this.$refs.ref_accessorycd.focus()

        },
        M_Edit(){
            this.$refs.ref_qty.focus()
        },
        M_Delete(dt){           
			var data = this.FormToABSList().getRowSelected()  
			var dataDelete = []

			
			data.forEach((value) => {

				
				dataDelete.push({
					_Message_:'',
                    SubPortfolioCD: this.getDataUser().subportfolio_cd,
                    LotNo: value.LotNo,
                    AccessoryCd: value.AccessoryCd == '' || value.AccessoryCd == null ? 'NULL' : value.AccessoryCd ,
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
,                SubPortfolioCD: this.getDataUser().subportfolio_cd,
                lotno: record.LotNo,
                accessorycd: record.AccessoryCd				
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
                console.log(data)
this.M_SM_LotAccessory = {
                subportfoliocd: data.subportfoliocd,
                lotno: data.lotno,
                accessorycd: data.accessorycd,
                accessorydesc: data.accessorydesc,
                qty: this.isCurrency(data.qty, this.decimal),
                hostatus: data.hostatus,
                hodate: data.hodate,
                endofwarrantyperiod: data.endofwarrantyperiod,
                remarks: data.remarks,
                userinput: data.userinput,
                useredit: data.useredit,
                timeinput: data.timeinput,
                timeedit: data.timeedit,
                lastupdatestamp: record.LastUpdateStamp,
                rowid: data.rowid
                    }
                 

                this.M_SM_LotAccessory.accessorycdLabel = this.M_SM_LotAccessory.accessorycd != null && this.M_SM_LotAccessory.accessorycd != '' ? data.accessorycd + this.separator + data.accessorydesc :'' 
  

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

