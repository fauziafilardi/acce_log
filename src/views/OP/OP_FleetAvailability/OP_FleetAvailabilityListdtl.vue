<!--<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <b-row class="row-bordered" style="margin-top: 10px;">
            <b-col md="12">
              <b-row>
                <b-col md="2">
                  <span
                    style="font-size: 15px; color: rgb(51, 51, 153); font-weight: bold;"
                  >Fleet Availability</span>
                </b-col>
              </b-row>
              <b-row>
                <b-col>
                  <ACCList2
                    :prop="propList"
                    :title="titleList"
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
                  />
                </b-col>
              </b-row>
              <b-row>
                <b-col>
                  <ACCList2
                    :prop="propList2"
                    :title="'Incoming Fleet'"
                    @rowClicked="rowClicked"
                    @buttonDeleteClicked="doDeleteClick"
                    @rowDblClicked="doDoubleClick"
                    @rowLinkClick="rowLink"
                    @pageSize="M_PageSize"
                    @pagination="M_Pagination"
                    @filter="M_Advance_Filter"
                    @headTable="M_Head_Table"
                    @refreshColumn="refreshColumn"
                    ref="ref_OPIncomingAvailability"
                    @buttonViewClicked="doViewClick"
                  />
                </b-col>
              </b-row>
            </b-col>
          </b-row>
        </b-col>
      </b-row>
    </div>
  </div>
</template>
-->

<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Plan Execution</span>
                </b-col>
                <b-col style="text-align: right;">
                  <ABSButton
                    :text="'Back'"
                    classButton="button button--back"
                    classIcon="icon-style-1"
                    @click="doBack"
                  />
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <b-row>
                <b-col>
                  <ACCList2
                    :prop="propList"
                    :title="titleList"
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
                  />
                </b-col>
              </b-row>
              <b-row>
                <b-col>
                  <ACCList2
                    :prop="propList2"
                    :title="'Incoming Fleet'"
                    @rowClicked="rowClicked2"
                    @buttonDeleteClicked="doDeleteClick"
                    @rowDblClicked="doDoubleClick"
                    @rowLinkClick="rowLink"
                    @pageSize="M_PageSize"
                    @pagination="M_Pagination"
                    @filter="M_Advance_Filter"
                    @headTable="M_Head_Table"
                    @refreshColumn="refreshColumn"
                    ref="ref_OPIncomingAvailability"
                    @buttonViewClicked="doViewClick"
                  />
                </b-col>
              </b-row>
            </div>
          </div>
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
        OptionUrl: "/OP/OP_FleetAvailability",
        initialWhere:
          "ss_portfolio_id='" + this.getDataUser().portfolio_id + "'",
        LineNo: 1,
        PageLevel: 1,
        TabIndex: 1,
        OrderBy: "fleet ASC",
        SourceField: "",
        ParamView: "",
      },
      propList2: {
        OptionUrl: "/OP/OP_FleetAvailability",
        initialWhere:
          "ss_portfolio_id='" + this.getDataUser().portfolio_id + "'",
        LineNo: 2,
        PageLevel: 1,
        TabIndex: 1,
        OrderBy: "fleet ASC",
        SourceField: "",
        ParamView: "",
      },
      titleList: "",
    };
  },
  computed: {
    paramFromList() {
      var param = this.$store.getters.getParamPage;
      if (param == null || param == undefined) {
        // this.doBack();
      } else {
        if (Object.keys(param).length < 1) {
          // this.doBack();
        } else {
          return param;
        }
      }
    },
  },
  methods: {
    doBack() {
      this.$router.go(-1);
    },
    rowClicked(record, index) {
      this.doViewClick(record, index);
    },
    doViewClick(record, index) {
      var param = record;
      param.isEdit = true;
      param.isView = true;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "OP_FleetAvailabilitydtl" });
    },
    rowClicked2(record, index) {
      // this.doViewClick(record, index);
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
        option_url: "/OP/OP_FleetAvailability",
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
    getZoneCd() {
      var param = {
        option_function_cd: "GetZoneCd",
        module_cd: "CM",
        zone_id: this.paramFromList.row_id,
      };

      this.CallFunction(param).then((response) => {
        if (response == null) return;
        var data = response.Data;
        console.log(data);
        this.titleList = data[0].zone_cd + " | Available";
        // this.getList();
        this.propList.initialWhere =
          "to_cm_zone_id = " + this.paramFromList.row_id;
        this.propList2.initialWhere =
          "to_cm_zone_id = " + this.paramFromList.row_id;
        this.$refs.ref_OPFleetAvailability.doGetList("");
        this.$refs.ref_OPIncomingAvailability.doGetList("");
      });
    },
  },
  mounted() {
    this.getZoneCd();
  },
  created() {
    // this.$store.commit("setParamPage", {});
  },
};
</script>

<style>
</style>
