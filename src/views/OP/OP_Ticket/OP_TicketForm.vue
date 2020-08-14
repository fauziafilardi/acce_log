<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Ticket</span>
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
              <b-form :data-vv-scope="'OP_Ticket'" :data-vv-value-path="'OP_Ticket'">
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
                      <!-- <b-col style="text-align: right;">
                        <span>
                          <ABSButton
                            :text="'Chat'"
                            classButton="btn btn--default"
                            classIcon="icon-style-1"
                            @click="doContact"
                          />
                        </span>
                      </b-col>-->
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

                        <b-row>
                          <b-col md="6" style="padding-left: 0px !important;">
                            <b-row>
                              <b-col>
                                <span>
                                  <label>Description</label>
                                </span>
                                <ACCTextArea
                                  :prop="PI_notes"
                                  v-model="M_PlanExe.note"
                                  ref="ref_notes"
                                />
                              </b-col>
                            </b-row>
                            <b-row>
                              <b-col sm="6">
                                <span>
                                  <label>Create Work Order</label>
                                </span>
                                &nbsp;&nbsp;
                                <span
                                  style="margin-top:35px;"
                                >
                                  <b-form-checkbox
                                    style="display: inline-flex;"
                                    v-model="M_PlanExe.wo_status"
                                    name="check-button"
                                    switch
                                    value="Y"
                                    unchecked-value="N"
                                    size="lg"
                                  ></b-form-checkbox>
                                </span>
                              </b-col>
                              <b-col sm="6">
                                <span>
                                  <label>Claims</label>
                                </span>
                                &nbsp;&nbsp;
                                <span
                                  style="margin-top:35px;"
                                >
                                  <b-form-checkbox
                                    style="display: inline-flex;"
                                    v-model="M_PlanExe.claim_status"
                                    name="check-button"
                                    switch
                                    value="Y"
                                    unchecked-value="N"
                                    size="lg"
                                  ></b-form-checkbox>
                                </span>
                              </b-col>
                            </b-row>
                            <b-row>
                              <b-col>
                                <span>
                                  <label>Upload Multiple Photo</label>
                                </span>
                              </b-col>
                            </b-row>
                            <b-row class="row-bordered" style="background-color: #ced4da;">
                              <b-col md="12">
                                <b-row style="margin-bottom: 10px">
                                  <template v-for="(pict, index) in M_Picture">
                                    <b-col
                                      style="max-width: fit-content !important;"
                                      v-bind:key="index"
                                    >
                                      <img
                                        :id="'pict_'+index"
                                        :src="pict.file_show"
                                        alt
                                        style="width: 150px; cursor: pointer; "
                                        @click="showPict(pict)"
                                      />
                                      <font-awesome-icon
                                        class="icon-style-danger"
                                        icon="times-circle"
                                        size="lg"
                                        style="cursor: pointer; top: -5px; right: 0px; position: absolute;"
                                        @click="Delete_Pict(index)"
                                      />
                                    </b-col>
                                  </template>
                                </b-row>
                                <b-row>
                                  <b-col md="12">
                                    <div @click="addPict" style="width: 20%; cursor: pointer;">
                                      <font-awesome-icon
                                        class="icon-style-default"
                                        icon="plus-circle"
                                        size="2x"
                                      />&nbsp; &nbsp;
                                      <span
                                        style="position: absolute; font-size: 15px; color: #333399; font-weight: bold;"
                                      >Add More Photo</span>
                                    </div>
                                  </b-col>
                                </b-row>
                              </b-col>
                            </b-row>
                          </b-col>

                          <b-col md="6" style="padding-left: 0px !important;">
                            <b-row class="row-bordered" style="margin-top:25px;">
                              <b-col md="12">
                                <b-row>
                                  <b-col sm="6">
                                    <span>
                                      <label>Change Vehicle</label>
                                    </span>
                                    &nbsp;&nbsp;
                                    <span
                                      style="margin-top:35px;"
                                    >
                                      <b-form-checkbox
                                        @change="OnChangeVehicle"
                                        style="display: inline-flex;"
                                        v-model="M_PlanExe.change_vehicle"
                                        name="check-button"
                                        switch
                                        value="Y"
                                        unchecked-value="N"
                                        size="lg"
                                      ></b-form-checkbox>
                                    </span>
                                  </b-col>
                                </b-row>
                                <b-row>
                                  <b-col sm="6">
                                    <span>
                                      <label>Vehicle Type</label>
                                    </span>
                                    <ACCDropDown
                                      @change="Onvehicle_typeChange"
                                      :prop="PI_vehicle_type"
                                      v-model="M_PlanExe.vehicle_type"
                                      :label="M_PlanExe.vehicle_typeLabel"
                                      ref="ref_vehicle_type"
                                    />
                                  </b-col>
                                  <b-col sm="6">
                                    <span>
                                      <label>Vehicle Number</label>
                                    </span>
                                    <ACCDropDown
                                      @change="Onvehicle_numberChange"
                                      :prop="PI_vehicle_number"
                                      v-model="M_PlanExe.vehicle_number"
                                      :label="M_PlanExe.vehicle_numberLabel"
                                      ref="ref_vehicle_number"
                                    />
                                  </b-col>
                                </b-row>
                              </b-col>
                            </b-row>
                            <b-row class="row-bordered">
                              <b-col md="12">
                                <b-row>
                                  <b-col sm="6">
                                    <span>
                                      <label>Change Driver</label>
                                    </span>
                                    &nbsp;&nbsp;
                                    <span
                                      style="margin-top:35px;"
                                    >
                                      <b-form-checkbox
                                        @change="OnChangeDriver"
                                        style="display: inline-flex;"
                                        v-model="M_PlanExe.change_driver"
                                        name="check-button"
                                        switch
                                        value="Y"
                                        unchecked-value="N"
                                        size="lg"
                                      ></b-form-checkbox>
                                    </span>
                                  </b-col>
                                </b-row>
                                <b-row>
                                  <b-col sm="6">
                                    <span>
                                      <label>Driver</label>
                                    </span>
                                    <ACCDropDown
                                      @change="OndriverChange"
                                      :prop="PI_driver"
                                      v-model="M_PlanExe.driver"
                                      :label="M_PlanExe.driverLabel"
                                      ref="ref_driver"
                                    />
                                  </b-col>
                                  <b-col sm="6">
                                    <span>
                                      <label>Co Driver</label>
                                    </span>
                                    <ACCDropDown
                                      @change="Ondriver_coChange"
                                      :prop="PI_driver_co"
                                      v-model="M_PlanExe.driver_co"
                                      :label="M_PlanExe.driver_coLabel"
                                      ref="ref_driver_co"
                                    />
                                  </b-col>
                                </b-row>
                              </b-col>
                            </b-row>
                          </b-col>
                        </b-row>
                        <b-row style="margin-top: 10px;">
                          <b-col offset="3" md="6" style="text-align: center">
                            <ABSButton
                              :text="'Save'"
                              classButton="btn btn--default"
                              classIcon="icon-style-default"
                              @click="doSave"
                              styleButton="height: 40px;width: 70%;"
                            />
                          </b-col>
                        </b-row>
                      </b-col>
                    </b-row>
                  </b-col>
                </b-row>
              </b-form>
              <ABSModal id="Modal_Picture" ref="Modal_Picture" size="sm">
                <template slot="headerTitle">Add Picture</template>
                <template slot="content">
                  <b-row>
                    <b-col md="12">
                      <b-form
                        :data-vv-scope="'Parent_Picture'"
                        :data-vv-value-path="'Parent_Picture'"
                      >
                        <b-row>
                          <b-col md="12">
                            <b-row>
                              <b-col md="12" style="text-align: center;">
                                <img
                                  id="logo"
                                  :src="M_ModalPict.file_show"
                                  alt
                                  style="width: 200px;"
                                />
                              </b-col>
                              <b-col md="12">
                                <ACCImageUpload
                                  :prop="PI_add_pict"
                                  @change="Onadd_pictChange"
                                  v-model="M_ModalPict.file_logo"
                                />
                              </b-col>
                            </b-row>
                            <b-row>
                              <b-col style="text-align: center;">
                                <ABSButton
                                  :text="'Save Picture'"
                                  classButton="btn btn--default"
                                  classIcon="icon-style-default"
                                  @click="doAddPict"
                                  styleButton="height: 40px;width: 70%;"
                                />
                              </b-col>
                            </b-row>
                          </b-col>
                        </b-row>
                      </b-form>
                    </b-col>
                  </b-row>
                </template>
              </ABSModal>
              <ABSModal id="Show_Picture" ref="Show_Picture" size="sm">
                <template slot="content">
                  <b-row>
                    <b-col md="12" style="text-align: center;">
                      <img id="show_pict" :src="M_ModalPict.file_show" alt style="width: 100%;" />
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
      PI_notes: {
        cValidate: "",
        cName: "note",
        cOrder: 1,
        cKey: false,
        cProtect: false,
        cResize: false,
        cReadonly: false,
        cRows: 3,
        cMaxRows: 3,
        cSize: "md",
        cParentForm: "OP_Ticket",
        cInputStatus: this.inputStatus,
      },
      PI_driver: {
        dataLookUp: {
          LookUpCd: "GetDriver",
          ColumnDB: "driver_id",
          InitialWhere: "",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "",
        },
        cValidate: "",
        cName: "driver",
        cOrder: 4,
        cKey: false,
        cStatic: false,
        cProtect: true,
        cParentForm: "OP_Ticket",
        cOption: [],
        cDisplayColumn: "full_name",
        cInputStatus: this.inputStatus,
      },
      PI_driver_co: {
        dataLookUp: {
          LookUpCd: "GetDriver",
          ColumnDB: "driver_id",
          InitialWhere: "",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "",
        },
        cValidate: "",
        cName: "driver_co",
        cOrder: 5,
        cKey: false,
        cStatic: false,
        cProtect: true,
        cParentForm: "OP_Ticket",
        cOption: [],
        cDisplayColumn: "full_name",
        cInputStatus: this.inputStatus,
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
        wo_status: "N",
        claim_status: "N",
        change_vehicle: "N",
        vehicle_type: "",
        vehicle_typeLabel: "",
        vehicle_number: "",
        vehicle_numberLabel: "",
        change_driver: "N",
        driver: "",
        driverLabel: "",
        driver_co: "",
        driver_coLabel: "",
        note: "",
      },
      PI_vehicle_type: {
        dataLookUp: {
          LookUpCd: "GetFleetType",
          ColumnDB: "fleet_type_id",
          InitialWhere:
            "ss_portfolio_id='" + this.getDataUser().portfolio_id + "'",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "vehicle_type,descs",
        },
        cValidate: "",
        cName: "fm_fleet_type_id",
        cOrder: 6,
        cKey: false,
        cStatic: false,
        cProtect: true,
        cParentForm: "OP_Ticket",
        cOption: [],
        cDisplayColumn: "vehicle_type,descs",
        cInputStatus: this.inputStatus,
      },
      PI_vehicle_number: {
        dataLookUp: {
          LookUpCd: "GetFleetMstr",
          ColumnDB: "fm_fleet_mstr_id",
          InitialWhere: "",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "",
        },
        cValidate: "",
        cName: "vehicle_number",
        cOrder: 2,
        cKey: false,
        cStatic: false,
        cProtect: true,
        cParentForm: "OP_Ticket",
        cOption: [],
        cDisplayColumn: "maintenance_type",
        cInputStatus: this.inputStatus,
      },
      M_Picture: [],
      PI_add_pict: {
        cName: "picture",
        cAccept: ".jpg, .png, .gif",
        cTitle: "Browse",
        cModule: "OP",
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
      M_ModalPict: {
        file_logo: "",
        file_logo_name: "",
        file_logo_path: "",
        file_show: require("@/assets/default_photo_.png"),
      },
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
    OnChangeDriver(data) {
      this.$nextTick(() => {
        if (data == "Y") {
          this.PI_driver.cProtect = false;
          this.PI_driver_co.cProtect = false;

          this.PI_driver.cValidate = "required";
          this.PI_driver_co.cValidate = "required";
        } else {
          this.PI_driver.cProtect = true;
          this.PI_driver_co.cProtect = true;

          this.M_PlanExe.driver_co = null;
          this.M_PlanExe.driver = null;
          this.M_PlanExe.driver_coLabel = null;
          this.M_PlanExe.driverLabel = null;
        }
      });
    },
    OnChangeVehicle(data) {
      this.$nextTick(() => {
        if (data == "Y") {
          this.PI_vehicle_type.cProtect = false;
          this.PI_vehicle_number.cProtect = false;
        } else {
          this.PI_vehicle_type.cProtect = true;
          this.PI_vehicle_number.cProtect = true;

          this.M_PlanExe.vehicle_number = null;
          this.M_PlanExe.vehicle_type = null;
          this.M_PlanExe.vehicle_numberLabel = null;
          this.M_PlanExe.vehicle_typeLabel = null;
        }
      });
    },
    OndriverChange(data) {
      this.$nextTick(() => {
        this.M_PlanExe.driver = data.id;
        this.M_PlanExe.driverLabel = data.label;
      });
    },
    Ondriver_coChange(data) {
      this.$nextTick(() => {
        this.M_PlanExe.driver_co = data.id;
        this.M_PlanExe.driver_coLabel = data.label;
      });
    },
    Onvehicle_numberChange(data) {
      this.$nextTick(() => {
        this.M_PlanExe.vehicle_number = data.id;
        this.M_PlanExe.vehicle_numberLabel = data.label;
      });
    },
    Onvehicle_typeChange(data) {
      this.$nextTick(() => {
        this.M_PlanExe.vehicle_type = data.id;
        this.M_PlanExe.vehicle_typeLabel = data.label;

        this.PI_vehicle_number.dataLookUp.InitialWhere =
          "ss_portfolio_id='" +
          this.getDataUser().portfolio_id +
          "' AND fm_fleet_type_id = " +
          data.id +
          " AND license_plate_no <> '" +
          this.M_OP_Ticket.plat_no +
          "'";
      });
    },
    Onadd_pictChange(data) {
      this.M_ModalPict.file_logo_name = data.name;
      this.M_ModalPict.file_logo_path = data.path;
      this.M_ModalPict.file_show = this.url + data.path;
    },
    addPict() {
      this.$refs.Modal_Picture._show();
      this.M_ModalPict = {
        file_logo: "",
        file_logo_name: "",
        file_logo_path: "",
        file_show: require("@/assets/default_photo_.png"),
      };
    },
    doAddPict() {
      this.M_Picture.push(this.M_ModalPict);
      this.$refs.Modal_Picture._hide();
    },
    showPict(pict) {
      this.M_ModalPict = pict;
      this.$refs.Show_Picture._show();
    },
    Onarrive_date_Change(data) {},
    onDocChange(data, index) {
      this.PlanDocument[index].doc_file_name = data.name;
      this.PlanDocument[index].doc_path_file = data.path;
    },

    // Delete_Pict(id) {
    //   this.alertConfirmation(
    //     "Are You Sure Want To Delete This Document ?"
    //   ).then((ress) => {
    //     if (ress.value) {
    //       this.PlanDocument[id].doc_path_file = "";
    //       this.PlanDocument[id].doc_file_name = "";
    //     }
    //   });
    // },
    Delete_Pict(i) {
      this.M_Picture.splice(i, 1);
    },

    doSave() {
      this.$validator._base.validateAll("OP_Ticket").then((result) => {
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
          (ress) => {
            if (ress.value) {
              this.$validator.errors.clear("OP_Ticket");
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

    M_Update() {
      var paramH = {
          _Method_: "UPDATE",
          _LineNo_: 0,
          op_ticket_id: this.M_DataPost.op_ticket_id,
          ss_portfolio_id: this.getDataUser().portfolio_id,
          op_order_id: this.M_DataPost.op_order_id,
          ticket_no: this.M_DataPost.ticket_no,
          ticket_date: this.M_DataPost.ticket_date,
          op_ticket_category_id: this.M_DataPost.op_ticket_category_id,
          descs: this.M_DataPost.descs,
          doc_file_name: this.M_DataPost.doc_file_name,
          doc_path_file: this.M_DataPost.doc_path_file,
          ticket_status: this.M_DataPost.ticket_status,
          remarks: this.M_PlanExe.note,
          wo_status: this.M_PlanExe.wo_status,
          claim_status: this.M_PlanExe.claim_status,
          change_vehicle_status: this.M_PlanExe.change_vehicle,
          fm_fleet_type_id:
            this.M_PlanExe.vehicle_type == null
              ? "NULL"
              : this.M_PlanExe.vehicle_type,
          fm_fleet_mstr_id:
            this.M_PlanExe.vehicle_number == null
              ? "NULL"
              : this.M_PlanExe.vehicle_number,
          license_plate_no: this.M_PlanExe.vehicle_numberLabel,
          change_driver_status: this.M_PlanExe.change_driver,
          fm_driver_id:
            this.M_PlanExe.driver == null ? "NULL" : this.M_PlanExe.driver,
          fm_driver_id2:
            this.M_PlanExe.driver_co == null
              ? "NULL"
              : this.M_PlanExe.driver_co,
          lastupdatestamp: this.paramFromList.lastupdatestamp,
          user_edit: this.getDataUser().user_id,
        },
        paramD = [];

      for (let i = 0; i < this.M_Picture.length; i++) {
        paramD.push({
          _Method_: "SAVE",
          _LineNo_: 1,
          op_ticket_id: this.M_DataPost.op_ticket_id,
          doc_file_name:
            this.M_Picture[i].file_logo_name &&
            this.M_Picture[i].file_logo_name !== ""
              ? this.M_Picture[i].file_logo_name
              : "NULL",
          doc_path_file:
            this.M_Picture[i].file_logo_path &&
            this.M_Picture[i].file_logo_path !== ""
              ? this.M_Picture[i].file_logo_path
              : "NULL",
          user_input: this.getDataUser().user_id,
        });
      }

      var paramDel = {
        _Method_: "DELETE",
        _LineNo_: 1,
        row_id: this.M_DataPost.op_ticket_id,
        lastupdatestamp: 0,
      };

      var param = {
        option_url: "/OP/OP_Ticket",
        line_no: 0,
        Data: [
          {
            A_Update: paramH,
            B_DeleteDOc: paramDel,
            C_Looping: paramD,
          },
        ],
      };

      this.postJSONMulti(this.getUrlProsesDataPostMulti(), param).then(
        (response) => {
          if (response == null) return;
          this.alertSuccess("Update Data Has Been Successfully").then(() => {
            this.doBack();
          });
        }
      );
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
        wo_status: "",
        claim_status: "",
        change_vehicle: "N",
        vehicle_type: "",
        vehicle_typeLabel: "",
        vehicle_number: "",
        vehicle_numberLabel: "",
        change_driver: "N",
        driver: "",
        driverLabel: "",
        driver_co: "",
        driver_coLabel: "",
        note: "",
      };
    },

    GetDataBy() {
      var param = {
        option_url: "/OP/OP_Ticket",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp,
      };

      this.getJSON(this.getUrlCRUD(), param).then((response) => {
        // response from API
        if (response == null) return;

        var datas = JSON.parse(response.Data[0].fop_ticket_s);
        var data = datas[0];
        this.M_DataPost = data;
        console.log(data);
        this.M_PlanExe = {
          wo_status: data.wo_status == null ? "N" : data.wo_status,
          claim_status: data.claim_status == null ? "N" : data.claim_status,
          change_vehicle:
            data.change_vehicle_status == null
              ? "N"
              : data.change_vehicle_status,
          change_driver:
            data.change_driver_status == null ? "N" : data.change_driver_status,
          vehicle_type: data.fm_fleet_type_id,
          vehicle_typeLabel: data.vehicle_type_cd,
          vehicle_number: data.fm_fleet_mstr_id,
          vehicle_numberLabel: data.license_plate_no,
          driver: data.fm_driver_id,
          driverLabel: data.driver_name,
          driver_co: data.fm_driver_id2,
          driver_coLabel: data.driver_name2,
          note: data.remarks,
        };

        if (data.change_vehicle_status && data.change_vehicle_status == "Y") {
          this.PI_vehicle_type.cProtect = false;
          this.PI_vehicle_number.cProtect = false;
        }
        if (data.change_driver_status && data.change_driver_status == "Y") {
          this.PI_driver.cProtect = false;
          this.PI_driver_co.cProtect = false;
        }

        this.PI_vehicle_number.dataLookUp.InitialWhere =
          "ss_portfolio_id='" +
          this.getDataUser().portfolio_id +
          "' AND fm_fleet_type_id = " +
          data.fm_fleet_type_id +
          " AND license_plate_no <> '" +
          data.license_plate_no +
          "'";

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
          driver1: data.order_driver_name,
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
        };

        for (var i = 0; i < datas.length; i++) {
          this.PlanTicket_D.push({
            row_number: i + 1,
            ticket_no: datas[i].ticket_no,
            ticket_date: datas[i].ticket_date,
            ticket_category: datas[i].ticket_category,
            descs: datas[i].descs,
            doc_file_name: datas[i].doc_file_name,
          });
        }
        var detail_document = data.detail_document;
        var pict = [];
        if (detail_document.length > 0) {
          for (let i = 0; i < detail_document.length; i++) {
            pict.push({
              file_logo: "dtfile_" + i,
              file_logo_name: detail_document[i].doc_file_name,
              file_logo_path: detail_document[i].doc_path_file,
              file_show:
                detail_document[i].doc_path_file &&
                detail_document[i].doc_path_file !== ""
                  ? this.url + detail_document[i].doc_path_file
                  : require("@/assets/default_photo_.png"),
            });
          }
        }
        this.M_Picture = pict;

        // this.M_ClearForm();
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
