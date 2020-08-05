<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Execution Plan</span>
                </b-col>
                <b-col style="text-align: right;">
                  <ABSButton
                    :text="'Costing'"
                    classButton="button button--back"
                    classIcon="icon-style-1"
                    @click="doCosting"
                  />
                  <ABSButton
                    :text="'Extra Pick'"
                    classButton="button button--back"
                    classIcon="icon-style-1"
                    @click="doPick"
                  />
                  <ABSButton
                    :text="'Extra Drop'"
                    classButton="button button--back"
                    classIcon="icon-style-1"
                    @click="doDrop"
                  />
                  <ABSButton
                    :text="'Back'"
                    classButton="button button--back"
                    classIcon="icon-style-1"
                    @click="doBack"
                  />
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <b-form :data-vv-scope="'parent'" :data-vv-value-path="'parent'">
                <b-row>
                  <b-col md="2" style="text-align: center;">
                    <img :src="require('@/assets/paper.png')" alt style="width: 50px;" />
                  </b-col>
                  <b-col md="10">
                    <b-row>
                      <b-col>
                        <span style="font-size: 15px; font-weight: bold;">
                          <label>{{M_GetDataBy.customer_name}}</label>
                        </span>
                      </b-col>
                      <b-col style="text-align: right;">
                        <span>
                          <ABSButton
                            :text="'Contact'"
                            classButton="btn btn--default"
                            classIcon="icon-style-1"
                            @click="doContact"
                          />
                        </span>
                        <span>
                          <ABSButton
                            :text="'Edit'"
                            classButton="btn btn--default"
                            classIcon="icon-style-1"
                            @click="doEdit"
                          />
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view" style="padding-top: 5px; padding-bottom: 10px;">
                      <b-col>
                        <span>
                          <font-awesome-icon class="icon-style-default" icon="user" />&nbsp;&nbsp;
                          <span style="font-size: 15px;">
                            <label>{{M_GetDataBy.contact_person_name}}</label>
                          </span>
                          &nbsp;&nbsp;
                        </span>
                        <span>
                          <font-awesome-icon class="icon-style-default" icon="phone-square-alt" />&nbsp;&nbsp;
                          <span style="font-size: 15px;">
                            <label>{{M_GetDataBy.contact_person_phone}}</label>
                          </span>
                        </span>
                      </b-col>
                      <b-col style="text-align: right;">
                        <span>
                          <font-awesome-icon class="icon-style-default" icon="user" />&nbsp;&nbsp;
                          <span style="font-size: 15px;">
                            <label>{{'User :'+getDataUser().user_name}}</label>
                          </span>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col>
                        <div class="container-step">
                          <ul class="progressbar" style="padding-inline-start: 0px !important;">
                            <li class="active" style="width: 10% !important;">
                              <span>Order</span>
                              <br />
                              <span>{{momentDateFormatting(M_GetDataBy.order_date, 'DD/MM/YYYY HH:mm')}}</span>
                            </li>
                            <li class="active" style="width: 10% !important;">
                              <span>Assign</span>
                              <br />
                              <span>{{''}}</span>
                            </li>
                            <li class="active" style="width: 10% !important;">
                              <span>Dispatch</span>
                              <br />
                              <span>{{''}}</span>
                            </li>
                            <li class="active" style="width: 10% !important;">
                              <span>Arrived</span>
                              <br />
                              <span>{{''}}</span>
                            </li>
                            <li class="active" style="width: 10% !important;">
                              <span>Start Loading</span>
                              <br />
                              <span>{{''}}</span>
                            </li>
                            <li style="width: 10% !important;">
                              <span>Finish Loading</span>
                              <br />
                              <span>{{''}}</span>
                            </li>
                            <li style="width: 10% !important;">
                              <span>Get Out</span>
                              <br />
                              <span>{{''}}</span>
                            </li>
                            <li style="width: 10% !important;">
                              <span>Arrive Destination</span>
                              <br />
                              <span>{{''}}</span>
                            </li>
                            <li style="width: 10% !important;">
                              <span>Start Unloading</span>
                              <br />
                              <span>{{''}}</span>
                            </li>
                            <li style="width: 10% !important;">
                              <span>Finish Unloading</span>
                              <br />
                              <span>{{''}}</span>
                            </li>
                          </ul>
                        </div>
                      </b-col>
                    </b-row>
                    <b-row style="margin-top: 10px; margin-bottom: 10px;">
                      <b-col md="9" style="padding-left: 0px !important;">
                        <b-row
                          style="border-top: solid 1px #e7eaec;border-left: solid 1px #e7eaec;border-right: solid 1px #e7eaec; border-radius: 5px 5px 0px 0px;"
                        >
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span style="color: #ccc">Order No</span>
                            <br />
                            <span>{{M_GetDataBy.order_no}}</span>
                          </b-col>
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span style="color: #ccc">Date</span>
                            <br />
                            <span>{{momentDateFormatting(M_GetDataBy.order_date, 'DD/MM/YYYY')}}</span>
                          </b-col>
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span style="color: #ccc">Category</span>
                            <br />
                            <span>{{M_GetDataBy.category}}</span>
                          </b-col>
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span style="color: #ccc">From</span>
                            <br />
                            <span>{{M_GetDataBy.from_zone}}</span>
                          </b-col>
                          <b-col style="padding: 10px !important; max-width: 20% !important;">
                            <span style="color: #ccc">To</span>
                            <br />
                            <span>{{M_GetDataBy.to_zone}}</span>
                          </b-col>
                        </b-row>
                        <b-row style="border: solid 1px #e7eaec;border-radius: 0px 0px 5px 5px;">
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span style="color: #ccc">Pick Up Date</span>
                            <br />
                            <span>{{momentDateFormatting(M_GetDataBy.pickup_date, 'DD/MM/YYYY HH:mm')}}</span>
                          </b-col>
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span style="color: #ccc">KGS</span>
                            <br />
                            <span>{{M_GetDataBy.total_kgs==null?0:M_GetDataBy.total_kgs}}</span>
                          </b-col>
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span style="color: #ccc">CBM</span>
                            <br />
                            <span>{{M_GetDataBy.total_cbm==null?0:M_GetDataBy.total_cbm}}</span>
                          </b-col>
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span style="color: #ccc">Vehicle Type</span>
                            <br />
                            <span>{{M_GetDataBy.vehicle_type_cd}}</span>
                          </b-col>
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span style="color: #ccc">Vehicle Number</span>
                            <br />
                            <span>{{M_GetDataBy.license_plate_no}}</span>
                          </b-col>
                        </b-row>
                      </b-col>
                      <b-col md="3">
                        <b-row
                          class="AppointmentData"
                          style="height: 100%; background-color: #cccccc; border-radius: 8px;"
                        >
                          <b-col style="max-width:fit-content !important; margin: auto;">
                            <div style="width:50px;">
                              <!-- <div class="CalendarTagMonth">1</div>
                              <div class="CalendarTagDate">1</div>-->
                              <img
                                :src="require('@/assets/avatar.png')"
                                alt
                                style="width: 50px; border-radius: 25px;"
                              />
                            </div>
                          </b-col>
                          <b-col style="margin: auto;">
                            <span class="AppointmentTitle">Driver</span>
                            <br />
                            <span class="AppointmentDescs">{{M_GetDataBy.driver_name}}</span>
                          </b-col>
                        </b-row>
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="12" style="padding-left: 0px !important;">
                        <b-row>
                          <b-col md="12" style="padding-left: 0px !important;">
                            <b-list-group>
                              <b-list-group-item>
                                <span style="color: #ccc">Description</span>
                                <br />
                                <span>{{M_GetDataBy.descs}}</span>
                              </b-list-group-item>
                            </b-list-group>
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col md="12" style="padding-left: 0px !important;">
                            <b-list-group>
                              <b-list-group-item>
                                <span style="color: #ccc">From :</span>
                                <br />
                                <span>{{M_GetDataBy.from_address}}</span>
                              </b-list-group-item>
                              <b-list-group-item>
                                <span style="color: #ccc">To :</span>
                                <br />
                                <span>{{M_GetDataBy.to_address}}</span>
                              </b-list-group-item>
                            </b-list-group>
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col md="6" style="padding-left: 0px !important;">
                            <b-row class="row-bordered">
                              <b-col>
                                <b-row>
                                  <b-col>
                                    <ACCRadioButton
                                      @input="Onassign_fleet_statusChange"
                                      :prop="PI_fleet_status_i"
                                      v-model="M_PlanExe.assign_fleet_status"
                                      ref="ref_assign_fleet_status"
                                    />
                                  </b-col>
                                </b-row>
                                <b-row>
                                  <b-col>
                                    <b-row>
                                      <b-col>
                                        <span>
                                          <label>Usage</label>
                                        </span>
                                        <ACCTextBox
                                          :prop="PI_usage"
                                          v-model="M_PlanExe.usage"
                                          ref="ref_usage"
                                        />
                                      </b-col>
                                      <b-col
                                        style="max-width: fit-content !important; margin-top: 35px;"
                                      >Km</b-col>
                                    </b-row>
                                  </b-col>
                                  <b-col>
                                    <b-row>
                                      <b-col>
                                        <span>
                                          <label>Usage Tolerance</label>
                                        </span>
                                        <ACCTextBox
                                          :prop="PI_usage_t"
                                          v-model="M_PlanExe.usage_t"
                                          ref="ref_usage_t"
                                        />
                                      </b-col>
                                      <b-col
                                        style="max-width: fit-content !important; margin-top: 35px;"
                                      >Km</b-col>
                                    </b-row>
                                  </b-col>
                                </b-row>
                                <b-row>
                                  <b-col>
                                    <b-row>
                                      <b-col>
                                        <span>
                                          <label>Time</label>
                                        </span>
                                        <ACCTextBox
                                          :prop="PI_time"
                                          v-model="M_PlanExe.time"
                                          ref="ref_time"
                                        />
                                      </b-col>
                                      <b-col
                                        style="max-width: fit-content !important; margin-top: 35px;"
                                      >Day(s)</b-col>
                                    </b-row>
                                  </b-col>
                                  <b-col>
                                    <b-row>
                                      <b-col>
                                        <span>
                                          <label>Time Tolerance</label>
                                        </span>
                                        <ACCTextBox
                                          :prop="PI_time_t"
                                          v-model="M_PlanExe.time_t"
                                          ref="ref_time_t"
                                        />
                                      </b-col>
                                      <b-col
                                        style="max-width: fit-content !important; margin-top: 35px;"
                                      >Day(s)</b-col>
                                    </b-row>
                                  </b-col>
                                </b-row>
                              </b-col>
                            </b-row>
                          </b-col>
                          <b-col md="6" style="padding-left: 0px !important;">
                            <b-row class="row-bordered">
                              <b-col></b-col>
                            </b-row>
                          </b-col>
                        </b-row>
                        <b-row style="margin-top: 10px;">
                          <b-col md="12" style="padding-left: 0px !important;">
                            <ABSButton
                              :text="'Save'"
                              classButton="btn btn--default"
                              classIcon="icon-style-default"
                              @click="doSave"
                              styleButton="height: 40px;width: 100%;"
                            />
                          </b-col>
                        </b-row>
                        <b-row style="margin-top: 10px;">
                          <b-col>
                            <b-button
                              style="background-color: transparent; color: black; border: none;"
                              @click="doCreateTicket"
                            >
                              <font-awesome-icon
                                icon="plus-circle"
                                class="icon-style-default"
                                style="margin-right: 5px;"
                              />Create Ticket
                            </b-button>
                          </b-col>
                          <b-col>
                            <b-button
                              style="background-color: transparent; color: black; border: none;"
                              @click="doChangeFleet"
                            >
                              <font-awesome-icon
                                icon="truck"
                                class="icon-style-default"
                                style="margin-right: 5px;"
                              />Change Fleet
                            </b-button>
                          </b-col>
                        </b-row>
                      </b-col>
                      <!-- <b-col md="6">
                        <div>
                          <img :src="require('@/assets/map.png')" alt style="width: 100%;" />
                        </div>
                      </b-col>-->
                    </b-row>
                    <b-row style="margin-top: 10px;">
                      <b-col md="6">
                        <b-row>
                          <b-col>Console Detail</b-col>
                          <b-col>
                            <b-button
                              style="background-color: transparent; color: black; border: none;"
                              @click="doAddNew"
                            >
                              <font-awesome-icon
                                icon="plus-circle"
                                class="icon-style-default"
                                style="margin-right: 5px;"
                              />Add New
                            </b-button>
                          </b-col>
                        </b-row>
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-table
                        :responsive="true"
                        :striped="false"
                        :bordered="false"
                        :outlined="false"
                        :small="false"
                        :hover="true"
                        :dark="false"
                        :fixed="false"
                        :foot-clone="false"
                        :fields="PlanExTable.Header"
                        :items="PlanExTable.Data"
                        class="table-sm table-style-2"
                      >
                        <template v-slot:cell(cancel)="data">
                          <span>
                            <font-awesome-icon
                              class="icon-style-default"
                              icon="trash"
                              size="lg"
                              style="color: red !important;"
                            />
                          </span>
                        </template>
                      </b-table>
                    </b-row>
                    <hr />
                    <b-row>
                      <b-col md="6">
                        <b-form inline style="float: left; color: #333;">
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
                      </b-col>
                      <b-col md="6">
                        <b-pagination
                          align="right"
                          v-model="currentPage"
                          @input="doGetList(search, 'pagination')"
                          :total-rows="totalRows"
                          :per-page="perPage"
                          :limit="limit"
                          style="margin-bottom: 0px;"
                          :disabled="isDisableTable"
                        ></b-pagination>
                      </b-col>
                    </b-row>
                  </b-col>
                </b-row>
              </b-form>
            </div>
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
      //list
      propList: {
        initialWhere: "",
        LineNo: 0,
        PageLevel: 1,
        TabIndex: 1,
        OrderBy: "",
        SourceField: "",
        ParamView: "",
      },
      isDisableTable: false,
      //For List
      WithViewButton: false,

      search: "",
      fieldHeader: [],
      items: [],
      firstSort: true,
      sort: "time_edit DESC",

      totalRows: 0,
      currentPage: 1,
      lastPage: 1,
      perPage: 5,
      limit: 2,
      pagingData: [
        { value: 5, text: "5" },
        { value: 10, text: "10" },
        { value: 15, text: "15" },
        { value: 20, text: "20" },
        { value: 40, text: "40" },
        { value: 60, text: "60" },
        { value: 80, text: "80" },
        { value: 100, text: "100" },
        { value: 1000, text: "1000" },
      ],

      sortedField: [{ field: "time_edit", sort: "DESC" }],

      PlanExTable: [],
      M_PlanExe: {
        arrive_date: "",
        note: "",
        assign_fleet_status: "",
      },
      PI_fleet_status_i: {
        cValidate: "",
        cName: "fleet_status_i",
        cId: "rdbfleet_status_i",
        cRadioOptions: [{ text: "Internal", value: "I" }],
        cRadioDefaultOption: "",
        cOrder: 3,
        cProtect: false,
        cVisible: true,
        cParentForm: "OP_NW_PlanExecution",
        cInputStatus: this.inputStatus,
      },
      PI_fleet_status_e: {
        cValidate: "",
        cName: "fleet_status_e",
        cId: "rdbfleet_status_e",
        cRadioOptions: [{ text: "External", value: "E" }],
        cRadioDefaultOption: "",
        cOrder: 5,
        cProtect: false,
        cVisible: true,
        cParentForm: "OP_NW_PlanExecution",
        cInputStatus: this.inputStatus,
      },
      PI_arrive_date: {
        cValidate: "",
        cName: "arrive_date",
        cOrder: 6,
        cKey: false,
        cProtect: false,
        cWithTime: true,
        cFormat: "dd/MM/yyyy",
        cParentForm: "OP_NW_PlanExecution",
      },
      PI_note: {
        cValidate: "",
        cName: "note",
        cOrder: 3,
        cKey: false,
        cProtect: false,
        cResize: false,
        cReadonly: false,
        cRows: 3,
        cMaxRows: 3,
        cSize: "md",
        cParentForm: "OP_NW_PlanExecution",
        cInputStatus: this.inputStatus,
      },
      PlanExTable: {
        Header: [
          {
            key: "no",
            label: "No",
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
            label: "pickupdate",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center",
          },
          {
            key: "fromto",
            label: "From - To",
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
            key: "cancel",
            label: "Cancel",
            thClass: "HeaderTable",
            tdClass: "ContentTable__Center",
          },
        ],
        Data: [
          {
            no: 1,
            orderno: "#ORD00001",
            pickupdate: "01/01/2020 20.00",
            fromto: "JKT - SMG",
            company: "PT. Abadi Sentosa",
            cancel: 1,
          },
          {
            no: 2,
            orderno: "#ORD00002",
            pickupdate: "01/01/2020 20.00",
            fromto: "JKT - SMG",
            company: "PT. Abadi Sentosa",
            cancel: 2,
          },
          {
            no: 3,
            orderno: "#ORD00003",
            pickupdate: "01/01/2020 20.00",
            fromto: "JKT - SMG",
            company: "PT. Abadi Sentosa",
            cancel: 3,
          },
        ],
      },
      M_GetDataBy: null,
    };
  },
  computed: {
    paramFromList() {
      var param = this.$store.getters.getParamPage;
      return param;
    },
  },
  methods: {
    Onarrive_date_Change() {},
    doSave() {},
    doCreateTicket() {},
    doChangeFleet() {},
    doAddNew() {},
    doBack() {
      this.$router.go(-1);
    },
    doCosting() {
      var param = this.paramFromList;
      param.isEdit = false;

      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "OP_PricingCostingFormDetail" });
    },
    doPick() {
      var param = this.paramFromList;
      param.isEdit = false;

      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "OP_PricingCostingFormDetail" });
    },
    doDrop() {
      var param = this.paramFromList;
      param.isEdit = false;

      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "OP_PricingCostingFormDetail" });
    },
    doEdit() {
      var param = this.paramFromList;
      param.isEdit = true;
      this.$router.push({ name: "MK_AddNewProspect", params: param });
    },
    doContact() {
      var param = this.paramFromList;
      // param.isEdit = true;
      this.$router.push({ name: "MK_ToDoList_P", params: param });
    },
    doGetlist(search) {
      var param = {
        option_url: "/MK/MK_Appointment",
        line_no: 1,
        user_id: this.getDataUser().user_id,
        portfolio_id: this.getDataUser().portfolio_id,
        subportfolio_id: this.getDataUser().subportfolio_id,
        current_page: this.currentPage,
        per_page: this.perPage,
        param_where: search,
        initial_where: " cm_contact_id = " + this.paramFromList.cm_contact_id,
        sort_field: this.sort,
        source_field: this.propList.SourceField,
        param_view: this.propList.ParamView,
      };

      this.postJSON(this.getUrlList(), param).then((response) => {
        if (response == null) return;
        // this.selected = false;

        // this.rowSelected = [];

        // this.rowSel = 0;

        this.responses = response;

        // this.ExportToken = this.responses.ExportToken;

        if (this.responses.Data.length > 0) {
        }
        this.items = [];
        this.fieldHeader = [];

        this.items = this.responses.Data;

        var str_array =
          this.responses.DefineColumn && this.responses.DefineColumn !== ""
            ? this.responses.DefineColumn.split(",")
            : this.responses.AllColumn.split(",");
        var x = "M,L,M,S";
        // var defineSize = this.responses.DefineSize.split(",");
        var defineSize = x.split(",");
        this.allColumn_bf = this.responses.AllColumn.split(",");
        var index = this.allColumn_bf.indexOf("lastupdatestamp");
        if (index > -1) {
          this.allColumn_bf.splice(index, 1);
        }
        var allColumn = [];
        var filteredColumn = [];
        var definedColumn = [];

        this.allColumn_bf.forEach((val, idx) => {
          var thClass = "HeaderACCList";
          var isSorted = this.sortedField.map((x) => x.field).indexOf(val);
          if (isSorted > -1) {
            if (this.sortedField[isSorted].sort == "ASC") {
              thClass = thClass + " AscSorted";
            } else {
              thClass = thClass + " DescSorted";
            }
          }

          allColumn.push({
            value: idx + 1,
            key: val,
            thClass: thClass,
            tdClass: "ContentACCList notranslate",
            text: val,
          });

          filteredColumn.push({
            value: idx + 1,
            key: val,
            thClass: thClass,
            tdClass: "ContentACCList notranslate",
          });
        });

        for (var i = 0; i < str_array.length; i++) {
          filteredColumn = filteredColumn.filter((val) => {
            if (val.key == str_array[i]) {
              definedColumn.push({
                value: val.value,
                key: val.key,
                thClass: val.thClass,
                tdClass: val.tdClass,
                text: val.key,
              });
            }

            return val.key != str_array[i];
          });

          var thClass = "HeaderACCList " + defineSize[i];
          // var thClass = "HeaderACCList L";

          var tdClass = "ContentACCList notranslate";
          if (
            str_array[i].toLowerCase().includes("amount") ||
            str_array[i].toLowerCase().includes("amt") ||
            str_array[i].toLowerCase().includes("rate") ||
            str_array[i].toLowerCase().includes("price")
          ) {
            tdClass = "ABStdClassList2 notranslate";
            thClass = "ABSthClassList2";
          }

          var isSorted = this.sortedField
            .map((x) => x.field)
            .indexOf(str_array[i]);
          if (isSorted > -1) {
            if (this.sortedField[isSorted].sort == "ASC") {
              thClass = thClass + " AscSorted";
            } else {
              thClass = thClass + " DescSorted";
            }
          }

          if (this.languageStatus) {
            this.fieldHeader.push({
              value: i + 1,
              key: str_array[i],
              thClass: thClass,
              tdClass: tdClass,
              label: this.$t(str_array[i]),
            });
          } else {
            if (str_array[i] == "lastupdatestamp") continue;

            var listReplace = [
              {
                key: "_",
                value: " ",
              },
              {
                key: "Cd",
                value: " Code",
              },
              {
                key: "Descs",
                value: " Description",
              },
              {
                key: "Time Edit",
                value: "Last Update",
              },
              {
                key: "garing",
                value: "/",
              },
              {
                key: "titik",
                value: ".",
              },
              {
                key: "Row Id",
                value: "View",
              },
              {
                key: "Pic",
                value: "PIC",
              },
            ];
            var isGotIt = false;
            var labelHeader = undefined;

            // console.log(str_array[i])

            if (str_array[i].includes("_")) {
              labelHeader = str_array[i]
                .toLowerCase()
                .split("_")
                .map((s) => {
                  return s.charAt(0).toUpperCase() + s.substring(1);
                })
                .join(" ");
            } else {
              // if (str_array[i] !== 'lastupdatestamp') {
              labelHeader =
                str_array[i].charAt(0).toUpperCase() +
                str_array[i].substring(1);
              // }
            }

            for (var data of listReplace) {
              if (labelHeader == undefined) {
                labelHeader = this.replaceAllString(
                  str_array[i],
                  data.key,
                  data.value
                );
              } else {
                if (labelHeader.includes(data.key)) {
                  if (labelHeader == "Row Id" && !this.WithViewButton) continue;
                  // if (labelHeader == 'Row Id' && !this.WithViewButton) {

                  // }
                  // else {
                  labelHeader = this.replaceAllString(
                    labelHeader,
                    data.key,
                    data.value
                  );
                  // }
                }
              }
            }

            if (labelHeader == "Row Id") continue;

            this.fieldHeader.push({
              value: i + 1,
              key: str_array[i],
              thClass: thClass,
              tdClass: tdClass,
              label: labelHeader,
            });
          }
        }

        // this.availableColumn = filteredColumn;
        // this.selectedColumn = definedColumn;

        // this.availableColumnTemp = filteredColumn;
        // this.selectedColumnTemp = definedColumn;
        this.totalRows = this.responses.Total;
        this.lastPage = this.responses.Last_Page;
      });
    },
    GetDataBy() {
      var param = {
        option_url: "/OP/OP_Order",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp,
      };

      this.getJSON(this.getUrlCRUD(), param).then((response) => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];
        this.M_GetDataBy = JSON.parse(data.fop_order_s)[0];
        console.log(this.M_GetDataBy);

        // if (data.path_file == "" || data.path_file == null) {
        //   this.M_NewProspect.path_file = require("@/assets/default_photo_.png");
        // } else {
        //   this.M_NewProspect.path_file = this.url + data.path_file;
        // }
      });
    },
  },
  mounted() {
    this.GetDataBy();
  },
  beforeMount() {},
};
</script>

<style scoped>
.list-group-item {
  padding: 10px !important;
}
.container-step {
  width: 100%;
}
.progressbar {
  counter-reset: step;
}
.progressbar li {
  list-style-type: none;
  width: 11%;
  float: left;
  font-size: 11px;
  position: sticky;
  text-align: center;
  color: #7d7d7d;
}
.progressbar li:before {
  width: 30px;
  height: 30px;
  content: counter(step);
  counter-increment: step;
  line-height: 27px;
  border: 2px solid #ccc;
  display: block;
  text-align: center;
  margin: 0 auto 10px auto;
  border-radius: 50%;
  background-color: #ccc;
  color: white;
}
.progressbar li:after {
  width: 100%;
  height: 5px;
  content: "";
  position: absolute;
  background-color: #ccc;
  top: 14px;
  left: -45%;
  z-index: -1;
}
.progressbar li:first-child:after {
  content: none;
}
.progressbar li.active {
  color: #333399;
}
.progressbar li.active:before {
  color: white;
  border-color: #333399;
  background-color: #333399;
}
.progressbar li.active + li:after {
  background-color: #333399;
}
</style>>
