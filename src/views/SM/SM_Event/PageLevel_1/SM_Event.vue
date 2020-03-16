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
                                        <ABSinputTextVuex :prop="PI_eventcd" v-model="M_SM_Event.eventcd"  ref="ref_eventcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_eventname" v-model="M_SM_Event.eventname"  ref="ref_eventname"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputDateVuex @input="OneventdateChange" :prop="PI_eventdate" v-model="M_SM_Event.eventdate"  ref="ref_eventdate" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_totalunitsold" v-model="M_SM_Event.totalunitsold"  ref="ref_totalunitsold"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnsubsequenteventChange" :prop="PI_subsequentevent" :value="M_SM_Event.subsequentevent" :label="M_SM_Event.subsequenteventLabel" ref="ref_subsequentevent"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnclusterChange" :prop="PI_cluster" :value="M_SM_Event.cluster" :label="M_SM_Event.clusterLabel" ref="ref_cluster"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_SM_Event.remarks"  ref="ref_remarks" />
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

            M_SM_Event :{
                cluster: '',
                clusterdescs: '',
                eventcd: '',
                eventdate: '',
                eventname: '',
                lastupdatestamp: 0,
                remarks: '',
                status: '',
                subportfoliocd: '',
                subsequentevent: '',
                subsequenteventdescs: '',
                timeedit: '',
                timeinput: '',
                totalunitsold: '',
                useredit: this.getDataUser().user_id,
                userinput: '',
                rowid: ''
                    }
            ,
            PI_eventcd: { 
                cValidate :'required|max:10', 
                cName: 'eventcd', 
                cLabel: 'Kode Event', 
                cLabelSize: 4, 
                cOrder: 1, 
                cKey: true, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_eventname: { 
                cValidate :'required|max:40', 
                cName: 'eventname', 
                cLabel: 'Nama Event', 
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
            PI_eventdate: { 
                cValidate :'required', 
                cName: 'eventdate', 
                cLabel: 'Tanggal Event', 
                cLabelSize: 4, 
                cOrder: 3, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_totalunitsold: { 
                cValidate :'', 
                cName: 'totalunitsold', 
                cLabel: 'Jumlah Unit Terjual', 
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
            PI_subsequentevent: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupEvent'    , 
                    ColumnDB: 'EventCd'   , 
                    InitialWhere: "SubPortfolioCd = '"+this.getDataUser().subportfolio_cd+"' AND STATUS='N'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'EventCd,EventName' 
                        }, 
                cValidate :'', 
                cName: 'subsequentevent', 
                cLabel: 'Event Berikutnya', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 5, 
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
                cDisplayColumn: 'EventCd,EventName' ,
            }, 
            PI_cluster: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupTNBlock'    , 
                    ColumnDB: 'BlockCd'   , 
                    InitialWhere: "SubportfolioCd='"+this.getDataUser().subportfolio_cd+"'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'BlockCode,Description' 
                        }, 
                cValidate :'', 
                cName: 'cluster', 
                cLabel: 'Cluster', 
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
                cDisplayColumn: 'BlockCode,Description' ,
            }, 
            PI_remarks: { 
                cValidate :'', 
                cName:'remarks', 
                cLabel:'Keterangan', 
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
		return this.$store.getters.GetPage1Data
	},
	GetDataBy1(){
		return this.$store.getters.GetPage1GetDataBy
	}
  },
    methods: {		
        OneventdateChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{eventdate}
            }
        })
        this.$forceUpdate()
        },
        OnsubsequenteventChange (data) {
        this.$nextTick(() => {
            this.M_SM_Event.subsequentevent = data.id
            this.M_SM_Event.subsequenteventLabel = data.label
            if (this.inputStatus != "VIEW") {
//{subsequentevent}
            }
        })
        this.$forceUpdate()
        },
        OnclusterChange (data) {
        this.$nextTick(() => {
            this.M_SM_Event.cluster = data.id
            this.M_SM_Event.clusterLabel = data.label
            if (this.inputStatus != "VIEW") {
//{cluster}
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
                EventCd: this.M_SM_Event.eventcd,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                EventName: this.M_SM_Event.eventname,
                EventDate: this.M_SM_Event.eventdate == '' || this.M_SM_Event.eventdate == null ? 'NULL' : this.M_SM_Event.eventdate ,
                SubSequentEvent: this.M_SM_Event.subsequentevent == '' || this.M_SM_Event.subsequentevent == null ? 'NULL' : this.M_SM_Event.subsequentevent ,
                TotalUnitSold: this.M_SM_Event.totalunitsold,
                Cluster: this.M_SM_Event.cluster == '' || this.M_SM_Event.cluster == null ? 'NULL' : this.M_SM_Event.cluster ,
                Remarks: this.M_SM_Event.remarks,
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
                EventCd: this.M_SM_Event.eventcd,
                EventName: this.M_SM_Event.eventname,
                EventDate: this.M_SM_Event.eventdate == '' || this.M_SM_Event.eventdate == null ? 'NULL' : this.M_SM_Event.eventdate ,
                SubSequentEvent: this.M_SM_Event.subsequentevent == '' || this.M_SM_Event.subsequentevent == null ? 'NULL' : this.M_SM_Event.subsequentevent ,
                Cluster: this.M_SM_Event.cluster == '' || this.M_SM_Event.cluster == null ? 'NULL' : this.M_SM_Event.cluster ,
                Remarks: this.M_SM_Event.remarks,
                TotalUnitSold: this.M_SM_Event.totalunitsold,
                UserEdit: this.getDataUser().user_id ,
                LastUpdateStamp: this.M_SM_Event.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_SM_Event = {
                cluster: '',
                clusterdescs: '',
                eventcd: '',
                eventdate: '',
                eventname: '',
                lastupdatestamp: 0,
                remarks: '',
                status: '',
                subportfoliocd: '',
                subsequentevent: '',
                subsequenteventdescs: '',
                timeedit: '',
                timeinput: '',
                totalunitsold: '',
                useredit: this.getDataUser().user_id,
                userinput: '',
                rowid: ''
                    }
            	
	
		},
        M_New(){
			this.$refs.ref_eventcd.focus()
        },
        M_Edit(){
            this.$refs.ref_eventname.focus()
        },
        M_Delete(dt){       
			var data = this.FormToABSList().getRowSelected()  
			var dataDelete = []

			
			data.forEach((value) => {

				// console.log(value)
				dataDelete.push({
					_Message_:'',
                    SubPortFolioCd: this.getDataUser().subportfolio_cd,
                    EventCd: value.EventCd,
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
,                eventcd: record.EventCd,
                SubPortfolioCd: this.getDataUser().subportfolio_cd
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                // console.log(data)
this.M_SM_Event = {
                cluster: data.cluster,
                clusterdescs: data.clusterdescs,
                eventcd: data.eventcd,
                eventdate: data.eventdate,
                eventname: data.eventname,
                lastupdatestamp: record.LastUpdateStamp,
                remarks: data.remarks,
                status: data.status,
                subportfoliocd: data.subportfoliocd,
                subsequentevent: data.subsequentevent,
                subsequenteventdescs: data.subsequenteventdescs,
                timeedit: data.timeedit,
                timeinput: data.timeinput,
                totalunitsold: data.totalunitsold,
                useredit: data.useredit,
                userinput: data.userinput,
                    }
                 

                this.M_SM_Event.subsequenteventLabel = this.M_SM_Event.subsequentevent != null && this.M_SM_Event.subsequentevent != '' ? data.subsequentevent + this.separator + data.subsequenteventdescs :'' 
                this.M_SM_Event.clusterLabel = this.M_SM_Event.cluster != null && this.M_SM_Event.cluster != '' ? data.cluster + this.separator + data.clusterdescs :'' 
         

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

