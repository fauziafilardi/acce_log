<template>
    <div>
        <div :style="'margin-top:10px;'" class="el" mousetip mousetip-msg="I'm a tooltip">
            <div class="div-collapse" v-b-toggle.collapse1>
                <span class="master-span" v-show="IEBy.Input && IEBy.Edit">
                    Input By : {{IEBy.Input}} | Edit By : {{IEBy.Edit}} <font-awesome-icon icon="sort-down" class="icon-style-1__master" /> 
                </span>
            </div>
            <b-collapse id="collapse1" :visible="true">
                <b-row  style="padding-left: 10px; padding-bottom: 10px; !important;">              
                    <b-col md="12" id="col-left" class="bColMasterForm">
                        <b-form :data-vv-scope="'FormScope_' + PageLevel + '_' + TabIndex" :data-vv-value-path="'FormScope_' + PageLevel + '_' + TabIndex">
                            <b-row  style="padding-left: 10px; padding-bottom: 10px; !important;">              
                                <!-- <b-col md="12" id="col-left"> 
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnpaymentnoChange" :prop="PI_paymentno" :value="M_CB_SplitPayment.paymentno" :label="M_CB_SplitPayment.paymentnoLabel" ref="ref_paymentno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_debtorcd" v-model="M_CB_SplitPayment.debtorcdLabel"  ref="ref_debtorcd" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_creditorcd" v-model="M_CB_SplitPayment.creditorcdLabel"  ref="ref_creditorcd" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_amount" v-model="M_CB_SplitPayment.amount"  ref="ref_amount"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_splitdocument" v-model="M_CB_SplitPayment.splitdocument"  ref="ref_splitdocument"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OntodebtorcdChange" :prop="PI_todebtorcd" :value="M_CB_SplitPayment.todebtorcd" :label="M_CB_SplitPayment.todebtorcdLabel" ref="ref_todebtorcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OntocreditorcdChange" :prop="PI_tocreditorcd" :value="M_CB_SplitPayment.tocreditorcd" :label="M_CB_SplitPayment.tocreditorcdLabel" ref="ref_tocreditorcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_splitamount" v-model="M_CB_SplitPayment.splitamount"  ref="ref_splitamount"/>
                                      </b-col>
                                    </b-row>
                                </b-col>  -->

                                <b-col md="12" id="col-left"> <!-- table open -->
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnunitnoChange" :prop="PI_unitno" :value="M_SM_SalesSnPNo.unitno" :label="M_SM_SalesSnPNo.unitnoLabel" ref="ref_unitno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnsnprunningcodeChange" :prop="PI_snprunningcode" :value="M_SM_SalesSnPNo.snprunningcode" :label="M_SM_SalesSnPNo.snprunningcodeLabel" ref="ref_snprunningcode"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_snpno" v-model="M_SM_SalesSnPNo.snpno"  ref="ref_snpno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputDateVuex @input="OnsnpdateChange" :prop="PI_snpdate" v-model="M_SM_SalesSnPNo.snpdate"  ref="ref_snpdate" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnrunningcdChange" :prop="PI_runningcd" :value="M_SM_SalesSnPNo.runningcd" :label="M_SM_SalesSnPNo.runningcdLabel" ref="ref_runningcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_vono" v-model="M_SM_SalesSnPNo.vono"  ref="ref_vono"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputDateVuex @input="OnvodateChange" :prop="PI_vodate" v-model="M_SM_SalesSnPNo.vodate"  ref="ref_vodate" />
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
            FormType: "Form",
			Module:"SM",	
            IEBy: {Input: '', Edit: ''},

             M_SM_SalesSnPNo :{
                unitno: '',
                snprunningcode: '',
                snpno: '',
                snpdate: '',
                snpdate: '',
                runningcd:'',
                vono:'',
                vodate: ''
                    }
            ,					
            PI_unitno: { 
                dataLookUp: { 
                    LookUpCd: 'GetSMLookupLotNo'    , 
                    ColumnDB: 'LotNo'   , 
                    InitialWhere: "SubPortfolioCd ='"+ this.getDataUser().subportfolio_cd +"'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'LotNo,Descs' 
                        }, 
                cValidate :'required', 
                cName: 'unitno', 
                cLabel: 'Unit No', 
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
                cDisplayColumn: 'LotNo,Descs' ,
            }, 
            PI_snprunningcode: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMRunningCode'    , 
                    ColumnDB: 'RunningCd'   , 
                    InitialWhere: "ModuleCd is null OR ModuleCd = 'SM'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'RunningCd,Descs' 
                        }, 
                cValidate :'', 
                cName: 'snprunningcode', 
                cLabel: 'Snp Running Code', 
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
                cDisplayColumn: 'RunningCd,Descs' ,
            }, 
            PI_snpno: { 
                cValidate :'required|max:20', 
                cName: 'snpno', 
                cLabel: 'Snp No', 
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
            PI_snpdate: { 
                cValidate :'required', 
                cName: 'snpdate', 
                cLabel: 'Snp Date ', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_runningcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMRunningCode'    , 
                    ColumnDB: 'RunningCd'   , 
                    InitialWhere: "ModuleCd is null OR ModuleCd = 'SM'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'RunningCd,Descs' 
                        }, 
                cValidate :'', 
                cName: 'runningcd', 
                cLabel: 'VO Running Code', 
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
                cDisplayColumn: 'RunningCd,Descs' ,
            }, 
            PI_vono: { 
                cValidate :'', 
                cName: 'vono', 
                cLabel: 'VO No', 
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
            PI_vodate: { 
                cValidate :'', 
                cName: 'vodate', 
                cLabel: 'VO Date', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            
            PTAnalysis: {
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cPageMasterSeq: this.data.PageMasterSeq,
                cFormPageNo: this.data.PageOrder
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
    }
  },
    methods: {		
        OnunitnoChange (data) {
        this.$nextTick(() => {
            this.M_SM_SalesSnPNo.unitno = data.id
            this.M_SM_SalesSnPNo.unitnoLabel = data.label
            if (this.inputStatus != "VIEW") {
//{unitno}
            }
        })
        this.$forceUpdate()
        },
        OnsnprunningcodeChange (data) {
        this.$nextTick(() => {
            this.M_SM_SalesSnPNo.snprunningcode = data.id
            this.M_SM_SalesSnPNo.snprunningcodeLabel = data.label
            if (this.inputStatus != "VIEW") {
//{snprunningcode}
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
        OnrunningcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_SalesSnPNo.runningcd = data.id
            this.M_SM_SalesSnPNo.runningcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{runningcd}
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
            this.M_ClearForm()		
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
        },
        M_Update() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                LotNo: this.M_SM_SalesSnPNo.unitno == '' || this.M_SM_SalesSnPNo.unitno == null ? 'NULL' : this.M_SM_SalesSnPNo.unitno,
                SnPRunningCd: this.M_SM_SalesSnPNo.snprunningcode == '' || this.M_SM_SalesSnPNo.snprunningcode == null ? 'NULL' : this.M_SM_SalesSnPNo.snprunningcode,
                SnPNo: this.M_SM_SalesSnPNo.snpno,
                SnPDate: this.M_SM_SalesSnPNo.snpdate,
                VORunningCd: this.M_SM_SalesSnPNo.runningcd == '' || this.M_SM_SalesSnPNo.runningcd == null ? 'NULL' : this.M_SM_SalesSnPNo.runningcd,
                VONo : this.M_SM_SalesSnPNo.vono,
                VODate: this.M_SM_SalesSnPNo.vodate,
                UserEdit: this.getDataUser().user_id,
                OutputMessage_Output: ''
            }

            this.postEncode(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return
                this.M_ClearForm()
                this.$store.commit('setStatus', 'view')
                this.$store.commit('setStatus', 'new')
                this.alertSuccess(response.Data.OutputMessage)
            })
        },
		M_ClearForm(){
            this.M_SM_SalesSnPNo = {
                unitno: '',
                snprunningcode: '',
                snpno: '',
                snpdate: '',
                snpdate: '',
                runningcd:'',
                vono:'',
                vodate: ''
                    }
                    
            		
		},
        M_New(){
            // this.$refs.ref_paymentno.focus()
        },
        M_Edit(){
            // this.$refs.ref_paymentno.focus()
        },
        M_Delete(dt){
        },        
        getDataBy (record) {
        }
		
    },
    beforeCreate: function () {
    },
    created: function() {
        this.$store.commit('setFormType','Form')
    },
    beforeMount: function() {
    },
    mounted: function() {
        this.hideSideBarMenu()
        this.getToolbar().doEdit(true)
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
