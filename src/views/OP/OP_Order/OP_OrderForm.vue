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
                        <b-col class="col-right" md="1">
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
            </div>
          </div>
            <div class="card">
                <div class="card__body">
                    <b-form :data-vv-scope="'OP_OrderForm'" :data-vv-value-path="'OP_OrderForm'">
                        <b-row>
                            <b-col md="2" style="text-align: center;">
                                <img :src="require('@/assets/paper.png')" alt style="width: 100px;" />
                            </b-col>
                            <b-col md="10">
                                <b-row>
                                    <b-col md="4">
                                        <span>
                                            <label>Order Date</label>
                                        </span>
                                        <ACCDateTime
                                            @input="OndateChange"
                                            :prop="PI_date"
                                            v-model="M_FOrder.date"
                                            ref="ref_date"
                                        />
                                    </b-col>
                                </b-row>
                                <b-row>
                                    <b-col md="8">
                                        <span>
                                            <label>Project Name</label>
                                        </span>
                                        <ACCTextBox
                                            :prop="PI_project_name"
                                            v-model="M_FOrder.project_name"
                                            ref="ref_project_name"
                                        />
                                    </b-col>
                                </b-row>
                                <b-row>
                                    <b-col md="8">
                                        <span>
                                            <label>Description</label>
                                        </span>
                                        <ACCTextArea :prop="PI_descs" v-model="M_FOrder.descs" ref="ref_descs" />
                                    </b-col>
                                </b-row>
                                <b-row style="margin-top: 10px;">
                                    <b-col md="8">
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
      
      PI_date: {
        cValidate: "required",
        cName: "date",
        cOrder: 1,
        cKey: false,
        cProtect: false,
        cWithTime: true,
        cFormat: "dd/MM/yyyy",
        cParentForm: "OP_OrderForm",
        cInputStatus: this.inputStatus
      },
      PI_project_name: {
        cValidate: "required|max:60",
        cName: "project_name",
        cOrder: 2,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "OP_OrderForm",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_descs: {
        cValidate: "required|max:500",
        cName: "descs",
        cOrder: 3,
        cKey: false,
        cProtect: false,
        cResize: false,
        cReadonly: false,
        cRows: 3,
        cMaxRows: 10,
        cSize: "md",
        cParentForm: "OP_OrderForm",
        cInputStatus: this.inputStatus
      },
      M_FOrder: {
          date: '',
          project_name: '',
          descs: ''
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
    doSave() {
        this.$validator._base.validateAll("OP_OrderForm").then(result => {
            // console.log(result)
            if (!result) return;
            this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
            ress => {
                if (ress.value) {
                    this.$validator.errors.clear("OP_OrderForm");
                    if (this.inputStatus == "edit") {
                        this.M_Update();
                    } else {
                        this.M_Insert();
                    }
                }
            }
            );
        });
    },
    M_Insert() {
        var param = {
            option_url: "/OP/OP_Booking",
            line_no: 2,
            ss_portfolio_id: this.getDataUser().portfolio_id,
            op_booking_h_id: this.paramFromList.row_id,
            order_date: this.M_FOrder.date,
            project_name: this.M_FOrder.project_name,
            descs: this.M_FOrder.descs,
            user_id: this.getDataUser().user_id
        };

        this.postJSON(this.getUrlCRUD(), param).then(response => {
            // console.log(response)
            if (response == null) return;
            this.alertSuccess(response.Message).then(() => {
                this.doBack();
                // var param = {
                //     row_id: response.Data[0].row_id,
                //     lastupdatestamp: 0
                // }
                // this.$store.commit("setParamPage", param);
                // this.$router.replace({ name: "MK_ViewQuotation" });
            });
        });
    },
    M_Update() {},
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
      });
    },
    M_ClearForm() {
        this.M_FOrder = {
            date: new Date(),
            project_name: "",
            descs: ""
        }
    }
  },
  mounted() {
    this.M_ClearForm();
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
