<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <ACCList2
            :prop="propList"
            :title="'Maintenance Type'"
            @rowClicked="rowClicked"
            @rowDblClicked="doDoubleClick"
            @rowLinkClick="rowLink"
            @pageSize="M_PageSize"
            @pagination="M_Pagination"
            @filter="M_Advance_Filter"
            @headTable="M_Head_Table"
            @refreshColumn="refreshColumn"
            ref="ref_MmMaintenanceType"
            urlAdd="OP_MaintenanceTypeForm"
            WithDeleteButton
            @buttonViewClicked="doViewClick"
            @buttonDeleteClicked="doDeleteClick"
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
        OrderBy: "maintenance_type ASC",
        SourceField: "",
        ParamView: ""
      }
    };
  },
  methods: {
    rowClicked(record, index) {
      this.doViewClick(record, index)
    },
    doViewClick(record, index) {
      var param = record;
      param.isEdit = true;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "OP_MaintenanceTypeView"});
    },
    doDoubleClick(record, index) {},
    doDeleteClick(record, index) {
      this.alertConfirmation("Are You Sure Want To Delete This Data ?").then(
        ress => {
          if (ress.value) {
            this.M_Delete(record);
          }
        }
      );
    },
    rowLink(url) {},
    M_PageSize() {},
    M_Pagination() {},
    M_Advance_Filter() {},
    M_Head_Table() {},
    refreshColumn() {},
    M_Delete(record) {
      var param = {
        option_url: "/OP/OP_MaintenanceType",
        line_no: 0,
        id: record.row_id,
        lastupdatestamp: record.lastupdatestamp
      };
      this.deleteJSON(this.getUrlCRUD(), param).then(response => {
        // response from API
        if (response == null) return;

        this.alertSuccess("Data Has Been Deleted").then(() => {
          this.$refs.ref_MmMaintenanceType.doGetList("");
        });
      });
    }
  },
  mounted() {
    this.$refs.ref_MmMaintenanceType.doGetList("");
	
  },
  created(){
	this.$store.commit("setParamPage",{})
  }
};
</script>

<style>
</style>
