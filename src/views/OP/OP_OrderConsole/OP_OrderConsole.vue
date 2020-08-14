<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card">
            <div class="card__title" style="padding-bottom: 5px !important;">
              <b-row>
                <b-col>
                  <span>Console</span>
                </b-col>
                <b-col style="max-width: fit-content !important;" class="col-right">
                  <span>
                    <ABSButton
                      :text="'Back'"
                      classButton="button button--back2"
                      classIcon="icon-style-1"
                      @click="$router.go(-1)"
                    />
                  </span>
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
                <b-row class="row-bordered">
                    <b-col md="6" offset="3">
                        <b-row>
                            <b-col md="6">
                                <span>
                                    <label> From </label>
                                </span>
                                <ACCDropDown
                                    @change="Onfr_cm_zone_idChange"
                                    :prop="PI_fr_cm_zone_id"
                                    v-model="M_ConsoleData.fr_cm_zone_id"
                                    :label="M_ConsoleData.fr_cm_zone_idLabel"
                                    ref="ref_fr_cm_zone_id"
                                />
                            </b-col>
                            <b-col md="6">
                                <span>
                                    <label> To </label>
                                </span>
                                <ACCDropDown
                                    @change="Onto_cm_zone_idChange"
                                    :prop="PI_to_cm_zone_id"
                                    v-model="M_ConsoleData.to_cm_zone_id"
                                    :label="M_ConsoleData.to_cm_zone_idLabel"
                                    ref="ref_to_cm_zone_id"
                                />
                            </b-col>
                        </b-row>
                        <b-row>
                            <b-col md="6">
                                <span>
                                    <label>Schedule Date</label>
                                </span>
                                <ACCDateTime
                                    @input="OndateChange"
                                    :prop="PI_date"
                                    v-model="M_ConsoleData.schedule_date"
                                    ref="ref_date"
                                />
                            </b-col>
                            <b-col md="6">
                                <span>
                                    <label> Vehicle Type </label>
                                </span>
                                <ACCLookUp
                                    @change="Onfm_fleet_type_idChange"
                                    :prop="PI_fm_fleet_type_id"
                                    v-model="M_ConsoleData.fleet_type"
                                    :label="M_ConsoleData.fleet_typeLabel"
                                    ref="ref_fm_fleet_type_id"
                                />
                            </b-col>
                        </b-row>
                        <b-row>
                            <b-col md="12"></b-col>
                        </b-row>
                    </b-col>
                </b-row>
                <b-row class="row-bordered">
                    <b-col md="12">
                        <b-row>
                            <b-col md="3">
                                <span style="font-size: 12px; color: #333399; font-weight: bold;"> Pick Order </span>
                                <br />
                                <table border="1">
                                    <tr>
                                        <td style="text-align: center;"> Total KGS </td>
                                        <td style="text-align: center;"> Total CBM </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;"> {{this.M_ConsoleData.total_kgs}} </td>
                                        <td style="text-align: center;"> {{this.M_ConsoleData.total_cbm}} </td>
                                    </tr>
                                </table>
                            </b-col>
                            <b-col md="3" offset="6">
                                <span style="font-size: 12px; color: #333399; font-weight: bold;"> Maximum Capacity </span>
                                <br />
                                <table border="1">
                                    <tr>
                                        <td style="text-align: center;"> Max KGS </td>
                                        <td style="text-align: center;"> Max CBM </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;"> {{this.M_ConsoleData.max_kgs}} </td>
                                        <td style="text-align: center;"> {{this.M_ConsoleData.max_cbm}} </td>
                                    </tr>
                                </table>
                            </b-col>
                        </b-row>
                        <b-row>
                            <b-col md="12">
                                <ACCFormList
                                    :prop="propListA"
                                    :title="''"
                                    ref="ref_OrderConsoleA"
                                    @onRenderData="onRenderDataA"
                                    WithRowId
                                >
                                </ACCFormList>
                            </b-col>
                        </b-row>
                    </b-col>
                </b-row>
                <b-row>
                    <b-col md="12">
                        <b-row>
                            <b-col md="6">
                                <span style="font-size: 12px; color: #333399; font-weight: bold;"> LTL Order List </span>
                            </b-col>
                            <b-col md="6" class="col-right">
                                <span style="font-size: 12px; color: #333399; font-weight: bold;"> Zone </span>
                                
                            </b-col>
                        </b-row>
                        <b-row>
                            <b-col md="12">
                                <ACCFormList
                                    :prop="propListB"
                                    :title="'LTL Order List'"
                                    ref="ref_OrderConsoleB"
                                    @onRenderData="onRenderDataB"
                                    WithRowId
                                >
                                </ACCFormList>
                            </b-col>
                        </b-row>
                    </b-col>
                </b-row>
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
      propListA: {
        OptionUrl: "/OP/OP_OrderConsole",
        LineNo: 1,
        initialWhere: "ss_portfolio_id='" + this.getDataUser().portfolio_id + "' AND fr_cm_zone_id='0'",
        OrderBy: "sequence_no ASC",
        SourceField: "",
        ParamView: "",
        PerPage: 1000,
      },
      propListB: {
        OptionUrl: "/OP/OP_OrderConsole",
        LineNo: 0,
        initialWhere: "ss_portfolio_id='" + this.getDataUser().portfolio_id + "' AND fr_cm_zone_id='0'",
        OrderBy: "",
        SourceField: "",
        ParamView: "",
        PerPage: 1000,
      },
      PI_fr_cm_zone_id: {
        dataLookUp: {
          LookUpCd: "GetCostingZone",
          ColumnDB: "cm_zone_id",
          InitialWhere: "",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "",
        },
        cValidate: "",
        cName: "fr_cm_zone_id",
        cOrder: 1,
        cKey: false,
        cStatic: false,
        cProtect: false,
        cParentForm: "OP_OrderConsole",
        cOption: [],
        cDisplayColumn: "zone_code",
        cInputStatus: "new",
      },
      PI_to_cm_zone_id: {
        dataLookUp: {
          LookUpCd: "GetCostingZone",
          ColumnDB: "cm_zone_id",
          InitialWhere: "",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "",
        },
        cValidate: "",
        cName: "to_cm_zone_id",
        cOrder: 2,
        cKey: false,
        cStatic: false,
        cProtect: false,
        cParentForm: "OP_OrderConsole",
        cOption: [],
        cDisplayColumn: "zone_code",
        cInputStatus: "new",
      },
      PI_date: {
        cValidate: "",
        cName: "date",
        cOrder: 3,
        cKey: false,
        cProtect: false,
        cWithTime: false,
        cFormat: "dd/MM/yyyy",
        cParentForm: "OP_OrderConsole",
        cInputStatus: "new"
      },
      PI_fm_fleet_type_id: {
        dataLookUp: {
          LookUpCd: "GetFleetType",
          ColumnDB: "fleet_type_id",
          InitialWhere: "",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "descs"
        },
        cValidate: "",
        cName: "fm_fleet_type_id",
        cOrder: 3,
        cKey: false,
        cStatic: false,
        cProtect: false,
        cParentForm: "OP_OrderConsole",
        cOption: [],
        cDisplayColumn: "descs",
        cInputStatus: "new"
      },
      M_ConsoleData: {
          fr_cm_zone_id: "",
          fr_cm_zone_idLabel: "",
          to_cm_zone_id: "",
          to_cm_zone_idLabel: "",
          schedule_date: "",
          fleet_type: "",
          fleet_typeLabel: "",
          total_kgs: 0,
          total_cbm: 0,
          max_kgs: 0,
          max_cbm: 0,
      }
    };
  },
  computed: {},
  methods: {
    Onfr_cm_zone_idChange(data) {
        this.M_ConsoleData.fr_cm_zone_id = data.id
        this.M_ConsoleData.fr_cm_zone_idLabel = data.label
    },
    Onto_cm_zone_idChange(data) {
        this.M_ConsoleData.to_cm_zone_id = data.id
        this.M_ConsoleData.to_cm_zone_idLabel = data.label
    },
    OndateChange(data) {},
    Onfm_fleet_type_idChange(data) {
        console.log(data)
        this.M_ConsoleData.fleet_type = data.id
        this.M_ConsoleData.fleet_typeLabel = data.label
    },
    RenderData() {
        this.propListA.initialWhere = "ss_portfolio_id='" + this.getDataUser().portfolio_id + "'";
        this.propListB.initialWhere = "ss_portfolio_id='" + this.getDataUser().portfolio_id + "'";
        if (this.M_ConsoleData.fr_cm_zone_id && this.M_ConsoleData.fr_cm_zone_id !== '') {
            this.propListA.initialWhere += " AND tmp_fr_cm_zone_id=" + this.M_ConsoleData.fr_cm_zone_id
            this.propListB.initialWhere += " AND fr_cm_zone_id=" + this.M_ConsoleData.fr_cm_zone_id
        }
        if (this.M_ConsoleData.to_cm_zone_id && this.M_ConsoleData.to_cm_zone_id !== '') {
            this.propListA.initialWhere += " AND tmp_to_cm_zone_id=" + this.M_ConsoleData.to_cm_zone_id
        }
        if (this.M_ConsoleData.schedule_date && this.M_ConsoleData.schedule_date !== '') {
            this.propListA.initialWhere += " AND tmp_schedule_date=" + this.M_ConsoleData.schedule_date
        }

        this.$refs.ref_OrderConsoleA.doGetList("");
        this.$refs.ref_OrderConsoleB.doGetList("");
    },
    M_ClearForm() {
        this.M_ConsoleData = {
            fr_cm_zone_id: "",
            fr_cm_zone_idLabel: "",
            to_cm_zone_id: "",
            to_cm_zone_idLabel: "",
            schedule_date: "",
            fleet_type: "",
            fleet_typeLabel: "",
            total_kgs: 0,
            total_cbm: 0,
            max_kgs: 0,
            max_cbm: 0,
        }
    },
  },
  mounted() {
    this.M_ClearForm();
    this.RenderData();
  },
};
</script>

<style scoped>
.card {
  border: 0px solid #e7eaec !important;
}
.card-header:first-child {
  background-color: #eeeeee !important;
}

.tab-content > .active {
  padding: 0px !important;
}

.isTabs {
  border-top-right-radius: 5px;
  border-top-left-radius: 5px;
  background-color: #999999;
  width: 81px;
  text-align: center;
  height: 30px;
  padding-top: 0.3%;
  margin-right: 5px;
}

.active {
  background-color: #333399 !important;
}
</style>