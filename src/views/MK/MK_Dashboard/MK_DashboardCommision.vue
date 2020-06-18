<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card">
            <div class="card__title" style="padding-bottom: 5px !important;">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Commision</span>
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
        <b-col md="4" v-for="(data,index) in M_Marketing" v-bind:key="index">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>{{data.marketing_name}}</span>
                </b-col>
                <b-col style="text-align: right;">
                  <span>
                    <ABSButton
                      :text="'View Detail'"
                      classButton="button button--new"
                      classIcon="icon-style-1"
                      :disabled="false"
                      @click="doViewAllCommision"
                    />
                  </span>
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <b-row class="CommisionData">
                <b-col class="CommisionIcon">
                  <span>
                    <font-awesome-icon
                      style="color: #333399;margin-right: 20px;"
                      icon="coins"
                      size="4x"
                    />
                  </span>
                </b-col>
                <b-col style="margin: auto;">
                  <span class="Commision__TitleBlue">Paid</span> &nbsp;
                  <span class="CommisionTitle">(Last 12 Months)</span>
                  <br />
                  <span class="CommisionDescs">{{`Rp `+isCurrency(data.paid_amt, decimal)}}</span>
                </b-col>
              </b-row>
              <b-row class="CommisionData">
                <b-col class="CommisionIcon">
                  <span>
                    <font-awesome-icon
                      style="color: #cc0000;margin-right: 20px;"
                      icon="exclamation-circle"
                      size="4x"
                    />
                  </span>
                </b-col>
                <b-col style="margin: auto;">
                  <span class="Commision__TitleRed">Overdue</span> &nbsp;
                  <span class="CommisionTitle"></span>
                  <br />
                  <span class="CommisionDescs">{{`Rp `+isCurrency(data.overdue_amt, decimal)}}</span>
                </b-col>
              </b-row>
              <b-row class="CommisionData">
                <b-col class="CommisionIcon">
                  <span>
                    <font-awesome-icon
                      style="color: #00cc33;margin-right: 20px;"
                      icon="stopwatch"
                      size="5x"
                    />
                  </span>
                </b-col>
                <b-col style="margin: auto;">
                  <span class="Commision__TitleGreen">Pending</span> &nbsp;
                  <span class="CommisionTitle"></span>
                  <br />
                  <span class="CommisionDescs">{{`Rp `+isCurrency(data.pending_amt, decimal)}}</span>
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
      M_Marketing: []
    };
  },
  computed: {},
  methods: {
    doBack() {
      this.$router.go(-1);
    },
    getMarketingCommision() {
      //   this.DataCommision = {
      //     month: month + 1,
      //     monthName: this.getMonthName(now),
      //     year: year
      //   };
      this.M_Marketing = [];
      var param = {
        option_function_cd: "GetMkCommisionDashDt",
        module_cd: "MK",
        ss_portfolio_id: this.getDataUser().portfolio_id,
        user_id: this.getDataUser().user_id
      };
      this.CallFunction(param).then(ress => {
        if (ress == null) return;
        var data = ress.Data;
        for (let i = 0; i < data.length; i++) {
          this.M_Marketing.push({
            marketing_id: data[i].marketing_id,
            marketing_name: data[i].marketing_name,
            paid_amt: data[i].paid_amt,
            overdue_amt: data[i].overdue_amt,
            pending_amt: data[i].pending_amt
          });
        }
      });
    }
  },
  mounted() {
    this.getMarketingCommision();
  },
  created() {}
};
</script>

<style>
</style>