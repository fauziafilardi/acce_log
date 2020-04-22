<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>{{paramFromList.title}}</span>
                </b-col>
                <b-col style="text-align: right;">
                  <ABSButton
                    :text="'Back'"
                    classButton="button button--new"
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
                      <img src alt />
                    </div>
                    <!-- <ABSButton
                                            :text="'Add Logo'"
                                            classButton="button button--new"
                                            classIcon="icon-style-1"
                    />-->
                  </b-col>
                  <b-col md="10">
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>{{M_NewProspect.customer_name}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>{{M_NewProspect.contact_created}}</span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Address</label>
                        </span>
                        <br />
                        <span>
                          <label>{{M_NewProspect.address}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <!-- <b-row>
                                            <b-col>
                                                <span>
                                                    <label> Distric </label>
                                                </span>
                                                <ACCLookUp :prop="PI_distric" v-model="M_NewProspect.distric" :label="M_NewProspect.districLabel" ref="ref_distric"/>
                                            </b-col>
                                            <b-col>
                                                <span>
                                                    <label> City </label>
                                                </span>
                                                <ACCLookUp :prop="PI_city" v-model="M_NewProspect.city" :label="M_NewProspect.cityLabel" ref="ref_city"/>
                                            </b-col>
                                            <b-col>
                                                <span>
                                                    <label> Province </label>
                                                </span>
                                                <ACCLookUp :prop="PI_province" v-model="M_NewProspect.province" :label="M_NewProspect.provinceLabel" ref="ref_province"/>
                                            </b-col>
                                        </b-row>
                                        <b-row>
                                            <b-col>
                                                <span>
                                                    <label> Country </label>
                                                </span>
                                                <ACCLookUp :prop="PI_country" v-model="M_NewProspect.country" :label="M_NewProspect.countryLabel" ref="ref_country"/>
                                            </b-col>
                    </b-row>-->
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Phone No.</label>
                        </span>
                        <br />
                        <span>
                          <label>{{M_NewProspect.phone_no}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Email</label>
                        </span>
                        <br />
                        <span>
                          <label>{{M_NewProspect.email}}</label>
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
                          <label>{{M_NewProspect.website}}</label>
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
                          <label>{{M_NewProspect.contact_person}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Contact Phone No.</label>
                        </span>
                        <br />
                        <span>
                          <label>{{M_NewProspect.contact_phone_no}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <!-- <b-row>
                                            <b-col>
                                                <ABSButton
                                                    :text="'Save'"
                                                    classButton="button button--new"
                                                    classIcon="icon-style-1"
                                                    @click="M_Save"
                                                />
                                            </b-col>
                    </b-row>-->
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
      M_NewProspect: {
        customer_name: "",
        address: "",
        phone_no: "",
        email: "",
        website: "",
        contact_person: "",
        contact_phone_no: ""
      },
      M_GetDataBy: null
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
  //     }
  //   },
  methods: {
    doBack() {
      this.$router.go(-1);
    },
    methods: {
      doBack() {
        this.$router.go(-1);
      },
      GetDataBy() {
        var param = {
          option_url: this.paramFromList.option_url,
          line_no: 0,
          id: this.paramFromList.row_id,
          lastupdatestamp: this.paramFromList.lastupdatestamp
        };

        this.getJSON(this.getUrlCRUD(), param).then(response => {
          // response from API
          if (response == null) return;

          var data = response.Data[0];
          this.M_GetDataBy = data;

          this.M_NewProspect = {
            customer_name: data.name,
            contact_created: this.momentDateFormatting(
              new Date(data.contact_created),
              "DD-MM-YYYY HH.mm"
            ),
            address:
              data.address +
              ", " +
              data.district +
              ", " +
              data.city +
              ", " +
              data.province +
              ", " +
              data.country,
            phone_no: data.phone_no,
            email: data.email,
            website: data.website,
            contact_person: data.contact_person,
            contact_phone_no: data.contact_phone_no
          };
        });
      }
    },
    mounted() {
      this.GetDataBy();
    },
    beforeMount() {}
  },
  mounted() {
    this.GetDataBy();
  },
  beforeMount() {}
};
</script>

<style>
</style>