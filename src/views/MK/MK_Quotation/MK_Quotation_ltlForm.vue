<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>{{title}} LTL</span>
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
              <b-form :data-vv-scope="'{FormName}'" :data-vv-value-path="'{FormName}'">
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
                          <label>From</label>
                        </span>
                        <ACCLookUp
                          @change="Onfr_cm_contact_delivery_address_idChange"
                          :prop="PI_fr_cm_contact_delivery_address_id"
                          v-model="M_MkQuotationLtl.fr_cm_contact_delivery_address_id"
                          :label="M_MkQuotationLtl.from_addressLabel"
                          ref="ref_fr_cm_contact_delivery_address_id"
                        />
                      </b-col>
                      <b-col md="3">
                        <span>
                          <label>To</label>
                        </span>
                        <ACCLookUp
                          @change="Onto_cm_contact_delivery_address_idChange"
                          :prop="PI_to_cm_contact_delivery_address_id"
                          v-model="M_MkQuotationLtl.to_cm_contact_delivery_address_id"
                          :label="M_MkQuotationLtl.to_addressLabel"
                          ref="ref_to_cm_contact_delivery_address_id"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Commodity</label>
                        </span>
                        <!-- <ACCLookUp
                          @change="Oncm_commodity_idChange"
                          :prop="PI_cm_commodity_id"
                          v-model="M_MkQuotationLtl.cm_commodity_id"
                          :label="M_MkQuotationLtl.commodity_descsLabel"
                          ref="ref_cm_commodity_id"
                        />-->
                        <ACCDropDown
                          @change="Oncm_commodity_idChange"
                          :prop="PI_cm_commodity_id"
                          v-model="M_MkQuotationLtl.cm_commodity_id"
                          :label="M_MkQuotationLtl.commodity_descsLabel"
                          ref="ref_action"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="3">
                        <span>
                          <label>Selling Price Kgs</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_kgs_price_amt"
                          v-model="M_MkQuotationLtl.kgs_price_amt"
                          ref="ref_kgs_price_amt"
                        />
                      </b-col>
                      <b-col md="3">
                        <span>
                          <label>Selling Price Cbm</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_cbm_price_amt"
                          v-model="M_MkQuotationLtl.cbm_price_amt"
                          ref="ref_cbm_price_amt"
                        />
                      </b-col>
                    </b-row>

                    <b-row style="margin-top: 10px;">
                      <b-col :md="mdSave">
                        <ABSButton
                          :text="'Save'"
                          classButton="btn btn--default"
                          classIcon="icon-style-default"
                          @click="doSave"
                          styleButton="height: 40px;width: 100%;"
                        />
                      </b-col>
                      <b-col md="3" v-if="disableBtnDelete==true">
                        <ABSButton
                          :text="'Delete'"
                          classButton="btn btn--default"
                          classIcon="icon-style-default"
                          @click="doDelete"
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
      mdSave: 6,
      disableBtnDelete: false,
      M_MkQuotationLtl: {
        mk_quotation_ltl_id: 0,
        mk_quotation_id: 0,
        cm_contact_id: 0,
        fr_cm_contact_delivery_address_id: 0,
        from_addressLabel: "",
        to_cm_contact_delivery_address_id: 0,
        to_addressLabel: "",
        cm_commodity_id: null,
        commodity_descsLabel: "",
        kgs_price_amt: "",
        old_kgs_price_amt: "",
        cbm_price_amt: "",
        old_cbm_price_amt: "",
        user_input: "",
        user_edit: "",
        time_input: "",
        time_edit: "",
        row_id: 0,
        lastupdatestamp: 0
      },
      PI_fr_cm_contact_delivery_address_id: {
        dataLookUp: {
          LookUpCd: "GetContactDeliveryAddress",
          ColumnDB: "cm_contact_delivery_address_id",
          InitialWhere: "",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: ""
        },
        cValidate: "",
        cName: "fr_cm_contact_delivery_address_id",
        cOrder: 1,
        cKey: false,
        cStatic: false,
        cProtect: false,
        cParentForm: "MK_FormMkQuotationLtl",
        cOption: [],
        cDisplayColumn: "title,address",
        cInputStatus: this.inputStatus
      },
      PI_to_cm_contact_delivery_address_id: {
        dataLookUp: {
          LookUpCd: "GetContactDeliveryAddress",
          ColumnDB: "cm_contact_delivery_address_id",
          InitialWhere: "",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: ""
        },
        cValidate: "",
        cName: "to_cm_contact_delivery_address_id",
        cOrder: 2,
        cKey: false,
        cStatic: false,
        cProtect: false,
        cParentForm: "MK_FormMkQuotationLtl",
        cOption: [],
        cDisplayColumn: "title,address",
        cInputStatus: this.inputStatus
      },
      // PI_cm_commodity_id: {
      //   dataLookUp: {
      //     LookUpCd: "GetCommodity",
      //     ColumnDB: "cm_commodity_id",
      //     InitialWhere: "",
      //     ParamWhere: "",
      //     OrderBy: "",
      //     ParamView: "",
      //     SourceField: "",
      //     DisplayLookUp: ""
      //   },
      //   cValidate: "",
      //   cName: "cm_commodity_id",
      //   cOrder: 3,
      //   cKey: false,
      //   cStatic: false,
      //   cProtect: false,
      //   cParentForm: "MK_FormMkQuotationLtl",
      //   cOption: [],
      //   cDisplayColumn: "",
      //   cInputStatus: this.inputStatus
      // },
      PI_cm_commodity_id: {
        dataLookUp: {
          LookUpCd: "GetCommodity",
          ColumnDB: "cm_commodity_id",
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
        cOption: [
          // { id: "C", label: "Call" },
          // { id: "V", label: "Visit" },
          // { id: "E", label: "Entertaintment" }
        ],
        cDisplayColumn: "action_type,descs",
        cInputStatus: this.inputStatus
      },
      PI_kgs_price_amt: {
        cValidate: "",
        cName: "kgs_price_amt",
        cOrder: 4,
        cKey: false,
        cType: "decimal",
        cProtect: false,
        cParentForm: "MK_FormMkQuotationLtl",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_cbm_price_amt: {
        cValidate: "",
        cName: "cbm_price_amt",
        cOrder: 5,
        cKey: false,
        cType: "decimal",
        cProtect: false,
        cParentForm: "MK_FormMkQuotationLtl",
        cDecimal: 2,
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
      // this.$router.go(-1);
      this.$router.push({ name: "MK_Quotation" });
    },

    Onfr_cm_contact_delivery_address_idChange(data) {
      this.$nextTick(() => {
        this.M_MkQuotationLtl.fr_cm_contact_delivery_address_id = data.row_id;
        this.M_MkQuotationLtl.from_addressLabel = data.title;
      });
    },
    Onto_cm_contact_delivery_address_idChange(data) {
      this.$nextTick(() => {
        this.M_MkQuotationLtl.to_cm_contact_delivery_address_id = data.row_id;
        this.M_MkQuotationLtl.to_addressLabel = data.title;
      });
    },
    Oncm_commodity_idChange(data) {
      this.$nextTick(() => {
        this.M_MkQuotationLtl.cm_commodity_id = data.id;
        this.M_MkQuotationLtl.commodity_descsLabel = data.label;
      });
    },

    M_ClearForm() {
      this.M_MkQuotationLtl = {
        mk_quotation_ltl_id: 0,
        mk_quotation_id: 0,
        cm_contact_id: 0,
        fr_cm_contact_delivery_address_id: 0,
        from_addressLabel: "",
        to_cm_contact_delivery_address_id: 0,
        to_addressLabel: "",
        cm_commodity_id: null,
        commodity_descsLabel: "",
        kgs_price_amt: "",
        old_kgs_price_amt: "",
        cbm_price_amt: "",
        old_cbm_price_amt: "",
        user_input: "",
        user_edit: "",
        time_input: "",
        time_edit: "",
        row_id: 0,
        lastupdatestamp: 0
      };
    },

    doSave() {
      this.$validator._base
        .validateAll("MK_FormMkQuotationLtl")
        .then(result => {
          if (!result) return;
          this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
            ress => {
              if (ress.value) {
                this.$validator.errors.clear("MK_FormMkQuotationLtl");
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
        option_url: "/MK/MK_Quotation",
        line_no: 4,
        mk_quotation_id: this.paramFromList.row_id,
        fr_cm_contact_delivery_address_id: this.M_MkQuotationLtl
          .fr_cm_contact_delivery_address_id,
        to_cm_contact_delivery_address_id: this.M_MkQuotationLtl
          .to_cm_contact_delivery_address_id,
        cm_commodity_id: this.M_MkQuotationLtl.cm_commodity_id,
        kgs_price_amt: this.M_MkQuotationLtl.kgs_price_amt,
        cbm_price_amt: this.M_MkQuotationLtl.cbm_price_amt,
        user_input: this.getDataUser().user_id
      };

      this.postJSON(this.getUrlCRUD(), param).then(response => {
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          this.doBack();
        });
      });
    },
    M_Update() {
      var param = {
        option_url: "/MK/MK_Quotation",
        line_no: 4,
        mk_quotation_ltl_id: this.M_MkQuotationLtl.mk_quotation_ltl_id,
        mk_quotation_id: this.paramFromList.row_id,
        fr_cm_contact_delivery_address_id: this.M_MkQuotationLtl
          .fr_cm_contact_delivery_address_id,
        to_cm_contact_delivery_address_id: this.M_MkQuotationLtl
          .to_cm_contact_delivery_address_id,
        cm_commodity_id: this.M_MkQuotationLtl.cm_commodity_id,
        kgs_price_amt: this.M_MkQuotationLtl.kgs_price_amt,
        cbm_price_amt: this.M_MkQuotationLtl.cbm_price_amt,
        lastupdatestamp: this.paramFromList.DetailList.lastupdatestamp,
        user_edit: this.getDataUser().user_id
      };

      this.putJSON(this.getUrlCRUD(), param).then(response => {
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          this.doBack();
        });
      });
    },
    doDelete() {
      this.alertConfirmation("Are You Sure Want To Delete This Data ?").then(
        ress => {
          if (ress.value) {
            this.M_Delete();
          }
        }
      );
    },
    M_Delete() {
      var param = {
        option_url: "/MK/MK_Quotation",
        line_no: 4,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.DetailList.lastupdatestamp
      };
      this.deleteJSON(this.getUrlCRUD(), param).then(response => {
        if (response == null) return;
        this.alertSuccess("Data Has Been Deleted").then(() => {
          this.doBack();
        });
      });
    },
    GetDataBy() {
      var param = {
        option_url: "/MK/MK_Quotation",
        line_no: 4,
        id: this.paramFromList.DetailList.row_id,
        lastupdatestamp: this.paramFromList.DetailList.lastupdatestamp
      };

      this.getJSON(this.getUrlCRUD(), param).then(response => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];

        this.M_MkQuotationLtl = {
          mk_quotation_ltl_id: data.mk_quotation_ltl_id,
          mk_quotation_id: data.mk_quotation_id,
          cm_contact_id: data.cm_contact_id,
          fr_cm_contact_delivery_address_id:
            data.fr_cm_contact_delivery_address_id__lo_1,
          from_addressLabel: data.from_address__lbl__lo_1,
          to_cm_contact_delivery_address_id:
            data.to_cm_contact_delivery_address_id__lo_2,
          to_addressLabel: data.to_address__lbl__lo_2,
          cm_commodity_id: data.cm_commodity_id__lo_3,
          commodity_descsLabel: data.commodity_descs__lbl__lo_3,
          kgs_price_amt: data.kgs_price_amt__tb_4,
          old_kgs_price_amt: data.old_kgs_price_amt,
          cbm_price_amt: data.cbm_price_amt__tb_5,
          old_cbm_price_amt: data.old_cbm_price_amt,
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
    this.PI_fr_cm_contact_delivery_address_id.dataLookUp.InitialWhere =
      "cm_contact_id=" + this.paramFromList.cm_contact_id;
    this.PI_to_cm_contact_delivery_address_id.dataLookUp.InitialWhere =
      "cm_contact_id=" + this.paramFromList.cm_contact_id;
    if (this.inputStatus == "edit") {
      this.title = "Edit";
      this.mdSave = 3;
      this.disableBtnDelete = true;
      this.GetDataBy();
    } else {
      this.title = "Add";
    }
  }
};
</script>

