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
                :data-vv-scope="'OP_DP_PlanExecution'"
                :data-vv-value-path="'OP_DP_PlanExecution'"
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
                        >{{M_OP_Ticket.customer_name}}</span>
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
                        <!-- </span> -->
                      </b-col>
                    </b-row>
                    <b-row class="row-view" style="padding-top: 5px; padding-bottom: 10px;">
                      <b-col>
                        <span>
                          <font-awesome-icon class="icon-style-default" icon="user" />
                          &nbsp;&nbsp; {{M_OP_Ticket.contact_person}}
                        </span> &nbsp;&nbsp;
                        <span>
                          <font-awesome-icon class="icon-style-default" icon="phone-square-alt" />
                          &nbsp;&nbsp; {{M_OP_Ticket.contact_person_phone_no}}
                        </span>
                      </b-col>
                      <b-col style="text-align: right;">
                        <span>
                          <font-awesome-icon class="icon-style-default" icon="user" />
                          &nbsp;&nbsp;User : {{M_OP_Ticket.user}}
                        </span>
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
                            <span style="color: rgb(153 153 153)">{{M_OP_Ticket.order_no}}</span>
                          </b-col>
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span>Date</span>
                            <br />
                            <span style="color: rgb(153 153 153)">{{M_OP_Ticket.date}}</span>
                          </b-col>
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span>Category</span>
                            <br />
                            <span style="color: rgb(153 153 153)">{{M_OP_Ticket.category_descs}}</span>
                          </b-col>
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span>From</span>
                            <br />
                            <span style="color: rgb(153 153 153)">{{M_OP_Ticket.from}}</span>
                          </b-col>
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span>To</span>
                            <br />
                            <span style="color: rgb(153 153 153)">{{M_OP_Ticket.to}}</span>
                          </b-col>
                        </b-row>
                        <b-row style="border: solid 1px #e7eaec;border-radius: 0px 0px 5px 5px;">
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span>Pick Up Date</span>
                            <br />
                            <span style="color: rgb(153 153 153)">{{M_OP_Ticket.pickup_date}}</span>
                          </b-col>
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span>KGS</span>
                            <br />
                            <span style="color: rgb(153 153 153)">{{M_OP_Ticket.kgs}}</span>
                          </b-col>
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span>CBM</span>
                            <br />
                            <span style="color: rgb(153 153 153)">{{M_OP_Ticket.cbm}}</span>
                          </b-col>
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span>Vehicle Type</span>
                            <br />
                            <span style="color: rgb(153 153 153)">{{M_OP_Ticket.fleet_type_descs}}</span>
                          </b-col>
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span>Vehicle Number</span>
                            <br />
                            <span style="color: rgb(153 153 153)">{{M_OP_Ticket.plat_no}}</span>
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
                            <span class="AppointmentDescs">{{M_OP_Ticket.driver1}}</span>
                          </b-col>
                        </b-row>
                      </b-col>
                    </b-row>

                    <b-row class="row-bordered" style="margin-top: 10px;">
                      <b-col md="12">
                        <b-row>
                          <b-col md="1">
                            <span
                              style="font-size: 15px; color: rgb(51, 51, 153); font-weight: bold;"
                            >Ticket</span>
                          </b-col>
                          <!-- <b-col md="2">
                            <b-button
                              style="background-color: transparent; color: black; border: none; padding: unset !important;"
                              @click="doCreateTicket"
                            >
                              <font-awesome-icon
                                icon="plus-circle"
                                class="icon-style-default"
                                style="margin-right: 5px;"
                                size="lg"
                              />Add New
                            </b-button>
                          </b-col>-->
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
              <ABSModal id="Show_Picture" ref="Show_Picture" size="sm">
                <template slot="content">
                  <b-row>
                    <b-col md="12" style="text-align: center;">
                      <img id="show_pict" :src="M_ModalPict.file" alt style="width: 100%;" />
                    </b-col>
                  </b-row>
                </template>
              </ABSModal>
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
      M_Ticket: {
        ticket_category: "",
        ticket_categoryLabel: "",
        descs: "",
        file_name: "",
        file_path: "",
      },

      M_ModalPict: {
        file: "",
      },
      M_DataPost: {},
      M_OP_Ticket: {
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
        arrival_date: new Date(),
        comodity: "",
        comodityLabel: "",
        total_item: "",
        kgs: "",
        cbm: "",
        note: "",
      },

      PlanTicket_H: [
        {
          key: "row_number",
          label: "No",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 th-cus-center",
        },
        {
          key: "ticket_no",
          label: "Ticket No",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
        {
          key: "ticket_date",
          label: "Date",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
        {
          key: "ticket_category",
          label: "Category",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
        {
          key: "descs",
          label: "Description",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
        {
          key: "doc_file_name",
          label: "Attachment",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
      ],
      PlanTicket_D: [],

      PlanDocument: [],
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
    Onarrive_date_Change(data) {},
    onDocChange(data, index) {
      this.PlanDocument[index].doc_file_name = data.name;
      this.PlanDocument[index].doc_path_file = data.path;
    },
    Show_Pict(doc) {
      this.M_ModalPict.file = this.url + doc.doc_path_file;
      this.$refs.Show_Picture._show();
    },
    Delete_Pict(id) {
      this.alertConfirmation(
        "Are You Sure Want To Delete This Document ?"
      ).then((ress) => {
        if (ress.value) {
          this.PlanDocument[id].doc_path_file = "";
          this.PlanDocument[id].doc_file_name = "";
        }
      });
    },

    doSave() {
      this.$validator._base
        .validateAll("OP_DP_PlanExecution")
        .then((result) => {
          if (!result) return;
          this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
            (ress) => {
              if (ress.value) {
                this.$validator.errors.clear("OP_DP_PlanExecution");
                this.M_Update();
              }
            }
          );
        });
    },

    // doCreateTicket() {
    //   this.M_Ticket = {
    //     ticket_category: "",
    //     ticket_categoryLabel: "",
    //     descs: "",
    //     file_name: "",
    //     file_path: "",
    //   };

    //   this.$refs.Modal_Ticket._show();
    // },
    ticketClick(record, index) {
      var param = {
        option_url: "/OP/OP_Ticket",
        line_no: 3,
        id: record.row_id,
        lastupdatestamp: record.lastupdatestamp,
      };

      this.getJSON(this.getUrlCRUD(), param).then((response) => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];
        this.M_Ticket = {
          op_order_ticket_id: data.op_order_ticket_id,
          ticket_no: data.ticket_no,
          ticket_category: data.op_ticket_category_id__lo_1,
          ticket_categoryLabel: data.ticket_category__lbl_lo_1,
          descs: data.descs__tb_2,
          file_name: data.doc_file_name,
          file_path: data.doc_path_file,
          ticket_status: data.ticket_status,
          ticket_date: data.ticket_date,
          remarks: data.remarks,
          wo_status: data.wo_status,
          claim_status: data.claim_status,
          change_vehicle_status: data.change_vehicle_status,
          fm_fleet_mstr_id: data.fm_fleet_mstr_id,
          license_plate_no: data.license_plate_no,
          fm_driver_id: data.fm_driver_id,
          fm_driver_id2: data.fm_driver_id2,
          lastupdatestamp: record.lastupdatestamp,
        };

        this.$refs.Modal_Ticket._show();
      });
    },

    Save_Ticket() {
      this.$validator._base.validateAll("M_Ticket").then((result) => {
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
          (ress) => {
            if (ress.value) {
              this.$validator.errors.clear("M_Ticket");
              var param = {};
              if (
                this.M_Ticket.op_order_ticket_id &&
                this.M_Ticket.op_order_ticket_id !== ""
              ) {
                param = {
                  option_url: "/OP/OP_Ticket",
                  line_no: 3,
                  op_order_ticket_id: this.M_Ticket.op_order_ticket_id,
                  ss_portfolio_id: this.getDataUser().portfolio_id,
                  op_order_id: this.paramFromList.row_id,
                  ticket_no: this.M_Ticket.ticket_no,
                  ticket_date: this.M_Ticket.ticket_date,
                  op_ticket_category_id: this.M_Ticket.ticket_category,
                  descs: this.M_Ticket.ticket_descs,
                  doc_file_name: this.M_Ticket.file_name,
                  doc_path_file: this.M_Ticket.file_path,
                  ticket_status:
                    this.M_Ticket.ticket_status &&
                    this.M_Ticket.ticket_status !== ""
                      ? this.M_Ticket.ticket_status
                      : "NULL",
                  remarks:
                    this.M_Ticket.remarks && this.M_Ticket.remarks !== ""
                      ? this.M_Ticket.remarks
                      : "NULL",
                  wo_status:
                    this.M_Ticket.wo_status && this.M_Ticket.wo_status !== ""
                      ? this.M_Ticket.wo_status
                      : "NULL",
                  claim_status:
                    this.M_Ticket.claim_status &&
                    this.M_Ticket.claim_status !== ""
                      ? this.M_Ticket.claim_status
                      : "NULL",
                  change_vehicle_status:
                    this.M_Ticket.change_vehicle_status &&
                    this.M_Ticket.change_vehicle_status !== ""
                      ? this.M_Ticket.change_vehicle_status
                      : "NULL",
                  fm_fleet_mstr_id:
                    this.M_Ticket.fm_fleet_mstr_id &&
                    this.M_Ticket.fm_fleet_mstr_id !== ""
                      ? this.M_Ticket.fm_fleet_mstr_id
                      : "NULL",
                  license_plate_no:
                    this.M_Ticket.license_plate_no &&
                    this.M_Ticket.license_plate_no !== ""
                      ? this.M_Ticket.license_plate_no
                      : "NULL",
                  fm_driver_id:
                    this.M_Ticket.fm_driver_id &&
                    this.M_Ticket.fm_driver_id !== ""
                      ? this.M_Ticket.fm_driver_id
                      : "NULL",
                  fm_driver_id2:
                    this.M_Ticket.fm_driver_id2 &&
                    this.M_Ticket.fm_driver_id2 !== ""
                      ? this.M_Ticket.fm_driver_id2
                      : "NULL",
                  lastupdatestamp: this.M_Ticket.lastupdatestamp,
                  user_edit: this.getDataUser().user_id,
                };

                this.putJSON(this.getUrlCRUD(), param).then((response) => {
                  if (response == null) return;
                  this.alertSuccess(response.Message).then(() => {
                    this.$refs.Modal_Ticket._hide();
                    this.GetDataBy();
                  });
                });
              } else {
                param = {
                  option_url: "/OP/OP_Ticket",
                  line_no: 3,
                  ss_portfolio_id: this.getDataUser().portfolio_id,
                  op_order_id: this.paramFromList.row_id,
                  ticket_date: new Date(),
                  op_ticket_category_id: this.M_Ticket.ticket_category,
                  descs: this.M_Ticket.ticket_descs,
                  doc_file_name: this.M_Ticket.file_name,
                  doc_path_file: this.M_Ticket.file_path,
                  remarks: "NULL",
                  wo_status: "NULL",
                  claim_status: "NULL",
                  change_vehicle_status: "NULL",
                  fm_fleet_mstr_id: this.M_DataPost.fm_fleet_mstr_id,
                  license_plate_no: this.M_DataPost.license_plate_no,
                  fm_driver_id: this.M_DataPost.fm_driver_id,
                  fm_driver_id2: this.M_DataPost.fm_driver_id2,
                  user_input: this.getDataUser().user_id,
                };

                this.postJSON(this.getUrlCRUD(), param).then((response) => {
                  if (response == null) return;
                  this.alertSuccess(response.Message).then(() => {
                    this.$refs.Modal_Ticket._hide();
                    this.GetDataBy();
                  });
                });
              }
            }
          }
        );
      });
    },

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
        arrival_date: new Date(),
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
        option_url: "/OP/OP_Ticket",
        line_no: 0,
        id: this.paramFromList.detailList.row_id,
        lastupdatestamp: this.paramFromList.detailList.lastupdatestamp,
      };

      this.getJSON(this.getUrlCRUD(), param).then((response) => {
        // response from API
        if (response == null) return;

        var data = JSON.parse(response.Data[0].fop_ticket_s)[0];
        this.M_DataPost = data;
        console.log(data);

        this.M_OP_Ticket = {
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
          //   order_date: this.momentDateFormatting(
          //     data.order_date,
          //     "DD-MM-YYYY HH:mm"
          //   ),
          //   assign_date: this.momentDateFormatting(
          //     data.assign_date,
          //     "DD-MM-YYYY HH:mm"
          //   ),
          //   dispatch_date: this.momentDateFormatting(
          //     data.dispatch_date,
          //     "DD-MM-YYYY HH:mm"
          //   ),
          //   arrival_date: this.momentDateFormatting(
          //     data.arrival_date,
          //     "DD-MM-YYYY HH:mm"
          //   ),
          //   start_loading_date: this.momentDateFormatting(
          //     data.start_loading_date,
          //     "DD-MM-YYYY HH:mm"
          //   ),
          //   finish_loading_date: this.momentDateFormatting(
          //     data.finish_loading_date,
          //     "DD-MM-YYYY HH:mm"
          //   ),
          //   get_out_arrival_date: this.momentDateFormatting(
          //     data.get_out_arrival_date,
          //     "DD-MM-YYYY HH:mm"
          //   ),
          //   get_out_destination_date: this.momentDateFormatting(
          //     data.get_out_destination_date,
          //     "DD-MM-YYYY HH:mm"
          //   ),
          //   start_unloading_date: this.momentDateFormatting(
          //     data.start_unloading_date,
          //     "DD-MM-YYYY HH:mm"
          //   ),
          //   finish_unloading_date: this.momentDateFormatting(
          //     data.finish_unloading_date,
          //     "DD-MM-YYYY HH:mm"
          //   ),
        };

        // this.PlanTicket_D = data.detail_ticket;
        // this.PlanCosting_D = data.detail_cost;
        // this.PlanExtra_D = data.detail_pick_drop;
        // this.PlanConsole_D = data.detail_console;
        // this.PlanDocument = data.detail_document;

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
