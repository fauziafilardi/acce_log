<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>New Prospect</span>
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
                      <img :src="M_NewProspect.path_file" alt width="100%" />
                    </div>
                    <!-- <ABSButton
                                            :text="'Add Logo'"
                                            classButton="button button--new"
                                            classIcon="icon-style-1"
                    />-->
                  </b-col>
                  <b-col md="10">
                    <!-- <b-row>
                      <b-col style="text-align: right;">
                        <span>
                          <ABSButton
                            :text="'Contact'"
                            classButton="button button--new"
                            classIcon="icon-style-1"
                            @click="doBack"
                          />
                        </span>
                        <span>
                          <ABSButton
                            :text="'Edit'"
                            classButton="button button--new"
                            classIcon="icon-style-1"
                            @click="doBack"
                          />
                        </span>
                      </b-col>
                    </b-row>-->
                    <b-row>
                      <b-col>
                        <span>
                          <label>{{M_NewProspect.customer_name}}</label>
                        </span>
                      </b-col>
                      <b-col style="text-align: right;">
                        <span>
                          <ABSButton
                            :text="'Contact'"
                            classButton="btn btn--default"
                            classIcon="icon-style-1"
                            @click="doContact"
                          />
                        </span>
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
                    <b-row class="row-view" style="padding-top: 5px; padding-bottom: 10px;">
                      <b-col>
                        <span>
                          <font-awesome-icon class="icon-style-default" icon="check-circle" />
                          {{M_NewProspect.contact_created}}
                        </span>
                      </b-col>
                      <b-col style="text-align: right;">
                        <span>
                          <font-awesome-icon class="icon-style-default" icon="user" />&nbsp;&nbsp;User : User Account
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
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Customer Status</label>
                        </span>
                        <br />
                        <span>
                          <label>{{M_NewProspect.customer_status}}</label>
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
        contact_phone_no: "",
        path_file: ""
      },
      M_GetDataBy: null
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
    doEdit() {
      var param = this.paramFromList;
      param.isEdit = true;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "MK_AddNewProspect" });
    },
    doContact() {
      var param = this.paramFromList;
      // param.isEdit = true;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "MK_ToDoList_P" });
    },
    GetDataBy() {
      var param = {
        option_url: "/MK/MK_NewProspect",
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
          contact_phone_no: data.contact_phone_no,
          customer_status: data.customer_status
          // path_file: this.url + data.path_file
        };
        if (data.path_file == "" || data.path_file == null) {
          this.M_NewProspect.path_file = require("@/assets/default_photo_.png");
        } else {
          this.M_NewProspect.path_file = this.url + data.path_file;
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

<style>
</style>