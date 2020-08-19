<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <ACCList2
            :prop="propList"
            :title="'Operation Petty Cash'"
            @rowClicked="rowClicked"
            @buttonDeleteClicked="doDeleteClick"
            @rowDblClicked="doDoubleClick"
            @rowLinkClick="rowLink"
            @pageSize="M_PageSize"
            @pagination="M_Pagination"
            @filter="M_Advance_Filter"
            @headTable="M_Head_Table"
            @refreshColumn="refreshColumn"
            ref="ref_OPFleetAvailability"
            @buttonViewClicked="doViewClick"
          >
            <template slot="balance_amt" slot-scope="data">
              <span
                v-if="data.item.balance_amt < 0"
                style="color:red"
              >{{isCurrency(data.item.balance_amt,decimal)}}</span>
              <span v-else style="color:black">{{data.item.advanced_limit}}</span>
            </template>
            <template slot="advanced_limit" slot-scope="data">
              <span>{{isCurrency(data.item.advanced_limit,decimal)}}</span>
            </template>
            <template slot="onhand_amt" slot-scope="data">
              <span>{{isCurrency(data.item.onhand_amt,decimal)}}</span>
            </template>
            <template slot="paid_amt" slot-scope="data">
              <span>{{isCurrency(data.item.paid_amt,decimal)}}</span>
            </template>
            <template slot="unpaid_amt" slot-scope="data">
              <span>{{isCurrency(data.item.unpaid_amt,decimal)}}</span>
            </template>
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
        initialWhere:
          "ss_portfolio_id='" + this.getDataUser().portfolio_id + "'",
        LineNo: 0,
        PageLevel: 1,
        TabIndex: 1,
        OrderBy: "coverage ASC",
        SourceField: "",
        ParamView: "",
      },
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
        option_url: "/OP/OP_PettyCash",
        line_no: 0,
        id: record.row_id,
        lastupdatestamp: record.lastupdatestamp,
      };
      this.deleteJSON(this.getUrlCRUD(), param).then((response) => {
        // response from API
        if (response == null) return;

        this.alertSuccess("Data Has Been Deleted").then(() => {
          this.$refs.ref_OPFleetAvailability.doGetList("");
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
    this.$refs.ref_OPFleetAvailability.doGetList("");
  },
  created() {
    this.$store.commit("setParamPage", {});
  },
};
</script>

<style>
</style>
