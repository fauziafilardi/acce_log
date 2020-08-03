<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>{{title}} Field Clerk</span>
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
                :data-vv-scope="'OP_FormOpFieldClerk'"
                :data-vv-value-path="'OP_FormOpFieldClerk'"
              >
                <b-row>
                  <b-col md="2">
                    <div>
                      <!-- <img :src="M_NewProspect.path_file" alt width="100%" /> -->
                      <img :src="require('@/assets/paper.png')" alt style="width: 70px;" />
                    </div>
                  </b-col>
                  <b-col md="10" class="row-bordered">
                    <b-col md="6" offset="2">
                      <b-row>
                        <b-col>
                          <span>
                            <label>Coverage</label>
                          </span>
                          <ACCTextBox
                            :prop="PI_coverage"
                            v-model="M_OpFieldClerk.coverage"
                            ref="ref_coverage"
                          />
                        </b-col>
                      </b-row>
                      <b-row>
                        <b-col>
                          <span>
                            <label>PIC</label>
                          </span>
                          <ACCDropDown
                            @change="Onuser_idChange"
                            :prop="PI_user_id"
                            v-model="M_OpFieldClerk.user_id"
                            :label="M_OpFieldClerk.user_idLabel"
                            ref="ref_user_id"
                          />
                        </b-col>
                      </b-row>
                      <b-row>
                        <b-col>
                          <span>
                            <label>Advanced Limit</label>
                          </span>
                          <ACCTextBox
                            :prop="PI_advanced_limit"
                            v-model="M_OpFieldClerk.advanced_limit"
                            ref="ref_advanced_limit"
                          />
                        </b-col>
                        <b-col>
                          <span>
                            <label>Reinbursment Limit</label>
                          </span>
                          <ACCTextBox
                            :prop="PI_reinbursment_limit"
                            v-model="M_OpFieldClerk.reinbursment_limit"
                            ref="ref_reinbursment_limit"
                          />
                        </b-col>
                      </b-row>
                      <b-row>
                        <b-col>
                          <span>
                            <label>Description</label>
                          </span>
                          <ACCTextArea
                            :prop="PI_descs"
                            v-model="M_OpFieldClerk.descs"
                            ref="ref_descs"
                          />
                        </b-col>
                      </b-row>

                      <b-row style="margin-top: 10px;">
                        <b-col>
                          <ABSButton
                            :text="'Save '"
                            classButton="btn btn--default"
                            classIcon="icon-style-default"
                            @click="doSave"
                            styleButton="height: 40px;width: 100%;"
                          />
                        </b-col>
                      </b-row>
                    </b-col>
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

      M_OpFieldClerk: {
        op_field_clerk_id: 0,
        ss_portfolio_id: 0,
        coverage: "",
        user_id: "",
        user_idLabel: "",
        advanced_limit: 0,
        reinbursment_limit: 0,
        descs: "",
        user_input: "",
        user_edit: "",
        time_input: "",
        time_edit: "",
        row_id: 0,
        lastupdatestamp: 0,
      },
      PI_coverage: {
        cValidate: "",
        cName: "coverage",
        cOrder: 1,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "OP_FormOpFieldClerk",
        cDecimal: 2,
        cInputStatus: this.inputStatus,
      },
      PI_user_id: {
        dataLookUp: {
          LookUpCd: "GetUser",
          ColumnDB: "ss_user_id",
          InitialWhere: "",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "",
        },
        cValidate: "",
        cName: "user_id",
        cOrder: 2,
        cKey: false,
        cStatic: false,
        cProtect: false,
        cParentForm: "OP_FormOpFieldClerk",
        cOption: [],
        cDisplayColumn: "ss_user_id,user_name",
        cInputStatus: this.inputStatus,
      },
      PI_advanced_limit: {
        cValidate: "",
        cName: "advanced_limit",
        cOrder: 3,
        cKey: false,
        cType: "decimal",
        cProtect: false,
        cParentForm: "OP_FormOpFieldClerk",
        cDecimal: 2,
        cInputStatus: this.inputStatus,
      },
      PI_reinbursment_limit: {
        cValidate: "",
        cName: "reinbursment_limit",
        cOrder: 4,
        cKey: false,
        cType: "decimal",
        cProtect: false,
        cParentForm: "OP_FormOpFieldClerk",
        cDecimal: 2,
        cInputStatus: this.inputStatus,
      },
      PI_descs: {
        cValidate: "",
        cName: "descs",
        cOrder: 5,
        cKey: false,
        cProtect: false,
        cResize: false,
        cReadonly: false,
        cRows: 1,
        cMaxRows: 4,
        cSize: "md",
        cParentForm: "OP_FormOpFieldClerk",
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
    Onuser_idChange(data) {
      this.$nextTick(() => {
        this.M_OpFieldClerk.user_id = data.id;
        this.M_OpFieldClerk.user_idLabel = data.label;
      });
    },

    M_ClearForm() {
      this.M_OpFieldClerk = {
        op_field_clerk_id: 0,
        ss_portfolio_id: 0,
        coverage: "",
        user_id: "",
        user_idLabel: "",
        advanced_limit: 0,
        reinbursment_limit: 0,
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
        .validateAll("OP_FormOpFieldClerk")
        .then((result) => {
          if (!result) return;
          this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
            (ress) => {
              if (ress.value) {
                this.$validator.errors.clear("OP_FormOpFieldClerk");
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
        line_no: 0,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        coverage: this.M_OpFieldClerk.coverage,
        user_id: this.getDataUser().user_id,
        advanced_limit: this.M_OpFieldClerk.advanced_limit,
        reinbursment_limit: this.M_OpFieldClerk.reinbursment_limit,
        descs: this.M_OpFieldClerk.descs,
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
        line_no: 0,
        ofield_clerk_id: this.M_OpFieldClerk.ofield_clerk_id,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        coverage: this.M_OpFieldClerk.coverage,
        user_id: this.getDataUser().user_id,
        advanced_limit: this.M_OpFieldClerk.advanced_limit,
        reinbursment_limit: this.M_OpFieldClerk.reinbursment_limit,
        descs: this.M_OpFieldClerk.descs,
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
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp,
      };

      this.getJSON(this.getUrlCRUD(), param).then((response) => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];

        this.M_OpFieldClerk = {
          op_field_clerk_id: data.op_field_clerk_id,
          ss_portfolio_id: data.ss_portfolio_id,
          coverage: data.coverage__tb_1,
          user_id: data.user_id__lo_2,
          advanced_limit: data.advanced_limit__tb_3,
          reinbursment_limit: data.reinbursment_limit__tb_4,
          descs: data.descs__tb_5,
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

