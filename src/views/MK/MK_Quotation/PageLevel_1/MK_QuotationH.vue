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
                                        <ABSinputTextVuex @input="Onquotation_noChange" :prop="PI_quotation_no" v-model="M_QuotationH.quotation_no"  ref="ref_quotation_no"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputDateVuex @input="Onquotation_dateChange" :prop="PI_quotation_date" v-model="M_QuotationH.quotation_date"  ref="ref_quotation_date" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="Oncm_contact_idChange" :prop="PI_cm_contact_id" :value="M_QuotationH.cm_contact_id" :label="M_QuotationH.cm_contact_idLabel" ref="ref_cm_contact_id"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex @input="Onreference_noChange" :prop="PI_reference_no" v-model="M_QuotationH.reference_no"  ref="ref_reference_no"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OndescsChange" :prop="PI_descs" v-model="M_QuotationH.descs"  ref="ref_descs" />
                                      </b-col>
                                    </b-row>                                  
                                   
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputDateRangeVuex :prop="PI_period_from" :valueFrom="M_QuotationH.period_from" :valueTo="M_QuotationH.period_to" ref="ref_period_from" @from="MdtRange_period_from" @to="MdtRange_period_to" @fromBlur="BlurRange_period_from" @toBlur="BlurRange_period_to" />
                                      </b-col>
                                    </b-row>

                                    <b-row>
                                    <b-col md="6">
                                      <ABSinputTextVuex :prop="PI_extra_pict" v-model="M_QuotationH.extra_pict"  ref="ref_extra_pict"/>
                                    </b-col>
                                  </b-row>
                                    <b-row>
                                    <b-col md="6">
                                      <ABSinputTextVuex :prop="PI_extra_drop" v-model="M_QuotationH.extra_drop"  ref="ref_extra_drop"/>
                                    </b-col>
                                  </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="Oncharge_typeChange" :prop="PI_charge_type" v-model="M_QuotationH.charge_type"  ref="ref_charge_type" />
                                      </b-col>
                                    </b-row>  
                                     <b-row>
                                    <b-col md="6">
                                      <ABSinputTextVuex :prop="PI_chargeable_weight" v-model="M_QuotationH.chargeable_weight"  ref="ref_chargeable_weight"/>
                                    </b-col>
                                  </b-row>                                                                                                     
                                </b-col> <!-- table close -->
                  
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
		FormType: "List",
        Module:"MK",
        ValKey:null,
        cInsertKey:'id=contact_id,label=contact_id+|+name',
       propList: {
                initialWhere:"subportfolio_cd = '" + this.getDataUser().subportfolio_cd + "'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
            IEBy: {Input: '', Edit: ''},   			
            ContactApproval: '',
            quotation_running_id: 0,

            M_QuotationH :{
                quotation_no: '',
                quotation_date: '',
                cm_contact_id: '',
                reference_no: '',  
                descs: '',
                period_from:'',
                period_to:'',
                extra_pict:0,
                extra_drop:0,
                charge_type: 'T',
                chargeable_weight:0,
                user_input: '',
                time_input: '',
                user_edit: this.getDataUser().user_id,
                time_edit: '',
                lastupdatestamp: 0,
                row_id: 0
                    }
            ,
            PI_quotation_no: { 
                cValidate :'required|max:20', 
                cName: 'quotation_no', 
                cLabel: 'Quotatio No', 
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
                    ParamWhere: ''  
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
                cMasterUrl: '' ,
                cDisplayColumn: 'contact_id,name' ,
            }, 
            PI_reference_no: { 
                cValidate :'max:30', 
                cName: 'reference_no', 
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

            PI_descs: { 
                cValidate :'', 
                cName:'descs', 
                cLabel:'Description', 
                cLabelSize: 4, 
                cOrder:6, 
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

            PI_period_from: { 
                cValidate :'', 
                cValidateTo : '',
                cName: 'period_from', 
                cLabel: 'Period From - To ', 
                cLabelSize: 4, 
                cOrder: 7, 
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
                cLabel: 'Extra Pick', 
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
                // cLastLabel: 'PSM' 
            }, 

            PI_extra_drop: { 
                cValidate :'', 
                cName: 'extra_drop', 
                cLabel: 'Extra Drop', 
                cLabelSize: 4, 
                cOrder: 9, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
                // cLastLabel: 'PSM' 
            }, 
            PI_chargeable_weight: { 
                cValidate :'', 
                cName: 'chargeable_weight', 
                cLabel: 'Chargeable Weight', 
                cLabelSize: 4, 
                cOrder: 9, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
                // cLastLabel: 'PSM' 
            }, 
            PI_charge_type: { 
                cValidate :'', 
                cName: 'charge_type', 
                cId: 'rdbcharge_type', 
                cRadioOptions: [{ text: 'Trip', value: 'T' }, { text: 'Unit', value: 'U' }], 
                cRadioDefaultOption: 'T', 
                cLabel:'Charge Type', 
                cLabelSize: 4, 
                cOrder: 10, 
                cProtect: false, 
                cVisible:  true, 
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
	}
  },
    methods: {
        MdtRange_period_from (data) {
          if (this.inputStatus != "VIEW") {
            this.M_QuotationH.period_from = data                
          }   
        }
        ,MdtRange_period_to (data) {
          if (this.inputStatus != "VIEW") {
            this.M_QuotationH.period_to = data
         
          }
        }
        ,BlurRange_period_from (data) {
          // kena onchange 

            // this.M_QuotationH.period_from = data
        }
        ,BlurRange_period_to (data) {
            // this.M_QuotationH.period_to = data
        },
        GetCMSpecification(){
      
        },
        Onquotation_noChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{quotation_no}
            }
        })
        this.$forceUpdate()
        },
        Oncm_contact_idChange (data) {
        this.$nextTick(() => {
            this.M_QuotationH.cm_contact_id = data.id
            this.M_QuotationH.cm_contact_idLabel = data.label
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
                       
        Onreference_noChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{reference_no}
            }
        })
        this.$forceUpdate()
        },
        Onquotation_dateChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{quotation_date}
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
            // this.$refs.modalTest.show()
        },		
		paramFromParent(){
        },		
        M_Post(){
        },
        M_Insert() {
          if (this.quotation_running_id > 0 || this.quotation_running_id != "") { 
              var param = {
                  OptionFunctionCd: "GenerateRunningCodeById",
                  ModuleCd: "CM",
                  subportfolio_cd: this.getDataUser().subportfolio_cd,
                  running_id: this.quotation_running_id,
                  user_input: this.getDataUser().user_id,
                  date: this.getToday()
              }

              this.FnDynamicFunction(param)
              .then(ress => {
                console.log(ress)
                var data = ress.Data[0]

                if (ress != null){                  
                  this.M_QuotationH.quotation_no = data._generate_running_code_id
                  console.log(data._generate_running_code_id)
                                      
                }

                  var param = {			
                        OptionSeq: this.getOptionSeq().OptionSeq,
                        LineNo: this.$parent.data.page_order,
                        subportfolio_cd: this.getDataUser().subportfolio_cd,
                        quotation_no: this.M_QuotationH.quotation_no,
                        quotation_date: this.M_QuotationH.quotation_date,
                        cm_contact_id: this.M_QuotationH.cm_contact_id == '' || this.M_QuotationH.cm_contact_id == null ? 'NULL' : this.M_QuotationH.cm_contact_id ,                        
                        ref_no: this.M_QuotationH.reference_no,
                        descs: this.M_QuotationH.descs,
                        period_from: this.M_QuotationH.period_from,
                        period_to: this.M_QuotationH.period_to,                        
                        extra_pict: this.M_QuotationH.extra_pict,
                        extra_drop: this.M_QuotationH.extra_drop,
                        charge_type: this.M_QuotationH.charge_type,
                        chargeable_weight: this.M_QuotationH.chargeable_weight,
                        user_input: this.getDataUser().user_id           
                    }

                this.postJSON(this.getUrlInsert(), param)
                    .then((response) => {
                        if(response == null) return
                        //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                        this.$parent.resultInsert(response.Message)
                    })
              })

        
          }
        },
        M_Update() {
            var param = {			
                        OptionSeq: this.getOptionSeq().OptionSeq,
                        LineNo: this.$parent.data.page_order,

                        subportfolio_cd: this.getDataUser().subportfolio_cd,
                        quotation_no: this.M_QuotationH.quotation_no,
                        quotation_date: this.M_QuotationH.quotation_date,
                        cm_contact_id: this.M_QuotationH.cm_contact_id == '' || this.M_QuotationH.cm_contact_id == null ? 'NULL' : this.M_QuotationH.cm_contact_id ,                        
                        ref_no: this.M_QuotationH.reference_no,
                        descs: this.M_QuotationH.descs,
                        period_from: this.M_QuotationH.period_from,
                        period_to: this.M_QuotationH.period_to,                        
                        extra_pict: this.M_QuotationH.extra_pict,
                        extra_drop: this.M_QuotationH.extra_drop,
                        charge_type: this.M_QuotationH.charge_type,
                        chargeable_weight: this.M_QuotationH.chargeable_weight,
                        user_edit: this.getDataUser().user_id,
                        lastupdatestamp:this.M_QuotationH.lastupdatestamp,
                        mk_quotation_h_id: this.M_QuotationH.row_id           
                    }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })

        },
		M_ClearForm(){
            this.M_QuotationH = {
                quotation_no: '',
                quotation_date: '',
                cm_contact_id: '',
                reference_no: '',  
                descs: '',
                period_from:'',
                period_to:'',
                extra_pict:0,
                extra_drop:0,
                charge_type: 'T',
                chargeable_weight:0,
                user_input: '',
                time_input: '',
                user_edit: this.getDataUser().user_id,
                time_edit: '',
                lastupdatestamp: 0,
                row_id: 0
                    }
            		
		},
        M_New(){
           var param = {
            subportfolio_cd: this.getDataUser().subportfolio_cd,
            module_cd: this.Module            
          }

          // this.FnDynamicFunction(param)
          //   .then(ress => {
          //     console.log(ress)
          //     // if(ress == null) return
          //     var data = ress.Data[0]
          //     console.log(data)
          //     if (ress != null){
          //       this.quotation_running_id = data.cm_running_code_h_id_quotation
          //       if(this.quotation_running_id > 0 || this.quotation_running_id != ""){
          //         this.PI_quotation_no.cProtect = true
          //         this.M_QuotationH.quotation_no = "(auto)"
          //         this.$refs.ref_cm_contact_id.focus()
          //       } 
          //     } else {
          //       this.PI_quotation_no.cProtect = false
          //       this.M_QuotationH.quotation_no = ""
          //       this.$refs.ref_quotation_no.focus()
          //     }            
          //   })
          this.FnDynamicSpec(param)
            .then(ress=>{
                    console.log(ress)
              // if(ress == null) return
              var data = ress.Data[0]
              console.log(data)
              if (ress != null){
                this.quotation_running_id = data.cm_running_code_h_id_quotation
                if(this.quotation_running_id > 0 || this.quotation_running_id != ""){
                  this.PI_quotation_no.cProtect = true
                  this.M_QuotationH.quotation_no = "(auto)"
                  this.$refs.ref_cm_contact_id.focus()
                } 
              } else {
                this.PI_quotation_no.cProtect = false
                this.M_QuotationH.quotation_no = ""
                this.$refs.ref_quotation_no.focus()
              }         
            })

                  
        },
        M_Edit(){
            this.$refs.ref_cm_contact_id.focus()
        },
        M_Delete(dt){       

        var data = this.FormToABSList().getRowSelected()  
        var dataDelete = []

        
        data.forEach((value) => {
            console.log(value);
          dataDelete.push({
          mk_quotation_id: value.row_id,
          lastupdatestamp: value.lastupdatestamp,
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
            console.log(record);
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                mk_quotation_id: record.row_id,
                quotation_no: record.quotation_no
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                
                 this.M_QuotationH ={
                        quotation_no: data.quotation_no,
                        quotation_date: data.quotation_date,
                        cm_contact_id: data.cm_contact_id,
                        reference_no: data.reference_no,  
                        descs: data.descs,
                        period_from:data.period_from,
                        period_to:data.period_to,
                        extra_pict:this.isCurrency(data.extra_pict, this.decimal),
                        extra_drop:this.isCurrency(data.extra_drop, this.decimal),
                        charge_type: data.charge_type,
                        chargeable_weight:this.isCurrency(data.chargeable_weight, this.decimal),

                        lastupdatestamp: data.lastupdatestamp,
                        row_id: record.row_id
                }
                 
                this.M_QuotationH.cm_contact_idLabel = this.M_QuotationH.cm_contact_id != null ? data.contact_id  :'' 
                
         

                this.IEBy.Input = data.user_input
                this.IEBy.Edit = data.user_edit

            })
        },


    },
    beforeCreate: function () {
    },
    created: function() {
    this.GetCMSpecification()
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

