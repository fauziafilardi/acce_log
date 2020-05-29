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
              <b-form
                :data-vv-scope="'ADM_AddDriverManagement'"
                :data-vv-value-path="'ADM_AddDriverManagement'"
              >
                <b-row>
                  <b-col md="2" style="text-align: center;">
                    <img :src="require('@/assets/user.png')" alt style="width: 90px;" />
                  </b-col>
                  <b-col md="10">
                    <b-row>
                      <b-col md="12">
                        <b-row>
                          <b-col>
                            <span>
                              <label
                                style="font-size: 15px; color: blue;"
                              >{{M_DriverManagement.driver_name}}</label>
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
                      </b-col>
                    </b-row>
                    <b-row class="row-view" style="padding-bottom: 10px;">
                      <b-col>
                        <span>
                          <font-awesome-icon
                            class="icon-style-default"
                            icon="phone-square-alt"
                            size="sm"
                          />
                          &nbsp; &nbsp;
                          {{ M_DriverManagement.handphone }}
                        </span>
                        <br />
                        <span>
                          <font-awesome-icon
                            class="icon-style-default"
                            icon="map-marker-alt"
                            size="sm"
                          />
                          &nbsp; &nbsp;
                          {{ M_DriverManagement.address }}
                        </span>
                      </b-col>
                    </b-row>

                    <b-row>
                      <b-col style="max-width: 160px !important">
                        <span>
                          <font-awesome-icon class="icon-style-default" icon="user" size="sm" />&nbsp; &nbsp;
                          User
                        </span>
                      </b-col>
                      <b-col>
                        <span>
                          : &nbsp; &nbsp;
                          {{ M_DriverManagement.user_name }}
                        </span>
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col style="max-width: 160px !important">
                        <span>
                          <font-awesome-icon
                            class="icon-style-default"
                            icon="calendar-alt"
                            size="sm"
                          />&nbsp; &nbsp;
                          Date Added
                        </span>
                      </b-col>
                      <b-col>
                        <span>
                          : &nbsp; &nbsp;
                          {{ M_DriverManagement.date_add }}
                        </span>
                      </b-col>
                    </b-row>
                    <template v-for="(doc, index) in M_SIM">
                      <b-row v-bind:key="index">
                        <b-col style="max-width: 160px !important">
                          <span>
                            <font-awesome-icon
                              class="icon-style-default"
                              icon="clipboard"
                              size="sm"
                            />&nbsp; &nbsp;
                            SIM No.
                          </span>
                        </b-col>
                        <b-col>
                          <span>
                            : &nbsp; &nbsp;
                            {{ doc.no }}
                          </span>
                        </b-col>
                      </b-row>
                      <b-row v-bind:key="index">
                        <b-col style="max-width: 160px !important">
                          <span>
                            <font-awesome-icon
                              class="icon-style-default"
                              icon="calendar-alt"
                              size="sm"
                            />&nbsp; &nbsp;
                            SIM Expire
                          </span>
                        </b-col>
                        <b-col>
                          <span>
                            : &nbsp; &nbsp;
                            {{ momentDate(new Date(doc.exp)) }}
                          </span>
                        </b-col>
                      </b-row>
                      <b-row
                        v-bind:key="index"
                        v-show="doc.file_logo_name && doc.file_logo_name !== ''"
                      >
                        <b-col style="max-width: 160px !important">
                          <span>
                            <font-awesome-icon
                              class="icon-style-default"
                              icon="paperclip"
                              size="sm"
                            />&nbsp; &nbsp;
                            SIM
                          </span>
                        </b-col>
                        <b-col>
                          <span>
                            : &nbsp; &nbsp;
                            <span>
                              <label
                                style="color: blue; cursor: pointer;"
                                @click="onPictClick(doc)"
                              >{{doc.file_logo_name}}</label>
                            </span>
                          </span>
                        </b-col>
                      </b-row>
                    </template>
                    <template v-for="(doc, index) in M_KTP">
                      <b-row v-bind:key="index">
                        <b-col style="max-width: 160px !important">
                          <span>
                            <font-awesome-icon
                              class="icon-style-default"
                              icon="clipboard"
                              size="sm"
                            />&nbsp; &nbsp;
                            KTP No.
                          </span>
                        </b-col>
                        <b-col>
                          <span>
                            : &nbsp; &nbsp;
                            {{ doc.no }}
                          </span>
                        </b-col>
                      </b-row>
                      <b-row v-bind:key="index">
                        <b-col style="max-width: 160px !important">
                          <span>
                            <font-awesome-icon
                              class="icon-style-default"
                              icon="calendar-alt"
                              size="sm"
                            />&nbsp; &nbsp;
                            KTP Expire
                          </span>
                        </b-col>
                        <b-col>
                          <span>
                            : &nbsp; &nbsp;
                            {{ momentDate(new Date(doc.exp)) }}
                          </span>
                        </b-col>
                      </b-row>
                      <b-row
                        v-bind:key="index"
                        v-show="doc.file_logo_name && doc.file_logo_name !== ''"
                      >
                        <b-col style="max-width: 160px !important">
                          <span>
                            <font-awesome-icon
                              class="icon-style-default"
                              icon="paperclip"
                              size="sm"
                            />&nbsp; &nbsp;
                            KTP
                          </span>
                        </b-col>
                        <b-col>
                          <span>
                            : &nbsp; &nbsp;
                            <span>
                              <label
                                style="color: blue; cursor: pointer;"
                                @click="onPictClick(doc)"
                              >{{doc.file_logo_name}}</label>
                            </span>
                          </span>
                        </b-col>
                      </b-row>
                    </template>
                    <template v-for="(doc, index) in M_Doc">
                      <b-row v-bind:key="index">
                        <b-col style="max-width: 160px !important">
                          <span>
                            <font-awesome-icon
                              class="icon-style-default"
                              icon="clipboard"
                              size="sm"
                            />&nbsp; &nbsp;
                            Other Document No.
                          </span>
                        </b-col>
                        <b-col>
                          <span>
                            : &nbsp; &nbsp;
                            {{ doc.no }}
                          </span>
                        </b-col>
                      </b-row>
                      <b-row v-bind:key="index">
                        <b-col style="max-width: 160px !important">
                          <span>
                            <font-awesome-icon
                              class="icon-style-default"
                              icon="calendar-alt"
                              size="sm"
                            />&nbsp; &nbsp;
                            Other Document Expire
                          </span>
                        </b-col>
                        <b-col>
                          <span>
                            : &nbsp; &nbsp;
                            {{ momentDate(new Date(doc.exp)) }}
                          </span>
                        </b-col>
                      </b-row>
                      <b-row
                        v-bind:key="index"
                        v-show="doc.file_logo_name && doc.file_logo_name !== ''"
                      >
                        <b-col style="max-width: 160px !important">
                          <span>
                            <font-awesome-icon
                              class="icon-style-default"
                              icon="paperclip"
                              size="sm"
                            />&nbsp; &nbsp;
                            Other Document
                          </span>
                        </b-col>
                        <b-col>
                          <span>
                            : &nbsp; &nbsp;
                            <span>
                              <label
                                style="color: blue; cursor: pointer;"
                                @click="onPictClick(doc)"
                              >{{doc.file_logo_name}}</label>
                            </span>
                          </span>
                        </b-col>
                      </b-row>
                    </template>
                    <b-row>
                      <b-col style="max-width: 160px !important">
                        <span>
                          <font-awesome-icon
                            class="icon-style-default"
                            icon="sticky-note"
                            size="sm"
                          />&nbsp; &nbsp;
                          Notes
                        </span>
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col>
                        <span>{{ M_DriverManagement.notes }}</span>
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
      M_DriverManagement: {
        user_name: this.getDataUser().user_name,
        plate_no: "",
        driver_name: "",
        address: "",
        driver_nameLabel: "",
        descs: "",
        driver1: "",
        handphone: "",
        driver2: "",
        driver2Label: "",
        notes: "",
        lastupdatestamp: ""
      },
      M_KTP: [],
      M_SIM: [],
      M_Doc: [],
      default_pic: require("@/assets/default_photo_.png")
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
    },
    inputStatus() {
      var param = this.$route.params;
      if (param.isEdit && param.isEdit === true) {
        return "edit";
      } else {
        return "new";
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
    onPictClick(data) {
      // console.log(data)
      window.open(data.file_show);
    },
    GetDataBy() {
      var param = {
        option_url: "/ADM/ADM_DriverManagement",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };

      this.getJSON(this.getUrlCRUD(this.paramFromList.row_id), param).then(
        response => {
          // response from API
          if (response == null) return;

          var data = response.Data[0];

          this.M_DriverManagement = {
            user_name: this.getDataUser().user_name,
            driver_name: data.driver_name,
            handphone: data.handphone,
            address: data.address,
            notes: data.remarks,
            date_add: this.momentDate(new Date(data.time_input))
          };

          this.M_KTP = [];
          this.M_SIM = [];
          this.M_Doc = [];

          // this.$nextTick(() => {
          response.Data.forEach((dtl, index) => {
            console.log(dtl);
            if (dtl.dt_doc_type == "K") {
              this.M_KTP.push({
                no: dtl.dt_doc_no,
                exp: dtl.dt_expiry_date,
                file_logo: dtl.dt_doc_file_name,
                file_logo_name: dtl.dt_doc_file_name,
                file_logo_path: dtl.dt_doc_path_file,
                file_show: this.url + dtl.dt_doc_path_file,
                type: dtl.dt_doc_type,
                status: "E"
              });
            } else if (dtl.dt_doc_type == "S") {
              this.M_SIM.push({
                no: dtl.dt_doc_no,
                exp: dtl.dt_expiry_date,
                file_logo: dtl.dt_doc_file_name,
                file_logo_name: dtl.dt_doc_file_name,
                file_logo_path: dtl.dt_doc_path_file,
                file_show: this.url + dtl.dt_doc_path_file,
                type: dtl.dt_doc_type,
                status: "E"
              });
            } else if (dtl.dt_doc_type == "O") {
              this.M_Doc.push({
                no: dtl.dt_doc_no,
                exp: dtl.dt_expiry_date,
                file_logo: dtl.dt_doc_file_name,
                file_logo_name: dtl.dt_doc_file_name,
                file_logo_path: dtl.dt_doc_path_file,
                file_show: this.url + dtl.dt_doc_path_file,
                type: dtl.dt_doc_type,
                status: "E"
              });
            }
          });
          // })

          // this.$forceUpdate();

          // console.log(this.M_KTP)
          // console.log(this.M_SIM)
          // console.log(this.M_Doc)
        }
      );
    }
  },
  mounted() {
    // this.M_ClearForm();
    // if (this.inputStatus == "edit") {
    this.GetDataBy();
    // }
  }
};
</script>

<style>
</style>