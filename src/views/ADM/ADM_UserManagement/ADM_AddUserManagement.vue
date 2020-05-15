<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Customer List</span>
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
                <b-row>
                  <b-col md="2">
                    <div>
                      <img id="logo" :src="M_UserManagement.file_show" alt width="100%" />
                    </div>
                    <ACCImageUpload
                      :prop="PI_logo"
                      @change="onlogoChange"
                      v-model="M_UserManagement.file_logo"
                    />
                  </b-col>
                  <b-col md="10">
                    <!-- <b-row>
                    <b-col md="12">-->
                    <b-row>
                      <b-col md="2">
                        <font-awesome-icon class="icon-style-default" icon="check-circle" />
                        User
                      </b-col>
                      <b-col md="2">
                        : {{ M_UserManagement.user_name }}
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>User ID</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_user_id"
                          v-model="M_UserManagement.user_id"
                          ref="ref_user_id"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="9">
                        <span>
                          <label>Name</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_customer_name"
                          v-model="M_UserManagement.customer_name"
                          ref="ref_customer_name"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6" class="col-p-1">
                        <span>
                          <label style="width: 100px;">Phone No.</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_phone_no"
                          v-model="M_UserManagement.phone_no"
                          ref="ref_phone_no"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="9">
                        <span>
                          <label>Address</label>
                        </span>
                        <ACCTextArea
                          :prop="PI_address"
                          v-model="M_UserManagement.address"
                          ref="ref_address"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Email</label>
                        </span>
                        <ACCTextBox :prop="PI_email" v-model="M_UserManagement.email" ref="ref_email" />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Password</label>
                        </span>
                        <ACCTextBox
                          @input="OnpasswordChange"
                          :prop="PI_password"
                          v-model="M_UserManagement.password"
                          ref="ref_password"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Confirm Password</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_confirm_password"
                          v-model="M_UserManagement.confirm_password"
                          ref="ref_confirm_password"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Role</label>
                        </span>
                        <ACCLookUp
                          @change="OnroleChange"
                          :prop="PI_role"
                          v-model="M_UserManagement.role"
                          :label="M_UserManagement.roleLabel"
                          ref="ref_role"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="9">
                        <span>
                          <label>Notes</label>
                        </span>
                        <ACCTextArea
                          :prop="PI_notes"
                          v-model="M_UserManagement.notes"
                          ref="ref_notes"
                        />
                      </b-col>
                    </b-row>
                    <b-row style="margin-top: 10px;">
                      <b-col md="6">
                        <ABSButton
                          :text="'Save Customer'"
                          classButton="btn btn--default"
                          classIcon="icon-style-default"
                          @click="doSave"
                          styleButton="height: 40px;width: 100%;"
                        />
                      </b-col>
                    </b-row>
                    <!-- </b-col>
                    </b-row>-->
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
      PI_logo: {
        cName: "Logo",
        cAccept: ".jpg, .png, .gif",
        cTitle: "Add Logo",
        cModule: "MK"
      },
      PI_user_id: {
        cValidate: "",
        cName: "user_id",
        cOrder: 1,
        cKey: true,
        cType: "text",
        cProtect: false,
        cParentForm: "MK_AddNewProspect",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_customer_name: {
        cValidate: "",
        cName: "customer_name",
        cOrder: 1,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "MK_AddNewProspect",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_phone_no: {
        cValidate: "",
        cName: "phone_no",
        cOrder: 2,
        cKey: false,
        cType: "tel",
        cProtect: false,
        cParentForm: "MK_AddNewProspect",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_address: {
        cValidate: "",
        cName: "address",
        cOrder: 3,
        cKey: false,
        cProtect: false,
        cResize: false,
        cReadonly: false,
        cRows: 1,
        cMaxRows: 2,
        cSize: "md",
        cParentForm: "MK_AddNewProspect",
        cInputStatus: this.inputStatus
      },
      PI_email: {
        cValidate: "",
        cName: "email",
        cOrder: 4,
        cKey: false,
        cType: "email",
        cProtect: false,
        cParentForm: "MK_AddNewProspect",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_password: {
        cValidate: "",
        cName: "password",
        cOrder: 5,
        cKey: false,
        cType: "password",
        cProtect: false,
        cParentForm: "MK_AddNewProspect",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_confirm_password: {
        cValidate: "",
        cName: "confirm_password",
        cOrder: 6,
        cKey: false,
        cType: "password",
        cProtect: false,
        cParentForm: "MK_AddNewProspect",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_role: {
        dataLookUp: {
          LookUpCd: "GetUserGroup",
          ColumnDB: "group_id",
          InitialWhere: "",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "descs,time_edit"
        },
        cValidate: "",
        cName: "role",
        ckey: false,
        cOrder: 7,
        cProtect: false,
        cParentForm: "MK_AddNewProspect",
        cStatic: false,
        cOption: [],
        cDisplayColumn: "descs,time_edit",
        cInputStatus: this.inputStatus
      },
      PI_notes: {
        cValidate: "",
        cName: "notes",
        cOrder: 8,
        cKey: false,
        cProtect: false,
        cResize: false,
        cReadonly: false,
        cRows: 1,
        cMaxRows: 3,
        cSize: "md",
        cParentForm: "MK_AddNewProspect",
        cInputStatus: this.inputStatus
      },
      M_UserManagement: {
        user_name: this.getDataUser().user_name,
        user_id: "",
        customer_name: "",
        phone_no: "",
        address: "",
        email: "",
        password: "",
        confirm_password: "",
        role: "",
        roleLabel: "",
        notes: "",
        user_level: "S",
        file_logo: "",
        file_show: require("@/assets/default_photo_.png"),
        file_logo_name: "",
        file_logo_path: "",
        lastupdatestamp: ""
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
      this.M_UserManagement = {
        user_name: this.getDataUser().user_name,
        user_id: "",
        customer_name: "",
        phone_no: "",
        address: "",
        email: "",
        password: "",
        confirm_password: "",
        role: "",
        roleLabel: "",
        notes: "",
        user_level: "S",
        file_logo: "",
        file_show: this.default_pic,
        file_logo_name: "",
        file_logo_path: ""
      };
    },
    OnpasswordChange(data) {
      this.PI_confirm_password.cValidate = "confirmed:" + data
    },
    OnroleChange(data) {
      this.$nextTick(() => {
        this.M_UserManagement.role = data.ss_group_id;
        this.M_UserManagement.roleLabel = data.descs;
      });
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
        ss_portfolio_id: this.getDataUser().portfolio_id,
        ss_subportfolio_id: this.getDataUser().subportfolio_id,
        user_id: this.M_UserManagement.user_id,
        ss_group_id: this.M_UserManagement.role,
        user_name: this.M_UserManagement.customer_name,
        address: this.M_UserManagement.address,
        password: this.M_UserManagement.password,
        email: this.M_UserManagement.email,
        user_level: this.M_UserManagement.user_level,
        hand_phone: this.M_UserManagement.phone_no,
        file_name: this.M_UserManagement.file_logo_name,
        path_file: this.M_UserManagement.file_logo_path,
        notes: this.M_UserManagement.notes,
        user_input: this.getDataUser().user_id
      };

      this.postJSON(this.getUrlAPIUser(), param).then(response => {
        // console.log(response)
        if (response == null) return;
        this.alertSuccess("Save Data Has Been Successfully").then(() => {
          this.doBack();
        });
      });
    },
    GetDataBy() {
      var param = {
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };

      this.getJSON(this.getUrlAPIUser(this.paramFromList.row_id), param).then(response => {
        // response from API
        if (response == null) return;

        var data = response.Data;

        this.PI_user_id.cProtect = true

        this.M_UserManagement = {
          user_name: this.getDataUser().user_name,
          ss_user_id: data.ss_user_id,
          user_id: data.user_id,
          customer_name: data.user_name,
          phone_no: data.hand_phone,
          address: data.address,
          email: data.email,
          password: "",
          confirm_password: "",
          role: data.ss_group_id,
          roleLabel: data.group_descs,
          notes: data.notes,
          user_level: data.user_level,
          file_logo: data.file_name,
          file_show: data.file_name && data.file_name !== '' ? (this.url + data.file_name) : this.default_pic,
          file_logo_name: data.file_name,
          file_logo_path: data.file_name && data.file_name !== '' ? (this.url + data.file_name) : ""
        };
      });
    },
    M_Update() {
      var param = {
        ss_portfolio_id: this.getDataUser().portfolio_id,
        ss_subportfolio_id: this.getDataUser().subportfolio_id,
        ss_user_id: this.M_UserManagement.ss_user_id,
        user_id: this.M_UserManagement.user_id,
        ss_group_id: this.M_UserManagement.role,
        user_name: this.M_UserManagement.customer_name,
        address: this.M_UserManagement.address,
        password: this.M_UserManagement.password,
        email: this.M_UserManagement.email,
        user_level: this.M_UserManagement.user_level,
        hand_phone: this.M_UserManagement.phone_no,
        file_name: this.M_UserManagement.file_logo_name,
        path_file: this.M_UserManagement.file_logo_path,
        notes: this.M_UserManagement.notes,
        lastupdatestamp: this.paramFromList.lastupdatestamp,
        user_edit: this.getDataUser().user_id
      };

      this.putJSON(this.getUrlAPIUser(), param).then(response => {
        // console.log(response)
        if (response == null) return;
        this.alertSuccess("Update Data Has Been Successfully").then(() => {
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