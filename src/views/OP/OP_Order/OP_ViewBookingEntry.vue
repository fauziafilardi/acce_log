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
    // return {
    //   dataPIC: [],
    //   inputStatus: "",
    //   M_BookingEntry: {},
    //   M_GetDataBy: null
    // };
  },
  computed: {
    // paramFromList() {
    //   var param = this.$route.params;
    //   if (param == null || param == undefined) {
    //     this.doBack();
    //   } else {
    //     if (Object.keys(param).length < 1) {
    //       this.doBack();
    //     } else {
    //       return param;
    //     }
    //   }
    // }
  },
  methods: {
    // doBack() {
    //   this.$router.go(-1);
    // },
    // doEdit() {
    //   var param = this.paramFromList;
    //   param.isEdit = true;
    //   this.$router.push({ name: "MK_AddEditCustomer", params: param });
    // },
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
    // GetDataBy() {
    //   var param = {
    //     option_url: "/MK/MK_Customer",
    //     line_no: 0,
    //     id: this.paramFromList.row_id,
    //     lastupdatestamp: this.paramFromList.lastupdatestamp
    //   };
    //   this.getJSON(this.getUrlCRUD(), param).then(response => {
    //     // response from API
    //     if (response == null) return;
    //     var data = response.Data[0];
    //     this.M_GetDataBy = data;
    //     this.M_Customer = {
    //       customer_name: data.name,
    //       contact_created: this.momentDateFormatting(
    //         new Date(data.contact_created),
    //         "DD-MM-YYYY HH.mm"
    //       ),
    //       address:
    //         data.address +
    //         ", " +
    //         data.district +
    //         ", " +
    //         data.city +
    //         ", " +
    //         data.province +
    //         ", " +
    //         data.country,
    //       phone_no: data.phone_no,
    //       email: data.email,
    //       website: data.website,
    //       contact_person: data.contact_person,
    //       contact_phone_no: data.contact_phone_no
    //       // path_file: this.url + data.path_file
    //     };
    //     if (data.path_file == "" || data.path_file == null) {
    //       this.M_Customer.path_file = require("@/assets/default_photo_.png");
    //     } else {
    //       this.M_Customer.path_file = this.url + data.path_file;
    //     }
    //     this.M_Customer.contact_phone_no_1 = "+62";
    //   });
    // }
  },
  mounted() {
    // this.GetDataBy();
    // this.doGetList();
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
