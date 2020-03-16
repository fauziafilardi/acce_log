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
                                      <ABSInputSelectList @change="Oncm_contact_address_id_fromChange" :prop="PI_cm_contact_address_id_from" :value="M_MK_QuotationTestD.cm_contact_address_id_from" :label="M_MK_QuotationTestD.cm_contact_address_id_fromLabel" ref="ref_cm_contact_address_id_from"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Oncm_contact_address_id_toChange" :prop="PI_cm_contact_address_id_to" :value="M_MK_QuotationTestD.cm_contact_address_id_to" :label="M_MK_QuotationTestD.cm_contact_address_id_toLabel" ref="ref_cm_contact_address_id_to"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Onfm_truck_type_idChange" :prop="PI_fm_truck_type_id" :value="M_MK_QuotationTestD.fm_truck_type_id" :label="M_MK_QuotationTestD.fm_truck_type_idLabel" ref="ref_fm_truck_type_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Oncm_uom_idChange" :prop="PI_cm_uom_id" :value="M_MK_QuotationTestD.cm_uom_id" :label="M_MK_QuotationTestD.cm_uom_idLabel" ref="ref_cm_uom_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_price" v-model="M_MK_QuotationTestD.price"  ref="ref_price"/>
                                    </b-col>
                                  </b-row>
                                </b-col>

                <b-col md="6" id="col-right">
                  <b-row>
                    <b-col md="12">
                      <ABSGoogleMaps :prop="PI_Maps" v-model="M_MK_QuotationTestD.maps"  ref="ref_maps" />
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
    props: {PageLevel:'', TabIndex: '', data: ''},
    data() {
        return {
			ValKey:null,
            FormType: "List",
			Module:"MK",
            propList: {
                initialWhere:" = '" + this.ValKey + "'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			
            M_MK_QuotationTestD: {
              subportfolio_cd: this.getDataUser().subportfolio_cd,
              mk_quotation_test_d_id: 0,
              mk_quotation_test_h_id: 0,
              cm_contact_address_id_from: 0,
              cm_contact_address_id_from_cd: '',
              cm_contact_address_id_from_descs: '',
              cm_contact_address_id_to: 0,
              cm_contact_address_id_to_cd: '',
              cm_contact_address_id_to_descs: '',
              fm_truck_type_id: 0,
              fm_truck_type_id_cd: '',
              fm_truck_type_id_descs: '',
              cm_uom_id: 0,
              cm_uom_id_cd: '',
              cm_uom_id_descs: '',
              price: 0,
              row_id: 0,
              lastupdatestamp: 0,
              time_edit: '',
              maps: ''
            },
            PI_cm_contact_address_id_from: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupAddress'    , 
                    ColumnDB: 'address_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'address_cd' 
                        }, 
                cValidate :'required', 
                cName: 'cm_contact_address_id_from', 
                cLabel: 'Address From', 
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
                cDisplayColumn: 'address_cd' ,
            }, 

            PI_cm_contact_address_id_to: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupAddress'    , 
                    ColumnDB: 'address_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'address_cd' 
                        }, 
                cValidate :'required', 
                cName: 'cm_contact_address_id_to', 
                cLabel: 'Address To', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 2, 
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
                cDisplayColumn: 'address_cd' ,
            }, 

            PI_fm_truck_type_id: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupFMTruckType'    , 
                    ColumnDB: 'truck_type_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'truck_type_cd,descs' 
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
                    ColumnDB: 'uom_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'uom_cd,descs' 
                        }, 
                cValidate :'', 
                cName: 'cm_uom_id', 
                cLabel: 'UOM', 
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
                cDisplayColumn: 'uom_cd,descs' ,
            }, 

            PI_price: { 
                cValidate :'', 
                cName: 'price', 
                cLabel: 'Price', 
                cLabelSize: 4, 
                cOrder: 5, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_Maps: { 
                cValidate :'', 
                cName: 'Maps', 
                cLabel: 'Maps', 
                cLabelSize: 4, 
                cOrder: 5, 
                cKey: false, 
                cType: '',
                cDecimal: 2, 
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
        Oncm_contact_address_id_fromChange (data) {
          this.$nextTick(() => {
            this.M_MK_QuotationTestD.cm_contact_address_id_from = data.id
            this.M_MK_QuotationTestD.cm_contact_address_id_fromLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{cm_contact_address_id_from}
            }
          })
          this.$forceUpdate()
        },
        Oncm_contact_address_id_toChange (data) {
          this.$nextTick(() => {
            this.M_MK_QuotationTestD.cm_contact_address_id_to = data.id
            this.M_MK_QuotationTestD.cm_contact_address_id_toLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{cm_contact_address_id_to}
            }
          })
          this.$forceUpdate()
        },
        Onfm_truck_type_idChange (data) {
          this.$nextTick(() => {
            this.M_MK_QuotationTestD.fm_truck_type_id = data.id
            this.M_MK_QuotationTestD.fm_truck_type_idLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{fm_truck_type_id}
            }
          })
          this.$forceUpdate()
        },
        Oncm_uom_idChange (data) {
          this.$nextTick(() => {
            this.M_MK_QuotationTestD.cm_uom_id = data.id
            this.M_MK_QuotationTestD.cm_uom_idLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{cm_uom_id}
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
            this.$parent.showForm = false
			
            this.propList.initialWhere =""


            this.FormToABSList().doGetList('','eb_getList')
        },		
		M_CheckboxChecked(data, status, index){

        },		
        M_Insert() {
          console.log(this.M_MK_QuotationTestD)
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                mk_quotation_test_h_id: this.M_MK_QuotationTestD.mk_quotation_test_h_id,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                cm_contact_address_id_from: this.M_MK_QuotationTestD.cm_contact_address_id_from == '' || this.M_MK_QuotationTestD.cm_contact_address_id_from == null ? 'NULL' : this.M_MK_QuotationTestD.cm_contact_address_id_from,
                cm_contact_address_id_to: this.M_MK_QuotationTestD.cm_contact_address_id_to == '' || this.M_MK_QuotationTestD.cm_contact_address_id_to == null ? 'NULL' : this.M_MK_QuotationTestD.cm_contact_address_id_to,
                fm_truck_type_id: this.M_MK_QuotationTestD.fm_truck_type_id == '' || this.M_MK_QuotationTestD.fm_truck_type_id == null ? 'NULL' : this.M_MK_QuotationTestD.fm_truck_type_id,
                cm_uom_id: this.M_MK_QuotationTestD.cm_uom_id == '' || this.M_MK_QuotationTestD.cm_uom_id == null ? 'NULL' : this.M_MK_QuotationTestD.cm_uom_id,
                price: parseFloat(this.M_MK_QuotationTestD.price ? this.replaceAllString(this.M_MK_QuotationTestD.price, ',', '', 'number') : 0),
                user_input: this.getDataUser().user_id,

            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return
                this.$parent.resultInsert(response.Message)
				
            })
        },
        M_Update() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                mk_quotation_test_d_id: this.M_MK_QuotationTestD.mk_quotation_test_d_id,
                mk_quotation_test_h_id: this.M_MK_QuotationTestD.mk_quotation_test_h_id,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                cm_contact_address_id_from: this.M_MK_QuotationTestD.cm_contact_address_id_from == '' || this.M_MK_QuotationTestD.cm_contact_address_id_from == null ? 'NULL' : this.M_MK_QuotationTestD.cm_contact_address_id_from,
                cm_contact_address_id_to: this.M_MK_QuotationTestD.cm_contact_address_id_to == '' || this.M_MK_QuotationTestD.cm_contact_address_id_to == null ? 'NULL' : this.M_MK_QuotationTestD.cm_contact_address_id_to,
                fm_truck_type_id: this.M_MK_QuotationTestD.fm_truck_type_id == '' || this.M_MK_QuotationTestD.fm_truck_type_id == null ? 'NULL' : this.M_MK_QuotationTestD.fm_truck_type_id,
                cm_uom_id: this.M_MK_QuotationTestD.cm_uom_id == '' || this.M_MK_QuotationTestD.cm_uom_id == null ? 'NULL' : this.M_MK_QuotationTestD.cm_uom_id,
                price: parseFloat(this.M_MK_QuotationTestD.price ? this.replaceAllString(this.M_MK_QuotationTestD.price, ',', '', 'number') : 0),
                lastupdatestamp: this.M_MK_QuotationTestD.lastupdatestamp,
                user_edit: this.getDataUser().user_id,

            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_MK_QuotationTestD = {
              subportfolio_cd: this.getDataUser().subportfolio_cd,
              mk_quotation_test_d_id: 0,
              mk_quotation_test_h_id: 0,
              cm_contact_address_id_from: 0,
              cm_contact_address_id_from_cd: '',
              cm_contact_address_id_from_descs: '',
              cm_contact_address_id_to: 0,
              cm_contact_address_id_to_cd: '',
              cm_contact_address_id_to_descs: '',
              fm_truck_type_id: 0,
              fm_truck_type_id_cd: '',
              fm_truck_type_id_descs: '',
              cm_uom_id: 0,
              cm_uom_id_cd: '',
              cm_uom_id_descs: '',
              price: 0,
              row_id: 0,
              lastupdatestamp: 0,
              time_edit: '',
              maps: ''
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
                mk_quotation_test_d_id: value.mk_quotation_test_d_id,
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
                mk_quotation_test_d_id: record.mk_quotation_test_d_id,

            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
                this.M_MK_QuotationTestD = {
                  subportfolio_cd: data.subportfolio_cd,
                  mk_quotation_test_d_id: data.mk_quotation_test_d_id,
                  mk_quotation_test_h_id: data.mk_quotation_test_h_id,
                  cm_contact_address_id_from: data.cm_contact_address_id_from,
                  cm_contact_address_id_from_cd: data.cm_contact_address_id_from_cd,
                  cm_contact_address_id_from_descs: data.cm_contact_address_id_from_descs,
                  cm_contact_address_id_to: data.cm_contact_address_id_to,
                  cm_contact_address_id_to_cd: data.cm_contact_address_id_to_cd,
                  cm_contact_address_id_to_descs: data.cm_contact_address_id_to_descs,
                  fm_truck_type_id: data.fm_truck_type_id,
                  fm_truck_type_id_cd: data.fm_truck_type_id_cd,
                  fm_truck_type_id_descs: data.fm_truck_type_id_descs,
                  cm_uom_id: data.cm_uom_id,
                  cm_uom_id_cd: data.cm_uom_id_cd,
                  cm_uom_id_descs: data.cm_uom_id_descs,
                  price: this.isCurrency(data.price, this.decimal),
                  row_id: data.row_id,
                  lastupdatestamp: record.lastupdatestamp,
                  time_edit: data.time_edit,
                }

                this.M_MK_QuotationTestD.cm_contact_address_id_fromLabel = this.M_MK_QuotationTestD.cm_contact_address_id_from_cd != null && this.M_MK_QuotationTestD.cm_contact_address_id_from_cd != '' ? data.cm_contact_address_id_from_cd + this.separator + data.cm_contact_address_id_from_descs :'' 
                this.M_MK_QuotationTestD.cm_contact_address_id_toLabel = this.M_MK_QuotationTestD.cm_contact_address_id_to_cd != null && this.M_MK_QuotationTestD.cm_contact_address_id_to_cd != '' ? data.cm_contact_address_id_to_cd + this.separator + data.cm_contact_address_id_to_descs :'' 
                this.M_MK_QuotationTestD.fm_truck_type_idLabel = this.M_MK_QuotationTestD.fm_truck_type_id_cd != null && this.M_MK_QuotationTestD.fm_truck_type_id_cd != '' ? data.fm_truck_type_id_cd + this.separator + data.fm_truck_type_id_descs :'' 
                this.M_MK_QuotationTestD.cm_uom_idLabel = this.M_MK_QuotationTestD.cm_uom_id_cd != null && this.M_MK_QuotationTestD.cm_uom_id_cd != '' ? data.cm_uom_id_cd + this.separator + data.cm_uom_id_descs :'' 


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

