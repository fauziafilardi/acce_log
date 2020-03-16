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
                                        <ABSinputTextVuex :prop="PI_orderno" v-model="M_SM_GenerateCommissionMaintenance.orderno"  ref="ref_orderno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnsalestypecdChange" :prop="PI_salestypecd" :value="M_SM_GenerateCommissionMaintenance.salestypecd" :label="M_SM_GenerateCommissionMaintenance.salestypecdLabel" ref="ref_salestypecd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_unitno" v-model="M_SM_GenerateCommissionMaintenance.unitno"  ref="ref_unitno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_customername" v-model="M_SM_GenerateCommissionMaintenance.customername"  ref="ref_customername"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputDateVuex @input="OnorderdateChange" :prop="PI_orderdate" v-model="M_SM_GenerateCommissionMaintenance.orderdate"  ref="ref_orderdate" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnmarketingidChange" :prop="PI_marketingid" :value="M_SM_GenerateCommissionMaintenance.marketingid" :label="M_SM_GenerateCommissionMaintenance.marketingidLabel" ref="ref_marketingid"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_lotprice" v-model="M_SM_GenerateCommissionMaintenance.lotprice"  ref="ref_lotprice"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col md="2">
                                        <ABSLabelOnly
                                        :prop="{cLabel: 'Marketing Commission', 
                                          cLabelSize: 4, 
                                          cValue: '', 
                                          cPageLevel: PageLevel, 
                                          cTabIndex: TabIndex, 
                                          cVisible: true,
                                          cClass: 'lbl-col-align'}"
                                        />
                                      </b-col>
                                      <b-col  md="2">
                                        <ABSTextBoxOnly :prop="PI_mktcommissionamount" v-model="M_SM_GenerateCommissionMaintenance.mktcommissionamount"  ref="ref_mktcommissionamount"/>
                                      </b-col>
                                      <b-col md="1">
                                        <ABSTextBoxOnly :prop="PI_mktcommissionpercentage" v-model="M_SM_GenerateCommissionMaintenance.mktcommissionpercentage"  ref="ref_mktcommissionpercentage"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>                                      
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnagentidChange" :prop="PI_agentid" :value="M_SM_GenerateCommissionMaintenance.agentid" :label="M_SM_GenerateCommissionMaintenance.agentidLabel" ref="ref_agentid"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col md="2">
                                        <ABSLabelOnly
                                        :prop="{cLabel: 'Agent Commission', 
                                          cLabelSize: 4, 
                                          cValue: '', 
                                          cPageLevel: PageLevel, 
                                          cTabIndex: TabIndex, 
                                          cVisible: true,
                                          cClass: 'lbl-col-align'}"
                                        />
                                      </b-col>
                                      <b-col  md="2">
                                        <ABSTextBoxOnly :prop="PI_agentcommissionamount" v-model="M_SM_GenerateCommissionMaintenance.agentcommissionamount"  ref="ref_agentcommissionamount"/>
                                      </b-col>
                                      <b-col md="1">
                                        <ABSTextBoxOnly :prop="PI_agentcommissionpercentage" v-model="M_SM_GenerateCommissionMaintenance.agentcommissionpercentage"  ref="ref_agentcommissionpercentage"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnreferralidChange" :prop="PI_referralid" :value="M_SM_GenerateCommissionMaintenance.referralid" :label="M_SM_GenerateCommissionMaintenance.referralidLabel" ref="ref_referralid"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col md="2">
                                        <ABSLabelOnly
                                        :prop="{cLabel: 'Referral Commission', 
                                          cLabelSize: 4, 
                                          cValue: '', 
                                          cPageLevel: PageLevel, 
                                          cTabIndex: TabIndex, 
                                          cVisible: true,
                                          cClass: 'lbl-col-align'}"
                                        />
                                      </b-col>
                                      <b-col  md="2">
                                        <ABSTextBoxOnly :prop="PI_referralcommissionamount" v-model="M_SM_GenerateCommissionMaintenance.referralcommissionamount"  ref="ref_referralcommissionamount"/>
                                      </b-col>
                                      <b-col md="1">
                                        <ABSTextBoxOnly :prop="PI_referralcommissionpercentage" v-model="M_SM_GenerateCommissionMaintenance.referralcommissionpercentage"  ref="ref_referralcommissionpercentage"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputDateVuex @input="OngeneratedateChange" :prop="PI_generatedate" v-model="M_SM_GenerateCommissionMaintenance.generatedate"  ref="ref_generatedate" />
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
                initialWhere: "SubPortfolioCd='"+this.getDataUser().subportfolio_cd+"' AND CommisionStatus='G'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_SM_GenerateCommissionMaintenance :{
                orderno: '',
                salestypecd: '',
                unitno: '',
                customername: '',
                orderdate: '',
                marketingid: '',
                lotprice: '0',
                mktcommissionamount: '0',
                mktcommissionpercentage: '0',
                agentid: '',
                agentcommissionamount: '0',
                agentcommissionpercentage: '0',
                referralid: '',
                referralcommissionamount: '0',
                referralcommissionpercentage: '0',
                generatedate: ''
                    }
            ,
            PI_orderno: { 
                cValidate :'', 
                cName: 'orderno', 
                cLabel: 'Order No', 
                cLabelSize: 4, 
                cOrder: 1, 
                cKey: true, 
                cType: 'text',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_salestypecd: { 
                dataLookUp: { 
                    LookUpCd: ''    , 
                    ColumnDB: ''   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: '' 
                        }, 
                cValidate :'', 
                cName: 'salestypecd', 
                cLabel: 'Sales Type', 
                cKey: true, 
                cLabelSize: 4, 
                cOrder: 3, 
                cTriggered: false, 
                cDefault: '', 
                cProtect: true, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cStatic: false, 
                cOption: [], 
                cMasterUrl: '' ,
                cDisplayColumn: '' ,
            }, 
            PI_unitno: { 
                cValidate :'', 
                cName: 'unitno', 
                cLabel: 'Unit No', 
                cLabelSize: 4, 
                cOrder: 4, 
                cKey: true, 
                cType: 'text',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_customername: { 
                cValidate :'', 
                cName: 'customername', 
                cLabel: 'Customer Name', 
                cLabelSize: 4, 
                cOrder: 5, 
                cKey: true, 
                cType: 'text',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_orderdate: { 
                cValidate :'', 
                cName: 'orderdate', 
                cLabel: 'Order Date', 
                cLabelSize: 4, 
                cOrder: 2, 
                cKey: true, 
                cVisible:  true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_marketingid: { 
                dataLookUp: { 
                    LookUpCd: ''    , 
                    ColumnDB: ''   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: '' 
                        }, 
                cValidate :'', 
                cName: 'marketingid', 
                cLabel: 'Marketing ID', 
                cKey: true, 
                cLabelSize: 4, 
                cOrder: 0, 
                cTriggered: false, 
                cDefault: '', 
                cProtect: true, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cStatic: false, 
                cOption: [], 
                cMasterUrl: '' ,
                cDisplayColumn: '' ,
            }, 
            PI_lotprice: { 
                cValidate :'', 
                cName: 'lotprice', 
                cLabel: 'Sales Price', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_mktcommissionamount: { 
                cValidate :'', 
                cName: 'mktcommissionamount', 
                cLabel: 'Marketing Commission', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_mktcommissionpercentage: { 
                cValidate :'', 
                cName: 'mktcommissionpercentage', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_agentid: { 
                dataLookUp: { 
                    LookUpCd: ''    , 
                    ColumnDB: ''   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: '' 
                        }, 
                cValidate :'', 
                cName: 'agentid', 
                cLabel: 'Agent ID', 
                cKey: true, 
                cLabelSize: 4, 
                cOrder: 0, 
                cTriggered: false, 
                cDefault: '', 
                cProtect: true, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cStatic: false, 
                cOption: [], 
                cMasterUrl: '' ,
                cDisplayColumn: '' ,
            }, 
            PI_agentcommissionamount: { 
                cValidate :'', 
                cName: 'agentcommissionamount', 
                cLabel: 'Agent Commission', 
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
            PI_agentcommissionpercentage: { 
                cValidate :'', 
                cName: 'agentcommissionpercentage', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_referralid: { 
                dataLookUp: { 
                    LookUpCd: ''    , 
                    ColumnDB: ''   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: '' 
                        }, 
                cValidate :'', 
                cName: 'referralid', 
                cLabel: 'Referral ID', 
                cKey: true, 
                cLabelSize: 4, 
                cOrder: 0, 
                cTriggered: false, 
                cDefault: '', 
                cProtect: true, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cStatic: false, 
                cOption: [], 
                cMasterUrl: '' ,
                cDisplayColumn: '' ,
            }, 
            PI_referralcommissionamount: { 
                cValidate :'', 
                cName: 'referralcommissionamount', 
                cLabel: 'Referral Commission', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_referralcommissionpercentage: { 
                cValidate :'', 
                cName: 'referralcommissionpercentage', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_generatedate: { 
                cValidate :'', 
                cName: 'generatedate', 
                cLabel: 'Generate Date', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cVisible:  true, 
                cProtect: true, 
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
        OnsalestypecdChange (data) {
        this.$nextTick(() => {
            this.M_SM_GenerateCommissionMaintenance.salestypecd = data.id
            this.M_SM_GenerateCommissionMaintenance.salestypecdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{salestypecd}
            }
        })
        this.$forceUpdate()
        },
        OnorderdateChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{orderdate}
            }
        })
        this.$forceUpdate()
        },
        OnmarketingidChange (data) {
        this.$nextTick(() => {
            this.M_SM_GenerateCommissionMaintenance.marketingid = data.id
            this.M_SM_GenerateCommissionMaintenance.marketingidLabel = data.label
            if (this.inputStatus != "VIEW") {
//{marketingid}
            }
        })
        this.$forceUpdate()
        },
        OnagentidChange (data) {
        this.$nextTick(() => {
            this.M_SM_GenerateCommissionMaintenance.agentid = data.id
            this.M_SM_GenerateCommissionMaintenance.agentidLabel = data.label
            if (this.inputStatus != "VIEW") {
//{agentid}
            }
        })
        this.$forceUpdate()
        },
        OnreferralidChange (data) {
        this.$nextTick(() => {
            this.M_SM_GenerateCommissionMaintenance.referralid = data.id
            this.M_SM_GenerateCommissionMaintenance.referralidLabel = data.label
            if (this.inputStatus != "VIEW") {
//{referralid}
            }
        })
        this.$forceUpdate()
        },
        OngeneratedateChange (data) {
        this.$nextTick(() => {
            this.M_SM_GenerateCommissionMaintenance.generatedate = data.id
            this.M_SM_GenerateCommissionMaintenance.generatedateLabel = data.label
            if (this.inputStatus != "VIEW") {
//{generatedate}
            }
        })
        this.$forceUpdate()
        },
	
		setToolbarButton () {
           this.getToolbar().statusFunction[0].disabled = true
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
                OrderNo: this.M_SM_GenerateCommissionMaintenance.orderno,
                MktCommissionAmount: this.M_SM_GenerateCommissionMaintenance.mktcommissionamount ? this.replaceAllString(this.M_SM_GenerateCommissionMaintenance.mktcommissionamount,',','','number') : 0 ,
                AgentCommissionAmount: this.M_SM_GenerateCommissionMaintenance.agentcommissionamount,
                ReferralCommissionAmount: this.M_SM_GenerateCommissionMaintenance.referralcommissionamount ? this.replaceAllString(this.M_SM_GenerateCommissionMaintenance.referralcommissionamount,',','','number') : 0 ,
                UserEdit: this.getDataUser().user_id ,
                LastUpdateStamp: this.M_SM_GenerateCommissionMaintenance.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_SM_GenerateCommissionMaintenance = {
                orderno: '',
                salestypecd: '',
                unitno: '',
                customername: '',
                orderdate: '',
                marketingid: '',
                lotprice: '0',
                mktcommissionamount: '0',
                mktcommissionpercentage: '0',
                agentid: '',
                agentcommissionamount: '0',
                agentcommissionpercentage: '0',
                referralid: '',
                referralcommissionamount: '0',
                referralcommissionpercentage: '0',
                generatedate: ''
                    }
            	
	
		},
        M_New(){
			
        },
        M_Edit(){
          if(this.M_SM_GenerateCommissionMaintenance.mktcommissionamount == '' || this.M_SM_GenerateCommissionMaintenance.mktcommissionamount == null){
            this.PI_agentcommissionamount.cProtect = true
            this.PI_agentcommissionpercentage.cProtect = true
          }else{
            this.PI_agentcommissionamount.cProtect = false
            this.PI_agentcommissionpercentage.cProtect = false
          }

          if(this.M_SM_GenerateCommissionMaintenance.agentcommissionamount == '' || this.M_SM_GenerateCommissionMaintenance.agentcommissionamount == null){
            this.PI_agentcommissionamount.cProtect = true
            this.PI_agentcommissionpercentage.cProtect = true
          }else{
            this.PI_agentcommissionamount.cProtect = false
            this.PI_agentcommissionpercentage.cProtect = false
          }

          if(this.M_SM_GenerateCommissionMaintenance.referralcommissionamount == '' || this.M_SM_GenerateCommissionMaintenance.referralcommissionamount == null){
            this.PI_referralcommissionamount.cProtect = true
            this.PI_referralcommissionpercentage.cProtect = true
          }else{
            this.PI_referralcommissionamount.cProtect = false
            this.PI_referralcommissionpercentage.cProtect = false
          }
        },
        M_Delete(dt){       
			var data = this.FormToABSList().getRowSelected()  
			var dataDelete = []

			
			data.forEach((value) => {

				
				dataDelete.push({
					_Message_:'',
                    SubPortfolioCd: this.getDataUser().subportfolio_cd,
                    OrderNo: value.OrderNo,
                    LotNo: value.LotNo,
                    Status: value.Status,
                    UserEdit: this.getDataUser().user_id ,
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
                orderno: record.OrderNo,
                lotno: record.LotNo
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                console.log(response)
                var data = response.Data[0]

                console.log(data)
this.M_SM_GenerateCommissionMaintenance = {
                orderno: data.orderno,
                salestypecd: data.salestypecd,
                unitno: data.lotno,
                customername: data.customername,
                orderdate: data.orderdate,
                marketingid: data.marketingid,
                lotprice: this.isCurrency(data.lotprice, this.decimal),
                mktcommissionamount: this.isCurrency(data.mktcommissionamount, this.decimal),
                mktcommissionpercentage: this.isCurrency(data.mktcommissionpercentage, this.decimal),
                agentid: data.agentid,
                agentcommissionamount: this.isCurrency(data.agentcommissionamount, this.decimal),
                agentcommissionpercentage: this.isCurrency(data.agentcommissionpercentage, this.decimal),
                referralid: data.referralid,
                referralcommissionamount:this.isCurrency( data.referralcommissionamount, this.decimal),
                referralcommissionpercentage: this.isCurrency(data.referralcommissionpercentage, this.decimal),
                generatedate: data.generatedate
                    }                 

                this.M_SM_GenerateCommissionMaintenance.salestypecdLabel = this.M_SM_GenerateCommissionMaintenance.salestypecd != null && this.M_SM_GenerateCommissionMaintenance.salestypecd != '' ? data.salestypecd + this.separator + data.salestypedescs  :'' 
                this.M_SM_GenerateCommissionMaintenance.marketingidLabel = this.M_SM_GenerateCommissionMaintenance.marketingid != null && this.M_SM_GenerateCommissionMaintenance.marketingid != '' ? data.marketingid + this.separator + data.marketingname :'' 
                this.M_SM_GenerateCommissionMaintenance.agentidLabel = this.M_SM_GenerateCommissionMaintenance.agentid != null && this.M_SM_GenerateCommissionMaintenance.agentid != '' ? data.agentid + this.separator + data.agentname :'' 
                this.M_SM_GenerateCommissionMaintenance.referralidLabel = this.M_SM_GenerateCommissionMaintenance.referralid != null && this.M_SM_GenerateCommissionMaintenance.referralid != '' ? data.referralid + this.separator + data.referralname :'' 
         

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

