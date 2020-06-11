<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Customer Status - Add</span>
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
                :data-vv-scope="'CM_MarketingCustomerStatus'"
                :data-vv-value-path="'CM_MarketingCustomerStatus'"
              >
                <b-row>
                  <b-col md="2">
                    <div>
                      <img id="logo" :src="require('@/assets/avatar.png')" alt width="100%" />
                    </div>
                  </b-col>
                  <b-col md="10">
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Status Code</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_customer_status_cd"
                          v-model="M_MarketingCustomerStatus.customer_status_cd"
                          ref="ref_customer_status_cd"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Description</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_descs"
                          v-model="M_MarketingCustomerStatus.descs"
                          ref="ref_descs"
                        />
                      </b-col>
                    </b-row>

                    <!-- <b-row>
                      <b-col md="9">
                        <span>
                          <label>Notes</label>
                        </span>
                        <ACCTextArea
                          :prop="PI_notes"
                          v-model="M_MarketingCustomerStatus.notes"
                          ref="ref_notes"
                        />
                      </b-col>
                    </b-row>-->
                    <b-row class="row">
                      <b-col md="3">
                        <span>
                          <label></label>
                        </span>
                      </b-col>
                      <b-col md="1">
                        <label>Qty</label>
                      </b-col>
                      <b-col md="1">
                        <label>Month</label>
                      </b-col>
                    </b-row>
                    <b-row class="row">
                      <b-col md="3">
                        <span>
                          <label>Call</label>
                        </span>
                      </b-col>
                      <b-col md="1">
                        <ACCTextBox
                          :prop="PI_call_qty"
                          v-model="M_MarketingCustomerStatus.call_qty"
                          ref="ref_call_qty"
                        />
                      </b-col>
                      <b-col md="1">
                        <ACCTextBox
                          :prop="PI_call_month"
                          v-model="M_MarketingCustomerStatus.call_month"
                          ref="ref_call_month"
                        />
                      </b-col>
                    </b-row>
                    <b-row class="row">
                      <b-col md="3">
                        <span>
                          <label>Visit</label>
                        </span>
                      </b-col>
                      <b-col md="1">
                        <ACCTextBox
                          :prop="PI_visit_qty"
                          v-model="M_MarketingCustomerStatus.visit_qty"
                          ref="ref_visit_qty"
                        />
                      </b-col>
                      <b-col md="1">
                        <ACCTextBox
                          :prop="PI_visit_month"
                          v-model="M_MarketingCustomerStatus.visit_month"
                          ref="ref_visit_month"
                        />
                      </b-col>
                    </b-row>
                    <b-row class="row">
                      <b-col md="3">
                        <span>
                          <label>Entertainment</label>
                        </span>
                      </b-col>
                      <b-col md="1">
                        <ACCTextBox
                          :prop="PI_entertain_qty"
                          v-model="M_MarketingCustomerStatus.entertain_qty"
                          ref="ref_entertain_qty"
                        />
                      </b-col>
                      <b-col md="1">
                        <ACCTextBox
                          :prop="PI_entertain_month"
                          v-model="M_MarketingCustomerStatus.entertain_month"
                          ref="ref_entertain_month"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Select Color</label>
                        </span>
                        <swatches-picker v-model="M_MarketingCustomerStatus.customer_status_colour" />
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
      PI_customer_status_cd: {
        cValidate: "",
        cName: "customer_status_cd",
        cOrder: 1,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "CM_MarketingCustomerStatus",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_descs: {
        cValidate: "",
        cName: "descs",
        cOrder: 2,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "CM_MarketingCustomerStatus",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_call_qty: {
        cValidate: "",
        cName: "call_qty",
        cOrder: 3,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_call_month: {
        cValidate: "",
        cName: "call_month",
        cOrder: 4,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_visit_qty: {
        cValidate: "",
        cName: "visit_qty",
        cOrder: 5,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_visit_month: {
        cValidate: "",
        cName: "visit_month",
        cOrder: 6,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_entertain_qty: {
        cValidate: "",
        cName: "entertain_qty",
        cOrder: 7,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_entertain_month: {
        cValidate: "",
        cName: "entertain_month",
        cOrder: 8,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },

      // PI_customer_status_colour: {
      //   cValidate: "",
      //   cName: "address",
      //   cOrder: 3,
      //   cKey: false,
      //   cType: "text",
      //   cProtect: false,
      //   cParentForm: "CM_MarketingCustomerStatus",
      //   cDecimal: 2,
      //   cInputStatus: this.inputStatus
      // },

      M_MarketingCustomerStatus: {
        descs: "",
        customer_status_cd: "",
        customer_status_colour: { hex: '#1A237E' },
        call_qty: "",
        call_month: "",
        visit_qty: 0,
        visit_month: 0,
        entertain_qty: 0,
        entertain_month: 0
      },
      ModalIndex: null
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
      this.M_MarketingCustomerStatus = {
        descs: "",
        customer_status_cd: "",
        customer_status_colour: { hex: '#1A237E' },
        call_qty: "",
        call_month: "",
        visit_qty: 0,
        visit_month: 0,
        entertain_qty: 0,
        entertain_month: 0
      };
    },

    doSave() {
      console.log(this.M_MarketingCustomerStatus);
      this.$validator._base
        .validateAll("CM_MarketingCustomerStatus")
        .then(result => {
          if (!result) return;
          this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
            ress => {
              if (ress.value) {
                this.$validator.errors.clear("CM_MarketingCustomerStatus");
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
        option_url: "/CM/CM_CustomerStatus",
        line_no: 0,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        descs: this.M_MarketingCustomerStatus.descs,
        customer_status_cd: this.M_MarketingCustomerStatus.customer_status_cd,
        customer_status_colour:
          this.M_MarketingCustomerStatus.customer_status_colour.hex == null
            ? "black"
            : this.M_MarketingCustomerStatus.customer_status_colour.hex,
        call_qty: this.M_MarketingCustomerStatus.call_qty,
        call_month: this.M_MarketingCustomerStatus.call_month,
        visit_qty: this.M_MarketingCustomerStatus.visit_qty,
        visit_month: this.M_MarketingCustomerStatus.visit_month,
        entertain_qty: this.M_MarketingCustomerStatus.entertain_qty,
        entertain_month: this.M_MarketingCustomerStatus.entertain_month,
        user_input: this.getDataUser().user_id
      };

      this.postJSON(this.getUrlCRUD(), param).then(response => {
        // console.log(response)
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          this.doBack();
        });
      });
    },
    GetDataBy() {
      var param = {
        option_url: "/CM/CM_CustomerStatus",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };

      this.getJSON(this.getUrlCRUD(), param).then(response => {
        // response from API
        if (response == null) return;
        var data = response.Data[0];
        this.M_MarketingCustomerStatus = {
          descs: data.descs,
          customer_status_cd: data.customer_status_cd,
          customer_status_colour: { hex: data.customer_status_colour },
          call_qty: data.call_qty,
          call_month: data.call_month,
          visit_month: data.visit_month,
          visit_qty: data.visit_qty,
          entertain_month: data.entertain_month,
          entertain_qty: data.entertain_qty
        };
        // this.$nextTick(() => {
      });
    },
    M_Update() {
      var param = {
        option_url: "/CM/CM_CustomerStatus",
        line_no: 0,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        descs: this.M_MarketingCustomerStatus.descs,
        customer_status_cd: this.M_MarketingCustomerStatus.customer_status_cd,
        customer_status_colour:
          this.M_MarketingCustomerStatus.customer_status_colour.hex == null
            ? "black"
            : this.M_MarketingCustomerStatus.customer_status_colour.hex,
        call_qty: this.M_MarketingCustomerStatus.call_qty,
        call_month: this.M_MarketingCustomerStatus.call_month,
        visit_qty: this.M_MarketingCustomerStatus.visit_qty,
        visit_month: this.M_MarketingCustomerStatus.visit_month,
        entertain_qty: this.M_MarketingCustomerStatus.entertain_qty,
        entertain_month: this.M_MarketingCustomerStatus.entertain_month,
        lastupdatestamp: this.paramFromList.lastupdatestamp,
        user_edit: this.getDataUser().user_id
      };

      this.putJSON(this.getUrlCRUD(), param).then(response => {
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

    if (this.inputStatus == "edit") {
      this.GetDataBy();
    }
  }
};
</script>

<style>
</style>