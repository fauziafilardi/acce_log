<template>
    <div>
        <b-row>
            <b-col>
                <ABSButton
                    text="add"
                    icon="plus"
                    classButton="button button--new"
                    classIcon="icon-style-1"
                    @click="onAdd"
                    styleButton="width:100%"
                    v-show="isCanEdit"
                />
            </b-col>
        </b-row>


        <b-list-group style="padding-top: 10px;">
            <b-list-group-item @click="onDataClick(index)" v-for="(data, index) in DataListDetail" href="#" class="flex-column align-items-start" v-bind:key="index">
                <div style="
                      float: left;
                      margin: 0px 15px 0px 0px;
                    ">
                    <!-- <div class="container-ava">
                    <ABSAvatar :fullname="data.??" letter="2" size="54" />
                    <ABSAvatar image="url_link"  size="54" />
                    </div>   -->

                    <div class="container-status">
                      <div class="div-status" style="background-color: #555555;">
                         {{ data.mm_maintenance_mstr_id_descs }}
                      </div>
                    </div>

                    </div>

					<b-row>
                      <b-col>
                        <b-row>
                         <b-col md="5">
                           <p class="p-list" style="color: #2C9D05; font-size: 14px; ">
                              No: {{ data.maintenance_no && data.maintenance_no != '' ? data.maintenance_no : '-' }}
                           </p>
                         </b-col>
                         <b-col md="5">
                           <p class="p-list" style="color: #F50404; font-size: 14px; ">
                              Date {{ data.maintenance_date && data.maintenance_date != '' ? data.maintenance_date : '-' }}
                           </p>
                         </b-col>
                         <b-col md="5">
                           <p class="p-list" style="color: #0680FF; font-size: 14px; ">
                              Staff:  {{ data.cm_staff_id_descs && data.cm_staff_id_descs != '' ? data.cm_staff_id_descs : '-' }}
                           </p>
                         </b-col>
                         <b-col md="5">
                           <p class="p-list" style="color: #F99500; font-size: 14px; ">
                              Out: {{ data.estimate_out && data.estimate_out != '' ? data.estimate_out : '-' }}
                           </p>
                         </b-col>
                         <b-col md="5">
                           <p class="p-list" style="color: #555555; font-size: 14px; ">
                               {{ data.descs && data.descs != '' ? data.descs : '-' }}
                           </p>
                         </b-col>

                        </b-row>
                      </b-col>
                      <b-col md="1" class="center-delete-list" style="max-width:100% !important;">
                        <ABSButton
                          v-show="isCanEdit"
                          text="Delete"
                          icon="trash"
                          classButton="button button--delete"
                          classIcon="icon-style-1"
                          styleButton=""
                          @click="M_Delete(index)"
                        />
                      </b-col>
                    </b-row>
            </b-list-group-item>
        </b-list-group>

        <ABSModal id="Modal_FM_FleetMaintenance_Mobile" ref="Modal_FM_FleetMaintenance_Mobile" size="md" :okCancel="isCanEdit" :okOnly="!isCanEdit" @modalOkClicked="modalOk" @modalCancelClicked="modalCancel">
            <template slot="headerTitle"> Maintenance </template>
            <template slot="content">
                <b-row  style="padding-left: 10px; padding-bottom: 10px; !important;">
                    <b-col md="12" id="col-left" class="bColMasterForm">	
                        <b-form :data-vv-scope="'FormScope_' + this.PageLevel + '_' + this.TabIndex" :data-vv-value-path="'FormScope_' + this.PageLevel + '_' + this.TabIndex">
                            <b-row style="padding-left:10px;">
                                <b-col md="6" id="col-left">
                                  <b-row>
                                    <b-col md="12">
                                      <ABSProcessinputText :inputStatus="FormStatus" :prop="PI_maintenance_no" v-model="M_FM_FleetMaintenance_Mobile.maintenance_no"  ref="ref_maintenance_no"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSProcessInputSelectList :inputStatus="FormStatus" @change="Onmm_maintenance_mstr_idChange" :prop="PI_mm_maintenance_mstr_id" :value="M_FM_FleetMaintenance_Mobile.mm_maintenance_mstr_id" :label="M_FM_FleetMaintenance_Mobile.mm_maintenance_mstr_idLabel" ref="ref_mm_maintenance_mstr_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSProcessinputDate :inputStatus="FormStatus" @input="Onestimate_outChange" :prop="PI_estimate_out" v-model="M_FM_FleetMaintenance_Mobile.estimate_out"  ref="ref_estimate_out" />
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSProcessinputDate :inputStatus="FormStatus" @input="Onmaintenance_dateChange" :prop="PI_maintenance_date" v-model="M_FM_FleetMaintenance_Mobile.maintenance_date"  ref="ref_maintenance_date" />
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSProcessInputSelectList :inputStatus="FormStatus" @change="Oncm_staff_idChange" :prop="PI_cm_staff_id" :value="M_FM_FleetMaintenance_Mobile.cm_staff_id" :label="M_FM_FleetMaintenance_Mobile.cm_staff_idLabel" ref="ref_cm_staff_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSProcessinputText :inputStatus="FormStatus" :prop="PI_descs" v-model="M_FM_FleetMaintenance_Mobile.descs"  ref="ref_descs"/>
                                    </b-col>
                                  </b-row>
                                </b-col>
                                <b-col md="6" id="col-left">
                                  <b-row>
                                    <b-col md="12">
                                      <ABSProcessInputSelectList :inputStatus="FormStatus" @change="Onfm_fleet_status_idChange" :prop="PI_fm_fleet_status_id" :value="M_FM_FleetMaintenance_Mobile.fm_fleet_status_id" :label="M_FM_FleetMaintenance_Mobile.fm_fleet_status_idLabel" ref="ref_fm_fleet_status_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSProcessinputDate :inputStatus="FormStatus" @input="Onin_dateChange" :prop="PI_in_date" v-model="M_FM_FleetMaintenance_Mobile.in_date"  ref="ref_in_date" />
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSProcessinputDate :inputStatus="FormStatus" @input="Onout_dateChange" :prop="PI_out_date" v-model="M_FM_FleetMaintenance_Mobile.out_date"  ref="ref_out_date" />
                                    </b-col>
                                  </b-row>
                                </b-col>

                            </b-row>
                        </b-form>
                    </b-col>
                </b-row>
            </template>
        </ABSModal>
    </div>
