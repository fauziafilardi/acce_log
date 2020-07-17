<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>{{Stype == "M" ? "Maintenance" : "Maintenance Type"}}</span>
                </b-col>
                <b-col style="text-align: right;">
                  <span>
                    <ABSButton
                      :text="'Back'"
                      classButton="button button--back"
                      classIcon="icon-style-1"
                      @click="doBack"
                    />
                  </span>
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <b-form
                :data-vv-scope="'OP_FormFmFleetMstrMaintenance'"
                :data-vv-value-path="'OP_FormFmFleetMstrMaintenance'"
              >
                <b-row>
                    <b-col md="2">
                        <div>
                        <div style="text-align: center;">
                            <font-awesome-icon
                                class="icon-style-default"
                                icon="wrench"
                                size="10x"
                            />
                        </div>
                        </div>
                    </b-col>
                    <b-col md="10" class="row-bordered">
                        <!-- <b-row class="row-bordered"> -->
                            <b-col md="6" offset="3">
                                <b-row>
                                    <template v-if="Stype == 'M'">
                                        <b-col v-if="inputStatus == 'new'">
                                            <span>
                                                <label>Maintenance Type</label>
                                            </span>
                                            <ACCTextBox
                                                :prop = "PI_maintenance_type_t"
                                                v-model = "M_FmFleetMstr.maintenance_type"
                                                ref = "ref_maintenance_type"
                                            />
                                        </b-col>
                                        <b-col v-else class="row-view">
                                            <span>
                                                <label>Maintenance Type</label>
                                            </span>
                                            <br>
                                            <span>
                                                <label>{{M_FmFleetMstr.maintenance_type}}</label>
                                            </span>
                                        </b-col>
                                    </template>
                                    <template v-else>
                                        <b-col>
                                            <span>
                                                <label>Maintenance Type</label>
                                            </span>
                                            <ACCDropDown
                                                @change = "Onmaintenance_typeChange"
                                                :prop = "PI_maintenance_type"
                                                v-model = "M_FmFleetMstr.maintenance_type"
                                                :label = "M_FmFleetMstr.maintenance_typeLabel"
                                                ref = "ref_maintenance_type"
                                            />
                                        </b-col>
                                    </template>
                                </b-row>
                                <b-row>
                                    <b-col>
                                        <span>
                                            <label>Description</label>
                                        </span>
                                        <ACCTextArea
                                            :prop = "PI_descs"
                                            v-model = "M_FmFleetMstr.descs"
                                            ref = "ref_descs"
                                        />
                                    </b-col>
                                </b-row>
                                <b-row>
                                    <b-col>
                                        <span>
                                            <label>Trigger By</label>
                                        </span>
                                    </b-col>
                                </b-row>
                                <b-row class="row-bordered">
                                    <b-col>
                                        <b-row>
                                            <b-col>
                                                <ACCRadioButton
                                                    @input="Ontriggerby_usageChange"
                                                    :prop="PI_triggerby_usage"
                                                    v-model="M_FmFleetMstr.triggerby"
                                                    ref="ref_triggerby_usage"
                                                />
                                            </b-col>
                                        </b-row>
                                        <b-row>
                                            <b-col>
                                                <b-row>
                                                    <b-col>
                                                        <span>
                                                            <label>Usage</label>
                                                        </span>
                                                        <ACCTextBox
                                                            :prop = "PI_usage"
                                                            v-model = "M_FmFleetMstr.usage"
                                                            ref = "ref_usage"
                                                        />
                                                    </b-col>
                                                    <b-col style="max-width: fit-content !important; margin-top: 35px;">
                                                        Km
                                                    </b-col>
                                                </b-row>
                                            </b-col>
                                            <b-col>
                                                <b-row>
                                                    <b-col>
                                                        <span>
                                                            <label>Usage Tolerance</label>
                                                        </span>
                                                        <ACCTextBox
                                                            :prop = "PI_usage_t"
                                                            v-model = "M_FmFleetMstr.usage_t"
                                                            ref = "ref_usage_t"
                                                        />
                                                    </b-col>
                                                    <b-col style="max-width: fit-content !important; margin-top: 35px;">
                                                        Km
                                                    </b-col>
                                                </b-row>
                                            </b-col>
                                        </b-row>
                                        <b-row>
                                            <b-col>
                                                <b-row>
                                                    <b-col>
                                                        <span>
                                                            <label>Time</label>
                                                        </span>
                                                        <ACCTextBox
                                                            :prop = "PI_time"
                                                            v-model = "M_FmFleetMstr.time"
                                                            ref = "ref_time"
                                                        />
                                                    </b-col>
                                                    <b-col style="max-width: fit-content !important; margin-top: 35px;">
                                                        Day(s)
                                                    </b-col>
                                                </b-row>
                                            </b-col>
                                            <b-col>
                                                <b-row>
                                                    <b-col>
                                                        <span>
                                                            <label>Time Tolerance</label>
                                                        </span>
                                                        <ACCTextBox
                                                            :prop = "PI_time_t"
                                                            v-model = "M_FmFleetMstr.time_t"
                                                            ref = "ref_time_t"
                                                        />
                                                    </b-col>
                                                    <b-col style="max-width: fit-content !important; margin-top: 35px;">
                                                        Day(s)
                                                    </b-col>
                                                </b-row>
                                            </b-col>
                                        </b-row>
                                    </b-col>
                                </b-row>
                                <!-- by time -->
                                <b-row class="row-bordered">
                                    <b-col>
                                        <b-row>
                                            <b-col>
                                                <ACCRadioButton
                                                    @input="Ontriggerby_timeChange"
                                                    :prop="PI_triggerby_time"
                                                    v-model="M_FmFleetMstr.triggerby"
                                                    ref="ref_triggerby_time"
                                                />
                                            </b-col>
                                        </b-row>
                                        <b-row>
                                            <b-col>
                                                <b-row>
                                                    <b-col>
                                                        <span>
                                                            <label>Time</label>
                                                        </span>
                                                        <ACCTextBox
                                                            :prop = "PI_time_time"
                                                            v-model = "M_FmFleetMstr.time_time"
                                                            ref = "ref_time_time"
                                                        />
                                                    </b-col>
                                                    <b-col style="max-width: fit-content !important; margin-top: 35px;">
                                                        Day(s)
                                                    </b-col>
                                                </b-row>
                                            </b-col>
                                            <b-col>
                                                <b-row>
                                                    <b-col>
                                                        <span>
                                                            <label>Time Tolerance</label>
                                                        </span>
                                                        <ACCTextBox
                                                            :prop = "PI_time_time_t"
                                                            v-model = "M_FmFleetMstr.time_time_t"
                                                            ref = "ref_time_time_t"
                                                        />
                                                    </b-col>
                                                    <b-col style="max-width: fit-content !important; margin-top: 35px;">
                                                        Day(s)
                                                    </b-col>
                                                </b-row>
                                            </b-col>
                                        </b-row>
                                    </b-col>
                                </b-row>
                                <!-- adhoc -->
                                <b-row class="row-bordered">
                                    <b-col>
                                        <b-row>
                                            <b-col>
                                                <ACCRadioButton
                                                    @input="Ontriggerby_adhocChange"
                                                    :prop="PI_triggerby_adhoc"
                                                    v-model="M_FmFleetMstr.triggerby"
                                                    ref="ref_triggerby_adhoc"
                                                />
                                            </b-col>
                                        </b-row>
                                    </b-col>
                                </b-row>
                                <b-row style="margin-top: 10px;">
                                    <b-col style="text-align: center">
                                        <ABSButton
                                            :text="'Save Maintenance'"
                                            classButton="btn btn--default"
                                            classIcon="icon-style-default"
                                            @click="doSave"
                                            styleButton="height: 40px;width: 70%;"
                                        />
                                    </b-col>
                                </b-row>
                            </b-col>
                        <!-- </b-row> -->
                    </b-col>
                </b-row>
              </b-form>
            </div>
          </div>
        </b-col>
      </b-row>
    </div>
  </div>
