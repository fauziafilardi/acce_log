<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="8">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Fleet Master</span>
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
                :fields="FleetDocument.Header"
                :items="FleetDocument.Data"
              >
                <template v-slot:cell(no)="data">{{data.index + 1}}</template>
                <template v-slot:cell(bpkb_expired)="data">
                  <span
                    v-if="data.item.bpkb_expired.status == 'S'"
                    style="color:#333399;font-weight:700;"
                  >{{data.item.bpkb_expired.date}}</span>
                  <span
                    v-else
                    style="color:#cc0000;font-weight:700;"
                  >{{data.item.bpkb_expired.date}}</span>
                </template>
                <template v-slot:cell(stnk_expired)="data">
                  <span
                    v-if="data.item.stnk_expired.status == 'S'"
                    style="color:#333399;font-weight:700;"
                  >{{data.item.stnk_expired.date}}</span>
                  <span
                    v-else
                    style="color:#cc0000;font-weight:700;"
                  >{{data.item.stnk_expired.date}}</span>
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
                  <span>Fleet Master Status</span>
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <b-row>
                <b-col style="max-width: fit-content !important;">
                  <span @click="changeFleetDocumentStatus('min')" style="cursor: pointer;">
                    <font-awesome-icon class="isGrey" icon="less-than" size="lg" />
                  </span>
                </b-col>
                <b-col style="text-align: center">
                  <span>
                    <h6
                      class="isGrey"
                    >{{ DataFleetDocumentStatus.monthName + ' ' + DataFleetDocumentStatus.year }}</h6>
                  </span>
                </b-col>
                <b-col style="text-align: right;max-width: fit-content !important;">
                  <span @click="changeFleetDocumentStatus('add')" style="cursor: pointer;">
                    <font-awesome-icon class="isGrey" icon="greater-than" size="lg" />
                  </span>
                </b-col>
              </b-row>
              <b-row style="margin-top:37px;margin-bottom:36px;">
                <b-col>
                  <div class="buleth__blue">
                    <span>{{ DataFleetDocumentStatus.target && DataFleetDocumentStatus.target !== '' ? DataFleetDocumentStatus.target : 0 }}</span>
                  </div>
                  <div class="buleth-text">Schedule</div>
                </b-col>
                <b-col>
                  <div class="buleth__red">
                    <span>{{ DataFleetDocumentStatus.achievement && DataFleetDocumentStatus.achievement !== '' ? DataFleetDocumentStatus.achievement : 0 }}</span>
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
                  <span>Driver Management</span>
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
                :fields="DriverDocument.Header"
                :items="DriverDocument.Data"
              >
                <template v-slot:cell(no)="data">{{data.index + 1}}</template>
                <template v-slot:cell(sim_expired)="data">
                  <span
                    v-if="data.item.sim_expired.status == 'S'"
                    style="color:#333399;font-weight:700;"
                  >{{data.item.sim_expired.date}}</span>
                  <span v-else style="color:#cc0000;font-weight:700;">{{data.item.sim_expired.date}}</span>
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
                  <span>Driver Document Status</span>
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <b-row>
                <b-col style="max-width: fit-content !important;">
                  <span @click="changeDriverDocumentStatus('min')" style="cursor: pointer;">
                    <font-awesome-icon class="isGrey" icon="less-than" size="lg" />
                  </span>
                </b-col>
                <b-col style="text-align: center">
                  <span>
                    <h6
                      class="isGrey"
                    >{{ DataDriverDocumentStatus.monthName + ' ' + DataDriverDocumentStatus.year }}</h6>
                  </span>
                </b-col>
                <b-col style="text-align: right;max-width: fit-content !important;">
                  <span @click="changeDriverDocumentStatus('add')" style="cursor: pointer;">
                    <font-awesome-icon class="isGrey" icon="greater-than" size="lg" />
                  </span>
                </b-col>
              </b-row>
              <b-row style="margin-top:37px;margin-bottom:36px;">
                <b-col>
                  <div class="buleth__blue">
                    <span>{{ DataDriverDocumentStatus.target && DataDriverDocumentStatus.target !== '' ? DataDriverDocumentStatus.target : 0 }}</span>
                  </div>
                  <div class="buleth-text">Applicable</div>
                </b-col>
                <b-col>
                  <div class="buleth__red">
                    <span>{{ DataDriverDocumentStatus.achievement && DataDriverDocumentStatus.achievement !== '' ? DataDriverDocumentStatus.achievement : 0 }}</span>
                  </div>
                  <div class="buleth-text">Expire</div>
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
                  <span>Driver Management</span>
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
                :fields="UserManagement.Header"
                :items="UserManagement.Data"
              >
                <template v-slot:cell(no)="data">{{data.index + 1}}</template>
                <template v-slot:cell(role)="data">
                  <span style="color:#333399;font-weight:700;">{{data.item.role}}</span>
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
                  <span>User Management Status</span>
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <b-row>
                <b-col>
                  <div class="chart-container" style="position: relative;height: 42vh;">
                    <canvas id="user-chart"></canvas>
                  </div>
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
// import ChartDataLabels from './../../dist/chartjs/chartjs-plugin-datalabels'
export default {
  data() {
    return {
      FleetDocument: {
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
            key: "bpkb_expired",
            label: "BPKP Expired",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          },
          {
            key: "stnk_expired",
            label: "STNK Expired",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          }
        ],
        Data: [
          {
            vehicle: "B 1234 AB",
            type: "FUSO",
            driver: "Budi",
            bpkb_expired: {
              date: "20/01/2020",
              status: "O"
            },
            stnk_expired: {
              date: "20/01/2020",
              status: "O"
            }
          },
          {
            vehicle: "B 1234 AC",
            type: "FUSO",
            driver: "Jupri",
            bpkb_expired: {
              date: "19/01/2020",
              status: "O"
            },
            stnk_expired: {
              date: "19/01/2020",
              status: "O"
            }
          },
          {
            vehicle: "B 1234 AD",
            type: "FUSO",
            driver: "Joko",
            bpkb_expired: {
              date: "20/01/2020",
              status: "S"
            },
            stnk_expired: {
              date: "20/01/2020",
              status: "S"
            }
          },
          {
            vehicle: "B 1234 AE",
            type: "FUSO",
            driver: "Dadang",
            bpkb_expired: {
              date: "20/01/2020",
              status: "S"
            },
            stnk_expired: {
              date: "20/01/2020",
              status: "S"
            }
          },
          {
            vehicle: "B 1234 AF",
            type: "FUSO",
            driver: "Galang",
            bpkb_expired: {
              date: "20/01/2020",
              status: "S"
            },
            stnk_expired: {
              date: "20/01/2020",
              status: "S"
            }
          },
          {
            vehicle: "B 1234 AG",
            type: "FUSO",
            driver: "Santo",
            bpkb_expired: {
              date: "20/01/2020",
              status: "S"
            },
            stnk_expired: {
              date: "20/01/2020",
              status: "S"
            }
          }
        ]
      },
      FleetDocumentStatus: [
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
      DataFleetDocumentStatus: {
        month: "",
        monthName: "",
        year: "",
        target: "",
        achievement: "",
        targetPoint: "",
        achievementPoint: ""
      },
      DriverDocument: {
        Header: [
          {
            key: "no",
            label: "No",
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
            key: "phone",
            label: "Phone",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          },
          {
            key: "date_added",
            label: "Date Added",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          },
          {
            key: "sim_expired",
            label: "SIM Expired",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          }
        ],
        Data: [
          {
            driver: "Budi",
            phone: "+62-898-9588-2938",
            date_added: "23/01/2020",
            sim_expired: {
              date: "20/01/2020",
              status: "O"
            }
          },
          {
            driver: "Jupri",
            phone: "+62-898-9588-2938",
            date_added: "23/01/2020",
            sim_expired: {
              date: "19/01/2020",
              status: "O"
            }
          },
          {
            driver: "Joko",
            phone: "+62-898-9588-2938",
            date_added: "23/01/2020",
            sim_expired: {
              date: "20/01/2020",
              status: "S"
            }
          },
          {
            driver: "Dadang",
            phone: "+62-898-9588-2938",
            date_added: "23/01/2020",
            sim_expired: {
              date: "20/01/2020",
              status: "S"
            }
          },
          {
            driver: "Galang",
            phone: "+62-898-9588-2938",
            date_added: "23/01/2020",
            sim_expired: {
              date: "20/01/2020",
              status: "S"
            }
          },
          {
            driver: "Santo",
            phone: "+62-898-9588-2938",
            date_added: "23/01/2020",
            sim_expired: {
              date: "20/01/2020",
              status: "S"
            }
          }
        ]
      },
      DriverDocumentStatus: [
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
      DataDriverDocumentStatus: {
        month: "",
        monthName: "",
        year: "",
        target: "",
        achievement: "",
        targetPoint: "",
        achievementPoint: ""
      },
      UserManagement: {
        Header: [
          {
            key: "no",
            label: "No",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          },
          {
            key: "user",
            label: "User",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          },
          {
            key: "phone",
            label: "Phone",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          },
          {
            key: "date_added",
            label: "Date Added",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          },
          {
            key: "role",
            label: "Role",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          }
        ],
        Data: [
          {
            user: "Budi",
            phone: "+62-898-9588-2938",
            date_added: "23/01/2020",
            role: "Marketing"
          },
          {
            user: "Jupri",
            phone: "+62-898-9588-2938",
            date_added: "23/01/2020",
            role: "Operation"
          },
          {
            user: "Joko",
            phone: "+62-898-9588-2938",
            date_added: "23/01/2020",
            role: "Settlement"
          },
          {
            user: "Dadang",
            phone: "+62-898-9588-2938",
            date_added: "23/01/2020",
            role: "Fleet Maintenance"
          },
          {
            user: "Galang",
            phone: "+62-898-9588-2938",
            date_added: "23/01/2020",
            role: "Management"
          },
          {
            user: "Santo",
            phone: "+62-898-9588-2938",
            date_added: "23/01/2020",
            role: "General Affair"
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
      var datas = this.FleetDocumentStatus.filter(x => {
        return (
          x.month.toString() === (month + 1).toString() &&
          x.year.toString() === year.toString()
        );
      });
      console.log(datas);

      this.DataFleetDocumentStatus = {
        month: month + 1,
        monthName: this.getMonthName(now),
        year: year,
        target: datas.length > 0 ? datas[0].target : 0,
        achievement: datas.length > 0 ? datas[0].achievement : 0,
        targetPoint: datas.length > 0 ? datas[0].targetPoint : 0,
        achievementPoint: datas.length > 0 ? datas[0].achievementPoint : 0
      };

      console.log(this.DataFleetDocumentStatus);
    },
    changeFleetDocumentStatus(act) {
      var date = new Date();
      if (act === "min") {
        // var d = moment(date, 'YYYY-MM-DD').add(i, number)
        var mth =
          this.DataFleetDocumentStatus.month &&
          this.DataFleetDocumentStatus.month !== ""
            ? parseInt(this.DataFleetDocumentStatus.month)
            : 0;
        var year = this.DataFleetDocumentStatus.year;
        mth = mth < 10 ? "0" + mth : mth;
        var frm = year + "-" + mth + "-" + "01";
        date = this.dateAdd2("m", frm, -1);
        // date = this.momentDateFormatting(date, frm)
      } else if (act === "add") {
        var mth =
          this.DataFleetDocumentStatus.month &&
          this.DataFleetDocumentStatus.month !== ""
            ? parseInt(this.DataFleetDocumentStatus.month)
            : 0;
        var year = this.DataFleetDocumentStatus.year;
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
      var datas = this.DriverDocumentStatus.filter(x => {
        return (
          x.month.toString() === (month + 1).toString() &&
          x.year.toString() === year.toString()
        );
      });
      console.log(datas);

      this.DataDriverDocumentStatus = {
        month: month + 1,
        monthName: this.getMonthName(now),
        year: year,
        target: datas.length > 0 ? datas[0].target : 0,
        achievement: datas.length > 0 ? datas[0].achievement : 0,
        targetPoint: datas.length > 0 ? datas[0].targetPoint : 0,
        achievementPoint: datas.length > 0 ? datas[0].achievementPoint : 0
      };

      console.log(this.DataDriverDocumentStatus);
    },
    changeDriverDocumentStatus(act) {
      var date = new Date();
      if (act === "min") {
        // var d = moment(date, 'YYYY-MM-DD').add(i, number)
        var mth =
          this.DataDriverDocumentStatus.month &&
          this.DataDriverDocumentStatus.month !== ""
            ? parseInt(this.DataDriverDocumentStatus.month)
            : 0;
        var year = this.DataDriverDocumentStatus.year;
        mth = mth < 10 ? "0" + mth : mth;
        var frm = year + "-" + mth + "-" + "01";
        date = this.dateAdd2("m", frm, -1);
        // date = this.momentDateFormatting(date, frm)
      } else if (act === "add") {
        var mth =
          this.DataDriverDocumentStatus.month &&
          this.DataDriverDocumentStatus.month !== ""
            ? parseInt(this.DataDriverDocumentStatus.month)
            : 0;
        var year = this.DataDriverDocumentStatus.year;
        mth = mth < 10 ? "0" + mth : mth;
        var frm = year + "-" + mth + "-" + "01";
        date = date = this.dateAdd2("m", frm, 1);
        // date = this.momentDateFormatting(date, frm)
      }

      console.log(date);
      this.getVendorOrder(date);
    },
    renderChart() {
      var valuedata = [2478, 5267, 734, 784, 433];
      var valuedata2 = [
        {
          label: "Marketing",
          backgroundColor: "#333399",
          borderColor: "#333399",
          data: [20],
          fill: true
        },
        {
          label: "Operation",
          backgroundColor: "#00cc33",
          borderColor: "#00cc33",
          data: [5],
          fill: true
        },
        {
          label: "Settlement",
          backgroundColor: "#ff9a03",
          borderColor: "#ff9a03",
          data: [2],
          fill: true
        },
        {
          label: "Fleet Maintenance",
          backgroundColor: "#9a03ff",
          borderColor: "#9a03ff",
          data: [5],
          fill: true
        },
        {
          label: "Management",
          backgroundColor: "#ffcd03",
          borderColor: "#ffcd03",
          data: [5],
          fill: true
        },
        {
          label: "General Affair",
          backgroundColor: "#cd0303",
          borderColor: "#cd0303",
          data: [2],
          fill: true
        }
      ];
      var valuelabel = [
        ""
        // "A",
        // "B",
        // "Fleet Maintenance",
        // "Management",
        // "General Affair",
        // "Jul",
        // "Aug",
        // "Sep",
        // "Oct",
        // "Nov",
        // "Dec"
      ];

      var ctx = document.getElementById("user-chart").getContext("2d");

      // Chart.plugins.unregister(ChartDataLabels)
      Chart.helpers.merge(Chart.defaults.global.plugins.datalabels, {
        color: "black"
      });

      var myUserChart = new Chart(ctx, {
        type: "bar",
        data: {
          labels: valuelabel,
          // datasets: [
          //   {
          //     label: "Population (millions)",
          //     backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
          //     data: valuedata
          //   }
          // ]
          datasets: valuedata2
        },
        options: {
          // barValueSpacing: 20,
          maintainAspectRatio: false,
          legend: {
            display: true,
            position: "bottom",
            align: "center",
            labels: {
              generateLabels: function(chart) {
                var data = chart.data;
                if (data.datasets.length > 0) {
                  return data.datasets.map(function(x, i) {
                    // console.log(x)
                    var label = x.label;
                    var fill = x.backgroundColor;
                    var stroke = x.borderColor;
                    var total = 0;

                    x.data.map(datass => {
                      total += datass;
                    });

                    var meta = chart.getDatasetMeta(i);
                    return {
                      text: label + " (" + total + ")",
                      fillStyle: fill,
                      strokeStyle: stroke,
                      lineWidth: 1,
                      hidden: isNaN(x.data[0]) || meta.data[0].hidden,
                      datasetIndex: i
                    };
                  });
                }
              }
            },
            // reverse: true,
            fontFamily: "Segoe UI"
          },
          title: {
            display: false,
            text: "Predicted world population (millions) in 2050"
          },
          scales: {
            xAxes: [
              {
                gridLines: {
                  // display:false
                  // offsetGridLines : true
                }
              }
            ],
            yAxes: [
              {
                scaleLabel: {
                  // display: true,
                  // labelString: 'cek'
                },
                gridLines: {
                  // display:false,
                  // drawBorder: false
                },
                ticks: {
                  display: true,
                  min: 0,
                  stepSize: 10,
                  max: 30,
                  callback: function(value, index, values) {
                    return value;
                  }
                }
              }
            ]
          },
          animation: {
            duration: 1,
            onProgress: function(x) {
              // console.log(x)
              var chartInstance = x.chartInstance;
              var ctx = chartInstance.ctx;
              var dete = chartInstance.data;

              ctx.font = Chart.helpers.fontString(
                Chart.defaults.global.defaultFontSize,
                Chart.defaults.global.defaultFontStyle,
                Chart.defaults.global.defaultFontFamily
              );
              ctx.textAlign = "center";
              ctx.textBaseline = "bottom";

              dete.datasets.forEach(function(dataset, i) {
                var meta = chartInstance.controller.getDatasetMeta(i);
                meta.data.forEach(function(bar, index) {
                  var data = dataset.data[index];
                  ctx.fillText(data, bar._model.x, bar._model.y - 5);
                });
              });
            }
          },
          plugins: {
            datalabels: {
              color: "black"
              // display: function(context) {
              //   console.log("Algo: "+context);
              //   return context.dataset.data[context.dataIndex] > 15;
              // },
              // font: {
              //   weight: 'bold'
              // },
              // formatter: function(value, context) {
              //   return context.dataIndex + ': ' + Math.round(value*100) + '%';
              // }
            }
          }
        }
      });

      myUserChart.update();
    }
  },
  mounted() {
    this.getOrder();
    this.getVendorOrder();
    this.renderChart();
  }
};
</script>

<style scoped>
@import "./../../assets/css/Chart.min.css";
</style>