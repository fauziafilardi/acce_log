<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>
                    <b>
                      <h5>{{title}} Driver</h5>
                    </b>
                  </span>
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
              <b-form :data-vv-scope="'OP_FormFmDriver'" :data-vv-value-path="'OP_FormFmDriver'">
                <b-row>
                  <b-col md="2">
                    <div>
                      <div style="text-align: center;">
                        <font-awesome-icon class="icon-style-default" icon="user" size="10x" />
                      </div>
                    </div>
                  </b-col>
                  <b-col md="5">
                    <b-row style="border: solid 1px #ccc; border-radius: 10px;">
                      <b-col md="12">
                        <b-row>
                          <b-col>
                            <span>
                              <label>
                                <b>
                                  <h5>Driver Information</h5>
                                </b>
                              </label>
                            </span>
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col md="12">
                            <span>
                              <label>Employee ID</label>
                            </span>
                            <ACCTextBox
                              :prop="PI_employee_id"
                              v-model="M_FmDriver.employee_id"
                              ref="ref_employee_id"
                            />
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col md="12">
                            <span>
                              <label>Full Name</label>
                            </span>
                            <ACCTextBox
                              :prop="PI_driver_name"
                              v-model="M_FmDriver.driver_name"
                              ref="ref_driver_name"
                            />
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col md="2">
                            <span>
                              <label>Phone No.</label>
                            </span>
                            <ACCTextBox
                              :prop="PI_handphone_1"
                              v-model="M_FmDriver.handphone_1"
                              ref="ref_handphone_1"
                            />
                          </b-col>
                          <b-col md="10" style="margin-top: 8px;">
                            <span>
                              <label></label>
                            </span>
                            <ACCTextBox
                              :prop="PI_handphone_2"
                              v-model="M_FmDriver.handphone_2"
                              ref="ref_handphone_2"
                            />
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col md="12">
                            <span>
                              <label>Ktp</label>
                            </span>
                            <ACCTextBox :prop="PI_ktp" v-model="M_FmDriver.ktp" ref="ref_ktp" />
                          </b-col>
                        </b-row>

                        <b-row>
                          <b-col md="12">
                            <span>
                              <label>Npwp</label>
                            </span>
                            <ACCTextBox :prop="PI_npwp" v-model="M_FmDriver.npwp" ref="ref_npwp" />
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col md="7">
                            <span>
                              <label>SIM</label>
                            </span>
                            <ACCTextBox :prop="PI_sim" v-model="M_FmDriver.sim" ref="ref_sim" />
                          </b-col>
                          <b-col md="5">
                            <span>
                              <label>Valid Until</label>
                            </span>
                            <ACCDateTime
                              @input="Onsim_expiry_dateChange"
                              :prop="PI_sim_expiry_date"
                              v-model="M_FmDriver.sim_expiry_date"
                              ref="ref_sim_expiry_date"
                            />
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col md="7">
                            <span>
                              <label>SKCK</label>
                            </span>
                            <ACCTextBox :prop="PI_skck" v-model="M_FmDriver.skck" ref="ref_skck" />
                          </b-col>
                          <b-col md="5">
                            <span>
                              <label>Valid Until</label>
                            </span>
                            <ACCDateTime
                              @input="Onskck_expiry_dateChange"
                              :prop="PI_skck_expiry_date"
                              v-model="M_FmDriver.skck_expiry_date"
                              ref="ref_skck_expiry_date"
                            />
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col md="7">
                            <span>
                              <label>Employee Status</label>
                            </span>
                            <ACCTextBox
                              :prop="PI_employee_status"
                              v-model="M_FmDriver.employee_status"
                              ref="ref_employee_status"
                            />
                          </b-col>
                          <b-col md="5">
                            <span>
                              <label>Valid Until</label>
                            </span>
                            <ACCDateTime
                              @input="Onemployee_expiry_dateChange"
                              :prop="PI_employee_expiry_date"
                              v-model="M_FmDriver.employee_expiry_date"
                              ref="ref_employee_expiry_date"
                            />
                          </b-col>
                        </b-row>
                      </b-col>
                    </b-row>
                  </b-col>
                  <b-col md="5">
                    <!-- di border -->
                    <b-row style="border: solid 1px #ccc; border-radius: 10px;">
                      <b-col md="12">
                        <ABSButton
                          :text="'Add Picture'"
                          icon="plus-circle"
                          classButton="btn btn--default"
                          styleButton="height: 40px;width: 70%;"
                          @click="addPict"
                        />
                      </b-col>
                    </b-row>
                    <b-row style="margin-top: 10px; border: solid 1px #ccc; border-radius: 10px;">
                      <b-col>
                        <b-row>
                          <b-col>
                            <span>
                              <label>
                                <b>
                                  <h5>Emergency Contact</h5>
                                </b>
                              </label>
                            </span>
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col md="6">
                            <span>
                              <label>Full Name</label>
                            </span>
                            <ACCTextBox
                              :prop="PI_emergency_contact_name"
                              v-model="M_FmDriver.emergency_contact_name"
                              ref="ref_emergency_contact_name"
                            />
                          </b-col>
                          <b-col md="6">
                            <span>
                              <label>Relation</label>
                            </span>
                            <ACCTextBox
                              :prop="PI_emergency_relation"
                              v-model="M_FmDriver.emergency_relation"
                              ref="ref_emergency_relation"
                            />
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col md="2">
                            <span>
                              <label>Phone No.</label>
                            </span>
                            <ACCTextBox
                              :prop="PI_emergency_phone_no_1"
                              v-model="M_FmDriver.emergency_phone_no_1"
                              ref="ref_emergency_phone_no_1"
                            />
                          </b-col>
                          <b-col md="10" style="margin-top: 8px;">
                            <span>
                              <label></label>
                            </span>
                            <ACCTextBox
                              :prop="PI_emergency_phone_no_2"
                              v-model="M_FmDriver.emergency_phone_no_2"
                              ref="ref_emergency_phone_no_2"
                            />
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col md="12">
                            <span>
                              <label>Remarks</label>
                            </span>
                            <ACCTextArea
                              :prop="PI_emergency_remarks"
                              v-model="M_FmDriver.emergency_remarks"
                              ref="ref_emergency_remarks"
                            />
                          </b-col>
                        </b-row>
                      </b-col>
                    </b-row>
                  </b-col>
                </b-row>
                <b-row style="margin-top: 10px;">
                  <b-col offset="2" md="10" style="text-align: center">
                    <ABSButton
                      :text="'Save'"
                      classButton="btn btn--default"
                      classIcon="icon-style-default"
                      @click="doSave"
                      styleButton="height: 40px;width: 70%;"
                    />
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

      M_FmDriver: {
        fm_driver_id: 0,
        ss_portfolio_id: 0,
        employee_id: "",
        driver_name: "",
        handphone_1: "+62",
        handphone_2: "",
        ktp: "",
        npwp: "",
        sim: "",
        sim_expiry_date: "",
        skck: "",
        skck_expiry_date: "",
        employee_status: "",
        employee_expiry_date: "",
        emergency_contact_name: "",
        emergency_relation: "",
        emergency_phone_no_1: "+62",
        emergency_phone_no_2: "+62",
        emergency_remarks: "",
        dt_doc_file_name: "",
        dt_doc_path_file: "",
        user_input: "",
        user_edit: "",
        time_input: "",
        time_edit: "",
        row_id: 0,
        lastupdatestamp: 0
      },
      PI_employee_id: {
        cValidate: "",
        cName: "employee_id",
        cOrder: 1,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "OP_FormFmDriver",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_driver_name: {
        cValidate: "",
        cName: "driver_name",
        cOrder: 2,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "OP_FormFmDriver",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_handphone_1: {
        cValidate: "",
        cName: "handphone1",
        cOrder: 3,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "OP_FormFmDriver",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_handphone_2: {
        cValidate: "",
        cName: "handphone_2",
        cOrder: 4,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "OP_FormFmDriver",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_ktp: {
        cValidate: "",
        cName: "ktp",
        cOrder: 5,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "OP_FormFmDriver",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_npwp: {
        cValidate: "",
        cName: "npwp",
        cOrder: 6,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "OP_FormFmDriver",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_sim: {
        cValidate: "",
        cName: "sim",
        cOrder: 7,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "OP_FormFmDriver",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_sim_expiry_date: {
        cValidate: "",
        cName: "sim_expiry_date",
        cOrder: 8,
        cKey: false,
        cProtect: false,
        cWithTime: false,
        cFormat: "dd/MM/yyyy",
        cParentForm: "OP_FormFmDriver"
      },
      PI_skck: {
        cValidate: "",
        cName: "skck",
        cOrder: 9,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "OP_FormFmDriver",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_skck_expiry_date: {
        cValidate: "",
        cName: "skck_expiry_date",
        cOrder: 10,
        cKey: false,
        cProtect: false,
        cWithTime: false,
        cFormat: "dd/MM/yyyy",
        cParentForm: "OP_FormFmDriver"
      },
      PI_employee_status: {
        cValidate: "",
        cName: "employee_status",
        cOrder: 11,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "OP_FormFmDriver",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_employee_expiry_date: {
        cValidate: "",
        cName: "employee_expiry_date",
        cOrder: 12,
        cKey: false,
        cProtect: false,
        cWithTime: false,
        cFormat: "dd/MM/yyyy",
        cParentForm: "OP_FormFmDriver"
      },
      PI_emergency_contact_name: {
        cValidate: "",
        cName: "emergency_contact_name",
        cOrder: 13,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "OP_FormFmDriver",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_emergency_relation: {
        cValidate: "",
        cName: "emergency_relation",
        cOrder: 14,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "OP_FormFmDriver",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_emergency_phone_no_1: {
        cValidate: "",
        cName: "emergency_phone_no_1",
        cOrder: 15,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "OP_FormFmDriver",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_emergency_phone_no_2: {
        cValidate: "",
        cName: "emergency_phone_no_2",
        cOrder: 16,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "OP_FormFmDriver",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_emergency_remarks: {
        cValidate: "",
        cName: "emergency_remarks",
        cOrder: 17,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "OP_FormFmFleetMstr",
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
      this.M_FmDriver = {
        fm_driver_id: 0,
        ss_portfolio_id: 0,
        employee_id: "",
        driver_name: "",
        handphone_1: "+62",
        handphone_2: "",
        ktp: "",
        npwp: "",
        sim: "",
        sim_expiry_date: "",
        skck: "",
        skck_expiry_date: "",
        employee_status: "",
        employee_expiry_date: "",
        emergency_contact_name: "",
        emergency_relation: "",
        emergency_phone_no: "",
        emergency_remarks: "",
        dt_doc_file_name: "",
        dt_doc_path_file: "",
        user_input: "",
        user_edit: "",
        time_input: "",
        time_edit: "",
        row_id: 0,
        lastupdatestamp: 0
      };
    },

    doSave() {
      this.$validator._base.validateAll("OP_FormFmDriver").then(result => {
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
          ress => {
            if (ress.value) {
              this.$validator.errors.clear("OP_FormFmDriver");
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
        option_url: "/OP/OP_Driver",
        line_no: 0,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        employee_id: this.M_FmDriver.employee_id,
        driver_name: this.M_FmDriver.driver_name,
        handphone:
          this.M_FmDriver.handphone_1 + "-" + this.M_FmDriver.handphone_2,
        ktp: this.M_FmDriver.ktp,
        npwp: this.M_FmDriver.npwp,
        sim: this.M_FmDriver.sim,
        sim_expiry_date: this.M_FmDriver.sim_expiry_date,
        skck: this.M_FmDriver.skck,
        skck_expiry_date: this.M_FmDriver.skck_expiry_date,
        employee_status: this.M_FmDriver.employee_status,
        employee_expiry_date: this.M_FmDriver.employee_expiry_date,
        emergency_contact_name: this.M_FmDriver.emergency_contact_name,
        emergency_relation: this.M_FmDriver.emergency_relation,
        emergency_phone_no:
          this.M_FmDriver.emergency_phone_no_1 +
          "-" +
          this.M_FmDriver.emergency_phone_no_2,
        emergency_remarks: this.M_FmDriver.emergency_remarks,
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
        option_url: "/OP/OP_Driver",
        line_no: 0,
        fm_driver_id: this.M_FmDriver.fm_driver_id,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        employee_id: this.M_FmDriver.employee_id,
        driver_name: this.M_FmDriver.driver_name,
        handphone:
          this.M_FmDriver.handphone_1 + "-" + this.M_FmDriver.handphone_2,
        ktp: this.M_FmDriver.ktp,
        npwp: this.M_FmDriver.npwp,
        sim: this.M_FmDriver.sim,
        sim_expiry_date: this.M_FmDriver.sim_expiry_date,
        skck: this.M_FmDriver.skck,
        skck_expiry_date: this.M_FmDriver.skck_expiry_date,
        employee_status: this.M_FmDriver.employee_status,
        employee_expiry_date: this.M_FmDriver.employee_expiry_date,
        emergency_contact_name: this.M_FmDriver.emergency_contact_name,
        emergency_relation: this.M_FmDriver.emergency_relation,
        emergency_phone_no:
          this.M_FmDriver.emergency_phone_no_1 +
          "-" +
          this.M_FmDriver.emergency_phone_no_2,
        emergency_remarks: this.M_FmDriver.emergency_remarks,
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
        option_url: "/OP/OP_Driver",
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
        option_url: "/OP/OP_Driver",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };

      this.getJSON(this.getUrlCRUD(), param).then(response => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];
        var phone_no =
          data.handphone__tb_3 && data.handphone__tb_3 !== ""
            ? data.handphone__tb_3.split("-")
            : "";
        var emer_phone_no =
          data.emergency_phone_no__tb_14 &&
          data.emergency_phone_no__tb_14 !== ""
            ? data.emergency_phone_no__tb_14.split("-")
            : "";
        this.M_FmDriver = {
          fm_driver_id: data.fm_driver_id,
          ss_portfolio_id: data.ss_portfolio_id,
          employee_id: data.employee_id__tb_1,
          driver_name: data.driver_name__tb_2,
          handphone_1: phone_no[0],
          handphone_2: phone_no[1],
          ktp: data.ktp__tb_4,
          npwp: data.npwp__tb_5,
          sim: data.sim__tb_6,
          sim_expiry_date: data.sim_expiry_date__tb_7,
          skck: data.skck__tb_8,
          skck_expiry_date: data.skck_expiry_date__tb_9,
          employee_status: data.employee_status__tb_10,
          employee_expiry_date: data.employee_expiry_date__tb_11,
          emergency_contact_name: data.emergency_contact_name__tb_12,
          emergency_relation: data.emergency_relation__tb_13,
          emergency_phone_no_1: emer_phone_no[0],
          emergency_phone_no_2: emer_phone_no[1],
          emergency_remarks: data.emergency_remarks__tb_15,
          dt_doc_file_name: data.dt_doc_file_name,
          dt_doc_path_file: data.dt_doc_path_file,
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
      this.GetDataBy();
    } else {
      this.title = "Add";
    }
  }
};
</script>

