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
    this.urlDashboard = "DashboardOP";
    this.component = () => import(`./${this.urlDashboard}.vue`);
  }
};
</script>

<style scoped>
</style>
