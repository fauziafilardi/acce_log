<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__title">
      <b-row>
        <b-col cols="12" class="dash-header">
          {{ $t("dashboard") }}
        </b-col>
      </b-row>
    </div>
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="8">
          <div class="card">
              <div class="dash-title">Target</div>
              <div class="card-body">
                <b-row>
                  <b-col>
                    <canvas id="bar-chart" width="350" height="100"></canvas>
                    <hr>
                  </b-col>
                </b-row>
                <b-row>
                  <b-col md="2">
                    Cumulative Totale
                  </b-col>
                  <b-col class="ChartLegend__Wrap">
                    <b-row>
                      <b-col md="2" style="padding-left: 15px !important;">
                        <b-row>
                          <b-col>
                            <div class="ChartLegend__Content" style="text-align: right;">
                              <span>Target</span>
                            </div>
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col>
                            <div class="ChartLegend__Content" style="text-align: right;">
                              <span>Achievement</span>
                            </div>
                          </b-col>
                        </b-row>
                      </b-col>
                      <b-col md="2">
                        <b-row>
                          <b-col md="2">
                            <div class="ChartLegend__Content" style="background-color: blue; width: 10px; height: 10px; padding: 10px;"></div>
                          </b-col>
                          <b-col md="10" style="padding-left: 10px !important;">
                            <span>53.4 M</span>
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col md="2">
                            <div class="ChartLegend__Content" style="background-color: green; width: 10px; height: 10px; padding: 10px;"></div>
                          </b-col>
                          <b-col md="10" style="padding-left: 10px !important;">
                            <span>47.5 M</span>
                          </b-col>
                        </b-row>
                      </b-col>
                      <b-col md="8">
                        <span style="font-size: 34px; font-weight: bold;">(98.5 %)</span>
                      </b-col>
                    </b-row>
                  </b-col>
                </b-row>
              </div>
            </div>
        </b-col>
        <b-col md="4">
          <div class="card">
              <div class="dash-title">
                <b-row>
                  <b-col>New Prospect</b-col>
                  <b-col md="6" style="text-align: right;">
                    <span>
                      <ABSButton
                        :text="'Add New'"
                        classButton="button button--new"
                        classIcon="icon-style-1"
                        :disabled="true"
                      />
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
              <div class="card-body">
                <b-row>
                  <b-col md="1">
                    <font-awesome-icon class="isGrey" icon="less-than" size="lg" />
                  </b-col>
                  <b-col md="10" style="text-align: center">
                    <h4 class="isGrey">March 2020</h4>
                  </b-col>
                  <b-col md="1" style="text-align: right">
                    <font-awesome-icon class="isGrey" icon="greater-than" size="lg" />
                  </b-col>
                </b-row>
                <b-row>
                  <b-col>
                    <div class="buleth" style="background-color: blue;">
                      <span>10</span>
                    </div>
                    <div class="buleth-text">Target</div>
                  </b-col>
                  <b-col>
                    <div class="buleth" style="background-color: green;">
                      <span>7</span>
                    </div>
                    <div class="buleth-text">Achievement</div>
                  </b-col>
                </b-row>
                <br>
                <b-row>
                  <b-col>
                    <div class="card">
                      <div class="dash-title" style="background-color: #E3E7EE !important; border-bottom: 1px solid white !important;">
                        Monthly Point
                      </div>
                      <div class="card-body" style="background-color: #E3E7EE !important;">
                        <b-row>
                          <b-col md="6">Target</b-col>
                          <b-col md="6">: 1056 Point</b-col>
                        </b-row>
                        <b-row>
                          <b-col md="6">Achievement Point</b-col>
                          <b-col md="6">: 788 Point</b-col>
                        </b-row>
                      </div>
                    </div>
                  </b-col>
                </b-row>
              </div>
          </div>
        </b-col>
      </b-row>
      <b-row class="dashboardBody">
        <b-col md="8">
          <div class="card">
            <div class="dash-title">
              <b-row>
                  <b-col>To Do List</b-col>
                  <b-col md="6" style="text-align: right;">
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
            <div class="card-body">
              <div class="MyBadge__Header">
                <b-row>
                  <b-col style="text-align: center;" md="2">Status</b-col>
                  <b-col style="text-align: center;" md="3">Customer Name</b-col>
                  <b-col style="text-align: center;" md="2">Last Action</b-col>
                  <b-col style="text-align: center;" md="3">Next Action</b-col>
                  <b-col style="text-align: center;" md="2">Action</b-col>
                </b-row>
              </div>
              <div class="MyBadge__Content" v-for="(data, index) in ToDoList" v-bind:key="index">
                <b-row>
                  <b-col class="ContentFillBadge" style="text-align: center;" md="2">
                    <div v-if="data.status == '1'" class="badge-success badgeStatus">New</div>
                    <div v-if="data.status == '2'" class="badge-primary badgeStatus">Negotiation</div>
                    <div v-if="data.status == '3'" class="badge-danger badgeStatus">Maintain</div>
                    <!-- <b-badge v-if="data.status == '1'" variant="success">
                      <h4>New</h4>
                    </b-badge>
                    <b-badge v-if="data.status == '2'" variant="primary">
                      <h4>Negotiation</h4>
                    </b-badge>
                    <b-badge v-if="data.status == '3'" variant="danger">
                      <h4>Maintain</h4>
                    </b-badge> -->
                  </b-col>
                  <b-col class="contentFill" md="3">
                    <span>{{data.name}}</span>
                  </b-col>
                  <b-col class="contentFill" style="text-align: center;" md="2">
                    <span>{{data.lastaction}}</span>
                  </b-col>
                  <b-col class="contentFill" style="text-align: right; padding-right: 2% !important;" md="3">
                    <span><font-awesome-icon v-if="data.warning" style="color: red;" icon="exclamation-triangle" size="sm" /> {{data.nextaction}}</span>
                  </b-col>
                  <b-col class="contentFill" md="2">
                    <b-row>
                      <b-col style="padding-left: 20% !important; padding-top: 2px;">
                        <div class="ChartLegend__Content" :style="'background-color: '+(data.action.status == '1' ? 'blue' : 'green')+'; width: 10px; height: 10px; padding: 10px; border-radius: 10px;'"></div>
                      </b-col>
                      <b-col style="padding-left: 20% !important; padding-top: 2px;">
                        <font-awesome-icon v-if="data.action.icon" style="color: blue;" :icon="data.action.icon" size="lg" />
                      </b-col>
                    </b-row>
                  </b-col>
                </b-row>
              </div>
            </div>
          </div>
        </b-col>
        <b-col md="4">
          <div class="card">
              <div class="dash-title">
                <b-row>
                  <b-col>Appointment</b-col>
                  <b-col md="6" style="text-align: right;">
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
              <div class="card-body">
                <b-row class="Appointment__Data" v-for="(data, index) in ToDoList" v-bind:key="index">
                  <b-col md="2">
                    <div>
                      <div class="CalendarTag__Month"> {{data.month}} </div>
                      <div class="CalendarTag__Date"> {{data.date}} </div>
                    </div>
                  </b-col>
                  <b-col style="padding-top: 1.5%;">
                    <span class="Appointment__Title">
                      {{data.time}}
                    </span>
                    <br>
                    <span class="Appointment__Descs">
                      {{data.name}}
                    </span>
                  </b-col>
                  <b-col class="Appointment__Icon">
                    <span>
                      <font-awesome-icon v-if="data.action.icon" style="color: blue;" :icon="data.action.icon" size="lg" />
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
            <div class="dash-title">
              <b-row>
                  <b-col>Quotation</b-col>
                  <b-col md="6" style="text-align: right;">
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
            <div class="card-body">
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
                >
                  <!-- class="table-sm table-style-1" -->
                  <template v-slot:cell(no)="data">
                    {{data.index + 1}}
                  </template>
                </b-table>
              <!-- </div> -->
            </div>
          </div>
        </b-col>
        <b-col md="6">
          <div class="card">
            <div class="dash-title">
              <b-row>
                  <b-col>Order</b-col>
                  <b-col md="8" style="text-align: right;">
                    <span style="position: absolute; right: 25%;">
                      <b-badge variant="warning">&nbsp;</b-badge> <span style="color: #7f8084;"> Pending</span> &nbsp;
                      <b-badge variant="success">&nbsp;</b-badge> <span style="color: #7f8084;"> On Progress</span> &nbsp;
                      <b-badge variant="danger">&nbsp;</b-badge> <span style="color: #7f8084;"> Issue</span> &nbsp;
                    </span>
                    <span style="position: absolute; right: 0px;">
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
            <div class="card-body">
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
                  <template v-slot:cell(no)="data">
                    {{data.index + 1}}
                  </template>
                  <template v-slot:cell(status)="data">
                      <b-badge variant="warning">{{data.item.status.pending}}</b-badge> &nbsp;
                      <b-badge variant="success">{{data.item.status.progress}}</b-badge> &nbsp;
                      <b-badge variant="danger">{{data.item.status.issue}}</b-badge>
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
            <div class="dash-title">
              <b-row>
                  <b-col>Outstanding Payment</b-col>
                  <b-col md="6" style="text-align: right;">
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
            <div class="card-body">
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
                  <template v-slot:cell(no)="data">
                    {{data.index + 1}}
                  </template>
                </b-table>
              <!-- </div> -->
            </div>
          </div>
        </b-col>
        <b-col md="6">
          <div class="card">
            <div class="dash-title">
              <b-row>
                  <b-col>Commision</b-col>
                  <b-col md="6" style="text-align: right;">
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
            <div class="card-body">
              <div class="Commision__Wrapper">
                  <div class="Commision__Icon">
                      <font-awesome-icon style="color: blue;" icon="coins" size="6x" />
                  </div>
                  <div class="Commision__Text">
                        <span>
                            <span class="Commision__TitleBlue">Paid</span> &nbsp;
                            <span class="Commision__Title">(Last 12 Months)</span> <br>
                            <span class="Commision__Descs">Rp 22.500.000</span>
                        </span>
                  </div>
              </div>
              <div class="Commision__Wrapper">
                  <div class="Commision__Icon">
                      <font-awesome-icon style="color: #dc3545;" icon="exclamation-circle" size="6x" />
                  </div>
                  <div class="Commision__Text">
                        <span>
                            <span class="Commision__TitleRed">Overdue</span> &nbsp;
                            <span class="Commision__Title"></span> <br>
                            <span class="Commision__Descs">Rp 13.250.000</span>
                        </span>
                  </div>
              </div>
              <div class="Commision__Wrapper">
                  <div class="Commision__Icon">
                      <font-awesome-icon style="color: #28a745;" icon="stopwatch" size="6x" />
                  </div>
                  <div class="Commision__Text">
                        <span>
                            <span class="Commision__TitleGreen">Pending</span> &nbsp;
                            <span class="Commision__Title"></span> <br>
                            <span class="Commision__Descs">Rp 32.380.000</span>
                        </span>
                  </div>
              </div>
            </div>
          </div>
        </b-col>
      </b-row>
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card">
            <div class="dash-title">
              <b-row>
                  <b-col>Open Bidding</b-col>
                  <b-col md="6" style="text-align: right;">
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
            <div class="card-body">
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
                  <template v-slot:cell(no)="data">
                    {{data.index + 1}}
                  </template>
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
    data () {
        return {
            ToDoList: [
                {
                status: '1',
                name: 'PT Abadi Sentosa',
                lastaction: '01/01/2010 12.00',
                warning: true,
                nextaction: '10/01/2010 12.00',
                action: {
                    status: '1',
                    icon: 'phone-square-alt'
                },
                date: "10",
                month: "Jan",
                time: "12.00"
                },
                {
                status: '1',
                name: 'PT Gemini Perkasa Abadi',
                lastaction: '01/01/2010 12.00',
                warning: false,
                nextaction: '10/01/2010 12.00',
                action: {
                    status: '1',
                    icon: 'phone-square-alt'
                },
                date: "09",
                month: "Jan",
                time: "12.00"
                },
                {
                status: '2',
                name: 'PT Garuda Perkasa',
                lastaction: '01/01/2010 12.00',
                warning: false,
                nextaction: '10/01/2010 12.00',
                action: {
                    status: '2',
                    icon: 'hand-paper'
                },
                date: "07",
                month: "Jan",
                time: "11.00"
                },
                {
                status: '3',
                name: 'PT Indo Sejahtera',
                lastaction: '01/01/2010 12.00',
                warning: false,
                nextaction: '10/01/2010 12.00',
                action: {
                    status: '2',
                    icon: 'utensils'
                },
                date: "02",
                month: "Jan",
                time: "10.00"
                }
            ],
            Quotation: {
                Header: [
                    {
                        key: 'no',
                        label: 'No',
                        thClass: 'HeaderTable',
                        tdClass: 'ContentTable__Center'
                    },
                    {
                        key: 'name',
                        label: 'Customer',
                        thClass: 'HeaderTable',
                        tdClass: 'ContentTable'
                    },
                    {
                        key: 'date',
                        label: 'Date',
                        thClass: 'HeaderTable',
                        tdClass: 'ContentTable__Center'
                    },
                    {
                        key: 'type',
                        label: 'Type',
                        thClass: 'HeaderTable',
                        tdClass: 'ContentTable__Center'
                    }
                ],
                Data: [
                    {
                        name: 'PT Abadi Sentosa',
                        date: '10/01/2020',
                        type: 'Project Base'
                    },
                    {
                        name: 'PT Gemini Perkasa Abadi',
                        date: '10/01/2020',
                        type: 'FTL'
                    },
                    {
                        name: 'PT Garuda Perkasa',
                        date: '10/01/2020',
                        type: 'LTL'
                    },
                    {
                        name: 'PT Indo Sejahtera',
                        date: '10/01/2020',
                        type: 'Rental'
                    },
                    {
                        name: 'PT Abadi Sentosa',
                        date: '10/01/2020',
                        type: 'Project Base'
                    },
                    {
                        name: 'PT Gemini Perkasa Abadi',
                        date: '10/01/2020',
                        type: 'FTL'
                    },
                    {
                        name: 'PT Garuda Perkasa',
                        date: '10/01/2020',
                        type: 'LTL'
                    },
                    {
                        name: 'PT Indo Sejahtera',
                        date: '10/01/2020',
                        type: 'Rental'
                    }
                ]
            },
            Order: {
                Header: [
                    {
                        key: 'no',
                        label: 'No',
                        thClass: 'HeaderTable',
                        tdClass: 'ContentTable__Center'
                    },
                    {
                        key: 'name',
                        label: 'Customer',
                        thClass: 'HeaderTable',
                        tdClass: 'ContentTable'
                    },
                    {
                        key: 'status',
                        label: 'Status',
                        thClass: 'HeaderTable',
                        tdClass: 'ContentTable__Center'
                    }
                ],
                Data: [
                    {
                        name: 'PT Abadi Sentosa',
                        status: {
                            pending: 2,
                            progress: 4,
                            issue: 3
                        },
                    },
                    {
                        name: 'PT Gemini Perkasa Abadi',
                        status: {
                            pending: 2,
                            progress: 4,
                            issue: 3
                        },
                    },
                    {
                        name: 'PT Garuda Perkasa',
                        status: {
                            pending: 2,
                            progress: 4,
                            issue: 3
                        },
                    },
                    {
                        name: 'PT Indo Sejahtera',
                        status: {
                            pending: 2,
                            progress: 4,
                            issue: 3
                        },
                    },
                    {
                        name: 'PT Abadi Sentosa',
                        status: {
                            pending: 2,
                            progress: 4,
                            issue: 3
                        },
                    },
                    {
                        name: 'PT Gemini Perkasa Abadi',
                        status: {
                            pending: 2,
                            progress: 4,
                            issue: 3
                        },
                    },
                    {
                        name: 'PT Garuda Perkasa',
                        status: {
                            pending: 2,
                            progress: 4,
                            issue: 3
                        },
                    },
                    {
                        name: 'PT Indo Sejahtera',
                        status: {
                            pending: 2,
                            progress: 4,
                            issue: 3
                        },
                    }
                ]
            },
            Outstanding: {
                Header: [
                    {
                        key: 'no',
                        label: 'No',
                        thClass: 'HeaderTable',
                        tdClass: 'ContentTable__Center'
                    },
                    {
                        key: 'name',
                        label: 'Customer',
                        thClass: 'HeaderTable',
                        tdClass: 'ContentTable'
                    },
                    {
                        key: 'outstanding',
                        label: 'Total Outstanding Payment',
                        thClass: 'HeaderTable',
                        tdClass: 'ContentTable__Center'
                    }
                ],
                Data: [
                    {
                        name: 'PT Abadi Sentosa',
                        outstanding: '150.000.000'
                    },
                    {
                        name: 'PT Gemini Perkasa Abadi',
                        outstanding: '175.000.000'
                    },
                    {
                        name: 'PT Garuda Perkasa',
                        outstanding: '225.000.000'
                    },
                    {
                        name: 'PT Indo Sejahtera',
                        outstanding: '455.000.000'
                    },
                    {
                        name: 'PT Abadi Sentosa',
                        outstanding: '144.500.000'
                    },
                    {
                        name: 'PT Gemini Perkasa Abadi',
                        outstanding: '255.000.000'
                    },
                    {
                        name: 'PT Garuda Perkasa',
                        outstanding: '125.000.000'
                    },
                    {
                        name: 'PT Indo Sejahtera',
                        outstanding: '334.000.000'
                    }
                ]
            },
            Bidding: {
                Header: [
                    {
                        key: 'no',
                        label: 'No',
                        thClass: 'HeaderTable',
                        tdClass: 'ContentTable__Center'
                    },
                    {
                        key: 'date',
                        label: 'Date',
                        thClass: 'HeaderTable',
                        tdClass: 'ContentTable__Center'
                    },
                    {
                        key: 'name',
                        label: 'Customer',
                        thClass: 'HeaderTable',
                        tdClass: 'ContentTable'
                    },
                    {
                        key: 'fromto',
                        label: 'From - To',
                        thClass: 'HeaderTable',
                        tdClass: 'ContentTable__Center'
                    },
                    {
                        key: 'value',
                        label: 'Value',
                        thClass: 'HeaderTable',
                        tdClass: 'ContentTable__Center'
                    },
                    {
                        key: 'type',
                        label: 'Type',
                        thClass: 'HeaderTable',
                        tdClass: 'ContentTable__Center'
                    }
                ],
                Data: [
                    {
                        date: '10/01/2020',
                        name: 'PT Abadi Sentosa',
                        fromto: 'JKT - SMG',
                        value: '120.000.000',
                        type: 'Project Base'
                    },
                    {
                        date: '10/01/2020',
                        name: 'PT Gemini Perkasa Abadi',
                        fromto: 'JKT - BDG',
                        value: '75.000.000',
                        type: 'FTL'
                    },
                    {
                        date: '10/01/2020',
                        name: 'PT Garuda Perkasa',
                        fromto: 'JKT - BDR',
                        value: '55.000.000',
                        type: 'LTL'
                    },
                    {
                        date: '10/01/2020',
                        name: 'PT Indo Sejahtera',
                        fromto: 'JKT - SBY',
                        value: '105.000.000',
                        type: 'Rental'
                    },
                    {
                        date: '10/01/2020',
                        name: 'PT Abadi Sentosa',
                        fromto: 'JKT - SMG',
                        value: '230.000.000',
                        type: 'Project Base'
                    },
                    {
                        date: '10/01/2020',
                        name: 'PT Gemini Perkasa Abadi',
                        fromto: 'JKT - BDG',
                        value: '75.000.000',
                        type: 'FTL'
                    },
                    {
                        date: '10/01/2020',
                        name: 'PT Garuda Perkasa',
                        fromto: 'JKT - BDR',
                        value: '55.000.000',
                        type: 'LTL'
                    },
                    {
                        date: '10/01/2020',
                        name: 'PT Indo Sejahtera',
                        fromto: 'JKT - SBY',
                        value: '105.000.000',
                        type: 'Rental'
                    }
                ]
            },
        }
    },
    computed : {
    },
    methods: {
        renderChart() {
            var valuedata= [2478,5267,734,784,433];
            var valuedata2= [
                {
                    label: "Target",
                    backgroundColor: "Blue",
                    data: [3.7, 3.7, 3.7, 4.2, 4.2, 4.2, 4.7, 4.7, 4.7, 5.2, 5.2, 5.2]
                },
                {
                    label: "Achievement",
                    backgroundColor: "Green",
                    data: [2.9, 3.9, 3.2, 0, 0, 0, 0, 0, 0, 0, 0, 0]
                }
            ];
            var valuelabel=["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

            var ctx = document.getElementById("bar-chart").getContext("2d");

            // Chart.plugins.unregister(ChartDataLabels)
            Chart.helpers.merge(Chart.defaults.global.plugins.datalabels, {
                color: 'black'
            });

            var myBarChart = new Chart(ctx, {
                type: 'bar',
                data: {
                labels: valuelabel,
                // datasets: [
                //   {
                //     label: "Population (millions)",
                //     backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
                //     data: valuedata
                //   }
                // ]
                datasets : valuedata2
                },
                options: {
                // barValueSpacing: 20,
                legend: { display: false },
                title: {
                    display: false,
                    text: 'Predicted world population (millions) in 2050'
                },
                scales: {
                    xAxes: [{
                    gridLines: {
                        // display:false
                        // offsetGridLines : true
                    }
                    }],
                    yAxes: [{
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
                        stepSize: 1.25,
                        max: 6,
                        callback: function(value, index, values) {
                        return value + " M";
                        }
                    }
                    }]
                },
                animation: {
                    duration: 1,
                    onProgress: function(x){
                    // console.log(x)
                    var chartInstance = x.chartInstance
                    var ctx = chartInstance.ctx
                    var dete = chartInstance.data

                    ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
                    ctx.textAlign = 'center';
                    ctx.textBaseline = 'bottom';

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
                    color: 'black',
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
                },

            });

            myBarChart.update();
        }
    },
    mounted() {
        this.renderChart()
    }
}
</script>

<style scoped>
@import './../../assets/css/Chart.min.css';

/* calender Start */
  #testcalender {
    font-family: 'Avenir', Helvetica, Arial, sans-serif;
    color: #2c3e50;
    height: 100vh;
    /*width: 90vw; */
    width: 100%;
    margin-left: auto;
    margin-right: auto;
  }
  .calendar-controls {
    margin-right: 1rem;
    min-width: 14rem;
    max-width: 14rem;
  }
  .calendar-parent {
    display: flex;
    flex-direction: column;
    flex-grow: 1;
    overflow-x: hidden;
    overflow-y: hidden;
    max-height: 80vh;
    background-color: white;
  }
  /* For long calendars, ensure each week gets sufficient height. The body of the calendar will scroll if needed */
  .cv-wrapper.period-month.periodCount-2 .cv-week,
  .cv-wrapper.period-month.periodCount-3 .cv-week,
  .cv-wrapper.period-year .cv-week {
    min-height: 6rem;
  }
  /* These styles are optional, to illustrate the flexbility of styling the calendar purely with CSS. */
  /* Add some styling for items tagged with the "birthday" class */
  .theme-default .cv-event.birthday {
    background-color: #e0f0e0;
    border-color: #d7e7d7;
  }
  .theme-default .cv-event.birthday::before {
    content: "\1F382"; /* Birthday cake */
    margin-right: 0.5em;
  }
  /* Calender End */
  
    /* .card {
      font-size: 11px !important;
    } */
  .card-list {
      box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
      transition: 0.3s;
      width: 100%;
      /* margin:15px; */
  }

  .card-list:hover {
      box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
  }

  .container-list {
      padding: 2px 20px;
  }

  /* .p-list {
    margin-bottom: 0px !important;
    margin-top: 0px !important;
  } */

  .list-group{
    padding-bottom: 0px !important;
  }

  .list-group-item {
    padding: 5px 10px !important;
}
  .div-ava {
    width: 54px;
    height: 54px;
    border-radius: 100px;
    background: #86e4ecb0;
}
  .div-nameava {
    width: 100%;
    text-align: center;
    color: white;
    font-size: 34px;
}
  .dash-title{
    font-size: 13px;
    font-weight: bold;
    font-family: "Segoe UI";
    color: #676A6C;
    padding: .75rem 1.25rem;
    margin-bottom: 0;
    background-color: rgb(255, 255, 255) !important;
    border-bottom:  1px solid #e7eaec !important;
    
}
  .dash-header{
    font-size: 20px;
    font-family: "Segoe UI";
    color: #676A6C;
    font-weight: normal !important;
}

