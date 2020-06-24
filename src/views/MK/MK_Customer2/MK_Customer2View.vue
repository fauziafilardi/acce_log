<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>View Customer2</span>
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
                  <b-col md="2">
                    <div>
                      <!-- <img :src="M_NewProspect.path_file" alt width="100%" /> -->
                      <img :src="require('@/assets/paper.png')" alt style="width: 70px;" />
                    </div>
                  </b-col>
                  <b-col md="10">
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Name</label>
                        </span>
                        <br />
                        <span>
                          <label>{{M_CmContact.name}}</label>
                        </span>
                      </b-col>
                      <b-col style="text-align: right;">
                        <span>
                          <ABSButton
                            :text="'Edit'"
                            classButton="btn btn--default"
                            classIcon="icon-style-1"
                            @click="doEdit"
                          />
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Address</label>
                        </span>
                        <br />
                        <span>
                          <label>{{M_CmContact.address}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>District</label>
                        </span>
                        <br />
                        <span>
                          <label>{{M_CmContact.districtLabel}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>City</label>
                        </span>
                        <br />
                        <span>
                          <label>{{M_CmContact.cityLabel}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Province</label>
                        </span>
                        <br />
                        <span>
                          <label>{{M_CmContact.provinceLabel}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Country</label>
                        </span>
                        <br />
                        <span>
                          <label>{{M_CmContact.countryLabel}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Phone No</label>
                        </span>
                        <br />
                        <span>
                          <label>{{M_CmContact.phone_no}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Customer_Status</label>
                        </span>
                        <br />
                        <span>
                          <label>{{M_CmContact.customer_statusLabel}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Website</label>
                        </span>
                        <br />
                        <span>
                          <label>{{M_CmContact.website}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Contact Person</label>
                        </span>
                        <br />
                        <span>
                          <label>{{M_CmContact.contact_person}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Contact Phone No</label>
                        </span>
                        <br />
                        <span>
                          <label>{{M_CmContact.contact_phone_no}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Cm Customer Status Id</label>
                        </span>
                        <br />
                        <span>
                          <label>{{M_CmContact.cm_customer_status_id}}</label>
                        </span>
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
      M_CmContact: {
        cm_contact_id: 0,
        ss_portfolio_id: 0,
        contact_type: "",
        contact_status: "",
        contact_created: "",
        name: "",
        address: "",
        ss_country_id: 0,
        country: "",
        ss_province_id: 0,
        province: "",
        ss_city_id: 0,
        city: "",
        ss_district_id: 0,
        district: "",
        phone_no: "",
        email: "",
        website: "",
        contact_person: "",
        contact_phone_no: "",
        cm_customer_status_id: 0,
        customer_status: "",
        user_input: "",
        user_edit: "",
        time_input: "",
        time_edit: "",
        row_id: 0,
        lastupdatestamp: 0,
        file_name: "",
        path_file: ""
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
      this.$router.push({ name: "MK_EditCustomer2", params: param });
    },
    GetDataBy() {
      var param = {
        option_url: "/MK/MK_Customer2",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };

      this.getJSON(this.getUrlCRUD(), param).then(response => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];

        this.M_CmContact = {
          cm_contact_id: data.cm_contact_id,
          ss_portfolio_id: data.ss_portfolio_id,
          contact_type: data.contact_type,
          contact_status: data.contact_status,
          contact_created: data.contact_created,
          name: data.name__tb_1,
          address: data.address__tb_2,
          ss_country_id: data.ss_country_id__lo_6,
          countryLabel: data.country__lbl__lo_6,
          ss_province_id: data.ss_province_id__lo_5,
          provinceLabel: data.province__lbl__lo_5,
          ss_city_id: data.ss_city_id__lo_4,
          cityLabel: data.city__lbl__lo_4,
          ss_district_id: data.ss_district_id__lo_3,
          districtLabel: data.district__lbl__lo_3,
          phone_no: data.phone_no__tb_7,
          email: data.email__tb_8,
          website: data.website__tb_9,
          contact_person: data.contact_person__tb_10,
          contact_phone_no: data.contact_phone_no__tb_11,
          cm_customer_status_id: data.cm_customer_status_id__lo_12,
          customer_statusLabel: data.customer_status__lbl__lo_12,
          user_input: data.user_input,
          user_edit: data.user_edit,
          time_input: data.time_input,
          time_edit: data.time_edit,
          row_id: data.row_id,
          lastupdatestamp: data.lastupdatestamp,
          file_name: data.file_name,
          path_file: data.path_file
        };
      });
    }
  },
  mounted() {
    this.GetDataBy();
  },
  beforeMount() {}
};
</script>

<style>
</style>
