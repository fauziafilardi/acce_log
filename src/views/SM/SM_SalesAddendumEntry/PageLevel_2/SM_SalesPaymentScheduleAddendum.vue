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
                                        <ABSinputRadioButtonVuex @input="OnchargetypeChange" :prop="PI_chargetype" v-model="M_SM_SalesPaymentScheduleAddendum.chargetype"  ref="ref_chargetype" />
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OntaxcdChange" :prop="PI_taxcd" :value="M_SM_SalesPaymentScheduleAddendum.taxcd" :label="M_SM_SalesPaymentScheduleAddendum.taxcdLabel" ref="ref_taxcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OntrxtypeChange" :prop="PI_trxtype" :value="M_SM_SalesPaymentScheduleAddendum.trxtype" :label="M_SM_SalesPaymentScheduleAddendum.trxtypeLabel" ref="ref_trxtype"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex @input="OnbillingamtChange" :prop="PI_billingamt" v-model="M_SM_SalesPaymentScheduleAddendum.billingamt"  ref="ref_billingamt"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_descs" v-model="M_SM_SalesPaymentScheduleAddendum.descs"  ref="ref_descs"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_baseamt" v-model="M_SM_SalesPaymentScheduleAddendum.baseamt"  ref="ref_baseamt"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OncredittermscdChange" :prop="PI_credittermscd" :value="M_SM_SalesPaymentScheduleAddendum.credittermscd" :label="M_SM_SalesPaymentScheduleAddendum.credittermscdLabel" ref="ref_credittermscd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_taxamt" v-model="M_SM_SalesPaymentScheduleAddendum.taxamt"  ref="ref_taxamt"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col  md="6">
                                        <ABSinputDateVuex :prop="PI_billingdate" v-model="M_SM_SalesPaymentScheduleAddendum.billingdate"  ref="ref_billingdate"/>
                                      </b-col>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_totalamt" v-model="M_SM_SalesPaymentScheduleAddendum.totalamt"  ref="ref_totalamt"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col  md="6">
                                        </b-col>
                                      <b-col  md="6">
                                        <ABSinputDateVuex :prop="PI_paymentdate" v-model="M_SM_SalesPaymentScheduleAddendum.paymentdate"  ref="ref_paymentdate"/>
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
    props: {PageLevel:'', TabIndex: '', data: ''},
    data() {
        return {
			ValKey:null,
            FormType: "List",
			Module:"SM",
            propList: {
                initialWhere:"LotNo = '" + this.ValKey + "'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: 'trxtype ASC', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_SM_SalesPaymentScheduleAddendum :{
                chargetype:'U',
				taxcd:'',
				trxtype:'',
				billingamt:0,
				descs:'',
				baseamt:0,
                credittermscd:'',
                addendumsequenceno: 0,
				taxamt:0,
				totalamt:0,
                paymentdate: null	,
                lotno:'',
                billingdate:null	,
                lastupdatestamp:0		
                    }
            ,
            PI_chargetype: { 
                cValidate :'', 
                cName: 'chargetype1', 
                cId: 'rdbchargetype', 
                cRadioOptions: [{ text: 'Unit', value: 'U' },{ text: 'VO', value: 'V' },{ text: 'Others', value: 'O' },{ text: 'Penalty', value: 'P' },], 
                cRadioDefaultOption: 'U', 
                cLabel:'Charge Type', 
                cLabelSize: 4, 
                cDefault: 'U', 
                cOrder: 0, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_taxcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetTaxCd'    , 
                    ColumnDB: 'TaxCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'TaxCd' 
                        }, 
                cValidate :'required', 
                cName: 'taxcd', 
                cLabel: 'Tax Code', 
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
                cDisplayColumn: 'TaxCd' ,
            }, 
            PI_trxtype: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMTransTypeMaster'    , 
                    ColumnDB: 'TrxType'   , 
                    InitialWhere: " ModuleCd ='SM' "   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'TrxType,Descs' 
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
                cDisplayColumn: 'TrxType,Descs' ,
            }, 
            PI_billingamt: { 
                cValidate :'required|max:20', 
                cName: 'billingamt', 
                cLabel: 'Trans. Amount', 
                cLabelSize: 4, 
                cOrder: 1, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_descs: { 
                cValidate :'', 
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
            PI_baseamt: { 
                cValidate :'', 
                cName: 'baseamt', 
                cLabel: 'Net Amount', 
                cLabelSize: 4, 
                cOrder: 1, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_credittermscd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMCreditTerms'    , 
                    ColumnDB: 'CreditTermsCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'CreditTermsCd,Descs' 
                        }, 
                cValidate :'required', 
                cName: 'credittermscd', 
                cLabel: 'Credit Terms', 
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
                cMasterUrl: 'CM/CM_CreditTerms' ,
                cDisplayColumn: 'CreditTermsCd,Descs' ,
            }, 
            PI_taxamt: { 
                cValidate :'', 
                cName: 'taxamt', 
                cLabel: 'Vat Amount', 
                cLabelSize: 4, 
                cOrder: 1, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_totalamt: { 
                cValidate :'', 
                cName: 'totalamt', 
                cLabel: 'Total Amount (Net + VAT)', 
                cLabelSize: 4, 
                cOrder: 1, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_billingdate: { 
                cValidate :'', 
                cName: 'billingdate', 
                cLabel: 'Billing Date', 
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
            PI_paymentdate: { 
                cValidate :'', 
                cName: 'paymentdate', 
                cLabel: 'Payment Date', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
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
        CalculateTax(){
             var param = {
            OptionFunctionCd: "SMCalculateTax",
            ModuleCd: this.Module,
            SubPortfolioCd: this.getDataUser().subportfolio_cd,
            AfterDiscountAmt : this.M_SM_SalesPaymentScheduleAddendum.billingamt,
            TaxCd: this.M_SM_SalesPaymentScheduleAddendum.taxcd,
            BaseAmt_Output:0,
            TaxAmt_Output:0
          }

          this.FnDynamicFunction(param)
            .then(ress => {
            console.log(JSON.stringify(ress,null,2))
                // var data = ress[0]
                var data = ress
                this.M_SM_SalesPaymentScheduleAddendum.baseamt = this.isCurrency(data.BaseAmt,this.decimal)
                this.M_SM_SalesPaymentScheduleAddendum.taxamt = this.isCurrency(data.TaxAmt,this.decimal)
                this.M_SM_SalesPaymentScheduleAddendum.totalamt = this.isCurrency(parseFloat(data.BaseAmt) + parseFloat(data.TaxAmt),this.decimal)

              
            })
        },
        OnbillingamtChange(data){
            this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
                this.CalculateTax()
            }
        })
        this.$forceUpdate()
        },
        OnchargetypeChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{chargetype}
            }
        })
        this.$forceUpdate()
        },
         OntrxtypeChange (data) {
        this.$nextTick(() => {
          console.log(data)
            this.M_SM_SalesPaymentScheduleAddendum.trxtype = data.id
            this.M_SM_SalesPaymentScheduleAddendum.trxtypeLabel = data.id + this.separator + data.label
            this.M_SM_SalesPaymentScheduleAddendum.descs = data.Descs
            if (this.inputStatus != "VIEW") {
//{trxtype}
            }
        })
        this.$forceUpdate()
        },
        OntaxcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_SalesPaymentScheduleAddendum.taxcd = data.id
            this.M_SM_SalesPaymentScheduleAddendum.taxcdLabel = data.id + this.separator + data.label
            if (this.inputStatus != "VIEW") {
//{taxcd}
            this.CalculateTax()
            }
        })
        this.$forceUpdate()
        },
        OncredittermscdChange (data) {
        this.$nextTick(() => {
            this.M_SM_SalesPaymentScheduleAddendum.credittermscd = data.id
            this.M_SM_SalesPaymentScheduleAddendum.credittermscdLabel = data.id + this.separator + data.label
            if (this.inputStatus != "VIEW") {
//{credittermscd}
            }
        })
        this.$forceUpdate()
        },
		
		setToolbarButton () {
           if(this.DataRowPage1.StatusCd=='N'){
            this.getToolbar().statusFunction[0].disabled = false
          }else{
            this.getToolbar().statusFunction[0].disabled = true
          }
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

            console.log(data)

            if(data.StatusCd == 'N'){
              this.getToolbar().FormStatus = 'EDIT'
              this.getToolbar().ProcessPS()
            } else if (data.StatusCd == 'C') {
              this.getToolbar().FormStatus = 'VIEW'
              this.getToolbar().ProcessPS()
            }else {
              this.getToolbar().FormStatus = 'VIEW'
              this.getToolbar().ProcessPS()
            }

            // this.M_SM_SalesPaymentScheduleAddendum.lotno = data.LotNo 
            this.propList.initialWhere =" SubPortfolioCd='" + this.getDataUser().subportfolio_cd + "' AND OrderNo ='"+data.OrderNo+"' AND AddendumSequenceNo='"+data.AddendumSequenceNo+"'"
        

            this.FormToABSList().doGetList('','eb_getList')
        },		
		M_CheckboxChecked(data, status, index){

        },		
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                OrderNo: this.DataRowPage1.OrderNo,
                LotNo: this.DataRowPage1.LotNo,
                TrxType: this.M_SM_SalesPaymentScheduleAddendum.trxtype,
                BillingDate: this.M_SM_SalesPaymentScheduleAddendum.billingdate,
                Descs: this.M_SM_SalesPaymentScheduleAddendum.descs,
                TaxCd: this.M_SM_SalesPaymentScheduleAddendum.taxcd == '' || this.M_SM_SalesPaymentScheduleAddendum.taxcd == null ? 'NULL' : this.M_SM_SalesPaymentScheduleAddendum.taxcd ,
                CreditTermsCd: this.M_SM_SalesPaymentScheduleAddendum.credittermscd == '' || this.M_SM_SalesPaymentScheduleAddendum.credittermscd == null ? 'NULL' : this.M_SM_SalesPaymentScheduleAddendum.credittermscd ,
                BillingAmt: this.M_SM_SalesPaymentScheduleAddendum.billingamt,
                ChargeType: this.M_SM_SalesPaymentScheduleAddendum.chargetype,
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
            console.log(this.DataRowPage1)
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                PaymentSequenceNo: this.M_SM_SalesPaymentScheduleAddendum.paymentsequenceno,
                OrderNo: this.DataRowPage1.OrderNo,
                LotNo: this.DataRowPage1.LotNo,
                BillingDate: this.M_SM_SalesPaymentScheduleAddendum.billingdate,
                BillingAmt: this.M_SM_SalesPaymentScheduleAddendum.billingamt,
                TrxType: this.M_SM_SalesPaymentScheduleAddendum.trxtype,
                TaxCd: this.M_SM_SalesPaymentScheduleAddendum.taxcd == '' || this.M_SM_SalesPaymentScheduleAddendum.taxcd == null ? 'NULL' : this.M_SM_SalesPaymentScheduleAddendum.taxcd ,
                CreditTermsCd: this.M_SM_SalesPaymentScheduleAddendum.credittermscd == '' || this.M_SM_SalesPaymentScheduleAddendum.credittermscd == null ? 'NULL' : this.M_SM_SalesPaymentScheduleAddendum.credittermscd ,
                Descs: this.M_SM_SalesPaymentScheduleAddendum.descs,
                ChargeType: this.M_SM_SalesPaymentScheduleAddendum.chargetype,
                UserEdit: this.getDataUser().user_id ,
                LastUpdateStamp: this.M_SM_SalesPaymentScheduleAddendum.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_SM_SalesPaymentScheduleAddendum = {
                    chargetype:'U',
				taxcd:'',
				trxtype:'',
				billingamt:0,
				descs:'',
                baseamt:0,
                addendumsequenceno: 0,
				credittermscd:'',
				taxamt:0,
				totalamt:0,
                paymentdate: null,
                lotno:''
                    }
            	
		},
        M_New(){
            let data = this.$store.getters.GetPage1Data
            this.M_SM_SalesPaymentScheduleAddendum.lotno = data.LotNo 



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
                    PaymentSequenceNo: value.PaymentSequenceNo,
                    OrderNo: this.DataRowPage1.OrderNo,
                    TrxType: value.TrxType,
                    LotNo: this.DataRowPage1.LotNo,
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
                paymentsequenceno: record.PaymentSequenceNo,
                orderno: record.OrderNo,
                trxtype: record.TrxType,
                lotno: record.LotNo,
                addendumsequenceno: record.AddendumSequenceNo,				
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
this.M_SM_SalesPaymentScheduleAddendum = {
                        chargetype: data.chargetype,
                        taxcd: data.taxcd,
                        trxtype: data.trxtype,
                        billingamt: this.isCurrency(data.billingamt,this.decimal),
                        descs: data.descs,
                        baseamt: this.isCurrency(data.baseamt,this.decimal),
                        credittermscd: data.credittermscd,
                        taxamt: this.isCurrency(data.taxamt,this.decimal),
                        totalamt: this.isCurrency(parseFloat(data.baseamt) + parseFloat(data.taxamt),this.decimal),
                        paymentdate: data.paymentdate,
                        billingdate : data.billingdate,
                        lastupdatestamp: record.LastUpdateStamp,
                        paymentsequenceno :record.PaymentSequenceNo
                    }
                 
                this.M_SM_SalesPaymentScheduleAddendum.trxtypeLabel = this.M_SM_SalesPaymentScheduleAddendum.trxtype != null && this.M_SM_SalesPaymentScheduleAddendum.trxtype != '' ? data.trxtype + this.separator  :'' 
                this.M_SM_SalesPaymentScheduleAddendum.taxcdLabel = this.M_SM_SalesPaymentScheduleAddendum.taxcd != null && this.M_SM_SalesPaymentScheduleAddendum.taxcd != '' ? data.taxcd + this.separator  :'' 
                this.M_SM_SalesPaymentScheduleAddendum.credittermscdLabel = this.M_SM_SalesPaymentScheduleAddendum.credittermscd != null && this.M_SM_SalesPaymentScheduleAddendum.credittermscd != '' ? data.credittermscd + this.separator  :'' 
  

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

