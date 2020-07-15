<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card">
            <div class="card__title" style="padding-bottom: 5px !important;">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Target & Achievement</span>
                </b-col>
                <b-col style="max-width: fit-content !important;">
                  <span @click="changeProspect('min')" style="cursor: pointer;">
                    <font-awesome-icon class="isGrey" icon="less-than" size="lg" />
                  </span>
                </b-col>
                <b-col style="text-align: center">
                  <span>
                    <h6 class="isGrey">{{ DataProspect.monthName + ' ' + DataProspect.year }}</h6>
                  </span>
                </b-col>
                <b-col style="text-align: right;max-width: fit-content !important;">
                  <span @click="changeProspect('add')" style="cursor: pointer;">
                    <font-awesome-icon class="isGrey" icon="greater-than" size="lg" />
                  </span>
                </b-col>
                <b-col md="3" class="col-right">
                  <span>
                    <ABSButton
                      :text="'Back'"
                      classButton="button button--back2"
                      classIcon="icon-style-1"
                      @click="doBack"
                    />
                  </span>
                </b-col>
              </b-row>
            </div>
          </div>
        </b-col>
        <!-- <div> -->
        <!-- {{dataList}} -->
        <b-col md="6" v-for="(data,index) in M_Marketing" v-bind:key="index">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>{{data.marketing_name}}</span>
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <b-row class="row-dash-new-prospect-top">
                <b-col>
                  <div class="buleth__blue">
                    <span>{{data.target_prospect }}</span>
                  </div>
                  <div class="buleth-text" style="margin-top: 0px !important;">Target</div>
                </b-col>
                <b-col>
                  <div class="buleth__green">
                    <span>{{data.achievement_prospect}}</span>
                  </div>
                  <div class="buleth-text" style="margin-top: 0px !important;">Achievement</div>
                </b-col>
              </b-row>

              <b-row class="row-dash-new-prospect-bottom">
                <b-col>
                  <div class="prospect">
                    <div class="prospect__title">Monthly Point</div>
                    <div class="prospect__body">
                      <b-row>
                        <b-col md="4">
                          <div class="card">
                            <div class="container">
                              <b-col style="text-align: center">
                                <b-col>
                                  <span class="buleth-text isGrey">Target</span>
                                </b-col>
                                <b-col>
                                  <h4 class="isGrey">
                                    <b>{{ data.monthly_point_target }}</b>
                                  </h4>
                                </b-col>
                              </b-col>
                            </div>
                          </div>
                        </b-col>

                        <b-col md="4">
                          <div class="card">
                            <div class="container">
                              <b-col style="text-align: center">
                                <b-col>
                                  <span class="buleth-text isGrey">Achievement</span>
                                </b-col>
                                <b-col>
                                  <h4 class="isGrey">
                                    <b>{{ data.monthly_point_achievement}}</b>
                                  </h4>
                                </b-col>
                              </b-col>
                            </div>
                          </div>
                        </b-col>

                        <b-col md="4">
                          <div class="card">
                            <div class="container">
                              <b-col style="text-align: center">
                                <b-col>
                                  <span class="buleth-text isGrey">Pending</span>
                                </b-col>
                                <b-col>
                                  <h4 class="isGrey">
                                    <b>{{ data.monthly_point_pending}}</b>
                                  </h4>
                                </b-col>
                              </b-col>
                            </div>
                          </div>
                        </b-col>
                      </b-row>
                      <!-- <b-row>
                        <b-col>
                          <span class="prospect__content">Target</span>
                        </b-col>
                        <b-col>
                          <span class="prospect__content">: {{ data.monthly_point_target }} Point</span>
                        </b-col>
                      </b-row>
                      <b-row>
                        <b-col>
                          <span class="prospect__content">Achievement Point</span>
                        </b-col>
                        <b-col>
                          <span
                            class="prospect__content"
                          >: {{ data.monthly_point_achievement}} Point</span>
                        </b-col>
                      </b-row>-->
                    </div>
                  </div>
                </b-col>
              </b-row>
            </div>
          </div>
        </b-col>
        <!-- </div> -->
      </b-row>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      M_Marketing: [],
      DataProspect: {
        month: "",
        monthName: "",
        year: "",
        target: 0,
        achievement: 0,
        targetPoint: 0,
        achievementPoint: 0,
        pendingPoint: 0
      }
    };
  },
  computed: {},
  methods: {
    doBack() {
      this.$router.go(-1);
    },
    getMarketingProspect(date = null) {
      var now = date ? new Date(date) : new Date();
      var month = now.getMonth();
      var year = now.getFullYear();

      this.DataProspect = {
        month: month + 1,
        monthName: this.getMonthName(now),
        year: year
      };
      this.M_Marketing = [];
      var param = {
        option_function_cd: "GetNewProspectDashDt",
        module_cd: "MK",
        ss_portfolio_id: this.getDataUser().portfolio_id,
        user_id: this.getDataUser().user_id,
        years: year,
        months: month + 1
      };
      this.CallFunction(param).then(ress => {
        if (ress == null) return;
        var data = ress.Data;
        for (let i = 0; i < data.length; i++) {
          this.M_Marketing.push({
            marketing_id: data[i].marketing_id,
            marketing_name: data[i].marketing_name,
            target_prospect: data[i].target_prospect,
            achievement_prospect: data[i].achievement_prospect,
            monthly_point_target: data[i].monthly_point_target,
            monthly_point_achievement: data[i].monthly_point_achievement,
            monthly_point_pending: data[i].monthly_point_pending
          });
        }
        // console.log(this.M_Marketing);
      });
    },
    changeProspect(act) {
      var date = new Date();
      if (act === "min") {
        // var d = moment(date, 'YYYY-MM-DD').add(i, number)
        var mth =
          this.DataProspect.month && this.DataProspect.month !== ""
            ? parseInt(this.DataProspect.month)
            : 0;
        var year = this.DataProspect.year;
        mth = mth < 10 ? "0" + mth : mth;
        var frm = year + "-" + mth + "-" + "01";
        date = this.dateAdd2("m", frm, -1);
        // date = this.momentDateFormatting(date, frm)
      } else if (act === "add") {
        var mth =
          this.DataProspect.month && this.DataProspect.month !== ""
            ? parseInt(this.DataProspect.month)
            : 0;
        var year = this.DataProspect.year;
        mth = mth < 10 ? "0" + mth : mth;
        var frm = year + "-" + mth + "-" + "01";
        date = date = this.dateAdd2("m", frm, 1);
        // date = this.momentDateFormatting(date, frm)
      }

      this.getMarketingProspect(date);
    }
  },
  mounted() {
    this.getMarketingProspect();
  },
  created() {}
};
</script>

<style>
</style>