<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <ACCList2
            :prop="propList"
            :title="'Driver Management'"
            @rowClicked="rowClicked"
            @buttonDeleteClicked="doDeleteClick"
            @rowDblClicked="doDoubleClick"
            @rowLinkClick="rowLink"
            @pageSize="M_PageSize"
            @pagination="M_Pagination"
            @filter="M_Advance_Filter"
            @headTable="M_Head_Table"
            @refreshColumn="refreshColumn"
            ref="ref_FmDriver"
            urlAdd="OP_DriverManagementForm"
            WithViewButton
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
        initialWhere: "",
        LineNo: 0,
        PageLevel: 1,
        TabIndex: 1,
        OrderBy: "employee_id",
        SourceField: "",
        ParamView: ""
      }
    };
  },
  methods: {
    rowClicked(record, index) {
      this.doViewClick(record, index);
    },
    doViewClick(record, index) {
      var param = record;
      param.isEdit = true;
      param.isView = true;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "OP_DriverManagementView" });
    },
    doDoubleClick(record, index) {},
    doDeleteClick(record, index) {
      var param = {
        option_url: "/OP/OP_Driver",
        line_no: 0,
        id: record.row_id,
        lastupdatestamp: record.lastupdatestamp
      };
      this.deleteJSON(this.getUrlCRUD(), param).then(response => {
        // response from API
        if (response == null) return;

        this.alertSuccess("Data Has Been Deleted").then(() => {
          this.$refs.ref_OpTicketCategory.doGetList("");
        });
      });
    },
    rowLink(url) {},
    M_PageSize() {},
    M_Pagination() {},
    M_Advance_Filter() {},
    M_Head_Table() {},
    refreshColumn() {}
  },
  mounted() {
    this.$refs.ref_FmDriver.doGetList("");
  },
  created() {
    this.$store.commit("setParamPage", {});
  }
};
</script>

<style>
</style>
