<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>View FleetCarosery</span>
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
                          <label>Carosery Name</label>
                        </span>
                        <br/>
                        <span>
                          <label>{{M_FmFleetCarosery.carosery_name}}</label>
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
                          <label>Company Name</label>
                        </span>
                        <br/>
                        <span>
                          <label>{{M_FmFleetCarosery.company_name}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Pic</label>
                        </span>
                        <br/>
                        <span>
                          <label>{{M_FmFleetCarosery.pic}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Phone No</label>
                        </span>
                        <br/>
                        <span>
                          <label>{{M_FmFleetCarosery.phone_no}}</label>
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

      M_FmFleetCarosery :{
        fm_fleet_carosery_id : 0,
        ss_portfolio_id : 0,
        carosery_name : '',
        company_name : '',
        pic : '',
        phone_no : '',
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
      this.$router.push({ name: "OP_FleetCaroseryForm", params: param });
    },
	 M_Delete() {
      var param = {
        option_url: "/OP/OP_FleetCarosery",
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
        option_url: "/OP/OP_FleetCarosery",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };

      this.getJSON(this.getUrlCRUD(), param).then(response => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];

      this.M_FmFleetCarosery  = {
        fm_fleet_carosery_id : data.fm_fleet_carosery_id,
        ss_portfolio_id : data.ss_portfolio_id,
        carosery_name : data.carosery_name__tb_1,
        company_name : data.company_name__tb_2,
        pic : data.pic__tb_3,
        phone_no : data.phone_no__tb_4,
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
