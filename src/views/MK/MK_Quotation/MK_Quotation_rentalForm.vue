<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>{{title}} Rental</span>
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
                      <b-col md="6">
                        <span>
                          <label>Vehicle Type</label>
                        </span>
                        <ACCLookUp
                          @change="Onfm_fleet_type_idChange"
                          :prop="PI_fm_fleet_type_id"
                          v-model="M_MkQuotationRental.fm_fleet_type_id"
                          :label="M_MkQuotationRental.fleet_type_descsLabel"
                          ref="ref_fm_fleet_type_id"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col sm="4">
                        <b-row>
                          <b-col sm="2">
                            <span>
                              <label>Include Driver</label>
                            </span>
                          </b-col>
                          <b-col sm="2">
                            <b-form-checkbox
                              v-model="M_MkQuotationRental.include_driver_status"
                              name="check-button"
                              switch
                              size="lg"
                            >
                              <label></label>
                            </b-form-checkbox>
                          </b-col>
                        </b-row>
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Price</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_price_amt"
                          v-model="M_MkQuotationRental.price_amt"
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
      M_MkQuotationRental: {
        mk_quotation_rental_id: 0,
        mk_quotation_id: 0,
        fm_fleet_type_id: 0,
        fleet_type_descsLabel: "",
        include_driver_status: "",
        price_amt: "",
        old_price_amt: "",
        user_input: "",
        user_edit: "",
        time_input: "",
        time_edit: "",
        row_id: 0,
        lastupdatestamp: 0
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
          DisplayLookUp: ""
        },
        cValidate: "",
        cName: "fm_fleet_type_id",
        cOrder: 1,
        cKey: false,
        cStatic: false,
        cProtect: false,
        cParentForm: "MK_FormMkQuotationRental",
        cOption: [],
        cDisplayColumn: "descs,time_edit",
        cInputStatus: this.inputStatus
      },
      PI_include_driver_status: {
        cValidate: "",
        cName: "include_driver_status",
        cOrder: 2,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "MK_FormMkQuotationRental",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_price_amt: {
        cValidate: "",
        cName: "price_amt",
        cOrder: 3,
        cKey: false,
        cType: "decimal",
        cProtect: false,
        cParentForm: "MK_FormMkQuotationRental",
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
    Onfm_fleet_type_idChange(data) {
      this.$nextTick(() => {
        this.M_MkQuotationRental.fm_fleet_type_id = data.row_id;
        this.M_MkQuotationRental.fleet_type_descsLabel = data.descs;
      });
    },

    M_ClearForm() {
      this.M_MkQuotationRental = {
        mk_quotation_rental_id: 0,
        mk_quotation_id: 0,
        fm_fleet_type_id: 0,
        fleet_type_descsLabel: "",
        include_driver_status: "",
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
        .validateAll("MK_FormMkQuotationRental")
        .then(result => {
          if (!result) return;
          this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
            ress => {
              if (ress.value) {
                this.$validator.errors.clear("MK_FormMkQuotationRental");
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
        line_no: 5,
        mk_quotation_id: this.paramFromList.row_id,
        fm_fleet_type_id: this.M_MkQuotationRental.fm_fleet_type_id,
        include_driver_status: this.M_MkQuotationRental.include_driver_status
          ? "Y"
          : "N",
        price_amt: this.M_MkQuotationRental.price_amt,
        old_price_amt: this.M_MkQuotationRental.price_amt,
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
        line_no: 5,
        mk_quotation_rental_id: this.M_MkQuotationRental.mk_quotation_rental_id,
        mk_quotation_id: this.paramFromList.row_id,
        fm_fleet_type_id: this.M_MkQuotationRental.fm_fleet_type_id,
        include_driver_status: this.M_MkQuotationRental.include_driver_status
          ? "Y"
          : "N",
        price_amt: this.M_MkQuotationRental.price_amt,
        old_price_amt: this.M_MkQuotationRental.price_amt,
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
        line_no: 5,
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
        line_no: 5,
        id: this.paramFromList.DetailList.row_id,
        lastupdatestamp: this.paramFromList.DetailList.lastupdatestamp
      };

      this.getJSON(this.getUrlCRUD(), param).then(response => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];

        this.M_MkQuotationRental = {
          mk_quotation_rental_id: data.mk_quotation_rental_id,
          mk_quotation_id: data.mk_quotation_id,
          fm_fleet_type_id: data.fm_fleet_type_id__lo_1,
          fleet_type_descsLabel: data.fleet_type_descs__lbl__lo_1,
          include_driver_status:
            data.include_driver_status__tb_2 == "Y" ? true : false,
          price_amt: data.price_amt__tb_3,
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

