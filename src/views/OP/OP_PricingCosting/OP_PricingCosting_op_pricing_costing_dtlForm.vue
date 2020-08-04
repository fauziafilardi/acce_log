<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>{{title}} Standard Pricing & Costing</span>
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
                :data-vv-scope="'OP_FormOpPricingCostingDtl'"
                :data-vv-value-path="'OP_FormOpPricingCostingDtl'"
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
                          <label>Cost Type</label>
                        </span>
                        <ACCDropDown
                          @change="Onop_cost_type_idChange"
                          :prop="PI_op_cost_type_id"
                          v-model="M_OpPricingCostingDtl.op_cost_type_id"
                          :label="M_OpPricingCostingDtl.cost_typeLabel"
                          ref="ref_op_cost_type_id"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Value</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_cost_value"
                          v-model="M_OpPricingCostingDtl.cost_value"
                          ref="ref_cost_value"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <b-row>
                          <b-col sm="2">
                            <span>
                              <label>On Order</label>
                            </span>
                          </b-col>
                          <b-col sm="4">
                            <b-form-checkbox
                              v-model="M_OpPricingCostingDtl.status_on_order"
                              name="check-button"
                              switch
                              size="lg"
                            ></b-form-checkbox>
                          </b-col>
                          <b-col sm="2">
                            <span>
                              <label>Return Empty</label>
                            </span>
                          </b-col>
                          <b-col sm="4">
                            <b-form-checkbox
                              v-model="M_OpPricingCostingDtl.status_return_empty"
                              name="check-button"
                              switch
                              size="lg"
                            ></b-form-checkbox>
                          </b-col>
                        </b-row>
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Description</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_descs"
                          v-model="M_OpPricingCostingDtl.descs"
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

      M_OpPricingCostingDtl: {
        op_pricing_costing_dtl_id: 0,
        ss_portfolio_id: 0,
        op_pricing_costing_id: 0,
        op_cost_type_id: 0,
        cost_typeLabel: "",
        cost_value: 0,
        descs: "",
        user_input: "",
        user_edit: "",
        time_input: "",
        time_edit: "",
        status_on_order: false,
        status_return_empty: false,
        row_id: 0,
        lastupdatestamp: 0,
      },
      PI_op_cost_type_id: {
        dataLookUp: {
          LookUpCd: "GetCostType",
          ColumnDB: "op_cost_type_id",
          InitialWhere:
            "ss_portfolio_id='" + this.getDataUser().portfolio_id + "'",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "",
        },
        cValidate: "",
        cName: "op_cost_type_id",
        cOrder: 1,
        cKey: false,
        cStatic: false,
        cProtect: false,
        cParentForm: "OP_FormOpPricingCostingDtl",
        cOption: [],
        cDisplayColumn: "cost_type",
        cInputStatus: this.inputStatus,
      },
      PI_cost_value: {
        cValidate: "",
        cName: "cost_value",
        cOrder: 2,
        cKey: false,
        cType: "decimal",
        cProtect: false,
        cParentForm: "OP_FormOpPricingCostingDtl",
        cDecimal: 2,
        cInputStatus: this.inputStatus,
      },
      PI_descs: {
        cValidate: "",
        cName: "descs",
        cOrder: 3,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "OP_FormOpPricingCostingDtl",
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
    Onop_cost_type_idChange(data) {
      this.$nextTick(() => {
        this.M_OpPricingCostingDtl.op_cost_type_id = data.id;
        this.M_OpPricingCostingDtl.cost_typeLabel = data.descs;
      });
    },

    M_ClearForm() {
      this.M_OpPricingCostingDtl = {
        op_pricing_costing_dtl_id: 0,
        ss_portfolio_id: 0,
        op_pricing_costing_id: 0,
        op_cost_type_id: 0,
        cost_typeLabel: "",
        cost_value: 0,
        descs: "",
        user_input: "",
        user_edit: "",
        time_input: "",
        time_edit: "",
        status_on_order: false,
        status_return_empty: false,
        row_id: 0,
        lastupdatestamp: 0,
      };
    },

    doSave() {
      this.$validator._base
        .validateAll("OP_FormOpPricingCostingDtl")
        .then((result) => {
          if (!result) return;
          this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
            (ress) => {
              if (ress.value) {
                this.$validator.errors.clear("OP_FormOpPricingCostingDtl");
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
        option_url: "/OP/OP_PricingCosting",
        line_no: 1,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        op_pricing_costing_id: this.paramFromList.row_id,
        op_cost_type_id: this.M_OpPricingCostingDtl.op_cost_type_id,
        cost_value: this.M_OpPricingCostingDtl.cost_value,
        descs: this.M_OpPricingCostingDtl.descs,
        status_on_order: this.M_OpPricingCostingDtl.status_on_order ? "Y" : "N",
        status_return_empty: this.M_OpPricingCostingDtl.status_return_empty
          ? "Y"
          : "N",
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
        option_url: "/OP/OP_PricingCosting",
        line_no: 1,
        op_pricing_costing_dtl_id: this.paramFromList.DetailList.row_id,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        op_pricing_costing_id: this.M_OpPricingCostingDtl.op_pricing_costing_id,
        op_cost_type_id: this.M_OpPricingCostingDtl.op_cost_type_id,
        cost_value: this.M_OpPricingCostingDtl.cost_value,
        descs: this.M_OpPricingCostingDtl.descs,
        status_on_order: this.M_OpPricingCostingDtl.status_on_order ? "Y" : "N",
        status_return_empty: this.M_OpPricingCostingDtl.status_return_empty
          ? "Y"
          : "N",
        lastupdatestamp: this.paramFromList.DetailList.lastupdatestamp,
        user_edit: this.getDataUser().user_id,
      };

      this.putJSON(this.getUrlCRUD(), param).then((response) => {
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          this.doBack();
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
        option_url: "/OP/OP_PricingCosting",
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
        option_url: "/OP/OP_PricingCosting",
        line_no: 1,
        id: this.paramFromList.DetailList.row_id,
        lastupdatestamp: this.paramFromList.DetailList.lastupdatestamp,
      };

      this.getJSON(this.getUrlCRUD(), param).then((response) => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];

        this.M_OpPricingCostingDtl = {
          op_pricing_costing_dtl_id: data.op_pricing_costing_dtl_id,
          ss_portfolio_id: data.ss_portfolio_id,
          op_pricing_costing_id: data.op_pricing_costing_id,
          op_cost_type_id: data.op_cost_type_id__lo_1,
          cost_typeLabel: data.cost_type__lbl__lo_1,
          cost_value: data.cost_value__tb_2,
          descs: data.descs__tb_3,
          user_input: data.user_input,
          user_edit: data.user_edit,
          time_input: data.time_input,
          time_edit: data.time_edit,
          row_id: data.row_id,
          lastupdatestamp: data.lastupdatestamp,
          status_on_order: data.status_on_order == "Y" ? true : false,
          status_return_empty: data.status_return_empty == "Y" ? true : false,
        };
      });
    },
  },
  mounted() {
    this.M_ClearForm();
    if (this.inputStatus == "edit") {
      this.title = "Edit";
      this.GetDataBy();
      this.PI_op_cost_type_id.cProtect = true;
    } else {
      this.title = "Add";
    }
  },
};
</script>

