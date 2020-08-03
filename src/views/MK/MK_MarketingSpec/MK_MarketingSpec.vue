<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Marketing Spesification</span>
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
              <b-form :data-vv-scope="'M_ScreenSpec'" :data-vv-value-path="'M_ScreenSpec'">
                <!-- <b-row> -->
                <b-row class="dashboardBody">
                  <b-col md="6">
                    <div class="card">
                      <!-- kiri -->
                      <div class="card__title">
                        <b-row>
                          <b-col style="max-width:fit-content !important;">
                            <span>Action</span>
                          </b-col>
                        </b-row>
                      </div>
                      <div class="card__body">
                        <!-- isi -->
                        <b-row class="row">
                          <b-col md="4">
                            <span>
                              <label></label>
                            </span>
                          </b-col>
                          <b-col md="2">
                            <label>Point</label>
                          </b-col>
                        </b-row>
                        <b-row class="row">
                          <b-col md="4">
                            <span>
                              <label>Call</label>
                            </span>
                          </b-col>
                          <b-col md="2">
                            <ACCTextBox
                              :prop="PI_action_call_point"
                              v-model="M_Spec.action_call_point"
                              ref="ref_action_call_point"
                            />
                          </b-col>
                        </b-row>
                        <b-row class="row">
                          <b-col md="4">
                            <span>
                              <label>Visit</label>
                            </span>
                          </b-col>
                          <b-col md="2">
                            <ACCTextBox
                              :prop="PI_action_visit_point"
                              v-model="M_Spec.action_visit_point"
                              ref="ref_action_visit_point"
                            />
                          </b-col>
                        </b-row>
                        <b-row class="row">
                          <b-col md="4">
                            <span>
                              <label>Entertainment</label>
                            </span>
                          </b-col>
                          <b-col md="2">
                            <ACCTextBox
                              :prop="PI_action_entertain_point"
                              v-model="M_Spec.action_entertain_point"
                              ref="ref_action_entertain_point"
                            />
                          </b-col>
                        </b-row>
                      </div>
                    </div>
                  </b-col>
                  <b-col md="6">
                    <div class="card">
                      <div class="card__title">
                        <b-row>
                          <b-col style="max-width:fit-content !important;">
                            <span>Working Days</span>
                          </b-col>
                        </b-row>
                      </div>
                      <div class="card__body">
                        <b-row class="row">
                          <b-col md="6">
                            <!-- <input type="checkbox" id="vehicle1" name="vehicle1" value="Bike" /> -->
                            <input
                              style="vertical-align:middle !important"
                              type="checkbox"
                              name="cb_module"
                              id="M_Spec.working_days_monday"
                              v-model="M_Spec.working_days_monday"
                            />
                            &nbsp;
                            <span>
                              <label for="M_Spec.working_days_monday">Monday</label>
                            </span>
                            <!-- <label for="vehicle1">Monday</label> -->
                          </b-col>
                          <b-col md="6">
                            <input
                              style="vertical-align:middle !important"
                              type="checkbox"
                              name="cb_module"
                              id="M_Spec.working_days_tuesday"
                              v-model="M_Spec.working_days_tuesday"
                            />
                            &nbsp;
                            <label
                              for="M_Spec.working_days_tuesday"
                            >Tuesday</label>
                          </b-col>
                        </b-row>
                        <b-row class="row">
                          <b-col md="6">
                            <input
                              style="vertical-align:middle !important"
                              type="checkbox"
                              name="cb_module"
                              id="M_Spec.working_days_wednesday"
                              v-model="M_Spec.working_days_wednesday"
                            />
                            &nbsp;
                            <label
                              for="M_Spec.working_days_wednesday"
                            >Wednesday</label>
                          </b-col>
                          <b-col md="6">
                            <input
                              style="vertical-align:middle !important"
                              type="checkbox"
                              name="cb_module"
                              id="M_Spec.working_days_thursday"
                              v-model="M_Spec.working_days_thursday"
                            />
                            &nbsp;
                            <label
                              for="M_Spec.working_days_thursday"
                            >Thursday</label>
                          </b-col>
                        </b-row>
                        <b-row class="row">
                          <b-col md="6">
                            <input
                              style="vertical-align:middle !important"
                              type="checkbox"
                              name="cb_module"
                              id="M_Spec.working_days_friday"
                              v-model="M_Spec.working_days_friday"
                            />
                            &nbsp;
                            <label
                              for="M_Spec.working_days_friday"
                            >Friday</label>
                          </b-col>
                          <b-col md="6">
                            <input
                              style="vertical-align:middle !important"
                              type="checkbox"
                              name="cb_module"
                              id="M_Spec.working_days_saturday"
                              v-model="M_Spec.working_days_saturday"
                              @click="OnChecClick()"
                            />
                            &nbsp;
                            <label
                              for="M_Spec.working_days_saturday"
                            >Saturday</label>
                            {{M_Spec.working_days_saturday}}
                          </b-col>
                        </b-row>
                        <b-row class="row">
                          <b-col md="6">
                            <input
                              style="vertical-align:middle !important"
                              type="checkbox"
                              name="cb_module"
                              id="M_Spec.working_days_sunday"
                              v-model="M_Spec.working_days_sunday"
                              @click="OnChecClick()"
                            />
                            &nbsp;
                            <label
                              for="M_Spec.working_days_sunday"
                            >Sunday</label>
                            {{M_Spec.working_days_sunday}}
                          </b-col>
                          <!-- <b-col md="6"></b-col> -->
                        </b-row>
                      </div>
                    </div>
                  </b-col>
                </b-row>
                <b-row class="dashboardBody">
                  <b-col md="6">
                    <div class="card">
                      <!-- kiri -->
                      <div class="card__title">
                        <b-row>
                          <b-col style="max-width:fit-content !important;">
                            <span>General</span>
                          </b-col>
                        </b-row>
                      </div>
                      <div class="card__body">
                        <!-- isi -->
                        <b-row class="row">
                          <b-col md="4">
                            <span>
                              <label>Customer Name</label>
                            </span>
                          </b-col>
                          <b-col md="6">
                            <ACCDropDown
                              @change="Oncm_contact_idChange"
                              :prop="PI_cm_contact_id"
                              v-model="M_Spec.cm_contact_id"
                              :label="M_Spec.cm_contact_idLabel"
                              ref="ref_cm_contact_id"
                            />
                          </b-col>
                        </b-row>
                      </div>
                    </div>
                  </b-col>
                </b-row>
                <b-row class="dashboardBody">
                  <b-col md="12">
                    <b-row>
                      <b-col md="12">
                        <ABSButton
                          :text="'Save'"
                          classButton="btn btn--default"
                          classIcon="icon-style-default"
                          @click="doSave"
                          styleButton="height: 40px;width: 100%;"
                        />
                      </b-col>
                    </b-row>
                  </b-col>
                </b-row>

                <!-- </b-row> -->
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
      inputStatus: "",
      PI_action_call_point: {
        cValidate: "",
        cName: "action_call_point",
        cOrder: 1,
        cKey: false,
        cType: "decimal",
        cProtect: false,
        cParentForm: "",
        cDecimal: 2,
        cInputStatus: this.inputStatus,
      },
      PI_action_visit_point: {
        cValidate: "",
        cName: "action_visit_point",
        cOrder: 2,
        cKey: false,
        cType: "decimal",
        cProtect: false,
        cParentForm: "",
        cDecimal: 2,
        cInputStatus: this.inputStatus,
      },
      PI_action_entertain_point: {
        cValidate: "",
        cName: "action_entertain_point",
        cOrder: 3,
        cKey: false,
        cType: "decimal",
        cProtect: false,
        cParentForm: "",
        cDecimal: 2,
        cInputStatus: this.inputStatus,
      },
      M_Spec: {
        action_call_point: 0,
        action_visit_point: 0,
        action_entertain_point: 0,
        working_days_monday: false,
        working_days_tuesday: false,
        working_days_wednesday: false,
        working_days_thursday: false,
        working_days_friday: false,
        working_days_saturday: false,
        working_days_sunday: false,
        new_cm_customer_status_id: 0,
        cm_contact_id: 0,
        cm_contact_idLabel: "",
      },
      PI_cm_contact_id: {
        dataLookUp: {
          LookUpCd: "GetCMContact",
          ColumnDB: "contact_id",
          InitialWhere:
            "ss_portfolio_id='" + this.getDataUser().portfolio_id + "'",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "",
        },
        cValidate: "",
        cName: "cm_contact_id",
        ckey: false,
        cOrder: 6,
        // cDefault: '',
        cProtect: false,
        cParentForm: "",
        cStatic: false,
        cOption: [],
        cDisplayColumn: "row_id,name",
        cInputStatus: this.inputStatus,
      },
      default_pic: require("@/assets/default_photo_.png"),
    };
  },
  computed: {
    paramFromList() {
      var param = this.$route.params;
      // if (param == null || param == undefined) {
      //   this.doBack();
      // } else {
      //   if (Object.keys(param).length < 1) {
      //     this.doBack();
      //   } else {
      return param;
      //   }
      // }
    },
    // inputStatus() {
    //   var param = this.$route.params;
    //   if (param.isEdit && param.isEdit === true) {
    //     return "edit";
    //   } else {
    //     return "new";
    //   }
    // }
  },
  methods: {
    Oncm_contact_idChange(data) {
      this.$nextTick(() => {
        this.M_Spec.cm_contact_id = data.id;
        this.M_Spec.cm_contact_idLabel = data.label;
      });
      this.$forceUpdate();
    },
    doBack() {
      this.$router.go(-1);
    },
    M_ClearForm() {
      this.M_Spec = {
        action_call_point: 0,
        action_visit_point: 0,
        action_entertain_point: 0,
        working_days_monday: false,
        working_days_tuesday: false,
        working_days_wednesday: false,
        working_days_thursday: false,
        working_days_friday: false,
        working_days_saturday: false,
        working_days_sunday: false,
        new_cm_customer_status_id: 0,
        cm_contact_id: 0,
        cm_contact_idLabel: "",
      };
    },
    OnChecClick() {},
    Onworking_days_mondayChange(data) {},
    Onworking_days_tuesdayChange(data) {
      this.$nextTick(() => {});
    },
    Onworking_days_wednesdayChange(data) {
      this.$nextTick(() => {});
    },
    Onworking_days_thursdayChange(data) {
      this.$nextTick(() => {});
    },
    Oncustomer_statusChange(data) {
      this.$nextTick(() => {});
    },
    doSave() {
      this.$validator._base.validateAll("M_ScreenSpec").then((result) => {
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
          (ress) => {
            if (ress.value) {
              this.$validator.errors.clear("M_ScreenSpec");
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
        option_url: "/MK/MK_MarketingSpec",
        line_no: 0,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        action_call_point: this.M_Spec.action_call_point,
        action_visit_point: this.M_Spec.action_visit_point,
        action_entertain_point: this.M_Spec.action_entertain_point,
        working_days_monday: this.M_Spec.working_days_monday ? "Y" : "N",
        working_days_tuesday: this.M_Spec.working_days_tuesday ? "Y" : "N",
        working_days_wednesday: this.M_Spec.working_days_wednesday ? "Y" : "N",
        working_days_thursday: this.M_Spec.working_days_thursday ? "Y" : "N",
        working_days_friday: this.M_Spec.working_days_friday ? "Y" : "N",
        working_days_saturday: this.M_Spec.working_days_saturday ? "Y" : "N",
        working_days_sunday: this.M_Spec.working_days_sunday ? "Y" : "N",
        new_cm_customer_status_id: 0,
        cm_contact_id:
          this.M_Spec.cm_contact_id == null || this.M_Spec.cm_contact_id == 0
            ? null
            : this.M_Spec.cm_contact_id,
        user_input: this.getDataUser().user_id,
      };

      this.postJSON(this.getUrlCRUD(), param).then((response) => {
        // console.log(response)
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          this.inputStatus = "edit";
        });
      });
    },
    M_Update() {
      var param = {
        option_url: "/MK/MK_MarketingSpec",
        line_no: 0,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        action_call_point: this.M_Spec.action_call_point,
        action_visit_point: this.M_Spec.action_visit_point,
        action_entertain_point: this.M_Spec.action_entertain_point,
        working_days_monday: this.M_Spec.working_days_monday ? "Y" : "N",
        working_days_tuesday: this.M_Spec.working_days_tuesday ? "Y" : "N",
        working_days_wednesday: this.M_Spec.working_days_wednesday ? "Y" : "N",
        working_days_thursday: this.M_Spec.working_days_thursday ? "Y" : "N",
        working_days_friday: this.M_Spec.working_days_friday ? "Y" : "N",
        working_days_saturday: this.M_Spec.working_days_saturday ? "Y" : "N",
        working_days_sunday: this.M_Spec.working_days_sunday ? "Y" : "N",
        new_cm_customer_status_id: 0,
        cm_contact_id:
          this.M_Spec.cm_contact_id == null || this.M_Spec.cm_contact_id == 0
            ? null
            : this.M_Spec.cm_contact_id,
        user_edit: this.getDataUser().user_id,
      };

      this.putJSON(this.getUrlCRUD(), param).then((response) => {
        // console.log(response)
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          this.inputStatus = "edit";
        });
      });
    },
    GetMKSpecData() {
      var param = {
        option_function_cd: "GetMkSpec",
        module_cd: "MK",
        portfolio_id: this.getDataUser().portfolio_id,
      };

      this.CallFunction(param).then((response) => {
        // response from API
        if (response == null) return;
        console.log(response.Data.length);
        if (response.Data.length > 0) {
          this.inputStatus = "edit";
        } else {
          this.inputStatus = "new";
          return;
        }
        var data = response.Data[0];

        this.M_Spec = {
          action_call_point: data.action_call_point,
          action_visit_point: data.action_entertain_point,
          action_entertain_point: data.action_entertain_point,
          working_days_monday: data.working_days_monday == "Y" ? true : false,
          working_days_tuesday: data.working_days_tuesday == "Y" ? true : false,
          working_days_thursday:
            data.working_days_thursday == "Y" ? true : false,
          working_days_wednesday:
            data.working_days_wednesday == "Y" ? true : false,
          working_days_friday: data.working_days_friday == "Y" ? true : false,
          working_days_saturday:
            data.working_days_saturday == "Y" ? true : false,
          working_days_sunday: data.working_days_sunday == "Y" ? true : false,
          cm_contact_id: data.cm_contact_id,
          cm_contact_idLabel: data.customer_name,
        };
      });
    },
  },
  mounted() {
    // this.M_ClearForm();

    this.GetMKSpecData();
  },
};
</script>

<style>
</style>