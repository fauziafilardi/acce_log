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
                                        <ABSinputTextVuex :prop="PI_orderno" v-model="M_SM_DocumentControlH.orderno"  ref="ref_orderno"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OncontactidChange" :prop="PI_contactid" :value="M_SM_DocumentControlH.contactid" :label="M_SM_DocumentControlH.contactidLabel" ref="ref_contactid"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputDateVuex @input="OnorderdateChange" :prop="PI_orderdate" v-model="M_SM_DocumentControlH.orderdate"  ref="ref_orderdate" />
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnmarketingidChange" :prop="PI_marketingid" :value="M_SM_DocumentControlH.marketingid" :label="M_SM_DocumentControlH.marketingidLabel" ref="ref_marketingid"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_snpno" v-model="M_SM_DocumentControlH.snpno"  ref="ref_snpno"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_lotno" v-model="M_SM_DocumentControlH.lotno"  ref="ref_lotno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputDateVuex @input="OnsnpdateChange" :prop="PI_snpdate" v-model="M_SM_DocumentControlH.snpdate"  ref="ref_snpdate" />
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnsalestypecdChange" :prop="PI_salestypecd" :value="M_SM_DocumentControlH.salestypecd" :label="M_SM_DocumentControlH.salestypecdLabel" ref="ref_salestypecd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_vono" v-model="M_SM_DocumentControlH.vono"  ref="ref_vono"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnsolicitoridChange" :prop="PI_solicitorid" :value="M_SM_DocumentControlH.solicitorid" :label="M_SM_DocumentControlH.solicitoridLabel" ref="ref_solicitorid"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputDateVuex @input="OnvodateChange" :prop="PI_vodate" v-model="M_SM_DocumentControlH.vodate"  ref="ref_vodate" />
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnfinancieridChange" :prop="PI_financierid" :value="M_SM_DocumentControlH.financierid" :label="M_SM_DocumentControlH.financieridLabel" ref="ref_financierid"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_referenceno" v-model="M_SM_DocumentControlH.referenceno"  ref="ref_referenceno"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_handoverdate" v-model="M_SM_DocumentControlH.handoverdate"  ref="ref_handoverdate"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnmediacdChange" :prop="PI_mediacd" :value="M_SM_DocumentControlH.mediacd" :label="M_SM_DocumentControlH.mediacdLabel" ref="ref_mediacd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OncurrencycdChange" :prop="PI_currencycd" :value="M_SM_DocumentControlH.currencycd" :label="M_SM_DocumentControlH.currencycdLabel" ref="ref_currencycd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_SM_DocumentControlH.remarks"  ref="ref_remarks" />
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
		FormType: "View",
		Module:"SM",
            propList: {
                initialWhere: "SubPortfolioCd = '"+ this.getDataUser().subportfolio_cd +"' AND Status <> 'X'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_SM_DocumentControlH :{
                orderno: '',
                contactid: '',
                orderdate: '',
                marketingid: '',
                snpno: '',
                lotno: '',
                snpdate: '',
                salestypecd: '',
                vono: '',
                solicitorid: '',
                vodate: '',
                financierid: '',
                referenceno: '',
                handoverdate: '',
                mediacd	: '',
                currencycd: '',
                remarks: ''
                    }
            ,
            PI_orderno: { 
                cValidate :'', 
                cName: 'orderno', 
                cLabel: 'Order No', 
                cLabelSize: 4, 
                cOrder: 1, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_contactid: { 
                dataLookUp: { 
                    LookUpCd: ''    , 
                    ColumnDB: ''   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: '' 
                        }, 
                cValidate :'', 
                cName: 'contactid', 
                cLabel: 'Contact ID', 
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
                cDisplayColumn: '' ,
            }, 
            PI_orderdate: { 
                cValidate :'', 
                cName: 'orderdate', 
                cLabel: 'Order Date', 
                cLabelSize: 4, 
                cOrder: 2, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
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
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 18, 
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
                cDisplayColumn: '' ,
            }, 
            PI_snpno: { 
                cValidate :'', 
                cName: 'snpno', 
                cLabel: 'SnP No', 
                cLabelSize: 4, 
                cOrder: 1, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_lotno: { 
                cValidate :'', 
                cName: 'lotno', 
                cLabel: 'Unit No', 
                cLabelSize: 4, 
                cOrder: 4, 
                cKey: true, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_snpdate: { 
                cValidate :'', 
                cName: 'snpdate', 
                cLabel: 'SnP Date', 
                cLabelSize: 4, 
                cOrder: 2, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
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
                cDisplayColumn: '' ,
            }, 
            PI_vono: { 
                cValidate :'', 
                cName: 'vono', 
                cLabel: 'VO No', 
                cLabelSize: 4, 
                cOrder: 1, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_solicitorid: { 
                dataLookUp: { 
                    LookUpCd: ''    , 
                    ColumnDB: ''   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: '' 
                        }, 
                cValidate :'', 
                cName: 'solicitorid', 
                cLabel: 'Solicitor ID', 
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
                cDisplayColumn: '' ,
            }, 
            PI_vodate: { 
                cValidate :'', 
                cName: 'vodate', 
                cLabel: 'VO Date', 
                cLabelSize: 4, 
                cOrder: 2, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_financierid: { 
                dataLookUp: { 
                    LookUpCd: ''    , 
                    ColumnDB: ''   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: '' 
                        }, 
                cValidate :'', 
                cName: 'financierid', 
                cLabel: 'Financier ID', 
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
                cDisplayColumn: '' ,
            }, 
            PI_referenceno: { 
                cValidate :'', 
                cName: 'referenceno', 
                cLabel: 'Reference No ', 
                cLabelSize: 4, 
                cOrder: 3, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_handoverdate: { 
                cValidate :'', 
                cName: 'handoverdate', 
                cLabel: 'Hand Over Date', 
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
            PI_mediacd: { 
                dataLookUp: { 
                    LookUpCd: ''    , 
                    ColumnDB: ''   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: '' 
                        }, 
                cValidate :'', 
                cName: 'mediacd', 
                cLabel: 'Media Cd', 
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
                cDisplayColumn: '' ,
            }, 
            PI_currencycd: { 
                dataLookUp: { 
                    LookUpCd: ''    , 
                    ColumnDB: ''   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: '' 
                        }, 
                cValidate :'', 
                cName: 'currencycd', 
                cLabel: 'Currency Code', 
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
                cDisplayColumn: '' ,
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
        OncontactidChange (data) {
        this.$nextTick(() => {
            this.M_SM_DocumentControlH.contactid = data.id
            this.M_SM_DocumentControlH.contactidLabel = data.label
            if (this.inputStatus != "VIEW") {
//{contactid}
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
            this.M_SM_DocumentControlH.marketingid = data.id
            this.M_SM_DocumentControlH.marketingidLabel = data.label
            if (this.inputStatus != "VIEW") {
//{marketingid}
            }
        })
        this.$forceUpdate()
        },
        OnsnpdateChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{snpdate}
            }
        })
        this.$forceUpdate()
        },
        OnsalestypecdChange (data) {
        this.$nextTick(() => {
            this.M_SM_DocumentControlH.salestypecd = data.id
            this.M_SM_DocumentControlH.salestypecdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{salestypecd}
            }
        })
        this.$forceUpdate()
        },
        OnsolicitoridChange (data) {
        this.$nextTick(() => {
            this.M_SM_DocumentControlH.solicitorid = data.id
            this.M_SM_DocumentControlH.solicitoridLabel = data.label
            if (this.inputStatus != "VIEW") {
//{solicitorid}
            }
        })
        this.$forceUpdate()
        },
        OnvodateChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{vodate}
            }
        })
        this.$forceUpdate()
        },
        OnfinancieridChange (data) {
        this.$nextTick(() => {
            this.M_SM_DocumentControlH.financierid = data.id
            this.M_SM_DocumentControlH.financieridLabel = data.label
            if (this.inputStatus != "VIEW") {
//{financierid}
            }
        })
        this.$forceUpdate()
        },
        OnmediacdChange (data) {
        this.$nextTick(() => {
            this.M_SM_DocumentControlH.mediacd = data.id
            this.M_SM_DocumentControlH.mediacdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{mediacd}
            }
        })
        this.$forceUpdate()
        },
        OncurrencycdChange (data) {
        this.$nextTick(() => {
            this.M_SM_DocumentControlH.currencycd = data.id
            this.M_SM_DocumentControlH.currencycdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{currencycd}
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
           this.getToolbar().statusFunction[0].disabled = true
           this.getToolbar().statusFunction[1].disabled = true
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
                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_SM_DocumentControlH = {
                orderno: '',
                contactid: '',
                orderdate: '',
                marketingid: '',
                snpno: '',
                lotno: '',
                snpdate: '',
                salestypecd: '',
                vono: '',
                solicitorid: '',
                vodate: '',
                financierid: '',
                referenceno: '',
                handoverdate: '',
                mediacd	: '',
                currencycd: '',
                remarks: ''
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
					_Message_:'',
                    SubPortfolioCd: this.getDataUser().subportfolio_cd,
                    LotNo: value.LotNo,
                    OrderNo: value.OrderNo,
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
                orderno: record.OrderNo
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
this.M_SM_DocumentControlH = {
                orderno: data.orderno,
                contactid: data.contactid,
                orderdate: data.orderdate,
                marketingid: data.marketingid,
                snpno: data.snpno,
                lotno: data.lotno,
                snpdate: data.snpdate,
                salestypecd: data.salestypecd,
                vono: data.vono,
                solicitorid: data.solicitorid,
                vodate: data.vodate,
                financierid: data.financierid,
                referenceno: data.referenceno,
                handoverdate: data.handoverdate,
                mediacd	: data.mediacd	,
                currencycd: data.currencycd,
                remarks: data.remarks
                    }
                 

                this.M_SM_DocumentControlH.contactidLabel = this.M_SM_DocumentControlH.contactid != null && this.M_SM_DocumentControlH.contactid != '' ? data.contactid + this.separator + data.contactname  :'' 
                this.M_SM_DocumentControlH.marketingidLabel = this.M_SM_DocumentControlH.marketingid != null && this.M_SM_DocumentControlH.marketingid != '' ? data.marketingid + this.separator + data.marketingname :'' 
                this.M_SM_DocumentControlH.salestypecdLabel = this.M_SM_DocumentControlH.salestypecd != null && this.M_SM_DocumentControlH.salestypecd != '' ? data.salestypecd + this.separator + data.salestypedescs :'' 
                this.M_SM_DocumentControlH.solicitoridLabel = this.M_SM_DocumentControlH.solicitorid != null && this.M_SM_DocumentControlH.solicitorid != '' ? data.solicitorid + this.separator + data.solicitorname :'' 
                this.M_SM_DocumentControlH.financieridLabel = this.M_SM_DocumentControlH.financierid != null && this.M_SM_DocumentControlH.financierid != '' ? data.financierid + this.separator + data.financiername :'' 
                this.M_SM_DocumentControlH.mediacdLabel = this.M_SM_DocumentControlH.mediacd != null && this.M_SM_DocumentControlH.mediacd != '' ? data.mediacd + this.separator + data.mediadescs :'' 
                this.M_SM_DocumentControlH.currencycdLabel = this.M_SM_DocumentControlH.currencycd != null && this.M_SM_DocumentControlH.currencycd != '' ? data.currencycd + this.separator + data.currencydescs :'' 
         

                this.IEBy.Input = data.userinput
                this.IEBy.Edit = data.useredit

            })
        }

    },
    beforeCreate: function () {
    },
    created: function() {
	this.$store.commit('setFormType','View')
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

