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
              <b-form :data-vv-scope="'parent'" :data-vv-value-path="'parent'">
                <b-row>
                  <b-col md="6">
                    <span>
                      <label>Transaction Information</label>
                    </span>
                    <b-list-group>
                      <b-list-group-item>
                        <b-row class="row-h">
                          <b-col>Customer Name</b-col>
                          <b-col>PIC</b-col>
                        </b-row>
                        <b-row class="row-b">
                          <b-col>{{M_BookingEntry.customer_name}}</b-col>
                          <b-col>{{M_BookingEntry.pic}}</b-col>
                        </b-row>
                        <b-row class="row-h">
                          <b-col>Order Ref No</b-col>
                        </b-row>
                        <b-row class="row-b">
                          <b-col>{{M_BookingEntry.order_ref_no}}</b-col>
                        </b-row>
                      </b-list-group-item>
                      <b-list-group-item>
                        <b-row class="row-h">
                          <b-col>Booking Category</b-col>
                          <b-col>Contract No</b-col>
                        </b-row>
                        <b-row class="row-b">
                          <b-col>{{M_BookingEntry.booking_category}}</b-col>
                          <b-col>{{M_BookingEntry.contract_no}}</b-col>
                        </b-row>
                        <b-row class="row-h">
                          <b-col>Project Base</b-col>
                          <b-col>Total</b-col>
                          <b-col>Have Been Pickup</b-col>
                          <b-col>Rest</b-col>
                        </b-row>
                        <b-row class="row-b">
                          <b-col>{{M_BookingEntry.project_base}}</b-col>
                          <b-col>{{M_BookingEntry.total}}</b-col>
                          <b-col>{{M_BookingEntry.pickup}}</b-col>
                          <b-col>{{M_BookingEntry.rest}}</b-col>
                        </b-row>
                      </b-list-group-item>
                      <b-list-group-item>
                        <b-row class="row-h">
                          <b-col>Picup From</b-col>
                          <b-col>Delivery To</b-col>
                        </b-row>
                        <b-row class="row-b">
                          <b-col>{{M_BookingEntry.pickup_from}}</b-col>
                          <b-col>{{M_BookingEntry.delivery_to}}</b-col>
                        </b-row>
                        <b-row class="row-h">
                          <b-col>Pickup Date Time</b-col>
                        </b-row>
                        <b-row class="row-b">
                          <b-col>{{M_BookingEntry.pickup_date}}</b-col>
                        </b-row>
                      </b-list-group-item>
                    </b-list-group>
                  </b-col>
                  <!-- <b-col v-show="showLTL" md="6">
                    <span>
                      <label>Truck Information</label>
                    </span>
                    <b-list-group>
                      <b-list-group-item>
                        <b-row class="row-h">
                          <b-col>Type</b-col>
                        </b-row>
                        <b-row class="row-b">
                          <b-col>{{M_BookingEntry.type}}</b-col>
                        </b-row>
                        <b-row class="row-h">
                          <b-col>Wight (Kg)</b-col>
                          <b-col>Cubic</b-col>
                        </b-row>
                        <b-row class="row-b">
                          <b-col>{{M_BookingEntry.weight}}</b-col>
                          <b-col>{{M_BookingEntry.cubic}}</b-col>
                        </b-row>
                      </b-list-group-item>
                      <b-list-group-item>
                        <b-row class="row-h">
                          <b-col>Extra Pickup</b-col>
                        </b-row>
                        <b-row class="row-b">
                          <b-col>{{M_BookingEntry.extra_pickup}}</b-col>
                        </b-row>
                        <b-row class="row-h">
                          <b-col>Extra Deliver</b-col>
                        </b-row>
                        <b-row class="row-b">
                          <b-col>{{M_BookingEntry.extra_deliver}}</b-col>
                        </b-row>
                      </b-list-group-item>
                    </b-list-group>
                  </b-col>-->
                  <b-col md="6">
                    <span>
                      <label>Truck Information</label>
                    </span>
                    <b-list-group>
                      <b-list-group-item>
                        <b-row class="row-h">
                          <b-col>Type</b-col>
                        </b-row>
                        <b-row class="row-b">
                          <b-col>{{M_BookingEntry.type}}</b-col>
                        </b-row>

                        <b-row class="row-h" v-show="showLTL">
                          <b-col>Wight (Kg)</b-col>
                          <b-col>Cubic</b-col>
                        </b-row>
                        <b-row class="row-b" v-show="showLTL">
                          <b-col>{{M_BookingEntry.weight}}</b-col>
                          <b-col>{{M_BookingEntry.cubic}}</b-col>
                        </b-row>

                        <!-- <b-row class="row-h" v-show="showFTL">
                          <b-col>Truck</b-col>
                          <b-col>Qty</b-col>
                        </b-row>
                        <b-row
                          v-show="showFTL"
                          v-for="(data, index) in dataDetail"
                          v-bind:key="index"
                        >
                          <b-col>{{data.ftl_truck}}</b-col>
                          <b-col>{{data.ftl_qty}}</b-col>
                        </b-row>-->
                        <b-list-group v-show="showFTL">
                          <b-list-group-item>
                            <b-row>
                              <b-col>
                                <span>Truck</span>
                              </b-col>
                              <b-col>
                                <span>Qty</span>
                              </b-col>
                            </b-row>
                          </b-list-group-item>
                          <b-list-group-item v-for="(data, index) in dataDetail" v-bind:key="index">
                            <b-row>
                              <b-col>
                                <span>{{data.ftl_truck}}</span>
                              </b-col>
                              <b-col>
                                <span>{{data.ftl_qty}}</span>
                              </b-col>
                            </b-row>
                          </b-list-group-item>
                        </b-list-group>
                        <!-- <b-list-group>
                          <b-list-group-item
                            class="flex-column align-items-start"
                            style="padding-top: 5px !important; padding-bottom: 5px !important;"
                          >
                            <b-row>
                              <b-col>
                                <span>Truck</span>
                              </b-col>
                              <b-col>
                                <span>Qty</span>
                              </b-col>
                              <b-col>
                                <span>&nbsp;</span>
                              </b-col>
                            </b-row>
                          </b-list-group-item>
                          <b-list-group-item
                            @dblclick="onDataDblClick(index)"
                            v-for="(data, index) in dataDetail"
                            href="#"
                            class="flex-column align-items-start"
                            v-bind:key="index"
                            style="padding-top: 5px !important; padding-bottom: 5px !important;"
                          >
                            <b-row>
                              <b-col>
                                <span>{{data.ftl_truck}}</span>
                              </b-col>
                              <b-col>
                                <span>{{data.ftl_qty}}</span>
                              </b-col>
                              <b-col class="center-delete-list" style="max-width:100% !important;">
                                <font-awesome-icon
                                  icon="trash-alt"
                                  class="icon-style-1__deleteMobile"
                                  @click="M_Delete(index)"
                                />
                              </b-col>
                            </b-row>
                          </b-list-group-item>
                        </b-list-group>-->
                      </b-list-group-item>
                      <b-list-group-item>
                        <b-row class="row-h">
                          <b-col>Extra Pickup</b-col>
                        </b-row>
                        <b-row class="row-b">
                          <b-col>{{M_BookingEntry.extra_pickup}}</b-col>
                        </b-row>
                        <b-row class="row-h">
                          <b-col>Extra Deliver</b-col>
                        </b-row>
                        <b-row class="row-b">
                          <b-col>{{M_BookingEntry.extra_deliver}}</b-col>
                        </b-row>
                      </b-list-group-item>
                    </b-list-group>
                  </b-col>
                </b-row>
                <b-row style="margin-top: 10px;">
                  <b-col md="12">
                    <ABSButton
                      :text="'Edit Booking Entry'"
                      classButton="btn btn--default"
                      classIcon="icon-style-1"
                      @click="doEdit"
                      styleButton="height: 40px;width: 100%;"
                    />
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
      M_BookingEntry: {
        customer_name: "",
        pic: "",
        order_ref_no: "",
        booking_category: "",
        contract_no: "",
        project_base: "",
        total: "",
        pickup: "",
        rest: "",
        pickup_from: "",
        delivery_to: "",
        pickup_date: "",
        type: "",
        weight: "",
        cubic: "",
        extra_pickup: "",
        extra_deliver: ""
      },
      M_GetDataBy: null,
      dataDetail: [],
      showLTL: false,
      showFTL: false
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
    // doGetList(search) {
    //   var param = {
    //     option_url: "/MK/MK_Customer",
    //     line_no: 1,
    //     user_id: this.getDataUser().user_id,
    //     portfolio_id: this.getDataUser().portfolio_id,
    //     subportfolio_id: this.getDataUser().subportfolio_id,
    //     current_page: 1,
    //     per_page: 10,
    //     param_where: "",
    //     initial_where: " cm_contact_id = " + this.paramFromList.cm_contact_id,
    //     sort_field: "",
    //     source_field: "",
    //     param_view: ""
    //   };
    //   this.postJSON(this.getUrlList(), param).then(response => {
    //     if (response == null) return;
    //     console.log(response.Data);
    //     this.dataPIC = response.Data;
    //   });
    // },
    // onDataDblClick(index) {
    //   this.inputStatus = "edit";
    //   var param = {
    //     option_url: "/MK/MK_Customer",
    //     line_no: 1,
    //     id: this.dataPIC[index].row_id,
    //     lastupdatestamp: this.dataPIC[index].lastupdatestamp
    //   };
    //   this.getJSON(this.getUrlCRUD(), param).then(response => {
    //     if (response == null) return;
    //     var data = response.Data[0];
    //     this.$refs.Modal_PIC._show();
    //     var phone_no =
    //       data.phone_no && data.phone_no !== "" ? data.phone_no.split("-") : "";
    //     this.M_Customer = {
    //       cm_contact_id: data.cm_contact_id,
    //       cm_contact_person_id: data.cm_contact_person_id,
    //       contact_person_modal: data.name,
    //       contact_phone_no_1: phone_no !== "" ? phone_no[0] : phone_no,
    //       contact_phone_no_2: phone_no !== "" ? phone_no[1] : phone_no,
    //       contact_phone_no_3: phone_no !== "" ? phone_no[2] : phone_no,
    //       email_modal: data.email,
    //       lastupdatestamp: data.lastupdatestamp
    //     };
    //   });
    // },
    GetDataBy() {
      var param = {
        option_url: "/OP/OP_BookingEntry",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
        // id: 1,
        // lastupdatestamp: 67265
      };
      this.showLTL = true;
      this.getJSON(this.getUrlCRUD(), param).then(response => {
        if (response == null) return;
        var data = response.Data[0];
        this.M_GetDataBy = data;
        this.dataDetail = response.Data;

        if (data.truck_type == "FTL") {
          this.showFTL = true;
          this.showLTL = false;
        } else {
          this.showFTL = false;
          this.showLTL = true;
        }

        this.M_BookingEntry = {
          customer_name: data.contact_name,
          pic: data.contact_person_name,
          order_ref_no: data.ref_no,
          booking_category: data.booking_category,
          contract_no: data.contract_no,
          project_base: data.base_type,
          total: data.base_total,
          pickup: data.base_pickup,
          rest: data.base_rest_of,
          pickup_from: data.location_pickup,
          delivery_to: data.location_deliver,
          pickup_date: this.momentDateFormatting(
            new Date(data.pickup_date),
            "DD-MM-YYYY HH.mm"
          ),
          type: data.truck_type,
          weight: data.weight,
          cubic: data.cubic,
          extra_pickup: data.location_extra_pickup,
          extra_deliver: data.location_extra_deliver
        };
      });
    }
  },
  mounted() {
    this.GetDataBy();
    // this.doGetList();
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
