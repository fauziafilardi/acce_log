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
              <b-form
                :data-vv-scope="'MK_AddNewProspect'"
                :data-vv-value-path="'MK_AddNewProspect'"
              >
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
                          <!-- <b-col style="text-align: right;">
                            <span>
                              <ABSButton
                                :text="'View All'"
                                classButton="button button--new"
                                classIcon="icon-style-1"
                                :disabled="true"
                              />
                            </span>
                          </b-col>-->
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
                              :prop="PI_action_call_point"
                              v-model="M_Spec.action_call_point"
                              ref="ref_action_call_point"
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
                              :prop="PI_action_call_point"
                              v-model="M_Spec.action_call_point"
                              ref="ref_action_call_point"
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
                          <!-- <b-col style="text-align: right;">
                            <span>
                              <ABSButton
                                :text="'View All'"
                                classButton="button button--new"
                                classIcon="icon-style-1"
                                :disabled="true"
                              />
                            </span>
                          </b-col>-->
                        </b-row>
                      </div>
                      <div class="card__body">
                        <!-- <b-row class="CommisionData">
                          <b-col class="CommisionIcon">
                            <span>
                              <font-awesome-icon
                                style="color: #333399;margin-right: 20px;"
                                icon="coins"
                                size="4x"
                              />
                            </span>
                          </b-col>
                          <b-col style="margin: auto;">
                            <span class="Commision__TitleBlue">Paid</span> &nbsp;
                            <span class="CommisionTitle">(Last 12 Months)</span>
                            <br />
                            <span class="CommisionDescs">Rp 22.500.000</span>
                          </b-col>
                        </b-row>
                        <b-row class="CommisionData">
                          <b-col class="CommisionIcon">
                            <span>
                              <font-awesome-icon
                                style="color: #cc0000;margin-right: 20px;"
                                icon="exclamation-circle"
                                size="4x"
                              />
                            </span>
                          </b-col>
                          <b-col style="margin: auto;">
                            <span class="Commision__TitleRed">Overdue</span> &nbsp;
                            <span class="CommisionTitle"></span>
                            <br />
                            <span class="CommisionDescs">Rp 13.250.000</span>
                          </b-col>
                        </b-row>
                        <b-row class="CommisionData">
                          <b-col class="CommisionIcon">
                            <span>
                              <font-awesome-icon
                                style="color: #00cc33;margin-right: 20px;"
                                icon="stopwatch"
                                size="5x"
                              />
                            </span>
                          </b-col>
                          <b-col style="margin: auto;">
                            <span class="Commision__TitleGreen">Pending</span> &nbsp;
                            <span class="CommisionTitle"></span>
                            <br />
                            <span class="CommisionDescs">Rp 32.380.000</span>
                          </b-col>
                        </b-row>-->
                        <b-row class="row">
                          <b-col md="6">
                            <input type="checkbox" id="vehicle1" name="vehicle1" value="Bike" />
                            &nbsp;
                            <span>
                              <label>Monday</label>
                            </span>
                            <!-- <label for="vehicle1">Monday</label> -->
                          </b-col>
                          <b-col md="6">
                            <input type="checkbox" id="vehicle2" name="vehicle2" value="Car" />
                            <label for="vehicle2">Tuesday</label>
                          </b-col>
                        </b-row>
                        <b-row class="row">
                          <b-col md="6">
                            <input type="checkbox" id="vehicle1" name="vehicle1" value="Bike" />
                            <label for="vehicle1">Wednesday</label>
                          </b-col>
                          <b-col md="6">
                            <input type="checkbox" id="vehicle2" name="vehicle2" value="Car" />
                            <label for="vehicle2">Thursday</label>
                          </b-col>
                        </b-row>
                        <b-row class="row">
                          <b-col md="6">
                            <input type="checkbox" id="vehicle1" name="vehicle1" value="Bike" />
                            <label for="vehicle1">Friday</label>
                          </b-col>
                          <b-col md="6">
                            <input type="checkbox" id="vehicle2" name="vehicle2" value="Car" />
                            <label for="vehicle2">Saturday</label>
                          </b-col>
                        </b-row>
                        <b-row class="row">
                          <b-col md="12">
                            <b-col>
                              <input
                                style="vertical-align:middle !important"
                                type="checkbox"
                                name="cb_module"
                                id="M_Spec.working_days_sunday"
                                v-model="M_Spec.working_days_sunday"
                              />
                            </b-col>
                            <b-col>
                              <span>Monday</span>
                            </b-col>
                          </b-col>
                          <!-- <b-col md="6"></b-col> -->
                        </b-row>
                      </div>
                    </div>
                  </b-col>
                </b-row>
                <b-row style="margin-top: 70%;">
                  <b-col md="12">
                    <ABSButton
                      :text="'Save Customer'"
                      classButton="btn btn--default"
                      classIcon="icon-style-default"
                      @click="doSave"
                      styleButton="height: 40px;width: 100%;"
                    />
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
      PI_action_call_point: {
        cValidate: "",
        cName: "action_call_point",
        cOrder: 1,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "ADM_AddGroupManagement",
        cDecimal: 2,
        cInputStatus: this.inputStatus
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
        new_cm_customer_status_id: 0
      },
      default_pic: require("@/assets/default_photo_.png")
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
    inputStatus() {
      var param = this.$route.params;
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
        new_cm_customer_status_id: 0
      };
    },
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
      this.$validator._base.validateAll("MK_AddNewProspect").then(result => {
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
          ress => {
            if (ress.value) {
              this.$validator.errors.clear("MK_AddNewProspect");
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
        option_url: "/MK/MK_NewProspect",
        line_no: 0,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        name: this.M_Spec.action_call_point,
        action_entertain_point: this.M_Spec.action_entertain_point,
        ss_working_days_thursday_id: this.M_Spec.working_days_thursday,
        ss_working_days_wednesday_id: this.M_Spec.working_days_wednesday,
        ss_working_days_tuesday_id: this.M_Spec.working_days_tuesday,
        ss_working_days_monday_id: this.M_Spec.working_days_monday,
        new_cm_customer_status_id: this.M_Spec.new_cm_customer_status_id,
        user_input: this.getDataUser().user_id
      };

      this.postJSON(this.getUrlCRUD(), param).then(response => {
        // console.log(response)
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          this.doBack();
        });
      });
    },
    GetDataBy() {
      var param = {
        option_url: "/MK/MK_NewProspect",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };

      this.getJSON(this.getUrlCRUD(), param).then(response => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];

        this.M_Spec = {
          action_entertain_point: data.action_entertain_point,
          working_days_monday: data.ss_working_days_monday_id,
          // : data.working_days_monday,
          working_days_tuesday: data.ss_working_days_tuesday_id,
          // working_days_tuesdayLabel: data.working_days_tuesday,
          working_days_wednesday: data.ss_working_days_wednesday_id,
          // working_days_wednesdayLabel: data.working_days_wednesday,
          working_days_thursday: data.ss_working_days_thursday_id,
          //working_days_thursdayLabel: data.working_days_thursday,
          working_days_friday: phone_no !== "" ? phone_no[0] : phone_no,
          working_days_saturday: phone_no !== "" ? phone_no[1] : phone_no,
          working_days_sunday: phone_no !== "" ? phone_no[2] : phone_no,
          new_cm_customer_status_id: data.new_cm_customer_status_id
        };
      });
    },
    M_Update() {
      var param = {
        option_url: "/MK/MK_NewProspect",
        line_no: 0,
        cm_contact_id: this.paramFromList.row_id,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        name: this.M_Spec.action_call_point,
        action_entertain_point: this.M_Spec.action_entertain_point,
        ss_working_days_thursday_id: this.M_Spec.working_days_thursday,
        ss_working_days_wednesday_id: this.M_Spec.working_days_wednesday,
        ss_working_days_tuesday_id: this.M_Spec.working_days_tuesday,
        ss_working_days_monday_id: this.M_Spec.working_days_monday,
        new_cm_customer_status_id: this.M_Spec.new_cm_customer_status_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp,
        user_edit: this.getDataUser().user_id
      };

      this.putJSON(this.getUrlCRUD(), param).then(response => {
        // console.log(response)
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          this.doBack();
        });
      });
    }
  },
  mounted() {
    this.M_ClearForm();
    if (this.inputStatus == "edit") {
      this.GetDataBy();
    }
  }
};
</script>

<style>
</style>