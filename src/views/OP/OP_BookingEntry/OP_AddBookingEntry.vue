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
                    <b-col class="col-right">
                        <span>
                            <ABSButton
                                :text="'Confirm'"
                                classButton="button button--default"
                                classIcon="icon-style-1"
                                @click="doConfirm"
                            />
                        </span>
                        <span>
                            <ABSButton
                                :text="'Delete'"
                                classButton="button button--default"
                                classIcon="icon-style-1"
                                @click="doDelete"
                            />
                        </span>
                        <span>
                            <ABSButton
                                :text="'Edit'"
                                classButton="button button--default"
                                classIcon="icon-style-1"
                                @click="doEdit"
                            />
                        </span>
                    </b-col>
                </b-row>
                <b-row>
                    <b-col md="6">
                        <b-row class="row-bordered">
                            <b-col md="12">
                                <b-row>
                                    <b-col>
                                        <span style="font-size: 15px; color: #333399; font-weight: bold;"> Transaction Information </span>
                                    </b-col>
                                </b-row>
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
                                </b-row>
                                <b-row>
                                    <b-col>
                                        <span>
                                            <label>PIC</label>
                                        </span>
                                        <ACCDropDown
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
                                            <label>Pickup From</label>
                                        </span>
                                        <ACCDropDown
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
                                        <ACCDropDown
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
                                <b-row>
                                    <b-col>
                                        <span>
                                            <label>Description</label>
                                        </span>
                                        <ACCTextArea
                                            :prop = "PI_descs"
                                            v-model = "M_Order.descs"
                                            ref = "ref_descs"
                                        />
                                    </b-col>
                                </b-row>
                            </b-col>
                        </b-row>
                    </b-col>
                    <b-col md="6">
                        <b-row class="row-bordered">
                            <b-col md="12">
                                <b-row>
                                    <b-col>
                                        <span style="font-size: 15px; color: #333399; font-weight: bold;"> Truck Information </span>
                                    </b-col>
                                </b-row>
                                <b-row>
                                    <b-col>
                                        <div @click="OnTLChange('FTL')" :class="M_Order.TL == 'FTL' ? 'isOn' : 'isOff'">
                                            FTL
                                        </div>
                                    </b-col>
                                    <b-col>
                                        <div @click="OnTLChange('LTL')" :class="M_Order.TL == 'LTL' ? 'isOn' : 'isOff'">
                                            LTL
                                        </div>
                                    </b-col>
                                    <b-col>
                                        <div @click="OnTLChange('P')" :class="M_Order.TL == 'P' ? 'isOn' : 'isOff'">
                                            Project
                                        </div>
                                    </b-col>
                                </b-row>
                                <br />
                                <b-row v-show="M_Order.TL == 'LTL'">
                                    <b-col>
                                        <span>
                                            <label>Comodity</label>
                                        </span>
                                        <ACCDropDown
                                            @change="OncomodityChange"
                                            :prop="PI_comodity"
                                            v-model="M_Order.comodity"
                                            :label="M_Order.comodityLabel"
                                            :ref="'ref_comodity'"
                                        />
                                    </b-col>
                                </b-row>
                                <b-row v-show="M_Order.TL == 'LTL'">
                                    <b-col>
                                        <span>
                                            <label>Total Item</label>
                                        </span>
                                        <ACCTextBox
                                            :prop="PI_total_item"
                                            v-model="M_Order.total_item"
                                            ref="ref_total_item"
                                        />
                                    </b-col>
                                    <b-col>
                                        <span>
                                            <label>KGS</label>
                                        </span>
                                        <ACCTextBox
                                            :prop="PI_kgs"
                                            v-model="M_Order.kgs"
                                            ref="ref_kgs"
                                        />
                                    </b-col>
                                    <b-col>
                                        <span>
                                            <label>CBM</label>
                                        </span>
                                        <ACCTextBox
                                            :prop="PI_cbm"
                                            v-model="M_Order.cbm"
                                            ref="ref_cbm"
                                        />
                                    </b-col>
                                </b-row>

                                <b-row v-show="M_Order.TL == 'P'">
                                    <b-col>
                                        <span>
                                            <label>Contract No</label>
                                        </span>
                                        <ACCLookUp
                                            @change="Oncontract_noChange"
                                            :prop="PI_contract_no"
                                            v-model="M_Order.contract_no"
                                            :label="M_Order.contract_noLabel"
                                            :ref="'ref_contract_no'"
                                        />
                                    </b-col>
                                </b-row>

                                <b-row class="row-view" v-show="M_Order.TL == 'P'">
                                    <b-col>
                                        <span>
                                            <label>Description</label>
                                        </span>
                                        <br />
                                        <span style="color: #999999;">{{ M_Order.P_descs }}</span>
                                    </b-col>
                                </b-row>

                                <b-row class="row-view" v-show="M_Order.TL == 'P'">
                                    <b-col>
                                        <span>
                                            <label>Charge By</label>
                                        </span>
                                        <br />
                                        <span style="color: #999999;">{{ M_Order.charge_by }}</span>
                                    </b-col>
                                    <b-col>
                                        <span>
                                            <label>Contracted Volume</label>
                                        </span>
                                        <br />
                                        <span style="color: #999999;">{{ M_Order.contracted_volume }}</span>
                                    </b-col>
                                    <b-col>
                                        <span>
                                            <label>Executed Volume</label>
                                        </span>
                                        <br />
                                        <span style="color: #999999;">{{ M_Order.executed_volume }}</span>
                                    </b-col>
                                </b-row>

                                <b-row v-for="(data,index) in FTL" v-bind:key="index" v-show="M_Order.TL !== 'LTL'">
                                    <b-col>
                                        <span>
                                            <label>Truck</label>
                                        </span>
                                        <ACCDropDown
                                            @change="OntruckChange($event,index)"
                                            :prop="data.PI_truck"
                                            v-model="data.truck"
                                            :label="data.truckLabel"
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

                                <b-row v-show="M_Order.TL !== 'LTL'">
                                    <b-col>
                                        <div @click="AddTruck">
                                            +
                                            <span>
                                                <label>Add More Truck</label>
                                            </span>
                                        </div>
                                    </b-col>
                                </b-row>
                            </b-col>
                        </b-row>
                  </b-col>
                </b-row>
                <b-row style="margin-top: 10px;">
                    <b-col>
                        <ABSButton
                            :text="this.inputStatus == 'edit' ? 'Edit Booking Entry' : 'Save Booking Entry'"
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
        op_order_h_id: "",
        customer: "",
        customerLabel: "",
        pic: "",
        picLabel: "",
        order_ref_no: "",
        pickup_from: "",
        pickup_fromLabel: "",
        deliver_to: "",
        deliver_toLabel: "",
        date: "",
        TL: "FTL",
        total_item: "",
        kgs: "",
        cbm: "",
        comodity: "",
        comodityLabel: "",
        contract_no: "",
        contract_noLabel: "",
        descs: "",
        P_descs: "",
        charge_by: "",
        contracted_volume: "",
        executed_volume: "",
        lastupdatestamp: ""
      },
      PI_customer: {
        dataLookUp: {
          LookUpCd: "GetQuotationContact",
          ColumnDB: "cm_contact_id",
          InitialWhere: "",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "customer_name,address,phone_no"
        },
        cValidate: "required",
        cName: "customer",
        ckey: false,
        cOrder: 1,
        cProtect: false,
        cParentForm: "MK_AddQuotation",
        cStatic: false,
        cOption: [],
        cDisplayColumn: "customer_name",
        cInputStatus: this.inputStatus
      },
      PI_pic: {
        dataLookUp: {
          LookUpCd: "GetContactPerson",
          ColumnDB: "contact_person_id",
          InitialWhere: "cm_contact_id=0",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "name"
        },
        cValidate: "required",
        cName: "pic",
        ckey: false,
        cOrder: 2,
        cProtect: false,
        cParentForm: "MK_AddQuotation",
        cStatic: false,
        cOption: [],
        cDisplayColumn: "name",
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
      PI_pickup_from: {
        dataLookUp: {
          LookUpCd: "GetQuotationFrAddress",
          ColumnDB: "fr_cm_contact_delivery_address_id",
          InitialWhere: "ss_portfolio_id='" + this.getDataUser().portfolio_id + "' AND cm_contact_id=0 AND category='F'",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "from_address"
        },
        cValidate: "required",
        cName: "pickup_from",
        ckey: false,
        cOrder: 4,
        cProtect: false,
        cParentForm: "MK_AddQuotation",
        cStatic: false,
        cOption: [],
        cDisplayColumn: "from_address",
        cInputStatus: this.inputStatus
      },
      PI_deliver_to: {
        dataLookUp: {
          LookUpCd: "GetQuotationToAddress",
          ColumnDB: "to_cm_contact_delivery_address_id",
          InitialWhere: "ss_portfolio_id='" + this.getDataUser().portfolio_id + "' AND cm_contact_id=0 AND category='F' AND fr_cm_contact_delivery_address_id=0",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "to_address"
        },
        cValidate: "required",
        cName: "deliver_to",
        ckey: false,
        cOrder: 5,
        cProtect: false,
        cParentForm: "MK_AddQuotation",
        cStatic: false,
        cOption: [],
        cDisplayColumn: "to_address",
        cInputStatus: this.inputStatus
      },
      PI_date: {
        cValidate: "",
        cName: "date",
        cOrder: 6,
        cKey: false,
        cProtect: false,
        cWithTime: true,
        cFormat: "dd/MM/yyyy",
        cParentForm: "MK_AddQuotation",
        cInputStatus: this.inputStatus
      },
      PI_descs: {
        cValidate: '',
        cName: "descs",
        cOrder: 7,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "MK_AddQuotation",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_comodity: {
        dataLookUp: {
            LookUpCd:'GetQuotationCommodity',
            ColumnDB:'cm_commodity_id',
            InitialWhere:"ss_portfolio_id='" + this.getDataUser().portfolio_id + "' AND cm_contact_id=0 AND category='L'",
            ParamWhere:'',
            OrderBy:'',
            ParamView:'',
            SourceField:'',
            DisplayLookUp:'comodity_cd'
        },
        cValidate: "",
        cName: "comodity",
        ckey: false,
        cOrder: 8,
        cProtect: false,
        cParentForm: "MK_AddQuotation",
        cStatic: false,
        cOption: [],
        cDisplayColumn: "comodity_cd",
        cInputStatus: this.inputStatus
    },
    PI_total_item: {
        cValidate: "",
        cName: "total_item",
        cOrder: 9,
        cKey: false,
        cType: "numeric",
        cProtect: false,
        cParentForm: "MK_AddQuotation",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_kgs: {
        cValidate: "",
        cName: "kgs",
        cOrder: 10,
        cKey: false,
        cType: "numeric",
        cProtect: false,
        cParentForm: "MK_AddQuotation",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_cbm: {
        cValidate: "",
        cName: "cbm",
        cOrder: 11,
        cKey: false,
        cType: "numeric",
        cProtect: false,
        cParentForm: "MK_AddQuotation",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_contract_no: {
        dataLookUp: {
            LookUpCd:'GetQuotationContractNo',
            ColumnDB:'quotation_no',
            InitialWhere: "ss_portfolio_id='" + this.getDataUser().portfolio_id + "' AND cm_contact_id=0 AND category='P'",
            ParamWhere:'',
            OrderBy:'',
            ParamView:'',
            SourceField:'',
            DisplayLookUp:'vehicle_type,descs'
        },
        cValidate: "",
        cName: "contract_no",
        ckey: false,
        cOrder: 12,
        cProtect: false,
        cParentForm: "MK_AddQuotation",
        cStatic: false,
        cOption: [],
        cDisplayColumn: "vehicle_type,descs",
        cInputStatus: this.inputStatus
    },
      FTL : [
          {
            op_order_d_id: "",
            PI_truck: {
                dataLookUp: {
                    LookUpCd:'GetQuotationFleetType',
                    ColumnDB:'fm_fleet_type_id',
                    InitialWhere:"ss_portfolio_id='" + this.getDataUser().portfolio_id + "' AND cm_contact_id=0 AND category='F'",
                    ParamWhere:'',
                    OrderBy:'',
                    ParamView:'',
                    SourceField:'',
                    DisplayLookUp:'fleet_cd'
                },
                cValidate: "",
                cName: "truck",
                ckey: false,
                cOrder: 19,
                cProtect: false,
                cParentForm: "MK_AddQuotation",
                cStatic: false,
                cOption: [],
                cDisplayColumn: "fleet_cd",
                cInputStatus: this.inputStatus
            },
            truck: "",
            truckLabel: "",
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
            qtyLabel: "",
            lastupdatestamp: ""
          }
      ]
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
    doConfirm() {
    },
    doDelete() {
    },
    doEdit() {
    },
    OncustomerChange(data) {
        console.log(data)
      this.$nextTick(() => {
        this.M_Order.customer = data.id;
        this.M_Order.customerLabel = data.customer_name;
        this.PI_pic.dataLookUp.InitialWhere = "cm_contact_id=" + data.id
        this.PI_pickup_from.dataLookUp.InitialWhere = "ss_portfolio_id='" + this.getDataUser().portfolio_id + "' AND cm_contact_id=" + data.id + " AND category=" + (this.M_Order.TL == "FTL" ? "'F'" : (this.M_Order.TL == "LTL" ? "'L'" : "'P'"))
        this.PI_comodity.dataLookUp.InitialWhere = "ss_portfolio_id='" + this.getDataUser().portfolio_id + "' AND cm_contact_id=" + data.id + " AND category='L'"
        this.PI_contract_no.dataLookUp.InitialWhere = "ss_portfolio_id='" + this.getDataUser().portfolio_id + "' AND cm_contact_id=" + data.id + " AND category='P'"
        for (let i = 0; i < this.FTL.length; i++) {
            this.FTL[i].PI_truck.dataLookUp.InitialWhere = "ss_portfolio_id='" + this.getDataUser().portfolio_id + "' AND cm_contact_id=" + data.id + " AND category=" + (this.M_Order.TL == "FTL" ? "'F'" : (this.M_Order.TL == "LTL" ? "'L'" : "'P'"))
        }
      });
    },
    OnpicChange(data) {
        console.log(data)
      this.$nextTick(() => {
        this.M_Order.pic = data.id;
        this.M_Order.picLabel = data.name;
      });
    },
    Onpickup_fromChange(data) {
        console.log(data)
        this.$nextTick(() => {
            this.M_Order.pickup_from = data.id;
            this.M_Order.pickup_fromLabel = data.label;
            this.PI_deliver_to.dataLookUp.InitialWhere = "ss_portfolio_id='" + this.getDataUser().portfolio_id + "' AND cm_contact_id=" + (this.M_Order.customer && this.M_Order.customer !== '' ? this.M_Order.customer : 0) + " AND category=" + (this.M_Order.TL == "FTL" ? "'F'" : (this.M_Order.TL == "LTL" ? "'L'" : "'P'")) + " AND fr_cm_contact_delivery_address_id='" + data.id + "'"
        });
    },
    Ondeliver_toChange(data) {
        console.log(data)
        this.$nextTick(() => {
            this.M_Order.deliver_to = data.id;
            this.M_Order.deliver_toLabel = data.label;
        });
    },
    OndateChange(data) {},
    OnTLChange(data) {
        this.M_Order.TL = data
        this.M_Order.pickup_from = ""
        this.M_Order.pickup_fromLabel = ""
        this.M_Order.deliver_to = ""
        this.M_Order.deliver_toLabel = ""

        this.PI_pickup_from.dataLookUp.InitialWhere = "ss_portfolio_id='" + this.getDataUser().portfolio_id + "' AND cm_contact_id=" + this.M_Order.customer + " AND category=" + (data == "FTL" ? "'F'" : (data == "LTL" ? "'L'" : "'P'"))
        this.PI_comodity.dataLookUp.InitialWhere = "ss_portfolio_id='" + this.getDataUser().portfolio_id + "' AND cm_contact_id=" + this.M_Order.customer + " AND category='L'"
        this.PI_deliver_to.dataLookUp.InitialWhere = "ss_portfolio_id='" + this.getDataUser().portfolio_id + "' AND cm_contact_id=" + (this.M_Order.customer && this.M_Order.customer !== '' ? this.M_Order.customer : 0) + " AND category=" + (data == "FTL" ? "'F'" : (data == "LTL" ? "'L'" : "'P'")) + " AND fr_cm_contact_delivery_address_id=0"
        var w = ""
        if (data == 'P') {
            w = "ss_portfolio_id='" + this.getDataUser().portfolio_id + "'"
        }
        else {
            w = "ss_portfolio_id='" + this.getDataUser().portfolio_id + "' AND cm_contact_id=" + (this.M_Order.customer && this.M_Order.customer !== '' ? this.M_Order.customer : 0) + " AND category=" + (data == "FTL" ? "'F'" : (data == "LTL" ? "'L'" : "'P'"))
        }
        this.FTL = [
            {
                PI_truck: {
                    dataLookUp: {
                        LookUpCd:'GetQuotationFleetType',
                        ColumnDB:'fm_fleet_type_id',
                        InitialWhere:w,
                        ParamWhere:'',
                        OrderBy:'',
                        ParamView:'',
                        SourceField:'',
                        DisplayLookUp:'fleet_cd'
                    },
                    cValidate: "",
                    cName: "truck",
                    ckey: false,
                    cOrder: 19,
                    cProtect: false,
                    cParentForm: "MK_AddQuotation",
                    cStatic: false,
                    cOption: [],
                    cDisplayColumn: "fleet_cd",
                    cInputStatus: this.inputStatus
                },
                truck: "",
                truckLabel: "",
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
        ]

        this.M_Order.kgs = ""
        this.M_Order.cbm = ""

        this.M_Order.contract_no = ""
        this.M_Order.contract_noLabel = ""
        this.M_Order.P_descs = ""
        this.M_Order.charge_by = ""
        this.M_Order.contracted_volume = ""
        this.M_Order.executed_volume = ""
    },
    OntruckChange(data, index) {
        console.log(data, index)
        this.$nextTick(() => {
            this.FTL[index].truck = data.id;
            this.FTL[index].truckLabel = data.label;
        });
    },
    OnqtyChange(data, index) {
        console.log(data, index)
        this.$nextTick(() => {
            this.FTL[index].qty = data.id;
            this.FTL[index].qtyLabel = data.label;
        });
    },
    OncomodityChange(data) {
        console.log(data)
        this.$nextTick(() => {
            this.M_Order.comodity = data.cm_commodity_id;
            this.M_Order.comodityLabel = data.label;
        });
    },
    Oncontract_noChange(data) {
        console.log(data)
        this.$nextTick(() => {
            this.M_Order.contract_no = data.quotation_no;
            this.M_Order.contract_noLabel = data.quotation_no;
            this.M_Order.P_descs = data.descs;
            this.M_Order.mk_quotation_id = data.mk_quotation_id;
            this.M_Order.charge_by = data.charge_by;
            this.M_Order.contracted_volume = this.isCurrency(data.contracted_volume, this.decimal);
            this.M_Order.executed_volume = this.isCurrency(data.executed_volume, this.decimal);
        });
    },
    M_ClearForm() {
      this.M_Order = {
        op_order_h_id: "",
        customer: "",
        customerLabel: "",
        pic: "",
        picLabel: "",
        order_ref_no: "",
        pickup_from: "",
        pickup_fromLabel: "",
        deliver_to: "",
        deliver_toLabel: "",
        date: "",
        TL: "FTL",
        total_item: "",
        weight: "",
        cubic: "",
        comodity: "",
        comodityLabel: "",
        contract_no: "",
        contract_noLabel: "",
        descs: "",
        P_descs: "",
        charge_by: "",
        contracted_volume: "",
        executed_volume: "",
        lastupdatestamp: ""
      };

      var rand = Math.floor(Math.random() * 100);

      this.FTL = [
          {
            op_order_d_id: "",
            PI_truck: {
                dataLookUp: {
                    LookUpCd:'GetQuotationFleetType',
                    ColumnDB:'fm_fleet_type_id',
                    InitialWhere:"ss_portfolio_id='" + this.getDataUser().portfolio_id + "' AND cm_contact_id=" + (this.M_Order.customer && this.M_Order.customer !== '' ? this.M_Order.customer : 0) + " AND category=" + (this.M_Order.TL == "FTL" ? "'F'" : (this.M_Order.TL == "LTL" ? "'L'" : "'P'")),
                    ParamWhere:'',
                    OrderBy:'',
                    ParamView:'',
                    SourceField:'',
                    DisplayLookUp:'fleet_cd'
                },
                cValidate: "",
                cName: "truck",
                ckey: false,
                cOrder: 19,
                cProtect: false,
                cParentForm: "MK_AddQuotation",
                cStatic: false,
                cOption: [],
                cDisplayColumn: "fleet_cd",
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
            qtyLabel: "",
            lastupdatestamp: ""
          }
      ]
    },
    AddTruck() {
        var rand = Math.floor(Math.random() * 100);
        var w = ""
        if (this.M_Order.TL == 'P') {
            w = "ss_portfolio_id='" + this.getDataUser().portfolio_id + "'"
        }
        else {
            w = "ss_portfolio_id='" + this.getDataUser().portfolio_id + "' AND cm_contact_id=" + (this.M_Order.customer && this.M_Order.customer !== '' ? this.M_Order.customer : 0) + " AND category=" + (this.M_Order.TL == "FTL" ? "'F'" : (this.M_Order.TL == "LTL" ? "'L'" : "'P'"))
        }
        this.FTL.push({
            op_order_d_id: "",
            PI_truck: {
                dataLookUp: {
                    LookUpCd:'GetQuotationFleetType',
                    ColumnDB:'fm_fleet_type_id',
                    InitialWhere:w,
                    ParamWhere:'',
                    OrderBy:'',
                    ParamView:'',
                    SourceField:'',
                    DisplayLookUp:'fleet_cd'
                },
                cValidate: "",
                cName: "truck",
                ckey: false,
                cOrder: 19,
                cProtect: false,
                cParentForm: "MK_AddQuotation",
                cStatic: false,
                cOption: [],
                cDisplayColumn: "fleet_cd",
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
            qtyLabel: "",
            lastupdatestamp: ""
        })
    },
    doSave() {
      this.$validator._base.validateAll("MK_AddQuotation").then(result => {
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
          ress => {
            if (ress.value) {
              this.$validator.errors.clear("MK_AddQuotation");
              if (this.inputStatus == "edit") {
                this.M_Update();
              } else {
                this.M_Save();
              }
            }
          }
        );
      });
    },
    M_Save() {
        var paramH = {
            _Method_: "SAVE",
            _LineNo_: 0,
            ss_portfolio_id: this.getDataUser().portfolio_id,
            ss_subportfolio_id: this.getDataUser().subportfolio_id,
            booking_date: this.getToday(),
            booking_source: "I",
            booking_status: "P",
            category: this.M_Order.TL == "FTL" ? "F" : (this.M_Order.TL == "LTL" ? "L" : "P"),
            cm_contact_id: this.M_Order.customer,
            cm_contact_person_id: this.M_Order.pic,
            ref_no: this.M_Order.order_ref_no,
            fr_cm_contact_delivery_address_id: this.M_Order.pickup_from,
            to_cm_contact_delivery_address_id: this.M_Order.deliver_to,
            pickup_date: this.M_Order.date,
            descs: this.M_Order.descs,
            cm_commodity_id: this.M_Order.comodity,
            total_item: this.M_Order.total_item,
            total_kgs: this.M_Order.TL == 'LTL' ? (this.M_Order.kgs && this.M_Order.kgs !== '' ? this.M_Order.kgs : 0) : "NULL",
            total_cbm: this.M_Order.TL == 'LTL' ? (this.M_Order.cbm && this.M_Order.cbm !== '' ? this.M_Order.cbm : 0) : "NULL",
            mk_quotation_id: this.M_Order.TL == 'P' ? this.M_Order.contract_no : "NULL",
            contract_no: this.M_Order.TL == 'P' ? this.M_Order.contract_no : "NULL",
            contract_descs: this.M_Order.TL == 'P' ? this.M_Order.P_descs : "NULL",
            contract_volume: this.M_Order.TL == 'P' ? (this.M_Order.contracted_volume && this.M_Order.contracted_volume !== '' ? this.M_Order.contracted_volume : 0) : "NULL",
            contract_executed_volume: this.M_Order.TL == 'P' ? (this.M_Order.executed_volume && this.M_Order.executed_volume !== '' ? this.M_Order.executed_volume : 0) : "NULL",
            user_input: this.getDataUser().user_id,
        };

        var paramD = []
        if(this.M_Order.TL == 'FTL' || this.M_Order.TL == 'P') {
            this.FTL.forEach((value) => {
                paramD.push({
                    _Method_: "SAVE",
                    _LineNo_: 1,
                    op_order_h_id: "A_Insert.row_id_output",
                    descs: value.truck,
                    qty: value.qty,
                    user_input: this.getDataUser().user_id
                })
            })
        }

        var params = {
            option_url: "/OP/OP_BookingEntry",
            line_no: 0,
            Data: [{
                A_Insert: paramH,
                B_Looping: paramD
            }]
        }

        this.postJSONMulti(this.getUrlProsesDataPostMulti(), params).then(response => {
            // console.log(response)
            if (response == null) return;
                this.alertSuccess("Save Data Has Been Successfully").then(() => {
                this.doBack();
            });
        });
    },
    M_Update() {
        var paramH = {
            _Method_: "UPDATE",
            _LineNo_: 0,
            op_order_h_id: this.M_Order.op_order_h_id,
            ss_portfolio_id: this.getDataUser().portfolio_id,
            ss_subportfolio_id: this.getDataUser().subportfolio_id,
            order_no: this.M_Order.order_no,
            order_status: 'N',
            cm_contact_id: this.M_Order.customer,
            cm_contact_person_id: this.M_Order.pic,
            ref_no: this.M_Order.order_ref_no,
            booking_category: this.M_Order.booking_category,
            contract_no: this.M_Order.booking_category == 'P' ? this.M_Order.contract_no : "NULL",
            base_type: this.M_Order.with_base,
            base_total: this.M_Order.booking_category == 'P' ? (this.M_Order.with_base == 'V' ? this.M_Order.v_volume : this.M_Order.t_volume) : "NULL",
            base_pickup: this.M_Order.booking_category == 'P' ? (this.M_Order.with_base == 'V' ? this.M_Order.v_pickup : this.M_Order.t_pickup) : "NULL",
            base_rest_of: this.M_Order.booking_category == 'P' ? (this.M_Order.with_base == 'V' ? this.M_Order.v_rest_of : this.M_Order.t_rest_of) : "NULL",
            pickup_from_id: this.M_Order.pickup_from,
            deliver_to_id: this.M_Order.deliver_to,
            pickup_date: this.M_Order.date,
            extra_pickup_id: this.M_Order.extra_pickup && this.M_Order.extra_pickup !== '' ? this.M_Order.extra_pickup : "NULL",
            extra_deliver_id: this.M_Order.extra_deliver && this.M_Order.extra_deliver !== '' ? this.M_Order.extra_deliver : "NULL",
            truck_type: this.M_Order.TL,
            weight: this.M_Order.TL == 'LTL' ? (this.M_Order.kgs && this.M_Order.kgs !== '' ? this.M_Order.kgs : 0) : "NULL",
            cubic: this.M_Order.TL == 'LTL' ? (this.M_Order.cbm && this.M_Order.cbm !== '' ? this.M_Order.cbm : 0) : "NULL",
            lastupdatestamp: this.paramFromList.lastupdatestamp,
            user_edit: this.getDataUser().user_id,
        };

        var paramD = []
        if(this.M_Order.TL == 'FTL') {
            this.FTL.forEach((value) => {
                paramD.push({
                    _Method_: "UPDATE",
                    _LineNo_: 1,
                    op_order_d_id: value.op_order_d_id,
                    op_order_h_id: this.M_Order.op_order_h_id,
                    descs: value.truck,
                    qty: value.qty,
                    user_edit: this.getDataUser().user_id,
                    lastupdatestamp: value.lastupdatestamp
                })
            })
        }

        var params = {
            option_url: "/OP/OP_BookingEntry",
            line_no: 0,
            Data: [{
                A_Update: paramH,
                B_Looping: paramD
            }]
        }

        this.postJSONMulti(this.getUrlProsesDataPostMulti(), params).then(response => {
            // console.log(response)
            if (response == null) return;
                this.alertSuccess("Update Data Has Been Successfully").then(() => {
                this.doBack();
            });
        });
    },
    GetDataBy() {
        var param = {
            option_url: "/OP/OP_BookingEntry",
            line_no: 0,
            id: this.paramFromList.row_id,
            lastupdatestamp: this.paramFromList.lastupdatestamp
        };

        this.getJSON(this.getUrlCRUD(), param).then(response => {
            // response from API
            if (response == null) return;

            var data = response.Data[0];
            
            if (data.cm_contact_id && data.cm_contact_id !== '') {
                this.PI_pic.dataLookUp.InitialWhere = " cm_contact_id = " + data.cm_contact_id
            }

            this.M_Order = {
                op_order_h_id: data.op_order_h_id,
                customer: data.cm_contact_id,
                customerLabel: data.contact_name,
                order_no: data.order_no,
                pic: data.cm_contact_person_id,
                picLabel: data.contact_person_name,
                order_ref_no: data.ref_no,
                booking_category: data.booking_category,
                contract_no: data.contract_no,
                with_base: data.base_type,
                v_volume: data.base_type == "T" ? "NULL" : data.base_total,
                v_pickup: data.base_type == "T" ? "NULL" : data.base_pickup,
                v_rest_of: data.base_type == "T" ? "NULL" : data.base_rest_of,
                t_volume: data.base_type == "V" ? "NULL" : data.base_total,
                t_pickup: data.base_type == "V" ? "NULL" : data.base_pickup,
                t_rest_of: data.base_type == "V" ? "NULL" : data.base_rest_of,
                pickup_from: data.pickup_from_id,
                pickup_fromLabel: data.location_pickup,
                deliver_to: data.deliver_to_id,
                deliver_toLabel: data.location_deliver,
                date: data.pickup_date,
                TL: data.truck_type,
                weight: data.kgs,
                cubic: data.cbm,
                extra_pickup: data.extra_pickup_id,
                extra_pickupLabel: data.location_extra_pickup,
                extra_deliver: data.extra_deliver_id,
                extra_deliverLabel: data.location_extra_deliver,
                lastupdatestamp: data.lastupdatestamp
            }

            if (data.truck_type == "FTL" || data.truck_type == "Project") {
                this.FTL = []
                var w = ""
                if (data.truck_type == 'Project') {
                    w = "ss_portfolio_id='" + this.getDataUser().portfolio_id + "'"
                }
                else {
                    w = "ss_portfolio_id='" + this.getDataUser().portfolio_id + "' AND cm_contact_id=" + (this.M_Order.customer && this.M_Order.customer !== '' ? this.M_Order.customer : 0) + " AND category=" + (data == "FTL" ? "'F'" : (data == "LTL" ? "'L'" : "'P'"))
                }
                response.Data.forEach((value) => {
                    var rand = Math.floor(Math.random() * 100);
                    this.$nextTick(() => {
                        this.FTL.push({
                            op_order_d_id: value.op_order_d_id,
                            PI_truck: {
                                dataLookUp: {
                                LookUpCd:'GetQuotationFleetType',
                                ColumnDB:'fm_fleet_type_id',
                                InitialWhere:w,
                                ParamWhere:'',
                                OrderBy:'',
                                ParamView:'',
                                SourceField:'',
                                DisplayLookUp:'fleet_cd'
                            },
                            cValidate: "",
                            cName: "truck",
                            ckey: false,
                            cOrder: 19,
                            cProtect: false,
                            cParentForm: "MK_AddQuotation",
                            cStatic: false,
                            cOption: [],
                            cDisplayColumn: "fleet_cd",
                            cInputStatus: this.inputStatus
                            },
                            truck: value.ftl_truck,
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
                            qty: value.ftl_qty.toString(),
                            qtyLabel: value.ftl_qty.toString(),
                            lastupdatestamp: value.lastupdatestamp_d
                        })
                    })
                    this.$forceUpdate();
                })
            }
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