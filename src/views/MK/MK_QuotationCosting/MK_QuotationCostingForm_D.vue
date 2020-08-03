<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>{{Stype == "M" ? "Maintenance Item" : "Maintenance"}}</span>
                </b-col>
                <b-col style="text-align: right;">
                  <span>
                    <ABSButton
                      :text="'Back'"
                      classButton="button button--back"
                      classIcon="icon-style-1"
                      @click="doBack"
                    />
                  </span>
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <b-form
                :data-vv-scope="'MK_FormMKQuotationCosting'"
                :data-vv-value-path="'MK_FormMKQuotationCosting'"
              >
                <b-row>
                  <b-col md="12">
                    <!-- <b-row class="row-bordered"> -->
                    <b-col md="6" offset="3">
                      <b-row>
                        <b-col v-if="inputStatus == 'new'">
                          <span>
                            <label>Cost Type</label>
                          </span>
                          <ACCDropDown
                            @change="Oncost_typeChange"
                            :prop="PI_cost_type"
                            v-model="M_MKQuotationCosting.cost_type"
                            :label="M_MKQuotationCosting.cost_typeLabel"
                            ref="ref_cost_type"
                          />
                        </b-col>
                        <b-col v-else class="row-view">
                          <span>
                            <label>Cost Type</label>
                          </span>
                          <br />
                          <span>
                            <label>{{M_MKQuotationCosting.cost_typeLabel}}</label>
                          </span>
                        </b-col>
                      </b-row>
                      <b-row>
                        <b-col>
                          <span>
                            <label>Value</label>
                          </span>
                          <ACCTextBox
                            :prop="PI_value"
                            v-model="M_MKQuotationCosting.value"
                            ref="ref_value"
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
                            v-model="M_MKQuotationCosting.descs"
                            ref="ref_descs"
                          />
                        </b-col>
                      </b-row>
                      <b-row style="margin-top: 10px;">
                        <b-col style="text-align: center">
                          <ABSButton
                            :text="'Save'"
                            classButton="btn btn--default"
                            classIcon="icon-style-default"
                            @click="doSave"
                            styleButton="height: 40px;width: 70%;"
                          />
                        </b-col>
                      </b-row>
                    </b-col>
                    <!-- </b-row> -->
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
      Stype: "M",
      M_MKQuotationCosting: {
        cost_type: "",
        cost_typeLabel: "",
        value: "",
        descs: "",
      },
      PI_cost_type: {
        dataLookUp: {
          LookUpCd: "GetCostType",
          ColumnDB: "op_cost_type_id",
          InitialWhere: "",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "cost_type,cost_type",
        },
        cValidate: "",
        cName: "cost_type",
        cOrder: 1,
        cKey: false,
        cStatic: false,
        cProtect: false,
        cParentForm: "MK_FormMKQuotationCosting",
        cOption: [],
        cDisplayColumn: "cost_type,cost_type",
        cInputStatus: this.inputStatus,
      },
      PI_value: {
        cValidate: "",
        cName: "value",
        cOrder: 2,
        cKey: false,
        cType: "decimal",
        cProtect: false,
        cParentForm: "MK_FormMKQuotationCosting",
        cDecimal: 2,
        cInputStatus: this.inputStatus,
      },
      PI_descs: {
        cValidate: "",
        cName: "descs",
        cOrder: 4,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "MK_FormMKQuotationCosting",
        cDecimal: 2,
        cInputStatus: this.inputStatus,
      },
      parentParam: {},
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
    Oncost_typeChange(data) {
      this.M_MKQuotationCosting.cost_type = data.id;
      this.M_MKQuotationCosting.cost_typeLabel = data.label;
      this.M_MKQuotationCosting.descs = data.description;
    },
    M_ClearForm() {
      this.M_MKQuotationCosting = {
        cost_type: "",
        cost_typeLabel: "",
        value: "",
        descs: "",
      };
    },
    doSave() {
      this.$validator._base
        .validateAll("MK_FormMKQuotationCosting")
        .then((result) => {
          if (!result) return;
          this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
            (ress) => {
              if (ress.value) {
                this.$validator.errors.clear("MK_FormMKQuotationCosting");
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
        option_url: "/MK/MK_QuotationCosting",
        line_no: 1,
        mk_quotation_id: this.paramFromList.ForCosting.mk_quotation_id,
        mk_quotation_price_id: this.paramFromList.ForCosting
          .mk_quotation_price_id,
        op_cost_type_id: this.M_MKQuotationCosting.cost_type,
        cost_value: this.M_MKQuotationCosting.value,
        descs: this.M_MKQuotationCosting.descs,
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
        option_url: "/MK/MK_QuotationCosting",
        line_no: 1,
        mk_quotation_cost_id: this.paramFromList.ForCosting.row_id,
        mk_quotation_id: this.paramFromList.ForCosting.mk_quotation_id,
        mk_quotation_price_id: this.paramFromList.ForCosting
          .mk_quotation_price_id,
        op_cost_type_id: this.M_MKQuotationCosting.cost_type,
        cost_value: this.M_MKQuotationCosting.value,
        descs: this.M_MKQuotationCosting.descs,
        lastupdatestamp: this.paramFromList.ForCosting.lastupdatestamp,
        user_edit: this.getDataUser().user_id,
      };

      this.putJSON(this.getUrlCRUD(), param).then((response) => {
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          var param = this.paramFromList;
          param.ForCosting = null;
          this.$store.commit("setParamPage", param);
          this.doBack();
        });
      });
    },
    GetDataBy() {
      var param = {
        option_url: "/MK/MK_QuotationCosting",
        line_no: 1,
        id: this.paramFromList.ForCosting.row_id,
        lastupdatestamp: this.paramFromList.ForCosting.lastupdatestamp,
      };

      this.getJSON(this.getUrlCRUD(), param).then((response) => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];
        this.M_MKQuotationCosting = {
          cost_type: data.op_cost_type_id__lo_1,
          cost_typeLabel: data.cost_type__lbl_lo_1,
          value: data.cost_value__tb_2,
          descs: data.descs__tb_3,
        };
      });
    },
    // CheckType() {
    //     if (this.paramFromList.ForMaintenance == null || this.paramFromList.ForMaintenance == undefined) {
    //         this.Stype = "M"
    //     } else {
    //         if (Object.keys(this.paramFromList.ForMaintenance).length < 1) {
    //             this.Stype = "M"
    //         } else {
    //             this.Stype = "D"
    //         }
    //     }
    // }
  },
  mounted() {
    this.M_ClearForm();
    // this.CheckType();
    if (this.inputStatus == "edit") {
      this.GetDataBy();
    }
  },
};
</script>

