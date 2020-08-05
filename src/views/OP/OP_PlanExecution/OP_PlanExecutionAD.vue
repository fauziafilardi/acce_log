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
                        :text="'Costing'"
                        classButton="button button--back"
                        classIcon="icon-style-1"
                        @click="doCosting"
                    />
                    <ABSButton
                        :text="'Extra Pick'"
                        classButton="button button--back"
                        classIcon="icon-style-1"
                        @click="doExtraPict"
                    />
                    <ABSButton
                        :text="'Extra Drop'"
                        classButton="button button--back"
                        classIcon="icon-style-1"
                        @click="doExtraDrop"
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
                          {{M_AD_Plan.customer_name}}
                        </span>
                      </b-col>
                      <b-col style="text-align: right;">
                        <span>
                          <ABSButton
                            :text="'Chat'"
                            classButton="btn btn--default"
                            classIcon="icon-style-1"
                            @click="doContact"
                          />
                        </span>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view" style="padding-top: 5px; padding-bottom: 10px;">
                      <b-col>
                        <span>
                          <font-awesome-icon class="icon-style-default" icon="user" />&nbsp;&nbsp; {{M_AD_Plan.contact_person}}
                        </span> &nbsp;&nbsp;
                        <span>
                          <font-awesome-icon class="icon-style-default" icon="phone-square-alt" />&nbsp;&nbsp; {{M_AD_Plan.contact_person_phone_no}}
                        </span>
                      </b-col>
                      <b-col style="text-align: right;">
                        <span>
                          <font-awesome-icon class="icon-style-default" icon="user" />&nbsp;&nbsp;User : {{M_AD_Plan.user}}
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
                                <span>{{''}}</span>
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
                            <span>Order Number</span>
                            <br />
                            <span style="color: rgb(153 153 153)">{{M_AD_Plan.order_no}}</span>
                          </b-col>
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span>Date</span>
                            <br />
                            <span style="color: rgb(153 153 153)">{{M_AD_Plan.date}}</span>
                          </b-col>
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span>Category</span>
                            <br />
                            <span style="color: rgb(153 153 153)">{{M_AD_Plan.category}}</span>
                          </b-col>
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span>From</span>
                            <br />
                            <span style="color: rgb(153 153 153)">{{M_AD_Plan.from}}</span>
                          </b-col>
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span>To</span>
                            <br />
                            <span style="color: rgb(153 153 153)">{{M_AD_Plan.to}}</span>
                          </b-col>
                        </b-row>
                        <b-row style="border: solid 1px #e7eaec;border-radius: 0px 0px 5px 5px;">
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span>Pick Up Date</span>
                            <br />
                            <span style="color: rgb(153 153 153)">{{M_AD_Plan.pickup_date}}</span>
                          </b-col>
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span>KGS</span>
                            <br />
                            <span style="color: rgb(153 153 153)">{{M_AD_Plan.kgs}}</span>
                          </b-col>
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span>CBM</span>
                            <br />
                            <span style="color: rgb(153 153 153)">{{M_AD_Plan.cbm}}</span>
                          </b-col>
                          <b-col style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;">
                            <span>Vehicle Type</span>
                            <br />
                            <span style="color: rgb(153 153 153)">{{M_AD_Plan.fleet_type_descs}}</span>
                          </b-col>
                          <b-col style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;" >
                            <span>Vehicle Number</span>
                            <br />
                            <span style="color: rgb(153 153 153)">{{M_AD_Plan.plat_no}}</span>
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
                            <span class="AppointmentDescs">{{M_AD_Plan.driver1}}</span>
                          </b-col>
                        </b-row>
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
                                <span style="color: rgb(153 153 153)">{{M_AD_Plan.from_address}}</span>
                              </b-list-group-item>
                              <b-list-group-item>
                                <span>To :</span>
                                <br />
                                <span style="color: rgb(153 153 153)">{{M_AD_Plan.to_address}}</span>
                              </b-list-group-item>
                            </b-list-group>
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col md="12" style="padding-left: 0px !important;">
                            <span>
                              <label>Finish Loading Date</label>
                            </span>
                            <ACCDateTime
                              @input="Onstart_unloading_Change"
                              :prop="PI_start_unloading"
                              v-model="M_PlanExe.start_unloading"
                              ref="ref_start_unloading"
                            />
                          </b-col>
                        </b-row>
                        <b-row class="row-view">
                            <b-col md="12" style="padding-left: 0px !important;">
                                <span>
                                    <label>Comodity</label>
                                </span>
                                <span>
                                    <label>{{M_PlanExe.comodityLabel}}</label>
                                </span>
                                <!-- <ACCDropDown
                                    @change="OncomodityChange"
                                    :prop="PI_comodity"
                                    v-model="M_PlanExe.comodity"
                                    :label="M_PlanExe.comodityLabel"
                                    :ref="'ref_comodity'"
                                /> -->
                            </b-col>
                        </b-row>
                        <b-row class="row-view">
                            <b-col md="4" style="padding-left: 0px !important;">
                                <span>
                                    <label>Total Item</label>
                                </span>
                                <span>
                                    <label>{{M_AD_Plan.total_item}}</label>
                                </span>
                                <!-- <ACCTextBox
                                    :prop="PI_total_item"
                                    v-model="M_PlanExe.total_item"
                                    ref="ref_total_item"
                                /> -->
                            </b-col>
                            <b-col md="4" style="padding-left: 0px !important;">
                                <span>
                                    <label>KGS</label>
                                </span>
                                <span>
                                    <label>{{M_AD_Plan.kgs}}</label>
                                </span>
                                <!-- <ACCTextBox
                                    :prop="PI_kgs"
                                    v-model="M_PlanExe.kgs"
                                    ref="ref_kgs"
                                /> -->
                            </b-col>
                            <b-col md="4" style="padding-left: 0px !important;">
                                <span>
                                    <label>CBM</label>
                                </span>
                                <span>
                                    <label>{{M_AD_Plan.cbm}}</label>
                                </span>
                                <!-- <ACCTextBox
                                    :prop="PI_cbm"
                                    v-model="M_PlanExe.cbm"
                                    ref="ref_cbm"
                                /> -->
                            </b-col>
                        </b-row>
                        <b-row>
                          <b-col md="12" style="padding-left: 0px !important;">
                            <span>
                              <label>Note</label>
                            </span>
                            <ACCTextArea :prop="PI_note" v-model="M_PlanExe.note" ref="ref_note" />
                          </b-col>
                        </b-row>
                        <b-row style="margin-top: 10px;">
                          <b-col md="12" style="padding-left: 0px !important;">
                            <ABSButton
                              :text="'Finish Loading'"
                              classButton="btn btn--default"
                              classIcon="icon-style-default"
                              @click="doSave"
                              styleButton="height: 40px;width: 100%;"
                            />
                          </b-col>
                        </b-row>
                      </b-col>
                      <b-col md="6">
                        <div>
                          <img :src="require('@/assets/map.png')" alt style="width: 100%;" />
                        </div>
                      </b-col>
                    </b-row>

                    <b-row class="row-bordered" style="margin-top: 10px;">
                      <b-col md="12">
                        <b-row>
                          <b-col md="1">
                            <span style="font-size: 15px; color: rgb(51, 51, 153); font-weight: bold;">
                              Ticket
                            </span>
                          </b-col>
                          <b-col md="1">
                            <b-button
                              style="background-color: transparent; color: black; border: none;"
                              @click="doCreateTicket"
                            >
                              <font-awesome-icon
                                icon="plus-circle"
                                class="icon-style-default"
                                style="margin-right: 5px;"
                              />Add New
                            </b-button>
                          </b-col>
                        </b-row>
                        <b-row>
                            <b-col>
                                <ACCFormList
                                    :prop="{}"
                                    :title="''"
                                    cStatic
                                    :cHeader="PlanTicket_H"
                                    :cData="PlanTicket_D"
                                    @rowClicked="ticketClick"
                                    ref="ref_SL_Plan_Ticket"
                                >
                                  <template slot="ticket_date" slot-scope="data">
                                    <span>{{momentDateFormatting(data.item.ticket_date, "YYYY-MM-DD HH:mm")}}</span>
                                  </template>
                                </ACCFormList>
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
        PI_start_unloading: {
            cValidate: "required",
            cName: "start_unloading",
            cOrder: 1,
            cKey: false,
            cProtect: false,
            cWithTime: true,
            cFormat: "dd/MM/yyyy",
            cParentForm: "OP_SL_PlanExecution"
        },
        PI_comodity: {
            dataLookUp: {
                LookUpCd:'GetQuotationCommodity',
                ColumnDB:'cm_commodity_id',
                InitialWhere:"ss_portfolio_id='" + this.getDataUser().portfolio_id + "'",
                ParamWhere:'',
                OrderBy:'',
                ParamView:'',
                SourceField:'',
                DisplayLookUp:'comodity_cd'
            },
            cValidate: "required",
            cName: "comodity",
            ckey: false,
            cOrder: 2,
            cProtect: false,
            cParentForm: "OP_SL_PlanExecution",
            cStatic: false,
            cOption: [],
            cDisplayColumn: "comodity_cd",
            cInputStatus: this.inputStatus
        },
        PI_total_item: {
            cValidate: "required",
            cName: "total_item",
            cOrder: 3,
            cKey: false,
            cType: "numeric",
            cProtect: false,
            cParentForm: "OP_SL_PlanExecution",
            cDecimal: 2,
            cInputStatus: this.inputStatus
        },
        PI_kgs: {
            cValidate: "required",
            cName: "kgs",
            cOrder: 4,
            cKey: false,
            cType: "numeric",
            cProtect: false,
            cParentForm: "OP_SL_PlanExecution",
            cDecimal: 2,
            cInputStatus: this.inputStatus
        },
        PI_cbm: {
            cValidate: "required",
            cName: "cbm",
            cOrder: 5,
            cKey: false,
            cType: "numeric",
            cProtect: false,
            cParentForm: "OP_SL_PlanExecution",
            cDecimal: 2,
            cInputStatus: this.inputStatus
        },
        PI_note: {
            cValidate: "required",
            cName: "note",
            cOrder: 6,
            cKey: false,
            cProtect: false,
            cResize: false,
            cReadonly: false,
            cRows: 3,
            cMaxRows: 3,
            cSize: "md",
            cParentForm: "OP_SL_PlanExecution",
            cInputStatus: this.inputStatus
        },
        PlanExTable: {
            Header: [
            {
                key: "no",
                label: "No",
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
                label: "pickupdate",
                thClass: "HeaderTable",
                tdClass: "ContentTable__Center"
            },
            {
                key: "fromto",
                label: "From - To",
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
                key: "cancel",
                label: "Cancel",
                thClass: "HeaderTable",
                tdClass: "ContentTable__Center"
            }
            ],
            Data: [
            {
                no: 1,
                orderno: "#ORD00001",
                pickupdate: "01/01/2020 20.00",
                fromto: "JKT - SMG",
                company: "PT. Abadi Sentosa",
                cancel: 1
            },
            {
                no: 2,
                orderno: "#ORD00002",
                pickupdate: "01/01/2020 20.00",
                fromto: "JKT - SMG",
                company: "PT. Abadi Sentosa",
                cancel: 2
            },
            {
                no: 3,
                orderno: "#ORD00003",
                pickupdate: "01/01/2020 20.00",
                fromto: "JKT - SMG",
                company: "PT. Abadi Sentosa",
                cancel: 3
            }
            ]
        },
        M_AD_Plan: {
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
            comodity: "",
            comodityLabel: "",
            total_item: "",
            total_loading_kgs: "",
            total_loading_cbm: "",
        },
        M_PlanExe: {
            start_unloading: "",
            note: ""
        },
        PlanTicket_H: [
          {
            key: "no",
            label: "No",
            tdClass: "ContentACCList2 notranslate th-cus-center",
            thClass: "HeaderACCList2 th-cus-center"
          },
          {
            key: "ticket_no",
            label: "Ticket No",
            tdClass: "ContentACCList2 notranslate th-cus-center",
            thClass: "HeaderACCList2 S th-cus-center"
          },
          {
            key: "ticket_date",
            label: "Date",
            tdClass: "ContentACCList2 notranslate th-cus-center",
            thClass: "HeaderACCList2 S th-cus-center"
          },
          {
            key: "category",
            label: "Category",
            tdClass: "ContentACCList2 notranslate th-cus-center",
            thClass: "HeaderACCList2 S th-cus-center"
          },
          {
            key: "descs",
            label: "Description",
            tdClass: "ContentACCList2 notranslate th-cus-center",
            thClass: "HeaderACCList2 S th-cus-center"
          },
          {
            key: "attachment",
            label: "Attachment",
            tdClass: "ContentACCList2 notranslate th-cus-center",
            thClass: "HeaderACCList2 S th-cus-center"
          },
        ],
        PlanTicket_D: [
          {
            no: 1,
            ticket_no: "#ORD1212121",
            ticket_date: new Date(),
            descs: "Test Ticket TINGINT",
            category: "Accident",
            attachment: "default_photo_.png"
          },
          {
            no: 2,
            ticket_no: "#ORD1212121",
            ticket_date: new Date(),
            descs: "Test Ticket TINGINT",
            category: "Accident",
            attachment: "default_photo_.png"
          }
        ],
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
    }
  },
  methods: {
    Onarrive_date_Change(data) {},
    OncomodityChange(data) {
        this.M_PlanExe.comodity = data.id;
        this.M_PlanExe.comodityLabel = data.label;
    },
    doSave() {},
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
        start_unloading: new Date(),
        comodity: "",
        comodityLabel: "",
        total_item: "",
        kgs: "",
        cbm: "",
        note: ""
      }
    },
    GetDataBy() {
      var param = {
        option_url: "/OP/OP_Order",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };

      this.getJSON(this.getUrlCRUD(), param).then(response => {
        // response from API
        if (response == null) return;

        var data = JSON.parse(response.Data[0].fop_order_s)[0];
        // console.log(data)
        
        this.M_AD_Plan = {
            cm_contact_id: 0,
            customer_name: data.customer_name,
            cm_contact_person_id: 0,
            contact_person: data.contact_person_name,
            contact_person_phone_no: data.contact_person_phone,
            user: this.getDataUser().user_name,
            status: data.order_status,
            order_no: data.order_no,
            date: this.momentDateFormatting(data.order_date, "YYYY-MM-DD HH:mm"),
            category: data.category,
            from: data.from_zone,
            to: data.to_zone,
            fm_driver_id1: data.fm_driver_id,
            driver1: data.driver_name,
            pickup_date: this.momentDateFormatting(data.pickup_date, "YYYY-MM-DD HH:mm"),
            kgs: data.total_kgs,
            cbm: data.total_cbm,
            fleet_type: data.fm_fleet_type_id,
            fleet_type_descs: data.vehicle_type_cd,
            plat_no: data.license_plate_no,
            descs: data.descs,
            from_address: data.from_address,
            to_address: data.to_address,
            comodity: data.cm_commodity_id,
            comodityLabel: data.commodity_descs,
            total_item: data.total_loading_item,
            total_loading_kgs: data.total_loading_kgs,
            total_loading_cbm: data.total_loading_cbm,
        }

        this.M_ClearForm();
      });
    }
  },
  mounted() {
    this.GetDataBy();
  },
  beforeMount() {}
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
