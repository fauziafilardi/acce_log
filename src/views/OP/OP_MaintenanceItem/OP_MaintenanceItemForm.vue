<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Maintenance Item</span>
                </b-col>
                <b-col style="text-align: right;">
                  <span>
                    <ABSButton
                      :text="'Back'"
                      classButton="button button--back"
                      classIcon="icon-style-1"
                      @click="doBack"
                    />
                  </span>
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <b-form
                :data-vv-scope="'OP_FormFmFleetMstrMaintenanceItem'"
                :data-vv-value-path="'OP_FormFmFleetMstrMaintenanceItem'"
              >
                <b-row>
                    <b-col md="2">
                        <div>
                        <div style="text-align: center;">
                            <font-awesome-icon
                                class="icon-style-default"
                                icon="wrench"
                                size="10x"
                            />
                        </div>
                        </div>
                    </b-col>
                    <b-col md="10" class="row-bordered">
                        <!-- <b-row class="row-bordered"> -->
                            <b-col md="6" offset="3">
                                <b-row>
                                    <b-col>
                                        <span>
                                            <label>Item Name</label>
                                        </span>
                                        <ACCTextBox
                                            :prop = "PI_item"
                                            v-model = "M_FmFleetMstr.item"
                                            ref = "ref_item"
                                        />
                                    </b-col>
                                </b-row>
                                <b-row>
                                    <b-col>
                                        <span>
                                            <label>Qty</label>
                                        </span>
                                        <ACCTextBox
                                            :prop = "PI_qty"
                                            v-model = "M_FmFleetMstr.qty"
                                            ref = "ref_qty"
                                        />
                                    </b-col>
                                </b-row>
                                <b-row style="margin-top: 10px;">
                                    <b-col style="text-align: center">
                                        <ABSButton
                                            :text="'Save Item'"
                                            classButton="btn btn--default"
                                            classIcon="icon-style-default"
                                            @click="doSave"
                                            styleButton="height: 40px;width: 70%;"
                                        />
                                    </b-col>
                                </b-row>
                            </b-col>
                        <!-- </b-row> -->
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
            Stype: "M",
            M_FmFleetMstr: {
                item: '',
                qty: ''
            },
            PI_item: {
                cValidate: '',
                cName: "item",
                cOrder: 1,
                cKey: false,
                cType: "text",
                cProtect: false,
                cParentForm: "OP_FormFmFleetMstrMaintenanceItem",
                cDecimal: 2,
                cInputStatus: this.inputStatus
            },
            PI_qty: {
                cValidate: '',
                cName: "qty",
                cOrder: 2,
                cKey: false,
                cType: "numeric",
                cProtect: false,
                cParentForm: "OP_FormFmFleetMstrMaintenanceItem",
                cDecimal: 2,
                cInputStatus: this.inputStatus
            },
            parentParam: {}
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
        }
    },
    methods: {
        doBack() {
            this.$router.go(-1);
        },
        M_ClearForm() {
            this.M_FmFleetMstr = {
                item: '',
                qty: ''
            }
        },
        doSave() {
            this.$validator._base.validateAll("OP_FormFmFleetMstrMaintenanceItem").then(result => {
                if (!result) return;
                this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
                ress => {
                    if (ress.value) {
                        this.$validator.errors.clear("OP_FormFmFleetMstrMaintenanceItem");
                        if (this.inputStatus == "edit") {
                            this.M_Update();
                        } else {
                            this.M_Save();
                        }
                    }
                });
            });
        },
        M_Save() {
            var param = {
                option_url: "/OP/OP_FleetMaster",
                line_no: 3,
                ss_portfolio_id: this.getDataUser().portfolio_id,
                fm_fleet_mstr_id: this.paramFromList.ForMaintenanceItem.fm_fleet_mstr_id,
                fm_fleet_maintenance_type_id: this.paramFromList.ForMaintenanceItem.fm_fleet_maintenance_type_id,
                item_name: this.M_FmFleetMstr.item,
                item_qty: this.M_FmFleetMstr.qty,
                user_input: this.getDataUser().user_id
            }

            this.postJSON(this.getUrlCRUD(), param).then(response => {
                if (response == null) return;
                this.alertSuccess(response.Message).then(() => {
                    this.doBack();
                });
            });
        },
        M_Update() {
            var param = {
                option_url: "/OP/OP_FleetMaster",
                line_no: 3,
                fm_fleet_maintenance_item_id: this.paramFromList.ForMaintenanceItem.row_id,
                ss_portfolio_id: this.getDataUser().portfolio_id,
                fm_fleet_mstr_id: this.paramFromList.ForMaintenanceItem.fm_fleet_mstr_id,
                fm_fleet_maintenance_type_id: this.paramFromList.ForMaintenanceItem.fm_fleet_maintenance_type_id,
                item_name: this.M_FmFleetMstr.item,
                item_qty: this.M_FmFleetMstr.qty,
                lastupdatestamp:this.paramFromList.ForMaintenanceItem.lastupdatestamp,
                user_edit: this.getDataUser().user_id
            }

            this.putJSON(this.getUrlCRUD(), param).then(response => {
                if (response == null) return;
                this.alertSuccess(response.Message).then(() => {
                    var param = this.paramFromList
                    param.ForMaintenanceItem = null
                    this.$store.commit("setParamPage", param);
                    this.doBack();
                });
            })
        },
        GetDataBy() {
            var param = {
                option_url: "/OP/OP_FleetMaster",
                line_no: 3,
                id: this.paramFromList.ForMaintenanceItem.row_id,
                lastupdatestamp: this.paramFromList.ForMaintenanceItem.lastupdatestamp
            }

            this.getJSON(this.getUrlCRUD(), param).then(response => {
                // response from API
                if (response == null) return;

                var data = response.Data[0];
                this.M_FmFleetMstr = {
                    item: data.item_name__tb_1,
                    qty: data.item_qty__tb_2
                }
            });
        },
    },
    mounted() {
        this.M_ClearForm();
        if (this.inputStatus == "edit") {
            this.GetDataBy();
        }
    }
};
</script>

