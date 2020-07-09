<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>{{title}} Project</span>
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
                          v-model="M_MkQuotationProject.fr_cm_contact_delivery_address_id"
                          :label="M_MkQuotationProject.from_addressLabel"
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
                          v-model="M_MkQuotationProject.to_cm_contact_delivery_address_id"
                          :label="M_MkQuotationProject.to_addressLabel"
                          ref="ref_to_cm_contact_delivery_address_id"
                        />
                      </b-col>
                    </b-row>

                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Change By</label>
                        </span>
                        <!-- <ACCTextBox
                          :prop="PI_charge_by"
                          v-model="M_MkQuotationProject.charge_by"
                          ref="ref_charge_by"
                        />-->
                        <ACCDropDown
                          @change="Oncharge_byChange"
                          :prop="PI_charge_by"
                          v-model="M_MkQuotationProject.charge_by"
                          :label="M_MkQuotationProject.charge_byLabel"
                          ref="ref_charge_by"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Price</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_price_amt"
                          v-model="M_MkQuotationProject.price_amt"
                          ref="ref_price_amt"
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
      M_MkQuotationProject: {
        mk_quotation_project_id: 0,
        mk_quotation_id: 0,
        cm_contact_id: 0,
        fr_cm_contact_delivery_address_id: null,
        from_addressLabel: "",
        to_cm_contact_delivery_address_id: null,
        to_addressLabel: "",
        charge_by: "",
        charge_byLabel: "",
        price_amt: "",
        old_price_amt: "",
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
        cParentForm: "MK_FormMkQuotationProject",
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
        cParentForm: "MK_FormMkQuotationProject",
        cOption: [],
        cDisplayColumn: "title,address",
        cInputStatus: this.inputStatus
      },

      PI_charge_by: {
        dataLookUp: null,
        cValidate: "required",
        cName: "charge_by",
        ckey: false,
        cOrder: 3,
        cProtect: false,
        cParentForm: "MK_FormMkQuotationProject",
        cStatic: true,
        cOption: [
          { id: "CBM", label: "CBM" },
          { id: "KGS", label: "KGS" }
          // { id: "E", label: "Entertaintment" }
        ],
        cDisplayColumn: "action_type,descs",
        cInputStatus: this.inputStatus
      },
      PI_price_amt: {
        cValidate: "",
        cName: "price_amt",
        cOrder: 4,
        cKey: false,
        cType: "decimal",
        cProtect: false,
        cParentForm: "MK_FormMkQuotationProject",
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
        this.M_MkQuotationProject.fr_cm_contact_delivery_address_id =
          data.row_id;
        this.M_MkQuotationProject.from_addressLabel = data.title;
      });
    },
    Onto_cm_contact_delivery_address_idChange(data) {
      this.$nextTick(() => {
        this.M_MkQuotationProject.to_cm_contact_delivery_address_id =
          data.row_id;
        this.M_MkQuotationProject.to_addressLabel = data.title;
      });
    },
    Oncharge_byChange(data) {
      this.$nextTick(() => {
        this.M_MkQuotationProject.charge_by = data.id;
        this.M_MkQuotationProject.charge_byLabel = data.label;
      });
    },

    M_ClearForm() {
      this.M_MkQuotationProject = {
        mk_quotation_project_id: 0,
        mk_quotation_id: 0,
        cm_contact_id: 0,
        fr_cm_contact_delivery_address_id: null,
        from_addressLabel: "",
        to_cm_contact_delivery_address_id: null,
        to_addressLabel: "",
        charge_by: "",
        charge_byLabel: "",
        price_amt: "",
        old_price_amt: "",
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
        .validateAll("MK_FormMkQuotationProject")
        .then(result => {
          if (!result) return;
          this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
            ress => {
              if (ress.value) {
                this.$validator.errors.clear("MK_FormMkQuotationProject");
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
        line_no: 6,
        mk_quotation_id: this.paramFromList.row_id,
        fr_cm_contact_delivery_address_id: this.M_MkQuotationProject
          .fr_cm_contact_delivery_address_id,
        to_cm_contact_delivery_address_id: this.M_MkQuotationProject
          .to_cm_contact_delivery_address_id,
        charge_by: this.M_MkQuotationProject.charge_by,
        price_amt: this.M_MkQuotationProject.price_amt,
        old_price_amt: this.M_MkQuotationProject.price_amt,
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
        line_no: 6,
        mk_quotation_project_id: this.M_MkQuotationProject
          .mk_quotation_project_id,
        mk_quotation_id: this.paramFromList.row_id,
        fr_cm_contact_delivery_address_id: this.M_MkQuotationProject
          .fr_cm_contact_delivery_address_id,
        to_cm_contact_delivery_address_id: this.M_MkQuotationProject
          .to_cm_contact_delivery_address_id,
        charge_by: this.M_MkQuotationProject.charge_by,
        price_amt: this.M_MkQuotationProject.price_amt,
        old_price_amt: this.M_MkQuotationProject.price_amt,
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
        line_no: 6,
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
        line_no: 6,
        id: this.paramFromList.DetailList.row_id,
        lastupdatestamp: this.paramFromList.DetailList.lastupdatestamp
      };

      this.getJSON(this.getUrlCRUD(), param).then(response => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];

        this.M_MkQuotationProject = {
          mk_quotation_project_id: data.mk_quotation_project_id,
          mk_quotation_id: data.mk_quotation_id,
          cm_contact_id: data.cm_contact_id,
          fr_cm_contact_delivery_address_id:
            data.fr_cm_contact_delivery_address_id__lo_1,
          from_addressLabel: data.from_address__lbl__lo_1,
          to_cm_contact_delivery_address_id:
            data.to_cm_contact_delivery_address_id__lo_2,
          to_addressLabel: data.to_address__lbl__lo_2,
          charge_by: data.charge_by__tb_3,
          price_amt: data.price_amt__tb_4,
          old_price_amt: data.old_price_amt,
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

