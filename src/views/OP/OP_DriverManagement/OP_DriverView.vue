<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>View Driver</span>
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
                          <label>Employee Id</label>
                        </span>
                        <br/>
                        <span>
                          <label>{{M_FmDriver.employee_id}}</label>
                        </span>
                      </b-col>
                      <b-col style = "text-align: right;" >
                        <span>
                          <ABSButton
                            :text = "'Edit'"
                            classButton = "btn btn--default"
                            classIcon = "icon-style-1"
                            @click = "doEdit"
                          />
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Driver Name</label>
                        </span>
                        <br/>
                        <span>
                          <label>{{M_FmDriver.driver_name}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Handphone</label>
                        </span>
                        <br/>
                        <span>
                          <label>{{M_FmDriver.handphone}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Ktp</label>
                        </span>
                        <br/>
                        <span>
                          <label>{{M_FmDriver.ktp}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Npwp</label>
                        </span>
                        <br/>
                        <span>
                          <label>{{M_FmDriver.npwp}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Sim</label>
                        </span>
                        <br/>
                        <span>
                          <label>{{M_FmDriver.sim}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Sim Expiry Date</label>
                        </span>
                        <br/>
                        <span>
                          <label>{{M_FmDriver.sim_expiry_date}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Skck</label>
                        </span>
                        <br/>
                        <span>
                          <label>{{M_FmDriver.skck}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Skck Expiry Date</label>
                        </span>
                        <br/>
                        <span>
                          <label>{{M_FmDriver.skck_expiry_date}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Employee Status</label>
                        </span>
                        <br/>
                        <span>
                          <label>{{M_FmDriver.employee_status}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Employee Expiry Date</label>
                        </span>
                        <br/>
                        <span>
                          <label>{{M_FmDriver.employee_expiry_date}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Emergency Contact Name</label>
                        </span>
                        <br/>
                        <span>
                          <label>{{M_FmDriver.emergency_contact_name}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Emergency Relation</label>
                        </span>
                        <br/>
                        <span>
                          <label>{{M_FmDriver.emergency_relation}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Emergency Phone No</label>
                        </span>
                        <br/>
                        <span>
                          <label>{{M_FmDriver.emergency_phone_no}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Emergency Remarks</label>
                        </span>
                        <br/>
                        <span>
                          <label>{{M_FmDriver.emergency_remarks}}</label>
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

      M_FmDriver :{
        fm_driver_id : 0,
        ss_portfolio_id : 0,
        employee_id : '',
        driver_name : '',
        handphone : '',
        ktp : '',
        npwp : '',
        sim : '',
        sim_expiry_date : '',
        skck : '',
        skck_expiry_date : '',
        employee_status : '',
        employee_expiry_date : '',
        emergency_contact_name : '',
        emergency_relation : '',
        emergency_phone_no : '',
        emergency_remarks : '',
        dt_doc_file_name : '',
        dt_doc_path_file : '',
        user_input : '',
        user_edit : '',
        time_input : '',
        time_edit : '',
        row_id : 0,
        lastupdatestamp : 0
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
    doEdit() {
      var param = this.paramFromList;
      param.isView = false;
      param.isEdit = true;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "OP_DriverForm", params: param });
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
      var param = {
        option_url: "/OP/OP_Driver",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };

      this.getJSON(this.getUrlCRUD(), param).then(response => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];

      this.M_FmDriver  = {
        fm_driver_id : data.fm_driver_id,
        ss_portfolio_id : data.ss_portfolio_id,
        employee_id : data.employee_id__tb_1,
        driver_name : data.driver_name__tb_2,
        handphone : data.handphone__tb_3,
        ktp : data.ktp__tb_4,
        npwp : data.npwp__tb_5,
        sim : data.sim__tb_6,
        sim_expiry_date : data.sim_expiry_date__tb_7,
        skck : data.skck__tb_8,
        skck_expiry_date : data.skck_expiry_date__tb_9,
        employee_status : data.employee_status__tb_10,
        employee_expiry_date : data.employee_expiry_date__tb_11,
        emergency_contact_name : data.emergency_contact_name__tb_12,
        emergency_relation : data.emergency_relation__tb_13,
        emergency_phone_no : data.emergency_phone_no__tb_14,
        emergency_remarks : data.emergency_remarks__tb_15,
        dt_doc_file_name : data.dt_doc_file_name,
        dt_doc_path_file : data.dt_doc_path_file,
        user_input : data.user_input,
        user_edit : data.user_edit,
        time_input : data.time_input,
        time_edit : data.time_edit,
        row_id : data.row_id,
        lastupdatestamp : data.lastupdatestamp
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
