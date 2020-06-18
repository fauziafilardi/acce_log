<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="7">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Target</span>
                </b-col>
                <b-col style="text-align: right;">
                  <span>
                    <ABSButton
                      :text="'View All'"
                      classButton="button button--back2"
                      classIcon="icon-style-1"
                      :disabled="false"
                      @click="doViewAllTarget"
                    />
                  </span>
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <b-row>
                <b-col>
                  <!-- <canvas id="bar-chart" width="350" height="100"></canvas> -->
                  <div class="chart-target">
                    <canvas id="bar-chart" height="100"></canvas>
                  </div>
                  <hr style="margin: 5px !important;" />
                </b-col>
              </b-row>
              <b-row class="row-comulative">
                <b-col md="2" style="margin:auto;">
                  <span>Cumulative Total</span>
                </b-col>
                <b-col class="ChartLegend-Wrap">
                  <span>
                    <b-row>
                      <b-col style="max-width:fit-content !important;">
                        <b-row>
                          <b-col style="max-width:fit-content !important;">
                            <div class="ChartLegend-Content" style="text-align: right;">
                              <span style="color: #666666;">Target</span>
                            </div>
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col style="max-width:fit-content !important;">
                            <div class="ChartLegend-Content" style="text-align: right;">
                              <span style="color: #666666;">Achievement</span>
                            </div>
                          </b-col>
                        </b-row>
                      </b-col>
                      <b-col style="max-width: fit-content !important;">
                        <b-row>
                          <b-col style="max-width:fit-content !important;">
                            <div
                              class="ChartLegend-Content"
                              style="background-color: #333399; width: 10px; height: 10px; padding: 10px;"
                            ></div>
                          </b-col>
                          <b-col
                            class="ChartLegend-Content"
                            style="max-width:fit-content !important;"
                          >
                            <span
                              style="color: #666666;"
                            >{{ M_Target.target + " " + M_Target.satuan }}</span>
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col style="max-width:fit-content !important;">
                            <div
                              class="ChartLegend-Content"
                              style="background-color: #00cc33; width: 10px; height: 10px; padding: 10px;"
                            ></div>
                          </b-col>
                          <b-col
                            class="ChartLegend-Content"
                            style="max-width:fit-content !important;"
                          >
                            <span
                              style="color: #666666;"
                            >{{ M_Target.achievement + " " + M_Target.satuan }}</span>
                          </b-col>
                        </b-row>
                      </b-col>
                      <b-col md="8" style="max-width:fit-content !important;">
                        <span
                          style="font-size: 25px; font-weight: bold; color: #666666;"
                        >({{ M_Target.avg }} %)</span>
                      </b-col>
                    </b-row>
                  </span>
                </b-col>
              </b-row>
            </div>
          </div>
        </b-col>
        <b-col md="5">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>New Prospect</span>
                </b-col>
                <b-col style="text-align: right;">
                  <span>
                    <ABSButton
                      :text="'Add New'"
                      classButton="button button--back2"
                      classIcon="icon-style-1"
                      :disabled="false"
                      @click="doAddNewProspect"
                    />
                  </span>

                  <span>
                    <ABSButton
                      :text="'View All'"
                      classButton="button button--back2"
                      classIcon="icon-style-1"
                      :disabled="false"
                      @click="doViewAllProspect"
                    />
                  </span>
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
                    <h6 class="isGrey">{{ DataProspect.monthName + ' ' + DataProspect.year }}</h6>
                  </span>
                </b-col>
                <b-col style="text-align: right;max-width: fit-content !important;">
                  <span @click="changeProspect('add')" style="cursor: pointer;">
                    <font-awesome-icon class="isGrey" icon="greater-than" size="lg" />
                  </span>
                </b-col>
              </b-row>
              <b-row class="row-dash-new-prospect-top">
                <b-col>
                  <div class="buleth__blue">
                    <span>{{ DataProspect.target}}</span>
                  </div>
                  <div class="buleth-text" style="margin-top: 0px !important;">Target</div>
                </b-col>
                <b-col>
                  <div class="buleth__green">
                    <span>{{ DataProspect.achievement }}</span>
                  </div>
                  <div class="buleth-text" style="margin-top: 0px !important;">Achievement</div>
                </b-col>
              </b-row>

              <b-row class="row-dash-new-prospect-bottom">
                <b-col>
                  <div class="prospect">
                    <div class="prospect__title">Monthly Point</div>
                    <div class="prospect__body">
                      <b-row>
                        <b-col>
                          <span class="prospect__content">Target</span>
                        </b-col>
                        <b-col>
                          <span class="prospect__content">: {{ DataProspect.targetPoint}} Point</span>
                        </b-col>
                      </b-row>
                      <b-row>
                        <b-col>
                          <span class="prospect__content">Achievement Point</span>
                        </b-col>
                        <b-col>
                          <span class="prospect__content">: {{ DataProspect.achievementPoint}} Point</span>
                        </b-col>
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
        <b-col md="7">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>To Do List</span>
                </b-col>
                <b-col style="text-align: right;">
                  <span style="padding-right:10px">
                    <font-awesome-icon
                      style="font-size: medium; color: #333399;"
                      icon="circle"
                      size="sm"
                    />
                  </span>
                  <span
                    style="padding-right:10px; font-size: 12px !important; font-weight: normal !important; color: #666666;"
                  >Prospect</span>

                  <span style="padding-right:10px">
                    <font-awesome-icon
                      style="font-size: medium; color: #00cc33;"
                      icon="circle"
                      size="sm"
                    />
                  </span>
                  <span
                    style="padding-right:10px; font-size: 12px !important; font-weight: normal !important; color: #666666;"
                  >Customer</span>

                  <span>
                    <ABSButton
                      :text="'View All'"
                      classButton="button button--new"
                      classIcon="icon-style-1"
                      :disabled="false"
                      @click="doViewAllToDoList"
                    />
                  </span>
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <div class="bedge-container" style>
                <!-- <div class="badgeHeader" style="min-width: 640px !important;"> -->
                  <b-row style="flex-wrap: unset !important" class="badgeHeader">
                    <b-col style="text-align: center;padding-top: 9px;" class="bordered" md="2">Status</b-col>
                    <b-col style="text-align: center;padding-top: 9px;" class="bordered" md="3">Customer Name</b-col>
                    <b-col style="text-align: center;padding-top: 9px;" class="bordered" md="2">Last Action</b-col>
                    <b-col style="text-align: center;padding-top: 9px;" class="bordered" md="3">Next Action</b-col>
                    <b-col style="text-align: center;padding-top: 9px;" class="bordered" md="2">Action</b-col>
                  </b-row>
                <!-- </div> -->
                <!-- <div
                  class="badgeContent"
                  style="min-width: 640px !important;"
                  v-for="(data, index) in ToDoList"
                  v-bind:key="index"
                > -->
                  <b-row class="badgeContent"
                  style="min-width: 640px !important; flex-wrap: unset !important;"
                  v-for="(data, index) in ToDoList"
                  v-bind:key="index">
                    <b-col class="ContentFillBadge bordered" style="text-align: center;" md="2">
                      <span>
                        <b-badge
                          :style="`background-color:`+data.status_colour+`; width: 75px; padding: 6px !important; border-radius: 4px !important; font-weight: normal !important;`"
                        >{{data.status}}</b-badge>
                      </span>
                    </b-col>
                    <b-col class="contentFill bordered" md="3">
                      <span>{{data.name}}</span>
                    </b-col>
                    <b-col class="contentFill bordered" style="text-align: center;" md="2">
                      <span>{{data.last_action && data.last_action !== '' ? data.last_action : '-'}}</span>
                    </b-col>
                    <b-col class="contentFill__nextaction bordered" md="3">
                      <span>
                        <font-awesome-icon
                          v-if="data.warning"
                          style="color: red;"
                          icon="exclamation-triangle"
                          size="sm"
                        />
                        {{ momentDateFormatting(data.next_action,'DD/MM/YYYY HH:mm')}}
                      </span>
                    </b-col>
                    <b-col class="contentFill bordered" md="2">
                      <b-row>
                        <b-col style="padding-left: 20% !important; padding-top: 2px;">
                          <span>
                            <b-badge
                              style="width: 15px; height: 15px; padding: 6px !important; border-radius: 15px !important;"
                              :variant="data.status == 'New' ? 'primary' : 'success'"
                            >&nbsp;</b-badge>
                          </span>
                        </b-col>
                        <b-col style="padding-left: 20% !important; padding-top: 2px;">
                          <!-- <font-awesome-icon
                            v-if="data.action.icon"
                            style="color: #333399;"
                            :icon="data.action.icon"
                            size="lg"
                          />-->
                          <!-- <b-badge @click="doEdit(data)"> -->
                          <span @click="ToDoListEdit(data)">
                            <font-awesome-icon
                              class="icon-style-default"
                              :icon="data.action=='C' ? 'phone-square-alt' : (data.action=='V' ? 'hand-paper' : 'utensils')"
                              size="lg"
                            />
                          </span>
                          <!-- </b-badge> -->
                        </b-col>
                      </b-row>
                    </b-col>
                  </b-row>
                <!-- </div> -->
              </div>
            </div>
          </div>
        </b-col>
        <b-col md="5">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Appointment</span>
                </b-col>
                <b-col style="text-align: right;">
                  <span>
                    <ABSButton
                      :text="'View All'"
                      classButton="button button--new"
                      classIcon="icon-style-1"
                      :disabled="false"
                      @click="doViewAllAppointment"
                    />
                  </span>
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <b-row
                class="AppointmentData"
                v-for="(data, index) in Appointment"
                v-bind:key="index"
              >
                <b-col style="max-width:fit-content !important;">
                  <div style="width:50px;">
                    <div
                      class="CalendarTagMonth"
                    >{{momentDateFormat2(data.next_action, 'DD-MM-YYYY HH:mm', 'MMM')}}</div>
                    <div
                      class="CalendarTagDate"
                    >{{momentDateFormat2(data.next_action, 'DD-MM-YYYY HH:mm', 'DD')}}</div>
                  </div>
                </b-col>
                <b-col style="margin: auto;">
                  <span
                    class="AppointmentTitle"
                  >{{momentDateFormat2(data.next_action, 'DD-MM-YYYY HH:mm', 'HH:mm')}}</span>
                  <br />
                  <span class="AppointmentDescs">{{data.customer_name}}</span>
                </b-col>
                <b-col class="AppointmentIcon">
                  <span>
                    <font-awesome-icon
                      v-if="data.action == 'C'"
                      style="color: #333399;"
                      icon="phone-square-alt"
                      size="lg"
                    />
                    <font-awesome-icon
                      v-else-if="data.action == 'E'"
                      style="color: #333399;"
                      icon="utensils"
                      size="lg"
                    />
                    <font-awesome-icon
                      v-else-if="data.action == 'V'"
                      style="color: #333399;"
                      icon="hand-paper"
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
                      :text="'View All'"
                      classButton="button button--back2"
                      classIcon="icon-style-1"
                      :disabled="false"
                      @click="doViewAllQuotation"
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
              <!-- <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Order</span>
                </b-col>
                <b-col style="text-align: right; max-width:fit-content !important;">
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
                </b-col>
                <b-col md="4" style="text-align: end !important;">
                  <span>
                    <ABSButton
                      :text="'View All'"
                      classButton="button button--new"
                      classIcon="icon-style-1"
                      :disabled="true"
                    />
                  </span>
                </b-col>
              </b-row>-->
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Order</span>
                </b-col>
                <b-col style="text-align: right;">
                  <span style="padding-right:5px">
                    <font-awesome-icon
                      style="font-size: medium; color: #ff9900;"
                      icon="circle"
                      size="sm"
                    />
                  </span>
                  <span
                    style="padding-right:5px; font-size: 12px !important; font-weight: normal !important; color: #666666;"
                  >Pending</span>

                  <span style="padding-right:5px">
                    <font-awesome-icon
                      style="font-size: medium; color: #00cc33;"
                      icon="circle"
                      size="sm"
                    />
                  </span>
                  <span
                    style="padding-right:5px; font-size: 12px !important; font-weight: normal !important; color: #666666;"
                  >On Progress</span>

                  <span style="padding-right:5px">
                    <font-awesome-icon
                      style="font-size: medium; color: #cc0000;"
                      icon="circle"
                      size="sm"
                    />
                  </span>
                  <span
                    style="padding-right:5px; font-size: 12px !important; font-weight: normal !important; color: #666666;"
                  >Issue</span>

                  <span>
                    <ABSButton
                      :text="'View All'"
                      classButton="button button--back2"
                      classIcon="icon-style-1"
                      :disabled="false"
                      @click="doViewAllOrder"
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
                <template v-slot:cell(customer_status)="data">
                  <b-badge
                    style="height: 12px !important; width: 12px !important; font-size: 10px !important; padding: 1px 3px !important;"
                    variant="warning"
                  >{{data.item.pending}}</b-badge>&nbsp;
                  <b-badge
                    style="height: 12px !important; width: 12px !important; font-size: 10px !important; padding: 1px 3px !important;"
                    variant="success"
                  >{{data.item.progress}}</b-badge>&nbsp;
                  <b-badge
                    style="height: 12px !important; width: 12px !important; font-size: 10px !important; padding: 1px 3px !important;"
                    variant="danger"
                  >{{data.item.issue}}</b-badge>
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
              <!--<div class="Commision__Wrapper">
                <div class="Commision__Icon">
                  <font-awesome-icon style="color: blue;" icon="coins" size="3x" />
                </div>
                <div class="Commision__Text">
                  <span>
                    <span class="Commision__TitleBlue">Paid</span> &nbsp;
                    <span class="Commision__Title">(Last 12 Months)</span>
                    <br />
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
                    <span class="Commision__Title"></span>
                    <br />
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
                    <span class="Commision__Title"></span>
                    <br />
                    <span class="Commision__Descs">Rp 32.380.000</span>
                  </span>
                </div>
              </div>-->
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
      Appointment: [],
      ToDoList: [],
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
            key: "quotation_date",
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
          // {
          //   name: "PT Abadi Sentosa",
          //   date: "10/01/2020",
          //   type: "Project Base"
          // },
          // {
          //   name: "PT Gemini Perkasa Abadi",
          //   date: "10/01/2020",
          //   type: "FTL"
          // },
          // {
          //   name: "PT Garuda Perkasa",
          //   date: "10/01/2020",
          //   type: "LTL"
          // },
          // {
          //   name: "PT Indo Sejahtera",
          //   date: "10/01/2020",
          //   type: "Rental"
          // },
          // {
          //   name: "PT Abadi Sentosa",
          //   date: "10/01/2020",
          //   type: "Project Base"
          // },
          // {
          //   name: "PT Gemini Perkasa Abadi",
          //   date: "10/01/2020",
          //   type: "FTL"
          // },
          // {
          //   name: "PT Garuda Perkasa",
          //   date: "10/01/2020",
          //   type: "LTL"
          // },
          // {
          //   name: "PT Indo Sejahtera",
          //   date: "10/01/2020",
          //   type: "Rental"
          // }
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
            key: "customer_name",
            label: "Customer",
            thClass: "HeaderTable",
            tdClass: "ContentTable"
          },
          {
            key: "customer_status",
            label: "Status",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center"
          }
        ],
        Data: [
          // {
          //   name: "PT Abadi Sentosa",
          //   status: {
          //     pending: 2,
          //     progress: 4,
          //     issue: 3
          //   }
          // },
          // {
          //   name: "PT Gemini Perkasa Abadi",
          //   status: {
          //     pending: 2,
          //     progress: 4,
          //     issue: 3
          //   }
          // },
          // {
          //   name: "PT Garuda Perkasa",
          //   status: {
          //     pending: 2,
          //     progress: 4,
          //     issue: 3
          //   }
          // },
          // {
          //   name: "PT Indo Sejahtera",
          //   status: {
          //     pending: 2,
          //     progress: 4,
          //     issue: 3
          //   }
          // },
          // {
          //   name: "PT Abadi Sentosa",
          //   status: {
          //     pending: 2,
          //     progress: 4,
          //     issue: 3
          //   }
          // },
          // {
          //   name: "PT Gemini Perkasa Abadi",
          //   status: {
          //     pending: 2,
          //     progress: 4,
          //     issue: 3
          //   }
          // },
          // {
          //   name: "PT Garuda Perkasa",
          //   status: {
          //     pending: 2,
          //     progress: 4,
          //     issue: 3
          //   }
          // },
          // {
          //   name: "PT Indo Sejahtera",
          //   status: {
          //     pending: 2,
          //     progress: 4,
          //     issue: 3
          //   }
          // }
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
      DataProspect: {
        month: "",
        monthName: "",
        year: "",
        target: 0,
        achievement: 0,
        targetPoint: 0,
        achievementPoint: 0
      },

      M_Target: {
        target: 0,
        achievement: 0,
        avg: 0,
        satuan: "M"
      }
    };
  },
  computed: {},
  methods: {
    ToDoListEdit(data) {
      var param = data;
      param.isEdit = true;
      console.log(param);
      this.$router.push({ name: "MK_EditToDoList", params: param });
    },
    doViewAllTarget() {
      this.$router.push({ name: "MK_DashboardTarget" });
    },
    doAddNewProspect() {
      var url = "MK_AddNewProspect";
      if (!url || url == "" || url == undefined) return;
      var param = {
        // option_url: this.getOptionUrl(),
        // title: this.title,
        isEdit: false
      };
      this.$router.push({ name: url, params: param });
    },
    doViewAllProspect() {
      var url = "MK_DashboardProspect";
      if (!url || url == "" || url == undefined) return;
      var param = {
        // option_url: this.getOptionUrl(),
        // title: this.title,
        isEdit: false
      };
      this.$router.push({ name: url, params: param });
    },
    doViewAllToDoList() {
      var url = "MK_ToDoList";
      if (!url || url == "" || url == undefined) return;
      var param = {
        // option_url: this.getOptionUrl(),
        // title: this.title,
        isEdit: false
      };
      this.$router.push({ name: url, params: param });
    },
    doViewAllQuotation() {
      var url = "MK_Quotation";
      if (!url || url == "" || url == undefined) return;
      var param = {
        // option_url: this.getOptionUrl(),
        // title: this.title,
        isEdit: false
      };
      this.$router.push({ name: url, params: param });
    },
    doViewAllOrder() {
      var url = "MK_ListOrder";
      if (!url || url == "" || url == undefined) return;
      var param = {
        // option_url: this.getOptionUrl(),
        // title: this.title,
        isEdit: false
      };
      this.$router.push({ name: url, params: param });
    },
    doViewAllAppointment() {
      this.$router.push({ name: "MK_Appointment" });
    },
    getListAppointment() {
      var param = {
        option_url: "/MK/MK_Appointment",
        line_no: 0,
        user_id: this.getDataUser().user_id,
        portfolio_id: this.getDataUser().portfolio_id,
        subportfolio_id: this.getDataUser().subportfolio_id,
        current_page: 1,
        per_page: 4,
        param_where: "",
        initial_where: "next_action is not null",
        sort_field: "",
        source_field: "",
        param_view: ""
      };

      this.postJSON(this.getUrlList(), param).then(response => {
        this.Appointment = response.Data;
      });
    },
    getDataToDoList() {
      var param = {
        option_function_cd: "GenToDoListDash",
        module_cd: "MK",
        ss_portfolio_id: this.getDataUser().portfolio_id,
        user_id: this.getDataUser().user_id
      };
      this.CallFunction(param).then(ress => {
        if (ress == null) return;
        this.ToDoList = [];
        var now = new Date();
        for (let i = 0; i < ress.Data.length; i++) {
          var next_action = new Date(ress.Data[i].next_action);
          // console.log(next_action);
          this.ToDoList.push({
            cm_contact_id: ress.Data[i].cm_contact_id,
            name: ress.Data[i].customer_name,
            status: ress.Data[i].status,
            status_colour: ress.Data[i].customer_status_colour,
            warning: next_action < now ? true : false,
            next_action: ress.Data[i].next_action,
            last_action: ress.Data[i].last_action,
            action: ress.Data[i].action,
            appointment_type: ress.Data[i].appointment_type,
            row_id: ress.Data[i].row_id,
            lastupdatestamp: ress.Data[i].lastupdatestamp
          });
        }
      });
    },
    getListOrder() {
      var param = {
        option_url: "/MK/MK_Order",
        line_no: 0,
        user_id: this.getDataUser().user_id,
        portfolio_id: this.getDataUser().portfolio_id,
        subportfolio_id: this.getDataUser().subportfolio_id,
        current_page: 1,
        per_page: 8,
        param_where: "",
        initial_where: "",
        sort_field: "",
        source_field: "",
        param_view: ""
      };

      this.postJSON(this.getUrlList(), param).then(response => {
        this.Order.Data = response.Data;
      });
    },
    getListQuotation() {
      var param = {
        option_url: "/MK/MK_Quotation",
        line_no: 0,
        user_id: this.getDataUser().user_id,
        portfolio_id: this.getDataUser().portfolio_id,
        subportfolio_id: this.getDataUser().subportfolio_id,
        current_page: 1,
        per_page: 8,
        param_where: "",
        initial_where: "",
        sort_field: "",
        source_field: "",
        param_view: ""
      };
      this.postJSON(this.getUrlList(), param).then(response => {
        this.Quotation.Data = response.Data;
      });
    },
    renderChart() {
      var param = {
        option_function_cd: "GetMarketingTargetDash",
        module_cd: "MK",
        user_id: this.getDataUser().user_id,
        ss_portfolio_id: this.getDataUser().portfolio_id
      };

      this.CallFunction(param).then(response => {
        if (response == null) return;
        var data = response.Data,
          isMonth = new Date().getMonth(),
          tg = [],
          tg2 = [],
          ac = [],
          ac2 = [];

        for (let i = 0; i < data.length; i++) {
          if (i <= isMonth) {
            tg2.push(Math.round(data[i].display_target_amt));
            ac2.push(Math.round(data[i].display_achievement_amt));
          }
          tg.push(Math.round(data[i].display_target_amt));
          ac.push(Math.round(data[i].display_achievement_amt));
        }

        var max = Math.max.apply(null, tg),
          sumtg = tg2.reduce(function(a, b) {
            return a + b;
          }, 0),
          sumac = ac2.reduce(function(a, b) {
            return a + b;
          }, 0);

        this.M_Target.satuan = data[0].display_satuan;
        this.M_Target.target = Math.round(sumtg)
          .toString()
          .replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        this.M_Target.achievement = Math.round(sumac)
          .toString()
          .replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        this.M_Target.avg = Math.round((sumac / sumtg) * 100);

        var valuedata2 = [
          {
            label: "Target",
            backgroundColor: "#333399",
            data: tg
          },
          {
            label: "Achievement",
            backgroundColor: "#00cc33",
            data: ac
          }
        ];

        var valuelabel = [
          "Jan",
          "Feb",
          "Mar",
          "Apr",
          "May",
          "Jun",
          "Jul",
          "Aug",
          "Sep",
          "Oct",
          "Nov",
          "Dec"
        ];

        var ctx = document.getElementById("bar-chart").getContext("2d");

        // Chart.plugins.unregister(ChartDataLabels)
        Chart.helpers.merge(Chart.defaults.global.plugins.datalabels, {
          color: "black"
        });

        var myBarChart = new Chart(ctx, {
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
            legend: { display: false },
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
                    stepSize: Math.round((max + 20) / 4),
                    max: max + 20,
                    callback: function(value, index, values) {
                      return value + data[0].display_satuan;
                    }
                  }
                }
              ]
            },
            animation: {
              duration: 1,
              onProgress: function(x) {
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

        myBarChart.update();
        this.$forceUpdate();
      });
    },
    getProspect(date = null) {
      var now = date ? new Date(date) : new Date();
      var month = now.getMonth();
      var year = now.getFullYear();

      this.DataProspect = {
        month: month + 1,
        monthName: this.getMonthName(now),
        year: year,
        target: 0,
        achievement: 0,
        targetPoint: 0,
        achievementPoint: 0
      };

      var param = {
        option_function_cd: "GetNewProspectDash",
        module_cd: "MK",
        ss_portfolio_id: this.getDataUser().portfolio_id,
        user_id: this.getDataUser().user_id,
        years: year,
        months: month + 1
      };
      this.CallFunction(param).then(ress => {
        if (ress == null) return;

        if (ress.Data.length > 0) {
          var data = ress.Data[0];

          this.DataProspect = {
            month: month + 1,
            monthName: this.getMonthName(now),
            year: year,
            target: data.target_prospect,
            achievement: data.achievement_prospect,
            targetPoint: data.monthly_point_target,
            achievementPoint: data.monthly_point_achievement
          };
        } else {
          this.DataProspect = {
            month: month + 1,
            monthName: this.getMonthName(now),
            year: year,
            target: 0,
            achievement: 0,
            targetPoint: 0,
            achievementPoint: 0
          };
        }
      });
    },
    changeProspect(act) {
      var date = new Date();
      if (act === "min") {
        // var d = moment(date, 'YYYY-MM-DD').add(i, number)
        var mth =
          this.DataProspect.month && this.DataProspect.month !== ""
            ? parseInt(this.DataProspect.month)
            : 0;
        var year = this.DataProspect.year;
        mth = mth < 10 ? "0" + mth : mth;
        var frm = year + "-" + mth + "-" + "01";
        date = this.dateAdd2("m", frm, -1);
        // date = this.momentDateFormatting(date, frm)
      } else if (act === "add") {
        var mth =
          this.DataProspect.month && this.DataProspect.month !== ""
            ? parseInt(this.DataProspect.month)
            : 0;
        var year = this.DataProspect.year;
        mth = mth < 10 ? "0" + mth : mth;
        var frm = year + "-" + mth + "-" + "01";
        date = date = this.dateAdd2("m", frm, 1);
        // date = this.momentDateFormatting(date, frm)
      }

      this.getProspect(date);
    }
  },
  mounted() {
    this.renderChart();
    this.getProspect();
    this.getListOrder();
    this.getListQuotation();
    this.getListAppointment();
    this.getDataToDoList();
  }
};
</script>

<style scoped>
@import "./../../assets/css/Chart.min.css";
</style>
