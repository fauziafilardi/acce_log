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
                                        <ABSinputTextVuex :prop="PI_sequenceno" v-model="M_SM_SalesTypeDt.sequenceno"  ref="ref_sequenceno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelect2 @change="OntrxmethodChange" :prop="PI_trxmethod" :value="M_SM_SalesTypeDt.trxmethod" :label="M_SM_SalesTypeDt.trxmethodLabel" ref="ref_trxmethod"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OntrxtypeChange" :prop="PI_trxtype" :value="M_SM_SalesTypeDt.trxtype" :label="M_SM_SalesTypeDt.trxtypeLabel" ref="ref_trxtype"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_descs" v-model="M_SM_SalesTypeDt.descs"  ref="ref_descs"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnflagChange" :prop="PI_flag" v-model="M_SM_SalesTypeDt.flag"  ref="ref_flag" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_interval" v-model="M_SM_SalesTypeDt.interval"  ref="ref_interval"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_noofinstall" v-model="M_SM_SalesTypeDt.noofinstall"  ref="ref_noofinstall"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnchargebasisChange" :prop="PI_chargebasis" v-model="M_SM_SalesTypeDt.chargebasis"  ref="ref_chargebasis" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_stagepercent" v-model="M_SM_SalesTypeDt.stagepercent"  ref="ref_stagepercent"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_amount" v-model="M_SM_SalesTypeDt.amount"  ref="ref_amount"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_days" v-model="M_SM_SalesTypeDt.days"  ref="ref_days"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OndaysfromChange" :prop="PI_daysfrom" :value="M_SM_SalesTypeDt.daysfrom" :label="M_SM_SalesTypeDt.daysfromLabel" ref="ref_daysfrom"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OndeductnewChange" :prop="PI_deductnew" :value="M_SM_SalesTypeDt.deductnew" :label="M_SM_SalesTypeDt.deductnewLabel" ref="ref_deductnew"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_datepart" v-model="M_SM_SalesTypeDt.datepart"  ref="ref_datepart"/>
                                      </b-col>
                                    </b-row>
                                    <!-- <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_SM_SalesTypeDt.remarks"  ref="ref_remarks" />
                                      </b-col>
                                    </b-row> -->
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
                initialWhere:"SalesTypeCd = '" + this.ValKey + "'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: 'SequenceNo ASC', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_SM_SalesTypeDt :{
                trxmethod:'',
                trxtype:'',
                descs:'',
                flag:'D',
                interval:'',
                noofinstall:'',
                stagepercent:'',
                amount:'',
                days:'',
                daysfrom:'',
                deductnew:'',
                datepart:'',
                base:'M',
                lastupdatestamp: '',
                sequenceno:'',
                chargebasis:''

                    }
            ,
            PI_sequenceno: { 
                cValidate :'required', 
                cName: 'sequenceno', 
                cLabel: 'Sequence No', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_trxmethod: { 
                dataLookUp: null, 
                cValidate :'required', 
                cName:'trxmethod', 
                cLabel:'Transaction Method', 
                cKey:true, 
                cOrder:0, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cStatic: true,
                cOption: [{ label: 'Booking Fee', id: 'B' },{ label: 'Down Payment', id: 'D' },{ label: 'Full Payment', id: 'P' },{ label: 'Installment', id: 'I' }]
            },
            PI_trxtype: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMTransTypeMaster'    , 
                    ColumnDB: 'TrxType'   , 
                    InitialWhere: "ModuleCd ='SM'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'TransactionType,Descs' 
                        }, 
                cValidate :'required', 
                cName: 'trxtype', 
                cLabel: 'Transaction Type', 
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
                cDisplayColumn: 'TransactionType,Descs' ,
            }, 
            PI_descs: { 
                cValidate :'required', 
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
            PI_flag: { 
                cValidate :'', 
                cName: 'flag', 
                cId: 'rdbflag', 
                cRadioOptions: [{ text: 'Day', value: 'D' },{ text: 'Month', value: 'M' },], 
                cRadioDefaultOption: 'Y', 
                cLabel:'Flag', 
                cLabelSize: 4, 
                cDefault: 'D', 
                cOrder: 0, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_interval: { 
                cValidate :'required', 
                cName: 'interval', 
                cLabel: 'Interval', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_noofinstall: { 
                cValidate :'required', 
                cName: 'noofinstall', 
                cLabel: 'No of Install', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_chargebasis: { 
                cValidate :'', 
                cName: 'chargebasis', 
                cId: 'rdbchargebasis', 
                cRadioOptions: [{ text: 'Percentage', value: 'P' },{ text: 'Fix Amount', value: 'F' },], 
                cRadioDefaultOption: 'P', 
                cLabel:'Charge Basis', 
                cLabelSize: 4, 
                cDefault: 'P', 
                cOrder: 0, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_stagepercent: { 
                cValidate :'max_value:100', 
                cName: 'stagepercent', 
                cLabel: 'Percentage', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_amount: { 
                cValidate :'', 
                cName: 'amount', 
                cLabel: 'Amount', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_days: { 
                cValidate :'', 
                cName: 'days', 
                cLabel: 'Days', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_daysfrom: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMTransTypeMaster'    , 
                    ColumnDB: 'TrxType'   , 
                    InitialWhere: " ModuleCd ='SM'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'TransactionType,Descs' 
                        }, 
                cValidate :'', 
                cName: 'daysfrom', 
                cLabel: 'From Transaction', 
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
                cDisplayColumn: 'TransactionType,Descs' ,
            },
            PI_deductnew: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMTransTypeMaster'    , 
                    ColumnDB: 'TrxType'   , 
                    InitialWhere: " ModuleCd ='SM'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'TransactionType,Descs' 
                        }, 
                cValidate :'', 
                cName: 'deductnew', 
                cLabel: 'Deduct', 
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
                cDisplayColumn: 'TransactionType,Descs' ,
            },
            PI_datepart: { 
                cValidate :'max_value:31', 
                cName: 'datepart', 
                cLabel: 'Date Part', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            // PI_remarks: { 
            //     cValidate :'', 
            //     cName:'remarks', 
            //     cLabel:'Remarks', 
            //     cLabelSize: 4, 
            //     cOrder:0, 
            //     cKey: false, 
            //     cDefault: '', 
            //     cProtect: false, 
            //     cVisible: true, 
            //     cResize: false, 
            //     cReadOnly: false, 
            //     cRows: 3, 
            //     cMaxRows: 3, 
            //     cSize: 'md', 
            //     cPageLevel: this.PageLevel, 
            //     cTabIndex: this.TabIndex, 
            //     cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
            // }, 

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
        SeqRunningNo (SalesTypeCd) {            
            var param = {
            OptionFunctionCd: "GetSeqRunningNo",
            ModuleCd: this.Module,
            SubPortfolioCd: this.getDataUser().subportfolio_cd,
            SalesTypeCd: SalesTypeCd
          }

          this.FnDynamicFunction(param)
            .then(ress => {                
                if (ress.length > 0) {
                    var data = ress[0]
                    this.M_SM_SalesTypeDt.sequenceno = data.SequenceNo
                }
            })

        },
        OntrxmethodChange (data) {            
        this.$nextTick(() => {
            this.M_SM_SalesTypeDt.trxmethod = data.id
            this.M_SM_SalesTypeDt.trxmethodLabel = data.label
            
            if (this.inputStatus != "VIEW") {
                if(data.id == 'P'){
                    this.PI_datepart.cValidate = 'required|max_value:31'
                }else{
                    this.PI_datepart.cValidate = 'max_value:31'
                }
            }
        })
        this.$forceUpdate()
        },
        OntrxtypeChange (data) {            
        this.$nextTick(() => {
            this.M_SM_SalesTypeDt.trxtype = data.id
            this.M_SM_SalesTypeDt.trxtypeLabel = data.label
            this.M_SM_SalesTypeDt.descs = data.Descs
            if (this.inputStatus != "VIEW") {
//{trxmethod}
            }
        })
        this.$forceUpdate()
        },
        OnflagChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{flag}
            }
        })
        this.$forceUpdate()
        },
        OnchargebasisChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
                if(data == 'P'){
                    this.PI_stagepercent.cProtect = false
                    this.PI_amount.cProtect = true
                    this.M_SM_SalesTypeDt.amount = ''
                } else {
                    this.PI_stagepercent.cProtect = true
                    this.PI_amount.cProtect = false
                    this.M_SM_SalesTypeDt.stagepercent = ''
                }
            }
        })
        this.$forceUpdate()
        },
        OndaysfromChange (data) {
        this.$nextTick(() => {
            this.M_SM_SalesTypeDt.daysfrom = data.id
            this.M_SM_SalesTypeDt.daysfromLabel = data.label
            if (this.inputStatus != "VIEW") {
//{trxmethod}
            }
        })
        this.$forceUpdate()
        },
        OndeductnewChange (data) {
        this.$nextTick(() => {
            this.M_SM_SalesTypeDt.deductnew = data.id
            this.M_SM_SalesTypeDt.deductnewLabel = data.label
            if (this.inputStatus != "VIEW") {
//{trxmethod}
            }
        })
        this.$forceUpdate()
        },
