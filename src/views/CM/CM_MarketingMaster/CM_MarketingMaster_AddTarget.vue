<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Marketing Master - Add Target</span>
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
                  <b-col md="12" style="text-align: center;">
                    <b-row>
                      <b-col md="3">
                          Marketing &nbsp;&nbsp;
                      </b-col>
                      <b-col md="3">
                          <b-form-select
                              id="cmbMarketing"
                              v-model="M_Target.marketing_id"
                              :options="cmbMarketing"
                              style="height: 22px !important; width: 100% !important; margin-bottom: 5px;"
                          ></b-form-select>
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="3">
                          Year &nbsp;&nbsp;
                      </b-col>
                      <b-col md="3">
                          <b-form-select
                              id="cmbYear"
                              v-model="M_Target.year"
                              :options="cmbYear"
                              style="height: 22px !important; width: 100% !important; margin-bottom: 5px;"
                          ></b-form-select>
                      </b-col>
                    </b-row>
                    <b-row style="margin-top: 10px;">
                      <b-col md="3" offset="3">
                        <ABSButton
                          :text="'Save'"
                          classButton="btn btn--default"
                          classIcon="icon-style-default"
                          @click="doSave"
                          styleButton="height: 40px;width: 100%;"
                        />
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
      M_Target: {
        marketing_id: '',
        year: ''
      },
      cmbMarketing: [],
      cmbYear: []
    };
  },
  computed: {
  },
  methods: {
    doBack() {
      this.$router.go(-1);
    },
    doSave() {
    //   this.alertConfirmation("Are You Sure Want To Save This Data ?").then(ress => {
    //     if (ress.value) {
          this.M_Save();
    //     }
    //   });
    },
    M_Save() {
      var param = {
        option_url: "/CM/CM_MarketingMaster",
        line_no: 3,
        marketing_id: this.M_Target.marketing_id,
        years: this.M_Target.year,
        user_input: this.getDataUser().user_id
      };

      this.postJSON(this.getUrlCRUD(), param).then(response => {
        // console.log(response)
        if (response == null) return;
        this.$router.replace({ name: "CM_MarketingMaster_Target", params: this.M_Target });
        // this.alertSuccess(response.Message).then(() => {
          // this.doBack();
          
        // });
      });
    },
    getYear() {
        var param = {
            option_function_cd: "GetYearMarketingTarget",
            module_cd: "MK",
            user_id: this.getDataUser().user_id
        };
        
        this.CallFunction(param).then(response => {
            if (response == null) return
            var data = response.Data;

            this.M_Target.year = data[0].years;

            for (let i = 0; i < data.length; i++) {
                this.cmbYear.push({value: data[i].years, text: data[i].years});
            }
        })
    },
    getMarketing() {
        var param = {
            option_function_cd: "GetMarketingTeam",
            module_cd: "MK",
            user_id: this.getDataUser().user_id
        };

        this.CallFunction(param).then(response => {
            if (response == null) return
            var data = response.Data;

            this.M_Target.marketing_id = data[0].marketing_id;

            for (let i = 0; i < data.length; i++) {
                this.cmbMarketing.push({value: data[i].marketing_id, text: data[i].marketing_name});
            }

            this.getYear();
        })
    },
  },
  mounted() {
    this.getMarketing();
  }
};
</script>

<style>
</style>