<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Pending Booking</span>
                </b-col>
                <b-col style="text-align: right;">
                  <!-- <ABSButton
                    :text="'Add Order'"
                    classButton="button button--back"
                    classIcon="icon-style-1"
                    @click="doAddOrder"
                  /> -->

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
              <b-row v-show="!isConfirmed">
                  <b-col class="col-right">
                      <span>
                          <ABSButton
                              :text="'Confirm'"
                              classButton="button button--default"
                              classIcon="icon-style-1"
                              @click="doConfirm"
                          />
                      </span>
                      <span>
                          <ABSButton
                              :text="'Cancel'"
                              classButton="button button--default"
                              classIcon="icon-style-1"
                              @click="doDelete"
                          />
                      </span>
                      <span>
                          <ABSButton
                              :text="'Edit'"
                              classButton="button button--default"
                              classIcon="icon-style-1"
                              @click="doEdit"
                          />
                      </span>
                  </b-col>
              </b-row>
              <br >
              <b-row>
                <b-col md="6">
                  <b-row class="row-bordered">
                    <b-col md="12">
                      <b-row>
                        <b-col>
                          <span style="font-size: 15px; color: #333399; font-weight: bold;"> Transaction Information </span>
                        </b-col>
                      </b-row>
                      <br />
                      <b-row class="row-view">
                        <b-col md="6">
                          <span>
                            <label>Booking No</label>
                          </span>
                          <br/>
                          <span>
                            <label>{{M_Order.booking_no}}</label>
                          </span>
                        </b-col>
                        <b-col md="6">
                          <span>
                            <label>Status</label>
                          </span>
                          <br/>
                          <span>
                            <label>{{M_Order.status}}</label>
                          </span>
                        </b-col>
                        <!-- <b-col md="3">
                          <span>
                            <label>Source</label>
                          </span>
                          <br/>
                          <span>
                            <label>{{M_Order.source}}</label>
                          </span>
                        </b-col> -->
                      </b-row>
                      <b-row class="row-view">
                        <b-col md="12">
                          <span>
                            <label>Customer Name</label>
                          </span>
                          <br/>
                          <span>
                            <label>{{M_Order.customer_name}}</label>
                          </span>
                        </b-col>
                      </b-row>
                      <b-row class="row-view">
                        <b-col md="12">
                          <span>
                            <label>PIC</label>
                          </span>
                          <br/>
                          <span>
                            <label>{{M_Order.contact_person}}</label>
                          </span>
                        </b-col>
                      </b-row>
                      <b-row class="row-view">
                        <b-col md="6">
                          <span>
                            <label>Order Ref No</label>
                          </span>
                          <br/>
                          <span>
                            <label>{{M_Order.ref_no}}</label>
                          </span>
                        </b-col>
                        <b-col md="6">
                          <span>
                            <label>Pickup Date Time</label>
                          </span>
                          <br/>
                          <span>
                            <label>{{M_Order.pickup_date}}</label>
                          </span>
                        </b-col>
                      </b-row>
                      <b-row class="row-view">
                        <b-col md="6">
                          <span>
                            <label>Pickup From</label>
                          </span>
                          <br/>
                          <span>
                            <label>{{M_Order.pickup_from}}</label>
                          </span>
                        </b-col>
                        <b-col md="6">
                          <span>
                            <label>Delivery To</label>
                          </span>
                          <br/>
                          <span>
                            <label>{{M_Order.delivery_to}}</label>
                          </span>
                        </b-col>
                      </b-row>
                      <b-row class="row-view">
                        <b-col md="12">
                          <span>
                            <label>Description</label>
                          </span>
                          <br/>
                          <span>
                            <label>{{M_Order.descs}}</label>
                          </span>
                        </b-col>
                      </b-row>
                    </b-col>
                  </b-row>
                </b-col>
                <b-col md="6">
                  <b-row class="row-bordered">
                    <b-col md="12">
                      <b-row>
                        <b-col>
                          <span style="font-size: 15px; color: #333399; font-weight: bold;"> Information </span>
                        </b-col>
                        <b-col class="col-right" md="2">
                          <div style="width: 60px; text-align: center; border-radius: 5px !important;" class="row-bordered">
                            <span style="font-size: 13px; color: #333399; font-weight: bold;">
                              {{M_Order.category == "F" ? "FTL" : (M_Order.category == "L" ? "LTL" : "Project")}}
                            </span>
                          </div>
                        </b-col>
                      </b-row>
                      <br />
                      <template v-if="M_Order.category == 'F'">
                        <template v-for="(data, index) in TruckDetail">
                          <b-row class="row-view" v-bind:key="index">
                            <b-col md="6">
                              <span>
                                <label>Truck</label>
                              </span>
                              <br/>
                              <span>
                                <label>{{data.fleet_type}}</label>
                              </span>
                            </b-col>
                            <b-col md="6">
                              <span>
                                <label>Qty</label>
                              </span>
                              <br/>
                              <span>
                                <label>{{data.qty}}</label>
                              </span>
                            </b-col>
                          </b-row>
                        </template>
                      </template>
                      <template v-if="M_Order.category == 'L'">
                        <b-row class="row-view">
                          <b-col md="12">
                            <span>
                              <label>Comodity</label>
                            </span>
                            <br/>
                            <span>
                              <label>{{M_Order.comodity}}</label>
                            </span>
                          </b-col>
                        </b-row>
                        <b-row class="row-view">
                          <b-col md="4">
                            <span>
                              <label>Total Item</label>
                            </span>
                            <br/>
                            <span>
                              <label>{{M_Order.total_item}}</label>
                            </span>
                          </b-col>
                          <b-col md="4">
                            <span>
                              <label>Weight (Kg)</label>
                            </span>
                            <br/>
                            <span>
                              <label>{{M_Order.kgs}}</label>
                            </span>
                          </b-col>
                          <b-col md="4">
                            <span>
                              <label>Cubic</label>
                            </span>
                            <br/>
                            <span>
                              <label>{{M_Order.cbm}}</label>
                            </span>
                          </b-col>
                        </b-row>
                      </template>
                      <template v-if="M_Order.category == 'P'">
                        <b-row class="row-view">
                          <b-col md="12">
                            <span>
                              <label>Contract No</label>
                            </span>
                            <br/>
                            <span>
                              <label>{{M_Order.contract_no}}</label>
                            </span>
                          </b-col>
                        </b-row>
                        <b-row class="row-view">
                          <b-col md="12">
                            <span>
                              <label>Description</label>
                            </span>
                            <br/>
                            <span>
                              <label>{{M_Order.P_descs}}</label>
                            </span>
                          </b-col>
                        </b-row>
                        <b-row class="row-view">
                          <b-col md="4">
                            <span>
                              <label>Charge By</label>
                            </span>
                            <br/>
                            <span>
                              <label>{{M_Order.charge_by}}</label>
                            </span>
                          </b-col>
                          <b-col md="4">
                            <span>
                              <label>Contracted Volume</label>
                            </span>
                            <br/>
                            <span>
                              <label>{{M_Order.contracted_volume}}</label>
                            </span>
                          </b-col>
                          <b-col md="4">
                            <span>
                              <label>Executed Volume</label>
                            </span>
                            <br/>
                            <span>
                              <label>{{M_Order.executed_volume}}</label>
                            </span>
                          </b-col>
                        </b-row>
                        <template v-for="(data, index) in TruckDetail">
                          <b-row class="row-view" v-bind:key="index">
                            <b-col md="6">
                              <span>
                                <label>Truck</label>
                              </span>
                              <br/>
                              <span>
                                <label>{{data.fleet_type}}</label>
                              </span>
                            </b-col>
                            <b-col md="6">
                              <span>
                                <label>Qty</label>
                              </span>
                              <br/>
                              <span>
                                <label>{{data.qty}}</label>
                              </span>
                            </b-col>
                          </b-row>
                        </template>
                      </template>
                    </b-col>
                  </b-row>
                </b-col>
              </b-row>
              <br >
              <b-row v-show="M_Order.category !== 'L'">
                <b-col>
                  <ACCFormList
                    :prop="propList"
                    :title="''"
                    @rowClicked="rowClicked"
                    ref="ref_OrderList"
                    WithDeleteButton
                    @buttonDeleteClicked="doDeleteClick"
                  >
                    <template slot="status" slot-scope="data">
                      <div style="width: 32px; height: 32px; background-color: purple; border-radius: 50px; margin: auto; padding-top: 3%; color: white">
                        {{data.item.status}}
                      </div>
                    </template>
                  </ACCFormList>
                </b-col>
              </b-row>
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
      propList: {
        OptionUrl: "/OP/OP_Booking",
        LineNo: 2,
        initialWhere:"",
        OrderBy: "",
        SourceField: "",
        ParamView: "",
      },
      M_Order: {
        booking_no: "",
        status: "",
        source: "",
        customer_name: "",
        contact_person: "",
        ref_no: "",
        pickup_date: "",
        pickup_from: "",
        delivery_to: "",
        descs: "",
        category: "",
        comodity: "",
        total_item: "",
        kgs: "",
        cbm: "",
        contract_no: "",
        P_descs: "",
        charge_by: "",
        contracted_volume: "",
        executed_volume: "",
      },
      TruckDetail: [],
      isConfirmed: false
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
    doAddOrder() {
      var param = this.paramFromList;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "OP_OrderForm" });
    },
    doBack() {
      this.$router.go(-1);
    },
    doConfirm(){
      this.alertConfirmation("Are You Sure Want To Confirm This Data ?").then(
        ress => {
          if (ress.value) {
            this.M_Confirm();
          }
        }
      );
    },
    M_Confirm() {
      var param = {
        option_url: "/OP/OP_Booking",
        line_no: 3,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        row_id: this.paramFromList.row_id,
        user_id: this.getDataUser().user_id
      };
      
      this.putJSON(this.getUrlCRUD(), param).then(response => {
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          this.GetDataBy();
        });
      });
    },
    doDelete() {
      this.alertConfirmation("Are You Sure Want To Cancel This Data ?").then(
        ress => {
          if (ress.value) {
            this.M_Delete();
          }
        }
      );
    },
    M_Delete() {
      var param = {
        option_url: "/OP/OP_Booking",
        line_no: 3,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.M_Order.lastupdatestamp
      };
      this.deleteJSON(this.getUrlCRUD(), param).then(response => {
        if (response == null) return;
        this.alertSuccess("Data Has Been Canceled").then(() => {
          this.doBack();
        });
      });
    },
    doEdit() {
      var param = this.paramFromList;
      param.isView = false;
      param.isEdit = true;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "OP_IncomingBooking_Form" });
    },
    renderListOrder() {
      this.propList.initialWhere = "op_booking_h_id='" + this.paramFromList.row_id + "'"
      this.$refs.ref_OrderList.doGetList("");
    },
    doDeleteClick(record, index) {
      if (record.status !== 'NW') return

      this.alertConfirmation("Are You Sure Want To Delete This Data ?").then(
        ress => {
          if (ress.value) {
            this.M_DeleteOrder(record);
          }
        }
      );
    },
    M_DeleteOrder(i) {
      var param = {
        option_url: "/OP/OP_Booking",
        line_no: 2,
        id: i.row_id,
        lastupdatestamp: i.lastupdatestamp
      };
      this.deleteJSON(this.getUrlCRUD(), param).then(response => {
        if (response == null) return;
        this.alertSuccess("Data Has Been Deleted").then(() => {
          this.GetDataBy();
        });
      });
    },
    GetDataBy() {
      var param = {
        option_url: "/OP/OP_Booking",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };
      
      this.getJSON(this.getUrlCRUD(), param).then(response => {
        if (response == null) return;
        var data = response.Data[0];
        // this.isConfirmed = (data.booking_status == "C")
        if (data.booking_status == "C") {
          this.renderListOrder()
          this.isConfirmed = true
        }

        this.M_Order = {
          op_booking_h_id: data.op_booking_h_id,
          booking_no: data.booking_no,
          status: data.booking_status == "P" ? "Pending" : "Confirmed",
          source: data.booking_source == "I" ? "Internal" : "Eksternal",
          customer_name: data.contact_name__lbl__lo_1,
          contact_person: data.contact_person_name__lbl__lo_2,
          ref_no: data.ref_no__tb_3,
          pickup_date: this.momentDateFormatting(data.pickup_date__tb_6, "YYYY-MM-DD HH:mm"),
          pickup_from: data.fr_address__lbl__lo_4,
          delivery_to: data.to_address__lbl__lo_5,
          descs: data.descs__tb_7,
          category: data.category,
          comodity: data.commodity_descs,
          total_item: data.total_item && data.total_item !== '' ? this.isCurrency(data.total_item, 0) : 0,
          kgs: data.total_kgs && data.total_kgs !== '' ? this.isCurrency(data.total_kgs, 0) : 0,
          cbm: data.total_cbm && data.total_cbm !== '' ? this.isCurrency(data.total_cbm, 0) : 0,
          contract_no: data.contract_no,
          P_descs: data.contract_descs,
          charge_by: data.contract_charge_by,
          contracted_volume: data.contract_volume && data.contract_volume !== '' ? this.isCurrency(data.contract_volume, 0) : 0,
          executed_volume: data.contract_executed_volume && data.contract_executed_volume !== '' ? this.isCurrency(data.contract_executed_volume, 0) : 0,
          lastupdatestamp: data.lastupdatestamp
        }

        if (data.category !== "L") {
          for (let i = 0; i < response.Data.length; i++) {
            var datas = response.Data[i];
            this.TruckDetail.push({
              fleet_type: datas.dt_fleet_type,
              qty: datas.dt_qty && datas.dt_qty !== '' ? this.isCurrency(datas.dt_qty, 0) : 0
            })
          }
        }
        else {
          this.TruckDetail = []
        }

      });
    }
  },
  mounted() {
    this.GetDataBy();
  },
  beforeMount() {}
};
</script>

<style scoped>
.list-group {
  margin-bottom: 0px !important;
}
.list-group-item {
  padding: 5px !important;
}
.row-h {
  color: gray;
  font-size: 12px;
}
.row-b {
  font-size: 14px;
  margin-bottom: 10px;
}
</style>>
