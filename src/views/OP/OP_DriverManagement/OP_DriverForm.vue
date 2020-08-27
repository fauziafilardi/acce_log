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
                            <span style="font-size: 15px; color: #333399; font-weight: bold;">
                              <label>Driver Information</label>
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
                            <!-- <ACCTextBox
                              :prop="PI_handphone_1"
                              v-model="M_FmDriver.handphone_1"
                              ref="ref_handphone_1"
                            />-->
                            <ACCDropDown
                              @change="Onhandphone_1Change"
                              :prop="PI_handphone_1"
                              v-model="M_FmDriver.handphone_1"
                              :label="M_FmDriver.handphone_1Label"
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
                            <ACCDropDown
                              @change="Onemployee_statusChange"
                              :prop="PI_employee_status"
                              v-model="M_FmDriver.employee_status"
                              :label="M_FmDriver.employee_statusLabel"
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
                    <b-row class="row-bordered" style="background-color: #ced4da;">
                      <b-col md="12">
                        <b-row style="margin-bottom: 10px">
                          <template v-for="(pict, index) in M_Picture">
                            <b-col style="max-width: fit-content !important;" v-bind:key="index">
                              <img
                                :id="'pict_'+index"
                                :src="pict.file_show"
                                alt
                                style="width: 150px; cursor: pointer; "
                                @click="showPict(pict)"
                              />
                              <font-awesome-icon
                                class="icon-style-danger"
                                icon="times-circle"
                                size="lg"
                                style="cursor: pointer; top: -5px; right: 0px; position: absolute;"
                                @click="Delete_Pict(index)"
                              />
                            </b-col>
                          </template>
                        </b-row>
                        <b-row>
                          <b-col md="12">
                            <div @click="addPict" style="width: 20%; cursor: pointer;">
                              <font-awesome-icon
                                class="icon-style-default"
                                icon="plus-circle"
                                size="2x"
                              />&nbsp; &nbsp;
                              <span
                                style="position: absolute; font-size: 15px; color: #333399; font-weight: bold;"
                              >Add Picture</span>
                            </div>
                          </b-col>
                        </b-row>
                      </b-col>
                    </b-row>
                    <b-row style="margin-top: 10px; border: solid 1px #ccc; border-radius: 10px;">
                      <b-col>
                        <b-row>
                          <b-col>
                            <span style="font-size: 15px; color: #333399; font-weight: bold;">
                              <label>Emergency Contact</label>
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
                            <!-- <ACCTextBox
                              :prop="PI_emergency_phone_no_1"
                              v-model="M_FmDriver.emergency_phone_no_1"
                              ref="ref_emergency_phone_no_1"
                            />-->
                            <ACCDropDown
                              @change="Onemergency_phone_no_1Change"
                              :prop="PI_emergency_phone_no_1"
                              v-model="M_FmDriver.emergency_phone_no_1"
                              :label="M_FmDriver.emergency_phone_no_1Label"
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
              <ABSModal id="Modal_Picture" ref="Modal_Picture" size="sm">
                <template slot="headerTitle">Add Picture</template>
                <template slot="content">
                  <b-row>
                    <b-col md="12">
                      <b-form
                        :data-vv-scope="'Parent_Picture'"
                        :data-vv-value-path="'Parent_Picture'"
                      >
                        <b-row>
                          <b-col md="12">
                            <b-row>
                              <b-col md="12" style="text-align: center;">
                                <img
                                  id="logo"
                                  :src="M_ModalPict.file_show"
                                  alt
                                  style="width: 200px;"
                                />
                              </b-col>
                              <b-col md="12">
                                <ACCImageUpload
                                  :prop="PI_add_pict"
                                  @change="Onadd_pictChange"
                                  v-model="M_ModalPict.file_logo"
                                />
                              </b-col>
                            </b-row>
                            <b-row>
                              <b-col style="text-align: center;">
                                <ABSButton
                                  :text="'Save Picture'"
                                  classButton="btn btn--default"
                                  classIcon="icon-style-default"
                                  @click="doAddPict"
                                  styleButton="height: 40px;width: 70%;"
                                />
                              </b-col>
                            </b-row>
                          </b-col>
                        </b-row>
                      </b-form>
                    </b-col>
                  </b-row>
                </template>
              </ABSModal>
              <ABSModal id="Show_Picture" ref="Show_Picture" size="sm">
                <template slot="content">
                  <b-row>
                    <b-col md="12" style="text-align: center;">
                      <img id="show_pict" :src="M_ModalPict.file_show" alt style="width: 200px;" />
                    </b-col>
                  </b-row>
                </template>
              </ABSModal>
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
        handphone_1Label: "+62",
        handphone_2: "",
        ktp: "",
        npwp: "",
        sim: "",
        sim_expiry_date: "",
        skck: "",
        skck_expiry_date: "",
        employee_status: "",
        employee_statusLabel: "",
        employee_expiry_date: "",
        emergency_contact_name: "",
        emergency_relation: "",
        emergency_phone_no_1: "+62",
        emergency_phone_no_1Label: "+62",
        emergency_phone_no_2: "",
        emergency_remarks: "",
        dt_doc_file_name: "",
        dt_doc_path_file: "",
        user_input: "",
        user_edit: "",
        time_input: "",
        time_edit: "",
        row_id: 0,
        lastupdatestamp: 0,
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
        cInputStatus: this.inputStatus,
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
        cInputStatus: this.inputStatus,
      },

      PI_handphone_1: {
        dataLookUp: null,
        cValidate: "",
        cName: "handphone1",
        ckey: false,
        cOrder: 3,
        cProtect: false,
        cParentForm: "OP_FormFmDriver",
        cStatic: true,
        cOption: [{ id: "+62", label: "+62" }],
        cDisplayColumn: "action_type,descs",
        cInputStatus: this.inputStatus,
      },
      PI_handphone_2: {
        cValidate: "max:20",
        cName: "handphone_2",
        cOrder: 4,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "OP_FormFmDriver",
        cDecimal: 2,
        cInputStatus: this.inputStatus,
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
        cInputStatus: this.inputStatus,
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
        cInputStatus: this.inputStatus,
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
        cInputStatus: this.inputStatus,
      },
      PI_sim_expiry_date: {
        cValidate: "",
        cName: "sim_expiry_date",
        cOrder: 8,
        cKey: false,
        cProtect: false,
        cWithTime: false,
        cFormat: "dd/MM/yyyy",
        cParentForm: "OP_FormFmDriver",
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
        cInputStatus: this.inputStatus,
      },
      PI_skck_expiry_date: {
        cValidate: "",
        cName: "skck_expiry_date",
        cOrder: 10,
        cKey: false,
        cProtect: false,
        cWithTime: false,
        cFormat: "dd/MM/yyyy",
        cParentForm: "OP_FormFmDriver",
      },
      // PI_employee_status: {
      //   cValidate: "",
      //   cName: "employee_status",
      //   cOrder: 11,
      //   cKey: false,
      //   cType: "text",
      //   cProtect: false,
      //   cParentForm: "OP_FormFmDriver",
      //   cDecimal: 2,
      //   cInputStatus: this.inputStatus
      // },
      PI_employee_status: {
        dataLookUp: null,
        cValidate: "",
        cName: "employee_status",
        ckey: false,
        cOrder: 11,
        cProtect: false,
        cParentForm: "MK_FormMkQuotationProject",
        cStatic: true,
        cOption: [
          { id: "Permanent", label: "Permanent" },
          { id: "Contract", label: "Contract" },
          { id: "Freelance", label: "Freelance" },
          { id: "Terminate", label: "Terminate" },
          // { id: "E", label: "Entertaintment" }
        ],
        cDisplayColumn: "",
        cInputStatus: this.inputStatus,
      },
      PI_employee_expiry_date: {
        cValidate: "",
        cName: "employee_expiry_date",
        cOrder: 12,
        cKey: false,
        cProtect: false,
        cWithTime: false,
        cFormat: "dd/MM/yyyy",
        cParentForm: "OP_FormFmDriver",
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
        cInputStatus: this.inputStatus,
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
        cInputStatus: this.inputStatus,
      },
      // PI_emergency_phone_no_1: {
      //   cValidate: "",
      //   cName: "emergency_phone_no_1",
      //   cOrder: 15,
      //   cKey: false,
      //   cType: "text",
      //   cProtect: false,
      //   cParentForm: "OP_FormFmDriver",
      //   cDecimal: 2,
      //   cInputStatus: this.inputStatus
      // },
      PI_emergency_phone_no_1: {
        dataLookUp: null,
        cValidate: "",
        cName: "emergency_phone_no_1",
        ckey: false,
        cOrder: 15,
        cProtect: false,
        cParentForm: "OP_FormFmDriver",
        cStatic: true,
        cOption: [{ id: "+62", label: "+62" }],
        cDisplayColumn: "action_type,descs",
        cInputStatus: this.inputStatus,
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
        cInputStatus: this.inputStatus,
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
        cInputStatus: this.inputStatus,
      },
      PI_add_pict: {
        cName: "picture",
        cAccept: ".jpg, .png, .gif",
        cTitle: "Browse",
        cModule: "OP",
      },
      M_ModalPict: {
        file_logo: "",
        file_logo_name: "",
        file_logo_path: "",
        file_show: require("@/assets/default_photo_.png"),
      },
      M_Picture: [],
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
    Delete_Pict(i) {
      this.M_Picture.splice(i, 1);
    },
    Onhandphone_1Change(data) {
      this.$nextTick(() => {
        this.M_FmDriver.handphone_1 = data.id;
        this.M_FmDriver.handphone_1Label = data.label;
      });
    },
    Onemployee_statusChange(data) {
      this.$nextTick(() => {
        this.M_FmDriver.employee_status = data.id;
        this.M_FmDriver.employee_statusLabel = data.label;
      });
    },
    Onadd_pictChange(data) {
      this.M_ModalPict.file_logo_name = data.name;
      this.M_ModalPict.file_logo_path = data.path;
      this.M_ModalPict.file_show = this.url + data.path;
    },
    addPict() {
      this.$refs.Modal_Picture._show();
      this.M_ModalPict = {
        file_logo: "",
        file_logo_name: "",
        file_logo_path: "",
        file_show: require("@/assets/default_photo_.png"),
      };
    },
    doAddPict() {
      this.M_Picture.push(this.M_ModalPict);
      this.$refs.Modal_Picture._hide();
    },
    showPict(pict) {
      this.M_ModalPict = pict;
      this.$refs.Show_Picture._show();
    },
    doBack() {
      this.$router.go(-1);
    },
    doList() {
      this.$router.push({ name: "OP_DriverManagement" });
    },

    M_ClearForm() {
      this.M_FmDriver = {
        fm_driver_id: 0,
        ss_portfolio_id: 0,
        employee_id: "",
        driver_name: "",
        handphone_1: "+62",
        handphone_1Label: "+62",
        handphone_2: "",
        ktp: "",
        npwp: "",
        sim: "",
        sim_expiry_date: "",
        skck: "",
        skck_expiry_date: "",
        employee_status: "",
        employee_statusLabel: "",
        employee_expiry_date: "",
        emergency_contact_name: "",
        emergency_relation: "",
        emergency_phone_no_1: "+62",
        emergency_phone_no_1Label: "+62",
        emergency_phone_no_2: "",
        emergency_remarks: "",
        dt_doc_file_name: "",
        dt_doc_path_file: "",
        user_input: "",
        user_edit: "",
        time_input: "",
        time_edit: "",
        row_id: 0,
        lastupdatestamp: 0,
      };
    },

    doSave() {
      this.$validator._base.validateAll("OP_FormFmDriver").then((result) => {
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
          (ress) => {
            if (ress.value) {
              this.$validator.errors.clear("OP_FormFmDriver");
              if (this.inputStatus == "edit") {
                this.M_UPdateN();
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
          user_input: this.getDataUser().user_id,
        },
        paramD = [];

      this.M_Picture.forEach((pict, index) => {
        paramD.push({
          _Method_: "SAVE",
          _LineNo_: 1,
          fm_driver_id: "A_Insert.row_id_output",
          doc_type: "NULL",
          doc_no: "NULL",
          doc_file_name: pict.file_logo_name,
          doc_path_file: pict.file_logo_path,
          expiry_date: "NULL",
          user_input: this.getDataUser().user_id,
        });
      });

      var param = {
        option_url: "/OP/OP_Driver",
        line_no: 0,
        Data: [
          {
            A_Insert: paramH,
            B_Looping: paramD,
          },
        ],
      };

      this.postJSONMulti(this.getUrlProsesDataPostMulti(), param).then(
        (response) => {
          // console.log(response)
          if (response == null) return;
          this.alertSuccess("Save Data Has Been Successfully").then(() => {
            // this.doBack();

            var param = {
              row_id: response.Data["A_Insert"].row_id,
              lastupdatestamp: 0,
            };
            param.isEdit = true;
            param.isView = true;
            this.$store.commit("setParamPage", param);
            this.$router.replace({ name: "OP_DriverManagementView" });
          });
        }
      );
    },
    M_UPdateN() {
      var paramH = {
          _Method_: "UPDATE",
          _LineNo_: 0,
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
          user_edit: this.getDataUser().user_id,
        },
        paramD = [];

      this.M_Picture.forEach((pict, index) => {
        paramD.push({
          _Method_: "SAVE",
          _LineNo_: 1,
          fm_driver_id: this.M_FmDriver.fm_driver_id,
          doc_type: "NULL",
          doc_no: "NULL",
          doc_file_name: pict.file_logo_name,
          doc_path_file: pict.file_logo_path,
          expiry_date: "NULL",
          user_input: this.getDataUser().user_id,
        });
      });
      // paramDelete = [];
      var paramDelete = {
        _Method_: "DELETE",
        _LineNo_: 1,
        row_id: this.M_FmDriver.fm_driver_id,
        lastupdatestamp: 0,
      };

      var param = {
        option_url: "/OP/OP_Driver",
        line_no: 0,
        Data: [
          {
            A_Update: paramH,
            B_Delete: paramDelete,
            C_Looping: paramD,
          },
        ],
      };

      this.postJSONMulti(this.getUrlProsesDataPostMulti(), param).then(
        (response) => {
          // console.log(response)
          if (response == null) return;
          this.alertSuccess("Update Data Has Been Successfully").then(() => {
            // this.doBack();

            this.$router.replace({ name: "OP_DriverManagementView" });
          });
        }
      );
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
        user_edit: this.getDataUser().user_id,
      };

      this.putJSON(this.getUrlCRUD(), param).then((response) => {
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          // this.doBack();
          this.$router.replace({ name: "OP_DriverManagementView" });
        });
      });
    },
    M_Delete() {
      var param = {
        option_url: "/OP/OP_Driver",
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
      this.M_PictureM = [];
      var param = {
        option_url: "/OP/OP_Driver",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp,
      };

      this.getJSON(this.getUrlCRUD(), param).then((response) => {
        // response from API
        if (response == null) return;

        var data = response.Data;
        for (let i = 0; i < data.length; i++) {
          if (i === 0) {
            var phone_no =
              data[i].handphone__tb_3 && data[i].handphone__tb_3 !== ""
                ? data[i].handphone__tb_3.split("-")
                : "";
            var emer_phone_no =
              data[i].emergency_phone_no__tb_14 &&
              data[i].emergency_phone_no__tb_14 !== ""
                ? data[i].emergency_phone_no__tb_14.split("-")
                : "";
            this.M_FmDriver = {
              fm_driver_id: data[i].fm_driver_id,
              ss_portfolio_id: data[i].ss_portfolio_id,
              employee_id: data[i].employee_id__tb_1,
              driver_name: data[i].driver_name__tb_2,
              handphone_1: phone_no[0],
              handphone_2: phone_no[1],
              ktp: data[i].ktp__tb_4,
              npwp: data[i].npwp__tb_5,
              sim: data[i].sim__tb_6,
              sim_expiry_date: data[i].sim_expiry_date__tb_7,
              skck: data[i].skck__tb_8,
              skck_expiry_date: data[i].skck_expiry_date__tb_9,
              employee_status: data[i].employee_status__tb_10,
              employee_expiry_date: data[i].employee_expiry_date__tb_11,
              emergency_contact_name: data[i].emergency_contact_name__tb_12,
              emergency_relation: data[i].emergency_relation__tb_13,
              emergency_phone_no_1: emer_phone_no[0],
              emergency_phone_no_2: emer_phone_no[1],
              emergency_remarks: data[i].emergency_remarks__tb_15,
              dt_doc_file_name: data[i].dt_doc_file_name,
              dt_doc_path_file: data[i].dt_doc_path_file,
              user_input: data[i].user_input,
              user_edit: data[i].user_edit,
              time_input: data[i].time_input,
              time_edit: data[i].time_edit,
              row_id: data[i].row_id,
              lastupdatestamp: data[i].lastupdatestamp,
            };
          }
          // if (data[i].dt_doc_file_name.length > 0) {
          //   this.M_PictureM_Picture.push({
          //     file_logo: "dtfile_" + i,
          //     file_logo_name: data[i].dt_doc_file_name,
          //     file_logo_path: data[i].dt_doc_path_file,
          //     file_show:
          //       data[i].dt_doc_path_file && data[i].dt_doc_path_file !== ""
          //         ? this.url + data[i].dt_doc_path_file
          //         : require("@/assets/default_photo_.png")
          //   });
          // }
          if (data[i].dt_doc_file_name.length > 0) {
            this.M_Picture.push({
              file_logo: "dtfile_" + i,
              file_logo_name: data[i].dt_doc_file_name,
              file_logo_path: data[i].dt_doc_path_file,
              file_show:
                data[i].dt_doc_path_file && data[i].dt_doc_path_file !== ""
                  ? this.url + data[i].dt_doc_path_file
                  : require("@/assets/default_photo_.png"),
            });
          }
        }
      });
    },
  },
  mounted() {
    this.M_ClearForm();
    if (this.inputStatus == "edit") {
      this.title = "Edit";
      this.GetDataBy();
    } else {
      this.title = "Add";
    }
  },
};
</script>

