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
                                        <ABSInputSelectList @change="OnsubportfoliocdChange" :prop="PI_subportfoliocd" :value="M_CM_SIR1Entry.subportfoliocd" :label="M_CM_SIR1Entry.subportfoliocdLabel" ref="ref_subportfoliocd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_sirno" v-model="M_CM_SIR1Entry.sirno"  ref="ref_sirno" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputDateVuex :prop="PI_sirdate" v-model="M_CM_SIR1Entry.sirdate"  ref="ref_sirdate" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_requestname" v-model="M_CM_SIR1Entry.requestname"  ref="ref_requestname"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_referenceno" v-model="M_CM_SIR1Entry.referenceno"  ref="ref_referenceno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnsirtypeChange" :prop="PI_sirtype" v-model="M_CM_SIR1Entry.sirtype"  ref="ref_sirtype" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnmodulecdChange" :prop="PI_modulecd" :value="M_CM_SIR1Entry.modulecd" :label="M_CM_SIR1Entry.modulecdLabel" ref="ref_modulecd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnformcdChange" :prop="PI_formcd" :value="M_CM_SIR1Entry.formcd" :label="M_CM_SIR1Entry.formcdLabel" ref="ref_formcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col md="6" v-show="err1">
                                            <b-row v-show="err1">
                                                <b-col offset="4"><label class="lbl-value-view-form" style="color:red"> The Form Code is required.  </label></b-col>
                                            </b-row>
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OndescsChange" :prop="PI_descs" v-model="M_CM_SIR1Entry.descs"  ref="ref_descs" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnreasonChange" :prop="PI_reason" v-model="M_CM_SIR1Entry.reason"  ref="ref_reason" />
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
        Module:"CM",
        error: false,
        err1: false,
            propList: {
                initialWhere: "SubPortfolioCd = '"+ this.getDataUser().subportfolio_cd +"' AND SIRstatus = 'N'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_CM_SIR1Entry :{
                subportfoliocd: this.getDataUser().subportfolio_cd,
                sirno: '',
                sirdate: '',
                sirtype: 'F',
                referenceno: '',
                requestid: '',
                requestname: '',
                modulecd: '',
                formcd: '',
                descs: '',
                category: '',
                expecteddate: '',
                reason: '',
                approvedby: '',
                approveddate: '',
                checkby: '',
                checkdate: '',
                descriptionchecker: '',
                authorizedby: '',
                authorizeddate: '',
                completedby: '',
                completeddate: '',
                doneby: '',
                donedate: '',
                acceptedby: '',
                accepteddate: '',
                testedby: '',
                testeddate: '',
                assignto: '',
                canceldate: '',
                mandays: 0,
                reasoncd: '',
                reasondescs: '',
                remarks: '',
                sirstatus: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                lastupdatestamp: 0,
                rowid: 0
                    }
            ,
            PI_subportfoliocd: { 
                dataLookUp: { 
                    LookUpCd: 'GetSubPortfolioCd'    , 
                    ColumnDB: 'SubPortfolioCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'subportfoliocd', 
                cLabel: 'SubPortfolio Code', 
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
                cDisplayColumn: 'SubPortfolioCd,Name' ,
            }, 
            PI_sirno: {
                cValidate :'max:5', 
                cName: 'sirno', 
                cLabel: 'SIR No', 
                cLabelSize: 4, 
                cOrder: 2, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            }, 
            PI_sirdate: { 
                cValidate :'', 
                cName: 'sirdate', 
                cLabel: 'SIR Date', 
                cLabelSize: 4, 
                cOrder: 3, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_requestname: { 
                cValidate :'required|max:60', 
                cName: 'requestname', 
                cLabel: 'Request By', 
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
            PI_referenceno: { 
                cValidate :'max:50', 
                cName: 'referenceno', 
                cLabel: 'Reference No', 
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
            PI_sirtype: { 
                cValidate :'required', 
                cName: 'sirtype', 
                cId: 'rdbsirtype', 
                cRadioOptions: [{ text: 'Form', value: 'F' }, { text: 'Process', value: 'P' }, { text: 'Report', value: 'R' }, { text: 'DataCorrection', value: 'B' }, { text: 'Other', value: 'O' }], 
                cRadioDefaultOption: 'F', 
                cLabel:'Type', 
                cLabelSize: 4, 
                cOrder: 6, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_modulecd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupSSModule'    , 
                    ColumnDB: 'ModuleCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
                cName: 'modulecd', 
                cLabel: 'Module Code', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 7, 
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
                cDisplayColumn: 'ModuleCd,Descs' ,
            }, 
            PI_formcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupSSPageCode'    , 
                    ColumnDB: 'PageCd'   , 
                    InitialWhere: "ModuleCd = ''"   , 
                    ParamWhere: '',
                    OrderBy: 'ModuleCd' 
                        }, 
                cValidate :'', 
                cName: 'formcd', 
                cLabel: 'Form Code', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 8, 
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
                cDisplayColumn: 'PageCd,TextMenu' ,
            }, 
            PI_descs: { 
                cValidate :'', 
                cName:'descs', 
                cLabel:'Description', 
                cLabelSize: 4, 
                cOrder:9, 
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
            PI_reason: { 
                cValidate :'', 
                cName:'reason', 
                cLabel:'Reason', 
                cLabelSize: 4, 
                cOrder:10, 
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
                cFormPageNo: this.data.PageOrder
            }
        }
    },
    watch: {
        'M_CM_SIR1Entry.sirtype'() {
            if (this.M_CM_SIR1Entry.sirtype == 'F' || this.M_CM_SIR1Entry.sirtype == 'P') {
                this.PI_formcd.cValidate = 'required'
                this.$refs.ref_formcd.isRequired = true
            }
            else {
                this.PI_formcd.cValidate = ''
                this.$refs.ref_formcd.isRequired = false
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
	}
  },
    methods: {
        GetUserSubPortfolio (){
            var param = {
                OptionFunctionCd: "GetUserSubPortfolio",
                ModuleCd: this.Module,
                UserId: this.getDataUser().user_id
            }
            this.FnDynamicFunction(param)
            .then(ress => {
                if (ress == null) return
                var data = ress[0]
                
                this.M_CM_SIR1Entry.subportfoliocdLabel = this.M_CM_SIR1Entry.subportfoliocd != null ? data.SubPortfolioCd :'' 
                this.M_CM_SIR1Entry.sirdate = this.getToday()
                this.M_CM_SIR1Entry.requestname = this.getDataUser().user_name
                this.M_CM_SIR1Entry.sirno = "(Auto Number)"


            })
        },	
        OnsubportfoliocdChange (data) {
        if (this.M_CM_SIR1Entry.subportfoliocd == data.id) return
        this.$nextTick(() => {
            this.M_CM_SIR1Entry.subportfoliocd = data.id
            this.M_CM_SIR1Entry.subportfoliocdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{subportfoliocd}
            }
        })
        this.$forceUpdate()
        },
        OnsirtypeChange (data) {
        this.M_CM_SIR1Entry.sirtype = data
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
                // if(data == 'F' || data == 'P'){
                //     this.error = true
                //     this.err1 = true
                // }else{
                //     this.err1 = false
                //     this.error = false// this.PI_formcd.cValidate = ''
                // }
            }
        })
        this.$forceUpdate()
        },
        OnmodulecdChange (data) {
        if (this.M_CM_SIR1Entry.modulecd == data.id) return
        this.$nextTick(() => {
            this.M_CM_SIR1Entry.modulecd = data.id
            this.M_CM_SIR1Entry.modulecdLabel = data.label

             
            if (this.inputStatus != "VIEW") {
               if(data.id == '' || data.id == null){
                    this.PI_formcd.dataLookUp.InitialWhere = "ModuleCd = ''"    
                }else{
                    this.PI_formcd.dataLookUp.InitialWhere = "ModuleCd = '"+ data.id +"'"
                }
                
            }
        })
        this.$forceUpdate()
        },
        OnformcdChange (data) {
        if (this.M_CM_SIR1Entry.formcd == data.id) return
        this.$nextTick(() => {
            this.M_CM_SIR1Entry.formcd = data.id
            this.M_CM_SIR1Entry.formcdLabel = data.label
            
            if (this.inputStatus != "VIEW") {
//{formcd}
            }
        })
        this.$forceUpdate()
        },
        OndescsChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{descs}
            }
        })
        this.$forceUpdate()
        },
        OnreasonChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{reason}
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
            this.FormToABSList().doGetList('','eb_getList')
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
        M_Post(){
        },
        M_Insert() {
            if (this.M_CM_SIR1Entry.sirtype == 'F') {
                if (this.M_CM_SIR1Entry.formcd == '') {
                    return
                }
            }
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                SIRDate: this.M_CM_SIR1Entry.sirdate,
                SIRType: this.M_CM_SIR1Entry.sirtype,
                RequestName: this.M_CM_SIR1Entry.requestname,
                ReferenceNo: this.M_CM_SIR1Entry.referenceno,
                ModuleCd: this.M_CM_SIR1Entry.modulecd == '' || this.M_CM_SIR1Entry.modulecd == null ? 'NULL' : this.M_CM_SIR1Entry.modulecd ,
                FormCd: this.M_CM_SIR1Entry.formcd == '' || this.M_CM_SIR1Entry.formcd == null ? 'NULL' : this.M_CM_SIR1Entry.formcd ,
                Descs: this.M_CM_SIR1Entry.descs,
                Reason: this.M_CM_SIR1Entry.reason,
                RequestID: this.getDataUser().user_id,
                SIRStatus: this.M_CM_SIR1Entry.sirstatus,
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
                SIRNo: this.M_CM_SIR1Entry.sirno,
                SIRType: this.M_CM_SIR1Entry.sirtype,
                ReferenceNo: this.M_CM_SIR1Entry.referenceno,
                RequestName: this.M_CM_SIR1Entry.requestname,
                ModuleCd: this.M_CM_SIR1Entry.modulecd == '' || this.M_CM_SIR1Entry.modulecd == null ? 'NULL' : this.M_CM_SIR1Entry.modulecd ,
                FormCd: this.M_CM_SIR1Entry.formcd == '' || this.M_CM_SIR1Entry.formcd == null ? 'NULL' : this.M_CM_SIR1Entry.formcd ,
                Descs: this.M_CM_SIR1Entry.descs,
                Category: this.M_CM_SIR1Entry.category,
                ExpectedDate: this.M_CM_SIR1Entry.expecteddate,
                Reason: this.M_CM_SIR1Entry.reason,
                ApprovedBy: this.M_CM_SIR1Entry.approvedby,
                ApprovedDate: this.M_CM_SIR1Entry.approveddate,
                CheckBy: this.M_CM_SIR1Entry.checkby,
                CheckDate: this.M_CM_SIR1Entry.checkdate,
                DescriptionChecker: this.M_CM_SIR1Entry.descriptionchecker,
                AuthorizedBy: this.M_CM_SIR1Entry.authorizedby,
                AuthorizedDate: this.M_CM_SIR1Entry.authorizeddate,
                CompletedBy: this.M_CM_SIR1Entry.completedby,
                CompletedDate: this.M_CM_SIR1Entry.completeddate,
                DoneBy: this.M_CM_SIR1Entry.doneby,
                DoneDate: this.M_CM_SIR1Entry.donedate,
                AcceptedBy: this.M_CM_SIR1Entry.acceptedby,
                AcceptedDate: this.M_CM_SIR1Entry.accepteddate,
                TestedBy: this.M_CM_SIR1Entry.testedby,
                TestedDate: this.M_CM_SIR1Entry.testeddate,
                AssignTo: this.M_CM_SIR1Entry.assignto,
                CancelDate: this.M_CM_SIR1Entry.canceldate,
                Mandays: this.M_CM_SIR1Entry.mandays,
                ReasonCd: this.M_CM_SIR1Entry.reasoncd,
                ReasonDescs: this.M_CM_SIR1Entry.reasondescs,
                Remarks: this.M_CM_SIR1Entry.remarks,
                SIRStatus: this.M_CM_SIR1Entry.sirstatus,
                UserEdit: this.getDataUser().user_id                 
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })

        },
		M_ClearForm(){
            this.M_CM_SIR1Entry = {
                subportfoliocd: this.getDataUser().subportfolio_cd,
                sirno: '',
                sirdate: '',
                sirtype: 'F',
                referenceno: '',
                requestid: '',
                requestname: '',
                modulecd: '',
                formcd: '',
                descs: '',
                category: '',
                expecteddate: '',
                reason: '',
                approvedby: '',
                approveddate: '',
                checkby: '',
                checkdate: '',
                descriptionchecker: '',
                authorizedby: '',
                authorizeddate: '',
                completedby: '',
                completeddate: '',
                doneby: '',
                donedate: '',
                acceptedby: '',
                accepteddate: '',
                testedby: '',
                testeddate: '',
                assignto: '',
                canceldate: '',
                mandays: 0,
                reasoncd: '',
                reasondescs: '',
                remarks: '',
                sirstatus: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                lastupdatestamp: 0,
                rowid: 0
            }

            this.PI_formcd.cValidate = 'required'
            this.$refs.ref_formcd.isRequired = true
		},
        M_New(){
            this.GetUserSubPortfolio()
            this.$refs.ref_subportfoliocd.focus()
        },
        M_Edit(){
            this.$refs.ref_subportfoliocd.focus()
        },
        M_Delete(dt){       

            var data = this.FormToABSList().getRowSelected()  
        var dataDelete = []

        
        data.forEach((value) => {
          dataDelete.push({
          SIRNo: value.SIRNo,
          LastUpdateStamp: value.LastUpdateStamp,
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
,                sirno: record.SIRNo
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
this.M_CM_SIR1Entry = {
                subportfoliocd: data.subportfoliocd,
                sirno: data.sirno,
                sirdate: data.sirdate,
                sirtype: data.sirtype,
                referenceno: data.referenceno,
                requestid: data.requestid,
                requestname: data.requestname,
                modulecd: data.modulecd,
                formcd: data.formcd,
                descs: data.descs,
                category: data.category,
                expecteddate: data.expecteddate,
                reason: data.reason,
                approvedby: data.approvedby,
                approveddate: data.approveddate,
                checkby: data.checkby,
                checkdate: data.checkdate,
                descriptionchecker: data.descriptionchecker,
                authorizedby: data.authorizedby,
                authorizeddate: data.authorizeddate,
                completedby: data.completedby,
                completeddate: data.completeddate,
                doneby: data.doneby,
                donedate: data.donedate,
                acceptedby: data.acceptedby,
                accepteddate: data.accepteddate,
                testedby: data.testedby,
                testeddate: data.testeddate,
                assignto: data.assignto,
                canceldate: data.canceldate,
                mandays: data.mandays,
                reasoncd: data.reasoncd,
                reasondescs: data.reasondescs,
                remarks: data.remarks,
                sirstatus: data.sirstatus,
                userinput: data.userinput,
                useredit: data.useredit,
                lastupdatestamp: record.LastUpdateStamp,
                rowid: data.rowid
                    }

                if (data.sirtype == 'F' || data.sirtype == 'P') {
                    this.PI_formcd.cValidate = 'required'
                    this.$refs.ref_formcd.isRequired = true
                }
                else {
                    this.PI_formcd.cValidate = ''
                    this.$refs.ref_formcd.isRequired = false
                }
                 

                this.M_CM_SIR1Entry.subportfoliocdLabel = this.M_CM_SIR1Entry.subportfoliocd != null ? data.subportfoliocd  :'' 
                this.M_CM_SIR1Entry.modulecdLabel = this.M_CM_SIR1Entry.modulecd != null ? data.modulecd  :'' 
                this.M_CM_SIR1Entry.formcdLabel = this.M_CM_SIR1Entry.formcd != null ? data.formcd  :'' 
         

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

