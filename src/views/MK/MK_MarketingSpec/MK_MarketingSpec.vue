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
                            <b-form-checkbox
                              style="display: inline-flex;"
                              v-model="M_Spec.working_days_monday"
                              name="check-button"
                              switch
                              value="Y"
                              unchecked-value="N"
                              size="lg"
                            >
                              <span>
                                <label for="M_Spec.working_days_monday">Monday</label>
                              </span>
                            </b-form-checkbox>
                          </b-col>
                          <b-col md="6">
                            <b-form-checkbox
                              style="display: inline-flex;"
                              v-model="M_Spec.working_days_tuesday"
                              name="check-button"
                              switch
                              value="Y"
                              unchecked-value="N"
                              size="lg"
                            >
                              <span>
                                <label for="M_Spec.working_days_tuesday">Tuesday</label>
                              </span>
                            </b-form-checkbox>
                          </b-col>
                        </b-row>
                        <b-row class="row">
                          <b-col md="6">
                            <b-form-checkbox
                              style="display: inline-flex;"
                              v-model="M_Spec.working_days_wednesday"
                              name="check-button"
                              switch
                              value="Y"
                              unchecked-value="N"
                              size="lg"
                            >
                              <span>
                                <label for="M_Spec.working_days_wednesday">Wednesday</label>
                              </span>
                            </b-form-checkbox>
                          </b-col>
                          <b-col md="6">
                            <b-form-checkbox
                              style="display: inline-flex;"
                              v-model="M_Spec.working_days_thursday"
                              name="check-button"
                              switch
                              value="Y"
                              unchecked-value="N"
                              size="lg"
                            >
                              <span>
                                <label for="M_Spec.working_days_thursday">Thursday</label>
                              </span>
                            </b-form-checkbox>
                          </b-col>
                        </b-row>
                        <b-row class="row">
                          <b-col md="6">
                            <b-form-checkbox
                              style="display: inline-flex;"
                              v-model="M_Spec.working_days_friday"
                              name="check-button"
                              switch
                              value="Y"
                              unchecked-value="N"
                              size="lg"
                            >
                              <span>
                                <label for="M_Spec.working_days_friday">Friday</label>
                              </span>
                            </b-form-checkbox>
                          </b-col>
                          <b-col md="6">
                            <b-form-checkbox
                              style="display: inline-flex;"
                              v-model="M_Spec.working_days_saturday"
                              name="check-button"
                              switch
                              value="Y"
                              unchecked-value="N"
                              size="lg"
                            >
                              <span>
                                <label for="M_Spec.working_days_saturday">Saturday</label>
                              </span>
                            </b-form-checkbox>
                          </b-col>
                        </b-row>
                        <b-row class="row">
                          <b-col md="6">
                            <b-form-checkbox
                              style="display: inline-flex;"
                              v-model="M_Spec.working_days_sunday"
                              name="check-button"
                              switch
                              value="Y"
                              unchecked-value="N"
                              size="lg"
                            >
                              <span>
                                <label for="M_Spec.working_days_sunday">Sunday</label>
                              </span>
                            </b-form-checkbox>
                          </b-col>
                          <!-- <b-col md="6"></b-col> -->
                        </b-row>
                      </div>
                    </div>
                  </b-col>
                </b-row>
                <b-row class="dashboardBody">
                  <b-col md="12">
                    <b-row>
                      <b-col md="12">
                        <div class="card">
                          <div class="card__title">
                            <b-row>
                              <b-col style="max-width:fit-content !important;">
                                <span>Order status</span>
                              </b-col>
                            </b-row>
                          </div>
                          <div class="card__body">
                            <b-row>
                              <b-col md="4">
                                <b-row>
                                  <b-col md="2">
                                    <span>
                                      <label>FTL</label>
                                    </span>
                                  </b-col>
                                  <b-col md="10">
                                    <b-form-group>
                                      <b-form-checkbox
                                        v-for="(option,index) in order_status_ftl"
                                        @change="checkFTLChange(index)"
                                        v-model="order_status_ftl[index].flag_status"
                                        :key="option.row_id"
                                        value="Y"
                                        unchecked-value="N"
                                        name="flavour-3a"
                                      >{{ option.descs }}</b-form-checkbox>
                                    </b-form-group>
                                  </b-col>
                                </b-row>
                              </b-col>
                              <b-col md="4">
                                <b-row>
                                  <b-col md="2">
                                    <span>
                                      <label>Project</label>
                                    </span>
                                  </b-col>
                                  <b-col md="10">
                                    <b-form-group>
                                      <b-form-checkbox
                                        v-for="(option,index) in order_status_project"
                                        @change="checkProjectChange(index)"
                                        v-model="order_status_project[index].flag_status"
                                        :key="option.row_id"
                                        value="Y"
                                        unchecked-value="N"
                                        name="flavour-3a"
                                      >{{ option.descs }}</b-form-checkbox>
                                    </b-form-group>
                                  </b-col>
                                </b-row>
                              </b-col>
                              <b-col md="4">
                                <b-row>
                                  <b-col md="3">
                                    <span>
                                      <label>Return Empty</label>
                                    </span>
                                  </b-col>
                                  <b-col md="9">
                                    <b-form-group>
                                      <b-form-checkbox
                                        v-for="(option,index) in order_status_return_empty"
                                        @change="checkReturnChange(index)"
                                        v-model="order_status_return_empty[index].flag_status"
                                        :key="option.row_id"
                                        value="Y"
                                        unchecked-value="N"
                                        name="flavour-3a"
                                      >{{ option.descs }}</b-form-checkbox>
                                    </b-form-group>
                                  </b-col>
                                </b-row>
                              </b-col>
                            </b-row>
                          </div>
                        </div>
                      </b-col>
                    </b-row>
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
                  <b-col md="6">
                    <div class="card">
                      <!-- kiri -->
                      <div class="card__title">
                        <b-row>
                          <b-col style="max-width:fit-content !important;">
                            <span>Achivement Status</span>
                          </b-col>
                        </b-row>
                      </div>
                      <div class="card__body">
                        <!-- isi -->
                        <b-row class="row">
                          <b-col md="12">
                            <!-- @input="Onachievement_order_statusChange" -->
                            <ACCRadioButton
                              :prop="PI_achievement_order_status"
                              v-model="M_Spec.achievement_order_status"
                              ref="ref_achievement_order_status"
                            />
                          </b-col>
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
                            <span>Document Fleet Expiry KPI</span>
                          </b-col>
                        </b-row>
                      </div>
                      <div class="card__body">
                        <!-- isi -->
                        <b-row class="row">
                          <b-col md="4">
                            <span>
                              <label>Days Before Expired</label>
                            </span>
                          </b-col>
                          <b-col md="5">
                            <ACCTextBox
                              :prop="PI_document_fleet_expiry_kpi"
                              v-model="M_Spec.document_fleet_expiry_kpi"
                              ref="ref_document_fleet_expiry_kpi"
                            />
                          </b-col>
                          <b-col md="1">
                            <span>
                              <label>Days</label>
                            </span>
                          </b-col>
                        </b-row>
                      </div>
                    </div>
                  </b-col>
                  <b-col md="6">
                    <div class="card">
                      <!-- kiri -->
                      <div class="card__title">
                        <b-row>
                          <b-col style="max-width:fit-content !important;">
                            <span>Quotation Expiry Warning</span>
                          </b-col>
                        </b-row>
                      </div>
                      <div class="card__body">
                        <!-- isi -->
                        <b-row class="row">
                          <b-col md="4">
                            <span>
                              <label>Quotation Expiry Warning</label>
                            </span>
                          </b-col>
                          <b-col md="5">
                            <ACCTextBox
                              :prop="PI_quotation_expiry_warning"
                              v-model="M_Spec.quotation_expiry_warning"
                              ref="ref_quotation_expiry_warning"
                            />
                          </b-col>
                          <b-col md="1">
                            <span>
                              <label>Days</label>
                            </span>
                          </b-col>
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
                            <span>Commission Paid On</span>
                          </b-col>
                        </b-row>
                      </div>
                      <div class="card__body">
                        <!-- isi -->
                        <b-row class="row">
                          <b-col md="6">
                            <!-- @input="Onquotation_paid_onChange" -->
                            <ACCRadioButton
                              :prop="PI_quotation_paid_on"
                              v-model="M_Spec.quotation_paid_on"
                              ref="ref_quotation_paid_on"
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
      dataChkBoxFTL: [],
      inputStatus: "",
      PI_action_call_point: {
        cValidate: "",
        cName: "action_call_point",
        cOrder: 1,
        cKey: false,
        cType: "decimal",
        cProtect: false,
        cParentForm: "MK_FormMarketingSpec",
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
        cParentForm: "MK_FormMarketingSpec",
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
        cParentForm: "MK_FormMarketingSpec",
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
        achievement_order_status: "",
        document_fleet_expiry_kpi: "",
        quotation_expiry_warning: "",
        quotation_paid_on: "",
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
        cOrder: 5,
        // cDefault: '',
        cProtect: false,
        cParentForm: "MK_FormMarketingSpec",
        cStatic: false,
        cOption: [],
        cDisplayColumn: "row_id,name",
        cInputStatus: this.inputStatus,
      },
      PI_achievement_order_status: {
        cValidate: "",
        cName: "achievement_order_status",
        cId: "rdbachievement_order_status",
        cRadioOptions: [
          { text: "New", value: "NW" },
          { text: "Assign", value: "AS" },
          { text: "Dispath", value: "DP" },
          { text: "Arrived", value: "AR" },
          { text: "Start Loading", value: "SL" },
          { text: "Finish Loading", value: "FL" },
          { text: "Get Out", value: "GO" },
          { text: "Arrive Destination", value: "AD" },
          { text: "Start Unloading", value: "SU" },
          { text: "Finish Unloading", value: "FU" },
          { text: "Get Out Destination", value: "GD" },
          { text: "Return Empty", value: "RE" },
          { text: "POD", value: "POD" },
          { text: "Billing", value: "B" },
        ],
        cRadioDefaultOption: "",
        cOrder: 6,
        cProtect: false,
        cVisible: true,
        cParentForm: "MK_FormMarketingSpec",
        cInputStatus: this.inputStatus,
      },
      PI_document_fleet_expiry_kpi: {
        cValidate: "",
        cName: "document_fleet_expiry_kpi",
        cOrder: 7,
        cKey: false,
        cType: "decimal",
        cProtect: false,
        cParentForm: "MK_FormMarketingSpec",
        cDecimal: 2,
        cInputStatus: this.inputStatus,
      },
      PI_quotation_expiry_warning: {
        cValidate: "",
        cName: "quotation_expiry_warning",
        cOrder: 8,
        cKey: false,
        cType: "decimal",
        cProtect: false,
        cParentForm: "MK_FormMarketingSpec",
        cDecimal: 2,
        cInputStatus: this.inputStatus,
      },
      PI_quotation_paid_on: {
        cValidate: "",
        cName: "quotation_paid_on",
        cId: "rdbquotation_paid_on",
        cRadioOptions: [
          { text: "Invoice", value: "I" },
          { text: "Payment", value: "P" },
        ],
        cRadioDefaultOption: "",
        cOrder: 9,
        cProtect: false,
        cVisible: true,
        cParentForm: "MK_FormMarketingSpec",
        cInputStatus: this.inputStatus,
      },
      default_pic: require("@/assets/default_photo_.png"),
      order_status_ftl: [],
      order_status_ftl_post: [],
      order_status_project: [],
      order_status_return_empty: [],
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
    checkFTLChange(index) {
      console.log("checkFTLChange", index);
      var flag_status = this.order_status_ftl[index].flag_status;
      if (flag_status == "Y") {
        this.order_status_ftl_post.push(this.order_status_ftl[index]);
      } else {
      }
      // console.log("checkFTLChange", data);
    },
    checkProjectChange(index) {
      console.log("checkProjectChange", index);
      var flag_status = this.order_status_project[index].flag_status;
      if (flag_status == "Y") {
        this.order_status_project_post.push(this.order_status_project[index]);
      } else {
      }
      // console.log("checkFTLChange", data);
    },
    checkReturnChange(index) {
      console.log("checkReturnChange", index);
      var flag_status = this.order_status_return_empty[index].flag_status;
      if (flag_status == "Y") {
        this.order_status_return_empty_post.push(
          this.order_status_return_empty[index]
        );
      } else {
      }
      // console.log("checkFTLChange", data);
    },
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
        working_days_monday: "N",
        working_days_tuesday: "N",
        working_days_wednesday: "N",
        working_days_thursday: "N",
        working_days_friday: "N",
        working_days_saturday: "N",
        working_days_sunday: "N",
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
      var paramH = {
        _Method_: "SAVE",
        _LineNo_: 0,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        action_call_point: this.M_Spec.action_call_point,
        action_visit_point: this.M_Spec.action_visit_point,
        action_entertain_point: this.M_Spec.action_entertain_point,
        working_days_monday: this.M_Spec.working_days_monday,
        working_days_tuesday: this.M_Spec.working_days_tuesday,
        working_days_wednesday: this.M_Spec.working_days_wednesday,
        working_days_thursday: this.M_Spec.working_days_thursday,
        working_days_friday: this.M_Spec.working_days_friday,
        working_days_saturday: this.M_Spec.working_days_saturday,
        working_days_sunday: this.M_Spec.working_days_sunday,
        new_cm_customer_status_id: 0,
        cm_contact_id:
          this.M_Spec.cm_contact_id == null || this.M_Spec.cm_contact_id == 0
            ? null
            : this.M_Spec.cm_contact_id,
        achievement_order_status: this.M_Spec.achievement_order_status,
        document_fleet_expiry_kpi: this.M_Spec.document_fleet_expiry_kpi,
        quotation_expiry_warning: this.M_Spec.quotation_expiry_warning,
        quotation_paid_on: this.M_Spec.quotation_paid_on,
        user_input: this.getDataUser().user_id,
      };

      var paramOrderStatus = [];

      this.order_status_ftl.forEach((dt, index) => {
        paramOrderStatus.push({
          _Method_: "UPDATE",
          _LineNo_: 1,
          op_order_status_id: dt.op_order_status_id,
          flag_status: dt.flag_status,
          user_edit: this.getDataUser().user_id,
        });
      });

      this.order_status_project.forEach((dt, index) => {
        paramOrderStatus.push({
          _Method_: "UPDATE",
          _LineNo_: 1,
          op_order_status_id: dt.op_order_status_id,
          flag_status: dt.flag_status,
          user_edit: this.getDataUser().user_id,
        });
      });

      this.order_status_return_empty.forEach((dt, index) => {
        paramOrderStatus.push({
          _Method_: "UPDATE",
          _LineNo_: 1,
          op_order_status_id: dt.op_order_status_id,
          flag_status: dt.flag_status,
          user_edit: this.getDataUser().user_id,
        });
      });
      var param = {
        option_url: "/MK/MK_MarketingSpec",
        line_no: 0,
        Data: [
          {
            A_Save: paramH,
            B_Looping: paramOrderStatus,
          },
        ],
      };
      this.postJSONMulti(this.getUrlProsesDataPostMulti(), param).then(
        (response) => {
          // console.log(response)
          if (response == null) return;
          this.alertSuccess("Save Data Has Been Successfully").then(() => {
            this.inputStatus = "edit";
            // this.doBack();
          });
        }
      );
      // this.postJSON(this.getUrlCRUD(), param).then((response) => {
      //   // console.log(response)
      //   if (response == null) return;
      //   this.alertSuccess(response.Message).then(() => {
      //     this.inputStatus = "edit";
      //   });
      // });
    },
    M_Update() {
      var paramH = {
        _Method_: "UPDATE",
        _LineNo_: 0,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        action_call_point: this.M_Spec.action_call_point,
        action_visit_point: this.M_Spec.action_visit_point,
        action_entertain_point: this.M_Spec.action_entertain_point,
        working_days_monday: this.M_Spec.working_days_monday,
        working_days_tuesday: this.M_Spec.working_days_tuesday,
        working_days_wednesday: this.M_Spec.working_days_wednesday,
        working_days_thursday: this.M_Spec.working_days_thursday,
        working_days_friday: this.M_Spec.working_days_friday,
        working_days_saturday: this.M_Spec.working_days_saturday,
        working_days_sunday: this.M_Spec.working_days_sunday,
        new_cm_customer_status_id: 0,
        cm_contact_id:
          this.M_Spec.cm_contact_id == null || this.M_Spec.cm_contact_id == 0
            ? null
            : this.M_Spec.cm_contact_id,
        achievement_order_status: this.M_Spec.achievement_order_status,
        document_fleet_expiry_kpi: this.M_Spec.document_fleet_expiry_kpi,
        quotation_expiry_warning: this.M_Spec.quotation_expiry_warning,
        quotation_paid_on: this.M_Spec.quotation_paid_on,
        user_edit: this.getDataUser().user_id,
      };

      var paramOrderStatus = [];

      this.order_status_ftl.forEach((dt, index) => {
        paramOrderStatus.push({
          _Method_: "UPDATE",
          _LineNo_: 1,
          op_order_status_id: dt.op_order_status_id,
          flag_status: dt.flag_status,
          user_edit: this.getDataUser().user_id,
        });
      });

      this.order_status_project.forEach((dt, index) => {
        paramOrderStatus.push({
          _Method_: "UPDATE",
          _LineNo_: 1,
          op_order_status_id: dt.op_order_status_id,
          flag_status: dt.flag_status,
          user_edit: this.getDataUser().user_id,
        });
      });

      this.order_status_return_empty.forEach((dt, index) => {
        paramOrderStatus.push({
          _Method_: "UPDATE",
          _LineNo_: 1,
          op_order_status_id: dt.op_order_status_id,
          flag_status: dt.flag_status,
          user_edit: this.getDataUser().user_id,
        });
      });
      var param = {
        option_url: "/MK/MK_MarketingSpec",
        line_no: 0,
        Data: [
          {
            A_Update: paramH,
            B_Looping: paramOrderStatus,
          },
        ],
      };
      this.postJSONMulti(this.getUrlProsesDataPostMulti(), param).then(
        (response) => {
          // console.log(response)
          if (response == null) return;
          this.alertSuccess("Update Data Has Been Successfully").then(() => {
            this.inputStatus = "edit";
            // this.doBack();
          });
        }
      );
      // this.putJSON(this.getUrlCRUD(), param).then((response) => {
      //   // console.log(response)
      //   if (response == null) return;
      //   this.alertSuccess(response.Message).then(() => {
      //     this.inputStatus = "edit";
      //   });
      // });
    },
    GetOrderStatusFTL(category) {
      var param = {
        option_function_cd: "GetOpOrderStatus",
        module_cd: "OP",
        ss_portfolio_id: this.getDataUser().portfolio_id,
        category: category,
      };
      this.CallFunction(param).then((response) => {
        // response from API
        if (response == null) return;
        console.log(response.Data);
        if (category == "F") {
          this.order_status_ftl = response.Data;
        } else if (category == "P") {
          this.order_status_project = response.Data;
        } else if (category == "R") {
          this.order_status_return_empty = response.Data;
        }
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
          working_days_monday: data.working_days_monday,
          working_days_tuesday: data.working_days_tuesday,
          working_days_thursday: data.working_days_thursday,
          working_days_wednesday: data.working_days_wednesday,
          working_days_friday: data.working_days_friday,
          working_days_saturday: data.working_days_saturday,
          working_days_sunday: data.working_days_sunday,
          cm_contact_id: data.cm_contact_id,
          cm_contact_idLabel: data.customer_name,
          achievement_order_status: data.achievement_order_status,
          document_fleet_expiry_kpi: data.document_fleet_expiry_kpi,
          quotation_expiry_warning: data.quotation_expiry_warning,
          quotation_paid_on: data.quotation_paid_on,
        };
        this.GetOrderStatusFTL("F");
        this.GetOrderStatusFTL("P");
        this.GetOrderStatusFTL("R");
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