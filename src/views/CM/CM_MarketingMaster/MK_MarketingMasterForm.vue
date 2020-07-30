<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>{{title}} Marketing Master</span>
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
                :data-vv-scope="'MK_FormMkMarketing'"
                :data-vv-value-path="'MK_FormMkMarketing'"
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
                          <label>Marketing</label>
                        </span>
                        <ACCLookUp
                          @change="Onuser_idChange"
                          :prop="PI_user_id"
                          v-model="M_MkMarketing.user_id"
                          :label="M_MkMarketing.nameLabel"
                          ref="ref_user_id"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="3">
                        <span>
                          <label>Monthly Point</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_monthly_point"
                          v-model="M_MkMarketing.monthly_point"
                          ref="ref_monthly_point"
                        />
                      </b-col>
                      <b-col md="3">
                        <span>
                          <label>Monthly New Prospect</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_monthly_new_prospect"
                          v-model="M_MkMarketing.monthly_new_prospect"
                          ref="ref_monthly_new_prospect"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="3">
                        <span>
                          <label>Minimum Margin</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_minimum_margin"
                          v-model="M_MkMarketing.minimum_margin"
                          ref="ref_minimum_margin"
                        />
                      </b-col>
                      <br />
                      <span style="margin-top:35px;">%</span>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Comssion Type</label>
                        </span>
                        <ACCDropDown
                          @change="Oncomission_typeChange"
                          :prop="PI_comission_type"
                          v-model="M_MkMarketing.comission_type"
                          :label="M_MkMarketing.comission_typeLabel"
                          ref="ref_comission_type"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="3">
                        <span>
                          <label>Above Target</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_above_target"
                          v-model="M_MkMarketing.above_target"
                          ref="ref_above_target"
                        />
                      </b-col>
                      <b-col md="3">
                        <span>
                          <label>Below Target</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_below_target"
                          v-model="M_MkMarketing.below_target"
                          ref="ref_below_target"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Description</label>
                        </span>
                        <ACCTextArea
                          :prop="PI_remarks"
                          v-model="M_MkMarketing.remarks"
                          ref="ref_remarks"
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

      M_MkMarketing: {
        mk_marketing_id: 0,
        ss_portfolio_id: 0,
        user_id: "",
        marketing_id: "",
        name: "",
        nameLabel: "",
        nik_id: "",
        address: "",
        email: "",
        hand_phone: "",
        status_active: true,
        join_date: "",
        monthly_point: 0,
        monthly_new_prospect: 0,
        user_input: "",
        user_edit: "",
        time_input: "",
        time_edit: "",
        minimum_margin: 0,
        remarks: "",
        row_id: 0,
        lastupdatestamp: 0,
      },
      PI_user_id: {
        dataLookUp: {
          LookUpCd: "GetMarketing",
          ColumnDB: "marketing_id",
          InitialWhere:
            "ss_portfolio_id='" + this.getDataUser().portfolio_id + "'",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "",
        },
        cValidate: "",
        cName: "user_id",
        cOrder: 1,
        cKey: false,
        cStatic: false,
        cProtect: false,
        cParentForm: "MK_FormMkMarketing",
        cOption: [],
        cDisplayColumn: "marketing_id,name",
        cInputStatus: this.inputStatus,
      },
      PI_monthly_point: {
        cValidate: "",
        cName: "monthly_point",
        cOrder: 2,
        cKey: false,
        cType: "decimal",
        cProtect: false,
        cParentForm: "MK_FormMkMarketing",
        cDecimal: 2,
        cInputStatus: this.inputStatus,
      },
      PI_monthly_new_prospect: {
        cValidate: "",
        cName: "monthly_new_prospect",
        cOrder: 3,
        cKey: false,
        cType: "decimal",
        cProtect: false,
        cParentForm: "MK_FormMkMarketing",
        cDecimal: 2,
        cInputStatus: this.inputStatus,
      },
      PI_minimum_margin: {
        cValidate: "",
        cName: "minimum_margin",
        cOrder: 4,
        cKey: false,
        cType: "decimal",
        cProtect: false,
        cParentForm: "MK_FormMkMarketing",
        cDecimal: 2,
        cInputStatus: this.inputStatus,
      },
      PI_comission_type: {
        dataLookUp: null,
        cValidate: "",
        cName: "comission_type",
        ckey: false,
        cOrder: 5,
        cProtect: false,
        cParentForm: "MK_FormMkMarketing",
        cStatic: true,
        cOption: [
          { id: "P", label: "Percentage" },
          { id: "V", label: "Value" },
        ],
        cDisplayColumn: "action_type,descs",
        cInputStatus: this.inputStatus,
      },
      PI_above_target: {
        cValidate: "",
        cName: "above_target",
        cOrder: 6,
        cKey: false,
        cType: "decimal",
        cProtect: false,
        cParentForm: "MK_FormMkMarketing",
        cDecimal: 2,
        cInputStatus: this.inputStatus,
      },
      PI_below_target: {
        cValidate: "",
        cName: "below_target",
        cOrder: 7,
        cKey: false,
        cType: "decimal",
        cProtect: false,
        cParentForm: "MK_FormMkMarketing",
        cDecimal: 2,
        cInputStatus: this.inputStatus,
      },
      PI_remarks: {
        cValidate: "",
        cName: "remarks",
        cOrder: 8,
        cKey: false,
        cProtect: false,
        cResize: false,
        cReadonly: false,
        cRows: 1,
        cMaxRows: 3,
        cSize: "md",
        cParentForm: "MK_FormMkMarketing",
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
    Oncomission_typeChange(data) {
      this.$nextTick(() => {
        this.M_MkMarketing.comission_type = data.id;
        this.M_MkMarketing.comission_typeLabel = data.label;
      });
    },
    doBack() {
      this.$router.go(-1);
    },
    Onuser_idChange(data) {
      this.$nextTick(() => {
        this.M_MkMarketing.marketing_id = data.marketing_id;
        this.M_MkMarketing.nameLabel = data.marketing_id + " - " + data.name;
        this.M_MkMarketing.name = data.name;
      });
    },

    M_ClearForm() {
      this.M_MkMarketing = {
        mk_marketing_id: 0,
        ss_portfolio_id: 0,
        user_id: "",
        marketing_id: "",
        name: "",
        nameLabel: "",
        nik_id: "",
        address: "",
        email: "",
        hand_phone: "",
        status_active: true,
        join_date: "",
        monthly_point: 0,
        monthly_new_prospect: 0,
        user_input: "",
        user_edit: "",
        time_input: "",
        time_edit: "",
        minimum_margin: 0,
        remarks: "",
        row_id: 0,
        lastupdatestamp: 0,
      };
    },

    doSave() {
      this.$validator._base.validateAll("MK_FormMkMarketing").then((result) => {
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
          (ress) => {
            if (ress.value) {
              this.$validator.errors.clear("MK_FormMkMarketing");
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
        option_url: "/MK/MK_Marketing",
        line_no: 0,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        user_id: this.getDataUser().user_id,
        marketing_id: this.M_MkMarketing.marketing_id,
        name: this.M_MkMarketing.name,
        nik_id: this.M_MkMarketing.nik_id,
        address: this.M_MkMarketing.address,
        email: this.M_MkMarketing.email,
        hand_phone: this.M_MkMarketing.hand_phone,
        status_active: this.M_MkMarketing.status_active,
        join_date: this.momentDate(new Date()),
        monthly_point: this.M_MkMarketing.monthly_point,
        monthly_new_prospect: this.M_MkMarketing.monthly_new_prospect,
        minimum_margin: this.M_MkMarketing.minimum_margin,
        remarks: this.M_MkMarketing.remarks,
        comission_type: this.M_MkMarketing.comission_type,
        above_target: this.M_MkMarketing.above_target,
        below_target: this.M_MkMarketing.below_target,
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
        option_url: "/MK/MK_Marketing",
        line_no: 0,
        mk_marketing_id: this.M_MkMarketing.mk_marketing_id,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        user_id: this.getDataUser().user_id,
        marketing_id: this.M_MkMarketing.marketing_id,
        name: this.M_MkMarketing.name,
        nik_id: this.M_MkMarketing.nik_id,
        address: this.M_MkMarketing.address,
        email: this.M_MkMarketing.email,
        hand_phone: this.M_MkMarketing.hand_phone,
        status_active: this.M_MkMarketing.status_active,
        join_date: this.M_MkMarketing.join_date,
        monthly_point: this.M_MkMarketing.monthly_point,
        monthly_new_prospect: this.M_MkMarketing.monthly_new_prospect,
        lastupdatestamp: this.paramFromList.lastupdatestamp,
        user_edit: this.getDataUser().user_id,
        comission_type: this.M_MkMarketing.comission_type,
        above_target: this.M_MkMarketing.above_target,
        below_target: this.M_MkMarketing.below_target,
        minimum_margin: this.M_MkMarketing.minimum_margin,
        remarks: this.M_MkMarketing.remarks,
      };

      this.putJSON(this.getUrlCRUD(), param).then((response) => {
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          this.doBack();
        });
      });
    },

    GetDataBy() {
      var param = {
        option_url: "/MK/MK_Marketing",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp,
      };

      this.getJSON(this.getUrlCRUD(), param).then((response) => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];

        this.M_MkMarketing = {
          mk_marketing_id: data.mk_marketing_id,
          ss_portfolio_id: data.ss_portfolio_id,
          user_id: data.user_id__lo_1,
          marketing_id: data.marketing_id,
          nameLabel: data.marketing_id + " - " + data.name__lbl__lo_1,
          name: data.name__lbl__lo_1,
          nik_id: data.nik_id,
          address: data.address,
          email: data.email,
          hand_phone: data.hand_phone,
          status_active:
            data.status_active == null ? false : data.status_active,
          join_date: data.join_date,
          monthly_point: data.monthly_point__tb_2,
          monthly_new_prospect: data.monthly_new_prospect__tb_3,
          user_input: data.user_input,
          user_edit: data.user_edit,
          time_input: data.time_input,
          time_edit: data.time_edit,
          minimum_margin: data.minimum_margin__tb_4,
          remarks: data.remarks__tb_5,
          row_id: data.row_id,
          comission_type: data.comission_type,
          above_target: data.above_target,
          below_target: data.below_target,
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

