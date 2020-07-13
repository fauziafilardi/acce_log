<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="4" @click="onFleetMasterClick">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col>
                  <span style="float: left !important;">Fleet Master</span> &nbsp;
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <div style="width: 100%; text-align: center;">
                <font-awesome-icon style="color: #333399;" icon="truck" size="6x" />
                <br />
                <br />
                <span style="width: 75%">Fleet Master Setup</span>
              </div>
            </div>
          </div>
        </b-col>
        <b-col md="4" @click="onDriverManagementClick">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col>
                  <span style="float: left !important;">Driver Management</span> &nbsp;
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <div style="width: 100%; text-align: center;">
                <font-awesome-icon style="color: #333399;" icon="user" size="6x" />
                <br />
                <br />
                <span style="width: 75%">Manage Driver Setup</span>
              </div>
            </div>
          </div>
        </b-col>
        <b-col md="4" @click="onVehicleBrandClick">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col>
                  <span style="float: left !important;">Vehicle Brand</span> &nbsp;
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <div style="width: 100%; text-align: center;">
                <font-awesome-icon style="color: #333399;" icon="copyright" size="6x" />
                <br />
                <br />
                <span style="width: 75%">Master Vehicle Brand</span>
              </div>
            </div>
          </div>
        </b-col>
      </b-row>
      <b-row class="dashboardBody">
        <b-col md="4" @click="onVehicleTypeClick">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col>
                  <span style="float: left !important;">Vehicle Type</span> &nbsp;
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <div style="width: 100%; text-align: center;">
                <font-awesome-icon style="color: #333399;" icon="cogs" size="6x" />
                <br />
                <br />
                <span style="width: 75%">Master Vehicle Type</span>
              </div>
            </div>
          </div>
        </b-col>
        <b-col md="4" @click="onVehicleCaroseryClick">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col>
                  <span style="float: left !important;">Vehicle Carosery</span> &nbsp;
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <div style="width: 100%; text-align: center;">
                <font-awesome-icon style="color: #333399;" icon="dice-d6" size="6x" />
                <br />
                <br />
                <span style="width: 75%">Master Vehicle Carosery</span>
              </div>
            </div>
          </div>
        </b-col>
        <b-col md="4" @click="onMaintenanceTypeClick">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col>
                  <span style="float: left !important;">Maintenance Type</span> &nbsp;
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <div style="width: 100%; text-align: center;">
                <font-awesome-icon style="color: #333399;" icon="wrench" size="6x" />
                <br />
                <br />
                <span style="width: 75%">Master Maintenance Type</span>
              </div>
            </div>
          </div>
        </b-col>
      </b-row>
      <b-row class="dashboardBody">
        <b-col md="4" @click="onTicketCategoryClick">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col>
                  <span style="float: left !important;">Ticket Category</span> &nbsp;
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <div style="width: 100%; text-align: center;">
                <font-awesome-icon style="color: #333399;" icon="clipboard-list" size="6x" />
                <br />
                <br />
                <span style="width: 75%">Master Ticket Category</span>
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
    onFleetMasterClick() {
      this.$router.push({ name: "OP_FleetMaster" });
    },
    onDriverManagementClick() {
      this.$router.push({ name: "OP_DriverManagement" });
    },
    onVehicleBrandClick() {
      this.$router.push({ name: "OP_FleetBrand" });
    },
    onVehicleTypeClick() {
      this.$router.push({ name: "OP_FleetType" });
    },
    onVehicleCaroseryClick() {
      this.$router.push({ name: "OP_FleetCarosery" });
    },
    onMaintenanceTypeClick() {
      this.$router.push({ name: "OP_MaintenanceType" });
    },
    onTicketCategoryClick() {
      this.$router.push({ name: "OP_TicketCategory" });
    }
  },
  mounted() {}
};
</script>