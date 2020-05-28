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
                <b-col md="3" class="col-right">
                  <span>
                    <ABSButton
                      :text="'Search'"
                      classButton="button button--back2"
                      classIcon="icon-style-1"
                      @click="onSearchEnter"
                    />
                  </span>

                  <!-- <span>
                                        <ABSButton
                                            :text="'Add New'"
                                            classButton="button button--back2"
                                            classIcon="icon-style-1"
                                            :disabled="!isCanAdd"
                                            @click="onAddNewClick"
                                        />
                  </span>-->

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
              <div>
                <b-card no-body>
                  <b-tabs card>
                    <b-tab title="FTL" active>
                      <b-card-text>
                        <div class="bedge-container">
                          <b-row style="min-width: 800px;">
                            <!-- <div class="bedge-container" style="width:100%;"> -->
                            <b-col
                              class="ChartLegend__Wrap"
                              style="min-width:712px; border-radius: 0px 0px 8px 8px !important; padding: 0px !important;"
                            >
                              <b-row
                                style="border-radius: 0px 0px 8px 8px; !important; border-left: solid 1px #ccc !important; border-right: solid 1px #ccc !important; border-bottom: solid 1px #ccc !important;"
                              >
                                <b-col
                                  style="border-radius: 0px 0px 0px 8px !important; cursor: pointer; background-color: white; border-right: solid 1px #ccc; border-bottom: solid 1px #ccc;"
                                >
                                  <div
                                    :class="'Plan-Dot-Primary'"
                                    style="margin-top: 10px !important; border-radius: 8px !important;"
                                  >
                                    <span>13</span>
                                  </div>
                                  <div class="Plan-Dot-Text">All</div>
                                </b-col>
                                <b-col
                                  v-for="(data, index) in PlanExecution"
                                  v-bind:key="index"
                                  style="margin-bottom: 10px; cursor: pointer;"
                                  @click="filterTable(data)"
                                >
                                  <div
                                    :class="'Plan-Dot-' + data.variant"
                                    style="margin-top: 10px !important;"
                                  >
                                    <span>{{data.dataLength}}</span>
                                  </div>
                                  <div class="Plan-Dot-Text">{{data.label}}</div>
                                </b-col>
                              </b-row>
                            </b-col>
                            <!-- </div> -->
                          </b-row>
                          <b-row style="margin-top: 15px; min-width:800px;">
                            <b-col
                              style="padding-left: 0px !important; padding-right: 0px !important;"
                            >
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
                                @row-dblclicked="rowDblClicked"
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
                                <!-- <template v-slot:cell(category)="data">
                                  <span v-if="data.item.category == 'F'">FTL</span>
                                  <span v-else-if="data.item.category == 'L'">LTL</span>
                                  <span v-else-if="data.item.category == 'P'">Project</span>
                                  <span v-else>Console</span>
                                </template>-->
                                <template v-slot:cell(category)="data">
                                  <span>FTL</span>
                                </template>
                                <template
                                  v-slot:cell(from)="data"
                                >{{ data.item.from + ' - ' + data.item.to }}</template>
                                <template v-slot:cell(status)="data">
                                  <div
                                    :class="'Plan-DotTable-' + PlanExecution[data.item.status].variant"
                                  ></div>
                                </template>
                              </b-table>
                            </b-col>
                          </b-row>
                        </div>
                      </b-card-text>
                    </b-tab>
                    <b-tab title="LTL">
                      <b-card-text>
                        <div class="bedge-container">
                          <b-row style="min-width: 800px;">
                            <!-- <div class="bedge-container" style="width:100%;"> -->
                            <b-col
                              class="ChartLegend__Wrap"
                              style="min-width:712px; border-radius: 0px 0px 8px 8px !important; padding: 0px !important;"
                            >
                              <b-row
                                style="border-radius: 0px 0px 8px 8px; !important; border-left: solid 1px #ccc !important; border-right: solid 1px #ccc !important; border-bottom: solid 1px #ccc !important;"
                              >
                                <b-col
                                  style="border-radius: 0px 0px 0px 8px !important; cursor: pointer; background-color: white; border-right: solid 1px #ccc; border-bottom: solid 1px #ccc;"
                                >
                                  <div
                                    :class="'Plan-Dot-Primary'"
                                    style="margin-top: 10px !important; border-radius: 8px !important;"
                                  >
                                    <span>13</span>
                                  </div>
                                  <div class="Plan-Dot-Text">All</div>
                                </b-col>
                                <b-col
                                  v-for="(data, index) in PlanExecution"
                                  v-bind:key="index"
                                  style="margin-bottom: 10px; cursor: pointer;"
                                  @click="filterTable(data)"
                                >
                                  <div
                                    :class="'Plan-Dot-' + data.variant"
                                    style="margin-top: 10px !important;"
                                  >
                                    <span>{{data.dataLength}}</span>
                                  </div>
                                  <div class="Plan-Dot-Text">{{data.label}}</div>
                                </b-col>
                              </b-row>
                            </b-col>
                            <!-- </div> -->
                          </b-row>
                          <b-row style="margin-top: 15px; min-width:800px;">
                            <b-col
                              style="padding-left: 0px !important; padding-right: 0px !important;"
                            >
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
                                @row-dblclicked="rowDblClicked"
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
                                <!-- <template v-slot:cell(category)="data">
                                  <span v-if="data.item.category == 'F'">FTL</span>
                                  <span v-else-if="data.item.category == 'L'">LTL</span>
                                  <span v-else-if="data.item.category == 'P'">Project</span>
                                  <span v-else>Console</span>
                                </template>-->
                                <template v-slot:cell(category)="data">
                                  <span>LTL</span>
                                </template>
                                <template
                                  v-slot:cell(from)="data"
                                >{{ data.item.from + ' - ' + data.item.to }}</template>
                                <template v-slot:cell(status)="data">
                                  <div
                                    :class="'Plan-DotTable-' + PlanExecution[data.item.status].variant"
                                  ></div>
                                </template>
                              </b-table>
                            </b-col>
                          </b-row>
                        </div>
                      </b-card-text>
                    </b-tab>
                    <b-tab title="Concole">
                      <b-card-text>
                        <div class="bedge-container">
                          <b-row style="min-width: 800px;">
                            <!-- <div class="bedge-container" style="width:100%;"> -->
                            <b-col
                              class="ChartLegend__Wrap"
                              style="min-width:712px; border-radius: 0px 0px 8px 8px !important; padding: 0px !important;"
                            >
                              <b-row
                                style="border-radius: 0px 0px 8px 8px; !important; border-left: solid 1px #ccc !important; border-right: solid 1px #ccc !important; border-bottom: solid 1px #ccc !important;"
                              >
                                <b-col
                                  style="border-radius: 0px 0px 0px 8px !important; cursor: pointer; background-color: white; border-right: solid 1px #ccc; border-bottom: solid 1px #ccc;"
                                >
                                  <div
                                    :class="'Plan-Dot-Primary'"
                                    style="margin-top: 10px !important; border-radius: 8px !important;"
                                  >
                                    <span>13</span>
                                  </div>
                                  <div class="Plan-Dot-Text">All</div>
                                </b-col>
                                <b-col
                                  v-for="(data, index) in PlanExecution"
                                  v-bind:key="index"
                                  style="margin-bottom: 10px; cursor: pointer;"
                                  @click="filterTable(data)"
                                >
                                  <div
                                    :class="'Plan-Dot-' + data.variant"
                                    style="margin-top: 10px !important;"
                                  >
                                    <span>{{data.dataLength}}</span>
                                  </div>
                                  <div class="Plan-Dot-Text">{{data.label}}</div>
                                </b-col>
                              </b-row>
                            </b-col>
                            <!-- </div> -->
                          </b-row>
                          <b-row style="margin-top: 15px; min-width:800px;">
                            <b-col
                              style="padding-left: 0px !important; padding-right: 0px !important;"
                            >
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
                                <!-- <template v-slot:cell(category)="data">
                                  <span v-if="data.item.category == 'F'">FTL</span>
                                  <span v-else-if="data.item.category == 'L'">LTL</span>
                                  <span v-else-if="data.item.category == 'P'">Project</span>
                                  <span v-else>Console</span>
                                </template>-->
                                <template v-slot:cell(category)="data">
                                  <span>Console</span>
                                </template>
                                <template
                                  v-slot:cell(from)="data"
                                >{{ data.item.from + ' - ' + data.item.to }}</template>
                                <template v-slot:cell(status)="data">
                                  <div
                                    :class="'Plan-DotTable-' + PlanExecution[data.item.status].variant"
                                  ></div>
                                </template>
                              </b-table>
                            </b-col>
                          </b-row>
                        </div>
                      </b-card-text>
                    </b-tab>
                    <b-tab title="Project">
                      <b-card-text>
                        <div class="bedge-container">
                          <b-row style="min-width: 800px;">
                            <!-- <div class="bedge-container" style="width:100%;"> -->
                            <b-col
                              class="ChartLegend__Wrap"
                              style="min-width:712px; border-radius: 0px 0px 8px 8px !important; padding: 0px !important;"
                            >
                              <b-row
                                style="border-radius: 0px 0px 8px 8px; !important; border-left: solid 1px #ccc !important; border-right: solid 1px #ccc !important; border-bottom: solid 1px #ccc !important;"
                              >
                                <b-col
                                  style="border-radius: 0px 0px 0px 8px !important; cursor: pointer; background-color: white; border-right: solid 1px #ccc; border-bottom: solid 1px #ccc;"
                                >
                                  <div
                                    :class="'Plan-Dot-Primary'"
                                    style="margin-top: 10px !important; border-radius: 8px !important;"
                                  >
                                    <span>13</span>
                                  </div>
                                  <div class="Plan-Dot-Text">All</div>
                                </b-col>
                                <b-col
                                  v-for="(data, index) in PlanExecution"
                                  v-bind:key="index"
                                  style="margin-bottom: 10px; cursor: pointer;"
                                  @click="filterTable(data)"
                                >
                                  <div
                                    :class="'Plan-Dot-' + data.variant"
                                    style="margin-top: 10px !important;"
                                  >
                                    <span>{{data.dataLength}}</span>
                                  </div>
                                  <div class="Plan-Dot-Text">{{data.label}}</div>
                                </b-col>
                              </b-row>
                            </b-col>
                            <!-- </div> -->
                          </b-row>
                          <b-row style="margin-top: 15px; min-width:800px;">
                            <b-col
                              style="padding-left: 0px !important; padding-right: 0px !important;"
                            >
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
                                <!-- <template v-slot:cell(category)="data">
                                  <span v-if="data.item.category == 'F'">FTL</span>
                                  <span v-else-if="data.item.category == 'L'">LTL</span>
                                  <span v-else-if="data.item.category == 'P'">Project</span>
                                  <span v-else>Console</span>
                                </template>-->
                                <template v-slot:cell(category)="data">
                                  <span>Project</span>
                                </template>
                                <template
                                  v-slot:cell(from)="data"
                                >{{ data.item.from + ' - ' + data.item.to }}</template>
                                <template v-slot:cell(status)="data">
                                  <div
                                    :class="'Plan-DotTable-' + PlanExecution[data.item.status].variant"
                                  ></div>
                                </template>
                              </b-table>
                            </b-col>
                          </b-row>
                        </div>
                      </b-card-text>
                    </b-tab>
                  </b-tabs>
                </b-card>
              </div>
            </div>
            <div class="card__footer">
              <!-- <b-form inline style="float: left; color: #333;">
                <label
                  class="font-lbl"
                  style="margin-bottom:0px !important; margin-right:0px !important;"
                >Page Size</label>
                <b-form-select
                  id="cmbPerPage"
                  v-model="perPage"
                  v-on:input="doGetList(search, 'pageSize')"
                  :options="pagingData"
                  class="sm-3 mgn-left-10 font-lbl page-size-left"
                  :disabled="isDisableTable"
                ></b-form-select>
                of {{ this.totalRows }} Records
              </b-form>

              <b-pagination
                align="right"
                v-model="currentPage"
                @input="doGetList(search, 'pagination')"
                :total-rows="totalRows"
                :per-page="perPage"
                :limit="limit"
                style="margin-bottom: 0px;"
                :disabled="isDisableTable"
              ></b-pagination>-->
            </div>
            <iframe name="print_frame" width="0" height="0" frameborder="0" src="about:blank"></iframe>
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
      PlanExecution: [],
      DataTable: [],
      PlanExTable: {
        Header: [],
        Data: []
      }
    };
  },
  computed: {},
  methods: {
    rowDblClicked(record, index) {
      var param = record;
      this.$router.push({ name: "OP_ViewPlanExecution", params: param });
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
</style>