.dashboardBody {
  margin: 0px 0px 10px 0px !important;
}

/* .ChartLegend-Wrap {
  background-color: #E3E7EE;
  border-radius: 10px;
  padding-top: 10px !important;
  padding-bottom: 10px !important;
  padding-left: 10px !important;
  padding-right: 10px !important;
}
.ChartLegend-Content {
  margin-bottom: 5px;
  padding-top: 5px;
} */
.buleth {
  height: 100px;
  width: 100px;
  border-radius: 50px;
  text-align: center;
  padding: 27px;
  font-size: 30px;
  font-weight: bold;
  color: white;
  margin-top: 30px;
  margin-left: 50px;
}
.buleth-text {
  text-align: center;
  font-size: 20px;
  margin-top: 10px;
}

.isGrey {
  color: #7f8186;
}

/* .badge {
  width: 100%;
  height: 35px;
  font-size: 15px;
  padding-top: 1.2%;

  &__header {
    color: #fff !important;
    background-color: #007bff !important;
  }
} */

/* .badgeHeader {
  width: 100%;
  color: #fff !important;
  background-color: #007bff !important;
  height: 40px;
  font-size: 15px;
  padding-top: 8px;
  padding-left: 7px;
  padding-right: 7px;
  border-radius: 10px;
  margin-bottom: 10px;
}

.badgeContent {
  width: 100%;
  color: #7f8186 !important;
  background-color: #E3E7EE !important;
  height: 40px;
  font-size: 15px;
  padding-left: 7px;
  padding-right: 7px;
  border-radius: 10px;
  margin-bottom: 10px;
} */

