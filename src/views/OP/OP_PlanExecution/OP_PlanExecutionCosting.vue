<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>{{title}} Costing</span>
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
                :data-vv-scope="'OP_FormOpOrderCost'"
                :data-vv-value-path="'OP_FormOpOrderCost'"
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
                            <label>Cost Type</label>
                          </span>
                          <ACCDropDown
                            @change="Onop_cost_type_idChange"
                            :prop="PI_op_cost_type_id"
                            v-model="M_OpOrderCost.op_cost_type_id"
                            :label="M_OpOrderCost.op_cost_type_idLabel"
                            ref="ref_op_cost_type_id"
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
                            v-model="M_OpOrderCost.descs"
                            ref="ref_descs"
                          />
                        </b-col>
                      </b-row>
                      <b-row>
                        <b-col>
                          <span>
                            <label>Value</label>
                          </span>
                          <ACCTextBox
                            :prop="PI_cost_value"
                            v-model="M_OpOrderCost.cost_value"
                            ref="ref_cost_value"
                          />
                        </b-col>
                      </b-row>
                      <b-row style="margin-top: 10px;">
                        <b-col>
                          <ABSButton
                            :text="'Save Order'"
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

      M_OpOrderCost: {
        ss_portfolio_id: 0,
        op_order_id: 0,
        op_order_price_id: 0,
        op_cost_type_id: 0,
        op_cost_type_idLabel: "",
        cost_type: "",
        descs: "",
        cost_value: 0,
        order_cost_status: "",
        user_input: "",
        user_edit: "",
        time_input: "",
        time_edit: "",
        row_id: 0,
        lastupdatestamp: 0,
      },
      PI_op_cost_type_id: {
        dataLookUp: {
          LookUpCd: "GetOpCost",
          ColumnDB: "op_cost_type_id",
          InitialWhere: "",
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
        cParentForm: "OP_FormOpOrderCost",
        cOption: [],
        cDisplayColumn: "cost_type",
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
        cRows: 2,
        cMaxRows: 3,
        cSize: "md",
        cParentForm: "OP_FormOpOrderCost",
        cInputStatus: this.inputStatus,
      },
      PI_cost_value: {
        cValidate: "",
        cName: "cost_value",
        cOrder: 3,
        cKey: false,
        cType: "decimal",
        cProtect: false,
        cParentForm: "OP_FormFmFleetMstrMaintenanceItem",
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
    Onop_cost_type_idChange(data) {
      this.$nextTick(() => {
        this.M_OpOrderCost.op_cost_type_id = data.id;
        this.M_OpOrderCost.op_cost_type_idLabel = data.label;
        this.M_OpOrderCost.op_order_price_id = data.op_pricing_costing_id;
        this.M_OpOrderCost.descs = data.descs;
        this.M_OpOrderCost.cost_value = data.cost_value;
      });
    },
    doBack() {
      this.$router.go(-1);
    },

    M_ClearForm() {
      this.M_OpOrderCost = {
        ss_portfolio_id: 0,
        op_order_id: 0,
        op_order_price_id: 0,
        op_cost_type_id: 0,
        cost_type: "",
        descs: "",
        cost_value: 0,
        order_cost_status: "",
        user_input: "",
        user_edit: "",
        time_input: "",
        time_edit: "",
        row_id: 0,
        lastupdatestamp: 0,
      };
    },

    doSave() {
      this.$validator._base.validateAll("OP_FormOpOrderCost").then((result) => {
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
          (ress) => {
            if (ress.value) {
              this.$validator.errors.clear("OP_FormOpOrderCost");
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
        option_url: "/OP/OP_Order",
        line_no: 1,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        op_order_id: this.paramFromList.row_id,
        op_order_price_id: this.M_OpOrderCost.op_order_price_id,
        op_cost_type_id: this.M_OpOrderCost.op_cost_type_id,
        descs: this.M_OpOrderCost.descs,
        cost_value: this.M_OpOrderCost.cost_value,
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
        option_url: "/OP/OP_Order",
        line_no: 1,
        op_order_cost_id: this.M_OpOrderCost.op_order_cost_id,
        op_order_price_id: this.M_OpOrderCost.op_order_price_id,
        op_cost_type_id: this.M_OpOrderCost.op_cost_type_id,
        descs: this.M_OpOrderCost.descs,
        cost_value: this.M_OpOrderCost.cost_value,
        lastupdatestamp: this.paramFromList.lastupdatestamp,
        user_edit: this.getDataUser().user_id,
      };

      this.putJSON(this.getUrlCRUD(), param).then((response) => {
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          if (this.inputStatus == "new") {
            this.doBack();
          } else {
            this.$router.replace({ name: "OP_Order" });
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
        option_url: "/OP/OP_Order",
        line_no: 1,
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
        option_url: "/OP/OP_Order",
        line_no: 1,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp,
      };

      this.getJSON(this.getUrlCRUD(), param).then((response) => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];

        this.M_OpOrderCost = {
          ss_portfolio_id: data.ss_portfolio_id,
          op_order_id: data.op_order_id,
          op_order_price_id: data.op_order_price_id,
          op_cost_type_id: data.op_cost_type_id,
          cost_type: data.cost_type,
          descs: data.descs,
          cost_value: data.cost_value,
          order_cost_status: data.order_cost_status,
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
    this.PI_op_cost_type_id.dataLookUp.InitialWhere =
      "ss_portfolio_id='" +
      this.getDataUser().portfolio_id +
      "' AND fr_cm_zone_id=" +
      this.paramFromList.fr_cm_zone_id +
      " AND to_cm_zone_id=" +
      this.paramFromList.to_cm_zone_id +
      " AND fm_fleet_type_id=" +
      this.paramFromList.fm_fleet_type_id;
  },
};
</script>

