<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>{{title}} Master Vehicle Carosery</span>
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
                :data-vv-scope="'OP_FormFmFleetCarosery'"
                :data-vv-value-path="'OP_FormFmFleetCarosery'"
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
                              <label>Carosery Name</label>
                            </span>
                            <ACCTextBox
                              :prop="PI_carosery_name"
                              v-model="M_FmFleetCarosery.carosery_name"
                              ref="ref_carosery_name"
                            />
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col md="6">
                            <span>
                              <label>Company Name</label>
                            </span>
                            <ACCTextBox
                              :prop="PI_company_name"
                              v-model="M_FmFleetCarosery.company_name"
                              ref="ref_company_name"
                            />
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col md="6">
                            <span>
                              <label>Pic</label>
                            </span>
                            <ACCTextBox
                              :prop="PI_pic"
                              v-model="M_FmFleetCarosery.pic"
                              ref="ref_pic"
                            />
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col md="1" class="col-p-1">
                            <span>
                              <label style="width: 100px;">Phone No.</label>
                            </span>
                            <ACCTextBox
                              :prop="PI_phone_no_1"
                              v-model="M_FmFleetCarosery.phone_no_1"
                              ref="ref_phone_no_1"
                            />
                          </b-col>
                          <b-col md="5" class="col-p-2">
                            <span>
                              <label>&nbsp;</label>
                            </span>
                            <ACCTextBox
                              :prop="PI_phone_no_2"
                              v-model="M_FmFleetCarosery.phone_no_2"
                              ref="ref_phone_no_2"
                            />
                          </b-col>
                        </b-row>

                        <b-row style="margin-top: 10px;">
                          <b-col md="6">
                            <ABSButton
                              :text="'Save FleetCarosery'"
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

      M_FmFleetCarosery: {
        fm_fleet_carosery_id: 0,
        ss_portfolio_id: 0,
        carosery_name: "",
        company_name: "",
        pic: "",
        phone_no_1: "+62",
        phone_no_2: "",
        user_input: "",
        user_edit: "",
        time_input: "",
        time_edit: "",
        row_id: 0,
        lastupdatestamp: 0
      },
      PI_carosery_name: {
        cValidate: "",
        cName: "carosery_name",
        cOrder: 1,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "OP_FormFmFleetCarosery",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_company_name: {
        cValidate: "",
        cName: "company_name",
        cOrder: 2,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "OP_FormFmFleetCarosery",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_pic: {
        cValidate: "",
        cName: "pic",
        cOrder: 3,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "OP_FormFmFleetCarosery",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_phone_no_1: {
        cValidate: "",
        cName: "phone_no_1",
        cOrder: 4,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "OP_FormFmFleetCarosery",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_phone_no_2: {
        cValidate: "",
        cName: "phone_no_2",
        cOrder: 5,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "OP_FormFmFleetCarosery",
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
      this.M_FmFleetCarosery = {
        fm_fleet_carosery_id: 0,
        ss_portfolio_id: 0,
        carosery_name: "",
        company_name: "",
        pic: "",
        phone_no_1: "+62",
        phone_no_2: "",
        user_input: "",
        user_edit: "",
        time_input: "",
        time_edit: "",
        row_id: 0,
        lastupdatestamp: 0
      };
    },

    doSave() {
      this.$validator._base
        .validateAll("OP_FormFmFleetCarosery")
        .then(result => {
          if (!result) return;
          this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
            ress => {
              if (ress.value) {
                this.$validator.errors.clear("OP_FormFmFleetCarosery");
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
        option_url: "/OP/OP_FleetCarosery",
        line_no: 0,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        carosery_name: this.M_FmFleetCarosery.carosery_name,
        company_name: this.M_FmFleetCarosery.company_name,
        pic: this.M_FmFleetCarosery.pic,
        phone_no:
          this.M_FmFleetCarosery.phone_no_1 +
          "-" +
          this.M_FmFleetCarosery.phone_no_2,
        user_input: this.getDataUser().user_id
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
        option_url: "/OP/OP_FleetCarosery",
        line_no: 0,
        fm_fleet_carosery_id: this.M_FmFleetCarosery.fm_fleet_carosery_id,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        carosery_name: this.M_FmFleetCarosery.carosery_name,
        company_name: this.M_FmFleetCarosery.company_name,
        pic: this.M_FmFleetCarosery.pic,
        phone_no:
          this.M_FmFleetCarosery.phone_no_1 +
          "-" +
          this.M_FmFleetCarosery.phone_no_2,
        lastupdatestamp: this.paramFromList.lastupdatestamp,
        user_edit: this.getDataUser().user_id
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
        option_url: "/OP/OP_FleetCarosery",
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
        option_url: "/OP/OP_FleetCarosery",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };

      this.getJSON(this.getUrlCRUD(), param).then(response => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];
        var phone_no =
          data.phone_no__tb_4 && data.phone_no__tb_4 !== ""
            ? data.phone_no__tb_4.split("-")
            : "";
        this.M_FmFleetCarosery = {
          fm_fleet_carosery_id: data.fm_fleet_carosery_id,
          ss_portfolio_id: data.ss_portfolio_id,
          carosery_name: data.carosery_name__tb_1,
          company_name: data.company_name__tb_2,
          pic: data.pic__tb_3,
          phone_no_1: phone_no[0],
          phone_no_2: phone_no[1],
          user_input: data.user_input,
          user_edit: data.user_edit,
          time_input: data.time_input,
          time_edit: data.time_edit,
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
      this.PI_carosery_name.cProtect = true;
      this.GetDataBy();
    } else {
      this.PI_carosery_name.cProtect = false;
      this.title = "Add";
    }
  }
};
</script>

