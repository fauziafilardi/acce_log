<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Driver Management</span>
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
              <b-form :data-vv-scope="'MK_AddQuotation'" :data-vv-value-path="'MK_AddQuotation'">
                <b-row>
                  <b-col md="2" style="text-align: center;">
                    <img :src="require('@/assets/user.png')" alt style="width: 70px;" />
                  </b-col>
                  <b-col md="10">
                    <b-row>
                      <b-col md="12">
                        <b-row>
                          <b-col>
                            <span>{{ M_DriverManagement.user_name }}</span>
                            <br />
                            <span>
                              <font-awesome-icon
                                class="icon-style-default"
                                icon="phone-square-alt"
                                size="sm"
                              />
                              &nbsp;
                              {{ M_DriverManagement.hand_phone }}
                            </span>
                            <br />
                            <span>
                              <font-awesome-icon
                                class="icon-style-default"
                                icon="map-marker-alt"
                                size="sm"
                              />
                              {{ M_DriverManagement.fulladdress }}
                            </span>
                            &nbsp;
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
                      </b-col>
                      <!-- <b-col style="text-align: right;">
                        <span>
                          <ABSButton
                            :text="'Add New'"
                            classButton="btn btn--default"
                            classIcon="icon-style-1"
                            @click="doAdd"
                          />
                        </span>
                      </b-col>-->
                    </b-row>
                    <hr />
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
      M_DriverManagement: {
        path_file: "",
        user_name: "",
        hand_phone: "",
        fulladdress: "",
        email: "",
        role: "",
        notes: ""
      },
      M_User: {
        name: "",
        phone_no: "",
        address: ""
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
      this.$router.push({ name: "ADM_AddDriverManagement", params: param });
    },
    GetUserData() {
      var param = {
        option_function_cd: "GetUserInfo",
        module_cd: "SS",
        user_id: this.getDataUser().user_id
      };

      this.CallFunction(param).then(response => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];
        this.M_User.name = data.user_name;
        this.M_User.phone_no = data.hand_phone;
        this.M_User.address = data.address;
      });
    },
    GetDataBy() {
      var param = {
        option_url: "/ADM/ADM_DriverManagement",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };

      this.getJSON(this.getUrlCRUD(), param).then(response => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];
        this.M_DriverManagement = {
          user_name: data.driver_name,
          hand_phone: data.handphone,
          fulladdress: data.address,
          notes: data.remarks
        };
      });
    }
  },
  mounted() {
    this.GetDataBy();
  }
};
</script>

<style>
</style>