<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Appointment</span>
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
                :data-vv-scope="'MK_AddAppointment'"
                :data-vv-value-path="'MK_AddAppointment'"
              >
                <b-row>
                  <b-col md="2" style="text-align: center;">
                    <img :src="require('@/assets/date.png')" alt style="width: 100px;" />
                  </b-col>
                  <b-col md="10">
                    <b-row>
                      <b-col md="9">
                        <span>
                          <label>
                            Customer
                            <span style="color:red;">*</span>
                          </label>
                        </span>
                        <ACCLookUp
                          @change="OncustomerChange"
                          :prop="PI_customer"
                          v-model="M_Appointment.customer"
                          :label="M_Appointment.customerLabel"
                          ref="ref_customer"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>
                            Action
                            <span style="color:red;">*</span>
                          </label>
                        </span>
                        <ACCDropDown
                          @change="OnactionChange"
                          :prop="PI_action"
                          v-model="M_Appointment.action"
                          :label="M_Appointment.actionLabel"
                          ref="ref_action"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>
                            PIC
                            <span style="color:red;">*</span>
                          </label>
                        </span>
                        <!-- <ACCTextBox
                          :prop="PI_contact_person"
                          v-model="M_Appointment.contact_person"
                          ref="ref_contact_person"
                        />-->
                        <ACCLookUp
                          @change="Oncontact_personChange"
                          :prop="PI_contact_person"
                          v-model="M_Appointment.contact_person"
                          :label="M_Appointment.contact_personLabel"
                          ref="ref_contact_person"
                        />
                      </b-col>
                      <b-col md="1">
                        <b-button
                          style="background-color: transparent; color: black; border: none;"
                          @click="doAddPIC"
                        >
                          <font-awesome-icon
                            icon="plus-square"
                            class="icon-style-default"
                            style="margin-right: 5px;margin-top: 70%;"
                            size="3x"
                          />
                        </b-button>
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>
                            Appointment Date
                            <span style="color:red;">*</span>
                          </label>
                        </span>
                        <ACCDateTime
                          @input="Onappointment_dateChange"
                          :prop="PI_appointment_date"
                          v-model="M_Appointment.appointment_date"
                          ref="ref_appointment_date"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="9">
                        <span>
                          <label>Meeting Location</label>
                        </span>
                        <ACCTextArea
                          :prop="PI_meeting_location"
                          v-model="M_Appointment.meeting_location"
                          ref="ref_meeting_location"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="9">
                        <span>
                          <label>
                            Description
                            <span style="color:red;">*</span>
                          </label>
                        </span>
                        <ACCTextArea
                          :prop="PI_descs"
                          v-model="M_Appointment.descs"
                          ref="ref_descs"
                        />
                      </b-col>
                    </b-row>
                    <b-row style="margin-top: 10px;">
                      <b-col md="6">
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
              </b-form>
              <ABSModal id="Modal_PIC" ref="Modal_PIC" size="sm">
                <template slot="headerTitle">PIC</template>
                <template slot="content">
                  <b-row>
                    <b-col md="12">
                      <b-form :data-vv-scope="'Parent_PIC'" :data-vv-value-path="'Parent_PIC'">
                        <b-row>
                          <b-col md="12">
                            <b-row>
                              <b-col md="12">
                                <span>
                                  <label>Contact Person</label>
                                </span>
                                <ACCTextBox
                                  :prop="MForm.PI_contact_person"
                                  v-model="M_Pic.contact_person"
                                  ref="mref_contact_person_modal"
                                />
                              </b-col>
                            </b-row>
                            <b-row>
                              <b-col md="3" class="col-p-1">
                                <span>
                                  <label style="width: 100px;">Contact Phone No.</label>
                                </span>
                                <ACCTextBox
                                  :prop="MForm.PI_contact_phone_no_1"
                                  v-model="M_Pic.contact_phone_no_1"
                                  ref="mref_contact_phone_no_1"
                                  style="width: 50px;"
                                />
                              </b-col>
                              <b-col md="3" class="col-p-2">
                                <span>
                                  <label>&nbsp;</label>
                                </span>
                                <ACCTextBox
                                  :prop="MForm.PI_contact_phone_no_2"
                                  v-model="M_Pic.contact_phone_no_2"
                                  ref="mref_contact_phone_no_2"
                                />
                              </b-col>
                              <b-col md="6" class="col-p-3">
                                <span>
                                  <label>&nbsp;</label>
                                </span>
                                <ACCTextBox
                                  :prop="MForm.PI_contact_phone_no_3"
                                  v-model="M_Pic.contact_phone_no_3"
                                  ref="mref_contact_phone_no_3"
                                />
                              </b-col>
                            </b-row>
                            <b-row>
                              <b-col md="12">
                                <span>
                                  <label>Email</label>
                                </span>
                                <ACCTextBox
                                  :prop="MForm.PI_email"
                                  v-model="M_Pic.email"
                                  ref="mref_email_modal"
                                />
                              </b-col>
                            </b-row>
                            <b-row style="margin-top: 10px;">
                              <b-col md="6">
                                <ABSButton
                                  :text="'Add'"
                                  classButton="btn btn--default"
                                  classIcon="icon-style-1"
                                  @click="SaveModal"
                                  styleButton="height: 40px;width: 100%;"
                                />
                              </b-col>
                              <b-col md="6">
                                <ABSButton
                                  :text="'Cancel'"
                                  classButton="btn btn--back"
                                  classIcon="icon-style-1"
                                  @click="CancelModal"
                                  styleButton="height: 40px;width: 100%;"
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
      M_Appointment: {
        customer: "",
        customerLabel: "",
        action: "",
        actionLabel: "",
        contac_person: "",
        contact_personLabel: "",
        appointment_date: "",
        meeting_location: "",
        descs: ""
      },
      PI_customer: {
        dataLookUp: {
          LookUpCd: "GetCMContact",
          ColumnDB: "contact_id",
          InitialWhere: "",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "name,contact_person,time_edit"
        },
        cValidate: "required",
        cName: "customer",
        ckey: false,
        cOrder: 1,
        cProtect: false,
        cParentForm: "MK_AddAppointment",
        cStatic: false,
        cOption: [],
        cDisplayColumn: "name,contact_person,time_edit",
        cInputStatus: this.inputStatus
      },
      PI_action: {
        dataLookUp: null,
        cValidate: "required",
        cName: "action",
        ckey: false,
        cOrder: 2,
        cProtect: false,
        cParentForm: "MK_AddAppointment",
        cStatic: true,
        cOption: [
          { id: "C", label: "Call" },
          { id: "V", label: "Visit" },
          { id: "E", label: "Entertaintment" }
        ],
        cDisplayColumn: "action_type,descs",
        cInputStatus: this.inputStatus
      },
      // PI_contact_person: {
      //   cValidate: "required",
      //   cName: "contact_person",
      //   cOrder: 3,
      //   cKey: false,
      //   cType: "text",
      //   cProtect: false,
      //   cParentForm: "MK_AddAppointment",
      //   cDecimal: 2,
      //   cInputStatus: this.inputStatus
      // },
      PI_contact_person: {
        dataLookUp: {
          LookUpCd: "GetContactPerson",
          ColumnDB: "contact_person_id",
          InitialWhere: " cm_contact_id = '' ",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "name,phone_no,email,time_edit"
        },
        cValidate: "required",
        cName: "contact_person",
        ckey: false,
        cOrder: 3,
        cProtect: false,
        cParentForm: "MK_AddAppointment",
        cStatic: false,
        cOption: [],
        cDisplayColumn: "name,phone_no,email,time_edit",
        cInputStatus: this.inputStatus
      },
      PI_appointment_date: {
        cValidate: "required",
        cName: "appointment_date",
        cOrder: 4,
        cKey: false,
        cProtect: false,
        cWithTime: true,
        cFormat: "dd/MM/yyyy",
        cParentForm: "MK_AddAppointment"
      },
      PI_meeting_location: {
        cValidate: "",
        cName: "meeting_location",
        cOrder: 2,
        cKey: false,
        cProtect: false,
        cResize: false,
        cReadonly: false,
        cRows: 1,
        cMaxRows: 2,
        cSize: "md",
        cParentForm: "MK_AddAppointment",
        cInputStatus: this.inputStatus
      },
      PI_descs: {
        cValidate: "required",
        cName: "descs",
        cOrder: 2,
        cKey: false,
        cProtect: false,
        cResize: false,
        cReadonly: false,
        cRows: 3,
        cMaxRows: 3,
        cSize: "md",
        cParentForm: "MK_AddAppointment",
        cInputStatus: this.inputStatus
      },
      MForm: {
        PI_contact_person: {
          cValidate: "",
          cName: "contact_person",
          cOrder: 12,
          cKey: false,
          cType: "text",
          cProtect: false,
          cParentForm: "Parent_PIC",
          cDecimal: 2,
          cInputStatus: this.inputStatus
        },
        PI_contact_phone_no_1: {
          cValidate: "max:20",
          cName: "contact_phone_no_1",
          cOrder: 13,
          cKey: false,
          cType: "tel",
          cProtect: false,
          cParentForm: "Parent_PIC",
          cDecimal: 2,
          cInputStatus: this.inputStatus
        },
        PI_contact_phone_no_2: {
          cValidate: "max:20",
          cName: "contact_phone_no_2",
          cOrder: 14,
          cKey: false,
          cType: "numeric",
          cProtect: false,
          cParentForm: "Parent_PIC",
          cDecimal: 2,
          cInputStatus: this.inputStatus
        },
        PI_contact_phone_no_3: {
          cValidate: "max:8",
          cName: "contact_phone_no_3",
          cOrder: 15,
          cKey: false,
          cType: "numeric",
          cProtect: false,
          cParentForm: "Parent_PIC",
          cDecimal: 2,
          cInputStatus: this.inputStatus
        },
        PI_email: {
          cValidate: "",
          cName: "email",
          cOrder: 10,
          cKey: false,
          cType: "email",
          cProtect: false,
          cParentForm: "Parent_PIC",
          cDecimal: 2,
          cInputStatus: this.inputStatus
        }
      },
      M_Pic: {
        email: "",
        contact_person: "",
        contact_phone_no_1: "+62",
        contact_phone_no_2: "",
        contact_phone_no_3: "",
        cm_contact_id: "",
        cm_contact_person_id: "",
        lastupdatestamp: ""
      }
    };
  },
  computed: {
    paramFromList() {
      var param = this.$store.getters.getParamPage;
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
      var param = this.$store.getters.getParamPage;
      if (param.isEdit && param.isEdit === true) {
        return "edit";
      } else {
        return "new";
      }
    }
  },
  methods: {
    CancelModal() {
      this.$refs.Modal_PIC._hide();
      this.M_ClearPIC();
    },
    doBack() {
      this.$router.go(-1);
    },
    doAddPIC() {
      if (this.M_Appointment.customer && this.M_Appointment.customer !== "") {
        this.M_ClearPIC();
        this.inputStatus = "new";
        this.$refs.Modal_PIC._show();
      } else {
        this.alertError("Please Select Customer First !");
      }
    },
    SaveModal() {
      this.$validator._base.validateAll("Parent_PIC").then(result => {
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
          ress => {
            if (ress.value) {
              this.$validator.errors.clear("Parent_PIC");
              this.SaveModals();
            }
          }
        );
      });
    },
    SaveModals() {
      var param = {
        option_url: "/MK/MK_Appointment",
        line_no: 2,
        cm_contact_id: this.M_Appointment.customer,
        name: this.M_Pic.contact_person,
        phone_no:
          this.M_Pic.contact_phone_no_1 +
          "-" +
          this.M_Pic.contact_phone_no_2 +
          "-" +
          this.M_Pic.contact_phone_no_3,
        email: this.M_Pic.email,
        user_input: this.getDataUser().user_id
      };

      this.postJSON(this.getUrlCRUD(), param).then(response => {
        // console.log(response); return;
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          var dtrow = response.Data[0].row_id;
          this.M_Appointment.contact_person = dtrow;
          this.M_Appointment.contact_personLabel = this.M_Pic.contact_person;

          this.CancelModal();
        });
      });
    },
    OncustomerChange(data) {
      this.$nextTick(() => {
        this.M_Appointment.customer = data.row_id;
        this.M_Appointment.customerLabel = data.name;
        // this.M_Appointment.contact_person = data.contact_person;
        this.PI_contact_person.dataLookUp.InitialWhere =
          " cm_contact_id = '" + data.row_id + "' ";
      });
    },
    OnactionChange(data) {
      this.$nextTick(() => {
        this.M_Appointment.action = data.id;
        this.M_Appointment.actionLabel = data.label;
      });
    },
    Oncontact_personChange(data) {
      this.$nextTick(() => {
        this.M_Appointment.contact_person = data.id;
        this.M_Appointment.contact_personLabel = data.label;
      });
    },
    Onappointment_dateChange(data) {
      // this.M_Appointment.appointment_date = data
    },
    M_ClearForm() {
      this.M_Appointment = {
        customer: "",
        customerLabel: "",
        action: "",
        actionLabel: "",
        contac_person: "",
        contact_personLabel: "",
        appointment_date: "",
        meeting_location: "",
        descs: ""
      };
    },
    M_ClearPIC() {
      this.M_Pic = {
        contact_person: "",
        contact_phone_no_1: "+62",
        contact_phone_no_2: "",
        contact_phone_no_3: "",
        email: ""
      };
    },
    doSave() {
      this.$validator._base.validateAll("MK_AddAppointment").then(result => {
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
          ress => {
            if (ress.value) {
              this.$validator.errors.clear("MK_AddAppointment");
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
        option_url: "/MK/MK_Appointment",
        line_no: 0,
        cm_contact_id: this.M_Appointment.customer,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        action_type: this.M_Appointment.action,
        // pic: this.M_Appointment.contact_person,
        appointment_date: this.M_Appointment.appointment_date,
        meeting_address: this.M_Appointment.meeting_location,
        cm_contact_person_id: this.M_Appointment.contact_person,
        appointment_type: "A",
        descs: this.M_Appointment.descs,
        user_input: this.getDataUser().user_id
      };

      this.postJSON(this.getUrlCRUD(), param).then(response => {
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
  }
};
</script>

<style>
</style>