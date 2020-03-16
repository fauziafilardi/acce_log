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
                                        <ABSInputSelectList @change="OncontactidChange" :prop="PI_contactid" :value="M_SM_AuctionParticipantAgent.contactid" :label="M_SM_AuctionParticipantAgent.contactidLabel" ref="ref_contactid"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_referenceno" v-model="M_SM_AuctionParticipantAgent.referenceno"  ref="ref_referenceno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnauctiongroupcdChange" :prop="PI_auctiongroupcd" :value="M_SM_AuctionParticipantAgent.auctiongroupcd" :label="M_SM_AuctionParticipantAgent.auctiongroupcdLabel" ref="ref_auctiongroupcd"/>
                                      </b-col>
                                    </b-row>
                                    <!-- <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnmobileloginidChange" :prop="PI_mobileloginid" :value="M_SM_AuctionParticipantAgent.mobileloginid" :label="M_SM_AuctionParticipantAgent.mobileloginidLabel" ref="ref_mobileloginid"/>
                                      </b-col>
                                    </b-row> -->
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OncategorycdChange" :prop="PI_categorycd" :value="M_SM_AuctionParticipantAgent.categorycd" :label="M_SM_AuctionParticipantAgent.categorycdLabel" ref="ref_categorycd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnstatusChange" :prop="PI_status" v-model="M_SM_AuctionParticipantAgent.status"  ref="ref_status" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnreasoncdChange" :prop="PI_reasoncd" :value="M_SM_AuctionParticipantAgent.reasoncd" :label="M_SM_AuctionParticipantAgent.reasoncdLabel" ref="ref_reasoncd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_reasondescs" v-model="M_SM_AuctionParticipantAgent.reasondescs"  ref="ref_reasondescs"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_SM_AuctionParticipantAgent.remarks"  ref="ref_remarks" />
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
                initialWhere: "AgentType = 'A' AND SubportfolioCd='"+this.getDataUser().subportfolio_cd+"'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_SM_AuctionParticipantAgent :{
                contactid: '',
                referenceno: '',
                auctiongroupcd: '',
                mobileloginid: '',
                categorycd: '',
                reasoncd: '',
                reasondescs: '',
                remarks: '',
                lastupdatestamp:'',
                status:'A'
                    }
            ,
            PI_contactid: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMContact'    , 
                    ColumnDB: 'ContactId'   , 
                    InitialWhere: "ContactID NOT IN ( SELECT ContactID FROM TN_Marketing )"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'ContactId,Name' 
                        }, 
                cValidate :'required', 
                cName: 'contactid', 
                cLabel: 'Participant ID', 
                cKey: true, 
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
                cMasterUrl: 'CM/CM_Contact' ,
                cDisplayColumn: 'ContactId,Name' ,
            }, 
            PI_referenceno: { 
                cValidate :'', 
                cName: 'referenceno', 
                cLabel: 'Reference No', 
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
            PI_auctiongroupcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupAuctionGroup'    , 
                    ColumnDB: 'AuctionGroupCd'   , 
                    InitialWhere: "SubPortfolioCd='"+this.getDataUser().subportfolio_cd+"'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'AuctionGroupCd,Descs' 
                        }, 
                cValidate :'required', 
                cName: 'auctiongroupcd', 
                cLabel: 'Auction Group', 
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
                cMasterUrl: 'SM/SM_AuctionGroup' ,
                cDisplayColumn: 'AuctionGroupCd,Descs' ,
            }, 
            // PI_mobileloginid: { 
            //     dataLookUp: { 
            //         LookUpCd: 'GetLookupUserID'    , 
            //         ColumnDB: 'MobileLoginID'   , 
            //         InitialWhere: ""   , 
            //         ParamWhere: '' ,
            //         SourceField: ''  ,
            //         DisplayLookup: '' 
            //             }, 
            //     cValidate :'', 
            //     cName: 'mobileloginid', 
            //     cLabel: 'Web Login ID', 
            //     cKey: false, 
            //     cLabelSize: 4, 
            //     cOrder: 0, 
            //     cTriggered: false, 
            //     cDefault: '', 
            //     cProtect: false, 
            //     cVisible:  true, 
            //     cAsync:  false, 
            //     cFilter: true, 
            //     cPageLevel: this.PageLevel, 
            //     cTabIndex: this.TabIndex, 
            //     cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
            //     cStatic: false, 
            //     cOption: [], 
            //     cMasterUrl: '' ,
            //     cDisplayColumn: '' ,
            // }, 
            PI_categorycd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGroup'    , 
                    ColumnDB: 'CategoryCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'CategoryCd,Descs' 
                        }, 
                cValidate :'', 
                cName: 'categorycd', 
                cLabel: 'Unit Sales Group', 
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
                cMasterUrl: '' ,
                cDisplayColumn: 'CategoryCd,Descs' ,
            }, 
            PI_status: { 
                cValidate :'', 
                cName: 'status', 
                cId: 'rdbstatus', 
                cRadioOptions: [{ text: 'Active', value: 'A' }, { text: 'Non Active', value: 'N' }], 
                cRadioDefaultOption: 'A', 
                cLabel:'Status', 
                cLabelSize: 4, 
                cDefault: '', 
                cOrder: 0, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_reasoncd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMReason'    , 
                    ColumnDB: 'ReasonCd'   , 
                    InitialWhere: "ModuleCd='TN' or ModuleCd is null"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'ReasonCd,Descs' 
                        }, 
                cValidate :'required', 
                cName: 'reasoncd', 
                cLabel: 'Reason', 
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
                cMasterUrl: 'CM/CM_Reason' ,
                cDisplayColumn: 'ReasonCd,Descs' ,
            }, 
            PI_reasondescs: { 
                cValidate :'required|max:150', 
                cName: 'reasondescs', 
                cLabel: 'Reason Description', 
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
		return this.$store.getters.GetPage1Data
	},
	GetDataBy1(){
		return this.$store.getters.GetPage1GetDataBy
	}
  },
    methods: {
        DisableReasonCd (){
            console.log(this.M_SM_AuctionParticipantAgent.status)
            if(this.M_SM_AuctionParticipantAgent.status == 'A'){
                this.PI_reasoncd.cProtect = true
                this.PI_reasondescs.cProtect = true
                this.M_SM_AuctionParticipantAgent.reasoncd = ''
                this.M_SM_AuctionParticipantAgent.reasondescs = ''
                this.PI_reasoncd.cValidate = ''
                this.PI_reasondescs.cValidate = 'max:150'

            } else {
                this.PI_reasoncd.cProtect = false
                this.PI_reasondescs.cProtect = false
                this.PI_reasoncd.cValidate = 'required'
                this.PI_reasondescs.cValidate = 'required|max:150'
            }

            // if(this.M_SM_AuctionParticipantAgent.status == 'A'){
            //     this.PI_reasoncd.cProtect = true
            //     this.PI_reasondescs.cProtect = true                
            // } else {
            //     this.PI_reasoncd.cProtect = false
            //     this.PI_reasondescs.cProtect = false
            //     this.PI_reasoncd.cValidate = 'required'
            //     this.PI_reasondescs.cValidate = 'required|max:150'
            // }
        },		
        OncontactidChange (data) {
        this.$nextTick(() => {
            this.M_SM_AuctionParticipantAgent.contactid = data.id
            this.M_SM_AuctionParticipantAgent.contactidLabel = data.label
            if (this.inputStatus != "VIEW") {
//{contactid}
            }
        })
        this.$forceUpdate()
        },
        OnauctiongroupcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_AuctionParticipantAgent.auctiongroupcd = data.id
            this.M_SM_AuctionParticipantAgent.auctiongroupcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{auctiongroupcd}
            }
        })
        this.$forceUpdate()
        },
