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
                  <span @click="changeOrder('min')" style="cursor: pointer;">
                    <font-awesome-icon class="isGrey" icon="less-than" size="lg" />
                  </span>
                </b-col>
                <b-col style="text-align: center">
                  <span>
                    <h6 class="isGrey">{{ DataOrderStatus.monthName + ' ' + DataOrderStatus.year }}</h6>
                  </span>
                </b-col>
                <b-col style="text-align: right;max-width: fit-content !important;">
                  <span @click="changeOrder('add')" style="cursor: pointer;">
                    <font-awesome-icon class="isGrey" icon="greater-than" size="lg" />
                  </span>
                </b-col>
              </b-row>
              <b-row class="row-complete-order">
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
        <b-col md="8">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Vendor Complete Order</span>
                </b-col>
                <b-col style="text-align: right;">
                  <span style="padding-right:5px">
                    <font-awesome-icon class="faw-circle__blue" icon="circle" size="sm" />
                  </span>
                  <span
                    style="padding-right:5px; font-size: 11px !important; font-weight: normal !important; color: #666666;"
                  >Order Completed</span>

                  <span style="padding-right:5px">
                    <font-awesome-icon class="faw-circle__green" icon="circle" size="sm" />
                  </span>
                  <span
                    style="padding-right:5px; font-size: 11px !important; font-weight: normal !important; color: #666666;"
                  >Invoice Submited</span>
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
                :fields="VendorOrder.Header"
                :items="VendorOrder.Data"
              >
                <template v-slot:cell(no)="data">{{data.index + 1}}</template>
                <template v-slot:cell(status)="data">
                  <b-badge class="badge-circle" variant="primary">{{data.item.status.complete}}</b-badge>&nbsp;
                  <b-badge class="badge-circle" variant="success">{{data.item.status.submit}}</b-badge>
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
              <b-row class="row-complete-order">
                <b-col>
                  <div class="buleth__blue">
                    <span>{{ DataVendorOrderStatus.target && DataVendorOrderStatus.target !== '' ? DataVendorOrderStatus.target : 0 }}</span>
                  </div>
                  <div class="buleth-text">Order Completed</div>
                </b-col>
                <b-col>
                  <div class="buleth__green">
                    <span>{{ DataVendorOrderStatus.achievement && DataVendorOrderStatus.achievement !== '' ? DataVendorOrderStatus.achievement : 0 }}</span>
                  </div>
                  <div class="buleth-text">Invoice Submited</div>
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
                  <span>Outstanding Invoice</span>
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
                  >Paid</span>
                </b-col>
                <b-col md="3" style="text-align: right;">
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
                :fields="Order.Header"
                :items="Order.Data"
              >
                <template v-slot:cell(no)="data">{{data.index + 1}}</template>
                <template v-slot:cell(status)="data">
                  <b-badge class="badge-circle" variant="primary">{{data.item.status.progress}}</b-badge>&nbsp;
                  <b-badge class="badge-circle" variant="success">{{data.item.status.invoice}}</b-badge>
                </template>
              </b-table>
            </div>
          </div>
        </b-col>
        <b-col md="6">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Vendor Payment</span>
                </b-col>
                <b-col style="text-align: right;">
                  <span style="padding-right:5px">
                    <font-awesome-icon class="faw-circle__red" icon="circle" size="sm" />
                  </span>
                  <span
                    style="padding-right:5px; font-size: 11px !important; font-weight: normal !important; color: #666666;"
                  >Pending</span>

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
                  >Paid</span>
                </b-col>
                <b-col md="3" style="text-align: right;">
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
                :fields="Order.Header"
                :items="Order.Data"
              >
                <template v-slot:cell(no)="data">{{data.index + 1}}</template>
                <template v-slot:cell(status)="data">
                  <b-badge class="badge-circle" variant="primary">{{data.item.status.progress}}</b-badge>&nbsp;
                  <b-badge class="badge-circle" variant="success">{{data.item.status.invoice}}</b-badge>
                </template>
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
      DataOrderStatus: {
        month: "",
        monthName: "",
        year: "",
        target: "",
        achievement: "",
        targetPoint: "",
        achievementPoint: ""
      },

      VendorOrder: {
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
              complete: 4,
              submit: 3
            }
          },
          {
            name: "PT Gemini Perkasa Abadi",
            status: {
              complete: 4,
              submit: 3
            }
          },
          {
            name: "PT Garuda Perkasa",
            status: {
              complete: 4,
              submit: 3
            }
          },
          {
            name: "PT Indo Sejahtera",
            status: {
              complete: 4,
              submit: 3
            }
          },
          {
            name: "PT Abadi Sentosa",
            status: {
              complete: 4,
              submit: 3
            }
          },
          {
            name: "PT Gemini Perkasa Abadi",
            status: {
              complete: 4,
              submit: 3
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
    changeOrder(act) {
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