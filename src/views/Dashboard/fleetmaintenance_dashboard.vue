<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="8">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>List Fleet Maintenance</span>
                </b-col>
                <b-col style="text-align: right;">
                  <span style="padding-right:5px">
                    <font-awesome-icon class="faw-circle__blue" icon="circle" size="sm" />
                  </span>
                  <span
                    style="padding-right:5px; font-size: 11px !important; font-weight: normal !important; color: #666666;"
                  >Schedule</span>

                  <span style="padding-right:5px">
                    <font-awesome-icon class="faw-circle__red" icon="circle" size="sm" />
                  </span>
                  <span
                    style="padding-right:5px; font-size: 11px !important; font-weight: normal !important; color: #666666;"
                  >Overdue</span>
                </b-col>
                <b-col md="2" style="text-align: right;">
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
                :fields="ListFleet.Header"
                :items="ListFleet.Data"
              >
                <template v-slot:cell(no)="data">{{data.index + 1}}</template>
                <template v-slot:cell(schedule)="data">
                  <span
                    v-if="data.item.schedule.status == 'S'"
                    style="color:#333399;font-weight:700;"
                  >{{data.item.schedule.date}}</span>
                  <span v-else style="color:#cc0000;font-weight:700;">{{data.item.schedule.date}}</span>
                </template>
              </b-table>
            </div>
          </div>
        </b-col>
        <b-col md="4">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>List Fleet Maintenance Status</span>
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <b-row>
                <b-col style="max-width: fit-content !important;">
                  <span @click="changeMaintenanceStatus('min')" style="cursor: pointer;">
                    <font-awesome-icon class="isGrey" icon="less-than" size="lg" />
                  </span>
                </b-col>
                <b-col style="text-align: center">
                  <span>
                    <h6
                      class="isGrey"
                    >{{ DataMaintenanceStatus.monthName + ' ' + DataMaintenanceStatus.year }}</h6>
                  </span>
                </b-col>
                <b-col style="text-align: right;max-width: fit-content !important;">
                  <span @click="changeMaintenanceStatus('add')" style="cursor: pointer;">
                    <font-awesome-icon class="isGrey" icon="greater-than" size="lg" />
                  </span>
                </b-col>
              </b-row>
              <b-row style="margin-top:37px;margin-bottom:36px;">
                <b-col>
                  <div class="buleth__blue">
                    <span>{{ DataMaintenanceStatus.target && DataMaintenanceStatus.target !== '' ? DataMaintenanceStatus.target : 0 }}</span>
                  </div>
                  <div class="buleth-text">Schedule</div>
                </b-col>
                <b-col>
                  <div class="buleth__red">
                    <span>{{ DataMaintenanceStatus.achievement && DataMaintenanceStatus.achievement !== '' ? DataMaintenanceStatus.achievement : 0 }}</span>
                  </div>
                  <div class="buleth-text">Overdue</div>
                </b-col>
              </b-row>
            </div>
          </div>
        </b-col>
      </b-row>
      <b-row class="dashboardBody">
        <b-col md="8">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Fleet On Maintenance</span>
                </b-col>
                <b-col style="text-align: right;">
                  <span style="padding-right:5px">
                    <font-awesome-icon class="faw-circle__blue" icon="circle" size="sm" />
                  </span>
                  <span
                    style="padding-right:5px; font-size: 11px !important; font-weight: normal !important; color: #666666;"
                  >On Progress</span>

                  <span style="padding-right:5px">
                    <font-awesome-icon class="faw-circle__green" icon="circle" size="sm" />
                  </span>
                  <span
                    style="padding-right:5px; font-size: 11px !important; font-weight: normal !important; color: #666666;"
                  >Completed</span>
                </b-col>
                <b-col md="2" style="text-align: right;">
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
                :fields="FleetMaintenance.Header"
                :items="FleetMaintenance.Data"
              >
                <template v-slot:cell(no)="data">{{data.index + 1}}</template>
                <template v-slot:cell(status)="data">
                  <span
                    v-if="data.item.status.status == 'O'"
                    style="color:#333399;font-weight:700;"
                  >{{data.item.status.descs}}</span>
                  <span v-else style="color:#00cc33;font-weight:700;">{{data.item.status.descs}}</span>
                </template>
              </b-table>
            </div>
          </div>
        </b-col>
        <b-col md="4">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Vendor Complete Order Status</span>
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <b-row>
                <b-col style="max-width: fit-content !important;">
                  <span @click="changeVendorOrder('min')" style="cursor: pointer;">
                    <font-awesome-icon class="isGrey" icon="less-than" size="lg" />
                  </span>
                </b-col>
                <b-col style="text-align: center">
                  <span>
                    <h6
                      class="isGrey"
                    >{{ DataVendorOrderStatus.monthName + ' ' + DataVendorOrderStatus.year }}</h6>
                  </span>
                </b-col>
                <b-col style="text-align: right;max-width: fit-content !important;">
                  <span @click="changeVendorOrder('add')" style="cursor: pointer;">
                    <font-awesome-icon class="isGrey" icon="greater-than" size="lg" />
                  </span>
                </b-col>
              </b-row>
              <b-row style="margin-top:37px;margin-bottom:36px;">
                <b-col>
                  <div class="buleth__blue">
                    <span>{{ DataVendorOrderStatus.target && DataVendorOrderStatus.target !== '' ? DataVendorOrderStatus.target : 0 }}</span>
                  </div>
                  <div class="buleth-text">On Progress</div>
                </b-col>
                <b-col>
                  <div class="buleth__green">
                    <span>{{ DataVendorOrderStatus.achievement && DataVendorOrderStatus.achievement !== '' ? DataVendorOrderStatus.achievement : 0 }}</span>
                  </div>
                  <div class="buleth-text">Completed</div>
                </b-col>
              </b-row>
            </div>
          </div>
        </b-col>
      </b-row>
      <b-row class="dashboardBody">
        <b-col md="6">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>History</span>
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
                :fields="History.Header"
                :items="History.Data"
              >
                <template v-slot:cell(no)="data">{{data.index + 1}}</template>
              </b-table>
            </div>
          </div>
        </b-col>
        <b-col md="6">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Spare Part</span>
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
                :fields="SparePart.Header"
                :items="SparePart.Data"
              >
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
      ListFleet: {
        Header: [
          {
            key: "no",
            label: "No",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          },
          {
            key: "vehicle",
            label: "Vehicle",
            thClass: "HeaderTable",
            tdClass: "ContentTable"
          },
          {
            key: "type",
            label: "Type",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          },
          {
            key: "driver",
            label: "Driver",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          },
          {
            key: "schedule",
            label: "Next Schedule",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          }
        ],
        Data: [
          {
            vehicle: "B 1234 AB",
            type: "FUSO",
            driver: "Budi",
            schedule: {
              date: "20/01/2020",
              status: "O"
            }
          },
          {
            vehicle: "B 1234 AC",
            type: "FUSO",
            driver: "Jupri",
            schedule: {
              date: "19/01/2020",
              status: "O"
            }
          },
          {
            vehicle: "B 1234 AD",
            type: "FUSO",
            driver: "Joko",
            schedule: {
              date: "20/01/2020",
              status: "S"
            }
          },
          {
            vehicle: "B 1234 AE",
            type: "FUSO",
            driver: "Dadang",
            schedule: {
              date: "20/01/2020",
              status: "S"
            }
          },
          {
            vehicle: "B 1234 AF",
            type: "FUSO",
            driver: "Galang",
            schedule: {
              date: "20/01/2020",
              status: "S"
            }
          },
          {
            vehicle: "B 1234 AG",
            type: "FUSO",
            driver: "Santo",
            schedule: {
              date: "20/01/2020",
              status: "S"
            }
          }
        ]
      },
      OrderStatus: [
        {
          month: "2",
          year: "2020",
          target: 10,
          achievement: 3,
          targetPoint: 800,
          achievementPoint: 577
        },
        {
          month: "3",
          year: "2020",
          target: 10,
          achievement: 7,
          targetPoint: 1056,
          achievementPoint: 788
        },
        {
          month: "4",
          year: "2020",
          target: 10,
          achievement: 9,
          targetPoint: 2010,
          achievementPoint: 900
        }
      ],
      DataMaintenanceStatus: {
        month: "",
        monthName: "",
        year: "",
        target: "",
        achievement: "",
        targetPoint: "",
        achievementPoint: ""
      },
      FleetMaintenance: {
        Header: [
          {
            key: "no",
            label: "No",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          },
          {
            key: "vehicle",
            label: "Vehicle",
            thClass: "HeaderTable",
            tdClass: "ContentTable"
          },
          {
            key: "type",
            label: "Type",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          },
          {
            key: "driver",
            label: "Driver",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          },
          {
            key: "status",
            label: "Status",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          }
        ],
        Data: [
          {
            vehicle: "B 1234 AB",
            type: "FUSO",
            driver: "Budi",
            status: {
              descs: "On Progress",
              status: "O"
            }
          },
          {
            vehicle: "B 1234 AC",
            type: "FUSO",
            driver: "Jupri",
            status: {
              descs: "On Progress",
              status: "O"
            }
          },
          {
            vehicle: "B 1234 AD",
            type: "FUSO",
            driver: "Joko",
            status: {
              descs: "Completed",
              status: "C"
            }
          },
          {
            vehicle: "B 1234 AE",
            type: "FUSO",
            driver: "Dadang",
            status: {
              descs: "Completed",
              status: "C"
            }
          },
          {
            vehicle: "B 1234 AF",
            type: "FUSO",
            driver: "Galang",
            status: {
              descs: "Completed",
              status: "C"
            }
          },
          {
            vehicle: "B 1234 AG",
            type: "FUSO",
            driver: "Santo",
            status: {
              descs: "Completed",
              status: "C"
            }
          }
        ]
      },
      VendorOrderStatus: [
        {
          month: "2",
          year: "2020",
          target: 10,
          achievement: 3,
          targetPoint: 800,
          achievementPoint: 577
        },
        {
          month: "3",
          year: "2020",
          target: 10,
          achievement: 7,
          targetPoint: 1056,
          achievementPoint: 788
        },
        {
          month: "4",
          year: "2020",
          target: 10,
          achievement: 9,
          targetPoint: 2010,
          achievementPoint: 900
        }
      ],
      DataVendorOrderStatus: {
        month: "",
        monthName: "",
        year: "",
        target: "",
        achievement: "",
        targetPoint: "",
        achievementPoint: ""
      },
      History: {
        Header: [
          {
            key: "no",
            label: "No",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          },
          {
            key: "vehicle",
            label: "Vehicle",
            thClass: "HeaderTable",
            tdClass: "ContentTable"
          },
          {
            key: "type",
            label: "Type",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          },
          {
            key: "driver",
            label: "Driver",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          },
          {
            key: "last_maintenance",
            label: "Last Maintenance",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          }
        ],
        Data: [
          {
            vehicle: "B 1234 AB",
            type: "FUSO",
            driver: "Budi",
            last_maintenance: "20/01/2020"
          },
          {
            vehicle: "B 1234 AC",
            type: "FUSO",
            driver: "Jupri",
            last_maintenance: "19/01/2020"
          },
          {
            vehicle: "B 1234 AD",
            type: "FUSO",
            driver: "Joko",
            last_maintenance: "20/01/2020"
          },
          {
            vehicle: "B 1234 AE",
            type: "FUSO",
            driver: "Dadang",
            last_maintenance: "20/01/2020"
          },
          {
            vehicle: "B 1234 AF",
            type: "FUSO",
            driver: "Galang",
            last_maintenance: "20/01/2020"
          },
          {
            vehicle: "B 1234 AG",
            type: "FUSO",
            driver: "Santo",
            last_maintenance: "20/01/2020"
          }
        ]
      },
      SparePart: {
        Header: [
          {
            key: "no",
            label: "No",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          },
          {
            key: "part_name",
            label: "Part Name",
            thClass: "HeaderTable",
            tdClass: "ContentTable"
          },
          {
            key: "vehicle_type",
            label: "Vehicle Type",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          },
          {
            key: "stock",
            label: "Stock",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          }
        ],
        Data: [
          {
            part_name: "Ban",
            vehicle_type: "FUSO",
            stock: "3"
          },
          {
            part_name: "Aki",
            vehicle_type: "FUSO",
            stock: "13"
          },
          {
            part_name: "Oli",
            vehicle_type: "FUSO",
            stock: "32"
          },
          {
            part_name: "Filter Oli",
            vehicle_type: "FUSO",
            stock: "23"
          },
          {
            part_name: "Shock Breaker",
            vehicle_type: "FUSO",
            stock: "11"
          },
          {
            part_name: "Balljoint",
            vehicle_type: "FUSO",
            stock: "9"
          }
        ]
      }
    };
  },
  computed: {},
  methods: {
    getOrder(date = null) {
      var now = date ? new Date(date) : new Date();
      var month = now.getMonth();
      var year = now.getFullYear();
      var datas = this.OrderStatus.filter(x => {
        return (
          x.month.toString() === (month + 1).toString() &&
          x.year.toString() === year.toString()
        );
      });
      console.log(datas);

      this.DataMaintenanceStatus = {
        month: month + 1,
        monthName: this.getMonthName(now),
        year: year,
        target: datas.length > 0 ? datas[0].target : 0,
        achievement: datas.length > 0 ? datas[0].achievement : 0,
        targetPoint: datas.length > 0 ? datas[0].targetPoint : 0,
        achievementPoint: datas.length > 0 ? datas[0].achievementPoint : 0
      };

      console.log(this.DataMaintenanceStatus);
    },
    changeMaintenanceStatus(act) {
      var date = new Date();
      if (act === "min") {
        // var d = moment(date, 'YYYY-MM-DD').add(i, number)
        var mth =
          this.DataMaintenanceStatus.month &&
          this.DataMaintenanceStatus.month !== ""
            ? parseInt(this.DataMaintenanceStatus.month)
            : 0;
        var year = this.DataMaintenanceStatus.year;
        mth = mth < 10 ? "0" + mth : mth;
        var frm = year + "-" + mth + "-" + "01";
        date = this.dateAdd2("m", frm, -1);
        // date = this.momentDateFormatting(date, frm)
      } else if (act === "add") {
        var mth =
          this.DataMaintenanceStatus.month &&
          this.DataMaintenanceStatus.month !== ""
            ? parseInt(this.DataMaintenanceStatus.month)
            : 0;
        var year = this.DataMaintenanceStatus.year;
        mth = mth < 10 ? "0" + mth : mth;
        var frm = year + "-" + mth + "-" + "01";
        date = date = this.dateAdd2("m", frm, 1);
        // date = this.momentDateFormatting(date, frm)
      }

      console.log(date);
      this.getOrder(date);
    },
    getVendorOrder(date = null) {
      var now = date ? new Date(date) : new Date();
      var month = now.getMonth();
      var year = now.getFullYear();
      var datas = this.OrderStatus.filter(x => {
        return (
          x.month.toString() === (month + 1).toString() &&
          x.year.toString() === year.toString()
        );
      });
      console.log(datas);

      this.DataVendorOrderStatus = {
        month: month + 1,
        monthName: this.getMonthName(now),
        year: year,
        target: datas.length > 0 ? datas[0].target : 0,
        achievement: datas.length > 0 ? datas[0].achievement : 0,
        targetPoint: datas.length > 0 ? datas[0].targetPoint : 0,
        achievementPoint: datas.length > 0 ? datas[0].achievementPoint : 0
      };

      console.log(this.DataVendorOrderStatus);
    },
    changeVendorOrder(act) {
      var date = new Date();
      if (act === "min") {
        // var d = moment(date, 'YYYY-MM-DD').add(i, number)
        var mth =
          this.DataVendorOrderStatus.month &&
          this.DataVendorOrderStatus.month !== ""
            ? parseInt(this.DataVendorOrderStatus.month)
            : 0;
        var year = this.DataVendorOrderStatus.year;
        mth = mth < 10 ? "0" + mth : mth;
        var frm = year + "-" + mth + "-" + "01";
        date = this.dateAdd2("m", frm, -1);
        // date = this.momentDateFormatting(date, frm)
      } else if (act === "add") {
        var mth =
          this.DataVendorOrderStatus.month &&
          this.DataVendorOrderStatus.month !== ""
            ? parseInt(this.DataVendorOrderStatus.month)
            : 0;
        var year = this.DataVendorOrderStatus.year;
        mth = mth < 10 ? "0" + mth : mth;
        var frm = year + "-" + mth + "-" + "01";
        date = date = this.dateAdd2("m", frm, 1);
        // date = this.momentDateFormatting(date, frm)
      }

      console.log(date);
      this.getVendorOrder(date);
    }
  },
  mounted() {
    this.getOrder();
    this.getVendorOrder();
  }
};
</script>