<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Booking Entry</span>
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
                        <b-col md="3">
                          <span>
                            <label>Status</label>
                          </span>
                          <br/>
                          <span>
                            <label>{{M_Order.status}}</label>
                          </span>
                        </b-col>
                        <b-col md="3">
                          <span>
                            <label>Source</label>
                          </span>
                          <br/>
                          <span>
                            <label>{{M_Order.source}}</label>
                          </span>
                        </b-col>
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
                        <b-col class="col-right" style="min-width: fit-content !important;">
                          <div class="button button-default">
                            {{M_Order.category}}
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
                                <label>{{data.vehicle_type}}</label>
                              </span>
                            </b-col>
                            <b-col md="6">
                              <span>
                                <label>Qty</label>
                              </span>
                              <br/>
                              <span>
                                <label>{{isCurrency(data.qty, 0)}}</label>
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
                              <label>{{isCurrency(M_Order.total_item, 0)}}</label>
                            </span>
                          </b-col>
                          <b-col md="4">
                            <span>
                              <label>Weight (Kg)</label>
                            </span>
                            <br/>
                            <span>
                              <label>{{isCurrency(M_Order.kgs, 0)}}</label>
                            </span>
                          </b-col>
                          <b-col md="4">
                            <span>
                              <label>Cubic</label>
                            </span>
                            <br/>
                            <span>
                              <label>{{isCurrency(M_Order.cbm, 0)}}</label>
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
                              <label>{{isCurrency(M_Order.contracted_volume, 0)}}</label>
                            </span>
                          </b-col>
                          <b-col md="4">
                            <span>
                              <label>Executed Volume</label>
                            </span>
                            <br/>
                            <span>
                              <label>{{isCurrency(M_Order.executed_volume, 0)}}</label>
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
                                <label>{{data.vehicle_type}}</label>
                              </span>
                            </b-col>
                            <b-col md="6">
                              <span>
                                <label>Qty</label>
                              </span>
                              <br/>
                              <span>
                                <label>{{isCurrency(data.qty, 0)}}</label>
                              </span>
                            </b-col>
                          </b-row>
                        </template>
                      </template>
                    </b-col>
                  </b-row>
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
      M_Order: {
      }
    };
  },
  computed: {
    paramFromList() {
      var param = this.$route.params;
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
    doEdit() {
      var param = this.paramFromList;
      param.isEdit = true;
      this.$router.push({ name: "OP_AddBookingEntry", params: param });
    },
    GetDataBy() {
      var param = {
        option_url: "/OP/OP_BookingEntry",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };
      
      this.getJSON(this.getUrlCRUD(), param).then(response => {
        if (response == null) return;
        var data = response.Data[0];
        
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
