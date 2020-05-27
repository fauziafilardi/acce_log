<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>User Management</span>
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
                    <div>
                      <img
                        :src="M_UserManagement.path_file"
                        alt
                        style="width:100px; border-radius:50px"
                      />
                    </div>
                  </b-col>
                  <b-col md="10">
                    <b-row>
                      <b-col md="12">
                        <b-row>
                          <b-col>
                            <span>
                              <label
                                style="font-size: 15px; color: blue;"
                              >{{M_UserManagement.user_name}}</label>
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
                        <b-row>
                          <b-col>
                            <span>
                              <font-awesome-icon
                                class="icon-style-default"
                                icon="phone-square-alt"
                                size="sm"
                              />
                              {{ M_UserManagement.hand_phone }}
                            </span> &nbsp;
                            <br />
                            <span>
                              <font-awesome-icon
                                class="icon-style-default"
                                icon="map-marked-alt"
                                size="sm"
                              />
                              {{ M_UserManagement.fulladdress }}
                            </span>
                            <br />
                            <span>
                              <font-awesome-icon
                                class="icon-style-default"
                                icon="envelope"
                                size="sm"
                              />
                              {{ M_UserManagement.email }}
                            </span>
                            <br />
                            <span>
                              <font-awesome-icon
                                class="icon-style-default"
                                icon="sliders-h"
                                size="sm"
                              />
                              {{ M_UserManagement.role }}
                            </span>
                            <br />
                            <span>
                              <font-awesome-icon
                                class="icon-style-default"
                                icon="sticky-note"
                                size="sm"
                              />Notes
                            </span>
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col>
                            <span>{{ M_UserManagement.notes }}</span>
                          </b-col>
                        </b-row>
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
      M_UserManagement: {
        path_file: "",
        user_name: "",
        hand_phone: "",
        fulladdress: "",
        email: "",
        role: "",
        notes: ""
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
      this.$router.push({ name: "ADM_AddUserManagement", params: param });
    },
    GetDataBy() {
      var param = {
        // id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };

      this.getJSON(this.getUrlAPIUser(this.paramFromList.row_id), param).then(
        response => {
          // response from API

          if (response == null) return;

          var data = response.Data;

          this.M_UserManagement = {
            user_name: data.user_name,
            hand_phone: data.hand_phone,
            fulladdress: data.address,
            email: data.email,
            role: data.group_descs,
            notes: data.notes,
            path_file:
              data.path_file == null || data.path_file == ""
                ? require("@/assets/avatar.png")
                : data.path_file
          };
        }
      );
    }
  },
  mounted() {
    this.GetDataBy();
  }
};
</script>

<style>
</style>