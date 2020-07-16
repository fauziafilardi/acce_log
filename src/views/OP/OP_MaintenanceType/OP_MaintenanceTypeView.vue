<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>View Maintenance Type</span>
                </b-col>
                <b-col style="text-align: right;">
                  <span>
                    <ABSButton
                      :text="'Add Item'"
                      classButton="button button--back"
                      classIcon="icon-style-1"
                      @click="doAddItem"
                    />
                  </span>
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
              <b-form :data-vv-scope="'parent'" :data-vv-value-path="'parent'">
                <b-row>
                  <b-col md="2">
                    <div>
                      <font-awesome-icon
                        class="icon-style-default"
                        icon="wrench"
                        size="10x"
                      />
                    </div>
                  </b-col>
                  <b-col md="10">
                    <b-row>
                      <b-col>
                        <b-row>
                          <b-col class="col-right">
                            <span>
                              <ABSButton
                                :text = "'Delete'"
                                classButton = "btn btn--default"
                                classIcon = "icon-style-1"
                                @click = "doDelete"
                              />
                            </span>

                            <span>
                              <ABSButton
                                :text = "'Edit'"
                                classButton = "btn btn--default"
                                classIcon = "icon-style-1"
                                @click = "doEdit"
                              />
                            </span>
                          </b-col>
                        </b-row>
                      </b-col>
                    </b-row>
                    <br>
                    <b-row class="row-bordered">
                      <b-col>
                        <b-row>
                          <b-col md="6" class="row-view">
                            <span>
                              <label>Maintenance Type</label>
                            </span>
                            <br/>
                            <span>
                              <label>{{M_MmMaintenanceType.maintenance_type}}</label>
                            </span>
                          </b-col>
                          <b-col md="6" class="row-view">
                            <span>
                              <label>Usage</label>
                            </span>
                            <br/>
                            <span>
                              <label>{{M_MmMaintenanceType.usage_distance}}</label>
                            </span>
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col md="6" class="row-view">
                            <span>
                              <label>Description</label>
                            </span>
                            <br/>
                            <span>
                              <label>{{M_MmMaintenanceType.descs}}</label>
                            </span>
                          </b-col>
                          <b-col md="6" class="row-view">
                            <span>
                              <label>Usage Tolerance</label>
                            </span>
                            <br/>
                            <span>
                              <label>{{M_MmMaintenanceType.usage_tolerance_distance}}</label>
                            </span>
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col offset="6" md="6" class="row-view">
                            <span>
                              <label>Time</label>
                            </span>
                            <br/>
                            <span>
                              <label>{{M_MmMaintenanceType.time_days}}</label>
                            </span>
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col offset="6" md="6" class="row-view">
                            <span>
                              <label>Time Tolerance</label>
                            </span>
                            <br/>
                            <span>
                              <label>{{M_MmMaintenanceType.time_days_tolerance}}</label>
                            </span>
                          </b-col>
                        </b-row>
                      </b-col>
                    </b-row>
                    <b-row class="row-bordered">
                      <b-col>
                        <div class="table--list" :id="'appointmentList'">
                          <b-table
                            :responsive="true"
                            :striped="false"
                            :bordered="true"
                            :outlined="false"
                            :small="false"
                            :hover="false"
                            :dark="false"
                            :fixed="false"
                            :foot-clone="false"
                            :fields="Items.Tb_Header"
                            :items="Items.Tb_Data"
                            class="table-sm table-style-3"
                            @row-clicked="doItemClick"
                          >
                            <template v-slot:cell(no)="data">
                              {{data.index + 1}}
                            </template>
                            <template v-slot:cell(row_id)="data">
                              <span>
                                <font-awesome-icon
                                  class="icon-style-default"
                                  icon="trash"
                                  size="lg"
                                  style="cursor: pointer;"
                                  @click.stop="Delete_Item(data.item)"
                                />
                              </span>
                            </template>
                          </b-table>
                        </div>
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
      Stype: "M",
      M_MmMaintenanceType :{
        mm_maintenance_type_id : 0,
        ss_portfolio_id : 0,
        maintenance_type : '',
        descs : '',
        usage_distance : 0,
        usage_tolerance_distance : 0,
        time_days : 0,
        time_days_tolerance : 0,
        user_input : '',
        user_edit : '',
        time_input : '',
        time_edit : '',
        row_id : 0,
        lastupdatestamp : 0
      },
      Items: {
        Tb_Header: [
          {
            key: "no",
            label: "No",
            thClass: "HeaderACCList2 th-cus-center",
            tdClass: "ContentACCList2 notranslate th-cus-center"
          },
          {
            key: "item_name",
            label: "Item",
            thClass: "HeaderACCList2 M th-cus-center",
            tdClass: "ContentACCList2 notranslate"
          },
          {
            key: "item_qty",
            label: "Qty",
            thClass: "HeaderACCList2 L th-cus-center",
            tdClass: "ContentACCList2 notranslate th-cus-center"
          },
          {
            key: "row_id",
            label: " ",
            thClass: "HeaderACCList2 th-cus-center",
            tdClass: "ContentACCList2 notranslate th-cus-center"
          }
        ],
        Tb_Data: []
      }
    };
  },
  computed: {
    paramFromList() {
      var param = this.$store.getters.getParamPage;
      if (param == null || param == undefined) {
        this.doBack();
      } else {
        if (Object.keys(param).length < 1) {
          this.doBack();
        } else {
          return param;
        }
      }
    }
  },
  methods: {
    doBack() {
      this.$router.go(-1);
    },
    doAddItem() {
      var param = this.paramFromList
      param.isEdit = false;
      param.ForMaintenanceItem = {
        fm_fleet_mstr_id: param.ForMaintenance.fm_fleet_mstr_id,
        fm_fleet_maintenance_type_id: param.ForMaintenance.row_id
      }
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "OP_MaintenanceItemForm" });
    },
    doItemClick(record, index) {
      var param = this.paramFromList;
      record.fm_fleet_mstr_id = param.row_id;
      param.ForMaintenanceItem = record;
      param.isEdit = true;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "OP_MaintenanceItemForm" });
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
    doEdit() {
      var param = this.paramFromList;
      param.isView = false;
      param.isEdit = true;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "OP_MaintenanceTypeForm", params: param });
    },
    Delete_Item(i) {
      this.alertConfirmation("Are You Sure Want To Delete This Data ?").then(
        ress => {
          if (ress.value) {
            this.M_DeleteI(i);
          }
        }
      );
    },
    M_DeleteI(i) {
      var param = {
        option_url: "/OP/OP_MaintenanceItem",
        line_no: 0,
        id: i.row_id,
        lastupdatestamp: i.lastupdatestamp
      };
      this.deleteJSON(this.getUrlCRUD(), param).then(response => {
        if (response == null) return;
        this.alertSuccess("Data Has Been Deleted").then(() => {
          this.getItems();
        });
      });
    },
    M_Delete() {
      var param = {};
      if (this.Stype == "M") {
        param = {
          option_url: "/OP/OP_MaintenanceType",
          line_no: 0,
          id: this.paramFromList.row_id,
          lastupdatestamp: this.paramFromList.lastupdatestamp
        };
      }
      else {
        param = {
          option_url: "/OP/OP_FleetMaster",
          line_no: 2,
          id: this.paramFromList.ForMaintenance.row_id,
          lastupdatestamp: this.paramFromList.ForMaintenance.lastupdatestamp
        };
      }
      this.deleteJSON(this.getUrlCRUD(), param).then(response => {
        if (response == null) return;
        this.alertSuccess("Data Has Been Deleted").then(() => {
          this.doBack();
        });
      });
    },
    GetDataBy() {
      var param = {};
      if (this.Stype == "M") {
          param = {
              option_url: "/OP/OP_MaintenanceType",
              line_no: 0,
              id: this.paramFromList.row_id,
              lastupdatestamp: this.paramFromList.lastupdatestamp
          }
      }
      else {
          param = {
              option_url: "/OP/OP_FleetMaster",
              line_no: 2,
              id: this.paramFromList.ForMaintenance.row_id,
              lastupdatestamp: this.paramFromList.ForMaintenance.lastupdatestamp
          }
      }

      this.getJSON(this.getUrlCRUD(), param).then(response => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];

        this.M_MmMaintenanceType  = {
          fm_fleet_mstr_id: data.fm_fleet_mstr_id,
          mm_maintenance_type_id : data.mm_maintenance_type_id,
          ss_portfolio_id : data.ss_portfolio_id,
          maintenance_type : this.Stype == 'M' ? data.maintenance_type__tb_1 : data.maintenance_type_descs__lbl_lo_1,
          descs : data.descs__tb_2,
          usage_distance : data.usage_distance__tb_3 && data.usage_distance__tb_3 !== '' ? data.usage_distance__tb_3 + ' Km' : data.usage_distance__tb_3,
          usage_tolerance_distance : data.usage_tolerance_distance__tb_4 && data.usage_tolerance_distance__tb_4 !== '' ? data.usage_tolerance_distance__tb_4 + ' Km' : data.usage_tolerance_distance__tb_4,
          time_days : data.time_days__tb_5 && data.time_days__tb_5 !== '' ? data.time_days__tb_5 + (data.time_days__tb_5 > 1 ? ' Days' : ' Day') : data.time_days__tb_5,
          time_days_tolerance : data.time_days_tolerance__tb_6 && data.time_days_tolerance__tb_6 !== '' ? data.time_days_tolerance__tb_6 + (data.time_days_tolerance__tb_6 > 1 ? ' Days' : ' Day') : data.time_days_tolerance__tb_6
        };

        this.getItems();
      });
    },
    getItems() {
      var param = {};
      if (this.Stype == "M") {
        param = {
            option_function_cd: "GetListFMFleetMaintenanceItem",
            module_cd: "OP",
            ss_portfolio_id: this.getDataUser().portfolio_id,
        //     fm_fleet_mstr_id: this.paramFromList.fm_fleet_mstr_id,
            fm_fleet_maintenance_type_id: this.paramFromList.row_id
        };
      }
      else {
        param = {
            option_function_cd: "GetListFMFleetMaintenanceItem",
            module_cd: "OP",
            ss_portfolio_id: this.getDataUser().portfolio_id,
            fm_fleet_mstr_id: this.paramFromList.ForMaintenance.fm_fleet_mstr_id,
            fm_fleet_maintenance_type_id: this.paramFromList.ForMaintenance.row_id
        };
      }

      this.CallFunction(param).then(response => {
          if (response == null) return
          this.Items.Tb_Data = response.Data;
      })
    },
    CheckType() {
            if (this.paramFromList.ForMaintenance == null || this.paramFromList.ForMaintenance == undefined) {
                this.Stype = "M"
            } else {
                if (Object.keys(this.paramFromList.ForMaintenance).length < 1) {
                    this.Stype = "M"
                } else {
                    this.Stype = "D"
                }
            }

            this.GetDataBy();
        }
  },
  mounted() {
    this.CheckType();
  },
  beforeMount() {}
};
</script>

<style>
</style>