</template>

<script>
export default {
    data() {
        return {
            Stype: "M",
            M_FmFleetMstr :{
                maintenance_type: '',
                maintenance_typeLabel: '',
                descs: '',
                usage: '',
                usage_t: '',
                time: '',
                time_t: '',
                time_time: '',
                time_time_t: '',
                triggerby: 'U',
                last_maint_usage: '',
                last_maint_date: ''
            },
            PI_maintenance_type: {
                dataLookUp:{
                LookUpCd:'GetMaintenanceType',
                ColumnDB:'mm_maintenance_type_id',
                InitialWhere:"ss_portfolio_id='"+this.getDataUser().portfolio_id+"'",
                ParamWhere:'',
                OrderBy:'',
                ParamView:'',
                SourceField:'',
                DisplayLookUp:'mm_maintenance_type_id,maintenance_type'
                },
                cValidate: '',
                cName: "maintenance_type",
                cOrder: 1,
                cKey: false,
                cStatic: false,
                cProtect: false,
                cParentForm: "OP_FormFmFleetMstrMaintenance",
                cOption: [],
                cDisplayColumn: 'maintenance_type',
                cInputStatus: this.inputStatus
            },
            PI_maintenance_type_t: {
                cValidate: '',
                cName: "maintenance_type",
                cOrder: 1,
                cKey: false,
                cType: "text",
                cProtect: false,
                cParentForm: "OP_FormFmFleetMstrMaintenance",
                cDecimal: 2,
                cInputStatus: this.inputStatus
            },
            PI_descs: {
                cValidate: '',
                cName: "descs",
                cOrder: 2,
                cKey: false,
                cType: "text",
                cProtect: false,
                cParentForm: "OP_FormFmFleetMstrMaintenance",
                cDecimal: 2,
                cInputStatus: this.inputStatus
            },
            PI_usage: {
                cValidate: '',
                cName: "usage",
                cOrder: 6,
                cKey: false,
                cType: "numeric",
                cProtect: false,
                cParentForm: "OP_FormFmFleetMstrMaintenance",
                cDecimal: 2,
                cInputStatus: this.inputStatus
            },
            PI_usage_t: {
                cValidate: '',
                cName: "usage_t",
                cOrder: 7,
                cKey: false,
                cType: "numeric",
                cProtect: false,
                cParentForm: "OP_FormFmFleetMstrMaintenance",
                cDecimal: 2,
                cInputStatus: this.inputStatus
            },
            PI_time: {
                cValidate: '',
                cName: "time",
                cOrder: 8,
                cKey: false,
                cType: "numeric",
                cProtect: false,
                cParentForm: "OP_FormFmFleetMstrMaintenance",
                cDecimal: 2,
                cInputStatus: this.inputStatus
            },
            PI_time_t: {
                cValidate: '',
                cName: "time_t",
                cOrder: 9,
                cKey: false,
                cType: "numeric",
                cProtect: false,
                cParentForm: "OP_FormFmFleetMstrMaintenance",
                cDecimal: 2,
                cInputStatus: this.inputStatus
            },
            PI_time_time: {
                cValidate: '',
                cName: "time_time",
                cOrder: 10,
                cKey: false,
                cType: "numeric",
                cProtect: true,
                cParentForm: "OP_FormFmFleetMstrMaintenance",
                cDecimal: 2,
                cInputStatus: this.inputStatus
            },
            PI_time_time_t: {
                cValidate: '',
                cName: "time_time_t",
                cOrder: 11,
                cKey: false,
                cType: "numeric",
                cProtect: true,
                cParentForm: "OP_FormFmFleetMstrMaintenance",
                cDecimal: 2,
                cInputStatus: this.inputStatus
            },
            PI_triggerby_usage: {
                cValidate :'', 
                cName: 'triggerby_usage', 
                cId: 'rdbtriggerby_usage', 
                cRadioOptions: [{ text: 'By Usage', value: 'U' }], 
                cRadioDefaultOption: '',
                cOrder: 3,
                cProtect: false, 
                cVisible:  true, 
                cParentForm: 'OP_FormFmFleetMstrMaintenance',
                cInputStatus: this.inputStatus
            },
            PI_triggerby_time: {
                cValidate :'', 
                cName: 'triggerby_time', 
                cId: 'rdbtriggerby_time', 
                cRadioOptions: [{ text: 'By Time', value: 'T' }], 
                cRadioDefaultOption: '',
                cOrder: 5,
                cProtect: false, 
                cVisible:  true, 
                cParentForm: 'OP_FormFmFleetMstrMaintenance',
                cInputStatus: this.inputStatus
            },
            PI_triggerby_adhoc: {
                cValidate :'', 
                cName: 'triggerby_adhoc', 
                cId: 'rdbtriggerby_adhoc', 
                cRadioOptions: [{ text: 'Adhoc', value: 'A' }], 
                cRadioDefaultOption: '',
                cOrder: 5,
                cProtect: false, 
                cVisible:  true, 
                cParentForm: 'OP_FormFmFleetMstrMaintenance',
                cInputStatus: this.inputStatus
            },
            AllData: {}
        };
    },
    computed: {
        paramFromList() {
            var param = this.$store.getters.getParamPage;
            return param;
        },
        inputStatus() {
            var param = this.$store.getters.getParamPage;
            if (param.isEdit && param.isEdit === true) {
                return "edit";
            } else {
                return "new";
            }
        }
    },
    methods: {
        doBack() {
            this.$router.go(-1);
        },
        Onmaintenance_typeChange(data) {
            this.$nextTick(() => {
                this.M_FmFleetMstr.maintenance_type = data.id
                this.M_FmFleetMstr.maintenance_typeLabel = data.label
                this.M_FmFleetMstr.descs = data.description
                this.M_FmFleetMstr.triggerby = data.trigger_by
                if (data.trigger_by == 'U') {
                    this.M_FmFleetMstr.usage = data.usage_in_km
                    this.M_FmFleetMstr.usage_t = data.usage_tolerance_in_km
                    this.M_FmFleetMstr.time = data.time_days
                    this.M_FmFleetMstr.time_t = data.time_tolerance_in_days
                }
                else if (data.trigger_by == 'T') {
                    this.M_FmFleetMstr.time_time = data.time_days
                    this.M_FmFleetMstr.time_time_t = data.time_tolerance_in_days
                }
                // this.M_FmFleetMstr.last_maint_usage = data.last_maint_usage
                // this.M_FmFleetMstr.last_maint_date = data.last_maint_date
            });
        },
        Ontriggerby_usageChange(data) {
            console.log('usage', data)
            if (data == 'U') {
                this.PI_time.cProtect = false
                this.PI_time_t.cProtect = false
                this.PI_usage.cProtect = false
                this.PI_usage_t.cProtect = false

                this.PI_time_time.cProtect = true
                this.PI_time_time_t.cProtect = true

                this.M_FmFleetMstr.time_time = ''
                this.M_FmFleetMstr.time_time_t = ''
            }

            if (this.inputStatus == "edit") {
                if (this.AllData.trigger_by == data && this.AllData.trigger_by == "U") {
                    this.M_FmFleetMstr.time = this.AllData.time_days__tb_5
                    this.M_FmFleetMstr.time_t = this.AllData.time_days_tolerance__tb_6
                    this.M_FmFleetMstr.usage = this.AllData.usage_distance__tb_3
                    this.M_FmFleetMstr.usage_t = this.AllData.usage_tolerance_distance__tb_4
                }
            }
        },
        Ontriggerby_timeChange(data) {
            console.log('time', data)
            if (data == 'T') {
                this.PI_time_time.cProtect = false
                this.PI_time_time_t.cProtect = false

                this.PI_time.cProtect = true
                this.PI_time_t.cProtect = true
                this.PI_usage.cProtect = true
                this.PI_usage_t.cProtect = true

                this.M_FmFleetMstr.time = ''
                this.M_FmFleetMstr.time_t = ''
                this.M_FmFleetMstr.usage = ''
                this.M_FmFleetMstr.usage_t = ''
            }

            if (this.inputStatus == "edit") {
                if (this.AllData.trigger_by == data && this.AllData.trigger_by == "T") {
                    this.M_FmFleetMstr.time_time = this.AllData.time_days__tb_5
                    this.M_FmFleetMstr.time_time_t = this.AllData.time_days_tolerance__tb_6
                }
            }
        },
        Ontriggerby_adhocChange(data) {
            if (data == 'A') {
                this.PI_usage.cProtect = true
                this.PI_usage_t.cProtect = true
                this.PI_time.cProtect = true
                this.PI_time_t.cProtect = true
                this.PI_time_time.cProtect = true
                this.PI_time_time_t.cProtect = true
                this.M_FmFleetMstr.usage = ''
                this.M_FmFleetMstr.usage_t = ''
                this.M_FmFleetMstr.time = ''
                this.M_FmFleetMstr.time_t = ''
                this.M_FmFleetMstr.time_time = ''
                this.M_FmFleetMstr.time_time_t = ''
            }
        },
        M_ClearForm() {
            this.M_FmFleetMstr = {
                maintenance_type: '',
                maintenance_typeLabel: '',
                descs: '',
                usage: '',
                usage_t: '',
                time: '',
                time_t: '',
                time_time: '',
                time_time_t: '',
                triggerby: 'U',
                last_maint_usage: '',
                last_maint_date: ''
            }
        },
        doSave() {
            this.$validator._base.validateAll("OP_FormFmFleetMstrMaintenance").then(result => {
                if (!result) return;
                this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
                ress => {
                    if (ress.value) {
                        this.$validator.errors.clear("OP_FormFmFleetMstrMaintenance");
                        if (this.inputStatus == "edit") {
                            this.M_Update();
                        } else {
                            this.M_Save();
                        }
                    }
                });
            });
        },
        M_Save() {
            var param = {};
            if (this.Stype == "M") {
                param = {
                    option_url: "/OP/OP_MaintenanceType",
                    line_no: 0,
                    ss_portfolio_id: this.getDataUser().portfolio_id,
                    maintenance_type: this.M_FmFleetMstr.maintenance_type,
                    descs: this.M_FmFleetMstr.descs,
                    usage_distance: this.M_FmFleetMstr.usage,
                    usage_tolerance_distance: this.M_FmFleetMstr.usage_t,
                    trigger_by: this.M_FmFleetMstr.triggerby,
                    time_days: this.M_FmFleetMstr.triggerby == 'U' ? this.M_FmFleetMstr.time : this.M_FmFleetMstr.time_time,
                    time_days_tolerance: this.M_FmFleetMstr.triggerby == 'U' ? this.M_FmFleetMstr.time_t : this.M_FmFleetMstr.time_time_t,
                    user_input: this.getDataUser().user_id
                }
            }
            else {
                param = {
                    option_url: "/OP/OP_FleetMaster",
                    line_no: 2,
                    ss_portfolio_id: this.getDataUser().portfolio_id,
                    fm_fleet_mstr_id: this.paramFromList.ForMaintenance.fm_fleet_mstr_id,
                    mm_maintenance_type_id: this.M_FmFleetMstr.maintenance_type,
                    descs: this.M_FmFleetMstr.descs,
                    usage_distance: this.M_FmFleetMstr.usage,
                    usage_tolerance_distance: this.M_FmFleetMstr.usage_t,
                    trigger_by: this.M_FmFleetMstr.triggerby,
                    time_days: this.M_FmFleetMstr.triggerby == 'U' ? this.M_FmFleetMstr.time : this.M_FmFleetMstr.time_time,
                    time_days_tolerance: this.M_FmFleetMstr.triggerby == 'U' ? this.M_FmFleetMstr.time_t : this.M_FmFleetMstr.time_time_t,
                    last_maint_usage: this.M_FmFleetMstr.last_maint_usage && this.M_FmFleetMstr.last_maint_usage !== '' ? this.M_FmFleetMstr.last_maint_usage : 'NULL',
                    last_maint_date: this.M_FmFleetMstr.last_maint_date && this.M_FmFleetMstr.last_maint_date !== '' ? this.M_FmFleetMstr.last_maint_date : 'NULL',
                    user_input: this.getDataUser().user_id
                }
            }

            this.postJSON(this.getUrlCRUD(), param).then(response => {
                if (response == null) return;
                this.alertSuccess(response.Message).then(() => {
                    this.doBack();
                });
            });
        },
        M_Update() {
            var param = {};
            if (this.Stype == "M") {
                param = {
                    option_url: "/OP/OP_MaintenanceType",
                    line_no: 0,
                    mm_maintenance_type_id: this.paramFromList.row_id,
                    ss_portfolio_id: this.getDataUser().portfolio_id,
                    maintenance_type: this.M_FmFleetMstr.maintenance_type,
                    descs: this.M_FmFleetMstr.descs,
                    usage_distance: this.M_FmFleetMstr.usage,
                    usage_tolerance_distance: this.M_FmFleetMstr.usage_t,
                    trigger_by: this.M_FmFleetMstr.triggerby,
                    time_days: this.M_FmFleetMstr.triggerby == 'U' ? this.M_FmFleetMstr.time : this.M_FmFleetMstr.time_time,
                    time_days_tolerance: this.M_FmFleetMstr.triggerby == 'U' ? this.M_FmFleetMstr.time_t : this.M_FmFleetMstr.time_time_t,
                    lastupdatestamp:this.paramFromList.lastupdatestamp,
                    user_edit: this.getDataUser().user_id
                }
            }
            else {
                var param = {
                    option_url: "/OP/OP_FleetMaster",
                    line_no: 2,
                    fm_fleet_maintenance_type_id: this.paramFromList.ForMaintenance.row_id,
                    ss_portfolio_id: this.getDataUser().portfolio_id,
                    fm_fleet_mstr_id: this.paramFromList.ForMaintenance.fm_fleet_mstr_id,
                    mm_maintenance_type_id: this.M_FmFleetMstr.maintenance_type,
                    descs: this.M_FmFleetMstr.descs,
                    usage_distance: this.M_FmFleetMstr.usage,
                    usage_tolerance_distance: this.M_FmFleetMstr.usage_t,
                    trigger_by: this.M_FmFleetMstr.triggerby,
                    time_days: this.M_FmFleetMstr.triggerby == 'U' ? this.M_FmFleetMstr.time : this.M_FmFleetMstr.time_time,
                    time_days_tolerance: this.M_FmFleetMstr.triggerby == 'U' ? this.M_FmFleetMstr.time_t : this.M_FmFleetMstr.time_time_t,
                    last_maint_usage: this.M_FmFleetMstr.last_maint_usage && this.M_FmFleetMstr.last_maint_usage !== '' ? this.M_FmFleetMstr.last_maint_usage : 'NULL',
                    last_maint_date: this.M_FmFleetMstr.last_maint_date && this.M_FmFleetMstr.last_maint_date !== '' ? this.M_FmFleetMstr.last_maint_date : 'NULL',
                    lastupdatestamp:this.paramFromList.ForMaintenance.lastupdatestamp,
                    user_edit: this.getDataUser().user_id
                }
            }

            this.putJSON(this.getUrlCRUD(), param).then(response => {
                if (response == null) return;
                this.alertSuccess(response.Message).then(() => {
                    if (this.Stype == "M") {
                        this.doBack();
                    }
                    else {
                        var param = this.paramFromList
                        param.ForMaintenance = null
                        this.$store.commit("setParamPage", param);
                        this.$router.replace({ name: "OP_FleetMasterView" });
                    }
                });
            })
        },
        GetDataBy() {
            var param = {};
            if (this.Stype == "M") {
                param = {
                    option_url: "/OP/OP_MaintenanceType",
                    line_no: 0,
                    id: this.paramFromList.row_id,
                    lastupdatestamp: this.paramFromList.lastupdatestamp
                }
            }
            else {
                param = {
                    option_url: "/OP/OP_FleetMaster",
                    line_no: 2,
                    id: this.paramFromList.ForMaintenance.row_id,
                    lastupdatestamp: this.paramFromList.ForMaintenance.lastupdatestamp
                }
            }

            this.getJSON(this.getUrlCRUD(), param).then(response => {
                // response from API
                if (response == null) return;

                var data = response.Data[0];
                this.AllData = data
                this.M_FmFleetMstr = {
                    maintenance_type: this.Stype == "M" ? data.maintenance_type__tb_1 : data.mm_maintenance_type_id__lo_1,
                    maintenance_typeLabel: this.Stype == "M" ? data.maintenance_type__tb_1 : data.maintenance_type_descs__lbl_lo_1,
                    descs: data.descs__tb_2,
                    usage: data.trigger_by == 'U' ? data.usage_distance__tb_3 : '',
                    usage_t: data.trigger_by== 'U' ? data.usage_tolerance_distance__tb_4 : '',
                    time: data.trigger_by== 'U' ? data.time_days__tb_5 : '',
                    time_t: data.trigger_by== 'U' ? data.time_days_tolerance__tb_6 : '',
                    time_time: data.trigger_by== 'T' ? data.time_days__tb_5 : '',
                    time_time_t: data.trigger_by== 'T' ? data.time_days_tolerance__tb_6 : '',
                    triggerby: data.trigger_by,
                    last_maint_usage: data.last_maint_usage && data.last_maint_usage !== '' ? data.last_maint_usage : 'NULL',
                    last_maint_date: data.last_maint_date && data.last_maint_date !== '' ? data.last_maint_date : 'NULL'
                }
            });
        },
        CheckType() {
            if (this.paramFromList.ForMaintenance == null || this.paramFromList.ForMaintenance == undefined) {
                this.Stype = "M"
            } else {
                if (Object.keys(this.paramFromList.ForMaintenance).length < 1) {
                    this.Stype = "M"
                } else {
                    this.Stype = "D"
                }
            }
        }
    },
    mounted() {
        this.M_ClearForm();
        this.CheckType();
        if (this.inputStatus == "edit") {
            this.GetDataBy();
        }
    }
};
</script>

