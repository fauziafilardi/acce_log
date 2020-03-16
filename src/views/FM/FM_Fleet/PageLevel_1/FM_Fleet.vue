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
                                      <ABSinputTextVuex :prop="PI_fleet_id" v-model="M_FM_Fleet.fleet_id"  ref="ref_fleet_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_fleet_no" v-model="M_FM_Fleet.fleet_no"  ref="ref_fleet_no"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Onfm_fleet_type_idChange" :prop="PI_fm_fleet_type_id" :value="M_FM_Fleet.fm_fleet_type_id" :label="M_FM_Fleet.fm_fleet_type_idLabel" ref="ref_fm_fleet_type_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_descs" v-model="M_FM_Fleet.descs"  ref="ref_descs"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Onfm_fleet_brand_idChange" :prop="PI_fm_fleet_brand_id" :value="M_FM_Fleet.fm_fleet_brand_id" :label="M_FM_Fleet.fm_fleet_brand_idLabel" ref="ref_fm_fleet_brand_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_fleet_colour" v-model="M_FM_Fleet.fleet_colour"  ref="ref_fleet_colour"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_chasis_no" v-model="M_FM_Fleet.chasis_no"  ref="ref_chasis_no"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_construction_year" v-model="M_FM_Fleet.construction_year"  ref="ref_construction_year"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_engine_no" v-model="M_FM_Fleet.engine_no"  ref="ref_engine_no"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_constuction_month" v-model="M_FM_Fleet.constuction_month"  ref="ref_constuction_month"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_service_book_no" v-model="M_FM_Fleet.service_book_no"  ref="ref_service_book_no"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputDateVuex @input="Onstart_warranty_dateChange" :prop="PI_start_warranty_date" v-model="M_FM_Fleet.start_warranty_date"  ref="ref_start_warranty_date" />
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputDateVuex @input="Onend_warranty_dateChange" :prop="PI_end_warranty_date" v-model="M_FM_Fleet.end_warranty_date"  ref="ref_end_warranty_date" />
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Oncm_staff_id_1Change" :prop="PI_cm_staff_id_1" :value="M_FM_Fleet.cm_staff_id_1" :label="M_FM_Fleet.cm_staff_id_1Label" ref="ref_cm_staff_id_1"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Oncm_staff_id_2Change" :prop="PI_cm_staff_id_2" :value="M_FM_Fleet.cm_staff_id_2" :label="M_FM_Fleet.cm_staff_id_2Label" ref="ref_cm_staff_id_2"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Oncm_staff_id_coChange" :prop="PI_cm_staff_id_co" :value="M_FM_Fleet.cm_staff_id_co" :label="M_FM_Fleet.cm_staff_id_coLabel" ref="ref_cm_staff_id_co"/>
                                    </b-col>
                                  </b-row>
                                </b-col>
                                <b-col md="6" id="col-right">
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Onfm_fleet_status_idChange" :prop="PI_fm_fleet_status_id" :value="M_FM_Fleet.fm_fleet_status_id" :label="M_FM_Fleet.fm_fleet_status_idLabel" ref="ref_fm_fleet_status_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_height" v-model="M_FM_Fleet.height"  ref="ref_height"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_width" v-model="M_FM_Fleet.width"  ref="ref_width"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_matric_uom" v-model="M_FM_Fleet.matric_uom"  ref="ref_matric_uom"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_depth" v-model="M_FM_Fleet.depth"  ref="ref_depth"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_volume" v-model="M_FM_Fleet.volume"  ref="ref_volume"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_weigth" v-model="M_FM_Fleet.weigth"  ref="ref_weigth"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_cm_uom_id" v-model="M_FM_Fleet.cm_uom_id"  ref="ref_cm_uom_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Onfm_fuel_idChange" :prop="PI_fm_fuel_id" :value="M_FM_Fleet.fm_fuel_id" :label="M_FM_Fleet.fm_fuel_idLabel" ref="ref_fm_fuel_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_fuel_qty" v-model="M_FM_Fleet.fuel_qty"  ref="ref_fuel_qty"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_last_km" v-model="M_FM_Fleet.last_km"  ref="ref_last_km"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Onfm_pool_idChange" :prop="PI_fm_pool_id" :value="M_FM_Fleet.fm_pool_id" :label="M_FM_Fleet.fm_pool_idLabel" ref="ref_fm_pool_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Oncm_contact_idChange" :prop="PI_cm_contact_id" :value="M_FM_Fleet.cm_contact_id" :label="M_FM_Fleet.cm_contact_idLabel" ref="ref_cm_contact_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputDateVuex @input="Onleasing_start_dateChange" :prop="PI_leasing_start_date" v-model="M_FM_Fleet.leasing_start_date"  ref="ref_leasing_start_date" />
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputDateVuex @input="Onleasing_end_dateChange" :prop="PI_leasing_end_date" v-model="M_FM_Fleet.leasing_end_date"  ref="ref_leasing_end_date" />
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
		Module:"FM",
            propList: {
                initialWhere: "",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
            running_fleet_id: null,
       
            IEBy: {Input: '', Edit: ''},   			
            M_FM_Fleet: {
              fm_fleet_id: 0,
              subportfolio_cd: '',
              fleet_id: '',
              fleet_no: '',
              fm_fleet_type_id: 0,
              fm_fleet_type_id_cd: '',
              fm_fleet_type_id_descs: '',
              descs: '',
              fm_fleet_brand_id: 0,
              fm_fleet_brand_id_cd: '',
              fm_fleet_brand_id_descs: '',
              fleet_colour: '',
              chasis_no: '',
              construction_year: 0,
              engine_no: '',
              constuction_month: 0,
              service_book_no: '',
              start_warranty_date: '',
              end_warranty_date: '',
              cm_staff_id_1: 0,
              cm_staff_id_1_cd: '',
              cm_staff_id_1_descs: '',
              cm_staff_id_2: 0,
              cm_staff_id_2_cd: '',
              cm_staff_id_2_descs: '',
              cm_staff_id_co: 0,
              cm_staff_id_co_cd: '',
              cm_staff_id_co_descs: '',
              fm_fleet_status_id: 0,
              fm_fleet_status_id_cd: '',
              fm_fleet_status_id_descs: '',
              height: 0.00,
              width: 0.00,
              matric_uom: '',
              depth: 0.00,
              volume: 0.00,
              weigth: 0.00,
              cm_uom_id: 0,
              fm_fuel_id: 0,
              fm_fuel_id_cd: '',
              fm_fuel_id_descs: '',
              fuel_qty: 0.00,
              last_km: 0.00,
              fm_pool_id: 0,
              fm_pool_id_cd: '',
              fm_pool_id_descs: '',
              cm_contact_id: 0,
              cm_contact_id_cd: '',
              cm_contact_id_descs: '',
              leasing_start_date: '',
              leasing_end_date: '',
              row_id: 0,
              lastupdatestamp: 0,
              time_edit: '',
              user_input: '',
              user_edit: '',
            },
            PI_fleet_id: { 
                cValidate :'required|max:20', 
                cName: 'fleet_id', 
                cLabel: 'Fleet Id', 
                cLabelSize: 4, 
                cOrder: 1, 
                cKey: true, 
                cType: 'text',
                cVisible: true, 
                cDefault: '', 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_fleet_no: { 
                cValidate :'required|max:20', 
                cName: 'fleet_no', 
                cLabel: 'License Plate', 
                cLabelSize: 4, 
                cOrder: 2, 
                cKey: true, 
                cType: 'text',
                cVisible: true, 
                cDefault: '', 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_fm_fleet_type_id: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupMKFleetType'    , 
                    ColumnDB: 'fleet_type_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'fleet_type_cd,descs' 
                        }, 
                cValidate :'', 
                cName: 'fm_fleet_type_id', 
                cLabel: 'Fleet Type', 
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
                cDisplayColumn: 'fleet_type_cd,descs' ,
            }, 

            PI_descs: { 
                cValidate :'max:150', 
                cName: 'descs', 
                cLabel: 'Description', 
                cLabelSize: 4, 
                cOrder: 4, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cDefault: '', 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_fm_fleet_brand_id: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupFMBrandMaster'    , 
                    ColumnDB: 'brand_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'brand_cd,descs' 
                        }, 
                cValidate :'', 
                cName: 'fm_fleet_brand_id', 
                cLabel: 'Fleet Brand', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 5, 
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
                cMasterUrl: 'FM/FM_BrandMaster' ,
                cDisplayColumn: 'brand_cd,descs' ,
            }, 

            PI_fleet_colour: { 
                cValidate :'max:20', 
                cName: 'fleet_colour', 
                cLabel: 'Fleet Colour', 
                cLabelSize: 4, 
                cOrder: 6, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cDefault: '', 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_chasis_no: { 
                cValidate :'max:20', 
                cName: 'chasis_no', 
                cLabel: 'Chassis No', 
                cLabelSize: 4, 
                cOrder: 7, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cDefault: '', 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_construction_year: { 
                cValidate :'', 
                cName: 'construction_year', 
                cLabel: 'Construction Year', 
                cLabelSize: 4, 
                cOrder: 8, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cDefault: '', 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_engine_no: { 
                cValidate :'max:20', 
                cName: 'engine_no', 
                cLabel: 'Engine No', 
                cLabelSize: 4, 
                cOrder: 9, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cDefault: '', 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_constuction_month: { 
                cValidate :'', 
                cName: 'constuction_month', 
                cLabel: 'Construction Month', 
                cLabelSize: 4, 
                cOrder: 10, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cDefault: '', 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_service_book_no: { 
                cValidate :'max:20', 
                cName: 'service_book_no', 
                cLabel: 'Service Book No', 
                cLabelSize: 4, 
                cOrder: 11, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cDefault: '', 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_start_warranty_date: { 
                cValidate :'', 
                cName: 'start_warranty_date', 
                cLabel: 'Start Warranty Date', 
                cLabelSize: 4, 
                cOrder: 12, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_end_warranty_date: { 
                cValidate :'', 
                cName: 'end_warranty_date', 
                cLabel: 'End Warranty Date', 
                cLabelSize: 4, 
                cOrder: 13, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_cm_staff_id_1: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupFMStaffMaster'    , 
                    ColumnDB: 'staff_no'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'staff_no,name' 
                        }, 
                cValidate :'', 
                cName: 'cm_staff_id_1', 
                cLabel: 'Driver I', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 26, 
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
                cDisplayColumn: 'staff_no,name' ,
            }, 

            PI_cm_staff_id_2: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupFMStaffMaster'    , 
                    ColumnDB: 'staff_no'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'staff_no,name' 
                        }, 
                cValidate :'', 
                cName: 'cm_staff_id_2', 
                cLabel: 'Driver 2', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 27, 
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
                cDisplayColumn: 'staff_no,name' ,
            }, 

            PI_cm_staff_id_co: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupFMStaffMaster'    , 
                    ColumnDB: 'staff_no'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'staff_no,name' 
                        }, 
                cValidate :'', 
                cName: 'cm_staff_id_co', 
                cLabel: 'CO Driver', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 28, 
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
                cDisplayColumn: 'staff_no,name' ,
            }, 

            PI_fm_fleet_status_id: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupFMFleetStatus'    , 
                    ColumnDB: 'status_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'status_cd,descs' 
                        }, 
                cValidate :'', 
                cName: 'fm_fleet_status_id', 
                cLabel: 'Fleet Status', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 14, 
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
                cMasterUrl: 'FM/FM_FleetStatus' ,
                cDisplayColumn: 'status_cd,descs' ,
            }, 

            PI_height: { 
                cValidate :'', 
                cName: 'height', 
                cLabel: 'Height', 
                cLabelSize: 4, 
                cOrder: 15, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cDefault: '', 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_width: { 
                cValidate :'', 
                cName: 'width', 
                cLabel: 'Width', 
                cLabelSize: 4, 
                cOrder: 16, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cDefault: '', 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_matric_uom: { 
                cValidate :'max:20', 
                cName: 'matric_uom', 
                cLabel: 'Matric UOM', 
                cLabelSize: 4, 
                cOrder: 17, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cDefault: '', 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_depth: { 
                cValidate :'', 
                cName: 'depth', 
                cLabel: 'Depth', 
                cLabelSize: 4, 
                cOrder: 18, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cDefault: '', 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_volume: { 
                cValidate :'', 
                cName: 'volume', 
                cLabel: 'Volume', 
                cLabelSize: 4, 
                cOrder: 19, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cDefault: '', 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_weigth: { 
                cValidate :'', 
                cName: 'weigth', 
                cLabel: 'Weigth', 
                cLabelSize: 4, 
                cOrder: 20, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cDefault: '', 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_cm_uom_id: { 
                cValidate :'', 
                cName: 'cm_uom_id', 
                cLabel: 'Weight UOM', 
                cLabelSize: 4, 
                cOrder: 21, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cDefault: '', 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_fm_fuel_id: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupFMFuel'    , 
                    ColumnDB: 'fuel_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'fuel_cd,descs' 
                        }, 
                cValidate :'', 
                cName: 'fm_fuel_id', 
                cLabel: 'Fuel', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 22, 
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
                cMasterUrl: 'FM/FM_Fuel' ,
                cDisplayColumn: 'fuel_cd,descs' ,
            }, 

            PI_fuel_qty: { 
                cValidate :'', 
                cName: 'fuel_qty', 
                cLabel: 'Fuel Qty', 
                cLabelSize: 4, 
                cOrder: 23, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cDefault: '', 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_last_km: { 
                cValidate :'', 
                cName: 'last_km', 
                cLabel: 'Last KM', 
                cLabelSize: 4, 
                cOrder: 24, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cDefault: '', 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_fm_pool_id: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupFMPool'    , 
                    ColumnDB: 'pool_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'pool_cd,descs' 
                        }, 
                cValidate :'', 
                cName: 'fm_pool_id', 
                cLabel: 'Pool Name', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 25, 
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
                cMasterUrl: 'FM/FM_Pool' ,
                cDisplayColumn: 'pool_cd,descs' ,
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
                cValidate :'', 
                cName: 'cm_contact_id', 
                cLabel: 'Leasing Contact Id', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 29, 
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

            PI_leasing_start_date: { 
                cValidate :'', 
                cName: 'leasing_start_date', 
                cLabel: 'Leasing Start Date', 
                cLabelSize: 4, 
                cOrder: 30, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_leasing_end_date: { 
                cValidate :'', 
                cName: 'leasing_end_date', 
                cLabel: 'Leasing End Date', 
                cLabelSize: 4, 
                cOrder: 31, 
                cKey: false, 
                cVisible:  true, 
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
        GetFMSpecification () {
          var param = {
            subportfolio_cd: this.getDataUser().subportfolio_cd,
            module_cd: this.Module
          }

          this.FnDynamicSpec(param)
          .then(ress => {
            if (ress == null) {
              this.PI_fleet_id.cProtect = false
              this.M_FM_Fleet.fleet_id= ""
              this.$refs.ref_fleet_id.focus()
            }
            else {
              var data = ress.Data[0]
              this.running_fleet_id = data.running_fleet_id
              if (this.running_fleet_id && this.running_fleet_id !== "" && this.running_fleet_id > 0) {
                this.PI_fleet_id.cProtect = true
                this.M_FM_Fleet.fleet_id= "(auto)"
              }
            }
          })
        },
        Onfm_fleet_type_idChange (data) {
          this.$nextTick(() => {
            this.M_FM_Fleet.fm_fleet_type_id = data.id
            this.M_FM_Fleet.fm_fleet_type_idLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{fm_fleet_type_id}
            }
          })
          this.$forceUpdate()
        },
        Onfm_fleet_brand_idChange (data) {
          this.$nextTick(() => {
            this.M_FM_Fleet.fm_fleet_brand_id = data.id
            this.M_FM_Fleet.fm_fleet_brand_idLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{fm_fleet_brand_id}
            }
          })
          this.$forceUpdate()
        },
        Onstart_warranty_dateChange (data) {
          this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              //{start_warranty_date}
            }
          })
          this.$forceUpdate()
        },
        Onend_warranty_dateChange (data) {
          this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              //{end_warranty_date}
            }
          })
          this.$forceUpdate()
        },
        Oncm_staff_id_1Change (data) {
          this.$nextTick(() => {
            this.M_FM_Fleet.cm_staff_id_1 = data.id
            this.M_FM_Fleet.cm_staff_id_1Label = data.label
            if (this.inputStatus != "VIEW") {
              //{cm_staff_id_1}
            }
          })
          this.$forceUpdate()
        },
        Oncm_staff_id_2Change (data) {
          this.$nextTick(() => {
            this.M_FM_Fleet.cm_staff_id_2 = data.id
            this.M_FM_Fleet.cm_staff_id_2Label = data.label
            if (this.inputStatus != "VIEW") {
              //{cm_staff_id_2}
            }
          })
          this.$forceUpdate()
        },
        Oncm_staff_id_coChange (data) {
          this.$nextTick(() => {
            this.M_FM_Fleet.cm_staff_id_co = data.id
            this.M_FM_Fleet.cm_staff_id_coLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{cm_staff_id_co}
            }
          })
          this.$forceUpdate()
        },
        Onfm_fleet_status_idChange (data) {
          this.$nextTick(() => {
            this.M_FM_Fleet.fm_fleet_status_id = data.id
            this.M_FM_Fleet.fm_fleet_status_idLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{fm_fleet_status_id}
            }
          })
          this.$forceUpdate()
        },
        Onfm_fuel_idChange (data) {
          this.$nextTick(() => {
            this.M_FM_Fleet.fm_fuel_id = data.id
            this.M_FM_Fleet.fm_fuel_idLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{fm_fuel_id}
            }
          })
          this.$forceUpdate()
        },
        Onfm_pool_idChange (data) {
          this.$nextTick(() => {
            this.M_FM_Fleet.fm_pool_id = data.id
            this.M_FM_Fleet.fm_pool_idLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{fm_pool_id}
            }
          })
          this.$forceUpdate()
        },
        Oncm_contact_idChange (data) {
          this.$nextTick(() => {
            this.M_FM_Fleet.cm_contact_id = data.id
            this.M_FM_Fleet.cm_contact_idLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{cm_contact_id}
            }
          })
          this.$forceUpdate()
        },
        Onleasing_start_dateChange (data) {
          this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              //{leasing_start_date}
            }
          })
          this.$forceUpdate()
        },
        Onleasing_end_dateChange (data) {
          this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              //{leasing_end_date}
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
          if (this.running_fleet_id && this.running_fleet_id != "" && this.running_fleet_id > 0) {
            var param = {
              OptionFunctionCd: "GenerateRunningCodeById",
              ModuleCd: "CM",
              subportfolio_cd: this.getDataUser().subportfolio_cd,
              running_id: this.running_fleet_id,
              user_input: this.getDataUser().user_id,
              date: this.getToday()
            }

            this.FnDynamicFunction(param)
            .then(ress => {
              if (ress == null) return

              var data = ress.Data[0]
              this.M_FM_Fleet.fleet_id = data._generate_running_code_id

                          var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                fleet_id: this.M_FM_Fleet.fleet_id,
                fleet_no: this.M_FM_Fleet.fleet_no,
                fm_fleet_type_id: this.M_FM_Fleet.fm_fleet_type_id == '' || this.M_FM_Fleet.fm_fleet_type_id == null ? 'NULL' : this.M_FM_Fleet.fm_fleet_type_id,
                descs: this.M_FM_Fleet.descs,
                fm_fleet_brand_id: this.M_FM_Fleet.fm_fleet_brand_id == '' || this.M_FM_Fleet.fm_fleet_brand_id == null ? 'NULL' : this.M_FM_Fleet.fm_fleet_brand_id,
                fleet_colour: this.M_FM_Fleet.fleet_colour,
                fm_pool_id: this.M_FM_Fleet.fm_pool_id == '' || this.M_FM_Fleet.fm_pool_id == null ? 'NULL' : this.M_FM_Fleet.fm_pool_id,
                fm_fuel_id: this.M_FM_Fleet.fm_fuel_id == '' || this.M_FM_Fleet.fm_fuel_id == null ? 'NULL' : this.M_FM_Fleet.fm_fuel_id,
                fuel_qty: parseFloat(this.M_FM_Fleet.fuel_qty ? this.replaceAllString(this.M_FM_Fleet.fuel_qty, ',', '', 'number') : 0),
                last_km: parseFloat(this.M_FM_Fleet.last_km ? this.replaceAllString(this.M_FM_Fleet.last_km, ',', '', 'number') : 0),
                cm_staff_id_1: this.M_FM_Fleet.cm_staff_id_1 == '' || this.M_FM_Fleet.cm_staff_id_1 == null ? 'NULL' : this.M_FM_Fleet.cm_staff_id_1,
                cm_staff_id_2: this.M_FM_Fleet.cm_staff_id_2 == '' || this.M_FM_Fleet.cm_staff_id_2 == null ? 'NULL' : this.M_FM_Fleet.cm_staff_id_2,
                cm_staff_id_co: this.M_FM_Fleet.cm_staff_id_co == '' || this.M_FM_Fleet.cm_staff_id_co == null ? 'NULL' : this.M_FM_Fleet.cm_staff_id_co,
                cm_contact_id: this.M_FM_Fleet.cm_contact_id == '' || this.M_FM_Fleet.cm_contact_id == null ? 'NULL' : this.M_FM_Fleet.cm_contact_id,
                leasing_start_date: this.M_FM_Fleet.leasing_start_date == '' || this.M_FM_Fleet.leasing_start_date == null ? 'NULL' : this.M_FM_Fleet.leasing_start_date,
                leasing_end_date: this.M_FM_Fleet.leasing_end_date == '' || this.M_FM_Fleet.leasing_end_date == null ? 'NULL' : this.M_FM_Fleet.leasing_end_date,
                height: parseFloat(this.M_FM_Fleet.height ? this.replaceAllString(this.M_FM_Fleet.height, ',', '', 'number') : 0),
                width: parseFloat(this.M_FM_Fleet.width ? this.replaceAllString(this.M_FM_Fleet.width, ',', '', 'number') : 0),
                matric_uom: this.M_FM_Fleet.matric_uom,
                depth: parseFloat(this.M_FM_Fleet.depth ? this.replaceAllString(this.M_FM_Fleet.depth, ',', '', 'number') : 0),
                volume: parseFloat(this.M_FM_Fleet.volume ? this.replaceAllString(this.M_FM_Fleet.volume, ',', '', 'number') : 0),
                weigth: parseFloat(this.M_FM_Fleet.weigth ? this.replaceAllString(this.M_FM_Fleet.weigth, ',', '', 'number') : 0),
                cm_uom_id: parseFloat(this.M_FM_Fleet.cm_uom_id ? this.replaceAllString(this.M_FM_Fleet.cm_uom_id, ',', '', 'number') : 0),
                fm_fleet_status_id: this.M_FM_Fleet.fm_fleet_status_id == '' || this.M_FM_Fleet.fm_fleet_status_id == null ? 'NULL' : this.M_FM_Fleet.fm_fleet_status_id,
                chasis_no: this.M_FM_Fleet.chasis_no,
                construction_year: parseFloat(this.M_FM_Fleet.construction_year ? this.replaceAllString(this.M_FM_Fleet.construction_year, ',', '', 'number') : 0),
                start_warranty_date: this.M_FM_Fleet.start_warranty_date == '' || this.M_FM_Fleet.start_warranty_date == null ? 'NULL' : this.M_FM_Fleet.start_warranty_date,
                end_warranty_date: this.M_FM_Fleet.end_warranty_date == '' || this.M_FM_Fleet.end_warranty_date == null ? 'NULL' : this.M_FM_Fleet.end_warranty_date,
                engine_no: this.M_FM_Fleet.engine_no,
                constuction_month: parseFloat(this.M_FM_Fleet.constuction_month ? this.replaceAllString(this.M_FM_Fleet.constuction_month, ',', '', 'number') : 0),
                service_book_no: this.M_FM_Fleet.service_book_no,
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
                fleet_id: this.M_FM_Fleet.fleet_id,
                fleet_no: this.M_FM_Fleet.fleet_no,
                fm_fleet_type_id: this.M_FM_Fleet.fm_fleet_type_id == '' || this.M_FM_Fleet.fm_fleet_type_id == null ? 'NULL' : this.M_FM_Fleet.fm_fleet_type_id,
                descs: this.M_FM_Fleet.descs,
                fm_fleet_brand_id: this.M_FM_Fleet.fm_fleet_brand_id == '' || this.M_FM_Fleet.fm_fleet_brand_id == null ? 'NULL' : this.M_FM_Fleet.fm_fleet_brand_id,
                fleet_colour: this.M_FM_Fleet.fleet_colour,
                fm_pool_id: this.M_FM_Fleet.fm_pool_id == '' || this.M_FM_Fleet.fm_pool_id == null ? 'NULL' : this.M_FM_Fleet.fm_pool_id,
                fm_fuel_id: this.M_FM_Fleet.fm_fuel_id == '' || this.M_FM_Fleet.fm_fuel_id == null ? 'NULL' : this.M_FM_Fleet.fm_fuel_id,
                fuel_qty: parseFloat(this.M_FM_Fleet.fuel_qty ? this.replaceAllString(this.M_FM_Fleet.fuel_qty, ',', '', 'number') : 0),
                last_km: parseFloat(this.M_FM_Fleet.last_km ? this.replaceAllString(this.M_FM_Fleet.last_km, ',', '', 'number') : 0),
                cm_staff_id_1: this.M_FM_Fleet.cm_staff_id_1 == '' || this.M_FM_Fleet.cm_staff_id_1 == null ? 'NULL' : this.M_FM_Fleet.cm_staff_id_1,
                cm_staff_id_2: this.M_FM_Fleet.cm_staff_id_2 == '' || this.M_FM_Fleet.cm_staff_id_2 == null ? 'NULL' : this.M_FM_Fleet.cm_staff_id_2,
                cm_staff_id_co: this.M_FM_Fleet.cm_staff_id_co == '' || this.M_FM_Fleet.cm_staff_id_co == null ? 'NULL' : this.M_FM_Fleet.cm_staff_id_co,
                cm_contact_id: this.M_FM_Fleet.cm_contact_id == '' || this.M_FM_Fleet.cm_contact_id == null ? 'NULL' : this.M_FM_Fleet.cm_contact_id,
                leasing_start_date: this.M_FM_Fleet.leasing_start_date == '' || this.M_FM_Fleet.leasing_start_date == null ? 'NULL' : this.M_FM_Fleet.leasing_start_date,
                leasing_end_date: this.M_FM_Fleet.leasing_end_date == '' || this.M_FM_Fleet.leasing_end_date == null ? 'NULL' : this.M_FM_Fleet.leasing_end_date,
                height: parseFloat(this.M_FM_Fleet.height ? this.replaceAllString(this.M_FM_Fleet.height, ',', '', 'number') : 0),
                width: parseFloat(this.M_FM_Fleet.width ? this.replaceAllString(this.M_FM_Fleet.width, ',', '', 'number') : 0),
                matric_uom: this.M_FM_Fleet.matric_uom,
                depth: parseFloat(this.M_FM_Fleet.depth ? this.replaceAllString(this.M_FM_Fleet.depth, ',', '', 'number') : 0),
                volume: parseFloat(this.M_FM_Fleet.volume ? this.replaceAllString(this.M_FM_Fleet.volume, ',', '', 'number') : 0),
                weigth: parseFloat(this.M_FM_Fleet.weigth ? this.replaceAllString(this.M_FM_Fleet.weigth, ',', '', 'number') : 0),
                cm_uom_id: parseFloat(this.M_FM_Fleet.cm_uom_id ? this.replaceAllString(this.M_FM_Fleet.cm_uom_id, ',', '', 'number') : 0),
                fm_fleet_status_id: this.M_FM_Fleet.fm_fleet_status_id == '' || this.M_FM_Fleet.fm_fleet_status_id == null ? 'NULL' : this.M_FM_Fleet.fm_fleet_status_id,
                chasis_no: this.M_FM_Fleet.chasis_no,
                construction_year: parseFloat(this.M_FM_Fleet.construction_year ? this.replaceAllString(this.M_FM_Fleet.construction_year, ',', '', 'number') : 0),
                start_warranty_date: this.M_FM_Fleet.start_warranty_date == '' || this.M_FM_Fleet.start_warranty_date == null ? 'NULL' : this.M_FM_Fleet.start_warranty_date,
                end_warranty_date: this.M_FM_Fleet.end_warranty_date == '' || this.M_FM_Fleet.end_warranty_date == null ? 'NULL' : this.M_FM_Fleet.end_warranty_date,
                engine_no: this.M_FM_Fleet.engine_no,
                constuction_month: parseFloat(this.M_FM_Fleet.constuction_month ? this.replaceAllString(this.M_FM_Fleet.constuction_month, ',', '', 'number') : 0),
                service_book_no: this.M_FM_Fleet.service_book_no,
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
                fm_fleet_id: this.M_FM_Fleet.fm_fleet_id,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                fleet_id: this.M_FM_Fleet.fleet_id,
                fleet_no: this.M_FM_Fleet.fleet_no,
                fm_fleet_type_id: this.M_FM_Fleet.fm_fleet_type_id == '' || this.M_FM_Fleet.fm_fleet_type_id == null ? 'NULL' : this.M_FM_Fleet.fm_fleet_type_id,
                descs: this.M_FM_Fleet.descs,
                fm_fleet_brand_id: this.M_FM_Fleet.fm_fleet_brand_id == '' || this.M_FM_Fleet.fm_fleet_brand_id == null ? 'NULL' : this.M_FM_Fleet.fm_fleet_brand_id,
                fleet_colour: this.M_FM_Fleet.fleet_colour,
                fm_pool_id: this.M_FM_Fleet.fm_pool_id == '' || this.M_FM_Fleet.fm_pool_id == null ? 'NULL' : this.M_FM_Fleet.fm_pool_id,
                fm_fuel_id: this.M_FM_Fleet.fm_fuel_id == '' || this.M_FM_Fleet.fm_fuel_id == null ? 'NULL' : this.M_FM_Fleet.fm_fuel_id,
                fuel_qty: parseFloat(this.M_FM_Fleet.fuel_qty ? this.replaceAllString(this.M_FM_Fleet.fuel_qty, ',', '', 'number') : 0),
                last_km: parseFloat(this.M_FM_Fleet.last_km ? this.replaceAllString(this.M_FM_Fleet.last_km, ',', '', 'number') : 0),
                cm_staff_id_1: this.M_FM_Fleet.cm_staff_id_1 == '' || this.M_FM_Fleet.cm_staff_id_1 == null ? 'NULL' : this.M_FM_Fleet.cm_staff_id_1,
                cm_staff_id_2: this.M_FM_Fleet.cm_staff_id_2 == '' || this.M_FM_Fleet.cm_staff_id_2 == null ? 'NULL' : this.M_FM_Fleet.cm_staff_id_2,
                cm_staff_id_co: this.M_FM_Fleet.cm_staff_id_co == '' || this.M_FM_Fleet.cm_staff_id_co == null ? 'NULL' : this.M_FM_Fleet.cm_staff_id_co,
                cm_contact_id: this.M_FM_Fleet.cm_contact_id == '' || this.M_FM_Fleet.cm_contact_id == null ? 'NULL' : this.M_FM_Fleet.cm_contact_id,
                leasing_start_date: this.M_FM_Fleet.leasing_start_date == '' || this.M_FM_Fleet.leasing_start_date == null ? 'NULL' : this.M_FM_Fleet.leasing_start_date,
                leasing_end_date: this.M_FM_Fleet.leasing_end_date == '' || this.M_FM_Fleet.leasing_end_date == null ? 'NULL' : this.M_FM_Fleet.leasing_end_date,
                height: parseFloat(this.M_FM_Fleet.height ? this.replaceAllString(this.M_FM_Fleet.height, ',', '', 'number') : 0),
                width: parseFloat(this.M_FM_Fleet.width ? this.replaceAllString(this.M_FM_Fleet.width, ',', '', 'number') : 0),
                matric_uom: this.M_FM_Fleet.matric_uom,
                depth: parseFloat(this.M_FM_Fleet.depth ? this.replaceAllString(this.M_FM_Fleet.depth, ',', '', 'number') : 0),
                volume: parseFloat(this.M_FM_Fleet.volume ? this.replaceAllString(this.M_FM_Fleet.volume, ',', '', 'number') : 0),
                weigth: parseFloat(this.M_FM_Fleet.weigth ? this.replaceAllString(this.M_FM_Fleet.weigth, ',', '', 'number') : 0),
                cm_uom_id: parseFloat(this.M_FM_Fleet.cm_uom_id ? this.replaceAllString(this.M_FM_Fleet.cm_uom_id, ',', '', 'number') : 0),
                fm_fleet_status_id: this.M_FM_Fleet.fm_fleet_status_id == '' || this.M_FM_Fleet.fm_fleet_status_id == null ? 'NULL' : this.M_FM_Fleet.fm_fleet_status_id,
                chasis_no: this.M_FM_Fleet.chasis_no,
                construction_year: parseFloat(this.M_FM_Fleet.construction_year ? this.replaceAllString(this.M_FM_Fleet.construction_year, ',', '', 'number') : 0),
                start_warranty_date: this.M_FM_Fleet.start_warranty_date == '' || this.M_FM_Fleet.start_warranty_date == null ? 'NULL' : this.M_FM_Fleet.start_warranty_date,
                end_warranty_date: this.M_FM_Fleet.end_warranty_date == '' || this.M_FM_Fleet.end_warranty_date == null ? 'NULL' : this.M_FM_Fleet.end_warranty_date,
                engine_no: this.M_FM_Fleet.engine_no,
                constuction_month: parseFloat(this.M_FM_Fleet.constuction_month ? this.replaceAllString(this.M_FM_Fleet.constuction_month, ',', '', 'number') : 0),
                service_book_no: this.M_FM_Fleet.service_book_no,
                lastupdatestamp: this.M_FM_Fleet.lastupdatestamp,
                user_edit: this.getDataUser().user_id,

            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return
				
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_FM_Fleet = {
              fm_fleet_id: 0,
              subportfolio_cd: '',
              fleet_id: '',
              fleet_no: '',
              fm_fleet_type_id: 0,
              fm_fleet_type_id_cd: '',
              fm_fleet_type_id_descs: '',
              descs: '',
              fm_fleet_brand_id: 0,
              fm_fleet_brand_id_cd: '',
              fm_fleet_brand_id_descs: '',
              fleet_colour: '',
              chasis_no: '',
              construction_year: 0,
              engine_no: '',
              constuction_month: 0,
              service_book_no: '',
              start_warranty_date: '',
              end_warranty_date: '',
              cm_staff_id_1: 0,
              cm_staff_id_1_cd: '',
              cm_staff_id_1_descs: '',
              cm_staff_id_2: 0,
              cm_staff_id_2_cd: '',
              cm_staff_id_2_descs: '',
              cm_staff_id_co: 0,
              cm_staff_id_co_cd: '',
              cm_staff_id_co_descs: '',
              fm_fleet_status_id: 0,
              fm_fleet_status_id_cd: '',
              fm_fleet_status_id_descs: '',
              height: 0.00,
              width: 0.00,
              matric_uom: '',
              depth: 0.00,
              volume: 0.00,
              weigth: 0.00,
              cm_uom_id: 0,
              fm_fuel_id: 0,
              fm_fuel_id_cd: '',
              fm_fuel_id_descs: '',
              fuel_qty: 0.00,
              last_km: 0.00,
              fm_pool_id: 0,
              fm_pool_id_cd: '',
              fm_pool_id_descs: '',
              cm_contact_id: 0,
              cm_contact_id_cd: '',
              cm_contact_id_descs: '',
              leasing_start_date: '',
              leasing_end_date: '',
              row_id: 0,
              lastupdatestamp: 0,
              time_edit: '',
              user_input: '',
              user_edit: '',
            }
		},
        M_New(){
          this.GetFMSpecification()

        },
        M_Edit(){
        },
        M_Delete(dt){       
			var data = this.FormToABSList().getRowSelected()  
			var dataDelete = []

			
			data.forEach((value) => {

				
				dataDelete.push({
                fm_fleet_id: value.fm_fleet_id,
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
                fm_fleet_id: record.fm_fleet_id,

            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                this.M_FM_Fleet = {
                  fm_fleet_id: data.fm_fleet_id,
                  subportfolio_cd: data.subportfolio_cd,
                  fleet_id: data.fleet_id,
                  fleet_no: data.fleet_no,
                  fm_fleet_type_id: data.fm_fleet_type_id,
                  fm_fleet_type_id_cd: data.fm_fleet_type_id_cd,
                  fm_fleet_type_id_descs: data.fm_fleet_type_id_descs,
                  descs: data.descs,
                  fm_fleet_brand_id: data.fm_fleet_brand_id,
                  fm_fleet_brand_id_cd: data.fm_fleet_brand_id_cd,
                  fm_fleet_brand_id_descs: data.fm_fleet_brand_id_descs,
                  fleet_colour: data.fleet_colour,
                  chasis_no: data.chasis_no,
                  construction_year: data.construction_year,
                  engine_no: data.engine_no,
                  constuction_month: data.constuction_month,
                  service_book_no: data.service_book_no,
                  start_warranty_date: this.momentDateFormatting(data.start_warranty_date, 'YYYY-MM-DD'),
                  end_warranty_date: this.momentDateFormatting(data.end_warranty_date, 'YYYY-MM-DD'),
                  cm_staff_id_1: data.cm_staff_id_1,
                  cm_staff_id_1_cd: data.cm_staff_id_1_cd,
                  cm_staff_id_1_descs: data.cm_staff_id_1_descs,
                  cm_staff_id_2: data.cm_staff_id_2,
                  cm_staff_id_2_cd: data.cm_staff_id_2_cd,
                  cm_staff_id_2_descs: data.cm_staff_id_2_descs,
                  cm_staff_id_co: data.cm_staff_id_co,
                  cm_staff_id_co_cd: data.cm_staff_id_co_cd,
                  cm_staff_id_co_descs: data.cm_staff_id_co_descs,
                  fm_fleet_status_id: data.fm_fleet_status_id,
                  fm_fleet_status_id_cd: data.fm_fleet_status_id_cd,
                  fm_fleet_status_id_descs: data.fm_fleet_status_id_descs,
                  height: this.isCurrency(data.height, this.decimal),
                  width: this.isCurrency(data.width, this.decimal),
                  matric_uom: data.matric_uom,
                  depth: this.isCurrency(data.depth, this.decimal),
                  volume: this.isCurrency(data.volume, this.decimal),
                  weigth: this.isCurrency(data.weigth, this.decimal),
                  cm_uom_id: data.cm_uom_id,
                  fm_fuel_id: data.fm_fuel_id,
                  fm_fuel_id_cd: data.fm_fuel_id_cd,
                  fm_fuel_id_descs: data.fm_fuel_id_descs,
                  fuel_qty: this.isCurrency(data.fuel_qty, this.decimal),
                  last_km: this.isCurrency(data.last_km, this.decimal),
                  fm_pool_id: data.fm_pool_id,
                  fm_pool_id_cd: data.fm_pool_id_cd,
                  fm_pool_id_descs: data.fm_pool_id_descs,
                  cm_contact_id: data.cm_contact_id,
                  cm_contact_id_cd: data.cm_contact_id_cd,
                  cm_contact_id_descs: data.cm_contact_id_descs,
                  leasing_start_date: this.momentDateFormatting(data.leasing_start_date, 'YYYY-MM-DD'),
                  leasing_end_date: this.momentDateFormatting(data.leasing_end_date, 'YYYY-MM-DD'),
                  row_id: data.row_id,
                  lastupdatestamp: record.lastupdatestamp,
                  time_edit: this.momentDateFormatting(data.time_edit, 'YYYY-MM-DD'),
                  user_input: data.user_input,
                  user_edit: data.user_edit,
                }

                this.M_FM_Fleet.fm_fleet_type_idLabel = this.M_FM_Fleet.fm_fleet_type_id_cd != null && this.M_FM_Fleet.fm_fleet_type_id_cd != '' ? data.fm_fleet_type_id_cd + this.separator + data.fm_fleet_type_id_descs :'' 
                this.M_FM_Fleet.fm_fleet_brand_idLabel = this.M_FM_Fleet.fm_fleet_brand_id_cd != null && this.M_FM_Fleet.fm_fleet_brand_id_cd != '' ? data.fm_fleet_brand_id_cd + this.separator + data.fm_fleet_brand_id_descs :'' 
                this.M_FM_Fleet.cm_staff_id_1Label = this.M_FM_Fleet.cm_staff_id_1_cd != null && this.M_FM_Fleet.cm_staff_id_1_cd != '' ? data.cm_staff_id_1_cd + this.separator + data.cm_staff_id_1_descs :'' 
                this.M_FM_Fleet.cm_staff_id_2Label = this.M_FM_Fleet.cm_staff_id_2_cd != null && this.M_FM_Fleet.cm_staff_id_2_cd != '' ? data.cm_staff_id_2_cd + this.separator + data.cm_staff_id_2_descs :'' 
                this.M_FM_Fleet.cm_staff_id_coLabel = this.M_FM_Fleet.cm_staff_id_co_cd != null && this.M_FM_Fleet.cm_staff_id_co_cd != '' ? data.cm_staff_id_co_cd + this.separator + data.cm_staff_id_co_descs :'' 
                this.M_FM_Fleet.fm_fleet_status_idLabel = this.M_FM_Fleet.fm_fleet_status_id_cd != null && this.M_FM_Fleet.fm_fleet_status_id_cd != '' ? data.fm_fleet_status_id_cd + this.separator + data.fm_fleet_status_id_descs :'' 
                this.M_FM_Fleet.fm_fuel_idLabel = this.M_FM_Fleet.fm_fuel_id_cd != null && this.M_FM_Fleet.fm_fuel_id_cd != '' ? data.fm_fuel_id_cd + this.separator + data.fm_fuel_id_descs :'' 
                this.M_FM_Fleet.fm_pool_idLabel = this.M_FM_Fleet.fm_pool_id_cd != null && this.M_FM_Fleet.fm_pool_id_cd != '' ? data.fm_pool_id_cd + this.separator + data.fm_pool_id_descs :'' 
                this.M_FM_Fleet.cm_contact_idLabel = this.M_FM_Fleet.cm_contact_id_cd != null && this.M_FM_Fleet.cm_contact_id_cd != '' ? data.cm_contact_id_cd + this.separator + data.cm_contact_id_descs :'' 


                this.IEBy.Input = data.user_input
                this.IEBy.Edit = data.user_edit

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