//         OnmobileloginidChange (data) {
//         this.$nextTick(() => {
//             this.M_SM_AuctionParticipantAgent.mobileloginid = data.id
//             this.M_SM_AuctionParticipantAgent.mobileloginidLabel = data.label
//             if (this.inputStatus != "VIEW") {
// //{mobileloginid}
//             }
//         })
//         this.$forceUpdate()
//         },
        OncategorycdChange (data) {
        this.$nextTick(() => {
            this.M_SM_AuctionParticipantAgent.categorycd = data.id
            this.M_SM_AuctionParticipantAgent.categorycdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{categorycd}
            }
        })
        this.$forceUpdate()
        },
        OnstatusChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
                this.DisableReasonCd()
                //  if(data == 'A'){
                //     this.PI_reasoncd.cProtect = true
                //     this.PI_reasondescs.cProtect = true
                //     this.M_SM_AuctionParticipantAgent.reasoncd = ''
                //     this.M_SM_AuctionParticipantAgent.reasondescs = ''
                //     this.PI_reasoncd.cValidate = ''
                //     this.PI_reasondescs.cValidate = 'max:150'

                // } else {
                //     this.PI_reasoncd.cProtect = false
                //     this.PI_reasondescs.cProtect = false
                //     this.PI_reasoncd.cValidate = 'required'
                //     this.PI_reasondescs.cValidate = 'required|max:150'
                // }
            }
        })
        this.$forceUpdate()
        },
        OnreasoncdChange (data) {
        this.$nextTick(() => {
            this.M_SM_AuctionParticipantAgent.reasoncd = data.id
            this.M_SM_AuctionParticipantAgent.reasoncdLabel = data.label
            this.M_SM_AuctionParticipantAgent.reasondescs = data.Descs
            if (this.inputStatus != "VIEW") {
//{reasoncd}
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
                ContactId: this.M_SM_AuctionParticipantAgent.contactid == '' || this.M_SM_AuctionParticipantAgent.contactid == null ? 'NULL' : this.M_SM_AuctionParticipantAgent.contactid ,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                ReferenceNo: this.M_SM_AuctionParticipantAgent.referenceno,
                Status: this.M_SM_AuctionParticipantAgent.status,
                ReasonCd: this.M_SM_AuctionParticipantAgent.reasoncd == '' || this.M_SM_AuctionParticipantAgent.reasoncd == null ? 'NULL' : this.M_SM_AuctionParticipantAgent.reasoncd ,
                ReasonDescs: this.M_SM_AuctionParticipantAgent.reasondescs,
                Remarks: this.M_SM_AuctionParticipantAgent.remarks,
                UserInput: this.getDataUser().user_id ,
                CategoryCd: this.M_SM_AuctionParticipantAgent.categorycd == '' || this.M_SM_AuctionParticipantAgent.categorycd == null ? 'NULL' : this.M_SM_AuctionParticipantAgent.categorycd ,
                AgentType: 'A',
                MobileLoginID: this.M_SM_AuctionParticipantAgent.mobileloginid == '' || this.M_SM_AuctionParticipantAgent.mobileloginid == null ? 'NULL' : this.M_SM_AuctionParticipantAgent.mobileloginid ,
                AuctionGroupCd: this.M_SM_AuctionParticipantAgent.auctiongroupcd == '' || this.M_SM_AuctionParticipantAgent.auctiongroupcd == null ? 'NULL' : this.M_SM_AuctionParticipantAgent.auctiongroupcd                 
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
                ContactId: this.M_SM_AuctionParticipantAgent.contactid == '' || this.M_SM_AuctionParticipantAgent.contactid == null ? 'NULL' : this.M_SM_AuctionParticipantAgent.contactid ,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                ReferenceNo: this.M_SM_AuctionParticipantAgent.referenceno,
                Status: this.M_SM_AuctionParticipantAgent.status,
                ReasonCd: this.M_SM_AuctionParticipantAgent.reasoncd == '' || this.M_SM_AuctionParticipantAgent.reasoncd == null ? 'NULL' : this.M_SM_AuctionParticipantAgent.reasoncd ,
                ReasonDescs: this.M_SM_AuctionParticipantAgent.reasondescs,
                Remarks: this.M_SM_AuctionParticipantAgent.remarks,
                CategoryCd: this.M_SM_AuctionParticipantAgent.categorycd == '' || this.M_SM_AuctionParticipantAgent.categorycd == null ? 'NULL' : this.M_SM_AuctionParticipantAgent.categorycd ,
                AgentType: 'A',
                MobileLoginID: this.M_SM_AuctionParticipantAgent.mobileloginid == '' || this.M_SM_AuctionParticipantAgent.mobileloginid == null ? 'NULL' : this.M_SM_AuctionParticipantAgent.mobileloginid ,
                AuctionGroupCd: this.M_SM_AuctionParticipantAgent.auctiongroupcd == '' || this.M_SM_AuctionParticipantAgent.auctiongroupcd == null ? 'NULL' : this.M_SM_AuctionParticipantAgent.auctiongroupcd ,
                UserEdit: this.getDataUser().user_id ,
                LastUpdateStamp: this.M_SM_AuctionParticipantAgent.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_SM_AuctionParticipantAgent = {
                contactid: '',
                referenceno: '',
                auctiongroupcd: '',
                mobileloginid: '',
                categorycd: '',
                reasoncd: '',
                reasondescs: '',
                remarks: '',
                lastupdatestamp:'',
                status:'A'
                    }
            	
	
		},
        M_New(){
			this.DisableReasonCd()
        },
        M_Edit(){
        },
        M_Delete(dt){       
			var data = this.FormToABSList().getRowSelected()  
			var dataDelete = []

			
			data.forEach((value) => {

				
				dataDelete.push({
					_Message_:'',
                    ContactId: value.ContactID,
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
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order
,                contactid: record.ContactID,
                SubPortfolioCd: this.getDataUser().subportfolio_cd
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
this.M_SM_AuctionParticipantAgent = {
                contactid: data.contactid,
                referenceno: data.referenceno,
                auctiongroupcd: data.auctiongroupcd,
                mobileloginid: data.mobileloginid,
                categorycd: data.categorycd,
                reasoncd: data.reasoncd,
                reasondescs: data.reasondescs,
                remarks: data.remarks,
                lastupdatestamp: record.LastUpdateStamp,
                status: data.status
                    }
                 

                this.M_SM_AuctionParticipantAgent.contactidLabel = this.M_SM_AuctionParticipantAgent.contactid != null && this.M_SM_AuctionParticipantAgent.contactid != '' ? data.contactid + this.separator + data.contactname :'' 
                this.M_SM_AuctionParticipantAgent.auctiongroupcdLabel = this.M_SM_AuctionParticipantAgent.auctiongroupcd != null && this.M_SM_AuctionParticipantAgent.auctiongroupcd != '' ? data.auctiongroupcd + this.separator + data.auctiongroupcddescs :'' 
                // this.M_SM_AuctionParticipantAgent.mobileloginidLabel = this.M_SM_AuctionParticipantAgent.mobileloginid != null && this.M_SM_AuctionParticipantAgent.mobileloginid != '' ? data.mobileloginid + this.separator :'' 
                this.M_SM_AuctionParticipantAgent.categorycdLabel = this.M_SM_AuctionParticipantAgent.categorycd != null && this.M_SM_AuctionParticipantAgent.categorycd != '' ? data.categorycd + this.separator + data.categorydescs :'' 
                this.M_SM_AuctionParticipantAgent.reasoncdLabel = this.M_SM_AuctionParticipantAgent.reasoncd != null && this.M_SM_AuctionParticipantAgent.reasoncd != '' ? data.reasoncd + this.separator + data.reasondescs :'' 
         

                this.IEBy.Input = data.userinput
                this.IEBy.Edit = data.useredit

            })
        }

    },
    beforeCreate: function () {
    },
    created: function() {
        this.DisableReasonCd()
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

