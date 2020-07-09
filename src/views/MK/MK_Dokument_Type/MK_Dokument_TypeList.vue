<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <ACCList2
            :prop="propList"
            :title="'Dokument Type'"
            @rowClicked="rowClicked"
            @rowDblClicked="doDoubleClick"
            @rowLinkClick="rowLink"
            @pageSize="M_PageSize"
            @pagination="M_Pagination"
            @filter="M_Advance_Filter"
            @headTable="M_Head_Table"
            @refreshColumn="refreshColumn"
            ref="ref_MkDokumentType"
            urlAdd="MK_DocumentTypeForm"
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
        OrderBy: "",
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
      this.$router.push({ name: "MK_DocumentTypeForm", params: param });
    },
    doDoubleClick(record, index) {},
    rowLink(url) {},
    M_PageSize() {},
    M_Pagination() {},
    M_Advance_Filter() {},
    M_Head_Table() {},
    refreshColumn() {}
  },
  mounted() {
    this.$refs.ref_MkDokumentType.doGetList("");
    this.GetButtonStatus(
      this.getDataUser().portfolio_id,
      this.getDataUser().group_id,
      this.getDataUser().user_id,
      "/MK/MK_Document_Type"
    ).then(ress => {
      var x = {};
      for (let i = 0; i < ress.length; i++) {
        x[ress[i].button_id] = ress[i].button_status;
      }

      this.$store.commit("setButtonStatus", x);
    });
  },
  created() {
    this.$store.commit("setParamPage", {});
  }
};
</script>

<style>
</style>
