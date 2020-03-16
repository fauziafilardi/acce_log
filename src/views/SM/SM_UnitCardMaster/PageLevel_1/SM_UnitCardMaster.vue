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
                                        <ABSInputSelectList @change="OnlotnoChange" :prop="PI_lotno" :value="M_SM_UnitCardMaster.lotno" :label="M_SM_UnitCardMaster.lotnoLabel" ref="ref_lotno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OncardnoChange" :prop="PI_cardno" :value="M_SM_UnitCardMaster.cardno" :label="M_SM_UnitCardMaster.cardnoLabel" ref="ref_cardno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputDateVuex @input="OnissuedateChange" :prop="PI_issuedate" v-model="M_SM_UnitCardMaster.issuedate"  ref="ref_issuedate" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_descs" v-model="M_SM_UnitCardMaster.descs"  ref="ref_descs"/>
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
                initialWhere: "",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_SM_UnitCardMaster :{
                subportfoliocd: this.getDataUser().subportfolio_cd,
                lotno: '',
                cardno: '',
                issuedate: '',
                descs: '',
                timeinput: '',
                timeedit: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                lastupdatestamp: 0,
                rowid: 0
                    }
            ,
            PI_lotno: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupLotNo'    , 
                    ColumnDB: 'LotNo'   , 
                    InitialWhere: "SubPortfolioCd = '" + this.getDataUser().subportfolio_cd + "'"   , 
                    ParamWhere: '',
                    SourceField: 'UnitNo=LotNo,Descs,TimeEdit',
                    DisplayLookUp:'UnitNo,Descs'  
                        }, 
                cValidate :'required', 
                cName: 'lotno', 
                cLabel: 'Unit No', 
                cKey: false, 
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
                cDisplayColumn: 'UnitNo,Descs' ,
            }, 
            PI_cardno: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCardCd'    , 
                    ColumnDB: 'CardCd'   , 
                    InitialWhere: "SubPortfolioCd = '" + this.getDataUser().subportfolio_cd + "'"   , 
                    ParamWhere: '',
                    SourceField: 'CardNo=CardCd,Descs,TimeEdit',
                    DisplayLookUp:'CardNo,Descs'  
                        }, 
                cValidate :'', 
                cName: 'cardno', 
                cLabel: 'Card No', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 2, 
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
                cDisplayColumn: 'CardNo,Descs' ,
            }, 
            PI_issuedate: { 
                cValidate :'', 
                cName: 'issuedate', 
                cLabel: 'Issue Date', 
                cLabelSize: 4, 
                cOrder: 3, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_descs: { 
                cValidate :'max:60', 
                cName: 'descs', 
                cLabel: 'Description', 
                cLabelSize: 4, 
                cOrder: 4, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
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
        OnlotnoChange (data) {
        this.$nextTick(() => {
            this.M_SM_UnitCardMaster.lotno = data.id
            this.M_SM_UnitCardMaster.lotnoLabel = data.label
            if (this.inputStatus != "VIEW") {
//{lotno}
            }
        })
        this.$forceUpdate()
        },
        OncardnoChange (data) {
        this.$nextTick(() => {
            this.M_SM_UnitCardMaster.cardno = data.id
            this.M_SM_UnitCardMaster.cardnoLabel = data.label
            if (this.inputStatus != "VIEW") {
//{cardno}
            }
        })
        this.$forceUpdate()
        },
        OnissuedateChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{issuedate}
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
        M_Post(dt){
        },
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                LotNo: this.M_SM_UnitCardMaster.lotno == '' || this.M_SM_UnitCardMaster.lotno == null ? 'NULL' : this.M_SM_UnitCardMaster.lotno ,
                CardNo: this.M_SM_UnitCardMaster.cardno == '' || this.M_SM_UnitCardMaster.cardno == null ? 'NULL' : this.M_SM_UnitCardMaster.cardno ,
                IssueDate: this.M_SM_UnitCardMaster.issuedate == '' || this.M_SM_UnitCardMaster.issuedate == null ? 'NULL' : this.M_SM_UnitCardMaster.issuedate ,
                Descs: this.M_SM_UnitCardMaster.descs,
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
                LotNo: this.M_SM_UnitCardMaster.lotno == '' || this.M_SM_UnitCardMaster.lotno == null ? 'NULL' : this.M_SM_UnitCardMaster.lotno ,
                CardNo: this.M_SM_UnitCardMaster.cardno == '' || this.M_SM_UnitCardMaster.cardno == null ? 'NULL' : this.M_SM_UnitCardMaster.cardno ,
                IssueDate: this.M_SM_UnitCardMaster.issuedate == '' || this.M_SM_UnitCardMaster.issuedate == null ? 'NULL' : this.M_SM_UnitCardMaster.issuedate ,
                Descs: this.M_SM_UnitCardMaster.descs,
                UserEdit: this.getDataUser().user_id ,
                LastUpdatestamp: this.M_SM_UnitCardMaster.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_SM_UnitCardMaster = {
                subportfoliocd: this.getDataUser().subportfolio_cd,
                lotno: '',
                cardno: '',
                issuedate: '',
                descs: '',
                timeinput: '',
                timeedit: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                lastupdatestamp: 0,
                rowid: 0
                    }
            		
		},
        M_New(){
			
        },
        M_Edit(){
        },
        M_Delete(dt){       
			var data = this.FormToABSList().getRowSelected()  
			var dataDelete = []

			
			data.forEach((value) => {

				
				dataDelete.push({
                    SubPortfolioCd: this.getDataUser().subportfolio_cd,
                    LotNo: value.LotNo == '' || value.LotNo == null ? 'NULL' : value.LotNo ,
                    CardNo: value.CardNo == '' || value.CardNo == null ? 'NULL' : value.CardNo ,
                    LastUpdateStamp: value.LastupdateStamp,
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
,                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                lotno: record.LotNo,
                cardno: record.CardNo
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
this.M_SM_UnitCardMaster = {
                subportfoliocd: data.subportfoliocd,
                lotno: data.lotno,
                cardno: data.cardno,
                issuedate: data.issuedate,
                descs: data.descs,
                timeinput: data.timeinput,
                timeedit: data.timeedit,
                userinput: data.userinput,
                useredit: data.useredit,
                lastupdatestamp: record.LastupdateStamp,
                rowid: data.rowid
                    }
                 

                this.M_SM_UnitCardMaster.lotnoLabel = this.M_SM_UnitCardMaster.lotno != null && this.M_SM_UnitCardMaster.lotno != '' ? data.lotno  :'' 
                this.M_SM_UnitCardMaster.cardnoLabel = this.M_SM_UnitCardMaster.cardno != null && this.M_SM_UnitCardMaster.cardno != '' ? data.cardno  :'' 
         

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

