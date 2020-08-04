<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card">
            <div class="card__title" style="padding-bottom: 5px !important;">
              <b-row>
                <b-col>
                  <span>Execution Plan</span>
                </b-col>
                <b-col style="text-align: right;">
                  <b-form-input
                    id="txtSearch"
                    v-model="search"
                    type="text"
                    placeholder="Search...."
                    v-shortkey.focus="['f1']"
                    class="text-field-search"
                    @keyup.enter.native="onSearchEnter"
                    autocomplete="off"
                    :disabled="isSearchDisable"
                  ></b-form-input>
                </b-col>
                <b-col md="1" class="col-right">
                  <span>
                    <ABSButton
                      :text="'Search'"
                      classButton="button button--back2"
                      classIcon="icon-style-1"
                      @click="onSearchEnter"
                    />
                  </span>
                  <span>
                    <ABSButton
                      :text="'Back'"
                      classButton="button button--back2"
                      classIcon="icon-style-1"
                      @click="$router.go(-1)"
                    />
                  </span>
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <div class="card">
                <div
                  class="card__title"
                  style="background-color: rgb(227, 231, 238) !important; padding-bottom: unset;"
                >
                  <b-row>
                    <div
                      :class="'col-md-1 isTabs' + (FilterC == 'F' ? ' active' : '')"
                      @click="filterTable('C', 'F')"
                    >
                      <span style="font-size: 13px; color: white; font-weight: bold;">FTL</span>
                    </div>
                    <div
                      :class="'col-md-1 isTabs' + (FilterC == 'L' ? ' active' : '')"
                      @click="filterTable('C', 'L')"
                    >
                      <span style="font-size: 13px; color: white; font-weight: bold;">LTL</span>
                    </div>
                    <div
                      :class="'col-md-1 isTabs' + (FilterC == 'C' ? ' active' : '')"
                      @click="filterTable('C', 'C')"
                    >
                      <span style="font-size: 13px; color: white; font-weight: bold;">Console</span>
                    </div>
                    <div
                      :class="'col-md-1 isTabs' + (FilterC == 'P' ? ' active' : '')"
                      @click="filterTable('C', 'P')"
                    >
                      <span style="font-size: 13px; color: white; font-weight: bold;">Project</span>
                    </div>
                    <div
                      :class="'col-md-1 isTabs' + (FilterC == 'R' ? ' active' : '')"
                      @click="filterTable('C', 'R')"
                    >
                      <span style="font-size: 13px; color: white; font-weight: bold;">Return Empty</span>
                    </div>
                  </b-row>
                </div>
                <div
                  class="card__body"
                  style="background-color: rgb(227, 231, 238) !important; padding: unset; border-radius: 0px 0px 8px 8px;"
                >
                  <b-row style="min-width: 800px;">
                    <b-col
                      class="ChartLegend__Wrap"
                      style="min-width:712px; padding: 0px !important;"
                    >
                      <b-row
                        style="border-radius: 0px 0px 8px 8px; !important; border: solid 1px #ccc !important"
                      >
                        <b-col
                          style="border-radius: 0px 0px 0px 8px !important; cursor: pointer; background-color: white; border-right: solid 1px #ccc; border-bottom: solid 1px #ccc;"
                          @click="filterTable('S','')"
                        >
                          <div
                            :class="'Plan-Dot-Primary'"
                            style="margin-top: 10px !important; border-radius: 8px !important;"
                          >
                            <span>{{PlanExecution.length}}</span>
                          </div>
                          <div class="Plan-Dot-Text">All</div>
                        </b-col>
                        <b-col
                          v-for="(data, index) in Status"
                          v-bind:key="index"
                          style="margin-bottom: 10px; cursor: pointer;"
                          @click="filterTable('S', data)"
                        >
                          <div
                            :class="'Plan-Dot-' + data.variant"
                            :style="'margin-top: 10px !important;' + (FilterS == data.key ? 'font-weight: bold;' : '')"
                          >
                            <span>{{PlanExecution && PlanExecution.length > 0 ? PlanExecution.filter(x => x.status == data.key).length : 0}}</span>
                          </div>
                          <div
                            class="Plan-Dot-Text"
                            :style="FilterS == data.key ? 'font-weight: bold;' : ''"
                          >{{data.label}}</div>
                        </b-col>
                      </b-row>
                    </b-col>
                  </b-row>
                </div>
              </div>
            </div>
          </div>
          <div>
            <ACCFormList
              :prop="propList"
              :title="''"
              @rowClicked="rowClicked"
              ref="ref_OrderList"
              @onRenderData="onRenderData"
            >
              <template slot="status" slot-scope="data">
                <div
                  style="width: 32px; height: 32px; background-color: purple; border-radius: 50px; margin: auto; padding-top: 3%; color: white"
                >{{data.item.status}}</div>
              </template>
              <!-- <template v-slot:cell(status)="data">
                <div
                  :class="'Plan-DotTable-' + Status[data.item.status].variant"
                ></div>
              </template>-->
            </ACCFormList>
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
      search: "",
      propList: {
        OptionUrl: "/OP/OP_Booking",
        LineNo: 2,
        initialWhere: "",
        OrderBy: "",
        SourceField: "",
        ParamView: "",
        PerPage: 1000,
      },
      FilterC: "",
      FilterS: "",
      PlanExecution: [],
      Status: {
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
      },
    };
  },
  computed: {},
  methods: {
    rowClicked(record, index) {
      var param = record;
      this.$store.commit("setParamPage", param);
      console.log(record);
      switch (record.status) {
        case "NW":
          this.$router.push({ name: "OP_ViewPlanExecution" });
          break;
        case "AS":
          // code block
          break;
        case "DP":
          // code block
          break;
        case "AR":
          // code block
          break;
        case "SL":
          // code block
          break;
        case "FL":
          // code block
          break;
        case "GO":
          // code block
          break;
        case "AD":
          // code block
          break;
        case "SU":
          // code block
          break;
        case "FU":
          // code block
          break;
        case "POD":
          // code block
          break;
        default:
          this.$router.push({ name: "OP_ViewPlanExecution" });
      }

      // console.log(this.$refs.ref_OrderList.items)
    },
    onSearchEnter() {
      this.propList.initialWhere = "";
      this.$refs.ref_OrderList.doGetList(this.search);
    },
    renderPlan() {
      var statusD = [
        { label: "All", variant: "Primary" },
        { label: "New", variant: "Magenta" },
        { label: "Assign", variant: "Lime" },
        { label: "Dispatch", variant: "Green" },
        { label: "Arrived", variant: "Purple" },
        { label: "Start Loading", variant: "Blue" },
        { label: "Finish Loading", variant: "Orange" },
        { label: "Get Out", variant: "Red" },
        { label: "Arrive Destination", variant: "Gold" },
        { label: "Start Unloading", variant: "LightGreen" },
        { label: "Finish Unloading", variant: "Pink" },
        { label: "Get Out Destination", variant: "Yellow" },
      ];

      var dataTable = [
        {
          fleetsource: "r",
          orderno: "#ORD31231",
          pickupdate: "30/01/2020 12.00",
          from: "JKT",
          to: "SBY",
          category: "P",
          fleettype: "Fuso",
          fleetno: "B 1234 AA",
          company: "PT Abadi Sentosa",
          status: 1,
          error: false,
        },
        {
          fleetsource: "l",
          orderno: "#ORD31232",
          pickupdate: "30/01/2020 12.00",
          from: "JKT",
          to: "SBY",
          category: "P",
          fleettype: "Fuso",
          fleetno: "B 1235 AB",
          company: "PT Abadi Sentosa Raya",
          status: 2,
          error: false,
        },
        {
          fleetsource: "r",
          orderno: "#ORD31233",
          pickupdate: "29/01/2020 12.00",
          from: "JKT",
          to: "BDG",
          category: "C",
          fleettype: "Fuso",
          fleetno: "B 1236 AC",
          company: "PT Gemini Perkasa Abadi",
          status: 3,
          error: false,
        },
        {
          fleetsource: "l",
          orderno: "#ORD31234",
          pickupdate: "28/01/2020 12.00",
          from: "JKT",
          to: "SMG",
          category: "C",
          fleettype: "Fuso",
          fleetno: "B 1237 AD",
          company: "PT Abadi Sentosa",
          status: 4,
          error: false,
        },
        {
          fleetsource: "r",
          orderno: "#ORD31235",
          pickupdate: "31/01/2020 12.00",
          from: "JKT",
          to: "SKB",
          category: "P",
          fleettype: "Fuso",
          fleetno: "B 1238 AE",
          company: "PT Abadi Sentosa Raya",
          status: 5,
          error: false,
        },
        {
          fleetsource: "l",
          orderno: "#ORD31236",
          pickupdate: "20/01/2020 12.00",
          from: "JKT",
          to: "BDG",
          category: "L",
          fleettype: "Fuso",
          fleetno: "B 1239 AF",
          company: "PT Gemini Perkasa Abadi",
          status: 6,
          error: false,
        },
        {
          fleetsource: "l",
          orderno: "#ORD31237",
          pickupdate: "18/01/2020 12.00",
          from: "JKT",
          to: "BGR",
          category: "F",
          fleettype: "Fuso",
          fleetno: "B 1240 AG",
          company: "PT Provost Abadi",
          status: 7,
          error: true,
        },
        {
          fleetsource: "r",
          orderno: "#ORD31238",
          pickupdate: "17/01/2020 12.00",
          from: "JKT",
          to: "DPS",
          category: "C",
          fleettype: "Fuso",
          fleetno: "B 1241 AH",
          company: "PT Abadi Sentosa",
          status: 8,
          error: false,
        },
        {
          fleetsource: "l",
          orderno: "#ORD31239",
          pickupdate: "26/01/2020 12.00",
          from: "JKT",
          to: "BGR",
          category: "L",
          fleettype: "Fuso",
          fleetno: "B 1242 AI",
          company: "PT Abadi Sentosa Raya",
          status: 1,
          error: false,
        },
        {
          fleetsource: "r",
          orderno: "#ORD31240",
          pickupdate: "28/01/2020 12.00",
          from: "JKT",
          to: "SBY",
          category: "F",
          fleettype: "Fuso",
          fleetno: "B 1243 AJ",
          company: "PT Abadi Sentosa",
          status: 9,
          error: false,
        },
        {
          fleetsource: "r",
          orderno: "#ORD31241",
          pickupdate: "25/01/2020 12.00",
          from: "JKT",
          to: "BDG",
          category: "C",
          fleettype: "Fuso",
          fleetno: "B 1244 AK",
          company: "PT Gemini Perkasa Abadi",
          status: 10,
          error: false,
        },
        {
          fleetsource: "l",
          orderno: "#ORD31242",
          pickupdate: "13/01/2020 12.00",
          from: "JKT",
          to: "SMG",
          category: "F",
          fleettype: "Fuso",
          fleetno: "B 1245 AL",
          company: "PT Provost Abadi",
          status: 11,
          error: true,
        },
        {
          fleetsource: "r",
          orderno: "#ORD31243",
          pickupdate: "01/01/2020 12.00",
          from: "JKT",
          to: "DPS",
          category: "F",
          fleettype: "Fuso",
          fleetno: "B 1246 AM",
          company: "PT Garuda Perkasa",
          status: 4,
          error: false,
        },
      ];

      var arr = [];
      var tbHeader = [
        {
          key: "no",
          label: "No",
          thClass: "HeaderTable",
          tdClass: "ContentTable__Center",
        },
        // {
        //   key: "fleetsource",
        //   label: "Fleet Source",
        //   thClass: "HeaderTable",
        //   tdClass: "ContentTable__Center"
        // },
        {
          key: "orderno",
          label: "Order No",
          thClass: "HeaderTable",
          tdClass: "ContentTable__Center",
        },
        {
          key: "pickupdate",
          label: "Pick Up Date",
          thClass: "HeaderTable",
          tdClass: "ContentTable__Center",
        },
        {
          key: "from",
          label: "From To",
          thClass: "HeaderTable",
          tdClass: "ContentTable__Center",
        },
        {
          key: "category",
          label: "Category",
          thClass: "HeaderTable",
          tdClass: "ContentTable__Center",
        },
        {
          key: "fleettype",
          label: "Fleet Type",
          thClass: "HeaderTable",
          tdClass: "ContentTable__Center",
        },
        {
          key: "fleetno",
          label: "Fleet No",
          thClass: "HeaderTable",
          tdClass: "ContentTable__Center",
        },
        {
          key: "company",
          label: "Company",
          thClass: "HeaderTable",
          tdClass: "ContentTable__Center",
        },
        {
          key: "status",
          label: "Status",
          thClass: "HeaderTable",
          tdClass: "ContentTable__Center",
        },
      ];

      arr.push({
        status: 0,
        label: statusD[0].label,
        dataLength: dataTable.length,
        variant: statusD[0].variant,
      });

      for (let x = 0; x < dataTable.length; x++) {
        if (arr.map((x) => x.status).indexOf(dataTable[x].status) < 0) {
          arr.push({
            status: dataTable[x].status,
            label: statusD[dataTable[x].status].label,
            dataLength: dataTable.filter((r) => r.status == dataTable[x].status)
              .length,
            variant: statusD[dataTable[x].status].variant,
          });
        }
      }

      this.PlanExecution = arr;
      this.PlanExTable.Header = tbHeader;
      this.PlanExTable.Data = dataTable;
      this.DataTable = dataTable;
    },
    filterTable(fr, data) {
      if (fr == "C") {
        this.FilterC = data;
        this.FilterS = "";
        var str = "FTL";
        switch (data) {
          case "F":
            this.propList.initialWhere = "category='FTL'";
            this.$refs.ref_OrderList.doGetList("");
            break;
          case "L":
            this.propList.initialWhere = "category='LTL'";
            this.$refs.ref_OrderList.doGetList("");
            break;
          case "P":
            this.propList.initialWhere = "category='Project'";
            this.$refs.ref_OrderList.doGetList("");
            break;
          case "C":
            this.propList.initialWhere = "category='Console'";
            this.$refs.ref_OrderList.doGetList("");
            break;
          case "R":
            // this.propList.initialWhere = "category='Console'"
            // this.$refs.ref_OrderList.doGetList("");
            break;
          default:
            this.propList.initialWhere = "";
            this.$refs.ref_OrderList.doGetList("");
            break;
        }
      } else {
        console.log(data);
        if (data == "") {
          this.FilterC = "";
          this.FilterS = data;
          this.propList.initialWhere = data;
          this.$refs.ref_OrderList.doGetList("");
        } else {
          this.FilterC = "";
          this.FilterS = data.key;

          this.propList.initialWhere = "status='" + data.key + "'";
          this.$refs.ref_OrderList.doGetList("");
        }
      }
    },
    RenderData() {
      this.$refs.ref_OrderList.doGetList("");
    },
    onRenderData(data) {
      if (this.PlanExecution.length == 0) {
        var x = data;
        this.PlanExecution = x;
      }
    },
  },
  mounted() {
    this.RenderData();
  },
};
</script>

<style scoped>
.card {
  border: 0px solid #e7eaec !important;
}
.card-header:first-child {
  background-color: #eeeeee !important;
}

.tab-content > .active {
  padding: 0px !important;
}

.isTabs {
  border-top-right-radius: 5px;
  border-top-left-radius: 5px;
  background-color: #999999;
  width: 81px;
  text-align: center;
  height: 30px;
  padding-top: 0.3%;
  margin-right: 5px;
}

.active {
  background-color: #333399 !important;
}
</style>