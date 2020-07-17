<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="4" @click="onSpecClick">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col>
                  <span style="float: left !important;">Spesification</span> &nbsp;
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <div style="width: 100%; text-align: center;">
                <font-awesome-icon style="color: #333399;" icon="cog" size="6x" />
                <br />
                <br />
                <span style="width: 75%">Spesification</span>
              </div>
            </div>
          </div>
        </b-col>
        <b-col md="4" @click="onCustomerMasterClick">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col>
                  <span style="float: left !important;">Customer Master</span> &nbsp;
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <div style="width: 100%; text-align: center;">
                <font-awesome-icon style="color: #333399;" icon="cog" size="6x" />
                <br />
                <br />
                <span style="width: 75%">Customer Master</span>
              </div>
            </div>
          </div>
        </b-col>
        <b-col md="4" @click="onVendorClick">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col>
                  <span style="float: left !important;">Vendor Master</span> &nbsp;
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <div style="width: 100%; text-align: center;">
                <font-awesome-icon style="color: #333399;" icon="cog" size="6x" />
                <br />
                <br />
                <span style="width: 75%">Vendor Master</span>
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
    onSpecClick() {
      this.$router.push({ name: "MK_MarketingSpec" });
    },
    onCustomerMasterClick() {
      this.$router.push({ name: "MK_CustomerList" });
    },
    onVendorClick() {
      this.$router.push({ name: "OP_Vendor" });
    }
  },
  mounted() {}
};
</script>