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
                      <div class="div-status" style="background-color: #2C9D05;">
                         {{ data.fm_license_type_id_descs }}
                      </div>
                    </div>

                    </div>

					<b-row>
                      <b-col>
                        <b-row>
                         <b-col md="5">
                           <p class="p-list" style="color: #F50404; font-size: 14px; ">
                               {{ data.fleet_license_no && data.fleet_license_no != '' ? data.fleet_license_no : '-' }}
                           </p>
                         </b-col>
                         <b-col md="5">
                           <p class="p-list" style="color: #F99500; font-size: 14px; ">
                               {{ data.expired_date && data.expired_date != '' ? data.expired_date : '-' }}
                           </p>
                         </b-col>
                         <b-col md="5">
                           <p class="p-list" style="color: #2C9D05; font-size: 14px; ">
                               {{ data.cm_city_id_descs && data.cm_city_id_descs != '' ? data.cm_city_id_descs : '-' }}
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

        <ABSModal id="Modal_FM_FleetLicense_Mobile" ref="Modal_FM_FleetLicense_Mobile" size="md" :okCancel="isCanEdit" :okOnly="!isCanEdit" @modalOkClicked="modalOk" @modalCancelClicked="modalCancel">
            <template slot="headerTitle"> License </template>
            <template slot="content">
                <b-row  style="padding-left: 10px; padding-bottom: 10px; !important;">
                    <b-col md="12" id="col-left" class="bColMasterForm">	
                        <b-form :data-vv-scope="'FormScope_' + this.PageLevel + '_' + this.TabIndex" :data-vv-value-path="'FormScope_' + this.PageLevel + '_' + this.TabIndex">
                            <b-row style="padding-left:10px;">
                                <b-col md="6" id="col-left">
                                  <b-row>
                                    <b-col md="12">
                                      <ABSProcessinputText :inputStatus="FormStatus" :prop="PI_fleet_license_no" v-model="M_FM_FleetLicense_Mobile.fleet_license_no"  ref="ref_fleet_license_no"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSProcessInputSelectList :inputStatus="FormStatus" @change="Onfm_license_type_idChange" :prop="PI_fm_license_type_id" :value="M_FM_FleetLicense_Mobile.fm_license_type_id" :label="M_FM_FleetLicense_Mobile.fm_license_type_idLabel" ref="ref_fm_license_type_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSProcessinputDate :inputStatus="FormStatus" @input="Onexpired_dateChange" :prop="PI_expired_date" v-model="M_FM_FleetLicense_Mobile.expired_date"  ref="ref_expired_date" />
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSProcessinputText :inputStatus="FormStatus" :prop="PI_cost" v-model="M_FM_FleetLicense_Mobile.cost"  ref="ref_cost"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSProcessInputSelectList :inputStatus="FormStatus" @change="Oncm_city_idChange" :prop="PI_cm_city_id" :value="M_FM_FleetLicense_Mobile.cm_city_id" :label="M_FM_FleetLicense_Mobile.cm_city_idLabel" ref="ref_cm_city_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSProcessinputText :inputStatus="FormStatus" :prop="PI_remarks" v-model="M_FM_FleetLicense_Mobile.remarks"  ref="ref_remarks"/>
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
            M_FM_FleetLicense_Mobile: {
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
            },
            PI_fleet_license_no: { 
                cValidate :'required|max:60', 
                cName: 'fleet_license_no', 
                cLabel: 'License No', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'text',
                cVisible: true, 
                cDefault: '', 
                cProtect: false, 
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
            }, 

            PI_fm_license_type_id: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupFMLicenseType'    , 
                    ColumnDB: 'license_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'license_cd,descs' 
                        }, 
                cValidate :'required', 
                cName: 'fm_license_type_id', 
                cLabel: 'License Type', 
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
                cDisplayColumn: 'license_cd,descs' ,
            }, 

            PI_expired_date: { 
                cValidate :'', 
                cName: 'expired_date', 
                cLabel: 'Expired Date', 
                cLabelSize: 4, 
                cOrder: 3, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
            }, 

            PI_cost: { 
                cValidate :'', 
                cName: 'cost', 
                cLabel: 'Cost', 
                cLabelSize: 4, 
                cOrder: 4, 
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

            PI_cm_city_id: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMCity'    , 
                    ColumnDB: 'city_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'city_cd,descs' 
                        }, 
                cValidate :'', 
                cName: 'cm_city_id', 
                cLabel: 'City', 
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
                cDisplayColumn: 'city_cd,descs' ,
            }, 

            PI_remarks: { 
                cValidate :'', 
                cName: 'remarks', 
                cLabel: 'Remakrs', 
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
        Onfm_license_type_idChange (data) {
          this.$nextTick(() => {
            this.M_FM_FleetLicense_Mobile.fm_license_type_id = data.id
            this.M_FM_FleetLicense_Mobile.fm_license_type_idLabel = data.label
            this.M_FM_FleetLicense_Mobile.fm_license_type_id_cd = data.license_cd
            this.M_FM_FleetLicense_Mobile.fm_license_type_id_descs = data.descs
            if (this.inputStatus != "VIEW") {
              //{fm_license_type_id}
            }
          })
          this.$forceUpdate()
        },
        Onexpired_dateChange (data) {
          this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              //{expired_date}
            }
          })
          this.$forceUpdate()
        },
        Oncm_city_idChange (data) {
          this.$nextTick(() => {
            this.M_FM_FleetLicense_Mobile.cm_city_id = data.id
            this.M_FM_FleetLicense_Mobile.cm_city_idLabel = data.label
            this.M_FM_FleetLicense_Mobile.cm_city_id_cd = data.city_cd
            this.M_FM_FleetLicense_Mobile.cm_city_id_descs = data.descs
            if (this.inputStatus != "VIEW") {
              //{cm_city_id}
            }
          })
          this.$forceUpdate()
        },

        modalOk(){
            if (this.isCanEdit == false) {
                this.$refs.Modal_FM_FleetLicense_Mobile._hide()
                return
            }

            var scopeForm = 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            this.$validator._base.validateAll(scopeForm).then((result) => {
                if (!result) return
                if (this.editStatus) {
                    if (this.addStatus == true) {
                        this.DataListDetail.push({
                          fm_fleet_id: this.M_FM_FleetLicense_Mobile.fm_fleet_id,
                          fm_fleet_license_id: this.M_FM_FleetLicense_Mobile.fm_fleet_license_id,
                          fleet_license_no: this.M_FM_FleetLicense_Mobile.fleet_license_no,
                          subportfolio_cd: this.M_FM_FleetLicense_Mobile.subportfolio_cd,
                          fm_license_type_id: this.M_FM_FleetLicense_Mobile.fm_license_type_id,
                          fm_license_type_id_cd: this.M_FM_FleetLicense_Mobile.fm_license_type_id_cd,
                          fm_license_type_id_descs: this.M_FM_FleetLicense_Mobile.fm_license_type_id_descs,
                          expired_date: this.M_FM_FleetLicense_Mobile.expired_date,
                          cost: this.M_FM_FleetLicense_Mobile.cost,
                          cm_city_id: this.M_FM_FleetLicense_Mobile.cm_city_id,
                          cm_city_id_cd: this.M_FM_FleetLicense_Mobile.cm_city_id_cd,
                          cm_city_id_descs: this.M_FM_FleetLicense_Mobile.cm_city_id_descs,
                          remarks: this.M_FM_FleetLicense_Mobile.remarks,
                          lastupdatestamp: null,
                          time_edit: this.M_FM_FleetLicense_Mobile.time_edit,
                          user_input: this.M_FM_FleetLicense_Mobile.user_input,
                          user_edit: this.M_FM_FleetLicense_Mobile.user_edit,
                          _METHOD_: "NEW",
                          fm_fleet_id: this.data.fm_fleet_id,

                        })
                    }
                    else {
                        this.DataListDetail[this.M_FM_FleetLicense_Mobile.index].fm_fleet_id = this.M_FM_FleetLicense_Mobile.fm_fleet_id
                        this.DataListDetail[this.M_FM_FleetLicense_Mobile.index].fm_fleet_license_id = this.M_FM_FleetLicense_Mobile.fm_fleet_license_id
                        this.DataListDetail[this.M_FM_FleetLicense_Mobile.index].fleet_license_no = this.M_FM_FleetLicense_Mobile.fleet_license_no
                        this.DataListDetail[this.M_FM_FleetLicense_Mobile.index].subportfolio_cd = this.M_FM_FleetLicense_Mobile.subportfolio_cd
                        this.DataListDetail[this.M_FM_FleetLicense_Mobile.index].fm_license_type_id = this.M_FM_FleetLicense_Mobile.fm_license_type_id
                        this.DataListDetail[this.M_FM_FleetLicense_Mobile.index].fm_license_type_id_cd = this.M_FM_FleetLicense_Mobile.fm_license_type_id_cd
                        this.DataListDetail[this.M_FM_FleetLicense_Mobile.index].fm_license_type_id_descs = this.M_FM_FleetLicense_Mobile.fm_license_type_id_descs
                        this.DataListDetail[this.M_FM_FleetLicense_Mobile.index].expired_date = this.M_FM_FleetLicense_Mobile.expired_date
                        this.DataListDetail[this.M_FM_FleetLicense_Mobile.index].cost = this.M_FM_FleetLicense_Mobile.cost
                        this.DataListDetail[this.M_FM_FleetLicense_Mobile.index].cm_city_id = this.M_FM_FleetLicense_Mobile.cm_city_id
                        this.DataListDetail[this.M_FM_FleetLicense_Mobile.index].cm_city_id_cd = this.M_FM_FleetLicense_Mobile.cm_city_id_cd
                        this.DataListDetail[this.M_FM_FleetLicense_Mobile.index].cm_city_id_descs = this.M_FM_FleetLicense_Mobile.cm_city_id_descs
                        this.DataListDetail[this.M_FM_FleetLicense_Mobile.index].remarks = this.M_FM_FleetLicense_Mobile.remarks
                        this.DataListDetail[this.M_FM_FleetLicense_Mobile.index].time_edit = this.M_FM_FleetLicense_Mobile.time_edit
                        this.DataListDetail[this.M_FM_FleetLicense_Mobile.index].user_input = this.M_FM_FleetLicense_Mobile.user_input
                        this.DataListDetail[this.M_FM_FleetLicense_Mobile.index].user_edit = this.M_FM_FleetLicense_Mobile.user_edit
                        this.DataListDetail[this.M_FM_FleetLicense_Mobile.index].fm_license_type_idLabel = this.M_FM_FleetLicense_Mobile.fm_license_type_idLabel
                        this.DataListDetail[this.M_FM_FleetLicense_Mobile.index].cm_city_idLabel = this.M_FM_FleetLicense_Mobile.cm_city_idLabel

                    }
                }
                else {
                    this.DataListDetail.push({
                          fm_fleet_id: this.M_FM_FleetLicense_Mobile.fm_fleet_id,
                          fm_fleet_license_id: this.M_FM_FleetLicense_Mobile.fm_fleet_license_id,
                          fleet_license_no: this.M_FM_FleetLicense_Mobile.fleet_license_no,
                          subportfolio_cd: this.M_FM_FleetLicense_Mobile.subportfolio_cd,
                          fm_license_type_id: this.M_FM_FleetLicense_Mobile.fm_license_type_id,
                          fm_license_type_id_cd: this.M_FM_FleetLicense_Mobile.fm_license_type_id_cd,
                          fm_license_type_id_descs: this.M_FM_FleetLicense_Mobile.fm_license_type_id_descs,
                          expired_date: this.M_FM_FleetLicense_Mobile.expired_date,
                          cost: this.M_FM_FleetLicense_Mobile.cost,
                          cm_city_id: this.M_FM_FleetLicense_Mobile.cm_city_id,
                          cm_city_id_cd: this.M_FM_FleetLicense_Mobile.cm_city_id_cd,
                          cm_city_id_descs: this.M_FM_FleetLicense_Mobile.cm_city_id_descs,
                          remarks: this.M_FM_FleetLicense_Mobile.remarks,
                          lastupdatestamp: null,
                          time_edit: this.M_FM_FleetLicense_Mobile.time_edit,
                          user_input: this.M_FM_FleetLicense_Mobile.user_input,
                          user_edit: this.M_FM_FleetLicense_Mobile.user_edit,
                          _METHOD_: "NEW",

                    })
                }

                this.M_ClearForm()
                this.$refs.Modal_FM_FleetLicense_Mobile._hide()
                this.addStatus = false
            })
        },
        modalCancel(){},
        onAdd(){
            this.addStatus = true
            this.M_ClearForm()
            this.$refs.Modal_FM_FleetLicense_Mobile._show()
        },
        M_ClearForm(){
            this.M_FM_FleetLicense_Mobile = {
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
            }

            this.$refs.ref_fleet_license_no.clearValidator()
            this.$refs.ref_fm_license_type_id.clearValidator()
            this.$refs.ref_expired_date.clearValidator()
            this.$refs.ref_cost.clearValidator()
            this.$refs.ref_cm_city_id.clearValidator()
            this.$refs.ref_remarks.clearValidator()

        },
        doGetList(search = "") {
            var param = {
                OptionUrl: this.OptionUrl,
                LineNo: 1,
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
                        this.M_FM_FleetLicense_Mobile = {
                          fm_fleet_id:  data.fm_fleet_id,
                          fm_fleet_license_id:  data.fm_fleet_license_id,
                          fleet_license_no:  data.fleet_license_no,
                          subportfolio_cd:  data.subportfolio_cd,
                          fm_license_type_id:  data.fm_license_type_id,
                          fm_license_type_id_cd:  data.fm_license_type_id_cd,
                          fm_license_type_id_descs:  data.fm_license_type_id_descs,
                          expired_date: this.momentDateFormatting( data.expired_date, 'YYYY-MM-DD'),
                          cost: this.isCurrency( data.cost, this.decimal),
                          cm_city_id:  data.cm_city_id,
                          cm_city_id_cd:  data.cm_city_id_cd,
                          cm_city_id_descs:  data.cm_city_id_descs,
                          remarks:  data.remarks,
                          row_id: null,
                          lastupdatestamp: null,
                          time_edit:  data.time_edit,
                          user_input:  data.user_input,
                          user_edit:  data.user_edit,
                          index: index,
                        }

                        this.M_FM_FleetLicense_Mobile.fm_license_type_idLabel = data.fm_license_type_idLabel 
                        this.M_FM_FleetLicense_Mobile.cm_city_idLabel = data.cm_city_idLabel 

						this.$refs.Modal_FM_FleetLicense_Mobile._show()
                    }
                }
                else {
                    var param = {
                        OptionUrl: this.OptionUrl,
                        LineNo: 1,
                        fm_fleet_license_id: this.DataListDetail[index].row_id,

                    }

                    var url = this.getUrlV2(this.getUrlById())

                    this.postJSON( url, param )
                    .then(response => {
                        if(response == null) return
                        
                        var data = response.Data[0]
                        
                        this.M_FM_FleetLicense_Mobile = {
                          fm_fleet_id:  data.fm_fleet_id,
                          fm_fleet_license_id:  data.fm_fleet_license_id,
                          fleet_license_no:  data.fleet_license_no,
                          subportfolio_cd:  data.subportfolio_cd,
                          fm_license_type_id:  data.fm_license_type_id,
                          fm_license_type_id_cd:  data.fm_license_type_id_cd,
                          fm_license_type_id_descs:  data.fm_license_type_id_descs,
                          expired_date: this.momentDateFormatting( data.expired_date, 'YYYY-MM-DD'),
                          cost: this.isCurrency( data.cost, this.decimal),
                          cm_city_id:  data.cm_city_id,
                          cm_city_id_cd:  data.cm_city_id_cd,
                          cm_city_id_descs:  data.cm_city_id_descs,
                          remarks:  data.remarks,
                          row_id:  data.row_id,
                          lastupdatestamp:  this.DataListDetail[index].lastupdatestamp,
                          time_edit:  data.time_edit,
                          user_input:  data.user_input,
                          user_edit:  data.user_edit,
                          index: index,
                        }

                        this.M_FM_FleetLicense_Mobile.fm_license_type_idLabel = this.M_FM_FleetLicense_Mobile.fm_license_type_id_cd != null && this.M_FM_FleetLicense_Mobile.fm_license_type_id_cd != '' ? data.fm_license_type_id_cd + this.separator + data.fm_license_type_id_descs :'' 
                        this.M_FM_FleetLicense_Mobile.cm_city_idLabel = this.M_FM_FleetLicense_Mobile.cm_city_id_cd != null && this.M_FM_FleetLicense_Mobile.cm_city_id_cd != '' ? data.cm_city_id_cd + this.separator + data.cm_city_id_descs :'' 

						this.$refs.Modal_FM_FleetLicense_Mobile._show()
                    })
                }
            }
            else {
                var data = this.DataListDetail[index]
                        this.M_FM_FleetLicense_Mobile = {
                          fm_fleet_id:  data.fm_fleet_id,
                          fm_fleet_license_id:  data.fm_fleet_license_id,
                          fleet_license_no:  data.fleet_license_no,
                          subportfolio_cd:  data.subportfolio_cd,
                          fm_license_type_id:  data.fm_license_type_id,
                          fm_license_type_id_cd:  data.fm_license_type_id_cd,
                          fm_license_type_id_descs:  data.fm_license_type_id_descs,
                          expired_date: this.momentDateFormatting( data.expired_date, 'YYYY-MM-DD'),
                          cost: this.isCurrency( data.cost, this.decimal),
                          cm_city_id:  data.cm_city_id,
                          cm_city_id_cd:  data.cm_city_id_cd,
                          cm_city_id_descs:  data.cm_city_id_descs,
                          remarks:  data.remarks,
                          row_id: null,
                          lastupdatestamp: null,
                          time_edit:  data.time_edit,
                          user_input:  data.user_input,
                          user_edit:  data.user_edit,
                          index: index,
                        }

                        this.M_FM_FleetLicense_Mobile.fm_license_type_idLabel = data.fm_license_type_idLabel 
                        this.M_FM_FleetLicense_Mobile.cm_city_idLabel = data.cm_city_idLabel 

                this.$refs.Modal_FM_FleetLicense_Mobile._show()
            }
        },
        M_Delete(index) {
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
