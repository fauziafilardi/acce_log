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
                            <li style="width: 10% !important;">
                              <span>Assign</span>
                              <br />
                              <span>{{''}}</span>
                            </li>
                            <li style="width: 10% !important;">
                              <span>Dispatch</span>
                              <br />
                              <span>{{''}}</span>
                            </li>
                            <li style="width: 10% !important;">
                              <span>Arrived</span>
                              <br />
                              <span>{{''}}</span>
                            </li>
                            <li style="width: 10% !important;">
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
                            <!-- Internal -->
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
                                    <span>
                                      <label>Assign Fleet</label>
                                    </span>
                                    <ACCDropDown
                                      @change="Onassign_typeChange"
                                      :prop="PI_Dropassign_type"
                                      v-model="M_PlanExe.assign_type_i"
                                      :label="M_PlanExe.assign_typeLabel_i"
                                      ref="ref_assign_type"
                                    />
                                  </b-col>
                                </b-row>
                                <b-row>
                                  <b-col>
                                    <span>
                                      <label>Driver</label>
                                    </span>
                                    <ACCDropDown
                                      @change="Ondriver_idChange"
                                      :prop="PI_driver_id"
                                      v-model="M_PlanExe.driver_id_i"
                                      :label="M_PlanExe.driver_name_i"
                                      ref="ref_driver_id"
                                    />
                                  </b-col>
                                  <b-col>
                                    <span>
                                      <label>Co Driver</label>
                                    </span>
                                    <ACCDropDown
                                      @change="Onco_driver_idChange"
                                      :prop="PI_co_driver_id"
                                      v-model="M_PlanExe.co_driver_id_i"
                                      :label="M_PlanExe.co_driver_name_i"
                                      ref="ref_co_driver_id"
                                    />
                                  </b-col>
                                </b-row>
                                <b-row>
                                  <b-col>
                                    <span>
                                      <label>Notes</label>
                                    </span>
                                    <ACCTextArea
                                      :prop="PI_notes"
                                      v-model="M_PlanExe.notes_i"
                                      ref="ref_notes"
                                    />
                                  </b-col>
                                </b-row>
                              </b-col>
                            </b-row>
                          </b-col>
                          <b-col md="6" style="padding-left: 0px !important;">
                            <!-- external -->
                            <b-row class="row-bordered">
                              <b-col>
                                <b-row>
                                  <b-col>
                                    <ACCRadioButton
                                      @input="Onassign_fleet_statusChange"
                                      :prop="PI_fleet_status_e"
                                      v-model="M_PlanExe.assign_fleet_status"
                                      ref="ref_assign_fleet_status"
                                    />
                                  </b-col>
                                </b-row>
                                <b-row>
                                  <b-col>
                                    <span>
                                      <label>Vendor</label>
                                    </span>
                                    <ACCDropDown
                                      @change="OnvendorChange"
                                      :prop="PI_Dropvendor"
                                      v-model="M_PlanExe.vendor"
                                      :label="M_PlanExe.vendorLabel"
                                      ref="ref_vendor"
                                    />
                                  </b-col>
                                </b-row>
                                <b-row>
                                  <b-col>
                                    <span>
                                      <label>Assign Fleet</label>
                                    </span>
                                    <ACCTextBox
                                      :prop="PI_assign_type_t"
                                      v-model="M_PlanExe.assign_type_e"
                                      ref="ref_assign_type_t"
                                    />
                                  </b-col>
                                </b-row>
                                <b-row>
                                  <b-col>
                                    <span>
                                      <label>Driver</label>
                                    </span>
                                    <ACCTextBox
                                      :prop="PI_driver_name_e"
                                      v-model="M_PlanExe.driver_name_e"
                                      ref="ref_driver_name"
                                    />
                                  </b-col>
                                  <b-col>
                                    <span>
                                      <label>Co Driver</label>
                                    </span>
                                    <ACCTextBox
                                      :prop="PI_co_driver_name_e"
                                      v-model="M_PlanExe.co_driver_name_e"
                                      ref="ref_co_driver_name"
                                    />
                                  </b-col>
                                </b-row>
                                <b-row>
                                  <b-col>
                                    <span>
                                      <label>Notes</label>
                                    </span>
                                    <ACCTextArea
                                      :prop="PI_notes2"
                                      v-model="M_PlanExe.notes_e"
                                      ref="ref_notes"
                                    />
                                  </b-col>
                                </b-row>
                              </b-col>
                            </b-row>
                          </b-col>
                        </b-row>
                        <b-row style="margin-top: 10px;">
                          <b-col md="6" offset="2" style="padding-left: 0px !important;">
                            <ABSButton
                              :text="'Assign Truck'"
                              classButton="btn btn--default"
                              classIcon="icon-style-default"
                              @click="doSave"
                              styleButton="height: 40px;width: 100%;"
                            />
                          </b-col>
                        </b-row>
                        <b-row class="row-bordered" style="margin-top: 10px;">
                          <b-col md="12">
                            <b-row>
                              <b-col md="3">
                                <span
                                  style="font-size: 15px; color: rgb(51, 51, 153); font-weight: bold;"
                                >Extra Pick/Drop</span>
                              </b-col>
                            </b-row>
                            <b-row>
                              <b-col>
                                <ACCFormList
                                  :prop="{}"
                                  :title="''"
                                  cStatic
                                  :cHeader="PlanPickDrop_H"
                                  :cData="PlanPickDrop_D"
                                  @rowClicked="CostingClick"
                                  ref="ref_SL_Plan_Costing"
                                  WithDeleteButton
                                  @buttonDeleteClicked="doDeleteCosting"
                                >
                                  <!-- <template slot="ticket_date" slot-scope="data">
                                    <span>{{momentDateFormatting(data.item.ticket_date, "YYYY-MM-DD HH:mm")}}</span>
                                  </template>-->
                                </ACCFormList>
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
                                >Costing</span>
                              </b-col>
                              <b-col>
                                <font-awesome-icon
                                  icon="exclamation-circle"
                                  class="icon-style-default"
                                  style="margin-right: 5px; color: red;"
                                />
                                <span
                                  style="font-size: 12px; color: red; font-weight: bold;"
                                >Costing over budget, need approval</span>
                              </b-col>
                            </b-row>
                            <b-row>
                              <b-col>
                                <ACCFormList
                                  :prop="{}"
                                  :title="''"
                                  cStatic
                                  :cHeader="PlanCosting_H"
                                  :cData="PlanCosting_D"
                                  @rowClicked="CostingClick"
                                  ref="ref_SL_Plan_Costing"
                                  WithDeleteButton
                                  @buttonDeleteClicked="doDeleteCosting"
                                >
                                  <!-- <template slot="ticket_date" slot-scope="data">
                                    <span>{{momentDateFormatting(data.item.ticket_date, "YYYY-MM-DD HH:mm")}}</span>
                                  </template>-->
                                </ACCFormList>
                              </b-col>
                            </b-row>
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

      PlanExTable: [],
      M_PlanExe: {
        arrive_date: "",
        note: "",
        assign_fleet_status: "",
        assign_type_i: "",
        assign_typeLabel_i: "",
        assign_type_e: "",
        assign_typeLabel_e: "",
        driver_id_i: null,
        driver_name_i: null,
        driver_id_e: null,
        driver_name_e: null,
        co_driver_id_i: null,
        co_driver_name_i: null,
        co_driver_id_e: null,
        co_driver_name_e: null,
        notes_i: "",
        notes_e: "",
        vendor_id: null,
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
      PI_Dropvendor: {
        dataLookUp: {
          LookUpCd: "GetVendor",
          ColumnDB: "contact_id",
          InitialWhere:
            "ss_portfolio_id='" + this.getDataUser().portfolio_id + "'",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "",
        },
        cValidate: "",
        cName: "vendor",
        cOrder: 1,
        cKey: false,
        cStatic: false,
        cProtect: false,
        cParentForm: "OP_NW_PlanExecution",
        cOption: [],
        cDisplayColumn: "maintenance_type",
        cInputStatus: this.inputStatus,
      },
      PI_Dropassign_type: {
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
        cName: "assign_type",
        cOrder: 1,
        cKey: false,
        cStatic: false,
        cProtect: false,
        cParentForm: "OP_NW_PlanExecution",
        cOption: [],
        cDisplayColumn: "maintenance_type",
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
      PI_notes: {
        cValidate: "",
        cName: "note",
        cOrder: 3,
        cKey: false,
        cProtect: false,
        cResize: false,
        cReadonly: false,
        cRows: 7,
        cMaxRows: 7,
        cSize: "md",
        cParentForm: "OP_NW_PlanExecution",
        cInputStatus: this.inputStatus,
      },
      PI_notes2: {
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
      PI_assign_type_t: {
        cValidate: "",
        cName: "assign_type",
        cOrder: 2,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "OP_NW_PlanExecution",
        cDecimal: 2,
        cInputStatus: this.inputStatus,
      },
      PI_driver_name: {
        cValidate: "",
        cName: "driver_name",
        cOrder: 3,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "OP_NW_PlanExecution",
        cDecimal: 2,
        cInputStatus: this.inputStatus,
      },
      PI_co_driver_name: {
        cValidate: "",
        cName: "co_driver_name",
        cOrder: 3,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "OP_NW_PlanExecution",
        cDecimal: 2,
        cInputStatus: this.inputStatus,
      },
      PI_driver_id: {
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
        cName: "fm_driver_id",
        cOrder: 14,
        cKey: false,
        cStatic: false,
        cProtect: false,
        cParentForm: "OP_FormFmFleetMstr",
        cOption: [],
        cDisplayColumn: "full_name",
        cInputStatus: this.inputStatus,
      },
      PI_co_driver_id: {
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
        cName: "fm_driver_id",
        cOrder: 14,
        cKey: false,
        cStatic: false,
        cProtect: false,
        cParentForm: "OP_FormFmFleetMstr",
        cOption: [],
        cDisplayColumn: "full_name",
        cInputStatus: this.inputStatus,
      },
      PlanPickDrop_H: [
        {
          key: "no",
          label: "No",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 th-cus-center",
        },
        {
          key: "location",
          label: "Location",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
        {
          key: "address",
          label: "Address",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
        {
          key: "category",
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
          key: "row_id", //untuk button delete
          label: "",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 th-cus-center",
        },
      ],
      PlanPickDrop_D: [],
      PlanCosting_H: [
        {
          key: "no",
          label: "No",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 th-cus-center",
        },
        {
          key: "cost_type",
          label: "Cost Type",
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
          key: "value",
          label: "Value",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
        {
          key: "status",
          label: "Status",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
        {
          key: "row_id", //untuk button delete
          label: "",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 th-cus-center",
        },
      ],
      PlanCosting_D: [],
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
    doDeleteCosting(record, index) {},
    Onassign_fleet_statusChange(data) {
      console.log(data);
      if (data == "I") {
        this.PI_Dropvendor.cProtect = true;
        this.PI_assign_type_t.cProtect = true;
        this.PI_driver_name.cProtect = true;
        this.PI_co_driver_name.cProtect = true;
        this.PI_notes2.cProtect = true;

        this.PI_Dropassign_type.cProtect = false;
        this.PI_driver_id.cProtect = false;
        this.PI_co_driver_id.cProtect = false;
        this.PI_notes.cProtect = false;
      } else {
        this.PI_Dropvendor.cProtect = false;
        this.PI_assign_type_t.cProtect = false;
        this.PI_driver_name.cProtect = false;
        this.PI_co_driver_name.cProtect = false;
        this.PI_notes2.cProtect = false;

        this.PI_Dropassign_type.cProtect = true;
        this.PI_driver_id.cProtect = true;
        this.PI_co_driver_id.cProtect = true;
        this.PI_notes.cProtect = true;
      }
    },
    Onassign_typeChange(data) {
      this.$nextTick(() => {
        this.M_PlanExe.assign_type_i = data.id;
        this.M_PlanExe.assign_typeLabel_i = data.label;
      });
    },
    Ondriver_idChange(data) {
      this.$nextTick(() => {
        this.M_PlanExe.driver_id_i = data.id;
        this.M_PlanExe.driver_name_i = data.label;
      });
    },
    Onco_driver_idChange(data) {
      this.$nextTick(() => {
        this.M_PlanExe.co_driver_id_i = data.id;
        this.M_PlanExe.co_driver_name_i = data.label;
      });
    },
    doSave() {},
    doCreateTicket() {},
    doAddNew() {},
    doBack() {
      this.$router.go(-1);
    },
    doCosting() {
      var param = this.M_GetDataBy;
      param.isEdit = false;

      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "OP_PlanExecutionCosting" });
    },
    doPick() {
      var param = this.paramFromList;
      param.isEdit = false;
      param.isPick = true;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "OP_PlanExecutionPick" });
    },
    doDrop() {
      var param = this.paramFromList;
      param.isEdit = false;
      param.isPick = false;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "OP_PlanExecutionDrop" });
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
        this.PI_Dropassign_type.dataLookUp.InitialWhere =
          "ss_portfolio_id='" +
          this.getDataUser().portfolio_id +
          "' AND vehicle_type='" +
          this.M_GetDataBy.vehicle_type_cd +
          "'";
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
