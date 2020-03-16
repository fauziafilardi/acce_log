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
                                        <ABSInputSelectList @change="OncontactidChange" :prop="PI_contactid" :value="M_SM_Marketing.contactid" :label="M_SM_Marketing.contactidLabel" ref="ref_contactid"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_referenceno" v-model="M_SM_Marketing.referenceno"  ref="ref_referenceno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnmarketingagentChange" :prop="PI_marketingagent" :value="M_SM_Marketing.marketingagent" :label="M_SM_Marketing.marketingagentLabel" ref="ref_marketingagent"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OncreditorcdChange" :prop="PI_creditorcd" :value="M_SM_Marketing.creditorcd" :label="M_SM_Marketing.creditorcdLabel" ref="ref_creditorcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OncategorycdChange" :prop="PI_categorycd" :value="M_SM_Marketing.categorycd" :label="M_SM_Marketing.categorycdLabel" ref="ref_categorycd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnmarketingidChange" :prop="PI_marketingid" :value="M_SM_Marketing.marketingid" :label="M_SM_Marketing.marketingidLabel" ref="ref_marketingid"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputDateVuex @input="OnstartdateChange" :prop="PI_startdate" v-model="M_SM_Marketing.startdate"  ref="ref_startdate" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnstatusChange" :prop="PI_status" v-model="M_SM_Marketing.status"  ref="ref_status" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnreasoncdChange" :prop="PI_reasoncd" :value="M_SM_Marketing.reasoncd" :label="M_SM_Marketing.reasoncdLabel" ref="ref_reasoncd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_reasondescs" v-model="M_SM_Marketing.reasondescs"  ref="ref_reasondescs"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_SM_Marketing.remarks"  ref="ref_remarks" />
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
                initialWhere: "AgentType = 'M' AND SubPortfolioCd='"+this.getDataUser().subportfolio_cd+"' AND Status = 'A'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_SM_Marketing :{
                contactid: '',
                contactname: '',
                referenceno: '',
                marketingagent: '',
                creditorcd: '',
                categorycd: '',
                marketingid: '',
                startdate: '',
                status: 'A',
                reasoncd: '',
                reasondescs: '',
                remarks: '',
                lastupdatestamp:''
                    }
            ,
            PI_contactid: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMContact'    , 
                    ColumnDB: 'ContactId'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'ContactId,Name' 
                        }, 
                cValidate :'required', 
                cName: 'contactid', 
                cLabel: 'Marketing ID', 
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
            PI_marketingagent: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupTNMarketingAgent'    , 
                    ColumnDB: 'ContactId'   , 
                    InitialWhere: "SubPortfolioCd='"+this.getDataUser().subportfolio_cd+"' AND STATUS <> 'N'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'ContactID,Name' 
                        }, 
                cValidate :'required', 
                cName: 'marketingagent', 
                cLabel: 'Marketing Agent', 
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
                cMasterUrl: 'SM/SM_MarketingAgent' ,
                cDisplayColumn: 'ContactID,Name' ,
            }, 
            PI_creditorcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupAPCreditor'    , 
                    ColumnDB: 'CreditorCd'   , 
                    InitialWhere: "SubPortfolioCd='"+this.getDataUser().subportfolio_cd+"' AND STATUS = 'A'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'CreditorCd,Name' 
                        }, 
                cValidate :'', 
                cName: 'creditorcd', 
                cLabel: 'Creditor Code', 
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
                cMasterUrl: 'AP/AP_Creditor' ,
                cDisplayColumn: 'CreditorCd,Name' ,
            }, 
            PI_categorycd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupGroup'    , 
                    ColumnDB: 'CategoryCd'   , 
                    InitialWhere: "SubPortfolioCd='"+this.getDataUser().subportfolio_cd+"'"   , 
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
            PI_marketingid: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupUserID'    , 
                    ColumnDB: 'UserId'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'UserId,UserName' 
                        }, 
                cValidate :'required', 
                cName: 'marketingid', 
                cLabel: 'Web Login ID', 
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
                cDisplayColumn: 'UserId,UserName' ,
            }, 
            PI_startdate: { 
                cValidate :'required', 
                cName: 'startdate', 
                cLabel: 'Start Date', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
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
                    InitialWhere: "ModuleCd = 'TN' OR ModuleCd IS NULL"   , 
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
            if(this.M_SM_Marketing.status == 'A'){
                this.PI_reasoncd.cProtect = true
                this.PI_reasondescs.cProtect = true
            } else {
                this.PI_reasoncd.cProtect = false
                this.PI_reasondescs.cProtect = false
            }
        },		
        OncontactidChange (data) {
        this.$nextTick(() => {
            this.M_SM_Marketing.contactid = data.id
            this.M_SM_Marketing.contactidLabel = data.label
            if (this.inputStatus != "VIEW") {
//{contactid}
            }
        })
        this.$forceUpdate()
        },
        OnmarketingagentChange (data) {
        this.$nextTick(() => {
            this.M_SM_Marketing.marketingagent = data.id
            this.M_SM_Marketing.marketingagentLabel = data.label
            if (this.inputStatus != "VIEW") {
//{marketingagent}
            }
        })
        this.$forceUpdate()
        },
        OncreditorcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_Marketing.creditorcd = data.id
            this.M_SM_Marketing.creditorcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{creditorcd}
            }
        })
        this.$forceUpdate()
        },
        OncategorycdChange (data) {
        this.$nextTick(() => {
            this.M_SM_Marketing.categorycd = data.id
            this.M_SM_Marketing.categorycdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{categorycd}
            }
        })
        this.$forceUpdate()
        },
        OnmarketingidChange (data) {
        this.$nextTick(() => {
            this.M_SM_Marketing.marketingid = data.id
            this.M_SM_Marketing.marketingidLabel = data.label
            if (this.inputStatus != "VIEW") {
//{marketingid}
            }
        })
        this.$forceUpdate()
        },
        OnstartdateChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{startdate}
            }
        })
        this.$forceUpdate()
        },
        OnstatusChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
                if(data == 'A'){
                    this.PI_reasoncd.cProtect = true
                    this.PI_reasondescs.cProtect = true
                } else {
                    this.PI_reasoncd.cProtect = false
                    this.PI_reasondescs.cProtect = false
                }
            }
        })
        this.$forceUpdate()
        },
        OnreasoncdChange (data) {
        this.$nextTick(() => {
            this.M_SM_Marketing.reasoncd = data.id
            this.M_SM_Marketing.reasoncdLabel = data.label
            this.M_SM_Marketing.reasondescs = data.Descs
            if (this.inputStatus != "VIEW") {

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
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                ContactId: this.M_SM_Marketing.contactid == '' || this.M_SM_Marketing.contactid == null ? 'NULL' : this.M_SM_Marketing.contactid ,
                ReferenceNo: this.M_SM_Marketing.referenceno,
                MarketingAgent: this.M_SM_Marketing.marketingagent == '' || this.M_SM_Marketing.marketingagent == null ? 'NULL' : this.M_SM_Marketing.marketingagent ,
                StartDate: this.M_SM_Marketing.startdate == '' || this.M_SM_Marketing.startdate == null ? 'NULL' : this.M_SM_Marketing.startdate ,
                Status: this.M_SM_Marketing.status,
                ReasonCd: this.M_SM_Marketing.reasoncd == '' || this.M_SM_Marketing.reasoncd == null ? 'NULL' : this.M_SM_Marketing.reasoncd ,
                ReasonDescs: this.M_SM_Marketing.reasondescs,
                Remarks: this.M_SM_Marketing.remarks,
                UserInput: this.getDataUser().user_id ,
                MarketingID: this.M_SM_Marketing.marketingid == '' || this.M_SM_Marketing.marketingid == null ? 'NULL' : this.M_SM_Marketing.marketingid ,
                CategoryCd: this.M_SM_Marketing.categorycd == '' || this.M_SM_Marketing.categorycd == null ? 'NULL' : this.M_SM_Marketing.categorycd ,
                CreditorCd: this.M_SM_Marketing.creditorcd == '' || this.M_SM_Marketing.creditorcd == null ? 'NULL' : this.M_SM_Marketing.creditorcd                 
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
                ContactId: this.M_SM_Marketing.contactid == '' || this.M_SM_Marketing.contactid == null ? 'NULL' : this.M_SM_Marketing.contactid ,
                ReferenceNo: this.M_SM_Marketing.referenceno,
                MarketingAgent: this.M_SM_Marketing.marketingagent == '' || this.M_SM_Marketing.marketingagent == null ? 'NULL' : this.M_SM_Marketing.marketingagent ,
                StartDate: this.M_SM_Marketing.startdate == '' || this.M_SM_Marketing.startdate == null ? 'NULL' : this.M_SM_Marketing.startdate ,
                Status: this.M_SM_Marketing.status,
                ReasonCd: this.M_SM_Marketing.reasoncd == '' || this.M_SM_Marketing.reasoncd == null ? 'NULL' : this.M_SM_Marketing.reasoncd ,
                ReasonDescs: this.M_SM_Marketing.reasondescs,
                Remarks: this.M_SM_Marketing.remarks,
                UserEdit: this.getDataUser().user_id ,
                LastUpdateStamp: this.M_SM_Marketing.lastupdatestamp,
                MarketingID: this.M_SM_Marketing.marketingid == '' || this.M_SM_Marketing.marketingid == null ? 'NULL' : this.M_SM_Marketing.marketingid ,
                CategoryCd: this.M_SM_Marketing.categorycd == '' || this.M_SM_Marketing.categorycd == null ? 'NULL' : this.M_SM_Marketing.categorycd ,
                CreditorCd: this.M_SM_Marketing.creditorcd == '' || this.M_SM_Marketing.creditorcd == null ? 'NULL' : this.M_SM_Marketing.creditorcd,
                LastUpdateStamp : this.M_SM_Marketing.lastupdatestamp                 
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_SM_Marketing = {
                contactid: '',
                contactname: '',
                referenceno: '',
                marketingagent: '',
                creditorcd: '',
                categorycd: '',
                marketingid: '',
                startdate: '',
                status: 'A',
                reasoncd: '',
                reasondescs: '',
                remarks: '',
                lastupdatestamp:''
                    }
            	
	
		},
        M_New(){
            this.DisableReasonCd()
            // if(this.M_SM_Marketing.status == 'A'){
            //     this.PI_reasoncd.cProtect = true
            //     this.PI_reasondescs.cProtect = true
            // } else {
            //     this.PI_reasoncd.cProtect = false
            //     this.PI_reasondescs.cProtect = false
            // }			
        },
        M_Edit(){
        },
        M_Delete(dt){       
			var data = this.FormToABSList().getRowSelected()  
			var dataDelete = []

			
			data.forEach((value) => {

				
				dataDelete.push({
					_Message_:'',
                    SubPortfolioCd: this.getDataUser().subportfolio_cd,
                    ContactId: value.ContactID == '' || value.ContactID == null ? 'NULL' : value.ContactID ,
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
,                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                contactid: record.ContactID
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
this.M_SM_Marketing = {
                contactid: data.contactid,
                contactname: data.contactname,
                referenceno: data.referenceno,
                marketingagent: data.marketingagent,
                creditorcd: data.creditorcd,
                categorycd: data.categorycd,
                marketingid: data.marketingid,
                startdate: data.startdate,
                status: data.status,
                reasoncd: data.reasoncd,
                reasondescs: data.cmreasondescs,
                remarks: data.remarks,
                lastupdatestamp: record.LastUpdateStamp
                    }
                 

                this.M_SM_Marketing.contactidLabel = this.M_SM_Marketing.contactid != null && this.M_SM_Marketing.contactid != '' ? data.contactid + this.separator + data.contactname :'' 
                this.M_SM_Marketing.marketingagentLabel = this.M_SM_Marketing.marketingagent != null && this.M_SM_Marketing.marketingagent != '' ? data.marketingagent + this.separator + data.marketingagentname :'' 
                this.M_SM_Marketing.creditorcdLabel = this.M_SM_Marketing.creditorcd != null && this.M_SM_Marketing.creditorcd != '' ? data.creditorcd + this.separator + data.creditorname :'' 
                this.M_SM_Marketing.categorycdLabel = this.M_SM_Marketing.categorycd != null && this.M_SM_Marketing.categorycd != '' ? data.categorycd + this.separator + data.salesunitgroupdescs :'' 
                this.M_SM_Marketing.marketingidLabel = this.M_SM_Marketing.marketingid != null && this.M_SM_Marketing.marketingid != '' ? data.marketingid + this.separator + data.username :'' 
                this.M_SM_Marketing.reasoncdLabel = this.M_SM_Marketing.reasoncd != null && this.M_SM_Marketing.reasoncd != '' ? data.reasoncd + this.separator + data.cmreasondescs :'' 
         

                this.IEBy.Input = data.userinput
                this.IEBy.Edit = data.useredit

            })
        }

    },
    beforeCreate: function () {
    },
    created: function() {
        this.DisableReasonCd()
        // if(this.M_SM_Marketing.status == 'A'){
        //     this.PI_reasoncd.cProtect = true
        //     this.PI_reasondescs.cProtect = true
        // } else {
        //     this.PI_reasoncd.cProtect = false
        //     this.PI_reasondescs.cProtect = false
        // }

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

