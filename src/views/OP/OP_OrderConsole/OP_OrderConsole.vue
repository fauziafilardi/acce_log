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
                      @click="doBack"
                    />
                  </span>
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <b-form
                :data-vv-scope="'OP_OrderConsole'"
                :data-vv-value-path="'OP_OrderConsole'"
              >
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
                                <ACCDropDown
                                    @change="Onfm_fleet_type_idChange"
                                    :prop="PI_fm_fleet_type_id"
                                    v-model="M_ConsoleData.fleet_type"
                                    :label="M_ConsoleData.fleet_typeLabel"
                                    ref="ref_fm_fleet_type_id"
                                />
                            </b-col>
                        </b-row>
                        <b-row>
                            <b-col md="12">
                              <ABSButton
                                :text="'Create Console'"
                                classButton="btn btn--default"
                                classIcon="icon-style-default"
                                @click="doSave"
                                styleButton="height: 40px;width: 100%;"
                              />
                            </b-col>
                        </b-row>
                    </b-col>
                </b-row>
                <b-row class="row-bordered">
                    <b-col md="12">
                        <b-row style="margin-bottom: 10px;">
                            <b-col md="3">
                                <span style="font-size: 12px; color: #333399; font-weight: bold;"> Pick Order </span>
                                <br />
                                <b-row>
                                  <b-col style="padding: unset !important;">
                                    <b-row>
                                      <b-col class="border-top-left" style="text-align: center;"> Total KGS </b-col>
                                      <b-col class="border-top-right" style="text-align: center;"> Total CBM </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col class="border-bottom-left" style="text-align: center;"> {{this.M_ConsoleData.total_kgs}} </b-col>
                                      <b-col class="border-bottom-right" style="text-align: center;"> {{this.M_ConsoleData.total_cbm}} </b-col>
                                    </b-row>
                                  </b-col>
                                </b-row>
                                <!-- <table border="1">
                                    <tr>
                                        <td style="text-align: center;"> Total KGS </td>
                                        <td style="text-align: center;"> Total CBM </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;"> {{this.M_ConsoleData.total_kgs}} </td>
                                        <td style="text-align: center;"> {{this.M_ConsoleData.total_cbm}} </td>
                                    </tr>
                                </table> -->
                            </b-col>
                            <b-col md="3" offset="6">
                                <span style="font-size: 12px; color: #333399; font-weight: bold;"> Maximum Capacity </span>
                                <br />
                                <b-row>
                                  <b-col style="padding: unset !important;">
                                    <b-row>
                                      <b-col class="border-top-left" style="text-align: center;"> Max KGS </b-col>
                                      <b-col class="border-top-right" style="text-align: center;"> Max CBM </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col class="border-bottom-left" style="text-align: center;"> {{this.M_ConsoleData.max_kgs}} </b-col>
                                      <b-col class="border-bottom-right" style="text-align: center;"> {{this.M_ConsoleData.max_cbm}} </b-col>
                                    </b-row>
                                  </b-col>
                                </b-row>
                                <!-- <table border="1">
                                    <tr>
                                        <td style="text-align: center;"> Max KGS </td>
                                        <td style="text-align: center;"> Max CBM </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;"> {{this.M_ConsoleData.max_kgs}} </td>
                                        <td style="text-align: center;"> {{this.M_ConsoleData.max_cbm}} </td>
                                    </tr>
                                </table> -->
                            </b-col>
                        </b-row>
                        <b-row>
                            <b-col md="12">
                                <ACCFormList
                                    :prop="propListA"
                                    :title="''"
                                    ref="ref_OrderConsoleA"
                                    @onRenderData="onRenderDataA"
                                    WithDeleteButton
                                    @buttonDeleteClicked="deleteOrderA"
                                >
                                  <template slot="sequence_no" slot-scope="{index}">
                                    <b-row>
                                      <b-col md="6" style="text-align: center;">
                                        <font-awesome-icon
                                          v-show="index < (DataOrder.length - 1)"
                                          icon="arrow-alt-circle-down"
                                          class="icon-style-default"
                                          style="margin-right: 5px;"
                                          size="lg"
                                          @click="onOrderDown(index)"
                                        />
                                      </b-col>
                                      <b-col md="6" style="text-align: center;">
                                        <font-awesome-icon
                                          v-show="index !== 0"
                                          icon="arrow-alt-circle-up"
                                          class="icon-style-default"
                                          style="margin-right: 5px;"
                                          size="lg"
                                          @click="onOrderUp(index)"
                                        />
                                      </b-col>
                                    </b-row>
                                  </template>
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
                            <b-col offset="2" md="1" class="col-right">
                                <span style="font-size: 12px; color: #333399; font-weight: bold;"> Zone </span>
                            </b-col>
                            <b-col md="3" class="col-right">
                              <ACCDropDown
                                  @change="OnfilterZoneChange"
                                  :prop="PI_filterZone"
                                  v-model="M_FilterZone.zone_id"
                                  :label="M_FilterZone.zone_idLabel"
                                  ref="ref_filterZone"
                              />
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
                                  <template slot="row_id" slot-scope="data">
                                    <b-button
                                      style="background-color: transparent; color: black; border: none; padding: unset !important;"
                                      @click="doAddOrder(data.item)"
                                    >
                                      <font-awesome-icon
                                        icon="plus-circle"
                                        class="icon-style-default"
                                        style="margin-right: 5px;"
                                        size="lg"
                                      />Add
                                    </b-button>
                                  </template>
                                </ACCFormList>
                            </b-col>
                        </b-row>
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
        cValidate: "required",
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
        cValidate: "required",
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
        cValidate: "required",
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
        cValidate: "required",
        cName: "fm_fleet_type_id",
        cOrder: 4,
        cKey: false,
        cStatic: false,
        cProtect: false,
        cParentForm: "OP_OrderConsole",
        cOption: [],
        cDisplayColumn: "descs",
        cInputStatus: "new"
      },
      PI_filterZone: {
        dataLookUp: {
          LookUpCd: "GetZone",
          ColumnDB: "cm_zone_id",
          InitialWhere: "ss_portfolio_id='" + this.getDataUser().portfolio_id + "'",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "cm_zone_id"
        },
        cValidate: "",
        cName: "cm_zone_id",
        cOrder: 5,
        cKey: false,
        cStatic: false,
        cProtect: false,
        cParentForm: "OP_OrderConsole",
        cOption: [],
        cDisplayColumn: "cm_zone_id",
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
      },
      M_FilterZone: {
        zone_id: "",
        zone_idLabel: ""
      },
      DataOrder: []
    };
  },
  computed: {},
  methods: {
    doBack() {
      if (this.DataOrder.length > 0) {
        this.alertConfirmation("Your pick order setting will be lost, Are You Sure ?").then(
        ress => {
          if (ress.value) {
            // this.M_DeletePickOrder();
            this.$router.go(-1);
          }
        });
      }
      else {
        this.$router.go(-1);
      }
    },
    onOrderDown(index){
      var dtD = this.DataOrder[index + 1], dt = this.DataOrder[index];
      var param = []
      this.DataOrder.forEach((data, id) => {
        var sq = data.sequence_no
        if (id == index) {
          sq = dtD.sequence_no
        }
        else if (id == (index + 1)) {
          sq = dt.sequence_no
        }

        param.push({
          _Method_: "UPDATE",
          _LineNo_: 0,
          op_order_console_tmp_id: data.row_id,
          ss_portfolio_id: data.ss_portfolio_id,
          ss_subportfolio_id: data.ss_subportfolio_id,
          tmp_fr_cm_zone_id: data.tmp_fr_cm_zone_id,
          tmp_to_cm_zone_id: data.tmp_to_cm_zone_id,
          tmp_fm_fleet_type_id: data.tmp_fm_fleet_type_id,
          tmp_schedule_date: data.tmp_schedule_date,
          op_order_id: data.op_order_id,
          sequence_no: sq,
          lastupdatestamp: data.lastupdatestamp,
          user_edit: this.getDataUser().user_id
        })
      })

      var param = {
        option_url: "/OP/OP_OrderConsole",
        line_no: 0,
        Data: [{
          A_Looping: param
        }]
      };

      this.postJSONMulti(this.getUrlProsesDataPostMulti(), param).then(response => {
        if (response == null) return;
        this.RenderData();
      });
    },
    onOrderUp(index){
      var dtU = this.DataOrder[index - 1], dt = this.DataOrder[index];
      var param = []
      this.DataOrder.forEach((data, id) => {
        var sq = data.sequence_no
        if (id == index) {
          sq = dtU.sequence_no
        }
        else if (id == (index - 1)) {
          sq = dt.sequence_no
        }

        param.push({
          _Method_: "UPDATE",
          _LineNo_: 0,
          op_order_console_tmp_id: data.row_id,
          ss_portfolio_id: data.ss_portfolio_id,
          ss_subportfolio_id: data.ss_subportfolio_id,
          tmp_fr_cm_zone_id: data.tmp_fr_cm_zone_id,
          tmp_to_cm_zone_id: data.tmp_to_cm_zone_id,
          tmp_fm_fleet_type_id: data.tmp_fm_fleet_type_id,
          tmp_schedule_date: data.tmp_schedule_date,
          op_order_id: data.op_order_id,
          sequence_no: sq,
          lastupdatestamp: data.lastupdatestamp,
          user_edit: this.getDataUser().user_id
        })
      })

      var param = {
        option_url: "/OP/OP_OrderConsole",
        line_no: 0,
        Data: [{
          A_Looping: param
        }]
      };

      this.postJSONMulti(this.getUrlProsesDataPostMulti(), param).then(response => {
        if (response == null) return;
        this.RenderData();
      });
    },
    Onfr_cm_zone_idChange(data) {
        this.M_ConsoleData.fr_cm_zone_id = data.id
        this.M_ConsoleData.fr_cm_zone_idLabel = data.label
        this.RenderData()
    },
    Onto_cm_zone_idChange(data) {
        this.M_ConsoleData.to_cm_zone_id = data.id
        this.M_ConsoleData.to_cm_zone_idLabel = data.label
        this.RenderData()
    },
    OndateChange(data) {
      this.RenderData();
    },
    Onfm_fleet_type_idChange(data) {
        // console.log(data)
        this.M_ConsoleData.fleet_type = data.id
        this.M_ConsoleData.fleet_typeLabel = data.label
        this.M_ConsoleData.max_kgs = data.total_kgs
        this.M_ConsoleData.max_cbm = data.total_cbm
    },
    OnfilterZoneChange(data) {
      this.M_FilterZone.zone_id = data.id
      this.M_FilterZone.zone_idLabel = data.label
      this.RenderData()
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
            this.propListA.initialWhere += " AND tmp_schedule_date='" + this.M_ConsoleData.schedule_date + "'"
        }
        if (this.M_FilterZone.zone_id && this.M_FilterZone.zone_id !== '') {
            this.propListB.initialWhere += " AND to_cm_zone_id=" + this.M_FilterZone.zone_id
        }

        this.$refs.ref_OrderConsoleA.doGetList("");
        this.$refs.ref_OrderConsoleB.doGetList("");
    },
    onRenderDataA(data) {
      this.DataOrder = data
      var kgs = 0, cbm = 0;
      for (let i = 0; i < data.length; i++) {
        kgs += data[i].total_kgs && data[i].total_kgs !== '' ? data[i].total_kgs : 0
        cbm += data[i].total_cbm && data[i].total_cbm !== '' ? data[i].total_cbm : 0
      }

      this.M_ConsoleData.total_kgs = kgs
      this.M_ConsoleData.total_cbm = cbm
    },
    onRenderDataB(data) {},
    deleteOrderA(record, index) {
      this.alertConfirmation("Are You Sure Want To Cancel This Data ?").then(
        ress => {
          if (ress.value) {
            var param = {
              option_url: "/OP/OP_OrderConsole",
              line_no: 0,
              id: record.row_id,
              lastupdatestamp: record.lastupdatestamp
            };
            this.deleteJSON(this.getUrlCRUD(), param).then(response => {
              // response from API
              if (response == null) return;

              this.alertSuccess("Data Has Been Canceled").then(() => {
                this.RenderData();
              });
            });
          }
        }
      );
    },
    doAddOrder(data) {
      this.$validator._base.validateAll("OP_OrderConsole").then((result) => {
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Add This Data ?").then(ress => {
          if (ress.value) {
            var param = {
              option_url: "/OP/OP_OrderConsole",
              line_no: 0,
              ss_portfolio_id: this.getDataUser().portfolio_id,
              ss_subportfolio_id: this.getDataUser().subportfolio_id,
              tmp_fr_cm_zone_id: this.M_ConsoleData.fr_cm_zone_id,
              tmp_to_cm_zone_id: this.M_ConsoleData.to_cm_zone_id,
              tmp_fm_fleet_type_id: this.M_ConsoleData.fleet_type,
              tmp_schedule_date: this.M_ConsoleData.schedule_date,
              op_order_id: data.row_id,
              sequence_no: this.DataOrder.length,
              user_input: this.getDataUser().user_id,
            };
            this.postJSON(this.getUrlCRUD(), param).then(response => {
              // response from API
              if (response == null) return;

              this.alertSuccess("Data Has Been Added").then(() => {
                this.RenderData();
              });
            });
          }
        });
      });
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
    M_DeletePickOrder() {
      var param = []
      this.DataOrder.forEach((data, index) => {
        param.push({
          _Method_: "DELETE",
          _LineNo_: 0,
          row_id: data.row_id,
          lastupdatestamp: data.lastupdatestamp
        })
      })

      var param = {
        option_url: "/OP/OP_OrderConsole",
        line_no: 0,
        Data: [{
          A_Looping: param
        }]
      };

      this.postJSONMulti(this.getUrlProsesDataPostMulti(), param).then(response => {
        if (response == null) return;
          // this.alertSuccess("Save Data Has Been Successfully").then(() => {
          //   this.doBack();
          // });
      });
    },
    doSave() {
      this.$validator._base.validateAll("OP_OrderConsole").then((result) => {
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Create This Console ?").then(ress => {
          if (ress.value) {
            var param = {
              option_url: "/OP/OP_OrderConsole",
              line_no: 1,
              ss_portfolio_id: this.getDataUser().portfolio_id,
              ss_subportfolio_id: this.getDataUser().subportfolio_id,
              tmp_fr_cm_zone_id: this.M_ConsoleData.fr_cm_zone_id,
              tmp_to_cm_zone_id: this.M_ConsoleData.to_cm_zone_id,
              tmp_fm_fleet_type_id: this.M_ConsoleData.fleet_type,
              tmp_schedule_date: this.M_ConsoleData.schedule_date,
              user_input: this.getDataUser().user_id
            };
            this.putJSON(this.getUrlCRUD(), param).then(response => {
              // response from API
              if (response == null) return;

              this.alertSuccess("Console Has Been Created").then(() => {
                this.$router.go(-1);
              });
            });
          }
        });
      });
    },
  },
  mounted() {
    this.M_ClearForm();
    this.RenderData();
  },
  beforeDestroy() {
    // alert('hey ho')
    this.M_DeletePickOrder();
  }
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

.border-top-left {
  border-bottom: 1px solid #cccccc;
  border-top: 1px solid #cccccc;
  border-left: 1px solid #cccccc;
  /* border-right: 1px solid #cccccc; */
  border-top-left-radius: 5px;
}

.border-top-right {
  border-bottom: 1px solid #cccccc;
  border-top: 1px solid #cccccc;
  border-left: 1px solid #cccccc;
  border-right: 1px solid #cccccc;
  border-top-right-radius: 5px;
}

.border-bottom-left {
  border-bottom: 1px solid #cccccc;
  /* border-top: 1px solid #cccccc; */
  border-left: 1px solid #cccccc;
  /* border-right: 1px solid #cccccc; */
  border-bottom-left-radius: 5px;
}

.border-bottom-right {
  border-bottom: 1px solid #cccccc;
  /* border-top: 1px solid #cccccc; */
  border-left: 1px solid #cccccc;
  border-right: 1px solid #cccccc;
  border-bottom-right-radius: 5px;
}
</style>