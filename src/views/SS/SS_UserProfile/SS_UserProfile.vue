<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Profile</span>
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
                    <div class="image">
                      <img
                        :src="M_UserProfile.path_file"
                        alt
                        style="width: 100%; border-radius: 50px;"
                      />
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
                          <label>{{M_UserProfile.user_name}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Job Title</label>
                        </span>
                        <br />
                        <span>
                          <label>{{M_UserProfile.job_title}}</label>
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
                          <label>{{M_UserProfile.address}}</label>
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
                          <label>{{M_UserProfile.email}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Phone No.</label>
                        </span>
                        <br />
                        <span>
                          <label>{{M_UserProfile.phone_no}}</label>
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
      M_UserProfile: {
        user_name: "",
        address: "",
        phone_no: "",
        email: "",
        website: "",
        job_title: "",
        path_file: ""
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
  methods: {
    doBack() {
      this.$router.go(-1);
    },
    doEdit() {},

    GetDataBy() {
      var param = {
        option_function_cd: "GetUserInfo",
        module_cd: "SS",
        user_id: this.getDataUser().user_id
      };

      this.CallFunction(param).then(response => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];
        this.M_GetDataBy = data;

        this.M_UserProfile = {
          user_name: data.user_name,

          address: data.address,
          phone_no: data.hand_phone,
          email: data.email,
          job_title: data.job_title

          // path_file: this.url + data.path_file
        };
        if (data.path_file == "" || data.path_file == null) {
          this.M_UserProfile.path_file = require("@/assets/default_photo_.png");
        } else {
          this.M_UserProfile.path_file = this.url + data.path_file;
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