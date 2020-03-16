<template>
    <div class="height--full">
		<ABSLoader />
        <div class="header--content" style="margin-top: 32px !important;margin-left:0px !important;margin-right:0px !important;position: fixed;width: 100%;border-top: 1px solid #ccc;">              
            <div class="header--content__title">
                <b-row class="header-toolbar">
                    <b-col sm="12">
                        Fleet Mobile | 
                        <ABSButton
                            v-show="(editStatus == false && isCanAdd) || (editStatus == true && isCanEdit)"
                            text="Save"
                            icon="save"
                            classButton="button button--save"
                            classIcon="icon-style-1"
                            @click="doSave"
                        />

                        <ABSButton
                            v-show="!isCanEdit"
                            text="Back"
                            icon="chevron-left"
                            classButton="button-cancel button--cancelnew"
                            classIcon="icon-style-1"
                            @click="onGoBack"
                            :styleButton="{color: 'black'}"
                        />

                        <ABSButton
                            v-show="isCanEdit"
                            text="Cancel"
                            icon="chevron-left"
                            classButton="button-cancel button--cancelnew"
                            classIcon="icon-style-1"
                            @click="onGoBack"
                            :styleButton="{color: 'black'}"
                        />
                    </b-col>
                </b-row>
            </div>
        </div>
        <div class="content-app-form__body">
            <div class="block-scope-mobile" style="top:13%;margin:0px !important;padding-top:15px;">
                <b-row style="margin: 0px !important;">
                    <b-col md="12" class="bColMasterForm" style="padding: 5px !important">
                        <div class="card" style="font-size:11px; border:0px !important;">
                            <b-form :data-vv-scope="'FormScope_' + 1 + '_' + 1" :data-vv-value-path="'FormScope_' + 1 + '_' + 1">
                                <b-row style="padding-left:10px;">
                                <b-col md="6" id="col-left">
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_fleet_id" v-model="M_FM_Fleet_Mobile.fleet_id"  ref="ref_fleet_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_fleet_no" v-model="M_FM_Fleet_Mobile.fleet_no"  ref="ref_fleet_no"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Onfm_fleet_type_idChange" :prop="PI_fm_fleet_type_id" :value="M_FM_Fleet_Mobile.fm_fleet_type_id" :label="M_FM_Fleet_Mobile.fm_fleet_type_idLabel" ref="ref_fm_fleet_type_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_descs" v-model="M_FM_Fleet_Mobile.descs"  ref="ref_descs"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Onfm_fleet_brand_idChange" :prop="PI_fm_fleet_brand_id" :value="M_FM_Fleet_Mobile.fm_fleet_brand_id" :label="M_FM_Fleet_Mobile.fm_fleet_brand_idLabel" ref="ref_fm_fleet_brand_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_fleet_colour" v-model="M_FM_Fleet_Mobile.fleet_colour"  ref="ref_fleet_colour"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_chasis_no" v-model="M_FM_Fleet_Mobile.chasis_no"  ref="ref_chasis_no"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_construction_year" v-model="M_FM_Fleet_Mobile.construction_year"  ref="ref_construction_year"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_engine_no" v-model="M_FM_Fleet_Mobile.engine_no"  ref="ref_engine_no"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_constuction_month" v-model="M_FM_Fleet_Mobile.constuction_month"  ref="ref_constuction_month"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_service_book_no" v-model="M_FM_Fleet_Mobile.service_book_no"  ref="ref_service_book_no"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputDateVuex @input="Onstart_warranty_dateChange" :prop="PI_start_warranty_date" v-model="M_FM_Fleet_Mobile.start_warranty_date"  ref="ref_start_warranty_date" />
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputDateVuex @input="Onend_warranty_dateChange" :prop="PI_end_warranty_date" v-model="M_FM_Fleet_Mobile.end_warranty_date"  ref="ref_end_warranty_date" />
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Oncm_staff_id_1Change" :prop="PI_cm_staff_id_1" :value="M_FM_Fleet_Mobile.cm_staff_id_1" :label="M_FM_Fleet_Mobile.cm_staff_id_1Label" ref="ref_cm_staff_id_1"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Oncm_staff_id_2Change" :prop="PI_cm_staff_id_2" :value="M_FM_Fleet_Mobile.cm_staff_id_2" :label="M_FM_Fleet_Mobile.cm_staff_id_2Label" ref="ref_cm_staff_id_2"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Oncm_staff_id_coChange" :prop="PI_cm_staff_id_co" :value="M_FM_Fleet_Mobile.cm_staff_id_co" :label="M_FM_Fleet_Mobile.cm_staff_id_coLabel" ref="ref_cm_staff_id_co"/>
                                    </b-col>
                                  </b-row>
                                </b-col>
                                <b-col md="6" id="col-left">
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Onfm_fleet_status_idChange" :prop="PI_fm_fleet_status_id" :value="M_FM_Fleet_Mobile.fm_fleet_status_id" :label="M_FM_Fleet_Mobile.fm_fleet_status_idLabel" ref="ref_fm_fleet_status_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_height" v-model="M_FM_Fleet_Mobile.height"  ref="ref_height"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_width" v-model="M_FM_Fleet_Mobile.width"  ref="ref_width"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_matric_uom" v-model="M_FM_Fleet_Mobile.matric_uom"  ref="ref_matric_uom"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_depth" v-model="M_FM_Fleet_Mobile.depth"  ref="ref_depth"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_volume" v-model="M_FM_Fleet_Mobile.volume"  ref="ref_volume"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_weigth" v-model="M_FM_Fleet_Mobile.weigth"  ref="ref_weigth"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_cm_uom_id" v-model="M_FM_Fleet_Mobile.cm_uom_id"  ref="ref_cm_uom_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Onfm_fuel_idChange" :prop="PI_fm_fuel_id" :value="M_FM_Fleet_Mobile.fm_fuel_id" :label="M_FM_Fleet_Mobile.fm_fuel_idLabel" ref="ref_fm_fuel_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_fuel_qty" v-model="M_FM_Fleet_Mobile.fuel_qty"  ref="ref_fuel_qty"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_last_km" v-model="M_FM_Fleet_Mobile.last_km"  ref="ref_last_km"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Onfm_pool_idChange" :prop="PI_fm_pool_id" :value="M_FM_Fleet_Mobile.fm_pool_id" :label="M_FM_Fleet_Mobile.fm_pool_idLabel" ref="ref_fm_pool_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Oncm_contact_idChange" :prop="PI_cm_contact_id" :value="M_FM_Fleet_Mobile.cm_contact_id" :label="M_FM_Fleet_Mobile.cm_contact_idLabel" ref="ref_cm_contact_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputDateVuex @input="Onleasing_start_dateChange" :prop="PI_leasing_start_date" v-model="M_FM_Fleet_Mobile.leasing_start_date"  ref="ref_leasing_start_date" />
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputDateVuex @input="Onleasing_end_dateChange" :prop="PI_leasing_end_date" v-model="M_FM_Fleet_Mobile.leasing_end_date"  ref="ref_leasing_end_date" />
                                    </b-col>
                                  </b-row>
                                </b-col>
								
                                </b-row>
                            </b-form>
                        </div>
                    </b-col>
                </b-row>
                <hr style="margin-bottom:0px !important;">
                <ABSTabsVuexNew ref="tab" :listTab="ListTab" :tabPath="'views/FM/FM_Fleet_Mobile'" :PageLevel="2" />
            </div>
        </div>
    </div>
