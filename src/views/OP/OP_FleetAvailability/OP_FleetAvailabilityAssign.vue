<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Plan Execution</span>
                </b-col>
                <b-col style="text-align: right;">
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
              <b-form
                :data-vv-scope="'OP_AS_PlanExecution'"
                :data-vv-value-path="'OP_AS_PlanExecution'"
              >
                <b-row>
                  <b-col md="2" style="text-align: center;">
                    <img :src="require('@/assets/paper.png')" alt style="width: 50px;" />
                  </b-col>
                  <b-col md="10">
                    <b-row>
                      <b-col>
                        <span
                          style="font-size: 15px; font-weight: bold;"
                        >{{M_AS_Plan.customer_name}}</span>
                      </b-col>
                      <b-col style="text-align: right;">
                        <!-- <span>
                          <ABSButton
                            :text="'Chat'"
                            classButton="btn btn--default"
                            classIcon="icon-style-1"
                            @click="doContact"
                          />
                        </span>-->
                        <!-- </span> -->
                      </b-col>
                    </b-row>
                    <b-row class="row-view" style="padding-top: 5px; padding-bottom: 10px;">
                      <b-col>
                        <span>
                          <font-awesome-icon class="icon-style-default" icon="user" />
                          &nbsp;&nbsp; {{M_AS_Plan.contact_person}}
                        </span> &nbsp;&nbsp;
                        <span>
                          <font-awesome-icon class="icon-style-default" icon="phone-square-alt" />
                          &nbsp;&nbsp; {{M_AS_Plan.contact_person_phone_no}}
                        </span>
                      </b-col>
                      <b-col style="text-align: right;">
                        <span>
                          <font-awesome-icon class="icon-style-default" icon="user" />
                          &nbsp;&nbsp;User : {{M_AS_Plan.user}}
                        </span>
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col style="height: 100px">
                        <div class="container-step">
                          <ul class="progressbar" style="padding-inline-start: 0px !important;">
                            <li class="active" style="width: 10% !important; margin-top: 15px;">
                              <span style="top: -75px; position: relative; font-weight: bold;">Order</span>
                              <br />
                              <span style="top: -20px; position: relative;">{{M_AS_Plan.order_date}}</span>
                            </li>
                            <li class="active" style="width: 10% !important; margin-top: 15px;">
                              <span
                                style="top: -75px; position: relative; font-weight: bold;"
                              >Assign</span>
                              <br />
                              <span
                                style="top: -20px; position: relative;"
                              >{{M_AS_Plan.assign_date}}</span>
                            </li>
                            <li style="width: 10% !important; margin-top: 15px;">
                              <span
                                style="top: -75px; position: relative; font-weight: bold;"
                              >Dispatch</span>
                              <br />
                              <span style="top: -20px; position: relative;">{{''}}</span>
                            </li>
                            <li style="width: 10% !important; margin-top: 15px;">
                              <span
                                style="top: -75px; position: relative; font-weight: bold;"
                              >Arrived</span>
                              <br />
                              <span style="top: -20px; position: relative;">{{''}}</span>
                            </li>
                            <li style="width: 10% !important; margin-top: 15px;">
                              <span
                                style="top: -75px; position: relative; font-weight: bold;"
                              >Start Loading</span>
                              <br />
                              <span style="top: -20px; position: relative;">{{''}}</span>
                            </li>
                            <li style="width: 10% !important; margin-top: 15px;">
                              <span
                                style="top: -75px; position: relative; font-weight: bold;"
                              >Finish Loading</span>
                              <br />
                              <span style="top: -20px; position: relative;">{{''}}</span>
                            </li>
                            <li style="width: 10% !important; margin-top: 15px;">
                              <span
                                style="top: -75px; position: relative; font-weight: bold;"
                              >Get Out</span>
                              <br />
                              <span style="top: -20px; position: relative;">{{''}}</span>
                            </li>
                            <li style="width: 10% !important; margin-top: 15px;">
                              <span
                                style="top: -75px; position: relative; font-weight: bold;"
                              >Arrive Destination</span>
                              <br />
                              <span style="top: -20px; position: relative;">{{''}}</span>
                            </li>
                            <li style="width: 10% !important; margin-top: 15px;">
                              <span
                                style="top: -75px; position: relative; font-weight: bold;"
                              >Start Unloading</span>
                              <br />
                              <span style="top: -20px; position: relative;">{{''}}</span>
                            </li>
                            <li style="width: 10% !important; margin-top: 15px;">
                              <span
                                style="top: -75px; position: relative; font-weight: bold;"
                              >Finish Unloading</span>
                              <br />
                              <span style="top: -20px; position: relative;">{{''}}</span>
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
                            <span>Order Number</span>
                            <br />
                            <span style="color: rgb(153 153 153)">{{M_AS_Plan.order_no}}</span>
                          </b-col>
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span>Date</span>
                            <br />
                            <span style="color: rgb(153 153 153)">{{M_AS_Plan.date}}</span>
                          </b-col>
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span>Category</span>
                            <br />
                            <span style="color: rgb(153 153 153)">{{M_AS_Plan.category}}</span>
                          </b-col>
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span>From</span>
                            <br />
                            <span style="color: rgb(153 153 153)">{{M_AS_Plan.from}}</span>
                          </b-col>
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span>To</span>
                            <br />
                            <span style="color: rgb(153 153 153)">{{M_AS_Plan.to}}</span>
                          </b-col>
                        </b-row>
                        <b-row style="border: solid 1px #e7eaec;border-radius: 0px 0px 5px 5px;">
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span>Pick Up Date</span>
                            <br />
                            <span style="color: rgb(153 153 153)">{{M_AS_Plan.pickup_date}}</span>
                          </b-col>
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span>KGS</span>
                            <br />
                            <span style="color: rgb(153 153 153)">{{M_AS_Plan.kgs}}</span>
                          </b-col>
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span>CBM</span>
                            <br />
                            <span style="color: rgb(153 153 153)">{{M_AS_Plan.cbm}}</span>
                          </b-col>
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span>Vehicle Type</span>
                            <br />
                            <span style="color: rgb(153 153 153)">{{M_AS_Plan.fleet_type_descs}}</span>
                          </b-col>
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span>Vehicle Number</span>
                            <br />
                            <span style="color: rgb(153 153 153)">{{M_AS_Plan.plat_no}}</span>
                          </b-col>
                        </b-row>
                      </b-col>
                      <b-col md="3">
                        <b-row
                          class="AppointmentData"
                          style="height: 100%; background-color: rgb(153 153 153)ccc; border-radius: 8px;"
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
                            <span class="AppointmentDescs">{{M_AS_Plan.driver1}}</span>
                          </b-col>
                        </b-row>
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="12" style="padding-left: 0px !important;">
                        <b-list-group>
                          <b-list-group-item>
                            <span>Description</span>
                            <br />
                            <span style="color: #ccc">{{M_DataPost.descs}}</span>
                          </b-list-group-item>
                        </b-list-group>
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6" style="padding-left: 0px !important;">
                        <b-row>
                          <b-col md="12" style="padding-left: 0px !important;">
                            <b-list-group>
                              <b-list-group-item>
                                <span>From :</span>
                                <br />
                                <span style="color: rgb(153 153 153)">{{M_AS_Plan.from_address}}</span>
                              </b-list-group-item>
                              <b-list-group-item>
                                <span>To :</span>
                                <br />
                                <span style="color: rgb(153 153 153)">{{M_AS_Plan.to_address}}</span>
                              </b-list-group-item>
                            </b-list-group>
                          </b-col>
                        </b-row>
                        <b-row class="row-view" v-show="M_DataPost.assign_fleet_status=='E'">
                          <b-col md="12" style="padding-left: 0px !important;">
                            <span>
                              <label>Vendor Name</label>
                            </span>
                            <br />
                            <span style="color: #ccc">
                              <label>{{M_DataPost.vendor_name}}</label>
                            </span>
                          </b-col>
                        </b-row>
                        <b-row v-show="M_DataPost.assign_fleet_status=='E'">
                          <b-col class="row-view" md="6" style="padding-left: 0px !important;">
                            <span>
                              <label>PIC</label>
                            </span>
                            <br />
                            <span style="color: #ccc">
                              <label>{{M_DataPost.vendor_contact_person}}</label>
                            </span>
                          </b-col>
                          <b-col class="row-view" md="6" style="padding-left: 0px !important;">
                            <span>
                              <label>Phone No</label>
                            </span>
                            <br />
                            <span style="color: #ccc">
                              <label>{{M_DataPost.vendor_phone_no}}</label>
                            </span>
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col class="row-view" md="12" style="padding-left: 0px !important;">
                            <span>
                              <label>Dispath Date</label>
                            </span>
                            <br />
                            <span>
                              <label>
                                {{momentDateFormatting(
                                M_PlanExe.dispatch_date,
                                "DD/MM/YYYY"
                                )}}
                              </label>
                            </span>
                            <!-- <ACCDateTime
                              :prop="PI_dispatch_date"
                              v-model="M_PlanExe.dispatch_date"
                              ref="ref_dispatch_date"
                            />-->
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col class="row-view" md="12" style="padding-left: 0px !important;">
                            <span>
                              <label>Co Driver</label>
                            </span>
                            <br />
                            <span>
                              <label>{{M_DataPost.driver_name2}}</label>
                            </span>
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col class="row-view" md="12" style="padding-left: 0px !important;">
                            <span>
                              <label>Note</label>
                            </span>
                            <br />
                            <span>
                              <label>{{M_PlanExe.note}}</label>
                            </span>
                            <!-- <ACCTextArea :prop="PI_note" v-model="M_PlanExe.note" ref="ref_note" /> -->
                          </b-col>
                        </b-row>
                      </b-col>
                      <b-col md="6">
                        <b-row>
                          <b-col md="12" style="padding-left: 0px !important;">
                            <div>
                              <img :src="require('@/assets/map.png')" alt style="width: 100%;" />
                            </div>
                          </b-col>
                        </b-row>
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
      PI_dispatch_date: {
        cValidate: "required",
        cName: "dispatch_date",
        cOrder: 1,
        cKey: false,
        cProtect: false,
        cWithTime: true,
        cFormat: "dd/MM/yyyy",
        cParentForm: "OP_AS_PlanExecution",
      },
      PI_current_km: {
        cValidate: "required|greater:0",
        cName: "current_km",
        cOrder: 2,
        cKey: false,
        cType: "numeric",
        cProtect: false,
        cParentForm: "OP_AS_PlanExecution",
        cDecimal: 2,
        cInputStatus: this.inputStatus,
      },

      PI_note: {
        cValidate: "",
        cName: "note",
        cOrder: 6,
        cKey: false,
        cProtect: false,
        cResize: false,
        cReadonly: false,
        cRows: 7,
        cMaxRows: 7,
        cSize: "md",
        cParentForm: "OP_AS_PlanExecution",
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
      M_DataPost: {},
      M_AS_Plan: {
        cm_contact_id: "",
        customer_name: "",
        cm_contact_person_id: "",
        contact_person: "",
        contact_person_phone_no: "",
        user: "",
        status: "",
        order_no: "",
        date: "",
        category: "",
        category_descs: "",
        from: "",
        to: "",
        fm_driver_id1: "",
        driver1: "",
        pickup_date: "",
        kgs: "",
        cbm: "",
        fleet_type: "",
        fleet_type_descs: "",
        plat_no: "",
        descs: "",
        from_address: "",
        to_address: "",
      },
      M_PlanExe: {
        dispatch_date: "",
        current_km: 0,
        comodityLabel: "",
        total_item: "",
        kgs: "",
        cbm: "",
        note: "",
      },
    };
  },
  computed: {
    paramFromList() {
      var param = this.$store.getters.getParamPage;
      if (param == null || param == undefined) {
        this.doBack();
      } else {
        if (Object.keys(param).length < 1) {
          this.doBack();
        } else {
          return param;
        }
      }
    },
  },
  methods: {
    doSave() {
      this.$validator._base
        .validateAll("OP_AS_PlanExecution")
        .then((result) => {
          if (!result) return;
          this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
            (ress) => {
              if (ress.value) {
                this.$validator.errors.clear("OP_AS_PlanExecution");
                this.M_Update();
              }
            }
          );
        });
    },
    M_Update() {
      var param = {
        option_url: "/OP/OP_Order",
        line_no: 0,
        ss_portfolio_id:
          this.M_DataPost.ss_portfolio_id &&
          this.M_DataPost.ss_portfolio_id !== ""
            ? this.M_DataPost.ss_portfolio_id
            : "NULL",
        ss_subportfolio_id:
          this.M_DataPost.ss_subportfolio_id &&
          this.M_DataPost.ss_subportfolio_id !== ""
            ? this.M_DataPost.ss_subportfolio_id
            : "NULL",
        op_order_id: this.paramFromList.row_id,
        order_no:
          this.M_DataPost.order_no && this.M_DataPost.order_no !== ""
            ? this.M_DataPost.order_no
            : "NULL",
        order_status:
          this.M_DataPost.order_status && this.M_DataPost.order_status !== ""
            ? this.M_DataPost.order_status
            : "NULL",
        cm_contact_id:
          this.M_DataPost.cm_contact_id && this.M_DataPost.cm_contact_id !== ""
            ? this.M_DataPost.cm_contact_id
            : "NULL",
        descs:
          this.M_DataPost.descs && this.M_DataPost.descs !== ""
            ? this.M_DataPost.descs
            : "NULL",
        pickup_date:
          this.M_DataPost.pickup_date && this.M_DataPost.pickup_date !== ""
            ? this.M_DataPost.pickup_date
            : "NULL",
        fr_cm_contact_delivery_address_id:
          this.M_DataPost.fr_cm_contact_delivery_address_id &&
          this.M_DataPost.fr_cm_contact_delivery_address_id !== ""
            ? this.M_DataPost.fr_cm_contact_delivery_address_id
            : "NULL",
        to_cm_contact_delivery_address_id:
          this.M_DataPost.to_cm_contact_delivery_address_id &&
          this.M_DataPost.to_cm_contact_delivery_address_id !== ""
            ? this.M_DataPost.to_cm_contact_delivery_address_id
            : "NULL",
        fr_cm_zone_id:
          this.M_DataPost.fr_cm_zone_id && this.M_DataPost.fr_cm_zone_id !== ""
            ? this.M_DataPost.fr_cm_zone_id
            : "NULL",
        to_cm_zone_id:
          this.M_DataPost.to_cm_zone_id && this.M_DataPost.to_cm_zone_id !== ""
            ? this.M_DataPost.to_cm_zone_id
            : "NULL",
        fm_fleet_type_id:
          this.M_DataPost.fm_fleet_type_id &&
          this.M_DataPost.fm_fleet_type_id !== ""
            ? this.M_DataPost.fm_fleet_type_id
            : "NULL",
        assign_date:
          this.M_DataPost.assign_date && this.M_DataPost.assign_date !== ""
            ? this.M_DataPost.assign_date
            : "NULL",
        assign_fleet_status:
          this.M_DataPost.assign_fleet_status &&
          this.M_DataPost.assign_fleet_status !== ""
            ? this.M_DataPost.assign_fleet_status
            : "NULL",
        vendor_cm_contact_id:
          this.M_DataPost.vendor_cm_contact_id &&
          this.M_DataPost.vendor_cm_contact_id !== ""
            ? this.M_DataPost.vendor_cm_contact_id
            : "NULL",
        fm_fleet_mstr_id:
          this.M_DataPost.fm_fleet_mstr_id &&
          this.M_DataPost.fm_fleet_mstr_id !== ""
            ? this.M_DataPost.fm_fleet_mstr_id
            : "NULL",
        license_plate_no:
          this.M_DataPost.license_plate_no &&
          this.M_DataPost.license_plate_no !== ""
            ? this.M_DataPost.license_plate_no
            : "NULL",
        fm_driver_id:
          this.M_DataPost.fm_driver_id && this.M_DataPost.fm_driver_id !== ""
            ? this.M_DataPost.fm_driver_id
            : "NULL",
        driver_name:
          this.M_DataPost.driver_name && this.M_DataPost.driver_name !== ""
            ? this.M_DataPost.driver_name
            : "NULL",
        fm_driver_id2:
          this.M_DataPost.fm_driver_id2 && this.M_DataPost.fm_driver_id2 !== ""
            ? this.M_DataPost.fm_driver_id2
            : "NULL",
        driver_name2:
          this.M_DataPost.driver_name2 && this.M_DataPost.driver_name2 !== ""
            ? this.M_DataPost.driver_name2
            : "NULL",
        remarks:
          this.M_DataPost.remarks && this.M_DataPost.remarks !== ""
            ? this.M_DataPost.remarks
            : "NULL",
        dispatch_date: this.M_PlanExe.dispatch_date, //dari form
        dispatch_km: this.M_PlanExe.current_km, //dari form
        dispatach_notes: this.M_PlanExe.note, //dari form
        arrival_date:
          this.M_DataPost.arrival_date && this.M_DataPost.arrival_date !== ""
            ? this.M_DataPost.arrival_date
            : "NULL",
        arrival_notes:
          this.M_DataPost.arrival_notes && this.M_DataPost.arrival_notes !== ""
            ? this.M_DataPost.arrival_notes
            : "NULL",
        start_loading_date:
          this.M_DataPost.start_loading_date &&
          this.M_DataPost.start_loading_date !== ""
            ? this.M_DataPost.start_loading_date
            : "NULL",
        start_loading_notes:
          this.M_DataPost.start_loading_notes &&
          this.M_DataPost.start_loading_notes !== ""
            ? this.M_DataPost.start_loading_notes
            : "NULL",
        finish_loading_date:
          this.M_DataPost.finish_loading_date &&
          this.M_DataPost.finish_loading_date !== ""
            ? this.M_DataPost.finish_loading_date
            : "NULL",
        cm_commodity_id:
          this.M_DataPost.cm_commodity_id &&
          this.M_DataPost.cm_commodity_id !== ""
            ? this.M_DataPost.cm_commodity_id
            : "NULL",
        total_loading_item:
          this.M_DataPost.total_loading_item &&
          this.M_DataPost.total_loading_item !== ""
            ? this.M_DataPost.total_loading_item
            : "NULL",
        total_loading_kgs:
          this.M_DataPost.total_loading_kgs &&
          this.M_DataPost.total_loading_kgs !== ""
            ? this.M_DataPost.total_loading_kgs
            : "NULL",
        total_loading_cbm:
          this.M_DataPost.total_loading_cbm &&
          this.M_DataPost.total_loading_cbm !== ""
            ? this.M_DataPost.total_loading_cbm
            : "NULL",
        finish_loading_notes:
          this.M_DataPost.finish_loading_notes &&
          this.M_DataPost.finish_loading_notes !== ""
            ? this.M_DataPost.finish_loading_notes
            : "NULL",
        get_out_arrival_date:
          this.M_DataPost.get_out_arrival_date &&
          this.M_DataPost.get_out_arrival_date !== ""
            ? this.M_DataPost.get_out_arrival_date
            : "NULL",
        get_out_arrival_notes:
          this.M_DataPost.get_out_arrival_notes &&
          this.M_DataPost.get_out_arrival_notes !== ""
            ? this.M_DataPost.get_out_arrival_notes
            : "NULL",
        arrival_destination_date:
          this.M_DataPost.arrival_destination_date &&
          this.M_DataPost.arrival_destination_date !== ""
            ? this.M_DataPost.arrival_destination_date
            : "NULL",
        arrival_destination_notes:
          this.M_DataPost.arrival_destination_notes &&
          this.M_DataPost.arrival_destination_notes !== ""
            ? this.M_DataPost.arrival_destination_notes
            : "NULL",
        start_unloading_date:
          this.M_DataPost.start_unloading_date &&
          this.M_DataPost.start_unloading_date !== ""
            ? this.M_DataPost.start_unloading_date
            : "NULL",
        start_unloading_notes:
          this.M_DataPost.start_unloading_notes &&
          this.M_DataPost.start_unloading_notes !== ""
            ? this.M_DataPost.start_unloading_notes
            : "NULL",
        finish_unloading_date:
          this.M_DataPost.finish_unloading_date &&
          this.M_DataPost.finish_unloading_date !== ""
            ? this.M_DataPost.finish_unloading_date
            : "NULL",
        total_delivered_item:
          this.M_DataPost.total_delivered_item &&
          this.M_DataPost.total_delivered_item !== ""
            ? this.M_DataPost.total_delivered_item
            : "NULL",
        total_delivered_kgs:
          this.M_DataPost.total_delivered_kgs &&
          this.M_DataPost.total_delivered_kgs !== ""
            ? this.M_DataPost.total_delivered_kgs
            : "NULL",
        total_delivered_cbm:
          this.M_DataPost.total_delivered_cbm &&
          this.M_DataPost.total_delivered_cbm !== ""
            ? this.M_DataPost.total_delivered_cbm
            : "NULL",
        finish_unloading_notes:
          this.M_DataPost.finish_unloading_notes &&
          this.M_DataPost.finish_unloading_notes !== ""
            ? this.M_DataPost.finish_unloading_notes
            : "NULL",
        get_out_destination_date:
          this.M_DataPost.get_out_destination_date &&
          this.M_DataPost.get_out_destination_date !== ""
            ? this.M_DataPost.get_out_destination_date
            : "NULL",
        return_empty_to:
          this.M_DataPost.return_empty_to &&
          this.M_DataPost.return_empty_to !== ""
            ? this.M_DataPost.return_empty_to
            : "NULL",
        get_out_destination_km:
          this.M_DataPost.get_out_destination_km &&
          this.M_DataPost.get_out_destination_km !== ""
            ? this.M_DataPost.get_out_destination_km
            : "NULL",
        get_out_destination_notes:
          this.M_DataPost.get_out_destination_notes &&
          this.M_DataPost.get_out_destination_notes !== ""
            ? this.M_DataPost.get_out_destination_notes
            : "NULL",
        ref_op_order_id:
          this.M_DataPost.ref_op_order_id &&
          this.M_DataPost.ref_op_order_id !== ""
            ? this.M_DataPost.ref_op_order_id
            : "NULL",
        ref_op_order_no:
          this.M_DataPost.ref_op_order_no &&
          this.M_DataPost.ref_op_order_no !== ""
            ? this.M_DataPost.ref_op_order_no
            : "NULL",
        total_order_amt:
          this.M_DataPost.total_order_amt &&
          this.M_DataPost.total_order_amt !== ""
            ? this.M_DataPost.total_order_amt
            : "NULL",
        total_order_cost:
          this.M_DataPost.total_order_cost &&
          this.M_DataPost.total_order_cost !== ""
            ? this.M_DataPost.total_order_cost
            : "NULL",
        lastupdatestamp: this.paramFromList.lastupdatestamp,
        user_edit: this.getDataUser().user_id,
      };

      this.putJSON(this.getUrlCRUD(), param).then((response) => {
        // console.log(response)
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          this.doBack();
        });
      });
    },
    doCreateTicket() {},
    doBack() {
      this.$router.go(-1);
    },
    doContact() {
      var param = this.paramFromList;
      // param.isEdit = true;
      this.$router.push({ name: "MK_ToDoList_P", params: param });
    },
    M_ClearForm() {
      this.M_PlanExe = {
        dispatch_date: new Date(),
        current_km: 0,
        comodity: "",
        comodityLabel: "",
        total_item: "",
        kgs: "",
        cbm: "",
        note: "",
      };
    },
    GetDataBy() {
      var param = {
        option_url: "/OP/OP_Order",
        line_no: 0,
        id: this.paramFromList.detailList.row_id,
        lastupdatestamp: this.paramFromList.detailList.lastupdatestamp,
      };

      this.getJSON(this.getUrlCRUD(), param).then((response) => {
        // response from API
        if (response == null) return;

        var data = JSON.parse(response.Data[0].fop_order_s)[0];
        this.M_DataPost = data;
        console.log(data);

        this.M_AS_Plan = {
          cm_contact_id: data.cm_contact_id,
          customer_name: data.customer_name,
          cm_contact_person_id: data.cm_contact_person_id,
          contact_person: data.contact_person_name,
          contact_person_phone_no: data.contact_person_phone,
          user: this.getDataUser().user_name,
          status: data.order_status,
          order_no: data.order_no,
          date: this.momentDateFormatting(data.order_date, "YYYY-MM-DD HH:mm"),
          category: data.category,
          category_descs: data.category_descs,
          from: data.from_zone,
          to: data.to_zone,
          fm_driver_id1: data.fm_driver_id,
          driver1: data.driver_name,
          pickup_date: this.momentDateFormatting(
            data.pickup_date,
            "YYYY-MM-DD HH:mm"
          ),
          kgs: data.total_kgs,
          cbm: data.total_cbm,
          fleet_type: data.fm_fleet_type_id,
          fleet_type_descs: data.vehicle_type_cd,
          plat_no: data.license_plate_no,
          descs: data.descs,
          from_address: data.from_address,
          to_address: data.to_address,
          order_date: this.momentDateFormatting(
            data.order_date,
            "DD-MM-YYYY HH:mm"
          ),
          assign_date: this.momentDateFormatting(
            data.assign_date,
            "DD-MM-YYYY HH:mm"
          ),
          dispatch_date: this.momentDateFormatting(
            data.dispatch_date,
            "DD-MM-YYYY HH:mm"
          ),
          arrival_date: this.momentDateFormatting(
            data.arrival_date,
            "DD-MM-YYYY HH:mm"
          ),
          start_loading_date: this.momentDateFormatting(
            data.start_loading_date,
            "DD-MM-YYYY HH:mm"
          ),
          finish_loading_date: this.momentDateFormatting(
            data.finish_loading_date,
            "DD-MM-YYYY HH:mm"
          ),
          get_out_arrival_date: this.momentDateFormatting(
            data.get_out_arrival_date,
            "DD-MM-YYYY HH:mm"
          ),
          get_out_destination_date: this.momentDateFormatting(
            data.get_out_destination_date,
            "DD-MM-YYYY HH:mm"
          ),
          start_unloading_date: this.momentDateFormatting(
            data.start_unloading_date,
            "DD-MM-YYYY HH:mm"
          ),
          finish_unloading_date: this.momentDateFormatting(
            data.finish_unloading_date,
            "DD-MM-YYYY HH:mm"
          ),
        };

        // this.PlanTicket_D = !data.detail_ticket || data.detail_ticket == null || data.detail_ticket == undefined ? [] : data.detail_ticket
        this.PlanCosting_D =
          !data.detail_cost ||
          data.detail_cost == null ||
          data.detail_cost == undefined
            ? []
            : data.detail_cost;

        this.PlanPickDrop_D =
          !data.detail_pick_drop ||
          data.detail_pick_drop == null ||
          data.detail_pick_drop == undefined
            ? []
            : data.detail_pick_drop;
        this.PlanConsole_D =
          !data.detail_console ||
          data.detail_console == null ||
          data.detail_console == undefined
            ? []
            : data.detail_console;
        // this.PlanDocument = !data.detail_document || data.detail_document == null || data.detail_document == undefined ? [] : data.detail_document

        this.M_ClearForm();
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
  background-color: rgb(153 153 153);
  color: white;
}
.progressbar li:after {
  width: 100%;
  height: 5px;
  content: "";
  position: absolute;
  background-color: rgb(153 153 153);
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
