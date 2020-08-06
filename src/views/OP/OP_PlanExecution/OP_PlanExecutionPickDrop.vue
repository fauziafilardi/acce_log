<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>{{title}}</span>
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
                :data-vv-scope="'OP_FormOpOrderPickDrop'"
                :data-vv-value-path="'OP_FormOpOrderPickDrop'"
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
                          <label>{{titleField}}</label>
                        </span>
                        <ACCDropDown
                          @change="Oncm_contact_delivery_address_idChange"
                          :prop="PI_cm_contact_delivery_address_id"
                          v-model="M_OpOrderPickDrop.cm_contact_delivery_address_id"
                          :label="M_OpOrderPickDrop.address_nameLabel"
                          ref="ref_cm_contact_delivery_address_id"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Description</label>
                        </span>
                        <ACCTextArea
                          :prop="PI_descs"
                          v-model="M_OpOrderPickDrop.descs"
                          ref="ref_descs"
                        />
                      </b-col>
                    </b-row>

                    <b-row style="margin-top: 10px;">
                      <b-col md="6">
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
      titleField: "",

      M_OpOrderPickDrop: {
        op_order_pick_drop_id: 0,
        op_order_id: 0,
        pick_drop_category: "",
        cm_contact_delivery_address_id: 0,
        address_nameLabel: "",
        descs: "",
        user_input: "",
        user_edit: "",
        time_input: "",
        time_edit: "",
        row_id: 0,
        lastupdatestamp: 0,
      },
      PI_cm_contact_delivery_address_id: {
        dataLookUp: {
          LookUpCd: "GetContactDeliveryAddress",
          ColumnDB: "cm_contact_delivery_address_id",
          InitialWhere: "",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "",
        },
        cValidate: "",
        cName: "cm_contact_delivery_address_id",
        cOrder: 1,
        cKey: false,
        cStatic: false,
        cProtect: false,
        cParentForm: "OP_FormOpOrderPickDrop",
        cOption: [],
        cDisplayColumn: "",
        cInputStatus: this.inputStatus,
      },
      PI_descs: {
        cValidate: "",
        cName: "descs",
        cOrder: 2,
        cKey: false,
        cProtect: false,
        cResize: false,
        cReadonly: false,
        cRows: 3,
        cMaxRows: 3,
        cSize: "md",
        cParentForm: "OP_FormOpOrderPickDrop",
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
    Oncm_contact_delivery_address_idChange(data) {
      this.$nextTick(() => {
        this.M_OpOrderPickDrop.cm_contact_delivery_address_id = data.id;
        this.M_OpOrderPickDrop.address_nameLabel = data.descs;
      });
    },

    M_ClearForm() {
      this.M_OpOrderPickDrop = {
        op_order_pick_drop_id: 0,
        op_order_id: 0,
        pick_drop_category: "",
        cm_contact_delivery_address_id: 0,
        address_nameLabel: "",
        descs: "",
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
        .validateAll("OP_FormOpOrderPickDrop")
        .then((result) => {
          if (!result) return;
          this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
            (ress) => {
              if (ress.value) {
                this.$validator.errors.clear("OP_FormOpOrderPickDrop");
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
        line_no: 2,
        op_order_id: this.paramFromList.row_id,
        pick_drop_category: this.paramFromList.isPick ? "P" : "D",
        cm_contact_delivery_address_id: this.M_OpOrderPickDrop
          .cm_contact_delivery_address_id,
        descs: this.M_OpOrderPickDrop.descs,
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
        line_no: 2,
        oorder_pick_droid: this.M_OpOrderPickDrop.oorder_pick_droid,
        op_order_id: this.paramFromList.row_id,
        pick_drop_category: this.paramFromList.isPick ? "P" : "D",
        cm_contact_delivery_address_id: this.M_OpOrderPickDrop
          .cm_contact_delivery_address_id,
        descs: this.M_OpOrderPickDrop.descs,
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
        option_url: "/OP/OP_Order",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp,
      };

      this.getJSON(this.getUrlCRUD(), param).then((response) => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];

        this.M_OpOrderPickDrop = {
          op_order_pick_drop_id: data.op_order_pick_drop_id,
          op_order_id: data.op_order_id,
          pick_drop_category: data.pick_drop_category,
          cm_contact_delivery_address_id:
            data.cm_contact_delivery_address_id__lo_1,
          address_nameLabel: data.address_name__lbl__lo_1,
          descs: data.descs__tb_2,
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

    if (this.paramFromList.isPick) {
      this.title += " Extra Pick";
      this.titleField = " Extra Pick";
    } else {
      this.title += " Extra Drop";
      this.titleField = " Extra Drop";
    }
    this.PI_cm_contact_delivery_address_id.dataLookUp.InitialWhere =
      "cm_contact_id=" + this.paramFromList.cm_contact_id;
  },
};
</script>

