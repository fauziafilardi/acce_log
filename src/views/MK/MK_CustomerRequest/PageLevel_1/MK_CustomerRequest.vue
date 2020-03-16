<template>
  <div>
    <div v-show="true"  :style="'margin-top:10px;'" class="el" mousetip mousetip-msg="I'm a tooltip">
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
                      <ABSinputDateVuex @input="OndateChange" :prop="PI_date" v-model="M_MK_CustomerRequestH.date"  ref="ref_date" />
                    </b-col>
                  </b-row>
                  <b-row>
                    <b-col md="12">
                      <ABSInputSelectList @change="Oncm_contact_idChange" :prop="PI_cm_contact_id" :value="M_MK_CustomerRequestH.cm_contact_id" :label="M_MK_CustomerRequestH.cm_contact_idLabel" ref="ref_cm_contact_id"/>
                    </b-col>
                  </b-row>
                  <b-row>
                    <b-col md="12">
                      <ABSinputRadioButtonVuex @input="Oncharge_typeChange" :prop="PI_charge_type" v-model="M_MK_CustomerRequestH.charge_type"  ref="ref_charge_type" />
                    </b-col>
                  </b-row>
                  <b-row>
                    <b-col md="12">
                      <ABSTextAreaVuex :prop="PI_remarks" v-model="M_MK_CustomerRequestH.remarks"  ref="ref_remarks" />
                    </b-col>
                  </b-row>
                </b-col>
							</b-row>

              <b-button style="font-size: 10px;padding-top: 3px;padding-bottom: 3px; margin-bottom: 5px;" @click="addProspect"><font-awesome-icon icon="plus" class="icon-style-1"/> Add Prospect</b-button>

              <b-row style="padding-left:10px;" v-show="DataProspect.length > 0" v-for="(data, index) in DataProspect" v-bind:key="index">
                <div style="width: 100%; border-color: black; border-width: 1px; border-style:solid; padding-top:5px; margin-bottom: 1px;">
                  <b-col md="12">
                    <b-row>
                      <b-col md="6">
                        <ABSInputSelectList @change="OnLookupChange($event, index, 'fm_fleet_type_id')" :prop="data.props.PI_fm_fleet_type_id" :value="data.models.fm_fleet_type_id" :label="data.models.fm_fleet_type_idLabel" :ref="data.refs.fm_fleet_type_id"/>
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <ABSGoogleMaps @change="OnMapsChange($event, index, 'address_from')" :prop="data.props.PI_address_from" v-model="data.models.address_from"  :ref="data.refs.address_from" />
                      </b-col>
                      <b-col md="6">
                        <ABSGoogleMaps @change="OnMapsChange($event, index, 'address_to')" :prop="data.props.PI_address_to" v-model="data.models.address_to"  :ref="data.refs.address_to" />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <ABSTextAreaVuex :prop="data.props.PI_address_from_detail" v-model="data.models.address_from_detail"  :ref="data.refs.address_from_detail"/>
                        <!-- <ABSTextAreaVuex :prop="PI_remarks" v-model="M_MK_CustomerRequestH.remarks"  ref="ref_remarks" /> -->
                      </b-col>
                      <b-col md="6">
                        <ABSTextAreaVuex :prop="data.props.PI_address_to_detail" v-model="data.models.address_to_detail"  :ref="data.refs.address_to_detail"/>
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <ABSTextAreaVuex :prop="data.props.PI_commodity" v-model="data.models.commodity"  :ref="data.refs.commodity"/>
                      </b-col>
                    </b-row>
                  </b-col>
                </div>
                <font-awesome-icon @click="removeProspect(index)" icon="minus" class="icon-style-1__iconDelete"/>
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
  props: {PageLevel: '',TabIndex: '',data: ''},
  data() {
    return {
      cInsertKey:'',
      FormType: "Form",
      Module:"MK",
      IEBy: {Input: '',Edit: ''},

      DataProspect: [],
      iCount: 0,
      maxComponent: 4,
      customer_request_running_code: null,

      //# Model Header
        M_MK_CustomerRequestH: {
          customer_request_no: '',
          date: '',
          cm_contact_id: '',
          cm_contact_idLabel: '',
          charge_type: '',
          remarks: ''
        },
      //# End Model Header

      //# PI Header
        PI_date: {
          cValidate: '',
          cName: 'date',
          cLabel: 'Date',
          cLabelSize: 4,
          cOrder: 1,
          cKey: false,
          cVisible: true,
          cProtect: false,
          cPageLevel: this.PageLevel,
          cTabIndex: this.TabIndex,
          cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
        },
        PI_cm_contact_id: { 
          dataLookUp: { 
            LookUpCd: 'GetLookupCMContact',
            ColumnDB: 'contact_id',
            InitialWhere: "",
            ParamWhere: "",
            SourceField: '',
            DisplayLookup: 'contact_id,name'
          },
          cValidate: '',
          cName: 'cm_contact_id',
          cLabel: 'Prospect',
          cKey: false,
          cLabelSize: 4,
          cOrder: 2,
          cTriggered: false,
          cDefault: '',
          cProtect: false,
          cVisible: true,
          cAsync: false,
          cFilter: true,
          cPageLevel: this.PageLevel,
          cTabIndex: this.TabIndex,
          cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
          cStatic: false,
          cOption: [],
          cMasterUrl: '',
          cDisplayColumn: 'contact_id,name'
        },
        PI_charge_type: {
          cValidate: '',
          cName: 'charge_type',
          cId: 'rdbcharge_type',
          cRadioOptions: [{ text: 'Trip',value: 'T' }, { text: 'Unit',value: 'U' }],
          cRadioDefaultOption: '',
          cLabel:'Charge Type',
          cLabelSize: 4,
          cDefault: '',
          cOrder: 3,
          cProtect: false,
          cVisible: true,
          cPageLevel: this.PageLevel,
          cTabIndex: this.TabIndex,
          cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
        },
        PI_remarks: {
          cValidate: '',
          cName:'remarks',
          cLabel:'Remarks',
          cLabelSize: 4,
          cOrder:4,
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
          cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
        },
      //# End PI Header

      //# Model Detail
        // M_MK_CustomerRequestD: {
        //   fm_fleet_type_id: '',
        //   fm_fleet_type_idLabel: '',
        //   address_from: '',
        //   address_from_detail: '',
        //   address_to: '',
        //   address_to_detail: '',
        //   commodity: ''
        // },
      //# End Model Detail

      //# PI Detail
        // PI_fm_fleet_type_id: {
        //   dataLookUp: { 
        //     LookUpCd: 'GetLookupMKFleetType',
        //     ColumnDB: 'fm_fleet_type_id',
        //     InitialWhere: "",
        //     ParamWhere: "",
        //     SourceField: '',
        //     DisplayLookup: 'fleet_type_cd,descs'
        //   },
        //   cValidate: '',
        //   cName: 'fm_fleet_type_id',
        //   cLabel: 'Prospect',
        //   cKey: false,
        //   cLabelSize: 4,
        //   cOrder: 5,
        //   cTriggered: false,
        //   cDefault: '',
        //   cProtect: false,
        //   cVisible: true,
        //   cAsync: false,
        //   cFilter: true,
        //   cPageLevel: this.PageLevel,
        //   cTabIndex: this.TabIndex,
        //   cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
        //   cStatic: false,
        //   cOption: [],
        //   cMasterUrl: '',
        //   cDisplayColumn: 'fleet_type_cd,descs'
        // },
        // PI_address_from: {
        //   cValidate: '',
        //   cName: 'address_from',
        //   cLabel: 'Address From',
        //   cLabelSize: 4,
        //   cOrder: 6,
        //   cKey: false,
        //   cVisible: true,
        //   cProtect: false,
        //   cPageLevel: this.PageLevel,
        //   cTabIndex: this.TabIndex,
        //   cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
        // },
        // PI_address_from_detail: {
        //   cValidate: '',
        //   cName: 'address_from_detail',
        //   cLabel: 'Address From Detail',
        //   cLabelSize: 4,
        //   cOrder: 7,
        //   cKey: false,
        //   cType: 'text',
        //   cDecimal: 2,
        //   cVisible: true,
        //   cProtect: false,
        //   cPageLevel: this.PageLevel,
        //   cTabIndex: this.TabIndex,
        //   cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
        // },
        // PI_address_to: {
        //   cValidate: '',
        //   cName: 'address_to',
        //   cLabel: 'Address To',
        //   cLabelSize: 4,
        //   cOrder: 8,
        //   cKey: false,
        //   cVisible: true,
        //   cProtect: false,
        //   cPageLevel: this.PageLevel,
        //   cTabIndex: this.TabIndex,
        //   cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
        // },
        // PI_address_to_detail: {
        //   cValidate: '',
        //   cName: 'address_to_detail',
        //   cLabel: 'Address To Detail',
        //   cLabelSize: 4,
        //   cOrder: 9,
        //   cKey: false,
        //   cType: 'text',
        //   cDecimal: 2,
        //   cVisible: true,
        //   cProtect: false,
        //   cPageLevel: this.PageLevel,
        //   cTabIndex: this.TabIndex,
        //   cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
        // },
        // PI_commodity: {
        //   cValidate: '',
        //   cName: 'commodity',
        //   cLabel: 'Commodity',
        //   cLabelSize: 4,
        //   cOrder: 10,
        //   cKey: false,
        //   cType: 'decimal',
        //   cDecimal: 2,
        //   cVisible: true,
        //   cProtect: false,
        //   cPageLevel: this.PageLevel,
        //   cTabIndex: this.TabIndex,
        //   cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
        // }
      //# End PI Detail
      
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
        if (ress == null) {}
        else {
          var data = ress.Data[0]
          this.customer_request_running_code = data.mk_running_code_customer_request
        }
      })
    },
		setToolbarButton() {},
    M_Head_Table() {},
    M_PageSize(){},
    M_TabClick(){},
    M_Pagination(){},
    M_Advance_Filter(){},
    M_Search(data){},
    M_Refresh(){},
		M_Cancel() {},
		doDoubleClick(){},
    rowClicked (record,index) {},
    rowLink: function(url){},
		paramFromParent(){},	
		M_CheckboxChecked(data,status,index){},
    M_Post(dt){},
    M_Insert() {
      var param = {
        OptionFunctionCd: "GenerateRunningCodeById",
        ModuleCd: "CM",
        subportfolio_cd: this.getDataUser().subportfolio_cd,
        running_id: this.customer_request_running_code,
        user_input: this.getDataUser().user_id,
        date: this.getToday()
      }

      this.FnDynamicFunction(param)
      .then(ress => {
        if (ress == null) return

        var data = ress.Data[0]
        this.M_MK_CustomerRequestH.customer_request_no = data._generate_running_code_id
        
        var param1 = {
          _Method_: "SAVE",
          _LineNo_: this.$parent.data.page_order,
          customer_request_no: this.M_MK_CustomerRequestH.customer_request_no,
          subportfolio_cd: this.getDataUser().subportfolio_cd,
          date: !this.M_MK_CustomerRequestH.date || this.M_MK_CustomerRequestH.date == '' ? "NULL" : this.M_MK_CustomerRequestH.date,
          cm_contact_id: !this.M_MK_CustomerRequestH.cm_contact_id || this.M_MK_CustomerRequestH.cm_contact_id == '' ? "NULL" : this.M_MK_CustomerRequestH.cm_contact_id,
          charge_type: this.M_MK_CustomerRequestH.charge_type,
          remarks: this.M_MK_CustomerRequestH.remarks,
          user_input: this.getDataUser().user_id
        }

        var param2 = []

        for (let i = 0; i < this.DataProspect.length; i++) {
          param2.push({
            _Method_: "SAVE",
            _LineNo_: 1,
            mk_customer_request_h_id: '????????????????????????', //return API yg pertama
            fm_fleet_type_id: this.DataProspect[i].models['fm_fleet_type_id'],
            coordinate_address_from: this.DataProspect[i].models['address_from'],
            address_from_detail: this.DataProspect[i].models['address_from_detail'],
            coordinate_from: this.DataProspect[i].models['address_from_coord'],
            coordinate_address_to: this.DataProspect[i].models['address_to'],
            address_to_detail: this.DataProspect[i].models['address_to_detail'],
            coordinate_to: this.DataProspect[i].models['address_to_coord'],
            commodity: this.DataProspect[i].models['commodity'],
            user_input: this.getDataUser().user_id
          })
        }

        var data = [{
          A_Insert: param1,
          B_Looping: param2
        }]

        var param = {
          OptionSeq: this.getOptionSeq().OptionSeq,
          LineNo: this.$parent.data.page_order,
          Data: data
        }

        this.postJSONMulti(this.getUrlProsesDataPostMulti(), param)
        .then((response) => {
          if(response == null) return
          this.getToolbar().FormStatus = 'EDIT'
          this.getToolbar().ProcessPS()

          this.$parent.resultInsert(response.Message)
          this.M_ClearForm()
        })
      })
    },
    M_Update() {
      this.M_Insert()
    },
		M_ClearForm(){
      this.M_MK_CustomerRequestH = {
        customer_request_no: '',
        date: '',
        cm_contact_id: '',
        cm_contact_idLabel: '',
        charge_type: '',
        remarks: ''
      }

      this.DataProspect = []
    },
    M_New(){},
    M_Edit(){},
    M_Delete(dt){},
    getDataBy() {},
    OndateChange(data) {
      this.M_MK_CustomerRequestH.date = data
    },
    Oncm_contact_idChange(data) {
      this.M_MK_CustomerRequestH.cm_contact_id = data.id
      this.M_MK_CustomerRequestH.cm_contact_idLabel = data.label
    },
    Oncharge_typeChange(data) {},
    OnLookupChange(data, index, name) {
      this.DataProspect[index].models[name] = data.id
      this.DataProspect[index].models[name+'Label'] = data.label
    },
    OnMapsChange(data, index, name) {
      this.DataProspect[index].models[name+'_coord'] = data.coord
    },
    addProspect() {
      var numb = Math.floor(Math.random() * 100)
      this.iCount++

      const PI_fm_fleet_type_id = {
        dataLookUp: { 
          LookUpCd: 'GetLookupMKFleetType',
          ColumnDB: 'fleet_type_cd',
          InitialWhere: "",
          ParamWhere: "",
          SourceField: '',
          DisplayLookup: 'fleet_type_cd,descs'
        },
        cValidate: '',
        cName: 'fm_fleet_type_id' + numb,
        cLabel: 'Fleet Type',
        cKey: false,
        cLabelSize: 4,
        cOrder: 5,
        cTriggered: false,
        cDefault: '',
        cProtect: false,
        cVisible: true,
        cAsync: false,
        cFilter: true,
        cPageLevel: this.PageLevel,
        cTabIndex: this.TabIndex,
        cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
        cStatic: false,
        cOption: [],
        cMasterUrl: '',
        cDisplayColumn: 'fleet_type_cd,descs'
      },
      PI_address_from = {
        cValidate: '',
        cName: 'address_from' + numb,
        cLabel: 'Address From',
        cLabelSize: 4,
        cOrder: 6,
        cKey: false,
        cVisible: true,
        cProtect: false,
        cPageLevel: this.PageLevel,
        cTabIndex: this.TabIndex,
        cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
      },
      PI_address_from_detail = {
        cValidate: '',
        cName: 'address_from_detail' + numb,
        cLabel: 'Address From Detail',
        cLabelSize: 4,
        cOrder: 8,
        cDefault: '',
        cProtect: false,
        cVisible: true,
        cResize: false,
        cReadOnly: false,
        cRows: 3,
        cMaxRows: 10,
        cSize: 'md',
        cPageLevel: this.PageLevel,
        cTabIndex: this.TabIndex,
        cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
      },
      PI_address_to = {
        cValidate: '',
        cName: 'address_to' + numb,
        cLabel: 'Address To',
        cLabelSize: 4,
        cOrder: 8,
        cKey: false,
        cVisible: true,
        cProtect: false,
        cPageLevel: this.PageLevel,
        cTabIndex: this.TabIndex,
        cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
      },
      PI_address_to_detail = {
        cValidate: '',
        cName: 'address_to_detail' + numb,
        cLabel: 'Address To Detail',
        cLabelSize: 4,
        cOrder: 9,
        cDefault: '',
        cProtect: false,
        cVisible: true,
        cResize: false,
        cReadOnly: false,
        cRows: 3,
        cMaxRows: 10,
        cSize: 'md',
        cPageLevel: this.PageLevel,
        cTabIndex: this.TabIndex,
        cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
      },
      PI_commodity = {
        cValidate: '',
        cName: 'commodity' + numb,
        cLabel: 'Commodity',
        cLabelSize: 4,
        cOrder: 10,
        cDefault: '',
        cProtect: false,
        cVisible: true,
        cResize: false,
        cReadOnly: false,
        cRows: 3,
        cMaxRows: 10,
        cSize: 'md',
        cPageLevel: this.PageLevel,
        cTabIndex: this.TabIndex,
        cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
      }

      this.DataProspect.push({
        iCount: this.iCount,
        randomNumb: numb,
        props: {
          PI_fm_fleet_type_id: PI_fm_fleet_type_id,
          PI_address_from: PI_address_from,
          PI_address_from_detail: PI_address_from_detail,
          PI_address_to: PI_address_to,
          PI_address_to_detail: PI_address_to_detail,
          PI_commodity: PI_commodity
        },
        models: {
          fm_fleet_type_id: '',
          fm_fleet_type_idLabel: '',
          address_from: '',
          address_from_detail: '',
          address_from_coord: '',
          address_to: '',
          address_to_detail: '',
          address_to_coord: '',
          commodity: ''
        },
        refs: {
          fm_fleet_type_id: 'ref_fm_fleet_type_id',
          fm_fleet_type_idLabel: 'ref_fm_fleet_type_idLabel',
          address_from: 'ref_address_from',
          address_from_detail: 'ref_address_from_detail',
          address_to: 'ref_address_to',
          address_to_detail: 'ref_address_to_detail',
          commodity: 'ref_commodity'
        }
      })

      // this.maxComponent = this.maxComponent + 5 + this.iCount
    },
    removeProspect(index) {
      this.DataProspect.splice(index, 1)
    }
  },
  beforeCreate: function() {
  },
  created: function() {
    this.$store.commit('setStatus','new')
  },
  beforeMount: function() {
  },
  mounted: function() {
    this.$store.commit('setFormType','Form')
    this.getToolbar().ProcessPS()
    this.hideSideBarMenu()
    this.getToolbar().doEdit(true)
    this.GetMKSpecification()
    // this.getDataBy()
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

