<template>
  <div class="card" style="height: 95%;">
    <div class="card__title">
      <b-row>
        <b-col style="max-width:fit-content !important;">
          <span>New Prospect</span>
        </b-col>
        <b-col style="text-align: right;">
          <span>
            <ABSButton
              :text="'Add New'"
              classButton="button button--new"
              classIcon="icon-style-1"
              :disabled="false"
              @click="doAddNewProspect"
            />
          </span>

          <span>
            <ABSButton
              :text="'View All'"
              classButton="button button--new"
              classIcon="icon-style-1"
              :disabled="false"
              @click="doViewAllProspect"
            />
          </span>
        </b-col>
      </b-row>
    </div>
    <div class="card__body">
      <b-row>
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
      </b-row>
      <b-row class="row-dash-new-prospect-top">
        <b-col>
          <div class="buleth__blue">
            <span>{{ DataProspect.target}}</span>
          </div>
          <div class="buleth-text" style="margin-top: 0px !important;">Target</div>
        </b-col>
        <b-col>
          <div class="buleth__green">
            <span>{{ DataProspect.achievement }}</span>
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
                    <!-- <div class="container"> -->
                      <b-col style="text-align: center">
                        <b-col>
                          <span class="buleth-text isGrey" style="font-size:12px;">Target</span>
                        </b-col>
                        <b-col>
                          <h4 class="isGrey">
                            <b>{{ DataProspect.targetPoint}}</b>
                          </h4>
                        </b-col>
                      </b-col>
                    <!-- </div> -->
                  </div>
                </b-col>

                <b-col md="4">
                  <div class="card">
                    <!-- <div class="container"> -->
                      <b-col style="text-align: center">
                        <b-col>
                          <span class="buleth-text isGrey" style="font-size:12px;">Achievement</span>
                        </b-col>
                        <b-col>
                          <h4 class="isGrey">
                            <b>{{ DataProspect.achievementPoint}}</b>
                          </h4>
                        </b-col>
                      </b-col>
                    <!-- </div> -->
                  </div>
                </b-col>

                <b-col md="4">
                  <div class="card">
                    <!-- <div class="container"> -->
                      <b-col style="text-align: center">
                        <b-col>
                          <span class="buleth-text isGrey" style="font-size:12px;">Pending</span>
                        </b-col>
                        <b-col>
                          <h4 class="isGrey">
                            <b>{{DataProspect.pendingPoint}}</b>
                          </h4>
                        </b-col>
                      </b-col>
                    <!-- </div> -->
                  </div>
                </b-col>
              </b-row>

              <!-- <b-row>
                <b-col>
                  <span class="prospect__content">Target</span>
                </b-col>
                <b-col>
                  <span class="prospect__content">: {{ DataProspect.targetPoint}} Point</span>
                </b-col>
              </b-row>
              <b-row>
                <b-col>
                  <span class="prospect__content">Achievement Point</span>
                </b-col>
                <b-col>
                  <span class="prospect__content">: {{ DataProspect.achievementPoint}} Point</span>
                </b-col>
              </b-row>-->
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
  methods: {
    doAddNewProspect() {
      var url = "MK_AddNewProspect";
      if (!url || url == "" || url == undefined) return;
      var param = {
        // option_url: this.getOptionUrl(),
        // title: this.title,
        isEdit: false
      };
      this.$router.push({ name: url, params: param });
    },
    doViewAllProspect() {
      var url = "MK_DashboardProspect";
      if (!url || url == "" || url == undefined) return;
      var param = {
        // option_url: this.getOptionUrl(),
        // title: this.title,
        isEdit: false
      };
      this.$router.push({ name: url, params: param });
    },
    getProspect(date = null) {
      var now = date ? new Date(date) : new Date();
      var month = now.getMonth();
      var year = now.getFullYear();

      this.DataProspect = {
        month: month + 1,
        monthName: this.getMonthName(now),
        year: year,
        target: 0,
        achievement: 0,
        targetPoint: 0,
        achievementPoint: 0,
        pendingPoint: 0
      };

      var param = {
        option_function_cd: "GetNewProspectDash",
        module_cd: "MK",
        ss_portfolio_id: this.getDataUser().portfolio_id,
        user_id: this.getDataUser().user_id,
        years: year,
        months: month + 1
      };
      this.CallFunction(param).then(ress => {
        if (ress == null) return;

        if (ress.Data.length > 0) {
          var data = ress.Data[0];

          this.DataProspect = {
            month: month + 1,
            monthName: this.getMonthName(now),
            year: year,
            target: data.target_prospect,
            achievement: data.achievement_prospect,
            targetPoint: data.monthly_point_target,
            achievementPoint: data.monthly_point_achievement
              ? data.monthly_point_achievement
              : 0,
            pendingPoint: data.monthly_point_pending
          };
        } else {
          this.DataProspect = {
            month: month + 1,
            monthName: this.getMonthName(now),
            year: year,
            target: 0,
            achievement: 0,
            targetPoint: 0,
            achievementPoint: 0,
            pendingPoint: 0
          };
        }
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

      this.getProspect(date);
    }
  },
  mounted() {
    this.getProspect();
  }
};
</script>