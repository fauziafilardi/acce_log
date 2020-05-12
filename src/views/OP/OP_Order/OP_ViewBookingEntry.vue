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
                          <b-col>PT. Abadi Sentosa</b-col>
                          <b-col>Ivan</b-col>
                        </b-row>
                        <b-row class="row-h">
                          <b-col>Order Ref No</b-col>
                        </b-row>
                        <b-row class="row-b">
                          <b-col>SO0002</b-col>
                        </b-row>
                      </b-list-group-item>
                      <b-list-group-item>
                        <b-row class="row-h">
                          <b-col>Booking Category</b-col>
                          <b-col>Contract No</b-col>
                        </b-row>
                        <b-row class="row-b">
                          <b-col>Project</b-col>
                          <b-col>SO0002</b-col>
                        </b-row>
                        <b-row class="row-h">
                          <b-col>Project Base</b-col>
                          <b-col>Total</b-col>
                          <b-col>Have Been Pickup</b-col>
                          <b-col>Rest</b-col>
                        </b-row>
                        <b-row class="row-b">
                          <b-col>Volume Base</b-col>
                          <b-col>10.000</b-col>
                          <b-col>2.500</b-col>
                          <b-col>7.500</b-col>
                        </b-row>
                      </b-list-group-item>
                      <b-list-group-item>
                        <b-row class="row-h">
                          <b-col>Picup From</b-col>
                          <b-col>Delivery To</b-col>
                        </b-row>
                        <b-row class="row-b">
                          <b-col>JKT</b-col>
                          <b-col>SMG</b-col>
                        </b-row>
                        <b-row class="row-h">
                          <b-col>Pickup Date Time</b-col>
                        </b-row>
                        <b-row class="row-b">
                          <b-col>30/01/2020 12.00</b-col>
                        </b-row>
                      </b-list-group-item>
                    </b-list-group>
                  </b-col>
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
                          <b-col>LTL</b-col>
                        </b-row>
                        <b-row class="row-h">
                          <b-col>Wight (Kg)</b-col>
                          <b-col>Cubic</b-col>
                        </b-row>
                        <b-row class="row-b">
                          <b-col>7.500</b-col>
                          <b-col>7.500</b-col>
                        </b-row>
                      </b-list-group-item>
                      <b-list-group-item>
                        <b-row class="row-h">
                          <b-col>Extra Pickup</b-col>
                        </b-row>
                        <b-row class="row-b">
                          <b-col>None</b-col>
                        </b-row>
                        <b-row class="row-h">
                          <b-col>Extra Deliver</b-col>
                        </b-row>
                        <b-row class="row-b">
                          <b-col>None</b-col>
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
      M_Order: {
        customer: "",
        pic: "",
        ref_no: "",
        category: "",
        contract_no: "",
        project_base: "",
        total_base: "",
        pickup_base: "",
        rest_base: "",
        pickup_from: "",
        deliver_to: "",
        pickup_date: "",
        truck_type: "",
        weight: "",
        cubic: "",
        extra_pickup: "",
        extra_deliver: ""
      },
      FTL: []
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
        // response from API
        if (response == null) return;
        var data = response.Data[0];
        this.M_Order = {
          customer: "",
          pic: "",
          ref_no: "",
          category: "",
          contract_no: "",
          project_base: "",
          total_base: "",
          pickup_base: "",
          rest_base: "",
          pickup_from: "",
          deliver_to: "",
          pickup_date: "",
          truck_type: "",
          weight: "",
          cubic: "",
          extra_pickup: "",
          extra_deliver: ""
        }

        this.FTL = []
      });
    }
  },
  mounted() {
    // this.GetDataBy();
  },
  beforeMount() {}
};
</script>

<style scoped>
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
