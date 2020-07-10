<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>{{title}} Master Vehicle Type</span>
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
                :data-vv-scope="'OP_FormFmFleetType'"
                :data-vv-value-path="'OP_FormFmFleetType'"
              >
                <b-row>
                  <b-col md="2">
                    <div>
                      <!-- <img :src="M_NewProspect.path_file" alt width="100%" /> -->
                      <img :src="require('@/assets/paper.png')" alt style="width: 70px;" />
                    </div>
                  </b-col>
                  <b-col md="10">
                    <b-row style="border: solid 1px #ccc; border-radius: 10px;">
                      <b-col md="12">
                        <b-row>
                          <b-col md="6">
                            <span>
                              <label>Fleet Cd</label>
                            </span>
                            <ACCTextBox
                              :prop="PI_fleet_cd"
                              v-model="M_FmFleetType.fleet_cd"
                              ref="ref_fleet_cd"
                            />
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col md="6">
                            <span>
                              <label>Descs</label>
                            </span>
                            <ACCTextBox
                              :prop="PI_descs"
                              v-model="M_FmFleetType.descs"
                              ref="ref_descs"
                            />
                          </b-col>
                        </b-row>

                        <b-row style="margin-top: 10px;">
                          <b-col md="6">
                            <ABSButton
                              :text="'Save FleetType'"
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

      M_FmFleetType: {
        fm_fleet_type_id: 0,
        fleet_cd: "",
        descs: "",
        file_name: "",
        path_file: "",
        user_input: "",
        user_edit: "",
        time_input: "",
        time_edit: "",
        ss_portfolio_id: 0,
        row_id: 0,
        lastupdatestamp: 0
      },
      PI_fleet_cd: {
        cValidate: "",
        cName: "fleet_cd",
        cOrder: 1,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "OP_FormFmFleetType",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_descs: {
        cValidate: "",
        cName: "descs",
        cOrder: 2,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "OP_FormFmFleetType",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      }
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

    M_ClearForm() {
      this.M_FmFleetType = {
        fm_fleet_type_id: 0,
        fleet_cd: "",
        descs: "",
        file_name: "",
        path_file: "",
        user_input: "",
        user_edit: "",
        time_input: "",
        time_edit: "",
        ss_portfolio_id: 0,
        row_id: 0,
        lastupdatestamp: 0
      };
    },

    doSave() {
      this.$validator._base.validateAll("OP_FormFmFleetType").then(result => {
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
          ress => {
            if (ress.value) {
              this.$validator.errors.clear("OP_FormFmFleetType");
              if (this.inputStatus == "edit") {
                this.M_Update();
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
        option_url: "/OP/OP_FleetType",
        line_no: 0,
        fleet_cd: this.M_FmFleetType.fleet_cd,
        descs: this.M_FmFleetType.descs,
        file_name: this.M_FmFleetType.file_name,
        path_file: this.M_FmFleetType.path_file,
        user_input: this.getDataUser().user_id,
        ss_portfolio_id: this.getDataUser().portfolio_id
      };

      this.postJSON(this.getUrlCRUD(), param).then(response => {
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          this.doBack();
        });
      });
    },
    M_Update() {
      var param = {
        option_url: "/OP/OP_FleetType",
        line_no: 0,
        fm_fleet_type_id: this.M_FmFleetType.fm_fleet_type_id,
        fleet_cd: this.M_FmFleetType.fleet_cd,
        descs: this.M_FmFleetType.descs,
        file_name: this.M_FmFleetType.file_name,
        path_file: this.M_FmFleetType.path_file,
        lastupdatestamp: this.paramFromList.lastupdatestamp,
        user_edit: this.getDataUser().user_id,
        ss_portfolio_id: this.getDataUser().portfolio_id
      };

      this.putJSON(this.getUrlCRUD(), param).then(response => {
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          this.doBack();
        });
      });
    },
    M_Delete() {
      var param = {
        option_url: "/OP/OP_FleetType",
        line_no: { LineNo },
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };
      this.deleteJSON(this.getUrlCRUD(), param).then(response => {
        if (response == null) return;
        this.alertSuccess("Data Has Been Deleted").then(() => {
          this.doBack();
        });
      });
    },
    GetDataBy() {
      var param = {
        option_url: "/OP/OP_FleetType",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };

      this.getJSON(this.getUrlCRUD(), param).then(response => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];

        this.M_FmFleetType = {
          fm_fleet_type_id: data.fm_fleet_type_id,
          fleet_cd: data.fleet_cd__tb_1,
          descs: data.descs__tb_2,
          file_name: data.file_name,
          path_file: data.path_file,
          user_input: data.user_input,
          user_edit: data.user_edit,
          time_input: data.time_input,
          time_edit: data.time_edit,
          ss_portfolio_id: data.ss_portfolio_id,
          row_id: data.row_id,
          lastupdatestamp: data.lastupdatestamp
        };
      });
    }
  },
  mounted() {
    this.M_ClearForm();
    if (this.inputStatus == "edit") {
      this.title = "Edit";
      this.PI_fleet_cd.cProtect = true;
      this.GetDataBy();
    } else {
      this.PI_fleet_cd.cProtect = false;
      this.title = "Add";
    }
  }
};
</script>

