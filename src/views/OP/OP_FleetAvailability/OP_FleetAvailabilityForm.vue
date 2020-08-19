<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Fleet Relocation</span>
                </b-col>
                <b-col style="text-align: right;">
                  <ABSButton
                    :text="'Back'"
                    classButton="button button--back"
                    classIcon="icon-style-1"
                    @click="doBack"
                  />
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <b-form
                :data-vv-scope="'OP_FleetRelocation'"
                :data-vv-value-path="'OP_FleetRelocation'"
              >
                <b-row>
                  <b-col md="2">
                    <div>
                      <!-- <img :src="M_NewProspect.path_file" alt width="100%" /> -->
                      <img :src="require('@/assets/paper.png')" alt style="width: 70px;" />
                    </div>
                  </b-col>
                  <b-col md="10">
                    <b-row class="row-bordered">
                      <b-col md="6" offset="2">
                        <b-row>
                          <b-col class="row-view">
                            <span>
                              <label>Fleet Number</label>
                            </span>
                            <br />
                            <span>
                              <label>{{M_OpFleetRelocation.fleet_no}}</label>
                            </span>
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col md="6" class="col-p-1">
                            <span>
                              <label style="width: 100px;">Return Date</label>
                            </span>
                            <ACCDateTime
                              :prop="PI_return_date"
                              v-model="M_OpFleetRelocation.return_date"
                              ref="ref_return_date"
                            />
                          </b-col>
                          <b-col md="6" class="col-p-2">
                            <span>
                              <label>Return To</label>
                            </span>
                            <ACCDropDown
                              @change="Onreturn_toChange"
                              :prop="PI_return_to"
                              v-model="M_OpFleetRelocation.return_to"
                              :label="M_OpFleetRelocation.return_toLabel"
                              ref="ref_return_to"
                            />
                          </b-col>
                        </b-row>

                        <b-row>
                          <b-col md="6" class="col-p-1">
                            <span>
                              <label style="width: 100px;">Driver</label>
                            </span>
                            <ACCDropDown
                              @change="Ondriver_idChange"
                              :prop="PI_driver_id"
                              v-model="M_OpFleetRelocation.driver_id"
                              :label="M_OpFleetRelocation.driver_idLabel"
                              ref="ref_driver_id"
                            />
                          </b-col>
                          <b-col md="6" class="col-p-2">
                            <span>
                              <label>Co Driver</label>
                            </span>
                            <ACCDropDown
                              @change="Onco_driver_idChange"
                              :prop="PI_co_driver_id"
                              v-model="M_OpFleetRelocation.co_driver_id"
                              :label="M_OpFleetRelocation.co_driver_idLabel"
                              ref="ref_co_driver_id"
                            />
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col>
                            <span>
                              <label>Description</label>
                            </span>
                            <ACCTextArea
                              :prop="PI_descs"
                              v-model="M_OpFleetRelocation.descs"
                              ref="ref_descs"
                            />
                          </b-col>
                        </b-row>

                        <b-row style="margin-top: 10px;">
                          <b-col>
                            <ABSButton
                              :text="'Save '"
                              classButton="btn btn--default"
                              classIcon="icon-style-default"
                              @click="doSave"
                              styleButton="height: 40px;width: 100%;"
                            />
                          </b-col>
                        </b-row>
                        <br />
                        <br />
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
      title: "",

      M_OpFleetRelocation: {
        ss_portfolio_id: 0,
        fleet_id: "",
        fleet_no: "",
        return_date: new Date(),
        return_to: "",
        return_toLabel: "",
        driver_id: "",
        driver_idLabel: "",
        co_driver_id: "",
        co_driver_idLabel: "",
        descs: "",
        user_input: "",
        user_edit: "",
        time_input: "",
        time_edit: "",
        row_id: 0,
        lastupdatestamp: 0,
      },
      PI_fleet_id: {
        cValidate: "",
        cName: "fleet_id",
        cOrder: 0,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "OP_FleetRelocation",
        cDecimal: 2,
        cInputStatus: this.inputStatus,
      },

      PI_return_date: {
        cValidate: "required",
        cName: "return_date",
        cOrder: 1,
        cKey: false,
        cProtect: false,
        cWithTime: false,
        cFormat: "dd/MM/yyyy",
        cParentForm: "OP_FleetRelocation",
      },
      PI_return_to: {
        dataLookUp: {
          LookUpCd: "GetZone",
          ColumnDB: "cm_zone_id",
          InitialWhere: "",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "",
        },
        cValidate: "required",
        cName: "return_to",
        cOrder: 2,
        cKey: false,
        cStatic: false,
        cProtect: false,
        cParentForm: "OP_FleetRelocation",
        cOption: [],
        cDisplayColumn: "zone_code",
        cInputStatus: this.inputStatus,
      },
      PI_driver_id: {
        dataLookUp: {
          LookUpCd: "GetDriver",
          ColumnDB: "driver_id",
          InitialWhere: "",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "",
        },
        cValidate: "required",
        cName: "driver_id",
        cOrder: 3,
        cKey: false,
        cStatic: false,
        cProtect: false,
        cParentForm: "OP_FleetRelocation",
        cOption: [],
        cDisplayColumn: "full_name",
        cInputStatus: this.inputStatus,
      },
      PI_co_driver_id: {
        dataLookUp: {
          LookUpCd: "GetDriver",
          ColumnDB: "driver_id",
          InitialWhere: "",
          ParamWhere: "wawan",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "",
        },
        cValidate: "required",
        cName: "co_driver_id",
        cOrder: 4,
        cKey: false,
        cStatic: false,
        cProtect: false,
        cParentForm: "OP_FleetRelocation",
        cOption: [],
        cDisplayColumn: "full_name",
        cInputStatus: this.inputStatus,
      },
      PI_descs: {
        cValidate: "required",
        cName: "descs",
        cOrder: 5,
        cKey: false,
        cProtect: false,
        cResize: false,
        cReadonly: false,
        cRows: 3,
        cMaxRows: 3,
        cSize: "md",
        cParentForm: "OP_FleetRelocation",
        cInputStatus: this.inputStatus,
      },
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
    },
  },
  methods: {
    Ondriver_idChange(data) {
      this.$nextTick(() => {
        this.M_OpFleetRelocation.driver_id = data.id;
        this.M_OpFleetRelocation.driver_idLabel = data.label;
      });
    },
    Onco_driver_idChange(data) {
      this.$nextTick(() => {
        this.M_OpFleetRelocation.co_driver_id = data.id;
        this.M_OpFleetRelocation.co_driver_idLabel = data.label;
      });
    },
    Onreturn_toChange(data) {
      this.$nextTick(() => {
        this.M_OpFleetRelocation.return_to = data.id;
        this.M_OpFleetRelocation.return_toLabel = data.label;
      });
    },
    doBack() {
      this.$router.go(-1);
    },

    M_ClearForm() {
      this.M_OpFleetRelocation = {
        ss_portfolio_id: 0,
        fleet_id: "",
        fleet_no: "",
        return_date: new Date(),
        return_to: "",
        return_toLabel: "",
        driver_id: "",
        driver_idLabel: "",
        co_driver_id: "",
        co_driver_idLabel: "",
        descs: "",
        user_input: "",
        user_edit: "",
        time_input: "",
        time_edit: "",
        row_id: 0,
        lastupdatestamp: 0,
      };
    },

    doSave() {
      this.$validator._base.validateAll("OP_FleetRelocation").then((result) => {
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
          (ress) => {
            if (ress.value) {
              this.$validator.errors.clear("OP_FleetRelocation");
              if (this.inputStatus == "edit") {
                this.M_Save();
              } else {
                this.M_Save();
              }
            }
          }
        );
      });
    },
    M_Save() {
      var param = {
        option_url: "/OP/OP_FleetAvailability",
        line_no: 1,
        fm_fleet_mstr_id: this.paramFromList.detailList.fm_fleet_mstr_id,
        return_date: this.M_OpFleetRelocation.return_date,
        return_cm_zone_id: this.M_OpFleetRelocation.return_to,
        fm_driver_id: this.M_OpFleetRelocation.driver_id,
        fm_driver_id2: this.M_OpFleetRelocation.co_driver_id,
        descs: this.M_OpFleetRelocation.descs,
        user_input: this.getDataUser().user_id,
      };

      this.postJSON(this.getUrlCRUD(), param).then((response) => {
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          this.doBack();
        });
      });
    },
    M_Update() {
      var param = {
        option_url: "/OP/OP_FleetAvailability",
        line_no: 0,
        fm_fleet_brand_id: this.M_OpFleetRelocation.fm_fleet_brand_id,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        fleet_id: this.M_OpFleetRelocation.fleet_id,
        pic: this.M_OpFleetRelocation.pic,
        phone_no:
          this.M_OpFleetRelocation.return_date +
          "-" +
          this.M_OpFleetRelocation.return_to,
        lastupdatestamp: this.paramFromList.lastupdatestamp,
        user_edit: this.getDataUser().user_id,
      };

      this.putJSON(this.getUrlCRUD(), param).then((response) => {
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          this.doBack();
        });
      });
    },
    M_Delete() {
      var param = {
        option_url: "/OP/OP_FleetAvailability",
        line_no: { LineNo },
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp,
      };
      this.deleteJSON(this.getUrlCRUD(), param).then((response) => {
        if (response == null) return;
        this.alertSuccess("Data Has Been Deleted").then(() => {
          this.doBack();
        });
      });
    },
    GetDataBy() {
      var param = {
        option_url: "/OP/OP_FleetAvailability",
        line_no: 1,
        id: this.paramFromList.detailList.row_id,
        lastupdatestamp: this.paramFromList.detailList.lastupdatestamp,
      };

      this.getJSON(this.getUrlCRUD(), param).then((response) => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];

        this.M_OpFleetRelocation = {
          fleet_id: this.paramFromList.detailList.fm_fleet_mstr_id,
          fleet_no: this.paramFromList.detailList.fleet,
          return_date: new Date(),
          return_to: "",
          driver_id: data.fm_driver_id__lo_1,
          driver_idLabel: data.driver_name__lbl__lo_1,
          co_driver_id: data.fm_driver_id2,
          co_driver_idLabel: data.driver_name2,
          user_input: data.user_input,
          user_edit: data.user_edit,
          time_input: data.time_input,
          time_edit: data.time_edit,
          row_id: data.row_id,
          lastupdatestamp: data.lastupdatestamp,
        };
      });
    },
  },
  mounted() {
    this.M_ClearForm();
    if (this.inputStatus == "edit") {
      this.title = "Edit";
      this.GetDataBy();
    } else {
      this.PI_fleet_id.cProtect = false;
      this.title = "Add";
    }
  },
};
</script>

