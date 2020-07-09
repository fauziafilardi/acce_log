<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <ACCList2
            :prop="propList"
            :title="'Fleet Master'"
            @rowClicked="rowClicked"
            @rowDblClicked="doDoubleClick"
            @rowLinkClick="rowLink"
            @pageSize="M_PageSize"
            @pagination="M_Pagination"
            @filter="M_Advance_Filter"
            @headTable="M_Head_Table"
            @refreshColumn="refreshColumn"
            ref="ref_FleetMaster"
            urlAdd="OP_FleetMasterForm"
            WithViewButton
            @buttonViewClicked="doViewClick"
            @buttonDeleteClicked="doDeleteClick"
          >
          </ACCList2>
        </b-col>
      </b-row>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      propList: {
        initialWhere: "",
        LineNo: 0,
        PageLevel: 1,
        TabIndex: 1,
        OrderBy: "",
        SourceField: "",
        ParamView: ""
      },
    };
  },
  methods: {
    doBack() {
      this.$router.go(-1);
    },
    rowClicked(record, index) {},
    doDoubleClick(record, index) {},
    doViewClick(record, index) {
      var param = record;
      param.isView = true;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "OP_FleetMasterView" });
    },
    doDeleteClick(record, index) {},
    rowLink(url) {},
    M_PageSize() {},
    M_Pagination() {},
    M_Advance_Filter() {},
    M_Head_Table() {},
    refreshColumn() {},
    onSearchEnter(data) {
    },
    onAddClick() {
      this.$router.push({ name: "OP_FleetMasterForm" });
    },
  },
  mounted() {
    this.$refs.ref_FleetMaster.doGetList("");
  },
  created() {
    this.$store.commit("setParamPage", {});
  }
};
</script>

<style>
</style>