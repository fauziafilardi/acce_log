<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>{{title}} Standard Pricing & Costing FTL</span>
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
                :data-vv-scope="'OP_FormOpPricingCosting'"
                :data-vv-value-path="'OP_FormOpPricingCosting'"
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
                      <b-col md="3">
                        <span>
                          <label>From Zone</label>
                        </span>
                        <ACCDropDown
                          @change="Onfr_cm_zone_idChange"
                          :prop="PI_fr_cm_zone_id"
                          v-model="M_OpPricingCosting.fr_cm_zone_id"
                          :label="M_OpPricingCosting.fr_zone_cdLabel"
                          ref="ref_fr_cm_zone_id"
                        />
                      </b-col>
                      <b-col md="3">
                        <span>
                          <label>To Zone</label>
                        </span>
                        <ACCDropDown
                          @change="Onto_cm_zone_idChange"
                          :prop="PI_to_cm_zone_id"
                          v-model="M_OpPricingCosting.to_cm_zone_id"
                          :label="M_OpPricingCosting.to_zone_cdLabel"
                          ref="ref_to_cm_zone_id"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Vehicle Type</label>
                        </span>
                        <ACCDropDown
                          @change="Onfm_fleet_type_idChange"
                          :prop="PI_fm_fleet_type_id"
                          v-model="M_OpPricingCosting.fm_fleet_type_id"
                          :label="M_OpPricingCosting.fleet_cdLabel"
                          ref="ref_fm_fleet_type_id"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Selling Price</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_selling_price"
                          v-model="M_OpPricingCosting.selling_price"
                          ref="ref_selling_price"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="3">
                        <span>
                          <label>Valid From</label>
                        </span>
                        <ACCDateTime
                          :prop="PI_start_date"
                          v-model="M_OpPricingCosting.start_date"
                          ref="ref_start_date"
                        />
                      </b-col>
                      <b-col md="3">
                        <span>
                          <label>Valid Until</label>
                        </span>
                        <ACCDateTime
                          :prop="PI_expired_date"
                          v-model="M_OpPricingCosting.expired_date"
                          ref="ref_expired_date"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Remarks</label>
                        </span>
                        <ACCTextArea
                          :prop="PI_remarks"
                          v-model="M_OpPricingCosting.remarks"
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

      M_OpPricingCosting: {
        op_pricing_costing_id: 0,
        ss_portfolio_id: 0,
        category: "",
        fr_cm_zone_id: 0,
        fr_zone_cdLabel: "",
        to_cm_zone_id: 0,
        to_zone_cdLabel: "",
        fm_fleet_type_id: 0,
        fleet_cdLabel: "",
        cm_commodity_id: 0,
        commodity_cdLabel: "",
        selling_price: 0,
        cbm_selling_price: 0,
        kgs_selling_price: 0,
        total_cost_value: 0,
        start_date: new Date(),
        expired_date: new Date(),
        remarks: "",
        user_input: "",
        user_edit: "",
        time_input: "",
        time_edit: "",
        row_id: 0,
        lastupdatestamp: 0,
      },
      PI_fr_cm_zone_id: {
        dataLookUp: {
          LookUpCd: "GetCostingZone",
          ColumnDB: "cm_zone_id",
          InitialWhere: "",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "",
        },
        cValidate: "",
        cName: "fr_cm_zone_id",
        cOrder: 1,
        cKey: false,
        cStatic: false,
        cProtect: false,
        cParentForm: "OP_FormOpPricingCosting",
        cOption: [],
        cDisplayColumn: "cm_zone_id,zone_code",
        cInputStatus: this.inputStatus,
      },
      PI_to_cm_zone_id: {
        dataLookUp: {
          LookUpCd: "GetCostingZone",
          ColumnDB: "cm_zone_id",
          InitialWhere: "",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "",
        },
        cValidate: "",
        cName: "to_cm_zone_id",
        cOrder: 2,
        cKey: false,
        cStatic: false,
        cProtect: false,
        cParentForm: "OP_FormOpPricingCosting",
        cOption: [],
        cDisplayColumn: "cm_zone_id,zone_code",
        cInputStatus: this.inputStatus,
      },
      PI_fm_fleet_type_id: {
        dataLookUp: {
          LookUpCd: "GetFleetType",
          ColumnDB: "fleet_type_id",
          InitialWhere: "",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "descs,time_edit",
        },
        cValidate: "",
        cName: "fm_fleet_type_id",
        cOrder: 3,
        cKey: false,
        cStatic: false,
        cProtect: false,
        cParentForm: "OP_FormOpPricingCosting",
        cOption: [],
        cDisplayColumn: "descs,time_edit",
        cInputStatus: this.inputStatus,
      },

      PI_selling_price: {
        cValidate: "",
        cName: "selling_price",
        cOrder: 4,
        cKey: false,
        cType: "decimal",
        cProtect: false,
        cParentForm: "OP_FormOpPricingCosting",
        cDecimal: 2,
        cInputStatus: this.inputStatus,
      },
      PI_start_date: {
        cValidate: "",
        cName: "start_date",
        cOrder: 5,
        cKey: false,
        cProtect: false,
        cWithTime: false,
        cFormat: "dd/MM/yyyy",
        cParentForm: "OP_FormOpPricingCosting",
      },
      PI_expired_date: {
        cValidate: "required",
        cName: "expired_date",
        cOrder: 6,
        cKey: false,
        cProtect: false,
        cWithTime: false,
        cFormat: "dd/MM/yyyy",
        cParentForm: "OP_FormOpPricingCosting",
      },
      PI_remarks: {
        cValidate: "",
        cName: "remarks",
        cOrder: 7,
        cKey: false,
        cProtect: false,
        cResize: false,
        cReadonly: false,
        cRows: 3,
        cMaxRows: 3,
        cSize: "md",
        cParentForm: "OP_FormOpPricingCosting",
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
    Onfr_cm_zone_idChange(data) {
      this.$nextTick(() => {
        this.M_OpPricingCosting.fr_cm_zone_id = data.id;
        this.M_OpPricingCosting.fr_zone_cdLabel = data.label;
      });
    },
    Onto_cm_zone_idChange(data) {
      this.$nextTick(() => {
        this.M_OpPricingCosting.to_cm_zone_id = data.id;
        this.M_OpPricingCosting.to_zone_cdLabel = data.label;
      });
    },
    Onfm_fleet_type_idChange(data) {
      this.$nextTick(() => {
        this.M_OpPricingCosting.fm_fleet_type_id = data.id;
        this.M_OpPricingCosting.fleet_cdLabel = data.descs;
      });
    },

    M_ClearForm() {
      this.M_OpPricingCosting = {
        op_pricing_costing_id: 0,
        ss_portfolio_id: 0,
        category: "",
        fr_cm_zone_id: 0,
        fr_zone_cdLabel: "",
        to_cm_zone_id: 0,
        to_zone_cdLabel: "",
        fm_fleet_type_id: 0,
        fleet_cdLabel: "",
        cm_commodity_id: 0,
        commodity_cdLabel: "",
        selling_price: 0,
        cbm_selling_price: 0,
        kgs_selling_price: 0,
        total_cost_value: 0,
        start_date: new Date(),
        expired_date: new Date(),
        remarks: "",
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
        .validateAll("OP_FormOpPricingCosting")
        .then((result) => {
          if (!result) return;
          this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
            (ress) => {
              if (ress.value) {
                this.$validator.errors.clear("OP_FormOpPricingCosting");
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
        line_no: 0,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        category: "F",
        fr_cm_zone_id: this.M_OpPricingCosting.fr_cm_zone_id,
        to_cm_zone_id: this.M_OpPricingCosting.to_cm_zone_id,
        fm_fleet_type_id: this.M_OpPricingCosting.fm_fleet_type_id,
        cm_commodity_id: "NULL",
        selling_price: this.M_OpPricingCosting.selling_price,
        cbm_selling_price: 0,
        kgs_selling_price: 0,
        total_cost_value: this.M_OpPricingCosting.total_cost_value,
        total_cost_cbm: 0,
        total_cost_kgs: 0,
        start_date: this.M_OpPricingCosting.start_date,
        expired_date: this.M_OpPricingCosting.expired_date,
        remarks: this.M_OpPricingCosting.remarks,
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
        line_no: 0,
        op_pricing_costing_id: this.M_OpPricingCosting.op_pricing_costing_id,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        category: this.M_OpPricingCosting.category,
        fr_cm_zone_id: this.M_OpPricingCosting.fr_cm_zone_id,
        to_cm_zone_id: this.M_OpPricingCosting.to_cm_zone_id,
        fm_fleet_type_id: this.M_OpPricingCosting.fm_fleet_type_id,
        cm_commodity_id: "NULL",
        selling_price: this.M_OpPricingCosting.selling_price,
        cbm_selling_price: 0,
        kgs_selling_price: 0,
        total_cost_value: this.M_OpPricingCosting.total_cost_value,
        total_cost_cbm: 0,
        total_cost_kgs: 0,
        start_date: this.M_OpPricingCosting.start_date,
        expired_date: this.M_OpPricingCosting.expired_date,
        remarks: this.M_OpPricingCosting.remarks,
        lastupdatestamp: this.paramFromList.lastupdatestamp,
        user_edit: this.getDataUser().user_id,
      };

      this.putJSON(this.getUrlCRUD(), param).then((response) => {
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          if (this.inputStatus == "new") {
            this.doBack();
          } else {
            this.$router.replace({ name: "OP_PricingCosting" });
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
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp,
      };

      this.getJSON(this.getUrlCRUD(), param).then((response) => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];

        this.M_OpPricingCosting = {
          op_pricing_costing_id: data.op_pricing_costing_id,
          ss_portfolio_id: data.ss_portfolio_id,
          category: data.category,
          fr_cm_zone_id: data.fr_cm_zone_id__lo_1,
          fr_zone_cdLabel: data.fr_zone_cd__lbl__lo_1,
          to_cm_zone_id: data.to_cm_zone_id__lo_2,
          to_zone_cdLabel: data.to_zone_cd__lbl__lo_2,
          fm_fleet_type_id: data.fm_fleet_type_id__lo_3,
          fleet_cdLabel: data.fleet_cd__lbl__lo_3,
          cm_commodity_id: data.cm_commodity_id__lo_4,
          commodity_cdLabel: data.commodity_cd__lbl__lo_4,
          selling_price: data.selling_price__tb_5,
          cbm_selling_price: data.cbm_selling_price__tb_6,
          kgs_selling_price: data.kgs_selling_price__tb_7,
          total_cost_value: data.total_cost_value,
          start_date: data.start_date,
          expired_date: data.expired_date,
          remarks: data.remarks__tb_8,
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