</template>
<script>
export default {
    props: {PageLevel: '', TabIndex: '', data: ''},
    data() {
        return {
            DataListDetail: [],
            currentPage: 1,
            perPage: 10,
            sort: 'time_edit DESC',
            sourceField: '',
            paramView: '',
            search: '',
            
            editStatus: false,
            addStatus: false,
            FormStatus: 'new',
            DataForDelete: [],
            
            FormType: "List",
            Module: "FM",
            OptionUrl: "FM_Fleet_Mobile",
            M_FM_FleetMaintenance_Mobile: {
              fm_fleet_id: 0,
              fm_fleet_license_id: 0,
              fleet_license_no: '',
              subportfolio_cd: '',
              fm_license_type_id: 0,
              fm_license_type_id_cd: '',
              fm_license_type_id_descs: '',
              expired_date: '',
              cost: 0.00,
              cm_city_id: 0,
              cm_city_id_cd: '',
              cm_city_id_descs: '',
              remarks: '',
              row_id: '',
              lastupdatestamp: '',
              time_edit: '',
              user_input: '',
              user_edit: '',
              fm_fleet_accessories_id: 0,
              subportfolio_cd: '',
              fm_fleet_id: 0,
              fm_accessories_id: 0,
              fm_accessories_id_cd: '',
              fm_accessories_id_descs: '',
              accessories_date: '',
              status: '',
              descs: '',
              row_id: '',
              lastupdatestamp: '',
              time_edit: '',
              user_input: '',
              user_edit: '',
              fm_fleet_maintenance_id: 0,
              subportfolio_cd: '',
              mm_maintenance_mstr_id: 0,
              mm_maintenance_mstr_id_cd: '',
              mm_maintenance_mstr_id_descs: '',
              maintenance_no: '',
              maintenance_date: '',
              fm_fleet_id: 0,
              in_date: '',
              out_date: '',
              estimate_out: '',
              fm_fleet_status_id: 0,
              fm_fleet_status_id_cd: '',
              fm_fleet_status_id_descs: '',
              cm_staff_id: 0,
              cm_staff_id_cd: '',
              cm_staff_id_descs: '',
              descs: '',
              row_id: '',
              lastupdatestamp: '',
              time_edit: '',
              user_input: '',
              user_edit: '',
            },
            PI_maintenance_no: { 
                cValidate :'required|max:60', 
                cName: 'maintenance_no', 
                cLabel: 'Maintenance No', 
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

            PI_mm_maintenance_mstr_id: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupMMMaintenance'    , 
                    ColumnDB: 'maintenance_type'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'maintenance_type,descs' 
                        }, 
                cValidate :'', 
                cName: 'mm_maintenance_mstr_id', 
                cLabel: 'Maintenance Type', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 2, 
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
                cDisplayColumn: 'maintenance_type,descs' ,
            }, 

            PI_estimate_out: { 
                cValidate :'', 
                cName: 'estimate_out', 
                cLabel: 'Estimate Out', 
                cLabelSize: 4, 
                cOrder: 3, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
            }, 

            PI_maintenance_date: { 
                cValidate :'required', 
                cName: 'maintenance_date', 
                cLabel: 'Date', 
                cLabelSize: 4, 
                cOrder: 3, 
                cKey: true, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
            }, 

            PI_cm_staff_id: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupFMStaffMaster'    , 
                    ColumnDB: 'staff_no'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'staff_no,name' 
                        }, 
                cValidate :'', 
                cName: 'cm_staff_id', 
                cLabel: 'Staff', 
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
                cMasterUrl: '' ,
                cDisplayColumn: 'staff_no,name' ,
            }, 

            PI_descs: { 
                cValidate :'max:150', 
                cName: 'descs', 
                cLabel: 'Description', 
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
                cOrder: 7, 
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

            PI_in_date: { 
                cValidate :'required', 
                cName: 'in_date', 
                cLabel: 'In Date', 
                cLabelSize: 4, 
                cOrder: 8, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
            }, 

            PI_out_date: { 
                cValidate :'', 
                cName: 'out_date', 
                cLabel: 'Out Date', 
                cLabelSize: 4, 
                cOrder: 9, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
            }, 


        }
    },
    computed: {
        ListOption() {
            return this.$parent.$parent.$parent.$parent.$parent.ParamFromList.Option
        },
        isCanAdd() {
            var canadd = this.ListOption ? (this.ListOption.add_status == "1") : true
            return canadd
        },
        isCanDelete() {
            var candelete = this.ListOption ? (this.ListOption.delete_status == "1") : true
            return candelete
        },
        isCanEdit() {
            var canedit = this.ListOption ? (this.ListOption.edit_status == "1") : true
            if (canedit == true) {
                this.FormStatus = 'new'
            }
            else {
                this.FormStatus = 'view'
            }
            return canedit
        }
    },
    methods: {
        isDisableTable(){
        },
        hideCheckboxAndGear(){
        },
        Onmm_maintenance_mstr_idChange (data) {
          this.$nextTick(() => {
            this.M_FM_FleetMaintenance_Mobile.mm_maintenance_mstr_id = data.id
            this.M_FM_FleetMaintenance_Mobile.mm_maintenance_mstr_idLabel = data.label
            this.M_FM_FleetMaintenance_Mobile.maintenance_type = data.maintenance_type
            this.M_FM_FleetMaintenance_Mobile.descs = data.descs
            if (this.inputStatus != "VIEW") {
              //{mm_maintenance_mstr_id}
            }
          })
          this.$forceUpdate()
        },
        Onestimate_outChange (data) {
          this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              //{estimate_out}
            }
          })
          this.$forceUpdate()
        },
        Onmaintenance_dateChange (data) {
          this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              //{maintenance_date}
            }
          })
          this.$forceUpdate()
        },
        Oncm_staff_idChange (data) {
          this.$nextTick(() => {
            this.M_FM_FleetMaintenance_Mobile.cm_staff_id = data.id
            this.M_FM_FleetMaintenance_Mobile.cm_staff_idLabel = data.label
            this.M_FM_FleetMaintenance_Mobile.staff_no = data.staff_no
            this.M_FM_FleetMaintenance_Mobile.name = data.name
            if (this.inputStatus != "VIEW") {
              //{cm_staff_id}
            }
          })
          this.$forceUpdate()
        },
        Onfm_fleet_status_idChange (data) {
          this.$nextTick(() => {
            this.M_FM_FleetMaintenance_Mobile.fm_fleet_status_id = data.id
            this.M_FM_FleetMaintenance_Mobile.fm_fleet_status_idLabel = data.label
            this.M_FM_FleetMaintenance_Mobile.status_cd = data.status_cd
            this.M_FM_FleetMaintenance_Mobile.descs = data.descs
            if (this.inputStatus != "VIEW") {
              //{fm_fleet_status_id}
            }
          })
          this.$forceUpdate()
        },
        Onin_dateChange (data) {
          this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              //{in_date}
            }
          })
          this.$forceUpdate()
        },
        Onout_dateChange (data) {
          this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              //{out_date}
            }
          })
          this.$forceUpdate()
        },

        modalOk(){
            if (this.isCanEdit == false) {
                this.$refs.Modal_FM_FleetMaintenance_Mobile._hide()
                return
            }

            var scopeForm = 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            this.$validator._base.validateAll(scopeForm).then((result) => {
                if (!result) return
                if (this.editStatus) {
                    if (this.addStatus == true) {
                        this.DataListDetail.push({
                          fm_fleet_maintenance_id: this.M_FM_FleetMaintenance_Mobile.fm_fleet_maintenance_id,
                          subportfolio_cd: this.M_FM_FleetMaintenance_Mobile.subportfolio_cd,
                          mm_maintenance_mstr_id: this.M_FM_FleetMaintenance_Mobile.mm_maintenance_mstr_id,
                          mm_maintenance_mstr_id_cd: this.M_FM_FleetMaintenance_Mobile.mm_maintenance_mstr_id_cd,
                          mm_maintenance_mstr_id_descs: this.M_FM_FleetMaintenance_Mobile.mm_maintenance_mstr_id_descs,
                          maintenance_no: this.M_FM_FleetMaintenance_Mobile.maintenance_no,
                          maintenance_date: this.M_FM_FleetMaintenance_Mobile.maintenance_date,
                          fm_fleet_id: this.M_FM_FleetMaintenance_Mobile.fm_fleet_id,
                          in_date: this.M_FM_FleetMaintenance_Mobile.in_date,
                          out_date: this.M_FM_FleetMaintenance_Mobile.out_date,
                          estimate_out: this.M_FM_FleetMaintenance_Mobile.estimate_out,
                          fm_fleet_status_id: this.M_FM_FleetMaintenance_Mobile.fm_fleet_status_id,
                          fm_fleet_status_id_cd: this.M_FM_FleetMaintenance_Mobile.fm_fleet_status_id_cd,
                          fm_fleet_status_id_descs: this.M_FM_FleetMaintenance_Mobile.fm_fleet_status_id_descs,
                          cm_staff_id: this.M_FM_FleetMaintenance_Mobile.cm_staff_id,
                          cm_staff_id_cd: this.M_FM_FleetMaintenance_Mobile.cm_staff_id_cd,
                          cm_staff_id_descs: this.M_FM_FleetMaintenance_Mobile.cm_staff_id_descs,
                          descs: this.M_FM_FleetMaintenance_Mobile.descs,
                          lastupdatestamp: null,
                          time_edit: this.M_FM_FleetMaintenance_Mobile.time_edit,
                          user_input: this.M_FM_FleetMaintenance_Mobile.user_input,
                          user_edit: this.M_FM_FleetMaintenance_Mobile.user_edit,
                          _METHOD_: "NEW",
                          fm_fleet_id: this.data.fm_fleet_id,

                        })
                    }
                    else {
                        this.DataListDetail[this.M_FM_FleetMaintenance_Mobile.index].fm_fleet_maintenance_id
                        this.DataListDetail[this.M_FM_FleetMaintenance_Mobile.index].subportfolio_cd
                        this.DataListDetail[this.M_FM_FleetMaintenance_Mobile.index].mm_maintenance_mstr_id
                        this.DataListDetail[this.M_FM_FleetMaintenance_Mobile.index].mm_maintenance_mstr_id_cd
                        this.DataListDetail[this.M_FM_FleetMaintenance_Mobile.index].mm_maintenance_mstr_id_descs
                        this.DataListDetail[this.M_FM_FleetMaintenance_Mobile.index].maintenance_no
                        this.DataListDetail[this.M_FM_FleetMaintenance_Mobile.index].maintenance_date
                        this.DataListDetail[this.M_FM_FleetMaintenance_Mobile.index].fm_fleet_id
                        this.DataListDetail[this.M_FM_FleetMaintenance_Mobile.index].in_date
                        this.DataListDetail[this.M_FM_FleetMaintenance_Mobile.index].out_date
                        this.DataListDetail[this.M_FM_FleetMaintenance_Mobile.index].estimate_out
                        this.DataListDetail[this.M_FM_FleetMaintenance_Mobile.index].fm_fleet_status_id
                        this.DataListDetail[this.M_FM_FleetMaintenance_Mobile.index].fm_fleet_status_id_cd
                        this.DataListDetail[this.M_FM_FleetMaintenance_Mobile.index].fm_fleet_status_id_descs
                        this.DataListDetail[this.M_FM_FleetMaintenance_Mobile.index].cm_staff_id
                        this.DataListDetail[this.M_FM_FleetMaintenance_Mobile.index].cm_staff_id_cd
                        this.DataListDetail[this.M_FM_FleetMaintenance_Mobile.index].cm_staff_id_descs
                        this.DataListDetail[this.M_FM_FleetMaintenance_Mobile.index].descs
                        this.DataListDetail[this.M_FM_FleetMaintenance_Mobile.index].time_edit
                        this.DataListDetail[this.M_FM_FleetMaintenance_Mobile.index].user_input
                        this.DataListDetail[this.M_FM_FleetMaintenance_Mobile.index].user_edit
                        this.DataListDetail[this.M_FM_FleetMaintenance_Mobile.index].mm_maintenance_mstr_idLabel
                        this.DataListDetail[this.M_FM_FleetMaintenance_Mobile.index].cm_staff_idLabel
                        this.DataListDetail[this.M_FM_FleetMaintenance_Mobile.index].fm_fleet_status_idLabel

                    }
                }
                else {
                    this.DataListDetail.push({
                          fm_fleet_maintenance_id: this.M_FM_FleetMaintenance_Mobile.fm_fleet_maintenance_id,
                          subportfolio_cd: this.M_FM_FleetMaintenance_Mobile.subportfolio_cd,
                          mm_maintenance_mstr_id: this.M_FM_FleetMaintenance_Mobile.mm_maintenance_mstr_id,
                          mm_maintenance_mstr_id_cd: this.M_FM_FleetMaintenance_Mobile.mm_maintenance_mstr_id_cd,
                          mm_maintenance_mstr_id_descs: this.M_FM_FleetMaintenance_Mobile.mm_maintenance_mstr_id_descs,
                          maintenance_no: this.M_FM_FleetMaintenance_Mobile.maintenance_no,
                          maintenance_date: this.M_FM_FleetMaintenance_Mobile.maintenance_date,
                          fm_fleet_id: this.M_FM_FleetMaintenance_Mobile.fm_fleet_id,
                          in_date: this.M_FM_FleetMaintenance_Mobile.in_date,
                          out_date: this.M_FM_FleetMaintenance_Mobile.out_date,
                          estimate_out: this.M_FM_FleetMaintenance_Mobile.estimate_out,
                          fm_fleet_status_id: this.M_FM_FleetMaintenance_Mobile.fm_fleet_status_id,
                          fm_fleet_status_id_cd: this.M_FM_FleetMaintenance_Mobile.fm_fleet_status_id_cd,
                          fm_fleet_status_id_descs: this.M_FM_FleetMaintenance_Mobile.fm_fleet_status_id_descs,
                          cm_staff_id: this.M_FM_FleetMaintenance_Mobile.cm_staff_id,
                          cm_staff_id_cd: this.M_FM_FleetMaintenance_Mobile.cm_staff_id_cd,
                          cm_staff_id_descs: this.M_FM_FleetMaintenance_Mobile.cm_staff_id_descs,
                          descs: this.M_FM_FleetMaintenance_Mobile.descs,
                          lastupdatestamp: null,
                          time_edit: this.M_FM_FleetMaintenance_Mobile.time_edit,
                          user_input: this.M_FM_FleetMaintenance_Mobile.user_input,
                          user_edit: this.M_FM_FleetMaintenance_Mobile.user_edit,
                          _METHOD_: "NEW",

                    })
                }

                this.M_ClearForm()
                this.$refs.Modal_FM_FleetMaintenance_Mobile._hide()
                this.addStatus = false
            })
        },
        modalCancel(){},
        onAdd(){
            this.addStatus = true
            this.M_ClearForm()
            this.$refs.Modal_FM_FleetMaintenance_Mobile._show()
        },
        M_ClearForm(){
            this.M_FM_FleetMaintenance_Mobile = {
              fm_fleet_id: 0,
              fm_fleet_license_id: 0,
              fleet_license_no: '',
              subportfolio_cd: '',
              fm_license_type_id: 0,
              fm_license_type_id_cd: '',
              fm_license_type_id_descs: '',
              expired_date: '',
              cost: 0.00,
              cm_city_id: 0,
              cm_city_id_cd: '',
              cm_city_id_descs: '',
              remarks: '',
              row_id: '',
              lastupdatestamp: '',
              time_edit: '',
              user_input: '',
              user_edit: '',
              fm_fleet_accessories_id: 0,
              subportfolio_cd: '',
              fm_fleet_id: 0,
              fm_accessories_id: 0,
              fm_accessories_id_cd: '',
              fm_accessories_id_descs: '',
              accessories_date: '',
              status: '',
              descs: '',
              row_id: '',
              lastupdatestamp: '',
              time_edit: '',
              user_input: '',
              user_edit: '',
              fm_fleet_maintenance_id: 0,
              subportfolio_cd: '',
              mm_maintenance_mstr_id: 0,
              mm_maintenance_mstr_id_cd: '',
              mm_maintenance_mstr_id_descs: '',
              maintenance_no: '',
              maintenance_date: '',
              fm_fleet_id: 0,
              in_date: '',
              out_date: '',
              estimate_out: '',
              fm_fleet_status_id: 0,
              fm_fleet_status_id_cd: '',
              fm_fleet_status_id_descs: '',
              cm_staff_id: 0,
              cm_staff_id_cd: '',
              cm_staff_id_descs: '',
              descs: '',
              row_id: '',
              lastupdatestamp: '',
              time_edit: '',
              user_input: '',
              user_edit: '',
            }

            this.$refs.ref_maintenance_no.clearValidator()
            this.$refs.ref_mm_maintenance_mstr_id.clearValidator()
            this.$refs.ref_estimate_out.clearValidator()
            this.$refs.ref_maintenance_date.clearValidator()
            this.$refs.ref_cm_staff_id.clearValidator()
            this.$refs.ref_descs.clearValidator()
            this.$refs.ref_fm_fleet_status_id.clearValidator()
            this.$refs.ref_in_date.clearValidator()
            this.$refs.ref_out_date.clearValidator()

        },
        doGetList(search = "") {
            var param = {
                OptionUrl: this.OptionUrl,
                LineNo: 3,
                user_id: this.getDataUser().user_id,
                portfolio_cd: this.getDataUser().portfolio_cd,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                CurrentPage: this.currentPage,
                PerPage: this.perPage,
                ParamWhere: search,
                InitialWhere: "fm_fleet_id = " + this.data.fm_fleet_id,
                SortField: this.sort,
                SourceField: this.sourceField,
                ParamView: this.paramView
            };

            var url = this.getUrlV2(this.getUrlList())

            this.postJSON(url, param).then(response => {
                this.$store.commit('setStatusLoader', false)
                if (response == null) return;
                this.DataListDetail = response.Data
                this.editStatus = true
            })
        },
        onDataClick(index) {
            if (this.editStatus == true) {
                if (this.DataListDetail[index].hasOwnProperty("_METHOD_")) {
                    if (this.DataListDetail[index]['_METHOD_'] == 'NEW') {
                        var data = this.DataListDetail[index]
                        this.M_FM_FleetMaintenance_Mobile = {
                          fm_fleet_maintenance_id:  data.fm_fleet_maintenance_id,
                          subportfolio_cd:  data.subportfolio_cd,
                          mm_maintenance_mstr_id:  data.mm_maintenance_mstr_id,
                          mm_maintenance_mstr_id_cd:  data.mm_maintenance_mstr_id_cd,
                          mm_maintenance_mstr_id_descs:  data.mm_maintenance_mstr_id_descs,
                          maintenance_no:  data.maintenance_no,
                          maintenance_date: this.momentDateFormatting( data.maintenance_date, 'YYYY-MM-DD'),
                          fm_fleet_id:  data.fm_fleet_id,
                          in_date: this.momentDateFormatting( data.in_date, 'YYYY-MM-DD'),
                          out_date: this.momentDateFormatting( data.out_date, 'YYYY-MM-DD'),
                          estimate_out: this.momentDateFormatting( data.estimate_out, 'YYYY-MM-DD'),
                          fm_fleet_status_id:  data.fm_fleet_status_id,
                          fm_fleet_status_id_cd:  data.fm_fleet_status_id_cd,
                          fm_fleet_status_id_descs:  data.fm_fleet_status_id_descs,
                          cm_staff_id:  data.cm_staff_id,
                          cm_staff_id_cd:  data.cm_staff_id_cd,
                          cm_staff_id_descs:  data.cm_staff_id_descs,
                          descs:  data.descs,
                          row_id: null,
                          lastupdatestamp: null,
                          time_edit:  data.time_edit,
                          user_input:  data.user_input,
                          user_edit:  data.user_edit,
                          index: index,
                        }

                        this.M_FM_FleetMaintenance_Mobile.mm_maintenance_mstr_idLabel = data.mm_maintenance_mstr_idLabel 
                        this.M_FM_FleetMaintenance_Mobile.cm_staff_idLabel = data.cm_staff_idLabel 
                        this.M_FM_FleetMaintenance_Mobile.fm_fleet_status_idLabel = data.fm_fleet_status_idLabel 

						this.$refs.Modal_FM_FleetMaintenance_Mobile._show()
                    }
                }
                else {
                    var param = {
                        OptionUrl: this.OptionUrl,
                        LineNo: 3,
                        fm_fleet_maintenance_id: this.DataListDetail[index].row_id,

                    }

                    var url = this.getUrlV2(this.getUrlById())

                    this.postJSON( url, param )
                    .then(response => {
                        if(response == null) return
                        
                        var data = response.Data[0]
                        
                        this.M_FM_FleetMaintenance_Mobile = {
                          fm_fleet_maintenance_id:  data.fm_fleet_maintenance_id,
                          subportfolio_cd:  data.subportfolio_cd,
                          mm_maintenance_mstr_id:  data.mm_maintenance_mstr_id,
                          mm_maintenance_mstr_id_cd:  data.mm_maintenance_mstr_id_cd,
                          mm_maintenance_mstr_id_descs:  data.mm_maintenance_mstr_id_descs,
                          maintenance_no:  data.maintenance_no,
                          maintenance_date: this.momentDateFormatting( data.maintenance_date, 'YYYY-MM-DD'),
                          fm_fleet_id:  data.fm_fleet_id,
                          in_date: this.momentDateFormatting( data.in_date, 'YYYY-MM-DD'),
                          out_date: this.momentDateFormatting( data.out_date, 'YYYY-MM-DD'),
                          estimate_out: this.momentDateFormatting( data.estimate_out, 'YYYY-MM-DD'),
                          fm_fleet_status_id:  data.fm_fleet_status_id,
                          fm_fleet_status_id_cd:  data.fm_fleet_status_id_cd,
                          fm_fleet_status_id_descs:  data.fm_fleet_status_id_descs,
                          cm_staff_id:  data.cm_staff_id,
                          cm_staff_id_cd:  data.cm_staff_id_cd,
                          cm_staff_id_descs:  data.cm_staff_id_descs,
                          descs:  data.descs,
                          row_id:  data.row_id,
                          lastupdatestamp:  this.DataListDetail[index].lastupdatestamp,
                          time_edit:  data.time_edit,
                          user_input:  data.user_input,
                          user_edit:  data.user_edit,
                          index: index,
                        }

                        this.M_FM_FleetMaintenance_Mobile.mm_maintenance_mstr_idLabel = this.M_FM_FleetMaintenance_Mobile.mm_maintenance_mstr_id_cd != null && this.M_FM_FleetMaintenance_Mobile.mm_maintenance_mstr_id_cd != '' ? data.mm_maintenance_mstr_id_cd + this.separator + data.mm_maintenance_mstr_id_descs :'' 
                        this.M_FM_FleetMaintenance_Mobile.cm_staff_idLabel = this.M_FM_FleetMaintenance_Mobile.cm_staff_id_cd != null && this.M_FM_FleetMaintenance_Mobile.cm_staff_id_cd != '' ? data.cm_staff_id_cd + this.separator + data.cm_staff_id_descs :'' 
                        this.M_FM_FleetMaintenance_Mobile.fm_fleet_status_idLabel = this.M_FM_FleetMaintenance_Mobile.fm_fleet_status_id_cd != null && this.M_FM_FleetMaintenance_Mobile.fm_fleet_status_id_cd != '' ? data.fm_fleet_status_id_cd + this.separator + data.fm_fleet_status_id_descs :'' 

						this.$refs.Modal_FM_FleetMaintenance_Mobile._show()
                    })
                }
            }
            else {
                var data = this.DataListDetail[index]
                        this.M_FM_FleetMaintenance_Mobile = {
                          fm_fleet_maintenance_id:  data.fm_fleet_maintenance_id,
                          subportfolio_cd:  data.subportfolio_cd,
                          mm_maintenance_mstr_id:  data.mm_maintenance_mstr_id,
                          mm_maintenance_mstr_id_cd:  data.mm_maintenance_mstr_id_cd,
                          mm_maintenance_mstr_id_descs:  data.mm_maintenance_mstr_id_descs,
                          maintenance_no:  data.maintenance_no,
                          maintenance_date: this.momentDateFormatting( data.maintenance_date, 'YYYY-MM-DD'),
                          fm_fleet_id:  data.fm_fleet_id,
                          in_date: this.momentDateFormatting( data.in_date, 'YYYY-MM-DD'),
                          out_date: this.momentDateFormatting( data.out_date, 'YYYY-MM-DD'),
                          estimate_out: this.momentDateFormatting( data.estimate_out, 'YYYY-MM-DD'),
                          fm_fleet_status_id:  data.fm_fleet_status_id,
                          fm_fleet_status_id_cd:  data.fm_fleet_status_id_cd,
                          fm_fleet_status_id_descs:  data.fm_fleet_status_id_descs,
                          cm_staff_id:  data.cm_staff_id,
                          cm_staff_id_cd:  data.cm_staff_id_cd,
                          cm_staff_id_descs:  data.cm_staff_id_descs,
                          descs:  data.descs,
                          row_id: null,
                          lastupdatestamp: null,
                          time_edit:  data.time_edit,
                          user_input:  data.user_input,
                          user_edit:  data.user_edit,
                          index: index,
                        }

                        this.M_FM_FleetMaintenance_Mobile.mm_maintenance_mstr_idLabel = data.mm_maintenance_mstr_idLabel 
                        this.M_FM_FleetMaintenance_Mobile.cm_staff_idLabel = data.cm_staff_idLabel 
                        this.M_FM_FleetMaintenance_Mobile.fm_fleet_status_idLabel = data.fm_fleet_status_idLabel 

                this.$refs.Modal_FM_FleetMaintenance_Mobile._show()
            }
        },
        M_DeleteDetail(index) {
            this.alertConfirmation("Are You Sure Want To Delete This Data ?")
            .then(ress => {
                if (ress.value) {
                    if (this.editStatus == true) {
                        var data = this.DataListDetail[index]
                        if (data.hasOwnProperty('row_id') && data.hasOwnProperty('lastupdatestamp')) {
                            this.DataForDelete.push({
                                row_id: data.row_id,
                                lastupdatestamp: data.lastupdatestamp
                            })

                            var dataTemp = this.DataListDetail
                            dataTemp.splice(index, 1)
                            this.DataListDetail = [... new Set(dataTemp)]
                            this.alertSuccess("Delete Data Has Been Successfully")
                        }
                        else {
                            var dataTemp = this.DataListDetail
                            dataTemp.splice(index, 1)
                            this.DataListDetail = [... new Set(dataTemp)]
                            this.alertSuccess("Delete Data Has Been Successfully")
                        }
                    }
                    else {
                        var dataTemp = this.DataListDetail
                        dataTemp.splice(index, 1)
                        this.DataListDetail = [... new Set(dataTemp)]
                        this.alertSuccess("Delete Data Has Been Successfully")
                    }
                }
            })
        }
    },
    mounted() {
        if (this.data.fm_fleet_id && this.data.fm_fleet_id != '') {
            this.$store.commit('setStatusLoader', true)
            this.doGetList()
            this.editStatus = true
        }
        else {
            this.editStatus = false
        }
    }
}
</script>
