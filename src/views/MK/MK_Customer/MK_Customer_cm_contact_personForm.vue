<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>{{title}} PIC</span>
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
                :data-vv-scope="'MK_FormCmContactPerson'"
                :data-vv-value-path="'MK_FormCmContactPerson'"
              >
                <b-row>
                  <b-col md="2">
                    <div>
                      <!-- <img :src="M_CmContactPerson.path_file" alt width="100%" /> -->
                      <img :src="require('@/assets/paper.png')" alt style="width: 70px;" />
                    </div>
                  </b-col>
                  <b-col md="10">
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Contact Person</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_name"
                          v-model="M_CmContactPerson.name"
                          ref="ref_name"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Position</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_position"
                          v-model="M_CmContactPerson.position"
                          ref="ref_position"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="2" class="col-p-1">
                        <span>
                          <label style="width: 100px;">Phone No.</label>
                        </span>
                        <!-- <ACCTextBox
                          :prop="PI_phone_no_1"
                          v-model="M_CmContactPerson.phone_no_1"
                          ref="ref_phone_no_1"
                        />-->
                        <ACCDropDown
                          @change="Onphone_no_1Change"
                          :prop="PI_phone_no_1"
                          v-model="M_CmContactPerson.phone_no_1"
                          :label="M_CmContactPerson.phone_no_1Label"
                          ref="ref_phone_no_1"
                        />
                      </b-col>
                      <span style="margin-top: 35px;">-</span>
                      <b-col md="4" class="col-p-3">
                        <span>
                          <label>&nbsp;</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_phone_no_2"
                          v-model="M_CmContactPerson.phone_no_2"
                          ref="ref_phone_no_3"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Email</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_email"
                          v-model="M_CmContactPerson.email"
                          ref="ref_email"
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

      M_CmContactPerson: {
        cm_contact_person_id: 0,
        cm_contact_id: 0,
        name: "",
        position: "",
        phone_no_1: "+62",
        phone_no_1Label: "+62",
        phone_no_2: "",
        email: "",
        position: "",
        descs: "",
        user_input: "",
        user_edit: "",
        time_input: "",
        time_edit: "",
        row_id: 0,
        lastupdatestamp: 0,
      },
      PI_name: {
        cValidate: "",
        cName: "name",
        cOrder: 1,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "MK_FormCmContactPerson",
        cDecimal: 2,
        cInputStatus: this.inputStatus,
      },
      PI_position: {
        cValidate: "",
        cName: "position",
        cOrder: 2,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "MK_FormCmContactPerson",
        cDecimal: 2,
        cInputStatus: this.inputStatus,
      },
      PI_phone_no_1: {
        dataLookUp: null,
        cValidate: "",
        cName: "phone_no_1",
        ckey: false,
        cOrder: 2,
        cProtect: false,
        cParentForm: "MK_FormCmContactPerson",
        cStatic: true,
        cOption: [{ id: "+62", label: "+62" }],
        cDisplayColumn: "action_type,descs",
        cInputStatus: this.inputStatus,
      },

      PI_phone_no_2: {
        cValidate: "max:20",
        cName: "phone_no_2",
        cOrder: 3,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "MK_FormCmContactPerson",
        cDecimal: 2,
        cInputStatus: this.inputStatus,
      },
      PI_email: {
        cValidate: "",
        cName: "email",
        cOrder: 4,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "MK_FormCmContactPerson",
        cDecimal: 2,
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
    doBack() {
      this.$router.go(-1);
    },
    Onphone_no_1Change(data) {
      this.$nextTick(() => {
        this.M_NewProspect.phone_no_1 = data.id;
        this.M_NewProspect.phone_no_1Label = data.label;
      });
    },
    M_ClearForm() {
      this.M_CmContactPerson = {
        cm_contact_person_id: 0,
        cm_contact_id: 0,
        name: "",
        position: "",
        phone_no_1: "+62",
        phone_no_1Label: "+62",
        phone_no_2: "",
        email: "",
        position: "",
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
      this.$validator._base
        .validateAll("MK_FormCmContactPerson")
        .then((result) => {
          if (!result) return;
          this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
            (ress) => {
              if (ress.value) {
                this.$validator.errors.clear("MK_FormCmContactPerson");
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
        option_url: "/MK/MK_Customer",
        line_no: 1,
        cm_contact_id: this.paramFromList.row_id,
        name: this.M_CmContactPerson.name,
        position: this.M_CmContactPerson.position,
        phone_no:
          this.M_CmContactPerson.phone_no_1 +
          "-" +
          this.M_CmContactPerson.phone_no_2,
        email: this.M_CmContactPerson.email,
        position: this.M_CmContactPerson.position,
        descs: this.M_CmContactPerson.descs,
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
        option_url: "/MK/MK_Customer",
        line_no: 1,
        cm_contact_person_id: this.M_CmContactPerson.cm_contact_person_id,
        cm_contact_id: this.paramFromList.row_id,
        name: this.M_CmContactPerson.name,
        position: this.M_CmContactPerson.position,
        phone_no:
          this.M_CmContactPerson.phone_no_1 +
          "-" +
          this.M_CmContactPerson.phone_no_2,
        email: this.M_CmContactPerson.email,
        position: this.M_CmContactPerson.position,
        descs: this.M_CmContactPerson.descs,
        lastupdatestamp: this.paramFromList.DetailList.lastupdatestamp,
        user_edit: this.getDataUser().user_id,
      };

      this.putJSON(this.getUrlCRUD(), param).then((response) => {
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          if (this.inputStatus == "new") {
            this.doBack();
          } else {
            if (this.paramFromList.contact_type == "V") {
              this.$router.replace({ name: "OP_VendorView" });
            } else {
              this.$router.replace({ name: "MK_CustomerView" });
            }
          }
        });
      });
    },
    doDelete() {
      this.alertConfirmation("Are You Sure Want To Delete This Data ?").then(
        (ress) => {
          if (ress.value) {
            this.M_Delete();
          }
        }
      );
    },
    M_Delete() {
      var param = {
        option_url: "/MK/MK_Customer",
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
        option_url: "/MK/MK_Customer",
        line_no: 1,
        id: this.paramFromList.DetailList.row_id,
        lastupdatestamp: this.paramFromList.DetailList.lastupdatestamp,
      };

      this.getJSON(this.getUrlCRUD(), param).then((response) => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];
        var phone_no =
          data.phone_no__tb_2 && data.phone_no__tb_2 !== ""
            ? data.phone_no__tb_2.split("-")
            : "";

        this.M_CmContactPerson = {
          cm_contact_person_id: data.cm_contact_person_id,
          cm_contact_id: data.cm_contact_id,
          name: data.name__tb_1,
          position: data.position,
          // phone_no_1 : data.phone_no__tb_2,
          phone_no_1: phone_no !== "" ? phone_no[0] : phone_no,
          phone_no_2: phone_no !== "" ? phone_no[1] : phone_no,
          email: data.email__tb_3,
          position: data.position,
          descs: data.descs,
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
      this.title = "Add";
    }
  },
};
</script>

