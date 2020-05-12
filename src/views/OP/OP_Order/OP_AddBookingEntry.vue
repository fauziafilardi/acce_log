<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Booking Entry</span>
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
              <b-form :data-vv-scope="'MK_AddQuotation'" :data-vv-value-path="'MK_AddQuotation'">
                <b-row>
                  <b-col md="6">
                    <span>
                        <label>Transaction Information</label>
                    </span>
                    <div>
                        <b-row>
                            <b-col>
                                <span>
                                    <label>Customer Name</label>
                                </span>
                                <ACCLookUp
                                    @change="OncustomerChange"
                                    :prop="PI_customer"
                                    v-model="M_Order.customer"
                                    :label="M_Order.customerLabel"
                                    ref="ref_customer"
                                />
                            </b-col>
                            <b-col>
                                <span>
                                    <label>PIC</label>
                                </span>
                                <ACCLookUp
                                    @change="OnpicChange"
                                    :prop="PI_pic"
                                    v-model="M_Order.pic"
                                    :label="M_Order.picLabel"
                                    ref="ref_pic"
                                />
                            </b-col>
                        </b-row>
                        <b-row>
                            <b-col>
                                <span>
                                    <label>Order Ref No</label>
                                </span>
                                <ACCTextBox
                                    :prop="PI_order_ref_no"
                                    v-model="M_Order.order_ref_no"
                                    ref="ref_order_ref_no"
                                />
                            </b-col>
                        </b-row>
                        <b-row>
                            <b-col>
                                <span>
                                    <label>Booking Category</label>
                                </span>
                                <ACCRadioButton
                                    @input="Onbooking_categoryChange"
                                    :prop="PI_booking_category"
                                    v-model="M_Order.booking_category"
                                    ref="ref_booking_category"
                                />
                            </b-col>
                            <b-col v-show="M_Order.booking_category=='P'">
                                <span>
                                    <label>Contract No</label>
                                </span>
                                <ACCTextBox
                                    :prop="PI_contract_no"
                                    v-model="M_Order.contract_no"
                                    ref="ref_contract_no"
                                />
                            </b-col>
                        </b-row>
                        <b-row v-show="M_Order.booking_category=='P'">
                            <b-col>
                                <ACCRadioButton
                                    @input="Onvolume_baseChange"
                                    :prop="PI_volume_base"
                                    v-model="M_Order.with_base"
                                    ref="ref_volume_base"
                                />
                            </b-col>
                            <b-col>
                                <ACCTextBox
                                    :prop="PI_v_volume"
                                    v-model="M_Order.v_volume"
                                    ref="ref_v_volume"
                                />
                            </b-col>
                            <b-col>
                                <ACCTextBox
                                    :prop="PI_v_pickup"
                                    v-model="M_Order.v_pickup"
                                    ref="ref_v_pickup"
                                />
                            </b-col>
                            <b-col>
                                <ACCTextBox
                                    :prop="PI_v_rest_of"
                                    v-model="M_Order.v_rest_of"
                                    ref="ref_v_rest_of"
                                />
                            </b-col>
                        </b-row>
                        <b-row v-show="M_Order.booking_category=='P'">
                            <b-col>
                                <ACCRadioButton
                                    @input="Ontrip_baseChange"
                                    :prop="PI_trip_base"
                                    v-model="M_Order.with_base"
                                    ref="ref_trip_base"
                                />
                            </b-col>
                            <b-col>
                                <ACCTextBox
                                    :prop="PI_t_volume"
                                    v-model="M_Order.t_volume"
                                    ref="ref_t_volume"
                                />
                            </b-col>
                            <b-col>
                                <ACCTextBox
                                    :prop="PI_t_pickup"
                                    v-model="M_Order.t_pickup"
                                    ref="ref_t_pickup"
                                />
                            </b-col>
                            <b-col>
                                <ACCTextBox
                                    :prop="PI_t_rest_of"
                                    v-model="M_Order.t_rest_of"
                                    ref="ref_t_rest_of"
                                />
                            </b-col>
                        </b-row>
                        <b-row>
                            <b-col>
                                <span>
                                    <label>Pickup From</label>
                                </span>
                                <ACCLookUp
                                    @change="Onpickup_fromChange"
                                    :prop="PI_pickup_from"
                                    v-model="M_Order.pickup_from"
                                    :label="M_Order.pickup_fromLabel"
                                    ref="ref_pickup_from"
                                />
                            </b-col>
                            <b-col>
                                <span>
                                    <label>Deliver To</label>
                                </span>
                                <ACCLookUp
                                    @change="Ondeliver_toChange"
                                    :prop="PI_deliver_to"
                                    v-model="M_Order.deliver_to"
                                    :label="M_Order.deliver_toLabel"
                                    ref="ref_deliver_to"
                                />
                            </b-col>
                        </b-row>
                        <b-row>
                            <b-col>
                                <span>
                                    <label>Pickup Date Time</label>
                                </span>
                                <ACCDateTime
                                    @input="OndateChange"
                                    :prop="PI_date"
                                    v-model="M_Order.date"
                                    ref="ref_date"
                                />
                            </b-col>
                        </b-row>
                    </div>
                  </b-col>
                  <b-col md="6">
                    <span>
                        <label>Truck Information</label>
                    </span>
                    <div>
                        <b-row>
                            <b-col>
                                <div @click="OnTLChange('F')" :class="M_Order.TL == 'F' ? 'isOn' : 'isOff'">
                                    FTL
                                </div>
                            </b-col>
                            <b-col>
                                <div @click="OnTLChange('L')" :class="M_Order.TL == 'L' ? 'isOn' : 'isOff'">
                                    LTL
                                </div>
                            </b-col>
                        </b-row>
                        <b-row v-show="M_Order.TL == 'L'">
                            <b-col>
                                <span>
                                    <label>Weight (Kg)</label>
                                </span>
                                <ACCTextBox
                                    :prop="PI_weight"
                                    v-model="M_Order.weight"
                                    ref="ref_weight"
                                />
                            </b-col>
                            <b-col>
                                <span>
                                    <label>Cubic</label>
                                </span>
                                <ACCTextBox
                                    :prop="PI_cubic"
                                    v-model="M_Order.cubic"
                                    ref="ref_cubic"
                                />
                            </b-col>
                        </b-row>
                        <!-- <template > -->
                            <b-row v-for="(data,index) in FTL" v-bind:key="index" v-show="M_Order.TL == 'F'">
                                <b-col>
                                    <span>
                                        <label>Truck</label>
                                    </span>
                                    <ACCTextBox
                                        :prop="data.PI_truck"
                                        v-model="data.truck"
                                        :ref="'ref_truck_'+index"
                                    />
                                </b-col>
                                <b-col>
                                    <span>
                                        <label>Qty</label>
                                    </span>
                                    <ACCDropDown
                                        @change="OnqtyChange($event,index)"
                                        :prop="data.PI_qty"
                                        v-model="data.qty"
                                        :label="data.qtyLabel"
                                        :ref="'ref_qty_'+index"
                                    />
                                </b-col>
                            </b-row>
                        <!-- </template> -->
                        <b-row>
                            <b-col>
                                <div @click="AddTruck">
                                    +
                                    <span>
                                        <label>Add More Truck</label>
                                    </span>
                                </div>
                            </b-col>
                        </b-row>
                    </div>
                    <div>
                        <b-row>
                            <b-col>
                                <span>
                                    <label>Extra Pickup</label>
                                </span>
                                <ACCLookUp
                                    @change="Onextra_pickupChange"
                                    :prop="PI_extra_pickup"
                                    v-model="M_Order.extra_pickup"
                                    :label="M_Order.extra_pickupLabel"
                                    ref="ref_extra_pickup"
                                />
                            </b-col>
                        </b-row>
                        <b-row>
                            <b-col>
                                <span>
                                    <label>Extra Deliver</label>
                                </span>
                                <ACCLookUp
                                    @change="Onextra_deliverChange"
                                    :prop="PI_extra_deliver"
                                    v-model="M_Order.extra_deliver"
                                    :label="M_Order.extra_deliverLabel"
                                    ref="ref_extra_deliver"
                                />
                            </b-col>
                        </b-row>
                    </div>
                  </b-col>
                </b-row>
                <b-row style="margin-top: 10px;">
                    <b-col>
                        <ABSButton
                            :text="'Save'"
                            classButton="btn btn--default"
                            classIcon="icon-style-default"
                            @click="doSave"
                            styleButton="height: 40px;width: 100%;"
                        />
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
      M_Order: {
        customer: "",
        customerLabel: "",
        pic: "",
        picLabel: "",
        order_ref_no: "",
        booking_category: "N",
        with_base: "V",
        v_volume: "",
        v_pickup: "",
        v_rest_of: "",
        t_volume: "",
        t_pickup: "",
        t_rest_of: "",
        pickup_from: "",
        pickup_fromLabel: "",
        deliver_to: "",
        deliver_toLabel: "",
        date: "",
        TL: "F",
        weight: "",
        cubic: "",
        extra_pickup: "",
        extra_pickupLabel: "",
        extra_deliver: "",
        extra_deliverLabel: "",
      },
      PI_customer: {
        dataLookUp: {
          LookUpCd: "GetCMContact",
          ColumnDB: "contact_id",
          InitialWhere: "",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "name,contact_person,time_edit"
        },
        cValidate: "required",
        cName: "customer",
        ckey: false,
        cOrder: 1,
        cProtect: false,
        cParentForm: "MK_AddQuotation",
        cStatic: false,
        cOption: [],
        cDisplayColumn: "name,contact_person,time_edit",
        cInputStatus: this.inputStatus
      },
      PI_pic: {
        dataLookUp: {
          LookUpCd: "GetContactPerson",
          ColumnDB: "contact_person_id",
          InitialWhere: "",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "name,phone_no,email,time_edit"
        },
        cValidate: "required",
        cName: "pic",
        ckey: false,
        cOrder: 2,
        cProtect: false,
        cParentForm: "MK_AddQuotation",
        cStatic: false,
        cOption: [],
        cDisplayColumn: "name,phone_no,email,time_edit",
        cInputStatus: this.inputStatus
      },
      PI_order_ref_no: {
        cValidate: "",
        cName: "order_ref_no",
        cOrder: 3,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "MK_AddQuotation",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_booking_category: {
        cValidate :'', 
        cName: 'booking_category', 
        cId: 'rdbbooking_category', 
        cRadioOptions: [{ text: 'Non Project', value: 'N' }, { text: 'Project', value: 'P' }], 
        cRadioDefaultOption: 'N',
        cOrder: 4, 
        cProtect: false, 
        cVisible:  true, 
        cParentForm: 'MK_AddQuotation',
        cInputStatus: this.inputStatus
      },
      PI_contract_no: {
        cValidate: "",
        cName: "contract_no",
        cOrder: 5,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "MK_AddQuotation",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_volume_base: {
        cValidate :'', 
        cName: 'volume_base', 
        cId: 'rdbvolume_base', 
        cRadioOptions: [{ text: 'Volume Base', value: 'V' }], 
        cRadioDefaultOption: '',
        cOrder: 6, 
        cProtect: false, 
        cVisible:  true, 
        cParentForm: 'MK_AddQuotation',
        cInputStatus: this.inputStatus
      },
      PI_v_volume: {
        cValidate: "",
        cName: "v_volume",
        cOrder: 7,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "MK_AddQuotation",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_v_pickup: {
        cValidate: "",
        cName: "v_pickup",
        cOrder: 8,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "MK_AddQuotation",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_v_rest_of: {
        cValidate: "",
        cName: "v_rest_of",
        cOrder: 9,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "MK_AddQuotation",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_trip_base: {
        cValidate :'', 
        cName: 'trip_base', 
        cId: 'rdbtrip_base', 
        cRadioOptions: [{ text: 'Trip Base', value: 'T' }], 
        cRadioDefaultOption: '',
        cOrder: 10, 
        cProtect: false, 
        cVisible:  true, 
        cParentForm: 'MK_AddQuotation',
        cInputStatus: this.inputStatus
      },
      PI_t_volume: {
        cValidate: "",
        cName: "t_volume",
        cOrder: 11,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "MK_AddQuotation",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_t_pickup: {
        cValidate: "",
        cName: "t_pickup",
        cOrder: 12,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "MK_AddQuotation",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_t_rest_of: {
        cValidate: "",
        cName: "t_rest_of",
        cOrder: 13,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "MK_AddQuotation",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_pickup_from: {
        dataLookUp: {
          LookUpCd: "GetContactPerson",
          ColumnDB: "contact_person_id",
          InitialWhere: "",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "name,phone_no,email,time_edit"
        },
        cValidate: "required",
        cName: "pickup_from",
        ckey: false,
        cOrder: 14,
        cProtect: false,
        cParentForm: "MK_AddQuotation",
        cStatic: false,
        cOption: [],
        cDisplayColumn: "name,phone_no,email,time_edit",
        cInputStatus: this.inputStatus
      },
      PI_deliver_to: {
        dataLookUp: {
          LookUpCd: "GetContactPerson",
          ColumnDB: "contact_person_id",
          InitialWhere: "",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "name,phone_no,email,time_edit"
        },
        cValidate: "required",
        cName: "deliver_to",
        ckey: false,
        cOrder: 15,
        cProtect: false,
        cParentForm: "MK_AddQuotation",
        cStatic: false,
        cOption: [],
        cDisplayColumn: "name,phone_no,email,time_edit",
        cInputStatus: this.inputStatus
      },
      PI_date: {
        cValidate: "",
        cName: "date",
        cOrder: 16,
        cKey: false,
        cProtect: false,
        cWithTime: true,
        cFormat: "dd/MM/yyyy",
        cParentForm: "MK_AddQuotation",
        cInputStatus: this.inputStatus
      },
      PI_weight: {
        cValidate: "",
        cName: "weight",
        cOrder: 17,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "MK_AddQuotation",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_cubic: {
        cValidate: "",
        cName: "cubic",
        cOrder: 18,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "MK_AddQuotation",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      FTL : [
          {
            PI_truck: {
                cValidate: "",
                cName: "truck",
                cOrder: 19,
                cKey: false,
                cType: "text",
                cProtect: false,
                cParentForm: "MK_AddQuotation",
                cDecimal: 2,
                cInputStatus: this.inputStatus
            },
            truck: "",
            PI_qty: {
                dataLookUp: null,
                cValidate: "",
                cName: "qty",
                ckey: false,
                cOrder: 20,
                cProtect: false,
                cParentForm: "MK_AddQuotation",
                cStatic: true,
                cOption: [
                    { id: "1", label: "1" },
                    { id: "2", label: "2" },
                    { id: "3", label: "3" },
                    { id: "4", label: "4" },
                    { id: "5", label: "5" },
                    { id: "6", label: "6" },
                    { id: "7", label: "7" },
                    { id: "8", label: "8" },
                    { id: "9", label: "9" },
                    { id: "10", label: "10" },
                ],
                cDisplayColumn: "qty_id,descs",
                cInputStatus: this.inputStatus
            },
            qty: "",
            qtyLabel: ""
          }
      ],
      PI_extra_pickup: {
        dataLookUp: {
          LookUpCd: "GetContactPerson",
          ColumnDB: "contact_person_id",
          InitialWhere: "",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "name,phone_no,email,time_edit"
        },
        cValidate: "required",
        cName: "extra_pickup",
        ckey: false,
        cOrder: 19,
        cProtect: false,
        cParentForm: "MK_AddQuotation",
        cStatic: false,
        cOption: [],
        cDisplayColumn: "name,phone_no,email,time_edit",
        cInputStatus: this.inputStatus
      },
      PI_extra_deliver: {
        dataLookUp: {
          LookUpCd: "GetContactPerson",
          ColumnDB: "contact_person_id",
          InitialWhere: "",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "name,phone_no,email,time_edit"
        },
        cValidate: "required",
        cName: "extra_deliver",
        ckey: false,
        cOrder: 20,
        cProtect: false,
        cParentForm: "MK_AddQuotation",
        cStatic: false,
        cOption: [],
        cDisplayColumn: "name,phone_no,email,time_edit",
        cInputStatus: this.inputStatus
      },
    };
  },
  computed: {
    paramFromList() {
      var param = this.$route.params;
      // if (param == null || param == undefined) {
      //   this.doBack();
      // } else {
      //   if (Object.keys(param).length < 1) {
      //     this.doBack();
      //   } else {
      return param;
      //   }
      // }
    },
    inputStatus() {
      var param = this.$route.params;
      if (param.isEdit && param.isEdit === true) {
        return "edit";
      } else {
        return "new";
      }
    }
  },
  methods: {
    doBack() {
      this.$router.go(-1);
    },
    OncustomerChange(data) {
      this.$nextTick(() => {
        this.M_Order.customer = data.row_id;
        this.M_Order.customerLabel = data.name;
      });
    },
    OnpicChange(data) {
      this.$nextTick(() => {
        this.M_Order.pic = data.row_id;
        this.M_Order.picLabel = data.name;
      });
    },
    Onbooking_categoryChange(data) {},
    Onvolume_baseChange(data) {},
    Ontrip_baseChange(data) {},
    Onpickup_fromChange(data) {
        this.$nextTick(() => {
            this.M_Order.pickup_from = data.row_id;
            this.M_Order.pickup_fromLabel = data.descs;
        });
    },
    Ondeliver_toChange(data) {
        this.$nextTick(() => {
            this.M_Order.deliver_to = data.row_id;
            this.M_Order.deliver_toLabel = data.descs;
        });
    },
    OndateChange(data) {},
    OnTLChange(data) {
        this.M_Order.TL = data
    },
    OnqtyChange(data, index) {
        // console.log(data, index)
        this.$nextTick(() => {
            this.FTL[index].qty = data.id;
            this.FTL[index].qtyLabel = data.label;
        });
    },
    Onextra_pickupChange(data) {
        this.$nextTick(() => {
            this.M_Order.extra_pickup = data.row_id;
            this.M_Order.extra_pickupLabel = data.descs;
        });
    },
    Onextra_deliverChange(data) {
        this.$nextTick(() => {
            this.M_Order.extra_deliver = data.row_id;
            this.M_Order.extra_deliverLabel = data.descs;
        });
    },
    M_ClearForm() {
      this.M_Order = {
        customer: "",
        customerLabel: "",
        pic: "",
        picLabel: "",
        order_ref_no: "",
        booking_category: "N",
        with_base: "V",
        v_volume: "",
        v_pickup: "",
        v_rest_of: "",
        t_volume: "",
        t_pickup: "",
        t_rest_of: "",
        pickup_from: "",
        pickup_fromLabel: "",
        deliver_to: "",
        deliver_toLabel: "",
        date: "",
        TL: "F",
        weight: "",
        cubic: "",
        extra_pickup: "",
        extra_pickupLabel: "",
        extra_deliver: "",
        extra_deliverLabel: "",
      };
    },
    AddTruck() {
        var rand = Math.floor(Math.random() * 100);
        this.FTL.push({
            PI_truck: {
                cValidate: "",
                cName: "truck_" + rand,
                cOrder: rand,
                cKey: false,
                cType: "text",
                cProtect: false,
                cParentForm: "MK_AddQuotation",
                cDecimal: 2,
                cInputStatus: this.inputStatus
            },
            truck: "",
            PI_qty: {
                dataLookUp: null,
                cValidate: "",
                cName: "qty_" + rand,
                ckey: false,
                cOrder: rand,
                cProtect: false,
                cParentForm: "MK_AddQuotation",
                cStatic: true,
                cOption: [
                    { id: "1", label: "1" },
                    { id: "2", label: "2" },
                    { id: "3", label: "3" },
                    { id: "4", label: "4" },
                    { id: "5", label: "5" },
                    { id: "6", label: "6" },
                    { id: "7", label: "7" },
                    { id: "8", label: "8" },
                    { id: "9", label: "9" },
                    { id: "10", label: "10" },
                ],
                cDisplayColumn: "qty_id,descs",
                cInputStatus: this.inputStatus
            },
            qty: "",
            qtyLabel: ""
        })
    },
    doSave() {
        console.log(this.M_Order, this.FTL)
        return
      this.$validator._base.validateAll("MK_AddQuotation").then(result => {
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
          ress => {
            if (ress.value) {
              this.$validator.errors.clear("MK_AddQuotation");
              if (this.inputStatus == "edit") {
                // this.M_Update();
              } else {
                this.M_Save();
              }
            }
          }
        );
      });
    },
    M_Save() {
      var param = {
        option_url: "/OP/OP_Order",
        line_no: 0,
        // ss_portfolio_id: this.getDataUser().portfolio_id,
        // ss_subportfolio_id: this.getDataUser().subportfolio_id,
        // cm_contact_id: this.M_Order.customer,
        // quotation_no: this.M_Order.quotation_no,
        // quotation_date: this.M_Order.date,
        // quotation_type: this.M_Order.type,
        // project_name: this.M_Order.project_name,
        // descs: this.M_Order.descs,
        // project_value: this.M_Order.project_value,
        // expired_date: this.M_Order.valid_until,
        // status: this.M_Order.status,
        // user_input: this.getDataUser().user_id
      };

      this.postJSON(this.getUrlCRUD(), param).then(response => {
        // console.log(response)
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          this.doBack();
        });
      });
    },
    M_Update() {
      var param = {
        option_url: "/MK/MK_Quotation",
        line_no: 0,
        mk_quotation_id: this.paramFromList.row_id,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        ss_subportfolio_id: this.getDataUser().subportfolio_id,
        cm_contact_id: this.M_Order.customer,
        quotation_no: this.M_Order.quotation_no,
        quotation_date: this.M_Order.date,
        quotation_type: this.M_Order.type,
        project_name: this.M_Order.project_name,
        descs: this.M_Order.descs,
        project_value: this.M_Order.project_value,
        expired_date: this.M_Order.valid_until,
        status: this.M_Order.status,
        lastupdatestamp: this.paramFromList.lastupdatestamp,
        user_edit: this.getDataUser().user_id
      };

      this.putJSON(this.getUrlCRUD(), param).then(response => {
        // console.log(response)
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          this.doBack();
        });
      });
    },
    GetDataBy() {
      var param = {
        option_url: "/MK/MK_Quotation",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };

      this.getJSON(this.getUrlCRUD(), param).then(response => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];

        this.M_Order = {
          customer: data.cm_contact_id,
          customerLabel: data.name,
          fulladdress:
            data.address +
            ", " +
            data.district +
            ", " +
            data.city +
            ", " +
            data.province +
            " - " +
            data.country,
          address: data.address,
          phone_no: data.phone_no && data.phone_no !== "" ? data.phone_no : "-",
          email: data.email && data.email !== "" ? data.email : "-",
          website: data.website && data.website !== "" ? data.website : "-",
          pic:
            data.contact_person && data.contact_person !== ""
              ? data.contact_person
              : "-",
          pic_phone_no:
            data.contact_phone_no && data.contact_phone_no !== ""
              ? data.contact_phone_no
              : "-",
          date: data.quotation_date,
          type: data.quotation_type,
          typeLabel: data.type,
          quotation_no: data.quotation_no,
          project_name: data.project_name,
          descs: data.descs,
          project_value: this.isCurrency(data.project_value, this.decimal),
          valid_until: data.expired_date,
          status: data.status,
          statusLabel: data.status
        };
      });
    }
  },
  mounted() {
    this.M_ClearForm();
    if (this.inputStatus == "edit") {
      this.GetDataBy();
    }
  }
};
</script>

<style>
    .isOn {
        /* width: 100%; */
        background-color: #333399;
        color: white;
        font-weight: bold;
        border-radius: 10px;
        text-align: center;
        height: 35px;
        padding-top: 2%;
        cursor: pointer;
    }
    .isOff {
        /* width: 100%; */
        background-color: rgb(153, 153, 153);
        color: black;
        font-weight: bold;
        border-radius: 10px;
        text-align: center;
        height: 35px;
        padding-top: 2%;
        cursor: pointer;
    }
</style>