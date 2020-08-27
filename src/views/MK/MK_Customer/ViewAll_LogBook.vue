<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <ACCList2
            :prop="propList"
            :title="Title"
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
            <template slot="action_type" slot-scope="data">
              <span>
                <font-awesome-icon
                  class="icon-style-default"
                  :icon="data.item.action_type=='C' ? 'phone-square-alt' : (data.item.action_type=='V' ? 'hand-paper' : 'utensils')"
                  size="lg"
                />
                {{ data.item.action }}
              </span>
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
      Title: "Customer Master | Log Book",
      propList: {
        OptionUrl: "/MK/MK_Customer",
        initialWhere: "",
        LineNo: 3,
        PageLevel: 1,
        TabIndex: 1,
        OrderBy: "mk_logbook_id ASC",
        SourceField: "",
        ParamView: "",
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
    if (this.paramFromList.contact_type == "V") {
      this.Title = "Vendor Master | Log Book";
    } else {
      this.Title = "Customer Master | Log Book";
    }
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
