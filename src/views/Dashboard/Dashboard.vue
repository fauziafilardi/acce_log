<template>
  <keep-alive>
    <component ref="_reference_" :is="component" />
  </keep-alive>
</template>

<script>
export default {
  data() {
    return {
      component: null,
      urlDashboard: null
    };
  },
  computed: {},
  methods: {},
  mounted() {
    // this.urlDashboard = this.getDataUser().url_dashboard
    // this.urlDashboard = "settlement_dashboard";
<<<<<<< HEAD
    // this.urlDashboard = "Dashboard2";
    // this.urlDashboard = "fleetmaintenance_dashboard";
    // this.urlDashboard = "generalafair_dashboard";
    this.urlDashboard = "admin_dashboard";
=======
    this.urlDashboard = "DashboardOP";
>>>>>>> d99039728c1fbd1dd3c93a0a9974701abf6789b7
    this.component = () => import(`./${this.urlDashboard}.vue`);
  }
};
</script>

<style scoped>
</style>
