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
                                        <ABSinputTextVuex :prop="PI_visitornumber" v-model="M_SM_VisitorRegistrationIn.visitornumber"  ref="ref_visitornumber" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputDateTime @input="OnvisitordateChange" :prop="PI_visitordate" v-model="M_SM_VisitorRegistrationIn.visitordate"  ref="ref_visitordate" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnfloorcdChange" :prop="PI_floorcd" :value="M_SM_VisitorRegistrationIn.floorcd" :label="M_SM_VisitorRegistrationIn.floorcdLabel" ref="ref_floorcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col md="6">
                                            <ABSInputSelectList @change="OnlotnoChange" :prop="PI_lotno" :value="M_SM_VisitorRegistrationIn.lotno" :label="M_SM_VisitorRegistrationIn.lotnoLabel" ref="ref_lotno"/>
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_destination" v-model="M_SM_VisitorRegistrationIn.destination"  ref="ref_destination"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OncardnoChange" :prop="PI_cardno" :value="M_SM_VisitorRegistrationIn.cardno" :label="M_SM_VisitorRegistrationIn.cardnoLabel" ref="ref_cardno"/>
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
                initialWhere: "SubPortfolioCd = '" + this.getDataUser().subportfolio_cd + "'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_SM_VisitorRegistrationIn :{
                subportfoliocd: this.getDataUser().subportfolio_cd,
                visitornumber: '',
                visitordate: null,
                floorcd: '',
                lotno: '',
                destination: '',
                cardno: '',
                photoktppath: '',
                photopersonalpath: '',
                timeinput: '',
                timeedit: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                lastupdatestamp: 0,
                rowid: 0,
                descs: ''
                    }
            ,
            PI_visitornumber: { 
                cValidate :'', 
                cName: 'visitornumber',
                cLabel: 'Visitor Number', 
                cLabelSize: 4, 
                cOrder: 1, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_visitordate: { 
                cValidate :'', 
                cName: 'visitordate', 
                cLabel: 'Date - Time', 
                cLabelSize: 4, 
                cOrder: 2, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cFormat: 'dd/MM/yyyy', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_floorcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetFloorCd'    , 
                    ColumnDB: 'FloorCd'   , 
                    InitialWhere: "SubPortfolioCd = '" + this.getDataUser().subportfolio_cd + "'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'floorcd', 
                cLabel: 'Floor', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 3, 
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
                cDisplayColumn: 'FloorCode,Description' ,
            }, 
            PI_lotno: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupLotNo'    , 
                    ColumnDB: 'LotNo'   , 
                    InitialWhere: "SubPortfolioCd = '" + this.getDataUser().subportfolio_cd + "' AND FloorCd = ''"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'lotno', 
                cLabel: 'Unit', 
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
                cDisplayColumn: 'LotNo,Descs' ,
            }, 
            PI_destination: { 
                cValidate :'max:60', 
                cName: 'destination', 
                cLabel: 'Destination', 
                cLabelSize: 4, 
                cOrder: 5, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_cardno: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCardCd'    , 
                    ColumnDB: 'CardCd'   , 
                    InitialWhere: "SubPortfolioCd = '" + this.getDataUser().subportfolio_cd + "' AND CardType = 'P' AND Status = 'A'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'cardno', 
                cLabel: 'Card No', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 6, 
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
                cDisplayColumn: 'CardCd,Descs' ,
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
        OnvisitordateChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{visitordate}
            }
        })
        this.$forceUpdate()
        },
        OnfloorcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_VisitorRegistrationIn.floorcd = data.id
            this.M_SM_VisitorRegistrationIn.floorcdLabel = data.label
            if (this.inputStatus != "VIEW") {
                this.PI_lotno.dataLookUp.InitialWhere = "SubPortfolioCd = '" + this.getDataUser().subportfolio_cd + "' AND FloorCd = '" + data.id + "'"
            }
        })
        this.$forceUpdate()
        },
        OnlotnoChange (data) {
        this.$nextTick(() => {
            this.M_SM_VisitorRegistrationIn.lotno = data.id
            this.M_SM_VisitorRegistrationIn.lotnoLabel = data.label
            if (this.inputStatus != "VIEW") {
//{lotno}
            }
        })
        this.$forceUpdate()
        },
        OncardnoChange (data) {
        this.$nextTick(() => {
            this.M_SM_VisitorRegistrationIn.cardno = data.id
            this.M_SM_VisitorRegistrationIn.cardnoLabel = data.label
            if (this.inputStatus != "VIEW") {
//{cardno}
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
                VisitorNumber: this.M_SM_VisitorRegistrationIn.visitornumber,
                VisitorDate: this.M_SM_VisitorRegistrationIn.visitordate == '' || this.M_SM_VisitorRegistrationIn.visitordate == null ? 'NULL' : this.M_SM_VisitorRegistrationIn.visitordate ,
                FloorCd: this.M_SM_VisitorRegistrationIn.floorcd == '' || this.M_SM_VisitorRegistrationIn.floorcd == null ? 'NULL' : this.M_SM_VisitorRegistrationIn.floorcd ,
                LotNo: this.M_SM_VisitorRegistrationIn.lotno == '' || this.M_SM_VisitorRegistrationIn.lotno == null ? 'NULL' : this.M_SM_VisitorRegistrationIn.lotno ,
                Destination: this.M_SM_VisitorRegistrationIn.destination,
                CardNo: this.M_SM_VisitorRegistrationIn.cardno == '' || this.M_SM_VisitorRegistrationIn.cardno == null ? 'NULL' : this.M_SM_VisitorRegistrationIn.cardno ,
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
                VisitorNumber: this.M_SM_VisitorRegistrationIn.visitornumber,
                VisitorDate: this.M_SM_VisitorRegistrationIn.visitordate == '' || this.M_SM_VisitorRegistrationIn.visitordate == null ? 'NULL' : this.M_SM_VisitorRegistrationIn.visitordate ,
                FloorCd: this.M_SM_VisitorRegistrationIn.floorcd == '' || this.M_SM_VisitorRegistrationIn.floorcd == null ? 'NULL' : this.M_SM_VisitorRegistrationIn.floorcd ,
                LotNo: this.M_SM_VisitorRegistrationIn.lotno == '' || this.M_SM_VisitorRegistrationIn.lotno == null ? 'NULL' : this.M_SM_VisitorRegistrationIn.lotno ,
                Destination: this.M_SM_VisitorRegistrationIn.destination,
                CardNo: this.M_SM_VisitorRegistrationIn.cardno == '' || this.M_SM_VisitorRegistrationIn.cardno == null ? 'NULL' : this.M_SM_VisitorRegistrationIn.cardno ,
                UserEdit: this.getDataUser().user_id ,
                LastUpdateStamp: this.M_SM_VisitorRegistrationIn.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_SM_VisitorRegistrationIn = {
                subportfoliocd: this.getDataUser().subportfolio_cd,
                visitornumber: '(auto)',
                visitordate: null,
                floorcd: '',
                lotno: '',
                destination: '',
                cardno: '',
                photoktppath: '',
                photopersonalpath: '',
                timeinput: '',
                timeedit: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                lastupdatestamp: 0,
                rowid: 0,
                descs: ''
                    }
            		
		},
        M_New(){
            this.M_SM_VisitorRegistrationIn.visitordate = this.M_FormatingDate(new Date()) + ' 00:00'
        },
        M_Edit(){
        },
        M_Delete(dt){       
			var data = this.FormToABSList().getRowSelected()  
			var dataDelete = []

			
			data.forEach((value) => {

				
				dataDelete.push({
                    SubPortfolioCd: this.getDataUser().subportfolio_cd,
                    VisitorNumber: value.VisitorNumber,
                    LastUpdateStamp: value.LastUpdateStamp,
                    _Message_:''


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
                visitornumber: record.VisitorNumber
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
this.M_SM_VisitorRegistrationIn = {
                subportfoliocd: data.subportfoliocd,
                visitornumber: data.visitornumber,
                visitordate: data.visitordate,
                floorcd: data.floorcd,
                lotno: data.lotno,
                destination: data.destination,
                cardno: data.cardno,
                photoktppath: data.photoktppath,
                photopersonalpath: data.photopersonalpath,
                timeinput: data.timeinput,
                timeedit: data.timeedit,
                userinput: data.userinput,
                useredit: data.useredit,
                lastupdatestamp: record.LastUpdateStamp,
                rowid: data.rowid,
                descs: data.descs
                    }
                 

                this.M_SM_VisitorRegistrationIn.floorcdLabel = this.M_SM_VisitorRegistrationIn.floorcd != null && this.M_SM_VisitorRegistrationIn.floorcd != '' ? data.floorcd :'' 
                this.M_SM_VisitorRegistrationIn.lotnoLabel = this.M_SM_VisitorRegistrationIn.lotno != null && this.M_SM_VisitorRegistrationIn.lotno != '' ? data.lotno :'' 
                this.M_SM_VisitorRegistrationIn.cardnoLabel = this.M_SM_VisitorRegistrationIn.cardno != null && this.M_SM_VisitorRegistrationIn.cardno != '' ? data.cardno + this.separator + data.descs :'' 
         

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

