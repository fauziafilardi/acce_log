<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <ACCList2
            :prop="propList"
            :title="'Incoming Booking'"
            @rowClicked="rowClicked"
            @rowDblClicked="doDoubleClick"
            @rowLinkClick="rowLink"
            @pageSize="M_PageSize"
            @pagination="M_Pagination"
            @filter="M_Advance_Filter"
            @headTable="M_Head_Table"
            @refreshColumn="refreshColumn"
            ref="ref_IncomingBooking"
            @buttonViewClicked="doViewClick"
          />
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
          OptionUrl: "/OP/OP_Booking",
        initialWhere: "",
        LineNo: 3,
        PageLevel: 1,
        TabIndex: 1,
        OrderBy: "",
        SourceField: "",
        ParamView: ""
      }
    };
  },
  methods: {
    rowClicked(record, index) {
      console.log(record)
      this.doViewClick(record, index)
    },
    doViewClick(record, index) {
      var param = record;
      param.isView = true;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "OP_ViewIncomingBooking" });
    },
    doDoubleClick(record, index) {
    },
    rowLink(url) {},
    M_PageSize() {},
    M_Pagination() {},
    M_Advance_Filter() {},
    M_Head_Table() {},
    refreshColumn() {}
  },
  mounted() {
    this.$refs.ref_IncomingBooking.doGetList("");
  },
  created() {
    this.$store.commit("setParamPage", {});
  }
};
</script>

<style>
</style>