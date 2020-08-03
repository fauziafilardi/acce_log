<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>{{title}} FieldClerk</span>
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
                :data-vv-scope="'OP_FormOpFieldClerkDtl'"
                :data-vv-value-path="'OP_FormOpFieldClerkDtl'"
              >
                <b-row>
                  <b-col md="2">
                    <div>
                      <!-- <img :src="M_NewProspect.path_file" alt width="100%" /> -->
                      <img :src="require('@/assets/paper.png')" alt style="width: 70px;" />
                    </div>
                  </b-col>
                  <b-col md="10">
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Company Name</label>
                        </span>
                        <ACCDropDown
                          @change="Oncm_contact_idChange"
                          :prop="PI_cm_contact_id"
                          v-model="M_OpFieldClerkDtl.cm_contact_id"
                          :label="M_OpFieldClerkDtl.nameLabel"
                          ref="ref_cm_contact_id"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Address</label>
                        </span>
                        <ACCDropDown
                          @change="Oncm_contact_delivery_address_idChange"
                          :prop="PI_cm_contact_delivery_address_id"
                          v-model="M_OpFieldClerkDtl.cm_contact_delivery_address_id"
                          :label="M_OpFieldClerkDtl.addressLabel"
                          ref="ref_cm_contact_delivery_address_id"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Description</label>
                        </span>
                        <ACCTextArea
                          :prop="PI_descs"
                          v-model="M_OpFieldClerkDtl.descs"
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

      M_OpFieldClerkDtl: {
        op_field_clerk_dtl_id: 0,
        ss_portfolio_id: 0,
        op_field_clerk_id: 0,
        cm_contact_id: 0,
        nameLabel: "",
        cm_contact_delivery_address_id: 0,
        addressLabel: "",
        descs: "",
        user_input: "",
        user_edit: "",
        time_input: "",
        time_edit: "",
        row_id: 0,
        lastupdatestamp: 0,
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
        cOrder: 1,
        cKey: false,
        cStatic: false,
        cProtect: false,
        cParentForm: "OP_FormOpFieldClerkDtl",
        cOption: [],
        cDisplayColumn: "",
        cInputStatus: this.inputStatus,
      },
      PI_cm_contact_delivery_address_id: {
        dataLookUp: {
          LookUpCd: "GetContactDeliveryAddress",
          ColumnDB: "cm_contact_delivery_address_id",
          InitialWhere: "",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "",
        },
        cValidate: "",
        cName: "cm_contact_delivery_address_id",
        cOrder: 2,
        cKey: false,
        cStatic: false,
        cProtect: false,
        cParentForm: "OP_FormOpFieldClerkDtl",
        cOption: [],
        cDisplayColumn: "",
        cInputStatus: this.inputStatus,
      },
      PI_descs: {
        cValidate: "",
        cName: "descs",
        cOrder: 3,
        cKey: false,
        cProtect: false,
        cResize: false,
        cReadonly: false,
        cRows: 1,
        cMaxRows: 4,
        cSize: "md",
        cParentForm: "OP_FormOpFieldClerkDtl",
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
    Oncm_contact_idChange(data) {
      this.$nextTick(() => {
        this.M_OpFieldClerkDtl.cm_contact_id = data.id;
        this.M_OpFieldClerkDtl.nameLabel = data.label;

        this.PI_cm_contact_delivery_address_id.dataLookUp.InitialWhere =
          "cm_contact_id=" + data.id;
      });
    },
    Oncm_contact_delivery_address_idChange(data) {
      this.$nextTick(() => {
        this.M_OpFieldClerkDtl.cm_contact_delivery_address_id = data.id;
        this.M_OpFieldClerkDtl.addressLabel = data.label;
      });
    },
    OndescsChange(data) {
      this.$nextTick(() => {
        this.M_OpFieldClerkDtl.descs = data.id;
        this.M_OpFieldClerkDtl.descs = data.descs;
      });
    },

    M_ClearForm() {
      this.M_OpFieldClerkDtl = {
        op_field_clerk_dtl_id: 0,
        ss_portfolio_id: 0,
        op_field_clerk_id: 0,
        cm_contact_id: 0,
        nameLabel: "",
        cm_contact_delivery_address_id: 0,
        addressLabel: "",
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
        .validateAll("OP_FormOpFieldClerkDtl")
        .then((result) => {
          if (!result) return;
          this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
            (ress) => {
              if (ress.value) {
                this.$validator.errors.clear("OP_FormOpFieldClerkDtl");
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
        option_url: "/OP/OP_FieldClerk",
        line_no: 1,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        op_field_clerk_id: this.paramFromList.row_id,
        cm_contact_id: this.M_OpFieldClerkDtl.cm_contact_id,
        cm_contact_delivery_address_id: this.M_OpFieldClerkDtl
          .cm_contact_delivery_address_id,
        descs: this.M_OpFieldClerkDtl.descs,
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
        option_url: "/OP/OP_FieldClerk",
        line_no: 1,
        op_field_clerk_dtl_id: this.M_OpFieldClerkDtl.op_field_clerk_dtl_id,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        op_field_clerk_id: this.paramFromList.row_id,
        cm_contact_id: this.M_OpFieldClerkDtl.cm_contact_id,
        cm_contact_delivery_address_id: this.M_OpFieldClerkDtl
          .cm_contact_delivery_address_id,
        descs: this.M_OpFieldClerkDtl.descs,
        lastupdatestamp: this.paramFromList.lastupdatestamp,
        user_edit: this.getDataUser().user_id,
      };

      this.putJSON(this.getUrlCRUD(), param).then((response) => {
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          if (this.inputStatus == "new") {
            this.doBack();
          } else {
            this.$router.replace({ name: "OP_FieldClerk" });
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
        option_url: "/OP/OP_FieldClerk",
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
        option_url: "/OP/OP_FieldClerk",
        line_no: 1,
        id: this.paramFromList.DataDetail.row_id,
        lastupdatestamp: this.paramFromList.DataDetail.lastupdatestamp,
      };

      this.getJSON(this.getUrlCRUD(), param).then((response) => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];

        this.M_OpFieldClerkDtl = {
          op_field_clerk_dtl_id: data.op_field_clerk_dtl_id,
          ss_portfolio_id: data.ss_portfolio_id,
          op_field_clerk_id: data.op_field_clerk_id,
          cm_contact_id: data.cm_contact_id__lo_1,
          nameLabel: data.name__lbl__lo_1,
          cm_contact_delivery_address_id:
            data.cm_contact_delivery_address_id__lo_2,
          addressLabel: data.address__lbl__lo_2,
          descs: data.descs__lo_3,
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
      this.PI_cm_contact_id.cProtect = true;
    } else {
      this.title = "Add";
    }
  },
};
</script>

