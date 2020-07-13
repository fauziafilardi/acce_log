<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card">
            <div class="card__title" style="border-bottom-style: unset !important;">
              <b-row>
                <b-col>
                  <span>Plan Execution</span> &nbsp;
                  <span>
                    <b-badge variant="primary">&nbsp;</b-badge>
                    <span
                      style="color: #666666; font-size:12px; font-weight: normal !important; padding-left: 5px;"
                    >Project</span> &nbsp;
                    <b-badge variant="primary">&nbsp;</b-badge>
                    <span
                      style="color: #666666; font-size:12px; font-weight: normal !important; padding-left: 5px;"
                    >Console</span> &nbsp;
                    <b-badge variant="primary">&nbsp;</b-badge>
                    <span
                      style="color: #666666; font-size:12px; font-weight: normal !important; padding-left: 5px;"
                    >FTL</span> &nbsp;
                    <b-badge variant="primary">&nbsp;</b-badge>
                    <span
                      style="color: #666666; font-size:12px; font-weight: normal !important; padding-left: 5px;"
                    >LTL</span> &nbsp;
                  </span>
                </b-col>
                <b-col md="4" style="text-align: right;">
                  <span>
                    <ABSButton
                      :text="'View All'"
                      classButton="button button--new"
                      classIcon="icon-style-1"
                      :disabled="true"
                    />
                  </span>
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <div class="bedge-container">
                <b-row style="min-width: 800px;">
                  <!-- <div class="bedge-container" style="width:100%;"> -->
                  <b-col class="ChartLegend__Wrap" style="min-width:712px;">
                    <b-row style="padding-top:10px !important;">
                      <b-col
                        v-for="(data, index) in PlanExecution"
                        v-bind:key="index"
                        style="margin-bottom: 10px; cursor: pointer;"
                        @click="filterTable(data)"
                      >
                        <div :class="'Plan-Dot-' + data.variant">
                          <span>{{data.dataLength}}</span>
                        </div>
                        <div class="Plan-Dot-Text">{{data.label}}</div>
                      </b-col>
                    </b-row>
                  </b-col>
                  <!-- </div> -->
                </b-row>
                <b-row style="margin-top: 15px; min-width:800px;">
                  <b-col>
                    <b-table
                      :responsive="false"
                      :striped="false"
                      :bordered="true"
                      :outlined="false"
                      :small="false"
                      :hover="false"
                      :dark="false"
                      :fixed="false"
                      :foot-clone="false"
                      :fields="PlanExTable.Header"
                      :items="PlanExTable.Data"
                      thStyle="padding: 5px !important;"
                    >
                      <!-- class="table-sm table-style-1" -->
                      <template v-slot:cell(no)="data">{{data.index + 1}}</template>
                      <template v-slot:cell(fleetsource)="data">
                        <font-awesome-icon
                          style="color: #333399;"
                          icon="arrow-alt-circle-left"
                          size="lg"
                          v-if="data.item.fleetsource == 'l'"
                        />
                        <font-awesome-icon
                          style="color: #333399;"
                          icon="arrow-alt-circle-right"
                          size="lg"
                          v-if="data.item.fleetsource == 'r'"
                        />
                      </template>
                      <template v-slot:cell(from)="data">{{ data.item.from + ' - ' + data.item.to }}</template>
                      <template v-slot:cell(status)="data">
                        <div :class="'Plan-DotTable-' + PlanExecution[data.item.status].variant"></div>
                      </template>
                    </b-table>
                  </b-col>
                </b-row>
              </div>
            </div>
          </div>
        </b-col>
      </b-row>
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card">
            <div class="card__title" style="border-bottom-style: unset !important;">Pending Order</div>
            <div class="card__body">
              <b-row>
                <b-col
                  v-for="(data, index) in PendingOrder"
                  v-bind:key="index"
                  style="margin:auto !important;"
                >
                  <div style="padding:5px">
                    <div class="CardTag-Title">{{data.orderno}}</div>
                    <div class="CardTag-Descs">
                      <span style="color: #333399; font-weight: bold;">{{data.company}}</span>
                      <br />
                      <span style="color: #7f8186">{{data.from + ' - ' + data.to}}</span>
                    </div>
                  </div>
                </b-col>
                <b-col style="margin:auto !important;">
                  <div class="ChartLegend__Wrap" style="height:74px;margin:5px;">
                    <div
                      class="ChartLegend-Content"
                      style="margin-left: auto !important;margin-right: auto !important;margin-top: 17px !important;"
                    >
                      <span style="font-size: 14px; padding-right: 5px;">View All</span>
                      <span>
                        <font-awesome-icon icon="chevron-right" size="lg" />
                      </span>
                    </div>
                  </div>
                </b-col>
              </b-row>
            </div>
          </div>
        </b-col>
      </b-row>
      <b-row class="dashboardBody">
        <b-col md="4">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col>
                  <span style="float: left !important;">Operation Petty Cash</span> &nbsp;
                  <span style="float: right !important;">
                    <ABSButton
                      :text="'View All'"
                      classButton="button button--new"
                      classIcon="icon-style-1"
                      :disabled="true"
                    />
                  </span>
                </b-col>
                <!-- <b-col style="text-align: right;">
                </b-col>-->
              </b-row>
            </div>
            <div class="card__body">
              <b-row class="row-petty-cash">
                <b-col
                  md="4"
                  v-for="(data, index) in OPPettyCash"
                  v-bind:key="index"
                  style="margin-bottom: 10px; padding-right: 15px !important;width:33% !important"
                >
                  <div class="CardTag-Title" style="font-size:13px !important;">{{data.city}}</div>
                  <div class="CardTag-Descs" style="padding-top:9px; padding-bottom:10px;">
                    <span>{{data.name}}</span>
                    <br />
                    <span style="color: red">{{data.cash}}</span>
                  </div>
                </b-col>
              </b-row>
            </div>
          </div>
        </b-col>
        <b-col md="4">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Console</span> &nbsp;
                </b-col>
                <b-col style="text-align: right;">
                  <span>
                    <ABSButton
                      :text="'View All'"
                      classButton="button button--new"
                      classIcon="icon-style-1"
                      :disabled="true"
                    />
                  </span>
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <div class="div-console">
                <b-row class="ListingRowHeader">
                  <b-col md="4" style="width: 30% !important;">
                    <font-awesome-icon style="color: #333399;" icon="map-marker-alt" size="lg" />&nbsp;
                    <span>Zone</span>
                  </b-col>
                  <b-col md="4" style="width: 35% !important; text-align:center;">
                    <font-awesome-icon style="color: #333399;" icon="dice-d6" size="lg" />&nbsp;
                    <span>m3</span>
                  </b-col>
                  <b-col md="4" style="width: 35% !important; text-align:center;">
                    <font-awesome-icon style="color: #333399;" icon="balance-scale" size="lg" />&nbsp;
                    <span>Kg</span>
                  </b-col>
                </b-row>
                <b-row
                  v-for="(data, index) in ConsoleIncoming"
                  v-bind:key="index"
                  class="ListingRowBody"
                  style="height: 29.25px !important;"
                >
                  <b-col md="4" style="width: 30% !important;">
                    <span>{{data.zone}}</span>
                  </b-col>
                  <b-col md="4" style="width: 35% !important; text-align:center;">
                    <span>{{data.m3}}</span>
                  </b-col>
                  <b-col md="4" style="width: 35% !important; text-align:center;">
                    <span>{{data.kg}}</span>
                  </b-col>
                </b-row>
              </div>
            </div>
          </div>
        </b-col>
        <b-col md="4">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Incoming Fleet</span> &nbsp;
                </b-col>
                <b-col style="text-align: right;">
                  <span>
                    <ABSButton
                      :text="'View All'"
                      classButton="button button--new"
                      classIcon="icon-style-1"
                      :disabled="true"
                    />
                  </span>
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <b-row class="ListingRowHeader">
                <b-col md="4" style="width: 30% !important;">
                  <font-awesome-icon style="color: #333399;" icon="map-marker-alt" size="lg" />&nbsp;
                  <span>Zone</span>
                </b-col>
                <b-col md="4" class="col-header-fleet">
                  <b-badge variant="success">&nbsp;</b-badge>&nbsp;
                  <span>Available</span>
                </b-col>
                <b-col md="4" class="col-header-fleet">
                  <b-badge variant="primary">&nbsp;</b-badge>&nbsp;
                  <span>Incoming</span>
                </b-col>
              </b-row>
              <b-row
                v-for="(data, index) in ConsoleIncoming"
                v-bind:key="index"
                class="ListingRowBody"
                style="height: 29.25px !important;"
              >
                <b-col md="4" style="width: 30% !important;">
                  <span>{{data.zone}}</span>
                </b-col>
                <b-col md="4" style="width: 35% !important;text-align: center;">
                  <span>
                    <b-badge variant="success">{{data.available}}</b-badge>
                  </span>
                </b-col>
                <b-col md="4" style="width: 35% !important;text-align: center;">
                  <span>
                    <b-badge variant="primary">{{data.incoming}}</b-badge>
                  </span>
                </b-col>
              </b-row>
            </div>
          </div>
        </b-col>
      </b-row>
      <b-row class="dashboardBody">
        <b-col md="5">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Vendor</span> &nbsp;
                </b-col>
                <b-col style="text-align: right;">
                  <span>
                    <ABSButton
                      :text="'View All'"
                      classButton="button button--new"
                      classIcon="icon-style-1"
                      :disabled="true"
                    />
                  </span>
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <div>
                <b-table
                  :responsive="true"
                  :striped="false"
                  :bordered="true"
                  :outlined="false"
                  :small="false"
                  :hover="false"
                  :dark="false"
                  :fixed="false"
                  :foot-clone="false"
                  :fields="Vendor.Header"
                  :items="Vendor.Data"
                  thStyle="padding: 5px !important;"
                >
                  <!-- class="table-sm table-style-1" -->
                  <template v-slot:cell(no)="data">{{data.index + 1}}</template>
                </b-table>
              </div>
            </div>
          </div>
        </b-col>
        <b-col md="7">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Ticket</span> &nbsp;
                </b-col>
                <b-col style="text-align: right;">
                  <span>
                    <ABSButton
                      :text="'View All'"
                      classButton="button button--new"
                      classIcon="icon-style-1"
                      :disabled="true"
                    />
                  </span>
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <b-table
                :responsive="true"
                :striped="false"
                :bordered="true"
                :outlined="false"
                :small="false"
                :hover="false"
                :dark="false"
                :fixed="false"
                :foot-clone="false"
                :fields="Ticket.Header"
                :items="Ticket.Data"
                thStyle="padding: 5px !important;"
              >
                <!-- class="table-sm table-style-1" -->
                <template v-slot:cell(no)="data">{{data.index + 1}}</template>
              </b-table>
            </div>
          </div>
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
        Data: []
      },
      PendingOrder: [
        {
          orderno: "#ORD33242",
          company: "PT Abadi Sentosa",
          from: "JKT",
          to: "SBY"
        },
        {
          orderno: "#ORD33243",
          company: "PT Abadi Sentosa",
          from: "JKT",
          to: "SBY"
        },
        {
          orderno: "#ORD33244",
          company: "PT Abadi Sentosa",
          from: "JKT",
          to: "SBY"
        },
        {
          orderno: "#ORD33245",
          company: "PT Abadi Sentosa",
          from: "JKT",
          to: "SBY"
        },
        {
          orderno: "#ORD33246",
          company: "PT Abadi Sentosa",
          from: "JKT",
          to: "SBY"
        },
        {
          orderno: "#ORD33247",
          company: "PT Abadi Sentosa",
          from: "JKT",
          to: "SBY"
        }
      ],
      OPPettyCash: [
        { city: "Jakarta", name: "Ivan", cash: "- 1,500,000" },
        { city: "Bogor", name: "Basa", cash: "- 2,500,000" },
        { city: "Bandung", name: "Steven", cash: "- 2,250,000" },
        { city: "Surabaya", name: "Lutfie", cash: "- 1,750,000" },
        { city: "Semarang", name: "Wahyu", cash: "- 3,500,000" },
        { city: "Cirebon", name: "Ikbal", cash: "- 3,000,000" }
      ],
      ConsoleIncoming: [
        { zone: "Jakarta", m3: 150, kg: 210, available: 5, incoming: 7 },
        { zone: "Bandung", m3: 250, kg: 334, available: 7, incoming: 6 },
        { zone: "Semarang", m3: 310, kg: 250, available: 8, incoming: 4 },
        { zone: "Malang", m3: 120, kg: 334, available: 3, incoming: 5 },
        { zone: "Yogyakarta", m3: 245, kg: 334, available: 6, incoming: 5 }
      ],
      Vendor: {
        Header: [
          {
            key: "no",
            label: "No",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          },
          {
            key: "vendorname",
            label: "Vendor Name",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          },
          {
            key: "pending",
            label: "Pending",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          },
          {
            key: "completed",
            label: "Completed",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          }
        ],
        Data: [
          {
            vendorname: "PT Trans Maju Jaya",
            pending: 2,
            completed: 3
          },
          {
            vendorname: "PT Transportasi Pratama",
            pending: 3,
            completed: 3
          },
          {
            vendorname: "PT Truck Cepat",
            pending: 5,
            completed: 5
          },
          {
            vendorname: "PT Maju Jaya",
            pending: 2,
            completed: 2
          },
          {
            vendorname: "PT Logistic Mega Cipta",
            pending: 6,
            completed: 6
          },
          {
            vendorname: "PT Log Truck Generasi",
            pending: 2,
            completed: 2
          }
        ]
      },
      Ticket: {
        Header: [
          {
            key: "no",
            label: "No",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          },
          {
            key: "date",
            label: "Date",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          },
          {
            key: "customer",
            label: "Customer",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          },
          {
            key: "orderno",
            label: "Order No",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          },
          {
            key: "type",
            label: "Type",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          }
        ],
        Data: [
          {
            date: "10/01/2020 12.00",
            customer: "PT Trans Maju Jaya",
            orderno: "#ORD31231",
            type: "Maintenance"
          },
          {
            date: "10/01/2020 12.00",
            customer: "PT Transportasi Pratama",
            orderno: "#ORD31232",
            type: "Claim"
          },
          {
            date: "10/01/2020 12.00",
            customer: "PT Truck Cepat",
            orderno: "#ORD31233",
            type: "Claim"
          },
          {
            date: "10/01/2020 12.00",
            customer: "PT Maju Jaya",
            orderno: "#ORD31234",
            type: "Maintenance"
          },
          {
            date: "10/01/2020 12.00",
            customer: "PT Logistic Mega Cipta",
            orderno: "#ORD31235",
            type: "Claim"
          },
          {
            date: "10/01/2020 12.00",
            customer: "PT Log Truck Generasi",
            orderno: "#ORD31236",
            type: "Maintenance"
          }
        ]
      }
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
        { label: "Get Out Destination", variant: "Yellow" }
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
          error: false
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
          error: false
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
          error: false
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
          error: false
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
          error: false
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
          error: false
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
          error: true
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
          error: false
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
          error: false
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
          error: false
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
          error: false
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
          error: true
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
          error: false
        }
      ];

      var arr = [];
      var tbHeader = [
        {
          key: "no",
          label: "No",
          thClass: "HeaderTable",
          tdClass: "ContentTable__Center"
        },
        {
          key: "fleetsource",
          label: "Fleet Source",
          thClass: "HeaderTable",
          tdClass: "ContentTable__Center"
        },
        {
          key: "orderno",
          label: "Order No",
          thClass: "HeaderTable",
          tdClass: "ContentTable__Center"
        },
        {
          key: "pickupdate",
          label: "Pick Up Date",
          thClass: "HeaderTable",
          tdClass: "ContentTable__Center"
        },
        {
          key: "from",
          label: "From To",
          thClass: "HeaderTable",
          tdClass: "ContentTable__Center"
        },
        {
          key: "category",
          label: "Category",
          thClass: "HeaderTable",
          tdClass: "ContentTable__Center"
        },
        {
          key: "fleettype",
          label: "Fleet Type",
          thClass: "HeaderTable",
          tdClass: "ContentTable__Center"
        },
        {
          key: "fleetno",
          label: "Fleet No",
          thClass: "HeaderTable",
          tdClass: "ContentTable__Center"
        },
        {
          key: "company",
          label: "Company",
          thClass: "HeaderTable",
          tdClass: "ContentTable__Center"
        },
        {
          key: "status",
          label: "Status",
          thClass: "HeaderTable",
          tdClass: "ContentTable__Center"
        }
      ];

      arr.push({
        status: 0,
        label: statusD[0].label,
        dataLength: dataTable.length,
        variant: statusD[0].variant
      });

      for (let x = 0; x < dataTable.length; x++) {
        if (arr.map(x => x.status).indexOf(dataTable[x].status) < 0) {
          arr.push({
            status: dataTable[x].status,
            label: statusD[dataTable[x].status].label,
            dataLength: dataTable.filter(r => r.status == dataTable[x].status)
              .length,
            variant: statusD[dataTable[x].status].variant
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
        var dataNew = this.DataTable.filter(x => x.status == status);
        this.PlanExTable.Data = dataNew;
      }
    }
  },
  mounted() {
    this.renderPlan();
  }
};
</script>