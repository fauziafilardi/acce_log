<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <ACCList2
            :prop="propList"
            :title="'Customer Master | Order Detail'"
            @rowClicked="rowClicked"
            @buttonDeleteClicked="doDeleteClick"
            @rowDblClicked="doDoubleClick"
            @rowLinkClick="rowLink"
            @pageSize="M_PageSize"
            @pagination="M_Pagination"
            @filter="M_Advance_Filter"
            @headTable="M_Head_Table"
            @refreshColumn="refreshColumn"
            ref="ref_MKFTL"
          >
            <template slot="status" slot-scope="data">
              <div
                :class="'Plan-Dot-' + (StatusOrder[data.item.status].variant)"
                style="font-size: 10px !important; padding-top: 9px !important;"
              >{{data.item.status}}</div>
            </template>
          </ACCList2>
          <!-- @buttonViewClicked="doViewClick" -->
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
        OptionUrl: "/MK/MK_Customer",
        initialWhere: "",
        LineNo: 10,
        PageLevel: 1,
        TabIndex: 1,
        OrderBy: "order_no ASC",
        SourceField: "",
        ParamView: "",
      },
      StatusOrder: {
        NW: { key: "NW", label: "New", variant: "Magenta" },
        AS: { key: "AS", label: "Assign", variant: "Lime" },
        DP: { key: "DP", label: "Dispatch", variant: "Green" },
        AR: { key: "AR", label: "Arrived", variant: "Purple" },
        SL: { key: "SL", label: "Start Loading", variant: "Blue" },
        FL: { key: "FL", label: "Finish Loading", variant: "Orange" },
        GO: { key: "GO", label: "Get Out", variant: "Red" },
        AD: { key: "AD", label: "Arrive Destination", variant: "Gold" },
        SU: { key: "SU", label: "Start Unloading", variant: "LightGreen" },
        FU: { key: "FU", label: "Finish Unloading", variant: "Pink" },
        GD: { key: "GD", label: "Get Out", variant: "Red" },
        POD: { key: "POD", label: "POD", variant: "LightGreen" },
      },
    };
  },
  computed: {
    paramFromList() {
      var param = this.$store.getters.getParamPage;
      if (param == null || param == undefined) {
        this.doBack();
      } else {
        if (Object.keys(param).length < 1) {
          this.doBack();
        } else {
          return param;
        }
      }
    },
    ButtonStatus() {
      return this.$store.getters.getButtonStatus;
    },
  },
  methods: {
    rowClicked(record, index) {
      // this.doViewClick(record, index);
    },
    doViewClick(record, index) {
      var param = record;
      param.isEdit = true;
      param.isView = true;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "OP_PettyCashdtl" });
    },
    doDoubleClick(record, index) {},
    doDeleteClick(record, index) {
      this.alertConfirmation("Are You Sure Want To Delete This Data ?").then(
        (ress) => {
          if (ress.value) {
            this.M_Delete(record, index);
          }
        }
      );
    },
    M_Delete(record, index) {
      var param = {
        option_url: "/MK/MK_Customer",
        line_no: 0,
        id: record.row_id,
        lastupdatestamp: record.lastupdatestamp,
      };
      this.deleteJSON(this.getUrlCRUD(), param).then((response) => {
        // response from API
        if (response == null) return;

        this.alertSuccess("Data Has Been Deleted").then(() => {
          this.$refs.ref_MKFTL.doGetList("");
        });
      });
    },
    rowLink(url) {},
    M_PageSize() {},
    M_Pagination() {},
    M_Advance_Filter() {},
    M_Head_Table() {},
    refreshColumn() {},
  },
  mounted() {
    this.propList.initialWhere =
      "cm_contact_id=" + this.paramFromList.cm_contact_id;
    this.$refs.ref_MKFTL.doGetList("");
  },
  created() {
    // this.$store.commit("setParamPage", {});
  },
};
</script>

<style>
</style>
