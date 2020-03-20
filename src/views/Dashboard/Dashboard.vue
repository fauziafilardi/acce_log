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

    // this.urlDashboard = "MK_Dashboard";
    this.urlDashboard = "OP_Dashboard";
    // this.urlDashboard = "FM_Dashboard";
    // this.urlDashboard = "GA_Dashboard";
    // this.urlDashboard = "ST_Dashboard";
    // this.urlDashboard = "ADM_Dashboard";
    // this.urlDashboard = "MG_Dashboard";
    this.component = () => import(`./${this.urlDashboard}.vue`);
  }
};
</script>

<style scoped>
</style>
