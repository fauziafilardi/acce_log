<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <ACCList2
            :prop="propList"
            :title="'Marketing Target'"
            @rowClicked="rowClicked"
            @rowDblClicked="doDoubleClick"
            @rowLinkClick="rowLink"
            @pageSize="M_PageSize"
            @pagination="M_Pagination"
            @filter="M_Advance_Filter"
            @headTable="M_Head_Table"
            @refreshColumn="refreshColumn"
            ref="ref_MarketingTarget"
            urlAdd="MK_AddMarketingTarget"
            WithViewButton
            @buttonViewClicked="doViewClick"
            @buttonDeleteClicked="doDeleteClick"
          >
            <template slot="HeaderTable">
              <b-row>
                <b-col style="max-width:fit-content !important;">Year &nbsp;&nbsp;</b-col>
                <b-col md="1">
                  <ACCDropDown
                    @change="dofilterYear"
                    :prop="PI_years"
                    v-model="M_Target.year"
                    :label="M_Target.yearLabel"
                    ref="ref_years"
                  />
                  <!-- <b-form-select
                        id="cmbYear"
                        v-model="M_Target.year"
                        @change="dofilterYear"
                        :options="cmbYear"
                        style="height: 22px !important; width: 100% !important; margin-bottom: 5px;"
                  ></b-form-select>-->
                </b-col>
              </b-row>
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
      PI_years: {
        dataLookUp: null,
        cValidate: "",
        cName: "year",
        ckey: false,
        cOrder: 1,
        cProtect: false,
        cParentForm: "MarketingTarget",
        cStatic: true,
        cOption: [{}],
        cDisplayColumn: "name",
        cInputStatus: this.inputStatus,
      },
      propList: {
        initialWhere: "",
        LineNo: 0,
        PageLevel: 1,
        TabIndex: 1,
        OrderBy: "",
        SourceField: "",
        ParamView: "",
      },

      cmbYear: [],
      M_Target: {
        year: "",
        yearLabel: "",
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
      this.$router.push({ name: "MK_ViewMarketingTarget" });
    },
    doDeleteClick(record, index) {},
    rowLink(url) {},
    M_PageSize() {},
    M_Pagination() {},
    M_Advance_Filter() {},
    M_Head_Table() {},
    refreshColumn() {},
    onSearchEnter(data) {},
    onAddClick() {
      this.$router.push({ name: "MK_AddMarketingTarget" });
    },

    dofilterYear(data) {
      this.$nextTick(() => {
        this.M_Target.year = data.id;
        this.M_Target.yearLabel = data.id;
        var filter = " years = '" + data.id + "'";
        this.propList.initialWhere = filter;
        this.$refs.ref_MarketingTarget.doGetList("");
      });
    },
    getYear() {
      var param = {
        option_function_cd: "GetYearMarketingTarget",
        module_cd: "MK",
        user_id: this.getDataUser().user_id,
      };

      this.CallFunction(param).then((response) => {
        if (response == null) return;
        var data = response.Data;

        this.M_Target.year = new Date().getFullYear();

        for (let i = 0; i < data.length; i++) {
          this.cmbYear.push({ value: data[i].years, text: data[i].years });
          this.PI_years.cOption.push({
            id: data[i].years,
            label: data[i].years,
          });
        }

        this.propList.initialWhere = " years = '" + this.M_Target.year + "' ";

        this.$refs.ref_MarketingTarget.doGetList("");
      });
    },
  },
  mounted() {
    this.getYear();
  },
  created() {
    this.$store.commit("setParamPage", {});
  },
};
</script>

<style>
</style>