//         OnremarksChange (data) {
//         this.$nextTick(() => {
//             if (this.inputStatus != "VIEW") {
// //{remarks}
//             }
//         })
//         this.$forceUpdate()
//         },
		
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
            this.M_SM_SalesTypeDt.salestypecd = data.SalesTypeCd 
            this.propList.initialWhere =" SalesTypeCd = '" + data.SalesTypeCd + "' "
            console.log(this.DataRowPage1)
        

            this.FormToABSList().doGetList('','eb_getList')
        },		
		M_CheckboxChecked(data, status, index){

        },		
        M_Insert() {
            
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                SalesTypeCd: this.DataRowPage1.SalesTypeCd,
                SequenceNo : this.M_SM_SalesTypeDt.sequenceno,
                TrxType: this.M_SM_SalesTypeDt.trxtype == '' || this.M_SM_SalesTypeDt.trxtype == null ? 'NULL' : this.M_SM_SalesTypeDt.trxtype ,
                Descs: this.M_SM_SalesTypeDt.descs,
                Interval: this.M_SM_SalesTypeDt.interval,
                NoOfInstall: this.M_SM_SalesTypeDt.noofinstall,
                Base:'M', 
                BankSlip : 'NULL',
                ChargeBasis : this.M_SM_SalesTypeDt.chargebasis,
                StagePercent: this.M_SM_SalesTypeDt.stagepercent,
                ArchitectStg : 'NULL',
                Amount: this.M_SM_SalesTypeDt.amount,
                Days: this.M_SM_SalesTypeDt.days,
                DaysFrom: this.M_SM_SalesTypeDt.daysfrom == '' || this.M_SM_SalesTypeDt.daysfrom == null ? 'NULL' : this.M_SM_SalesTypeDt.daysfrom ,
                Deduct : 'NULL',
                Flag: this.M_SM_SalesTypeDt.flag,
                FlagInstall : 'NULL',
                TrxMethod: this.M_SM_SalesTypeDt.trxmethod == '' || this.M_SM_SalesTypeDt.trxmethod == null ? 'NULL' : this.M_SM_SalesTypeDt.trxmethod ,
                TrxModeType : this.M_SM_SalesTypeDt.trxmethod == '' || this.M_SM_SalesTypeDt.trxmethod == null ? 'NULL' : this.M_SM_SalesTypeDt.trxmethod,                
                DeductNew: this.M_SM_SalesTypeDt.deductnew == '' || this.M_SM_SalesTypeDt.deductnew == null ? 'NULL' : this.M_SM_SalesTypeDt.deductnew ,
                DatePart: this.M_SM_SalesTypeDt.datepart,                               
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
                SalesTypeCd: this.DataRowPage1.SalesTypeCd,
                SequenceNo : this.M_SM_SalesTypeDt.sequenceno,
                TrxType: this.M_SM_SalesTypeDt.trxtype == '' || this.M_SM_SalesTypeDt.trxtype == null ? 'NULL' : this.M_SM_SalesTypeDt.trxtype ,
                Descs: this.M_SM_SalesTypeDt.descs,
                Interval: this.M_SM_SalesTypeDt.interval,
                NoOfInstall: this.M_SM_SalesTypeDt.noofinstall,
                Base:'M', 
                BankSlip : 'NULL',
                ChargeBasis : this.M_SM_SalesTypeDt.chargebasis,
                StagePercent: this.M_SM_SalesTypeDt.stagepercent,
                ArchitectStg : 'NULL',
                Amount: this.M_SM_SalesTypeDt.amount,
                Days: this.M_SM_SalesTypeDt.days,
                DaysFrom: this.M_SM_SalesTypeDt.daysfrom == '' || this.M_SM_SalesTypeDt.daysfrom == null ? 'NULL' : this.M_SM_SalesTypeDt.daysfrom ,
                Deduct : 'NULL',
                Flag: this.M_SM_SalesTypeDt.flag,
                FlagInstall : 'NULL',
                TrxMethod: this.M_SM_SalesTypeDt.trxmethod == '' || this.M_SM_SalesTypeDt.trxmethod == null ? 'NULL' : this.M_SM_SalesTypeDt.trxmethod ,
                TrxModeType : this.M_SM_SalesTypeDt.trxmethod == '' || this.M_SM_SalesTypeDt.trxmethod == null ? 'NULL' : this.M_SM_SalesTypeDt.trxmethod,                
                DeductNew: this.M_SM_SalesTypeDt.deductnew == '' || this.M_SM_SalesTypeDt.deductnew == null ? 'NULL' : this.M_SM_SalesTypeDt.deductnew ,
                DatePart: this.M_SM_SalesTypeDt.datepart,                               
                UserEdit: this.getDataUser().user_id,
                LastUpdateStamp: this.M_SM_SalesTypeDt.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_SM_SalesTypeDt = {
                trxmethod:'',
                trxtype:'',
                descs:'',
                flag:'D',
                interval:'',
                noofinstallment:'',
                stagepercent:'',
                amount:'',
                days:'',
                daysfrom:'',
                deductnew:'',
                datepart:'',
                base:'M',
                lastupdatestamp: '',
                sequenceno:'',
                chargebasis:'P'
            }            	
		},
        M_New(){
            let data = this.$store.getters.GetPage1Data
            this.M_SM_SalesTypeDt.salestypecd = data.SalesTypeCd 

            this.SeqRunningNo(data.SalesTypeCd)
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
                    // SalesTypeCd: this.DataRowPage1.SalesTypeCd,
                    // SequenceNo: value.SequenceNo,
                    // trxmethod: value.trxmethod == '' || value.trxmethod == null ? 'NULL' : value.trxmethod ,
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
                LineNo: this.$parent.data.page_order,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                LastUpdateStamp: record.LastUpdateStamp
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
                console.log(data)
                this.M_SM_SalesTypeDt = {
                    sequenceno: record.SequenceNo,
                    trxtype: data.trxtype,
                    descs: data.descs,
                    interval: data.interval,
                    noofinstall: data.noofinstall,
                    base: data.base,
                    bankslip: data.bankslip,
                    chargebasis: data.chargebasis,
                    stagepercent: data.stagepercent,
                    architectstg: data.architectstg,
                    amount: this.isCurrency(data.amount, this.decimal),
                    days: data.days,
                    daysfrom: data.daysfrom,
                    flag: data.flag,
                    trxmethod: data.trxmethod,
                    deductnew: data.deductnew,
                    datepart: data.datepart,
                    lastupdatestamp: record.LastUpdateStamp
                }
                 

                this.M_SM_SalesTypeDt.trxmethodLabel = this.M_SM_SalesTypeDt.trxmethod != null && this.M_SM_SalesTypeDt.trxmethod != '' ? data.trxmethod :'' 
                this.M_SM_SalesTypeDt.trxtypeLabel = this.M_SM_SalesTypeDt.trxtype != null && this.M_SM_SalesTypeDt.trxtype != '' ? data.trxtype + this.separator + data.trxtypedescs :''
                this.M_SM_SalesTypeDt.daysfromLabel = this.M_SM_SalesTypeDt.daysfrom != null && this.M_SM_SalesTypeDt.daysfrom != '' ? data.daysfrom + this.separator + data.daysfromdescs :''
                this.M_SM_SalesTypeDt.deductnewLabel = this.M_SM_SalesTypeDt.deductnew != null && this.M_SM_SalesTypeDt.deductnew != '' ? data.deductnew + this.separator + data.deductnewdescs :''

                 if(data.chargebasis == 'P'){
                    this.PI_stagepercent.cProtect = false
                    this.PI_amount.cProtect = true
                    this.M_SM_SalesTypeDt.amount = ''
                } else {
                    this.PI_stagepercent.cProtect = true
                    this.PI_amount.cProtect = false
                    this.M_SM_SalesTypeDt.stagepercent = ''
                }
  

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

