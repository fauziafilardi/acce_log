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
                                        <ABSInputSelectList @change="Oncm_contact_address_id_fromChange" :prop="PI_cm_contact_address_id_from" :value="M_MK_QuotationD.cm_contact_address_id_from" :label="M_MK_QuotationD.cm_contact_address_id_fromLabel" ref="ref_cm_contact_address_id_from"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="Oncm_contact_address_id_toChange" :prop="PI_cm_contact_address_id_to" :value="M_MK_QuotationD.cm_contact_address_id_to" :label="M_MK_QuotationD.cm_contact_address_id_toLabel" ref="ref_cm_contact_address_id_to"/>
                                      </b-col>
                                    </b-row>

                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="Onfm_truck_type_idChange" :prop="PI_fm_truck_type_id" :value="M_MK_QuotationD.fm_truck_type_id" :label="M_MK_QuotationD.fm_truck_type_idLabel" ref="ref_fm_truck_type_id"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="Oncm_uom_idChange" :prop="PI_cm_uom_id" :value="M_MK_QuotationD.cm_uom_id" :label="M_MK_QuotationD.cm_uom_idLabel" ref="ref_cm_uom_id"/>
                                      </b-col>
                                    </b-row>


                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_price" v-model="M_MK_QuotationD.price"  ref="ref_price"/>
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
    props: {PageLevel:'', TabIndex: '', data: ''},
    data() {
        return {
			ValKey:null,
            FormType: "List",
			Module:"MK",
            propList: {
                initialWhere:"contact_id = '" + this.ValKey + "'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_MK_QuotationD :{
                mk_quotation_id: 0,
                p_fm_truck_type_id:0,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                cm_contact_address_id_from: 0,
                cm_contact_address_id_to: 0,
                fm_truck_type_id: 0,
                cm_uom_id: 0,
                user_input: '',
                user_edit: this.getDataUser().user_id,
                time_input: '',
                time_edit: '',
                lastupdatestamp: 0,
                price: 0,
                row_id: 0
                    }
            ,
            PI_cm_contact_address_id_from: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupAddress'    , 
                    ColumnDB: 'address_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
                cName: 'cm_contact_address_id_from', 
                cLabel: 'Address From', 
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
                cMasterUrl: 'CM/CM_Address' ,
                cDisplayColumn: 'address_cd' ,
            },
            PI_cm_contact_address_id_to: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupAddress'    , 
                    ColumnDB: 'address_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
                cName: 'cm_contact_address_id_to', 
                cLabel: 'Address To', 
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
                cMasterUrl: 'CM/CM_Address' ,
                cDisplayColumn: 'address_cd' ,
            }, 
            PI_fm_truck_type_id: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupFMTruckType'    , 
                    ColumnDB: 'truck_type_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'fm_truck_type_id', 
                cLabel: 'Truck Type', 
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
                cDisplayColumn: 'truck_type_cd,descs' ,
            }, 
            PI_cm_uom_id: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMUom'    , 
                    ColumnDB: 'uom_id'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'cm_uom_id', 
                cLabel: 'UOM', 
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
                cDisplayColumn: 'uom_cd,descs' ,
            }, 
            
            PI_price: { 
                cValidate :'', 
                cName: 'price', 
                cLabel: 'Price', 
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
  },
    methods: {
        Oncm_contact_address_id_fromChange (data) {
        this.$nextTick(() => {
            this.M_MK_QuotationD.cm_contact_address_id_from = data.id
            this.M_MK_QuotationD.cm_contact_address_id_fromLabel = data.label
            if (this.inputStatus != "VIEW") {

            }
        })
        this.$forceUpdate()
        },

        Oncm_contact_address_id_toChange (data) {
        this.$nextTick(() => {
            this.M_MK_QuotationD.cm_contact_address_id_to = data.id
            this.M_MK_QuotationD.cm_contact_address_id_toLabel = data.label
            if (this.inputStatus != "VIEW") {

            }
        })
        this.$forceUpdate()
        },
        Onfm_truck_type_idChange (data) {
            console.log(data)
        this.$nextTick(() => {
            this.M_MK_QuotationD.fm_truck_type_id = data.id
            this.M_MK_QuotationD.fm_truck_type_idLabel = data.label
            if (this.inputStatus != "VIEW") {

            }
        })
        this.$forceUpdate()
        },
        Oncm_uom_idChange (data) {
        this.$nextTick(() => {
            this.M_MK_QuotationD.cm_uom_id = data.id
            this.M_MK_QuotationD.cm_uom_idLabel = data.label
            if (this.inputStatus != "VIEW") {

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
            this.$parent.showForm = false
			
            let data = this.$store.getters.GetPage1Data
            this.M_MK_QuotationD.mk_quotation_id = data.contact_id 
            this.propList.initialWhere =" mk_quotation_id = '" + data.row_id + "' "
        

            this.FormToABSList().doGetList('','eb_getList')

            this.PI_cm_contact_address_id_from.dataLookUp.InitialWhere = " cm_contact_id = "+data.cm_contact_id;
            this.PI_cm_contact_address_id_to.dataLookUp.InitialWhere = " cm_contact_id = "+data.cm_contact_id;

            if(data.charge_type=='T')
            {
                this.PI_cm_uom_id.cProtect = true
                this.PI_fm_truck_type_id.cProtect = false
            }
            else if (data.charge_type=='U')
            {
                this.PI_cm_uom_id.cProtect = false
                this.PI_fm_truck_type_id.cProtect = true

                
            }
        },		       
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,

                subportfolio_cd : this.getDataUser().subportfolio_cd,
                mk_quotation_id : this.DataRowPage1.row_id,
                cm_contact_address_id_from: this.M_MK_QuotationD.cm_contact_address_id_from == '' || this.M_MK_QuotationD.cm_contact_address_id_from == null ? 'NULL' : this.M_MK_QuotationD.cm_contact_address_id_from , 
                cm_contact_address_id_to: this.M_MK_QuotationD.cm_contact_address_id_to == '' || this.M_MK_QuotationD.cm_contact_address_id_to == null ? 'NULL' : this.M_MK_QuotationD.cm_contact_address_id_to , 
                fm_truck_type_id: this.M_MK_QuotationD.fm_truck_type_id == '' || this.M_MK_QuotationD.fm_truck_type_id == null ? 'NULL' : this.M_MK_QuotationD.fm_truck_type_id , 
                cm_uom_id: this.M_MK_QuotationD.cm_uom_id == '' || this.M_MK_QuotationD.cm_uom_id == null ? 'NULL' : this.M_MK_QuotationD.cm_uom_id , 
                price: this.M_MK_QuotationD.price,
                user_input: this.getDataUser().user_id                 
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

                subportfolio_cd : this.getDataUser().subportfolio_cd,
                mk_quotation_d_id : this.M_MK_QuotationD.row_id,
                cm_contact_address_id_from: this.M_MK_QuotationD.cm_contact_address_id_from == '' || this.M_MK_QuotationD.cm_contact_address_id_from == null ? 'NULL' : this.M_MK_QuotationD.cm_contact_address_id_from , 
                cm_contact_address_id_to: this.M_MK_QuotationD.cm_contact_address_id_to == '' || this.M_MK_QuotationD.cm_contact_address_id_to == null ? 'NULL' : this.M_MK_QuotationD.cm_contact_address_id_to , 
                fm_truck_type_id: this.M_MK_QuotationD.fm_truck_type_id == '' || this.M_MK_QuotationD.fm_truck_type_id == null ? 'NULL' : this.M_MK_QuotationD.fm_truck_type_id , 
                cm_uom_id: this.M_MK_QuotationD.cm_uom_id == '' || this.M_MK_QuotationD.cm_uom_id == null ? 'NULL' : this.M_MK_QuotationD.cm_uom_id , 
                price: this.M_MK_QuotationD.price, 
                user_edit: this.getDataUser().user_id ,
                lastupdatestamp: this.M_MK_QuotationD.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_MK_QuotationD = {
               mk_quotation_id: 0,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                cm_contact_address_id_from: 0,
                cm_contact_address_id_to: 0,
                fm_truck_type_id: 0,
                cm_uom_id: 0,
                user_input: '',
                user_edit: this.getDataUser().user_id,
                time_input: '',
                time_edit: '',
                lastupdatestamp: 0,
                price: 0,
                row_id: 0
                    }
            		
		},
        M_New(){
            let data = this.$store.getters.GetPage1Data
            this.M_MK_QuotationD.mk_quotation_id = data.contact_id

            this.$refs.ref_cm_contact_address_id_from.focus()

        },
        M_Edit(){
            // this.$refs.ref_descs.focus()
        },
        M_Delete(dt){           

            var data = this.FormToABSList().getRowSelected()  
			var dataDelete = []

			
			data.forEach((value) => {			
				dataDelete.push({
                mk_quotation_d_id: value.row_id,
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
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order
,                mk_quotation_id: this.DataRowPage1.row_id,
                mk_quotation_d_id: record.row_id	
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
this.M_MK_QuotationD = {
                mk_quotation_id: this.DataRowPage1.row_id,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                cm_contact_address_id_from: data.cm_contact_address_id_from,
                cm_contact_address_id_to: data.cm_contact_address_id_to,
                fm_truck_type_id: data.fm_truck_type_id,
                cm_uom_id: data.cm_uom_id,                
                lastupdatestamp: data.lastupdatestamp,
                price: this.isCurrency(data.price,this.decimal),
                row_id: data.row_id
                    }
                 

                this.M_MK_QuotationD.cm_contact_address_id_fromLabel = this.M_MK_QuotationD.cm_contact_address_id_from != null ? data.address_from :'' 
                this.M_MK_QuotationD.cm_contact_address_id_toLabel = this.M_MK_QuotationD.cm_contact_address_id_to != null ? data.address_to :'' 

                this.M_MK_QuotationD.fm_truck_type_idLabel = this.M_MK_QuotationD.fm_truck_type_id != null ? data.truck_type :'' 
                this.M_MK_QuotationD.cm_uom_idLabel = this.M_MK_QuotationD.cm_uom_id != null ? data.uom :'' 
  

                this.IEBy.Input = data.user_input
                this.IEBy.Edit = data.user_edit

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