</template>
<script>
    export default {
    props: {PageLevel: '', TabIndex: '', data: ''},
    data () {
        return {
            ListTab: [
                // {
                    // query_name: 'Log Book Detail',
                    // url: 'MK_LogBook_Detail2_New',
                    // fm_fleet_id: null				
                // }
                   {
                        query_name : 'License',
                        url : 'FM_FleetLicense_Mobile',
                        fm_fleet_id : null
                   },
                   {
                        query_name : 'Accessories',
                        url : 'FM_FleetAccessories_Mobile',
                        fm_fleet_id : null
                   },
                   {
                        query_name : 'Maintenance',
                        url : 'FM_FleetMaintenance_Mobile',
                        fm_fleet_id : null
                   }					
            ],

            currentPage: 1,
            perPage: 10,
            sort: 'time_edit DESC',
            sourceField: '',
            paramView: '',
            search: '',

            editStatus: false,

            FormType: "List",
            Module: "FM",
            OptionUrl: "FM_Fleet_Mobile",
            
            cm_running_code_h_id_log_book: null,
            M_FM_Fleet_Mobile: {
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
                cProtect: false, 
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
            }, 

            PI_fleet_no: { 
                cValidate :'required|max:20', 
                cName: 'fleet_no', 
                cLabel: 'Lisence Plate', 
                cLabelSize: 4, 
                cOrder: 2, 
                cKey: true, 
                cType: 'text',
                cVisible: true, 
                cDefault: '', 
                cProtect: false, 
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
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
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1, 
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
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
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
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1, 
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
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
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
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
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
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
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
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
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
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
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
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
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
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
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
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
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
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1, 
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
                cLabel: 'Driver II', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 27, 
                cTriggered: false, 
                cDefault: '', 
                cProtect: false, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1, 
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
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1, 
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
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1, 
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
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
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
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
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
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
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
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
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
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
            }, 

            PI_weigth: { 
                cValidate :'', 
                cName: 'weigth', 
                cLabel: 'Weight', 
                cLabelSize: 4, 
                cOrder: 20, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cDefault: '', 
                cProtect: false, 
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
            }, 

            PI_cm_uom_id: { 
                cValidate :'', 
                cName: 'cm_uom_id', 
                cLabel: 'UOM', 
                cLabelSize: 4, 
                cOrder: 21, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cDefault: '', 
                cProtect: false, 
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
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
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1, 
                cStatic: false, 
                cOption: [], 
                cMasterUrl: '' ,
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
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
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
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
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
                cLabel: 'Pool', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 25, 
                cTriggered: false, 
                cDefault: '', 
                cProtect: false, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1, 
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
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1, 
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
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
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
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
            }, 

           

        }
    },
    computed : {
        ParamFromList() {
            return this.$route.params
        },
        isCanAdd() {
            var canadd = this.ParamFromList.Option ? (this.ParamFromList.Option.add_status == "1") : true
            return canadd
        },
        isCanEdit() {
            var canedit = this.ParamFromList.Option ? (this.ParamFromList.Option.edit_status == "1") : true
            return canedit
        }
    },
    methods: {
        goToTab (index) {
            return this.$refs.tab.$children[0].$children[index].$children[0].$children[0]
        },        		
         GetFMSpecification () {
          var param = {
            subportfolio_cd: this.getDataUser().subportfolio_cd,
            module_cd: this.Module
          }

          this.FnDynamicSpec(param)
          .then(ress => {
            if (ress == null) {
              this.PI_fleet_id.cProtect = false
              this.M_FM_Fleet_Mobile.fleet_id= ""
              this.$refs.ref_fleet_id.focus()
            }
            else {
              var data = ress.Data[0]
              this.running_fleet_id = data.running_fleet_id
              if (this.running_fleet_id && this.running_fleet_id !== "" && this.running_fleet_id > 0) {
                this.PI_fleet_id.cProtect = true
                this.M_FM_Fleet_Mobile.fleet_id= "(auto)"
              }
            }
          })
        },
        Onfm_fleet_type_idChange (data) {
          this.$nextTick(() => {
            this.M_FM_Fleet_Mobile.fm_fleet_type_id = data.id
            this.M_FM_Fleet_Mobile.fm_fleet_type_idLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{fm_fleet_type_id}
            }
          })
          this.$forceUpdate()
        },
        Onfm_fleet_brand_idChange (data) {
          this.$nextTick(() => {
            this.M_FM_Fleet_Mobile.fm_fleet_brand_id = data.id
            this.M_FM_Fleet_Mobile.fm_fleet_brand_idLabel = data.label
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
            this.M_FM_Fleet_Mobile.cm_staff_id_1 = data.id
            this.M_FM_Fleet_Mobile.cm_staff_id_1Label = data.label
            if (this.inputStatus != "VIEW") {
              //{cm_staff_id_1}
            }
          })
          this.$forceUpdate()
        },
        Oncm_staff_id_2Change (data) {
          this.$nextTick(() => {
            this.M_FM_Fleet_Mobile.cm_staff_id_2 = data.id
            this.M_FM_Fleet_Mobile.cm_staff_id_2Label = data.label
            if (this.inputStatus != "VIEW") {
              //{cm_staff_id_2}
            }
          })
          this.$forceUpdate()
        },
        Oncm_staff_id_coChange (data) {
          this.$nextTick(() => {
            this.M_FM_Fleet_Mobile.cm_staff_id_co = data.id
            this.M_FM_Fleet_Mobile.cm_staff_id_coLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{cm_staff_id_co}
            }
          })
          this.$forceUpdate()
        },
        Onfm_fleet_status_idChange (data) {
          this.$nextTick(() => {
            this.M_FM_Fleet_Mobile.fm_fleet_status_id = data.id
            this.M_FM_Fleet_Mobile.fm_fleet_status_idLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{fm_fleet_status_id}
            }
          })
          this.$forceUpdate()
        },
        Onfm_fuel_idChange (data) {
          this.$nextTick(() => {
            this.M_FM_Fleet_Mobile.fm_fuel_id = data.id
            this.M_FM_Fleet_Mobile.fm_fuel_idLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{fm_fuel_id}
            }
          })
          this.$forceUpdate()
        },
        Onfm_pool_idChange (data) {
          this.$nextTick(() => {
            this.M_FM_Fleet_Mobile.fm_pool_id = data.id
            this.M_FM_Fleet_Mobile.fm_pool_idLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{fm_pool_id}
            }
          })
          this.$forceUpdate()
        },
        Oncm_contact_idChange (data) {
          this.$nextTick(() => {
            this.M_FM_Fleet_Mobile.cm_contact_id = data.id
            this.M_FM_Fleet_Mobile.cm_contact_idLabel = data.label
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
	
        doSave() {
            var scopeForm = "FormScope_" + 1 + "_" + 1
            this.$validator._base.validateAll(scopeForm).then((result) => {
                if (!result) return
                this.alertConfirmation("Are You Sure Want To Save This Data ?")
                .then(ress => {
                    if (ress.value) {
                        if (this.editStatus == true) {
                            this.$validator.errors.clear(scopeForm)
                            this.M_Update()
                        }
                        else {
                            this.$validator.errors.clear(scopeForm)
                            this.M_Insert()
                        }
                    }
                })
            })
        },
        M_Insert() {
            //set data Detail
            var dataHeaderInsert = null
            var dataTab = []
            for (let a = 0; a < this.ListTab.length; a++) {  
                if (a == 0)
                  {
                  // Tab FM_FleetLicense_Mobile , line_no1
                    var dataTabDetail = this.goToTab(a).DataListDetail
                    for (let i = 0; i < dataTabDetail.length; i++)
                    {
                        dataTab.push({
                            _Method_: "SAVE",
                            _LineNo_: 1,
                            subportfolio_cd: this.getDataUser().subportfolio_cd,
                            fleet_license_no: dataTabDetail[i].fleet_license_no,
                            fm_license_type_id: dataTabDetail[i].fm_license_type_id == '' || dataTabDetail[i].fm_license_type_id == null ? 'NULL' : dataTabDetail[i].fm_license_type_id,
                            expired_date: dataTabDetail[i].expired_date == '' || dataTabDetail[i].expired_date == null ? 'NULL' : dataTabDetail[i].expired_date,
                            cost: parseFloat(dataTabDetail[i].cost ? this.replaceAllString(dataTabDetail[i].cost, ',', '', 'number') : 0),
                            cm_city_id: dataTabDetail[i].cm_city_id == '' || dataTabDetail[i].cm_city_id == null ? 'NULL' : dataTabDetail[i].cm_city_id,
                            remarks: dataTabDetail[i].remarks,
                            user_input: this.getDataUser().user_id,
                            fm_fleet_id: "A_Insert.row_id_output"
                        })
                    }
                  }
                else if (a == 1)
                  {
                  // Tab FM_FleetAccessories_Mobile , line_no2
                    var dataTabDetail = this.goToTab(a).DataListDetail
                    for (let i = 0; i < dataTabDetail.length; i++)
                    {
                        dataTab.push({
                            _Method_: "SAVE",
                            _LineNo_: 2,
                            subportfolio_cd: this.getDataUser().subportfolio_cd,
                            fm_accessories_id: dataTabDetail[i].fm_accessories_id == '' || dataTabDetail[i].fm_accessories_id == null ? 'NULL' : dataTabDetail[i].fm_accessories_id,
                            accessories_date: dataTabDetail[i].accessories_date == '' || dataTabDetail[i].accessories_date == null ? 'NULL' : dataTabDetail[i].accessories_date,
                            status: dataTabDetail[i].status,
                            descs: dataTabDetail[i].descs,
                            user_input: this.getDataUser().user_id,
                            fm_fleet_id: "A_Insert.row_id_output"
                        })
                    }
                  }
                else if (a == 2)
                  {
                  // Tab FM_FleetMaintenance_Mobile , line_no3
                    var dataTabDetail = this.goToTab(a).DataListDetail
                    for (let i = 0; i < dataTabDetail.length; i++)
                    {
                        dataTab.push({
                            _Method_: "SAVE",
                            _LineNo_: 3,
                            subportfolio_cd: this.getDataUser().subportfolio_cd,
                            mm_maintenance_mstr_id: dataTabDetail[i].mm_maintenance_mstr_id == '' || dataTabDetail[i].mm_maintenance_mstr_id == null ? 'NULL' : dataTabDetail[i].mm_maintenance_mstr_id,
                            maintenance_no: dataTabDetail[i].maintenance_no,
                            maintenance_date: dataTabDetail[i].maintenance_date == '' || dataTabDetail[i].maintenance_date == null ? 'NULL' : dataTabDetail[i].maintenance_date,
                            in_date: dataTabDetail[i].in_date == '' || dataTabDetail[i].in_date == null ? 'NULL' : dataTabDetail[i].in_date,
                            out_date: dataTabDetail[i].out_date == '' || dataTabDetail[i].out_date == null ? 'NULL' : dataTabDetail[i].out_date,
                            estimate_out: dataTabDetail[i].estimate_out == '' || dataTabDetail[i].estimate_out == null ? 'NULL' : dataTabDetail[i].estimate_out,
                            fm_fleet_status_id: dataTabDetail[i].fm_fleet_status_id == '' || dataTabDetail[i].fm_fleet_status_id == null ? 'NULL' : dataTabDetail[i].fm_fleet_status_id,
                            cm_staff_id: dataTabDetail[i].cm_staff_id == '' || dataTabDetail[i].cm_staff_id == null ? 'NULL' : dataTabDetail[i].cm_staff_id,
                            descs: dataTabDetail[i].descs,
                            user_input: this.getDataUser().user_id,
                            fm_fleet_id: "A_Insert.row_id_output"
                        })
                    }
                  }
                
            }

            //action save
          if (this.running_fleet_id && this.running_fleet_id != "" && this.running_fleet_id > 0) 
            {
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
                this.M_FM_Fleet_Mobile.fleet_id = data._generate_running_code_id

                dataHeaderInsert = {
                    _Method_: "SAVE",
                    _LineNo_: 0,
                    subportfolio_cd: this.getDataUser().subportfolio_cd,
                    fleet_id: this.M_FM_Fleet_Mobile.fleet_id,
                    fleet_no: this.M_FM_Fleet_Mobile.fleet_no,
                    fm_fleet_type_id: this.M_FM_Fleet_Mobile.fm_fleet_type_id == '' || this.M_FM_Fleet_Mobile.fm_fleet_type_id == null ? 'NULL' : this.M_FM_Fleet_Mobile.fm_fleet_type_id,
                    descs: this.M_FM_Fleet_Mobile.descs,
                    fm_fleet_brand_id: this.M_FM_Fleet_Mobile.fm_fleet_brand_id == '' || this.M_FM_Fleet_Mobile.fm_fleet_brand_id == null ? 'NULL' : this.M_FM_Fleet_Mobile.fm_fleet_brand_id,
                    fleet_colour: this.M_FM_Fleet_Mobile.fleet_colour,
                    fm_pool_id: this.M_FM_Fleet_Mobile.fm_pool_id == '' || this.M_FM_Fleet_Mobile.fm_pool_id == null ? 'NULL' : this.M_FM_Fleet_Mobile.fm_pool_id,
                    fm_fuel_id: this.M_FM_Fleet_Mobile.fm_fuel_id == '' || this.M_FM_Fleet_Mobile.fm_fuel_id == null ? 'NULL' : this.M_FM_Fleet_Mobile.fm_fuel_id,
                    fuel_qty: parseFloat(this.M_FM_Fleet_Mobile.fuel_qty ? this.replaceAllString(this.M_FM_Fleet_Mobile.fuel_qty, ',', '', 'number') : 0),
                    last_km: parseFloat(this.M_FM_Fleet_Mobile.last_km ? this.replaceAllString(this.M_FM_Fleet_Mobile.last_km, ',', '', 'number') : 0),
                    cm_staff_id_1: this.M_FM_Fleet_Mobile.cm_staff_id_1 == '' || this.M_FM_Fleet_Mobile.cm_staff_id_1 == null ? 'NULL' : this.M_FM_Fleet_Mobile.cm_staff_id_1,
                    cm_staff_id_2: this.M_FM_Fleet_Mobile.cm_staff_id_2 == '' || this.M_FM_Fleet_Mobile.cm_staff_id_2 == null ? 'NULL' : this.M_FM_Fleet_Mobile.cm_staff_id_2,
                    cm_staff_id_co: this.M_FM_Fleet_Mobile.cm_staff_id_co == '' || this.M_FM_Fleet_Mobile.cm_staff_id_co == null ? 'NULL' : this.M_FM_Fleet_Mobile.cm_staff_id_co,
                    cm_contact_id: this.M_FM_Fleet_Mobile.cm_contact_id == '' || this.M_FM_Fleet_Mobile.cm_contact_id == null ? 'NULL' : this.M_FM_Fleet_Mobile.cm_contact_id,
                    leasing_start_date: this.M_FM_Fleet_Mobile.leasing_start_date == '' || this.M_FM_Fleet_Mobile.leasing_start_date == null ? 'NULL' : this.M_FM_Fleet_Mobile.leasing_start_date,
                    leasing_end_date: this.M_FM_Fleet_Mobile.leasing_end_date == '' || this.M_FM_Fleet_Mobile.leasing_end_date == null ? 'NULL' : this.M_FM_Fleet_Mobile.leasing_end_date,
                    height: parseFloat(this.M_FM_Fleet_Mobile.height ? this.replaceAllString(this.M_FM_Fleet_Mobile.height, ',', '', 'number') : 0),
                    width: parseFloat(this.M_FM_Fleet_Mobile.width ? this.replaceAllString(this.M_FM_Fleet_Mobile.width, ',', '', 'number') : 0),
                    matric_uom: this.M_FM_Fleet_Mobile.matric_uom,
                    depth: parseFloat(this.M_FM_Fleet_Mobile.depth ? this.replaceAllString(this.M_FM_Fleet_Mobile.depth, ',', '', 'number') : 0),
                    volume: parseFloat(this.M_FM_Fleet_Mobile.volume ? this.replaceAllString(this.M_FM_Fleet_Mobile.volume, ',', '', 'number') : 0),
                    weigth: parseFloat(this.M_FM_Fleet_Mobile.weigth ? this.replaceAllString(this.M_FM_Fleet_Mobile.weigth, ',', '', 'number') : 0),
                    cm_uom_id: this.M_FM_Fleet_Mobile.cm_uom_id,
                    fm_fleet_status_id: this.M_FM_Fleet_Mobile.fm_fleet_status_id == '' || this.M_FM_Fleet_Mobile.fm_fleet_status_id == null ? 'NULL' : this.M_FM_Fleet_Mobile.fm_fleet_status_id,
                    chasis_no: this.M_FM_Fleet_Mobile.chasis_no,
                    construction_year: parseFloat(this.M_FM_Fleet_Mobile.construction_year ? this.replaceAllString(this.M_FM_Fleet_Mobile.construction_year, ',', '', 'number') : 0),
                    start_warranty_date: this.M_FM_Fleet_Mobile.start_warranty_date == '' || this.M_FM_Fleet_Mobile.start_warranty_date == null ? 'NULL' : this.M_FM_Fleet_Mobile.start_warranty_date,
                    end_warranty_date: this.M_FM_Fleet_Mobile.end_warranty_date == '' || this.M_FM_Fleet_Mobile.end_warranty_date == null ? 'NULL' : this.M_FM_Fleet_Mobile.end_warranty_date,
                    engine_no: this.M_FM_Fleet_Mobile.engine_no,
                    constuction_month: parseFloat(this.M_FM_Fleet_Mobile.constuction_month ? this.replaceAllString(this.M_FM_Fleet_Mobile.constuction_month, ',', '', 'number') : 0),
                    service_book_no: this.M_FM_Fleet_Mobile.service_book_no,
                    user_input: this.getDataUser().user_id
                }

                var data = [{
                    A_Insert: dataHeaderInsert,
                    B_Looping: dataTab
                }]

                var param = {
                    OptionUrl: this.OptionUrl,
                    LineNo: 0,
                    Data: data
                }

                this.postJSONMulti(this.getUrlMultiV2(this.getUrlProsesDataPostMulti()), param)
                .then((response) => {
                    if(response == null) {
						this.$router.go(-1)
                    }
                    else {
                        this.alertSuccess("Save Data Has Been Successfull")
						.then(ress => {
                            this.$router.go(-1)
                        })
                    }
                })
              })
            }
          else
            {
                dataHeaderInsert = {
                    _Method_: "SAVE",
                    _LineNo_: 0,
                    subportfolio_cd: this.getDataUser().subportfolio_cd,
                    fleet_id: this.M_FM_Fleet_Mobile.fleet_id,
                    fleet_no: this.M_FM_Fleet_Mobile.fleet_no,
                    fm_fleet_type_id: this.M_FM_Fleet_Mobile.fm_fleet_type_id == '' || this.M_FM_Fleet_Mobile.fm_fleet_type_id == null ? 'NULL' : this.M_FM_Fleet_Mobile.fm_fleet_type_id,
                    descs: this.M_FM_Fleet_Mobile.descs,
                    fm_fleet_brand_id: this.M_FM_Fleet_Mobile.fm_fleet_brand_id == '' || this.M_FM_Fleet_Mobile.fm_fleet_brand_id == null ? 'NULL' : this.M_FM_Fleet_Mobile.fm_fleet_brand_id,
                    fleet_colour: this.M_FM_Fleet_Mobile.fleet_colour,
                    fm_pool_id: this.M_FM_Fleet_Mobile.fm_pool_id == '' || this.M_FM_Fleet_Mobile.fm_pool_id == null ? 'NULL' : this.M_FM_Fleet_Mobile.fm_pool_id,
                    fm_fuel_id: this.M_FM_Fleet_Mobile.fm_fuel_id == '' || this.M_FM_Fleet_Mobile.fm_fuel_id == null ? 'NULL' : this.M_FM_Fleet_Mobile.fm_fuel_id,
                    fuel_qty: parseFloat(this.M_FM_Fleet_Mobile.fuel_qty ? this.replaceAllString(this.M_FM_Fleet_Mobile.fuel_qty, ',', '', 'number') : 0),
                    last_km: parseFloat(this.M_FM_Fleet_Mobile.last_km ? this.replaceAllString(this.M_FM_Fleet_Mobile.last_km, ',', '', 'number') : 0),
                    cm_staff_id_1: this.M_FM_Fleet_Mobile.cm_staff_id_1 == '' || this.M_FM_Fleet_Mobile.cm_staff_id_1 == null ? 'NULL' : this.M_FM_Fleet_Mobile.cm_staff_id_1,
                    cm_staff_id_2: this.M_FM_Fleet_Mobile.cm_staff_id_2 == '' || this.M_FM_Fleet_Mobile.cm_staff_id_2 == null ? 'NULL' : this.M_FM_Fleet_Mobile.cm_staff_id_2,
                    cm_staff_id_co: this.M_FM_Fleet_Mobile.cm_staff_id_co == '' || this.M_FM_Fleet_Mobile.cm_staff_id_co == null ? 'NULL' : this.M_FM_Fleet_Mobile.cm_staff_id_co,
                    cm_contact_id: this.M_FM_Fleet_Mobile.cm_contact_id == '' || this.M_FM_Fleet_Mobile.cm_contact_id == null ? 'NULL' : this.M_FM_Fleet_Mobile.cm_contact_id,
                    leasing_start_date: this.M_FM_Fleet_Mobile.leasing_start_date == '' || this.M_FM_Fleet_Mobile.leasing_start_date == null ? 'NULL' : this.M_FM_Fleet_Mobile.leasing_start_date,
                    leasing_end_date: this.M_FM_Fleet_Mobile.leasing_end_date == '' || this.M_FM_Fleet_Mobile.leasing_end_date == null ? 'NULL' : this.M_FM_Fleet_Mobile.leasing_end_date,
                    height: parseFloat(this.M_FM_Fleet_Mobile.height ? this.replaceAllString(this.M_FM_Fleet_Mobile.height, ',', '', 'number') : 0),
                    width: parseFloat(this.M_FM_Fleet_Mobile.width ? this.replaceAllString(this.M_FM_Fleet_Mobile.width, ',', '', 'number') : 0),
                    matric_uom: this.M_FM_Fleet_Mobile.matric_uom,
                    depth: parseFloat(this.M_FM_Fleet_Mobile.depth ? this.replaceAllString(this.M_FM_Fleet_Mobile.depth, ',', '', 'number') : 0),
                    volume: parseFloat(this.M_FM_Fleet_Mobile.volume ? this.replaceAllString(this.M_FM_Fleet_Mobile.volume, ',', '', 'number') : 0),
                    weigth: parseFloat(this.M_FM_Fleet_Mobile.weigth ? this.replaceAllString(this.M_FM_Fleet_Mobile.weigth, ',', '', 'number') : 0),
                    cm_uom_id: this.M_FM_Fleet_Mobile.cm_uom_id,
                    fm_fleet_status_id: this.M_FM_Fleet_Mobile.fm_fleet_status_id == '' || this.M_FM_Fleet_Mobile.fm_fleet_status_id == null ? 'NULL' : this.M_FM_Fleet_Mobile.fm_fleet_status_id,
                    chasis_no: this.M_FM_Fleet_Mobile.chasis_no,
                    construction_year: parseFloat(this.M_FM_Fleet_Mobile.construction_year ? this.replaceAllString(this.M_FM_Fleet_Mobile.construction_year, ',', '', 'number') : 0),
                    start_warranty_date: this.M_FM_Fleet_Mobile.start_warranty_date == '' || this.M_FM_Fleet_Mobile.start_warranty_date == null ? 'NULL' : this.M_FM_Fleet_Mobile.start_warranty_date,
                    end_warranty_date: this.M_FM_Fleet_Mobile.end_warranty_date == '' || this.M_FM_Fleet_Mobile.end_warranty_date == null ? 'NULL' : this.M_FM_Fleet_Mobile.end_warranty_date,
                    engine_no: this.M_FM_Fleet_Mobile.engine_no,
                    constuction_month: parseFloat(this.M_FM_Fleet_Mobile.constuction_month ? this.replaceAllString(this.M_FM_Fleet_Mobile.constuction_month, ',', '', 'number') : 0),
                    service_book_no: this.M_FM_Fleet_Mobile.service_book_no,
                    user_input: this.getDataUser().user_id
                }

                var data = [{
                    A_Insert: dataHeaderInsert,
                    B_Looping: dataTab
                }]

                var param = {
                    OptionUrl: this.OptionUrl,
                    LineNo: 0,
                    Data: data
                }

                this.postJSONMulti(this.getUrlMultiV2(this.getUrlProsesDataPostMulti()), param)
                .then((response) => {
                    if(response == null) {
						this.$router.go(-1)
                    }
                    else {
                        this.alertSuccess("Save Data Has Been Successfull")
						.then(ress => {
                            this.$router.go(-1)
                        })
                    }
                })
            }

        },
        M_Update() {
            //set data Detail
            var dataHeaderUpdateUpdate = null
            var dataTab = []

            for (let a = 0; a < this.ListTab.length; a++) {
                if (a == 0)
                  {
                  // Tab FM_FleetLicense_Mobile , line_no1
                    var dataTabDetail = this.goToTab(a).DataListDetail
                    for (let i = 0; i < dataTabDetail.length; i++)
                    {
                        if (dataTabDetail[i].hasOwnProperty("_METHOD_"))
                        {
                            if (dataTabDetail[i]['_METHOD_'] == 'NEW')
                            {
                              dataTab.push({
                                  _Method_: "SAVE",
                                  _LineNo_: 1,
                                  subportfolio_cd: this.getDataUser().subportfolio_cd,
                                  fleet_license_no: dataTabDetail[i].fleet_license_no,
                                  fm_license_type_id: dataTabDetail[i].fm_license_type_id == '' || dataTabDetail[i].fm_license_type_id == null ? 'NULL' : dataTabDetail[i].fm_license_type_id,
                                  expired_date: dataTabDetail[i].expired_date == '' || dataTabDetail[i].expired_date == null ? 'NULL' : dataTabDetail[i].expired_date,
                                  cost: parseFloat(dataTabDetail[i].cost ? this.replaceAllString(dataTabDetail[i].cost, ',', '', 'number') : 0),
                                  cm_city_id: dataTabDetail[i].cm_city_id == '' || dataTabDetail[i].cm_city_id == null ? 'NULL' : dataTabDetail[i].cm_city_id,
                                  remarks: dataTabDetail[i].remarks,
                                  user_input: this.getDataUser().user_id,
                                  fm_fleet_id: this.M_FM_Fleet_Mobile.fm_fleet_id
                              })
                            }
                        }
                        else
                        {
                              dataTab.push({
                                  _Method_: "UPDATE",
                                  _LineNo_: 1,
                                  fm_fleet_license_id: dataTabDetail[i].row_id,
                                  subportfolio_cd: this.getDataUser().subportfolio_cd,
                                  fleet_license_no: dataTabDetail[i].fleet_license_no,
                                  fm_license_type_id: dataTabDetail[i].fm_license_type_id == '' || dataTabDetail[i].fm_license_type_id == null ? 'NULL' : dataTabDetail[i].fm_license_type_id,
                                  expired_date: dataTabDetail[i].expired_date == '' || dataTabDetail[i].expired_date == null ? 'NULL' : dataTabDetail[i].expired_date,
                                  cost: parseFloat(dataTabDetail[i].cost ? this.replaceAllString(dataTabDetail[i].cost, ',', '', 'number') : 0),
                                  cm_city_id: dataTabDetail[i].cm_city_id == '' || dataTabDetail[i].cm_city_id == null ? 'NULL' : dataTabDetail[i].cm_city_id,
                                  remarks: dataTabDetail[i].remarks,
                                  lastupdatestamp: dataTabDetail[i].lastupdatestamp,
                                  user_edit: this.getDataUser().user_id,
                                  fm_fleet_id: this.M_FM_Fleet_Mobile.fm_fleet_id
                              })
                        }
                    }
                    var dataDelete = this.goToTab(a).DataForDelete
                    for (let d = 0; d < dataDelete.length; d++)
                    {
                      dataTab.push({
                          _Method_: "DELETE",
                          _LineNo_: 1,
                          fm_fleet_license_id: dataTabDetail[i].row_id,
                          lastupdatestamp: dataDelete[i].lastupdatestamp
                      })
                    }
                  }
                else if (a == 1)
                  {
                  // Tab FM_FleetAccessories_Mobile , line_no2
                    var dataTabDetail = this.goToTab(a).DataListDetail
                    for (let i = 0; i < dataTabDetail.length; i++)
                    {
                        if (dataTabDetail[i].hasOwnProperty("_METHOD_"))
                        {
                            if (dataTabDetail[i]['_METHOD_'] == 'NEW')
                            {
                              dataTab.push({
                                  _Method_: "SAVE",
                                  _LineNo_: 2,
                                  subportfolio_cd: this.getDataUser().subportfolio_cd,
                                  fm_accessories_id: dataTabDetail[i].fm_accessories_id == '' || dataTabDetail[i].fm_accessories_id == null ? 'NULL' : dataTabDetail[i].fm_accessories_id,
                                  accessories_date: dataTabDetail[i].accessories_date == '' || dataTabDetail[i].accessories_date == null ? 'NULL' : dataTabDetail[i].accessories_date,
                                  status: dataTabDetail[i].status,
                                  descs: dataTabDetail[i].descs,
                                  user_input: this.getDataUser().user_id,
                                  fm_fleet_id: this.M_FM_Fleet_Mobile.fm_fleet_id
                              })
                            }
                        }
                        else
                        {
                              dataTab.push({
                                  _Method_: "UPDATE",
                                  _LineNo_: 2,
                                  fm_fleet_accessories_id: dataTabDetail[i].row_id,
                                  subportfolio_cd: this.getDataUser().subportfolio_cd,
                                  fm_accessories_id: dataTabDetail[i].fm_accessories_id == '' || dataTabDetail[i].fm_accessories_id == null ? 'NULL' : dataTabDetail[i].fm_accessories_id,
                                  accessories_date: dataTabDetail[i].accessories_date == '' || dataTabDetail[i].accessories_date == null ? 'NULL' : dataTabDetail[i].accessories_date,
                                  status: dataTabDetail[i].status,
                                  descs: dataTabDetail[i].descs,
                                  lastupdatestamp: dataTabDetail[i].lastupdatestamp,
                                  user_edit: this.getDataUser().user_id,
                                  fm_fleet_id: this.M_FM_Fleet_Mobile.fm_fleet_id
                              })
                        }
                    }
                    var dataDelete = this.goToTab(a).DataForDelete
                    for (let d = 0; d < dataDelete.length; d++)
                    {
                      dataTab.push({
                          _Method_: "DELETE",
                          _LineNo_: 2,
                          fm_fleet_accessories_id: dataTabDetail[i].row_id,
                          lastupdatestamp: dataDelete[i].lastupdatestamp
                      })
                    }
                  }
                else if (a == 2)
                  {
                  // Tab FM_FleetMaintenance_Mobile , line_no3
                    var dataTabDetail = this.goToTab(a).DataListDetail
                    for (let i = 0; i < dataTabDetail.length; i++)
                    {
                        if (dataTabDetail[i].hasOwnProperty("_METHOD_"))
                        {
                            if (dataTabDetail[i]['_METHOD_'] == 'NEW')
                            {
                              dataTab.push({
                                  _Method_: "SAVE",
                                  _LineNo_: 3,
                                  subportfolio_cd: this.getDataUser().subportfolio_cd,
                                  mm_maintenance_mstr_id: dataTabDetail[i].mm_maintenance_mstr_id == '' || dataTabDetail[i].mm_maintenance_mstr_id == null ? 'NULL' : dataTabDetail[i].mm_maintenance_mstr_id,
                                  maintenance_no: dataTabDetail[i].maintenance_no,
                                  maintenance_date: dataTabDetail[i].maintenance_date == '' || dataTabDetail[i].maintenance_date == null ? 'NULL' : dataTabDetail[i].maintenance_date,
                                  in_date: dataTabDetail[i].in_date == '' || dataTabDetail[i].in_date == null ? 'NULL' : dataTabDetail[i].in_date,
                                  out_date: dataTabDetail[i].out_date == '' || dataTabDetail[i].out_date == null ? 'NULL' : dataTabDetail[i].out_date,
                                  estimate_out: dataTabDetail[i].estimate_out == '' || dataTabDetail[i].estimate_out == null ? 'NULL' : dataTabDetail[i].estimate_out,
                                  fm_fleet_status_id: dataTabDetail[i].fm_fleet_status_id == '' || dataTabDetail[i].fm_fleet_status_id == null ? 'NULL' : dataTabDetail[i].fm_fleet_status_id,
                                  cm_staff_id: dataTabDetail[i].cm_staff_id == '' || dataTabDetail[i].cm_staff_id == null ? 'NULL' : dataTabDetail[i].cm_staff_id,
                                  descs: dataTabDetail[i].descs,
                                  user_input: this.getDataUser().user_id,
                                  fm_fleet_id: this.M_FM_Fleet_Mobile.fm_fleet_id
                              })
                            }
                        }
                        else
                        {
                              dataTab.push({
                                  _Method_: "UPDATE",
                                  _LineNo_: 3,
                                  fm_fleet_maintenance_id: dataTabDetail[i].row_id,
                                  subportfolio_cd: this.getDataUser().subportfolio_cd,
                                  mm_maintenance_mstr_id: dataTabDetail[i].mm_maintenance_mstr_id == '' || dataTabDetail[i].mm_maintenance_mstr_id == null ? 'NULL' : dataTabDetail[i].mm_maintenance_mstr_id,
                                  maintenance_no: dataTabDetail[i].maintenance_no,
                                  maintenance_date: dataTabDetail[i].maintenance_date == '' || dataTabDetail[i].maintenance_date == null ? 'NULL' : dataTabDetail[i].maintenance_date,
                                  in_date: dataTabDetail[i].in_date == '' || dataTabDetail[i].in_date == null ? 'NULL' : dataTabDetail[i].in_date,
                                  out_date: dataTabDetail[i].out_date == '' || dataTabDetail[i].out_date == null ? 'NULL' : dataTabDetail[i].out_date,
                                  estimate_out: dataTabDetail[i].estimate_out == '' || dataTabDetail[i].estimate_out == null ? 'NULL' : dataTabDetail[i].estimate_out,
                                  fm_fleet_status_id: dataTabDetail[i].fm_fleet_status_id == '' || dataTabDetail[i].fm_fleet_status_id == null ? 'NULL' : dataTabDetail[i].fm_fleet_status_id,
                                  cm_staff_id: dataTabDetail[i].cm_staff_id == '' || dataTabDetail[i].cm_staff_id == null ? 'NULL' : dataTabDetail[i].cm_staff_id,
                                  descs: dataTabDetail[i].descs,
                                  lastupdatestamp: dataTabDetail[i].lastupdatestamp,
                                  user_edit: this.getDataUser().user_id,
                                  fm_fleet_id: this.M_FM_Fleet_Mobile.fm_fleet_id
                              })
                        }
                    }
                    var dataDelete = this.goToTab(a).DataForDelete
                    for (let d = 0; d < dataDelete.length; d++)
                    {
                      dataTab.push({
                          _Method_: "DELETE",
                          _LineNo_: 3,
                          fm_fleet_maintenance_id: dataTabDetail[i].row_id,
                          lastupdatestamp: dataDelete[i].lastupdatestamp
                      })
                    }
                  }
              
            }
            
            //action update
				dataHeaderInsert = {
                    _Method_: "SAVE",
                    _LineNo_: 0,
                    fm_fleet_id: this.M_FM_Fleet_Mobile.fm_fleet_id,
                    subportfolio_cd: this.getDataUser().subportfolio_cd,
                    fleet_id: this.M_FM_Fleet_Mobile.fleet_id,
                    fleet_no: this.M_FM_Fleet_Mobile.fleet_no,
                    fm_fleet_type_id: this.M_FM_Fleet_Mobile.fm_fleet_type_id == '' || this.M_FM_Fleet_Mobile.fm_fleet_type_id == null ? 'NULL' : this.M_FM_Fleet_Mobile.fm_fleet_type_id,
                    descs: this.M_FM_Fleet_Mobile.descs,
                    fm_fleet_brand_id: this.M_FM_Fleet_Mobile.fm_fleet_brand_id == '' || this.M_FM_Fleet_Mobile.fm_fleet_brand_id == null ? 'NULL' : this.M_FM_Fleet_Mobile.fm_fleet_brand_id,
                    fleet_colour: this.M_FM_Fleet_Mobile.fleet_colour,
                    fm_pool_id: this.M_FM_Fleet_Mobile.fm_pool_id == '' || this.M_FM_Fleet_Mobile.fm_pool_id == null ? 'NULL' : this.M_FM_Fleet_Mobile.fm_pool_id,
                    fm_fuel_id: this.M_FM_Fleet_Mobile.fm_fuel_id == '' || this.M_FM_Fleet_Mobile.fm_fuel_id == null ? 'NULL' : this.M_FM_Fleet_Mobile.fm_fuel_id,
                    fuel_qty: parseFloat(this.M_FM_Fleet_Mobile.fuel_qty ? this.replaceAllString(this.M_FM_Fleet_Mobile.fuel_qty, ',', '', 'number') : 0),
                    last_km: parseFloat(this.M_FM_Fleet_Mobile.last_km ? this.replaceAllString(this.M_FM_Fleet_Mobile.last_km, ',', '', 'number') : 0),
                    cm_staff_id_1: this.M_FM_Fleet_Mobile.cm_staff_id_1 == '' || this.M_FM_Fleet_Mobile.cm_staff_id_1 == null ? 'NULL' : this.M_FM_Fleet_Mobile.cm_staff_id_1,
                    cm_staff_id_2: this.M_FM_Fleet_Mobile.cm_staff_id_2 == '' || this.M_FM_Fleet_Mobile.cm_staff_id_2 == null ? 'NULL' : this.M_FM_Fleet_Mobile.cm_staff_id_2,
                    cm_staff_id_co: this.M_FM_Fleet_Mobile.cm_staff_id_co == '' || this.M_FM_Fleet_Mobile.cm_staff_id_co == null ? 'NULL' : this.M_FM_Fleet_Mobile.cm_staff_id_co,
                    cm_contact_id: this.M_FM_Fleet_Mobile.cm_contact_id == '' || this.M_FM_Fleet_Mobile.cm_contact_id == null ? 'NULL' : this.M_FM_Fleet_Mobile.cm_contact_id,
                    leasing_start_date: this.M_FM_Fleet_Mobile.leasing_start_date == '' || this.M_FM_Fleet_Mobile.leasing_start_date == null ? 'NULL' : this.M_FM_Fleet_Mobile.leasing_start_date,
                    leasing_end_date: this.M_FM_Fleet_Mobile.leasing_end_date == '' || this.M_FM_Fleet_Mobile.leasing_end_date == null ? 'NULL' : this.M_FM_Fleet_Mobile.leasing_end_date,
                    height: parseFloat(this.M_FM_Fleet_Mobile.height ? this.replaceAllString(this.M_FM_Fleet_Mobile.height, ',', '', 'number') : 0),
                    width: parseFloat(this.M_FM_Fleet_Mobile.width ? this.replaceAllString(this.M_FM_Fleet_Mobile.width, ',', '', 'number') : 0),
                    matric_uom: this.M_FM_Fleet_Mobile.matric_uom,
                    depth: parseFloat(this.M_FM_Fleet_Mobile.depth ? this.replaceAllString(this.M_FM_Fleet_Mobile.depth, ',', '', 'number') : 0),
                    volume: parseFloat(this.M_FM_Fleet_Mobile.volume ? this.replaceAllString(this.M_FM_Fleet_Mobile.volume, ',', '', 'number') : 0),
                    weigth: parseFloat(this.M_FM_Fleet_Mobile.weigth ? this.replaceAllString(this.M_FM_Fleet_Mobile.weigth, ',', '', 'number') : 0),
                    cm_uom_id: this.M_FM_Fleet_Mobile.cm_uom_id,
                    fm_fleet_status_id: this.M_FM_Fleet_Mobile.fm_fleet_status_id == '' || this.M_FM_Fleet_Mobile.fm_fleet_status_id == null ? 'NULL' : this.M_FM_Fleet_Mobile.fm_fleet_status_id,
                    chasis_no: this.M_FM_Fleet_Mobile.chasis_no,
                    construction_year: parseFloat(this.M_FM_Fleet_Mobile.construction_year ? this.replaceAllString(this.M_FM_Fleet_Mobile.construction_year, ',', '', 'number') : 0),
                    start_warranty_date: this.M_FM_Fleet_Mobile.start_warranty_date == '' || this.M_FM_Fleet_Mobile.start_warranty_date == null ? 'NULL' : this.M_FM_Fleet_Mobile.start_warranty_date,
                    end_warranty_date: this.M_FM_Fleet_Mobile.end_warranty_date == '' || this.M_FM_Fleet_Mobile.end_warranty_date == null ? 'NULL' : this.M_FM_Fleet_Mobile.end_warranty_date,
                    engine_no: this.M_FM_Fleet_Mobile.engine_no,
                    constuction_month: parseFloat(this.M_FM_Fleet_Mobile.constuction_month ? this.replaceAllString(this.M_FM_Fleet_Mobile.constuction_month, ',', '', 'number') : 0),
                    service_book_no: this.M_FM_Fleet_Mobile.service_book_no,
                    lastupdatestamp: this.M_FM_Fleet_Mobile.lastupdatestamp,
                    user_edit: this.getDataUser().user_id
                }

                var data = [{
                    A_Insert: dataHeaderInsert,
                    B_Looping: dataTab
                }]

                var param = {
                    OptionUrl: this.OptionUrl,
                    LineNo: 0,
                    Data: data
                }

                this.postJSONMulti(this.getUrlMultiV2(this.getUrlProsesDataPostMulti()), param)
                .then((response) => {
                    if(response == null) {
						this.$router.go(-1)
                    }
                    else {
                        this.alertSuccess("Save Data Has Been Successfull")
						.then(ress => {
                            this.$router.go(-1)
                        })
                    }
                })           
        },
        M_ClearForm() {
            this.M_FM_Fleet_Mobile = {
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
        getDataBy(){
            var param = {
                OptionUrl: this.OptionUrl,
                LineNo: 0,
                fm_fleet_id: this.ParamFromList.fm_fleet_id,

            }

            var url = this.getUrlV2(this.getUrlById())  

            this.postJSON( url, param )
            .then(response => {
                if(response == null) return
                this.M_ClearForm()
                
                var data = response.Data[0]
                const lastupdatestamp = this.ParamFromList.lastupdatestamp ? this.ParamFromList.lastupdatestamp : data.lastupdatestamp
                this.M_FM_Fleet_Mobile = {
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
                  lastupdatestamp:  this.ParamFromList.lastupdatestamp,
                  time_edit: this.momentDateFormatting(data.time_edit, 'YYYY-MM-DD'),
                  user_input: data.user_input,
                  user_edit: data.user_edit,
                }

                this.M_FM_Fleet_Mobile.fm_fleet_type_idLabel = this.M_FM_Fleet_Mobile.fm_fleet_type_id_cd != null && this.M_FM_Fleet_Mobile.fm_fleet_type_id_cd != '' ? data.fm_fleet_type_id_cd + this.separator + data.fm_fleet_type_id_descs :'' 
                this.M_FM_Fleet_Mobile.fm_fleet_brand_idLabel = this.M_FM_Fleet_Mobile.fm_fleet_brand_id_cd != null && this.M_FM_Fleet_Mobile.fm_fleet_brand_id_cd != '' ? data.fm_fleet_brand_id_cd + this.separator + data.fm_fleet_brand_id_descs :'' 
                this.M_FM_Fleet_Mobile.cm_staff_id_1Label = this.M_FM_Fleet_Mobile.cm_staff_id_1_cd != null && this.M_FM_Fleet_Mobile.cm_staff_id_1_cd != '' ? data.cm_staff_id_1_cd + this.separator + data.cm_staff_id_1_descs :'' 
                this.M_FM_Fleet_Mobile.cm_staff_id_2Label = this.M_FM_Fleet_Mobile.cm_staff_id_2_cd != null && this.M_FM_Fleet_Mobile.cm_staff_id_2_cd != '' ? data.cm_staff_id_2_cd + this.separator + data.cm_staff_id_2_descs :'' 
                this.M_FM_Fleet_Mobile.cm_staff_id_coLabel = this.M_FM_Fleet_Mobile.cm_staff_id_co_cd != null && this.M_FM_Fleet_Mobile.cm_staff_id_co_cd != '' ? data.cm_staff_id_co_cd + this.separator + data.cm_staff_id_co_descs :'' 
                this.M_FM_Fleet_Mobile.fm_fleet_status_idLabel = this.M_FM_Fleet_Mobile.fm_fleet_status_id_cd != null && this.M_FM_Fleet_Mobile.fm_fleet_status_id_cd != '' ? data.fm_fleet_status_id_cd + this.separator + data.fm_fleet_status_id_descs :'' 
                this.M_FM_Fleet_Mobile.fm_fuel_idLabel = this.M_FM_Fleet_Mobile.fm_fuel_id_cd != null && this.M_FM_Fleet_Mobile.fm_fuel_id_cd != '' ? data.fm_fuel_id_cd + this.separator + data.fm_fuel_id_descs :'' 
                this.M_FM_Fleet_Mobile.fm_pool_idLabel = this.M_FM_Fleet_Mobile.fm_pool_id_cd != null && this.M_FM_Fleet_Mobile.fm_pool_id_cd != '' ? data.fm_pool_id_cd + this.separator + data.fm_pool_id_descs :'' 
                this.M_FM_Fleet_Mobile.cm_contact_idLabel = this.M_FM_Fleet_Mobile.cm_contact_id_cd != null && this.M_FM_Fleet_Mobile.cm_contact_id_cd != '' ? data.cm_contact_id_cd + this.separator + data.cm_contact_id_descs :'' 


                this.editStatus = true
            })
        },
        onGoBack() {
            this.alertConfirmation("Are You Sure Want To Discard This Change?")
            .then(result => {
                if (result.value) {					
                    this.$router.go(-1)
                     
                    //this.$router.replace({ name: '{ListHeaderName}', params: { Option: this.ParamFromList.Option } })
                }
            })
        },
    },
    beforeCreate: function () {
    },
    created: function() {
    },
    beforeMount: function() {
    },
    mounted: function() {
        this.M_ClearForm()
        this.$store.commit('setFormType','List')
        const id = this.ParamFromList.fm_fleet_id
        const lastupdatestamp = this.ParamFromList.lastupdatestamp
        if ((id && id != '') && (lastupdatestamp && lastupdatestamp != '')) {
            for(var x = 0; x < this.ListTab.length; x++){
                this.ListTab[x].fm_fleet_id = id
            }
            this.getDataBy()
            if (this.ParamFromList.Option.edit_status == "1") {
                this.$store.commit('setStatus', 'new')
            }
            else {
                this.$store.commit('setStatus', 'view')
            }
        }
        else {
            this.$store.commit('setStatus', 'new')
            this.GetFMSpecification()            

            this.editStatus = false
        }
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
