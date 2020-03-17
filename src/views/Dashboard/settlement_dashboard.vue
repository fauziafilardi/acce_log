<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="8">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Complete Order</span>
                </b-col>
                <b-col style="text-align: right;">
                  <span style="padding-right:5px">
                    <font-awesome-icon
                      style="font-size: medium; color: #333399;"
                      icon="circle"
                      size="sm"
                    />
                  </span>
                  <span
                    style="padding-right:5px; font-size: 11px !important; font-weight: normal !important; color: #666666;"
                  >On Progress</span>

                  <span style="padding-right:5px">
                    <font-awesome-icon
                      style="font-size: medium; color: #cc0000;"
                      icon="circle"
                      size="sm"
                    />
                  </span>
                  <span
                    style="padding-right:5px; font-size: 11px !important; font-weight: normal !important; color: #666666;"
                  >Create Invoice</span>
                </b-col>
                <b-col md="2" style="text-align: right;">
                  <span>
                    <ABSButton
                      :text="'View All (5)'"
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
                :fields="Order.Header"
                :items="Order.Data"
              >
                <template v-slot:cell(no)="data">{{data.index + 1}}</template>
                <template v-slot:cell(status)="data">
                  <b-badge
                    style="height: 12px !important; width: 12px !important; font-size: 10px !important; padding: 1px 3px !important;"
                    variant="primary"
                  >{{data.item.status.progress}}</b-badge>&nbsp;
                  <b-badge
                    style="height: 12px !important; width: 12px !important; font-size: 10px !important; padding: 1px 3px !important;"
                    variant="danger"
                  >{{data.item.status.invoice}}</b-badge>
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
                  <span>Complete Order Status</span>
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <b-row>
                <b-col style="max-width: fit-content !important;">
                  <span @click="changeProspect('min')" style="cursor: pointer;">
                    <font-awesome-icon class="isGrey" icon="less-than" size="lg" />
                  </span>
                </b-col>
                <b-col style="text-align: center">
                  <span>
                    <h6 class="isGrey">{{ DataOrderStatus.monthName + ' ' + DataOrderStatus.year }}</h6>
                  </span>
                </b-col>
                <b-col style="text-align: right;max-width: fit-content !important;">
                  <span @click="changeProspect('add')" style="cursor: pointer;">
                    <font-awesome-icon class="isGrey" icon="greater-than" size="lg" />
                  </span>
                </b-col>
              </b-row>
              <b-row style="margin-top:37px;margin-bottom:36px;">
                <b-col>
                  <div class="buleth__blue">
                    <span>{{ DataOrderStatus.target && DataOrderStatus.target !== '' ? DataOrderStatus.target : 0 }}</span>
                  </div>
                  <div class="buleth-text">On Progress</div>
                </b-col>
                <b-col>
                  <div class="buleth__red">
                    <span>{{ DataOrderStatus.achievement && DataOrderStatus.achievement !== '' ? DataOrderStatus.achievement : 0 }}</span>
                  </div>
                  <div class="buleth-text">Create Invoice</div>
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
                <b-col style="max-width:fit-content !important;">
                  <span>Appointment</span>
                </b-col>
                <b-col style="text-align: right;">
                  <span>
                    <ABSButton
                      :text="'View All (5)'"
                      classButton="button button--new"
                      classIcon="icon-style-1"
                      :disabled="true"
                    />
                  </span>
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <b-row class="AppointmentData" v-for="(data, index) in ToDoList" v-bind:key="index">
                <b-col style="max-width:fit-content !important;">
                  <div style="width:50px;">
                    <div class="CalendarTagMonth">{{data.month}}</div>
                    <div class="CalendarTagDate">{{data.date}}</div>
                  </div>
                </b-col>
                <b-col style="margin: auto;">
                  <span class="AppointmentTitle">{{data.time}}</span>
                  <br />
                  <span class="AppointmentDescs">{{data.name}}</span>
                </b-col>
                <b-col class="AppointmentIcon">
                  <span>
                    <font-awesome-icon
                      v-if="data.action.icon"
                      style="color: #333399;"
                      :icon="data.action.icon"
                      size="lg"
                    />
                  </span>
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
                  <span>Quotation</span>
                </b-col>
                <b-col style="text-align: right;">
                  <span>
                    <ABSButton
                      :text="'View All (5)'"
                      classButton="button button--new"
                      classIcon="icon-style-1"
                      :disabled="true"
                    />
                  </span>
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <!-- <div class="table--list"> -->
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
                :fields="Quotation.Header"
                :items="Quotation.Data"
                thStyle="padding: 5px !important;"
              >
                <!-- class="table-sm table-style-1" -->
                <template v-slot:cell(no)="data">{{data.index + 1}}</template>
              </b-table>
              <!-- </div> -->
            </div>
          </div>
        </b-col>
        <b-col md="6">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Order</span>
                </b-col>
                <b-col style="text-align: right;">
                  <span style="position: absolute; right: 25%;">
                    <b-badge variant="warning">&nbsp;</b-badge>
                    <span
                      style="color: #666666; font-size:12px; font-weight: normal !important; padding-left: 5px;"
                    >Pending</span> &nbsp;
                    <b-badge variant="success">&nbsp;</b-badge>
                    <span
                      style="color: #666666; font-size:12px; font-weight: normal !important; padding-left: 5px;"
                    >On Progress</span> &nbsp;
                    <b-badge variant="danger">&nbsp;</b-badge>
                    <span
                      style="color: #666666; font-size:12px; font-weight: normal !important; padding-left: 5px;"
                    >Issue</span> &nbsp;
                  </span>
                  <span>
                    <ABSButton
                      :text="'View All (5)'"
                      classButton="button button--new"
                      classIcon="icon-style-1"
                      :disabled="true"
                    />
                  </span>
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <!-- <div class="table--list"> -->
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
                :fields="Order.Header"
                :items="Order.Data"
              >
                <!-- class="table-sm table-style-1" -->
                <template v-slot:cell(no)="data">{{data.index + 1}}</template>
                <template v-slot:cell(status)="data">
                  <b-badge
                    style="height: 12px !important; width: 12px !important; font-size: 10px !important; padding: 1px 3px !important;"
                    variant="warning"
                  >{{data.item.status.pending}}</b-badge>&nbsp;
                  <b-badge
                    style="height: 12px !important; width: 12px !important; font-size: 10px !important; padding: 1px 3px !important;"
                    variant="success"
                  >{{data.item.status.progress}}</b-badge>&nbsp;
                  <b-badge
                    style="height: 12px !important; width: 12px !important; font-size: 10px !important; padding: 1px 3px !important;"
                    variant="danger"
                  >{{data.item.status.issue}}</b-badge>
                </template>
              </b-table>
              <!-- </div> -->
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
                  <span>Outstanding Payment</span>
                </b-col>
                <b-col style="text-align: right;">
                  <span>
                    <ABSButton
                      :text="'View All (5)'"
                      classButton="button button--new"
                      classIcon="icon-style-1"
                      :disabled="true"
                    />
                  </span>
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <!-- <div class="table--list"> -->
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
                :fields="Outstanding.Header"
                :items="Outstanding.Data"
              >
                <!-- class="table-sm table-style-1" -->
                <template v-slot:cell(no)="data">{{data.index + 1}}</template>
              </b-table>
              <!-- </div> -->
            </div>
          </div>
        </b-col>
        <b-col md="6">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Commision</span>
                </b-col>
                <b-col style="text-align: right;">
                  <span>
                    <ABSButton
                      :text="'View All (5)'"
                      classButton="button button--new"
                      classIcon="icon-style-1"
                      :disabled="true"
                    />
                  </span>
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <b-row class="CommisionData">
                <b-col class="CommisionIcon">
                  <span>
                    <font-awesome-icon
                      style="color: #333399;margin-right: 20px;"
                      icon="coins"
                      size="4x"
                    />
                  </span>
                </b-col>
                <b-col style="margin: auto;">
                  <span class="Commision__TitleBlue">Paid</span> &nbsp;
                  <span class="CommisionTitle">(Last 12 Months)</span>
                  <br />
                  <span class="CommisionDescs">Rp 22.500.000</span>
                </b-col>
              </b-row>
              <b-row class="CommisionData">
                <b-col class="CommisionIcon">
                  <span>
                    <font-awesome-icon
                      style="color: #cc0000;margin-right: 20px;"
                      icon="exclamation-circle"
                      size="4x"
                    />
                  </span>
                </b-col>
                <b-col style="margin: auto;">
                  <span class="Commision__TitleRed">Overdue</span> &nbsp;
                  <span class="CommisionTitle"></span>
                  <br />
                  <span class="CommisionDescs">Rp 13.250.000</span>
                </b-col>
              </b-row>
              <b-row class="CommisionData">
                <b-col class="CommisionIcon">
                  <span>
                    <font-awesome-icon
                      style="color: #00cc33;margin-right: 20px;"
                      icon="stopwatch"
                      size="5x"
                    />
                  </span>
                </b-col>
                <b-col style="margin: auto;">
                  <span class="Commision__TitleGreen">Pending</span> &nbsp;
                  <span class="CommisionTitle"></span>
                  <br />
                  <span class="CommisionDescs">Rp 32.380.000</span>
                </b-col>
              </b-row>
            </div>
          </div>
        </b-col>
      </b-row>
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Open Bidding</span>
                </b-col>
                <b-col style="text-align: right;">
                  <span>
                    <ABSButton
                      :text="'View All (5)'"
                      classButton="button button--new"
                      classIcon="icon-style-1"
                      :disabled="true"
                    />
                  </span>
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <!-- <div class="table--list"> -->
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
                :fields="Bidding.Header"
                :items="Bidding.Data"
              >
                <!-- class="table-sm table-style-1" -->
                <template v-slot:cell(no)="data">{{data.index + 1}}</template>
              </b-table>
              <!-- </div> -->
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
      ToDoList: [
        {
          status: "1",
          name: "PT Abadi Sentosa",
          lastaction: "01/01/2010 12.00",
          warning: true,
          nextaction: "10/01/2010 12.00",
          action: {
            status: "1",
            icon: "phone-square-alt"
          },
          date: "10",
          month: "Jan",
          time: "12.00"
        },
        {
          status: "1",
          name: "PT Gemini Perkasa Abadi",
          lastaction: "01/01/2010 12.00",
          warning: false,
          nextaction: "10/01/2010 12.00",
          action: {
            status: "1",
            icon: "phone-square-alt"
          },
          date: "09",
          month: "Jan",
          time: "12.00"
        },
        {
          status: "2",
          name: "PT Garuda Perkasa",
          lastaction: "01/01/2010 12.00",
          warning: false,
          nextaction: "10/01/2010 12.00",
          action: {
            status: "2",
            icon: "hand-paper"
          },
          date: "07",
          month: "Jan",
          time: "11.00"
        },
        {
          status: "3",
          name: "PT Indo Sejahtera",
          lastaction: "01/01/2010 12.00",
          warning: false,
          nextaction: "10/01/2010 12.00",
          action: {
            status: "2",
            icon: "utensils"
          },
          date: "02",
          month: "Jan",
          time: "10.00"
        }
      ],
      Quotation: {
        Header: [
          {
            key: "no",
            label: "No",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          },
          {
            key: "name",
            label: "Customer",
            thClass: "HeaderTable",
            tdClass: "ContentTable"
          },
          {
            key: "date",
            label: "Date",
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
            name: "PT Abadi Sentosa",
            date: "10/01/2020",
            type: "Project Base"
          },
          {
            name: "PT Gemini Perkasa Abadi",
            date: "10/01/2020",
            type: "FTL"
          },
          {
            name: "PT Garuda Perkasa",
            date: "10/01/2020",
            type: "LTL"
          },
          {
            name: "PT Indo Sejahtera",
            date: "10/01/2020",
            type: "Rental"
          },
          {
            name: "PT Abadi Sentosa",
            date: "10/01/2020",
            type: "Project Base"
          },
          {
            name: "PT Gemini Perkasa Abadi",
            date: "10/01/2020",
            type: "FTL"
          },
          {
            name: "PT Garuda Perkasa",
            date: "10/01/2020",
            type: "LTL"
          },
          {
            name: "PT Indo Sejahtera",
            date: "10/01/2020",
            type: "Rental"
          }
        ]
      },
      Order: {
        Header: [
          {
            key: "no",
            label: "No",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          },
          {
            key: "name",
            label: "Customer",
            thClass: "HeaderTable",
            tdClass: "ContentTable"
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
            name: "PT Abadi Sentosa",
            status: {
              progress: 4,
              invoice: 3
            }
          },
          {
            name: "PT Gemini Perkasa Abadi",
            status: {
              progress: 4,
              invoice: 3
            }
          },
          {
            name: "PT Garuda Perkasa",
            status: {
              progress: 4,
              invoice: 3
            }
          },
          {
            name: "PT Indo Sejahtera",
            status: {
              progress: 4,
              invoice: 3
            }
          },
          {
            name: "PT Abadi Sentosa",
            status: {
              progress: 4,
              invoice: 3
            }
          },
          {
            name: "PT Gemini Perkasa Abadi",
            status: {
              progress: 4,
              invoice: 3
            }
          }
        ]
      },
      Outstanding: {
        Header: [
          {
            key: "no",
            label: "No",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          },
          {
            key: "name",
            label: "Customer",
            thClass: "HeaderTable",
            tdClass: "ContentTable"
          },
          {
            key: "outstanding",
            label: "Total Outstanding Payment",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          }
        ],
        Data: [
          {
            name: "PT Abadi Sentosa",
            outstanding: "150.000.000"
          },
          {
            name: "PT Gemini Perkasa Abadi",
            outstanding: "175.000.000"
          },
          {
            name: "PT Garuda Perkasa",
            outstanding: "225.000.000"
          },
          {
            name: "PT Indo Sejahtera",
            outstanding: "455.000.000"
          },
          {
            name: "PT Abadi Sentosa",
            outstanding: "144.500.000"
          },
          {
            name: "PT Gemini Perkasa Abadi",
            outstanding: "255.000.000"
          },
          {
            name: "PT Garuda Perkasa",
            outstanding: "125.000.000"
          },
          {
            name: "PT Indo Sejahtera",
            outstanding: "334.000.000"
          }
        ]
      },
      Bidding: {
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
            key: "name",
            label: "Customer",
            thClass: "HeaderTable",
            tdClass: "ContentTable"
          },
          {
            key: "fromto",
            label: "From - To",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          },
          {
            key: "value",
            label: "Value",
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
            date: "10/01/2020",
            name: "PT Abadi Sentosa",
            fromto: "JKT - SMG",
            value: "120.000.000",
            type: "Project Base"
          },
          {
            date: "10/01/2020",
            name: "PT Gemini Perkasa Abadi",
            fromto: "JKT - BDG",
            value: "75.000.000",
            type: "FTL"
          },
          {
            date: "10/01/2020",
            name: "PT Garuda Perkasa",
            fromto: "JKT - BDR",
            value: "55.000.000",
            type: "LTL"
          },
          {
            date: "10/01/2020",
            name: "PT Indo Sejahtera",
            fromto: "JKT - SBY",
            value: "105.000.000",
            type: "Rental"
          },
          {
            date: "10/01/2020",
            name: "PT Abadi Sentosa",
            fromto: "JKT - SMG",
            value: "230.000.000",
            type: "Project Base"
          },
          {
            date: "10/01/2020",
            name: "PT Gemini Perkasa Abadi",
            fromto: "JKT - BDG",
            value: "75.000.000",
            type: "FTL"
          },
          {
            date: "10/01/2020",
            name: "PT Garuda Perkasa",
            fromto: "JKT - BDR",
            value: "55.000.000",
            type: "LTL"
          },
          {
            date: "10/01/2020",
            name: "PT Indo Sejahtera",
            fromto: "JKT - SBY",
            value: "105.000.000",
            type: "Rental"
          }
        ]
      },
      Prospect: [
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

      DataOrderStatus: {
        month: "",
        monthName: "",
        year: "",
        target: "",
        achievement: "",
        targetPoint: "",
        achievementPoint: ""
      }
    };
  },
  computed: {},
  methods: {
    getOrder(date = null) {
      var now = date ? new Date(date) : new Date();
      var month = now.getMonth();
      var year = now.getFullYear();
      var datas = this.Prospect.filter(x => {
        return (
          x.month.toString() === (month + 1).toString() &&
          x.year.toString() === year.toString()
        );
      });
      console.log(datas);

      this.DataOrderStatus = {
        month: month + 1,
        monthName: this.getMonthName(now),
        year: year,
        target: datas.length > 0 ? datas[0].target : 0,
        achievement: datas.length > 0 ? datas[0].achievement : 0,
        targetPoint: datas.length > 0 ? datas[0].targetPoint : 0,
        achievementPoint: datas.length > 0 ? datas[0].achievementPoint : 0
      };

      console.log(this.DataOrderStatus);
    },
    changeProspect(act) {
      var date = new Date();
      if (act === "min") {
        // var d = moment(date, 'YYYY-MM-DD').add(i, number)
        var mth =
          this.DataOrderStatus.month && this.DataOrderStatus.month !== ""
            ? parseInt(this.DataOrderStatus.month)
            : 0;
        var year = this.DataOrderStatus.year;
        mth = mth < 10 ? "0" + mth : mth;
        var frm = year + "-" + mth + "-" + "01";
        date = this.dateAdd2("m", frm, -1);
        // date = this.momentDateFormatting(date, frm)
      } else if (act === "add") {
        var mth =
          this.DataOrderStatus.month && this.DataOrderStatus.month !== ""
            ? parseInt(this.DataOrderStatus.month)
            : 0;
        var year = this.DataOrderStatus.year;
        mth = mth < 10 ? "0" + mth : mth;
        var frm = year + "-" + mth + "-" + "01";
        date = date = this.dateAdd2("m", frm, 1);
        // date = this.momentDateFormatting(date, frm)
      }

      console.log(date);
      this.getOrder(date);
    }
  },
  mounted() {
    this.getOrder();
  }
};
</script>