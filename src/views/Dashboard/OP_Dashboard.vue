<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <keep-alive>
            <component :ref="'ref_PlanExecution_Comp'" :is="PlanExecution_Comp" />
          </keep-alive>
        </b-col>
      </b-row>
      <b-row class="dashboardBody">
        <b-col md="12">
          <keep-alive>
            <component :ref="'ref_OpenBooking_Comp'" :is="OpenBooking_Comp"/>
          </keep-alive>
        </b-col>
      </b-row>
      <b-row class="dashboardBody">
        <b-col md="4">
          <keep-alive>
            <component :ref="'ref_PettyCash_Comp'" :is="PettyCash_Comp"/>
          </keep-alive>
        </b-col>
        <b-col md="4">
          <keep-alive>
            <component :ref="'ref_Console_Comp'" :is="Console_Comp"/>
          </keep-alive>
        </b-col>
        <b-col md="4">
          <keep-alive>
            <component :ref="'ref_FleetAvailability_Comp'" :is="FleetAvailability_Comp"/>
          </keep-alive>
        </b-col>
      </b-row>
      <b-row class="dashboardBody">
        <b-col md="6">
          <keep-alive>
            <component :ref="'ref_Vendor_Comp'" :is="Vendor_Comp" />
          </keep-alive>
        </b-col>
        <b-col md="6">
          <keep-alive>
            <component :ref="'ref_Ticket_Comp'" :is="Ticket_Comp" />
          </keep-alive>
        </b-col>
      </b-row>
    </div>
  </div>
</template>

<script>
// import ChartDataLabels from './../../dist/chartjs/chartjs-plugin-datalabels'
export default {
  data() {
    return {
      PlanExecution: [],
      DataTable: [],
      PlanExTable: {
        Header: [],
        Data: [],
      },
      PendingOrder: [
        {
          orderno: "#ORD33242",
          company: "PT Abadi Sentosa",
          from: "JKT",
          to: "SBY",
        },
        {
          orderno: "#ORD33243",
          company: "PT Abadi Sentosa",
          from: "JKT",
          to: "SBY",
        },
        {
          orderno: "#ORD33244",
          company: "PT Abadi Sentosa",
          from: "JKT",
          to: "SBY",
        },
        {
          orderno: "#ORD33245",
          company: "PT Abadi Sentosa",
          from: "JKT",
          to: "SBY",
        },
        {
          orderno: "#ORD33246",
          company: "PT Abadi Sentosa",
          from: "JKT",
          to: "SBY",
        },
        {
          orderno: "#ORD33247",
          company: "PT Abadi Sentosa",
          from: "JKT",
          to: "SBY",
        },
      ],
      OPPettyCash: [
        { city: "Jakarta", name: "Ivan", cash: "- 1,500,000" },
        { city: "Bogor", name: "Basa", cash: "- 2,500,000" },
        { city: "Bandung", name: "Steven", cash: "- 2,250,000" },
        { city: "Surabaya", name: "Lutfie", cash: "- 1,750,000" },
        { city: "Semarang", name: "Wahyu", cash: "- 3,500,000" },
        { city: "Cirebon", name: "Ikbal", cash: "- 3,000,000" },
      ],
      ConsoleIncoming: [
        { zone: "Jakarta", m3: 150, kg: 210, available: 5, incoming: 7 },
        { zone: "Bandung", m3: 250, kg: 334, available: 7, incoming: 6 },
        { zone: "Semarang", m3: 310, kg: 250, available: 8, incoming: 4 },
        { zone: "Malang", m3: 120, kg: 334, available: 3, incoming: 5 },
        { zone: "Yogyakarta", m3: 245, kg: 334, available: 6, incoming: 5 },
      ],
      Vendor: {
        Header: [
          {
            key: "no",
            label: "No",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center",
          },
          {
            key: "vendorname",
            label: "Vendor Name",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center",
          },
          {
            key: "pending",
            label: "Pending",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center",
          },
          {
            key: "completed",
            label: "Completed",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center",
          },
        ],
        Data: [
          {
            vendorname: "PT Trans Maju Jaya",
            pending: 2,
            completed: 3,
          },
          {
            vendorname: "PT Transportasi Pratama",
            pending: 3,
            completed: 3,
          },
          {
            vendorname: "PT Truck Cepat",
            pending: 5,
            completed: 5,
          },
          {
            vendorname: "PT Maju Jaya",
            pending: 2,
            completed: 2,
          },
          {
            vendorname: "PT Logistic Mega Cipta",
            pending: 6,
            completed: 6,
          },
          {
            vendorname: "PT Log Truck Generasi",
            pending: 2,
            completed: 2,
          },
        ],
      },
      Ticket: {
        Header: [
          {
            key: "no",
            label: "No",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center",
          },
          {
            key: "date",
            label: "Date",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center",
          },
          {
            key: "customer",
            label: "Customer",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center",
          },
          {
            key: "orderno",
            label: "Order No",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center",
          },
          {
            key: "type",
            label: "Type",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center",
          },
        ],
        Data: [
          {
            date: "10/01/2020 12.00",
            customer: "PT Trans Maju Jaya",
            orderno: "#ORD31231",
            type: "Maintenance",
          },
          {
            date: "10/01/2020 12.00",
            customer: "PT Transportasi Pratama",
            orderno: "#ORD31232",
            type: "Claim",
          },
          {
            date: "10/01/2020 12.00",
            customer: "PT Truck Cepat",
            orderno: "#ORD31233",
            type: "Claim",
          },
          {
            date: "10/01/2020 12.00",
            customer: "PT Maju Jaya",
            orderno: "#ORD31234",
            type: "Maintenance",
          },
          {
            date: "10/01/2020 12.00",
            customer: "PT Logistic Mega Cipta",
            orderno: "#ORD31235",
            type: "Claim",
          },
          {
            date: "10/01/2020 12.00",
            customer: "PT Log Truck Generasi",
            orderno: "#ORD31236",
            type: "Maintenance",
          },
        ],
      },
      PlanExecution_Comp: null,
      OpenBooking_Comp: null,
      Console_Comp: null,
      PettyCash_Comp: null,
      FleetAvailability_Comp: null,
      Vendor_Comp: null,
      Ticket_Comp: null,
    };
  },
  computed: {},
  methods: {
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
        {
          key: "fleetsource",
          label: "Fleet Source",
          thClass: "HeaderTable",
          tdClass: "ContentTable__Center",
        },
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
    filterTable(data) {
      var status = data.status;
      if (status == 0) {
        this.PlanExTable.Data = this.DataTable;
      } else {
        var dataNew = this.DataTable.filter((x) => x.status == status);
        this.PlanExTable.Data = dataNew;
      }
    },
    doCreateConsole() {
      this.$router.push({ name: "OP_OrderConsole" });
    },
  },
  mounted() {
    this.renderPlan();
    this.PlanExecution_Comp = () => import("./OP/Dashboard_PlanExecution.vue");
    this.OpenBooking_Comp = () => import("./OP/Dashboard_OpenBooking.vue");
    this.Console_Comp = () => import("./OP/Dashboard_Console.vue");
    this.PettyCash_Comp = () => import("./OP/Dashboard_PettyCash.vue");
    this.FleetAvailability_Comp = () => import("./OP/Dashboard_FleetAvailability.vue");
    this.Vendor_Comp = () => import("./OP/Dashboard_Vendor.vue");
    this.Ticket_Comp = () => import("./OP/Dashboard_Ticket.vue");
  },
};
</script>