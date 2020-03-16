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
                                <b-col md="6" id="col-left">
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_quotation_no" v-model="M_MK_QuotationTest.quotation_no"  ref="ref_quotation_no"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputDateVuex @input="Onquotation_dateChange" :prop="PI_quotation_date" v-model="M_MK_QuotationTest.quotation_date"  ref="ref_quotation_date" />
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Oncm_contact_idChange" :prop="PI_cm_contact_id" :value="M_MK_QuotationTest.cm_contact_id" :label="M_MK_QuotationTest.cm_contact_idLabel" ref="ref_cm_contact_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_reference_no" v-model="M_MK_QuotationTest.reference_no"  ref="ref_reference_no"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_descs" v-model="M_MK_QuotationTest.descs"  ref="ref_descs"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputDateRangeVuex :prop="PI_period_from" :valueFrom="M_MK_QuotationTest.period_from" :valueTo="M_MK_QuotationTest.period_to" ref="ref_period_from" @from="MdtRange_period_from" @to="MdtRange_period_to" />
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_extra_pict" v-model="M_MK_QuotationTest.extra_pict"  ref="ref_extra_pict"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_extra_drop" v-model="M_MK_QuotationTest.extra_drop"  ref="ref_extra_drop"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputRadioButtonVuex @input="Oncharge_typeChange" :prop="PI_charge_type" v-model="M_MK_QuotationTest.charge_type"  ref="ref_charge_type" />
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_chargeable_weight" v-model="M_MK_QuotationTest.chargeable_weight"  ref="ref_chargeable_weight"/>
                                    </b-col>
                                  </b-row>
                                </b-col>

							</b-row>
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
		Module:"MK",
            propList: {
                initialWhere: "",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
            cm_running_code_h_id_quotation: null,
       
            IEBy: {Input: '', Edit: ''},   			
            M_MK_QuotationTest: {
              mk_quotation_test_h_id: 0,
              subportfolio_cd: this.getDataUser().subportfolio_cd,
              quotation_no: '',
              quotation_date: '',
              cm_contact_id: 0,
              contact_id: '',
              cm_contact_id_descs: '',
              reference_no: '',
              descs: '',
              period_from: '',
              period_to: '',
              extra_pict: 0,
              extra_drop: 0,
              charge_type: '',
              chargeable_weight: 0,
              row_id: 0,
              lastupdatestamp: 0,
              time_edit: '',
            },
            PI_quotation_no: { 
                cValidate :'required|max:20', 
                cName: 'quotation_no', 
                cLabel: 'Quotation No', 
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

            PI_quotation_date: { 
                cValidate :'required', 
                cName: 'quotation_date', 
                cLabel: 'Quotation Date', 
                cLabelSize: 4, 
                cOrder: 2, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_cm_contact_id: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMContact'    , 
                    ColumnDB: 'contact_id'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'contact_id,name' 
                        }, 
                cValidate :'required', 
                cName: 'cm_contact_id', 
                cLabel: 'Customer', 
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
                cMasterUrl: 'CM/CM_Contact' ,
                cDisplayColumn: 'contact_id,name' ,
            }, 

            PI_reference_no: { 
                cValidate :'max:60', 
                cName: 'reference_no', 
                cLabel: 'Reference No', 
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

            PI_descs: { 
                cValidate :'max:255', 
                cName: 'descs', 
                cLabel: 'Description', 
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

            PI_period_from: { 
                cValidate :'', 
                cName: 'period_from', 
                cLabel: 'period', 
                cLabelSize: 4, 
                cOrder: 6, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_extra_pict: { 
                cValidate :'', 
                cName: 'extra_pict', 
                cLabel: 'Extra Pict', 
                cLabelSize: 4, 
                cOrder: 7, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_extra_drop: { 
                cValidate :'', 
                cName: 'extra_drop', 
                cLabel: 'Extra Drop', 
                cLabelSize: 4, 
                cOrder: 8, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_charge_type: { 
                cValidate :'', 
                cName: 'charge_type', 
                cId: 'rdbcharge_type', 
                cRadioOptions: [{ text: 'Trip', value: 'T' }, { text: 'Unit', value: 'U' }], 
                cRadioDefaultOption: '', 
                cLabel:'Charge Type', 
                cLabelSize: 4, 
                cDefault: '', 
                cOrder: 9, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_chargeable_weight: { 
                cValidate :'', 
                cName: 'chargeable_weight', 
                cLabel: 'Chargeable Weight', 
                cLabelSize: 4, 
                cOrder: 10, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 


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
        GetMKSpecification () {
          var param = {
            subportfolio_cd: this.getDataUser().subportfolio_cd,
            module_cd: this.Module
          }

          this.FnDynamicSpec(param)
          .then(ress => {
            if (ress == null) {
              this.PI_quotation_no.cProtect = false
              this.M_MK_QuotationTest.quotation_no= ""
              this.$refs.ref_quotation_no.focus()
            }
            else {
              var data = ress.Data[0]
              this.cm_running_code_h_id_quotation = data.cm_running_code_h_id_quotation
              if (this.cm_running_code_h_id_quotation && this.cm_running_code_h_id_quotation !== "" && this.cm_running_code_h_id_quotation > 0) {
                this.PI_quotation_no.cProtect = true
                this.M_MK_QuotationTest.quotation_no= "(auto)"
              }
            }
          })
        },
        Onquotation_dateChange (data) {
          this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              //{quotation_date}
            }
          })
          this.$forceUpdate()
        },
        Oncm_contact_idChange (data) {
          this.$nextTick(() => {
            this.M_MK_QuotationTest.cm_contact_id = data.id
            this.M_MK_QuotationTest.cm_contact_idLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{cm_contact_id}
            }
          })
          this.$forceUpdate()
        },
        Oncharge_typeChange (data) {
          this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              //{charge_type}
            }
          })
          this.$forceUpdate()
        },
	
		setToolbarButton () {
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
        },		
		paramFromParent(){
        },	
		M_CheckboxChecked(data, status, index){

        },		
        M_Post(dt){
        },
        M_Insert() {
          if (this.cm_running_code_h_id_quotation && this.cm_running_code_h_id_quotation != "" && this.cm_running_code_h_id_quotation > 0) {
            var param = {
              OptionFunctionCd: "GenerateRunningCodeById",
              ModuleCd: "CM",
              subportfolio_cd: this.getDataUser().subportfolio_cd,
              running_id: this.cm_running_code_h_id_quotation,
              user_input: this.getDataUser().user_id,
              date: this.getToday()
            }

            this.FnDynamicFunction(param)
            .then(ress => {
              if (ress == null) return

              var data = ress.Data[0]
              this.M_MK_QuotationTest.quotation_no = data._generate_running_code_id

                          var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                quotation_no: this.M_MK_QuotationTest.quotation_no,
                quotation_date: this.M_MK_QuotationTest.quotation_date == '' || this.M_MK_QuotationTest.quotation_date == null ? 'NULL' : this.M_MK_QuotationTest.quotation_date,
                cm_contact_id: this.M_MK_QuotationTest.cm_contact_id == '' || this.M_MK_QuotationTest.cm_contact_id == null ? 'NULL' : this.M_MK_QuotationTest.cm_contact_id,
                reference_no: this.M_MK_QuotationTest.reference_no,
                descs: this.M_MK_QuotationTest.descs,
                period_from: this.M_MK_QuotationTest.period_from == '' || this.M_MK_QuotationTest.period_from == null ? 'NULL' : this.M_MK_QuotationTest.period_from,
                period_to: this.M_MK_QuotationTest.period_to,
                extra_pict: parseFloat(this.M_MK_QuotationTest.extra_pict ? this.replaceAllString(this.M_MK_QuotationTest.extra_pict, ',', '', 'number') : 0),
                extra_drop: parseFloat(this.M_MK_QuotationTest.extra_drop ? this.replaceAllString(this.M_MK_QuotationTest.extra_drop, ',', '', 'number') : 0),
                charge_type: this.M_MK_QuotationTest.charge_type,
                chargeable_weight: parseFloat(this.M_MK_QuotationTest.chargeable_weight ? this.replaceAllString(this.M_MK_QuotationTest.chargeable_weight, ',', '', 'number') : 0),
                user_input: this.getDataUser().user_id,

            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return
                this.$parent.resultInsert(response.Message)
				
            })
            })
          }
          else {
                        var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                quotation_no: this.M_MK_QuotationTest.quotation_no,
                quotation_date: this.M_MK_QuotationTest.quotation_date == '' || this.M_MK_QuotationTest.quotation_date == null ? 'NULL' : this.M_MK_QuotationTest.quotation_date,
                cm_contact_id: this.M_MK_QuotationTest.cm_contact_id == '' || this.M_MK_QuotationTest.cm_contact_id == null ? 'NULL' : this.M_MK_QuotationTest.cm_contact_id,
                reference_no: this.M_MK_QuotationTest.reference_no,
                descs: this.M_MK_QuotationTest.descs,
                period_from: this.M_MK_QuotationTest.period_from == '' || this.M_MK_QuotationTest.period_from == null ? 'NULL' : this.M_MK_QuotationTest.period_from,
                period_to: this.M_MK_QuotationTest.period_to,
                extra_pict: parseFloat(this.M_MK_QuotationTest.extra_pict ? this.replaceAllString(this.M_MK_QuotationTest.extra_pict, ',', '', 'number') : 0),
                extra_drop: parseFloat(this.M_MK_QuotationTest.extra_drop ? this.replaceAllString(this.M_MK_QuotationTest.extra_drop, ',', '', 'number') : 0),
                charge_type: this.M_MK_QuotationTest.charge_type,
                chargeable_weight: parseFloat(this.M_MK_QuotationTest.chargeable_weight ? this.replaceAllString(this.M_MK_QuotationTest.chargeable_weight, ',', '', 'number') : 0),
                user_input: this.getDataUser().user_id,

            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return
                this.$parent.resultInsert(response.Message)
				
            })
          }

        },
        M_Update() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                mk_quotation_test_h_id: this.M_MK_QuotationTest.mk_quotation_test_h_id,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                quotation_no: this.M_MK_QuotationTest.quotation_no,
                quotation_date: this.M_MK_QuotationTest.quotation_date == '' || this.M_MK_QuotationTest.quotation_date == null ? 'NULL' : this.M_MK_QuotationTest.quotation_date,
                cm_contact_id: this.M_MK_QuotationTest.cm_contact_id == '' || this.M_MK_QuotationTest.cm_contact_id == null ? 'NULL' : this.M_MK_QuotationTest.cm_contact_id,
                reference_no: this.M_MK_QuotationTest.reference_no,
                descs: this.M_MK_QuotationTest.descs,
                period_from: this.M_MK_QuotationTest.period_from == '' || this.M_MK_QuotationTest.period_from == null ? 'NULL' : this.M_MK_QuotationTest.period_from,
                period_to: this.M_MK_QuotationTest.period_to,
                extra_pict: parseFloat(this.M_MK_QuotationTest.extra_pict ? this.replaceAllString(this.M_MK_QuotationTest.extra_pict, ',', '', 'number') : 0),
                extra_drop: parseFloat(this.M_MK_QuotationTest.extra_drop ? this.replaceAllString(this.M_MK_QuotationTest.extra_drop, ',', '', 'number') : 0),
                charge_type: this.M_MK_QuotationTest.charge_type,
                chargeable_weight: parseFloat(this.M_MK_QuotationTest.chargeable_weight ? this.replaceAllString(this.M_MK_QuotationTest.chargeable_weight, ',', '', 'number') : 0),
                lastupdatestamp: this.M_MK_QuotationTest.lastupdatestamp,
                user_edit: this.getDataUser().user_id,

            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_MK_QuotationTest = {
              mk_quotation_test_h_id: 0,
              subportfolio_cd: this.getDataUser().subportfolio_cd,
              quotation_no: '',
              quotation_date: '',
              cm_contact_id: 0,
              contact_id: '',
              cm_contact_id_descs: '',
              reference_no: '',
              descs: '',
              period_from: '',
              period_to: '',
              extra_pict: 0,
              extra_drop: 0,
              charge_type: '',
              chargeable_weight: 0,
              row_id: 0,
              lastupdatestamp: 0,
              time_edit: '',
            }
		},
        M_New(){
          this.GetMKSpecification()

        },
        M_Edit(){
        },
        M_Delete(dt){       
			var data = this.FormToABSList().getRowSelected()  
			var dataDelete = []

			
			data.forEach((value) => {

				
				dataDelete.push({
                mk_quotation_test_h_id: value.mk_quotation_test_h_id,
                lastupdatestamp: value.lastupdatestamp,

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
                LineNo: this.$parent.data.page_order,
                mk_quotation_test_h_id: record.mk_quotation_test_h_id,

            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                this.M_MK_QuotationTest = {
                  mk_quotation_test_h_id: data.mk_quotation_test_h_id,
                  subportfolio_cd: data.subportfolio_cd,
                  quotation_no: data.quotation_no,
                  quotation_date: data.quotation_date,
                  cm_contact_id: data.cm_contact_id,
                  contact_id: data.contact_id,
                  cm_contact_id_descs: data.cm_contact_id_descs,
                  reference_no: data.reference_no,
                  descs: data.descs,
                  period_from: data.period_from,
                  period_to: data.period_to,
                  extra_pict: this.isCurrency(data.extra_pict, this.decimal),
                  extra_drop: this.isCurrency(data.extra_drop, this.decimal),
                  charge_type: data.charge_type,
                  chargeable_weight: this.isCurrency(data.chargeable_weight, this.decimal),
                  row_id: data.row_id,
                  lastupdatestamp: record.lastupdatestamp,
                  time_edit: data.time_edit,
                }

                this.M_MK_QuotationTest.cm_contact_idLabel = this.M_MK_QuotationTest.contact_id != null && this.M_MK_QuotationTest.contact_id != '' ? data.contact_id + this.separator + data.cm_contact_id_descs :'' 


                this.IEBy.Input = data.userinput
                this.IEBy.Edit = data.useredit

            })
        }
        ,MdtRange_period_from (data) {
            this.M_MK_QuotationTest.period_from = data
        }
        ,MdtRange_period_to (data) {
            this.M_MK_QuotationTest.period_to = data
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

