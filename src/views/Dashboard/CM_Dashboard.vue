<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="4" @click="onMarketingSpecClick">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col>
                  <span style="float: left !important;">Marketing Spesification</span> &nbsp;
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <div style="width: 100%; text-align: center;">
                <font-awesome-icon style="color: #333399;" icon="cog" size="6x" />
                <br />
                <br />
                <span style="width: 75%">Setup Marketing Action and Working Days</span>
              </div>
            </div>
          </div>
        </b-col>
        <b-col md="4" @click="onMarketingMasterClick">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col>
                  <span style="float: left !important;">Marketing Master</span> &nbsp;
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <div style="width: 100%; text-align: center;">
                <font-awesome-icon style="color: #333399;" icon="cog" size="6x" />
                <br />
                <br />
                <span style="width: 75%">Manage Marketing Team and Customer List</span>
              </div>
            </div>
          </div>
        </b-col>
        <b-col md="4" @click="onCustomerStatusClick">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col>
                  <span style="float: left !important;">Customer Status</span> &nbsp;
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <div style="width: 100%; text-align: center;">
                <font-awesome-icon style="color: #333399;" icon="cog" size="6x" />
                <br />
                <br />
                <span style="width: 75%">Manage Customer Status and Description</span>
              </div>
            </div>
          </div>
        </b-col>
      </b-row>
    </div>
  </div>
</template>

<script>
// import ChartDataLabels from './../../dist/chartjs/chartjs-plugin-datalabels'
export default {
  data() {
    return {};
  },
  computed: {},
  methods: {
    onMarketingSpecClick() {
      this.$router.push({ name: "MK_MarketingSpec" });
    },
    onMarketingMasterClick() {
      this.$router.push({ name: "CM_MarketingMaster" });
    },
    onCustomerStatusClick() {
      this.$router.push({ name: "CM_MarketingCustomerStatus" });
    }
  },
  mounted() {}
};
</script>