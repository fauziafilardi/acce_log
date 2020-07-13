<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="4" @click="onPricingCostingClick">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col>
                  <span style="float: left !important;">Standard Pricing & Costing</span> &nbsp;
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <div style="width: 100%; text-align: center;">
                <font-awesome-icon style="color: #333399;" icon="cog" size="6x" />
                <br />
                <br />
                <span style="width: 75%">Standard Pricing & Costing Setup</span>
              </div>
            </div>
          </div>
        </b-col>
        <b-col md="4" @click="onCostTypeClick">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col>
                  <span style="float: left !important;">Cost Type</span> &nbsp;
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <div style="width: 100%; text-align: center;">
                <font-awesome-icon style="color: #333399;" icon="cog" size="6x" />
                <br />
                <br />
                <span style="width: 75%">Cost Type Setup</span>
              </div>
            </div>
          </div>
        </b-col>
        <b-col md="4" @click="onZoneClick">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col>
                  <span style="float: left !important;">Zone</span> &nbsp;
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <div style="width: 100%; text-align: center;">
                <font-awesome-icon style="color: #333399;" icon="cog" size="6x" />
                <br />
                <br />
                <span style="width: 75%">Zone Setup</span>
              </div>
            </div>
          </div>
        </b-col>
      </b-row>
      <b-row class="dashboardBody">
        <b-col md="4" @click="onQuotationCostingAdjusmentClick">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col>
                  <span style="float: left !important;">Quotation Costing Adjusment</span> &nbsp;
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <div style="width: 100%; text-align: center;">
                <font-awesome-icon style="color: #333399;" icon="cog" size="6x" />
                <br />
                <br />
                <span style="width: 75%">Quotation Costing Adjusment</span>
              </div>
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
    return {};
  },
  computed: {},
  methods: {
    onPricingCostingClick() {
      this.$router.push({ name: "OP_PricingCosting" });
    },
    onCostTypeClick() {
      this.$router.push({ name: "OP_CostType" });
    },
    onZoneClick() {
      this.$router.push({ name: "OP_FleetBrand" });
    },
    onQuotationCostingAdjusmentClick() {
      this.$router.push({ name: "OP_FleetType" });
    }
  },
  mounted() {}
};
</script>