.contentFill {
  padding: 0.6% 0px 0px 2.5% !important;
}

.ContentFillBadge {
  text-align: center;
  padding: 0.5% 0px 0px 2.5% !important;
}

.badgeStatus {
  border-radius: 10px;
  max-width: 100%;
  min-width: 100px;
  height: 100%;
  padding-top: 2.5%;
  position: absolute;
}

/* .AppointmentData {
  border-width: 1px;
  border-bottom-style: solid;
  border-bottom-color: #8f81a1;
  padding-bottom: 5px;
  margin-bottom: 5px;
}

.AppointmentIcon {
  font-size: 15px;
  text-align: right;
  padding-top: 5%;
}

.AppointmentDescs {
  font-size: 14px;
  color: #7f8186;
}

.AppointmentTitle {
  font-size: 20px;
  color: #4e5052;
} */

/* .CalendarTagMonth {
  border-style: solid;
  border-color: blue;
  border-width: 2px;
  text-align: center;

  color: #fff;
  font-size: 15px;
  background-color: blue;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
  max-height: 10%;
  min-height: 26px;
}

.CalendarTagDate {
  border-bottom-left-radius: 10px;
  border-bottom-right-radius: 10px;
  font-size: 18px;
  font-weight: bold;
  color: blue;
  height: 30px;
} */

</style>
