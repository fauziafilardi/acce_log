<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>View Driver Management</span>
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
                  <b-col>
                    <b-row>
                      <b-col style="text-align: right;">
                        <span>
                          <ABSButton
                            :text="'Delete'"
                            classButton="btn btn--default"
                            classIcon="icon-style-1"
                            @click="doDelete"
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
                  </b-col>
                </b-row>
                <br />
                <b-row>
                  <b-col md="2">
                    <div>
                      <div style="text-align: center;">
                        <font-awesome-icon class="icon-style-default" icon="user" size="10x" />
                      </div>
                    </div>
                  </b-col>
                  <b-col md="10">
                    <b-row>
                      <b-col md="6">
                        <b-row style="border: solid 1px #ccc; border-radius: 10px;">
                          <b-col md="12">
                            <b-row>
                              <b-col>
                                <span style="font-size: 15px; color: #333399; font-weight: bold;">
                                  <label>Driver Information</label>
                                </span>
                              </b-col>
                            </b-row>
                            <b-row>
                              <b-col md="12">
                                <span>
                                  <label>Employee ID</label>
                                </span>
                                <br />
                                <span>
                                  <label>{{M_FmDriver.employee_id}}</label>
                                </span>
                              </b-col>
                            </b-row>
                            <b-row>
                              <b-col md="12">
                                <span>
                                  <label>Full Name</label>
                                </span>
                                <br />
                                <span>
                                  <label>{{M_FmDriver.driver_name}}</label>
                                </span>
                              </b-col>
                            </b-row>
                            <b-row>
                              <b-col md="12">
                                <span>
                                  <label>Phone No.</label>
                                </span>
                                <br />
                                <span>
                                  <label>{{M_FmDriver.handphone}}</label>
                                </span>
                              </b-col>
                            </b-row>
                            <b-row>
                              <b-col md="12">
                                <span>
                                  <label>Ktp</label>
                                </span>
                                <br />
                                <span>
                                  <label>{{M_FmDriver.ktp}}</label>
                                </span>
                              </b-col>
                            </b-row>

                            <b-row>
                              <b-col md="12">
                                <span>
                                  <label>Npwp</label>
                                </span>
                                <br />
                                <span>
                                  <label>{{M_FmDriver.npwp}}</label>
                                </span>
                              </b-col>
                            </b-row>
                            <b-row>
                              <b-col md="7">
                                <span>
                                  <label>SIM</label>
                                </span>
                                <br />
                                <span>
                                  <label>{{M_FmDriver.sim}}</label>
                                </span>
                              </b-col>
                              <b-col md="5">
                                <span>
                                  <label>Valid Until</label>
                                </span>
                                <br />
                                <span>
                                  <label>{{M_FmDriver.sim_expiry_date}}</label>
                                </span>
                              </b-col>
                            </b-row>
                            <b-row>
                              <b-col md="7">
                                <span>
                                  <label>SKCK</label>
                                </span>
                                <br />
                                <span>
                                  <label>{{M_FmDriver.skck}}</label>
                                </span>
                              </b-col>
                              <b-col md="5">
                                <span>
                                  <label>Valid Until</label>
                                </span>
                                <br />
                                <span>
                                  <label>{{M_FmDriver.skck_expiry_date}}</label>
                                </span>
                              </b-col>
                            </b-row>
                            <b-row>
                              <b-col md="7">
                                <span>
                                  <label>Employee Status</label>
                                </span>
                                <br />
                                <span>
                                  <label>{{M_FmDriver.employee_status}}</label>
                                </span>
                              </b-col>
                              <b-col md="5">
                                <span>
                                  <label>Valid Until</label>
                                </span>
                                <br />
                                <span>
                                  <label>{{M_FmDriver.employee_expiry_date}}</label>
                                </span>
                              </b-col>
                            </b-row>
                          </b-col>
                        </b-row>
                      </b-col>
                      <b-col md="6">
                        <!-- di border -->
                        <b-row class="row-bordered" style="background-color: #ced4da;">
                          <b-col md="12">
                            <b-row style="margin-bottom: 10px">
                              <template v-for="(pict, index) in M_Picture">
                                <b-col
                                  style="max-width: fit-content !important;"
                                  v-bind:key="index"
                                >
                                  <img
                                    :id="'pict_'+index"
                                    :src="pict.file_show"
                                    alt
                                    style="width: 150px; cursor: pointer; "
                                    @click="showPict(pict)"
                                  />
                                </b-col>
                              </template>
                            </b-row>
                          </b-col>
                        </b-row>
                        <b-row
                          style="margin-top: 10px; border: solid 1px #ccc; border-radius: 10px;"
                        >
                          <b-col>
                            <b-row>
                              <b-col>
                                <span style="font-size: 15px; color: #333399; font-weight: bold;">
                                  <label>Emergency Contact</label>
                                </span>
                              </b-col>
                            </b-row>
                            <b-row>
                              <b-col md="6">
                                <span>
                                  <label>Full Name</label>
                                </span>
                                <br />
                                <span>
                                  <label>{{M_FmDriver.emergency_contact_name}}</label>
                                </span>
                              </b-col>
                              <b-col md="6">
                                <span>
                                  <label>Relation</label>
                                </span>
                                <br />
                                <span>
                                  <label>{{M_FmDriver.emergency_relation}}</label>
                                </span>
                              </b-col>
                            </b-row>
                            <b-row>
                              <b-col md="12">
                                <span>
                                  <label>Phone No.</label>
                                </span>
                                <br />
                                <span>
                                  <label>{{M_FmDriver.emergency_phone_no}}</label>
                                </span>
                              </b-col>
                            </b-row>
                            <b-row>
                              <b-col md="12">
                                <span>
                                  <label>Remarks</label>
                                </span>
                                <br />
                                <span>
                                  <label>{{M_FmDriver.emergency_remarks}}</label>
                                </span>
                              </b-col>
                            </b-row>
                          </b-col>
                        </b-row>
                      </b-col>
                    </b-row>
                  </b-col>
                </b-row>
              </b-form>
              <ABSModal id="Show_Picture" ref="Show_Picture" size="sm">
                <template slot="content">
                  <b-row>
                    <b-col md="12" style="text-align: center;">
                      <img id="show_pict" :src="M_ModalPict.file_show" alt style="width: 200px;" />
                    </b-col>
                  </b-row>
                </template>
              </ABSModal>
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
      M_FmDriver: {
        fm_driver_id: 0,
        ss_portfolio_id: 0,
        employee_id: "",
        driver_name: "",
        handphone: "",
        ktp: "",
        npwp: "",
        sim: "",
        sim_expiry_date: "",
        skck: "",
        skck_expiry_date: "",
        employee_status: "",
        employee_expiry_date: "",
        emergency_contact_name: "",
        emergency_relation: "",
        emergency_phone_no: "",
        emergency_remarks: "",
        dt_doc_file_name: "",
        dt_doc_path_file: "",
        user_input: "",
        user_edit: "",
        time_input: "",
        time_edit: "",
        row_id: 0,
        lastupdatestamp: 0
      },
      M_Picture: [],
      M_ModalPict: {
        file_logo: "",
        file_logo_name: "",
        file_logo_path: "",
        file_show: require("@/assets/default_photo_.png")
      }
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
    showPict(pict) {
      this.M_ModalPict = pict;
      this.$refs.Show_Picture._show();
    },
    doEdit() {
      var param = this.paramFromList;
      param.isView = false;
      param.isEdit = true;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "OP_DriverManagementForm", params: param });
    },
    doDelete() {
      this.alertConfirmation("Are You Sure Want To Delete This Data ?").then(
        ress => {
          if (ress.value) {
            this.M_Delete();
          }
        }
      );
    },
    M_Delete() {
      var param = {
        option_url: "/OP/OP_Driver",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };
      this.deleteJSON(this.getUrlCRUD(), param).then(response => {
        if (response == null) return;
        this.alertSuccess("Data Has Been Deleted").then(() => {
          this.doBack();
        });
      });
    },
    GetDataBy() {
      console.log(this.paramFromList);
      var param = {
        option_url: "/OP/OP_Driver",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };

      this.getJSON(this.getUrlCRUD(), param).then(response => {
        // response from API
        if (response == null) return;

        var data = response.Data;
        for (let i = 0; i < data.length; i++) {
          if (i === 0) {
            this.M_FmDriver = {
              fm_driver_id: data[i].fm_driver_id,
              ss_portfolio_id: data[i].ss_portfolio_id,
              employee_id: data[i].employee_id__tb_1,
              driver_name: data[i].driver_name__tb_2,
              handphone: data[i].handphone__tb_3,
              ktp: data[i].ktp__tb_4,
              npwp: data[i].npwp__tb_5,
              sim: data[i].sim__tb_6,
              sim_expiry_date: data[i].sim_expiry_date__tb_7,
              skck: data[i].skck__tb_8,
              skck_expiry_date: data[i].skck_expiry_date__tb_9,
              employee_status: data[i].employee_status__tb_10,
              employee_expiry_date: data[i].employee_expiry_date__tb_11,
              emergency_contact_name: data[i].emergency_contact_name__tb_12,
              emergency_relation: data[i].emergency_relation__tb_13,
              emergency_phone_no: data[i].emergency_phone_no__tb_14,
              emergency_remarks: data[i].emergency_remarks__tb_15,
              dt_doc_file_name: data[i].dt_doc_file_name,
              dt_doc_path_file: data[i].dt_doc_path_file,
              user_input: data[i].user_input,
              user_edit: data[i].user_edit,
              time_input: data[i].time_input,
              time_edit: data[i].time_edit,
              row_id: data[i].row_id,
              lastupdatestamp: data[i].lastupdatestamp
            };
          }
          this.M_Picture.push({
            file_logo: "dtfile_" + i,
            file_logo_name: data[i].dt_doc_file_name,
            file_logo_path: data[i].dt_doc_path_file,
            file_show:
              data[i].dt_doc_path_file && data[i].dt_doc_path_file !== ""
                ? this.url + data[i].dt_doc_path_file
                : require("@/assets/default_photo_.png")
          });
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
