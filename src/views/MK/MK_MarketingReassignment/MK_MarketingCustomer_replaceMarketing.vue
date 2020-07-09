<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col sm="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>
                    <h5>
                      <b>Marketing Reassignment</b>
                    </h5>
                  </span>
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
                :data-vv-scope="'MarketingCustomer'"
                :data-vv-value-path="'MarketingCustomer'"
              >
                <b-row>
                  <b-col style="text-align: center">
                    <b-row class="my-1">
                      <b-col>
                        <span>
                          <label>
                            <b>Marketing</b>
                          </label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="my-1" style="text-align: center">
                      <b-col sm="3"></b-col>
                      <b-col sm="6" style="text-align: center">
                        <b-row>
                          <b-col sm="6">
                            <span>
                              <label style="width: 100px;">Current Marketing</label>
                            </span>
                          </b-col>
                          <b-col sm="6">
                            <span>
                              <label style="width: 100px;">Target Marketing</label>
                            </span>
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col sm="5">
                            <ACCDropDown
                              @change="Oncurr_marketingChange"
                              :prop="PI_curr_marketing_id"
                              v-model="M_MarketingReassignment.curr_marketing"
                              :label="M_MarketingReassignment.curr_marketingLabel"
                              ref="ref_action"
                            />
                          </b-col>
                          <b-col sm="2">
                            <label style="width: 100px;">
                              <i class="fa fa-arrow-right fa-2x"></i>
                            </label>
                          </b-col>
                          <b-col sm="5">
                            <ACCDropDown
                              @change="Ontarget_marketingChange"
                              :prop="PI_target_marketing_id"
                              v-model="M_MarketingReassignment.target_marketing"
                              :label="M_MarketingReassignment.target_marketingLabel"
                              ref="ref_action"
                            />
                          </b-col>
                        </b-row>
                      </b-col>
                      <b-col sm="3"></b-col>
                    </b-row>

                    <b-row class="my-1" style="margin-top: 10px;">
                      <b-col sm="3"></b-col>
                      <b-col sm="6">
                        <ABSButton
                          :text="'Replace'"
                          classButton="btn btn--default"
                          classIcon="icon-style-default"
                          @click="doSave"
                          styleButton="height: 40px;width: 100%;"
                        />
                      </b-col>
                      <b-col sm="3"></b-col>
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

      M_MarketingReassignment: {
        curr_marketing: "",
        curr_marketingLabel: "",
        target_marketing: "",
        target_marketingLabel: "",
        row_id: 0,
        lastupdatestamp: 0
      },
      PI_curr_marketing_id: {
        dataLookUp: {
          LookUpCd: "GetMarketing",
          ColumnDB: "marketing_id",
          InitialWhere: "",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: ""
        },
        cValidate: "required",
        cName: "action",
        ckey: false,
        cOrder: 1,
        cProtect: false,
        cParentForm: "MK_FormMkQuotationLtl",
        cStatic: false,
        cOption: [],
        cDisplayColumn: "action_type,descs",
        cInputStatus: this.inputStatus
      },
      PI_target_marketing_id: {
        dataLookUp: {
          LookUpCd: "GetMarketing",
          ColumnDB: "marketing_id",
          InitialWhere: "",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: ""
        },
        cValidate: "required",
        cName: "action",
        ckey: false,
        cOrder: 1,
        cProtect: false,
        cParentForm: "MK_FormMkQuotationLtl",
        cStatic: false,
        cOption: [],
        cDisplayColumn: "action_type,descs",
        cInputStatus: this.inputStatus
      }
    };
  },
  computed: {
    paramFromList() {
      var param = this.$route.params;
      return param;
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
    Oncurr_marketingChange(data) {
      this.$nextTick(() => {
        this.M_MarketingReassignment.curr_marketing = data.id;
        this.M_MarketingReassignment.curr_marketingLabel = data.label;
      });
    },
    Ontarget_marketingChange(data) {
      this.$nextTick(() => {
        this.M_MarketingReassignment.target_marketing = data.id;
        this.M_MarketingReassignment.target_marketingLabel = data.label;
      });
    },
    M_ClearForm() {
      this.M_MarketingReassignment = {
        curr_marketing: "",
        curr_marketingLabel: "",
        target_marketing: "",
        target_marketingLabel: ""
      };
    },

    doSave() {
      this.$validator._base.validateAll("MarketingCustomer").then(result => {
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Replace Marketing ?").then(
          ress => {
            if (ress.value) {
              this.$validator.errors.clear("MarketingCustomer");

              this.M_Update();
            }
          }
        );
      });
    },
    M_Update() {
      var param = {
        option_url: "/MK/MK_MarketingCustomer",
        line_no: 1,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        old_marketing_id: this.M_MarketingReassignment.curr_marketing,
        marketing_id: this.M_MarketingReassignment.target_marketing,
        user_edit: this.getDataUser().user_id
      };

      this.putJSON(this.getUrlCRUD(), param).then(response => {
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          this.doBack();
        });
      });
    },
    GetDataBy() {
      var param = {
        option_url: "/MK/MK_Document_Type",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };

      this.getJSON(this.getUrlCRUD(), param).then(response => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];

        this.M_MarketingReassignment = {
          mk_dokument_type_id: data.mk_dokument_type_id,
          ss_portfolio_id: data.ss_portfolio_id,
          dokument_type: data.dokument_type__tb_1,
          descs: data.descs__tb_2,
          user_input: data.user_input,
          user_edit: data.user_edit,
          time_input: data.time_input,
          time_edit: data.time_edit,
          row_id: data.row_id,
          lastupdatestamp: data.lastupdatestamp
        };
      });
    }
  },
  mounted() {
    this.M_ClearForm();
    // if (this.inputStatus == "edit") {
    //   this.title = "Edit";
    //   this.GetDataBy();
    // } else {
    //   this.title = "Add";
    // }
  }
};
</script>

