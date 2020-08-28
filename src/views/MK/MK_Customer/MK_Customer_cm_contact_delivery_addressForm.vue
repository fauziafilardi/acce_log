<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>{{title}} Add Pick Up / Delivery Address</span>
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
                :data-vv-scope="'MK_FormCmContactDeliveryAddress'"
                :data-vv-value-path="'MK_FormCmContactDeliveryAddress'"
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
                          <label>Title</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_address_name"
                          v-model="M_CmContactDeliveryAddress.address_name"
                          ref="ref_address_name"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Address</label>
                        </span>
                        <ACCTextArea
                          :prop="PI_address"
                          v-model="M_CmContactDeliveryAddress.address"
                          ref="ref_address"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Zone Descs</label>
                        </span>
                        <ACCDropDown
                          @change="Oncm_zone_idChange"
                          :prop="PI_cm_zone_id"
                          v-model="M_CmContactDeliveryAddress.cm_zone_id"
                          :label="M_CmContactDeliveryAddress.zone_descsLabel"
                          ref="ref_cm_zone_id"
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

      M_CmContactDeliveryAddress: {
        cm_contact_delivery_address_id: 0,
        cm_contact_id: 0,
        address_name: "",
        address: "",
        cm_zone_id: 0,
        zone_descsLabel: "",
        user_input: "",
        user_edit: "",
        time_input: "",
        time_edit: "",
        row_id: 0,
        lastupdatestamp: 0,
      },
      PI_address_name: {
        cValidate: "",
        cName: "descs",
        cOrder: 1,
        cKey: false,
        cProtect: false,
        cResize: false,
        cReadonly: false,
        cRows: 1,
        cMaxRows: 2,
        cSize: "md",
        cParentForm: "MK_FormCmContactDeliveryAddress",
        cInputStatus: this.inputStatus,
      },
      PI_address: {
        cValidate: "",
        cName: "address",
        cOrder: 2,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "MK_FormCmContactDeliveryAddress",
        cDecimal: 2,
        cInputStatus: this.inputStatus,
      },
      PI_cm_zone_id: {
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
        cName: "cm_zone_id",
        cOrder: 3,
        cKey: false,
        cStatic: false,
        cProtect: false,
        cParentForm: "MK_FormCmContactDeliveryAddress",
        cOption: [],
        cDisplayColumn: "",
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
    Oncm_zone_idChange(data) {
      this.$nextTick(() => {
        this.M_CmContactDeliveryAddress.cm_zone_id = data.id;
        this.M_CmContactDeliveryAddress.zone_descsLabel = data.label;
      });
    },

    M_ClearForm() {
      this.M_CmContactDeliveryAddress = {
        cm_contact_delivery_address_id: 0,
        cm_contact_id: 0,
        address_name: "",
        address: "",
        cm_zone_id: 0,
        zone_descsLabel: "",
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
        .validateAll("MK_FormCmContactDeliveryAddress")
        .then((result) => {
          if (!result) return;
          this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
            (ress) => {
              if (ress.value) {
                this.$validator.errors.clear("MK_FormCmContactDeliveryAddress");
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
        option_url: "/MK/MK_Customer",
        line_no: 2,
        cm_contact_id: this.paramFromList.cm_contact_id,
        address_name: this.M_CmContactDeliveryAddress.address_name,
        address: this.M_CmContactDeliveryAddress.address,
        cm_zone_id: this.M_CmContactDeliveryAddress.cm_zone_id,
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
        option_url: "/MK/MK_Customer",
        line_no: 2,
        cm_contact_delivery_address_id: this.M_CmContactDeliveryAddress
          .cm_contact_delivery_address_id,
        cm_contact_id: this.paramFromList.cm_contact_id,
        address_name: this.M_CmContactDeliveryAddress.address_name,
        address: this.M_CmContactDeliveryAddress.address,
        cm_zone_id: this.M_CmContactDeliveryAddress.cm_zone_id,
        lastupdatestamp: this.paramFromList.DetailList.lastupdatestamp,
        user_edit: this.getDataUser().user_id,
      };

      this.putJSON(this.getUrlCRUD(), param).then((response) => {
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          if (this.inputStatus == "new") {
            this.doBack();
          } else {
            this.$router.replace({ name: "MK_CustomerView" });
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
        option_url: "/MK/MK_Customer",
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
        option_url: "/MK/MK_Customer",
        line_no: 2,
        id: this.paramFromList.DetailList.row_id,
        lastupdatestamp: this.paramFromList.DetailList.lastupdatestamp,
      };

      this.getJSON(this.getUrlCRUD(), param).then((response) => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];

        this.M_CmContactDeliveryAddress = {
          cm_contact_delivery_address_id: data.cm_contact_delivery_address_id,
          cm_contact_id: data.cm_contact_id,
          address_name: data.address_name__tb_1,
          address: data.address__tb_2,
          cm_zone_id: data.cm_zone_id__lo_3,
          zone_descsLabel: data.zone_descs__lbl__lo_3,
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

