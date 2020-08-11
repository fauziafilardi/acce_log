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
              <b-form :data-vv-scope="'OP_SL_PlanExecution'" :data-vv-value-path="'OP_SL_PlanExecution'">
                <b-row>
                  <b-col md="2" style="text-align: center;">
                    <img :src="require('@/assets/paper.png')" alt style="width: 50px;" />
                  </b-col>
                  <b-col md="10">
                    <b-row>
                      <b-col>
                        <span style="font-size: 15px; font-weight: bold;">
                          {{M_FU_Plan.customer_name}}
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
                          <font-awesome-icon class="icon-style-default" icon="user" />&nbsp;&nbsp; {{M_FU_Plan.contact_person}}
                        </span> &nbsp;&nbsp;
                        <span>
                          <font-awesome-icon class="icon-style-default" icon="phone-square-alt" />&nbsp;&nbsp; {{M_FU_Plan.contact_person_phone_no}}
                        </span>
                      </b-col>
                      <b-col style="text-align: right;">
                        <span>
                          <font-awesome-icon class="icon-style-default" icon="user" />&nbsp;&nbsp;User : {{M_FU_Plan.user}}
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
                                <span>{{this.M_FU_Plan.order_date}}</span>
                            </li>
                            <li class="active" style="width: 10% !important;">
                                <span>Assign</span>
                                <br />
                                <span>{{this.M_FU_Plan.assign_date}}</span>
                            </li>
                            <li class="active" style="width: 10% !important;">
                                <span>Dispatch</span>
                                <br />
                                <span>{{this.M_FU_Plan.dispatch_date}}</span>
                            </li>
                            <li class="active" style="width: 10% !important;">
                                <span>Arrived</span>
                                <br />
                                <span>{{this.M_FU_Plan.arrival_date}}</span>
                            </li>
                            <li class="active" style="width: 10% !important;">
                                <span>Start Loading</span>
                                <br />
                                <span>{{this.M_FU_Plan.start_loading_date}}</span>
                            </li>
                            <li class="active" style="width: 10% !important;">
                                <span>Finish Loading</span>
                                <br />
                                <span>{{this.M_FU_Plan.finish_loading_date}}</span>
                            </li>
                            <li class="active" style="width: 10% !important;">
                                <span>Get Out</span>
                                <br />
                                <span>{{this.M_FU_Plan.get_out_arrival_date}}</span>
                            </li>
                            <li class="active" style="width: 10% !important;">
                                <span>Arrive Destination</span>
                                <br />
                                <span>{{this.M_FU_Plan.get_out_destination_date}}</span>
                            </li>
                            <li class="active" style="width: 10% !important;">
                                <span>Start Unloading</span>
                                <br />
                                <span>{{this.M_FU_Plan.start_unloading_date}}</span>
                            </li>
                            <li class="active" style="width: 10% !important;">
                                <span>Finish Unloading</span>
                                <br />
                                <span>{{this.M_FU_Plan.finish_unloading_date}}</span>
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
                            <span style="color: rgb(153 153 153)">{{M_FU_Plan.order_no}}</span>
                          </b-col>
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span>Date</span>
                            <br />
                            <span style="color: rgb(153 153 153)">{{M_FU_Plan.date}}</span>
                          </b-col>
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span>Category</span>
                            <br />
                            <span style="color: rgb(153 153 153)">{{M_FU_Plan.category_descs}}</span>
                          </b-col>
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span>From</span>
                            <br />
                            <span style="color: rgb(153 153 153)">{{M_FU_Plan.from}}</span>
                          </b-col>
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span>To</span>
                            <br />
                            <span style="color: rgb(153 153 153)">{{M_FU_Plan.to}}</span>
                          </b-col>
                        </b-row>
                        <b-row style="border: solid 1px #e7eaec;border-radius: 0px 0px 5px 5px;">
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span>Pick Up Date</span>
                            <br />
                            <span style="color: rgb(153 153 153)">{{M_FU_Plan.pickup_date}}</span>
                          </b-col>
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span>KGS</span>
                            <br />
                            <span style="color: rgb(153 153 153)">{{M_FU_Plan.kgs}}</span>
                          </b-col>
                          <b-col
                            style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;"
                          >
                            <span>CBM</span>
                            <br />
                            <span style="color: rgb(153 153 153)">{{M_FU_Plan.cbm}}</span>
                          </b-col>
                          <b-col style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;">
                            <span>Vehicle Type</span>
                            <br />
                            <span style="color: rgb(153 153 153)">{{M_FU_Plan.fleet_type_descs}}</span>
                          </b-col>
                          <b-col style="border-right: solid 1px #e7eaec; padding: 10px !important; max-width: 20% !important;" >
                            <span>Vehicle Number</span>
                            <br />
                            <span style="color: rgb(153 153 153)">{{M_FU_Plan.plat_no}}</span>
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
                            <span class="AppointmentDescs">{{M_FU_Plan.driver1}}</span>
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
                                <span style="color: rgb(153 153 153)">{{M_FU_Plan.from_address}}</span>
                              </b-list-group-item>
                              <b-list-group-item>
                                <span>To :</span>
                                <br />
                                <span style="color: rgb(153 153 153)">{{M_FU_Plan.to_address}}</span>
                              </b-list-group-item>
                            </b-list-group>
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col md="12" style="padding-left: 0px !important;">
                            <span>
                              <label>Get Out Destination</label>
                            </span>
                            <ACCDateTime
                              @input="Onget_out_destination_Change"
                              :prop="PI_get_out_destination"
                              v-model="M_PlanExe.get_out_destination"
                              ref="ref_get_out_destination"
                            />
                          </b-col>
                        </b-row>
                        <b-row class="row-view">
                            <b-col md="12" style="padding-left: 0px !important;">
                                <span>
                                    <label>Comodity</label>
                                </span>
                                <!-- <ACCDropDown
                                    @change="OncomodityChange"
                                    :prop="PI_comodity"
                                    v-model="M_PlanExe.comodity"
                                    :label="M_PlanExe.comodityLabel"
                                    :ref="'ref_comodity'"
                                /> -->
                                <br>
                                <span>
                                  <label>{{M_FU_Plan.loading_comodity}}</label>
                                </span>
                            </b-col>
                        </b-row>
                        <b-row class="row-view">
                            <b-col md="4" style="padding-left: 0px !important;">
                                <span>
                                    <label>Total Item</label>
                                </span>
                                <!-- <ACCTextBox
                                    :prop="PI_total_item"
                                    v-model="M_PlanExe.total_item"
                                    ref="ref_total_item"
                                /> -->
                                <br>
                                <span>
                                  <label>{{M_FU_Plan.loading_total_item}}</label>
                                </span>
                            </b-col>
                            <b-col md="4" style="padding-left: 0px !important;">
                                <span>
                                    <label>KGS</label>
                                </span>
                                <!-- <ACCTextBox
                                    :prop="PI_kgs"
                                    v-model="M_PlanExe.kgs"
                                    ref="ref_kgs"
                                /> -->
                                <br>
                                <span>
                                  <label>{{M_FU_Plan.loading_kgs}}</label>
                                </span>
                            </b-col>
                            <b-col md="4" style="padding-left: 0px !important;">
                                <span>
                                    <label>CBM</label>
                                </span>
                                <!-- <ACCTextBox
                                    :prop="PI_cbm"
                                    v-model="M_PlanExe.cbm"
                                    ref="ref_cbm"
                                /> -->
                                <br>
                                <span>
                                  <label>{{M_FU_Plan.loading_cbm}}</label>
                                </span>
                            </b-col>
                        </b-row>
                      </b-col>
                      <b-col md="6">
                        <div>
                          <img :src="require('@/assets/map.png')" alt style="width: 100%;" />
                        </div>
                      </b-col>
                    </b-row>
                    <b-row>
                        <b-col class="row-bordered" md="6">
                            <b-row>
                                <b-col style="margin-right: 10px !important;">
                                    <span style="font-size: 15px; color: rgb(51, 51, 153); font-weight: bold;">
                                        Delivered
                                    </span>
                                </b-col>
                            </b-row>
                            <b-row class="row-view">
                                <b-col md="4">
                                    <span>
                                        <label>Total Item</label>
                                    </span>
                                    <!-- <ACCTextBox
                                        :prop="PI_total_item"
                                        v-model="M_PlanExe.total_delivered_item"
                                        ref="ref_total_item"
                                    /> -->
                                    <br>
                                    <span>
                                        <label>{{M_FU_Plan.total_delivered_item}}</label>
                                    </span>
                                </b-col>
                                <b-col md="4">
                                    <span>
                                        <label>KGS</label>
                                    </span>
                                    <!-- <ACCTextBox
                                        :prop="PI_kgs"
                                        v-model="M_PlanExe.total_delivered_kgs"
                                        ref="ref_kgs"
                                    /> -->
                                    <br>
                                    <span>
                                        <label>{{M_FU_Plan.total_delivered_kgs}}</label>
                                    </span>
                                </b-col>
                                <b-col md="4">
                                    <span>
                                        <label>CBM</label>
                                    </span>
                                    <!-- <ACCTextBox
                                        :prop="PI_cbm"
                                        v-model="M_PlanExe.total_delivered_cbm"
                                        ref="ref_cbm"
                                    /> -->
                                    <br>
                                    <span>
                                        <label>{{M_FU_Plan.total_delivered_cbm}}</label>
                                    </span>
                                </b-col>
                            </b-row>
                        </b-col>
                        <b-col md="6" class="row-bordered">
                            <b-row>
                                <b-col md="2">
                                    <span style="font-size: 15px; color: rgb(51, 51, 153); font-weight: bold;">
                                        Return Empty
                                    </span>
                                </b-col>
                                <b-col>
                                    <b-form-checkbox
                                        @change="return_empty_change"
                                        v-model="M_PlanExe.return_empty"
                                        name="check-button"
                                        switch
                                        size="lg"
                                    />
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="12">
                                    <span>
                                        <label>Return To</label>
                                    </span>
                                    <ACCDropDown
                                        @change="Onreturn_empty_toChange"
                                        :prop="PI_return_empty_to"
                                        v-model="M_PlanExe.return_empty_to"
                                        :label="M_PlanExe.return_empty_toLabel"
                                        ref="ref_return_empty_to"
                                    />
                                </b-col>
                            </b-row>
                        </b-col>
                    </b-row>
                    <b-row>
                        <b-col md="6">
                            <b-row>
                                <b-col>
                                    <span>
                                        <label>Note</label>
                                    </span>
                                    <ACCTextArea :prop="PI_note" v-model="M_PlanExe.note" ref="ref_note" />
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col>
                                    <ABSButton
                                        :text="'Get Out Destination'"
                                        classButton="btn btn--default"
                                        classIcon="icon-style-default"
                                        @click="doSave"
                                        styleButton="height: 40px;width: 100%;"
                                    />
                                </b-col>
                            </b-row>
                        </b-col>
                        <b-col class="row-bordered">
                        <b-row>
                            <b-col>
                                <span style="font-size: 15px; color: rgb(51, 51, 153); font-weight: bold;">
                                    Current KM
                                </span>
                            </b-col>
                        </b-row>
                        <b-row>
                            <b-col md="6">
                                <span>
                                    <label>Current KM</label>
                                </span>
                                <ACCTextBox
                                    :prop="PI_current_km"
                                    v-model="M_PlanExe.current_km"
                                    ref="ref_current_km"
                                />
                            </b-col>
                        </b-row>
                        </b-col>
                    </b-row>

                    <b-row class="row-bordered" style="margin-top: 10px;" v-show="M_FU_Plan.category == 'C'">
                      <b-col md="12">
                        <b-row>
                          <b-col md="1">
                            <span style="font-size: 15px; color: rgb(51, 51, 153); font-weight: bold;">
                              Console Detail
                            </span>
                          </b-col>
                          <b-col md="1">
                            <b-button
                              style="background-color: transparent; color: black; border: none; padding: unset !important;"
                              @click="doCreateConsole"
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
                                    :cHeader="PlanConsole_H"
                                    :cData="PlanConsole_D"
                                    @rowClicked="ConsoleClick"
                                    ref="ref_SL_Plan_Console"
                                    WithDeleteButton
                                    @buttonDeleteClicked="doDeleteConsole"
                                >
                                  <template slot="pickup_date" slot-scope="data">
                                    <span>{{momentDateFormatting(data.item.pickup_date, "YYYY-MM-DD HH:mm")}}</span>
                                  </template>
                                </ACCFormList>
                            </b-col>
                        </b-row>
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
                              style="background-color: transparent; color: black; border: none; padding: unset !important;"
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

                    <b-row class="row-bordered" style="margin-top: 10px;">
                      <b-col md="12">
                        <b-row>
                          <b-col md="2">
                            <span style="font-size: 15px; color: rgb(51, 51, 153); font-weight: bold;">
                              Extra Pick/Drop
                            </span>
                          </b-col>
                        </b-row>
                        <b-row>
                            <b-col>
                                <ACCFormList
                                    :prop="{}"
                                    :title="''"
                                    cStatic
                                    :cHeader="PlanExtra_H"
                                    :cData="PlanExtra_D"
                                    @rowClicked="ExtraClick"
                                    ref="ref_SL_Plan_Extra"
                                    WithDeleteButton
                                    @buttonDeleteClicked="doDeleteExtra"
                                >
                                  <!-- <template slot="ticket_date" slot-scope="data">
                                    <span>{{momentDateFormatting(data.item.ticket_date, "YYYY-MM-DD HH:mm")}}</span>
                                  </template> -->
                                </ACCFormList>
                            </b-col>
                        </b-row>
                      </b-col>
                    </b-row>

                    <b-row class="row-bordered" style="margin-top: 10px;">
                      <b-col md="12">
                        <b-row>
                          <b-col md="1">
                            <span style="font-size: 15px; color: rgb(51, 51, 153); font-weight: bold;">
                              Costing
                            </span>
                          </b-col>
                          <b-col>
                            <font-awesome-icon
                              icon="exclamation-circle"
                              class="icon-style-default"
                              style="margin-right: 5px; color: red;"
                            />
                            <span style="font-size: 12px; color: red; font-weight: bold;">
                              Costing over budget, need approval
                            </span>
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
                                  </template> -->
                                </ACCFormList>
                            </b-col>
                        </b-row>
                      </b-col>
                    </b-row>

                    <b-row style="margin-top: 10px;">
                      <b-col md="12">
                        <b-row>
                          <b-col md="1">
                            <span style="font-size: 15px; color: rgb(51, 51, 153); font-weight: bold;">
                              Document
                            </span>
                          </b-col>
                        </b-row>
                        <b-row>
                          <template v-for="(doc, id) in PlanDocument">
                            <b-col style="margin-right: 5px;" v-bind:key="id">
                                <b-row class="row-bordered" style="height: 100%">
                                  <b-col style="text-align: center;">
                                    <span style="font-size: 15px; color: rgb(51, 51, 153); font-weight: bold;">
                                      {{id + 1}}. {{doc.dokument_type}}
                                    </span>
                                    <br /><br />
                                    <template v-if="(doc.doc_file_name && doc.doc_file_name !== '') && (doc.doc_path_file && doc.doc_path_file !== '')">
                                      <img 
                                        :id="doc.dokument_type"
                                        :src="url + doc.doc_path_file"
                                        alt
                                        width="80%"
                                        style="cursor: pointer;"
                                        @click="Show_Pict(doc)"
                                      />
                                      <font-awesome-icon
                                        class="icon-style-danger"
                                        icon="times-circle"
                                        size="lg"
                                        style="cursor: pointer; top: 28px; right: 8%; position: absolute;"
                                        @click="Delete_Pict(id)"
                                      />
                                    </template>

                                    <template v-else>
                                      <!-- <font-awesome-icon
                                        icon="plus-circle"
                                        class="icon-style-default"
                                        size="4x"
                                      /> -->
                                      <ACCImageUpload
                                        :prop="{
                                          cName: doc.dokument_type,
                                          cAccept: '.jpg, .png, .gif',
                                          cTitle: '',
                                          cModule: 'OP',
                                          cIcon: 'plus-circle',
                                          cIconSize: '4x'
                                        }"
                                        @change="onDocChange($event, id)"
                                        v-model="doc.doc_file_name"
                                      />
                                      <br />
                                      Upload Document
                                    </template>
                                  </b-col>
                                </b-row>
                            </b-col>
                          </template>
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
              <ABSModal id="Modal_Ticket" ref="Modal_Ticket" size="sm">
                <template slot="headerTitle">Ticket</template>
                <template slot="content">
                  <b-row>
                    <b-col md="12">
                      <b-form :data-vv-scope="'M_Ticket'" :data-vv-value-path="'M_Ticket'">
                        <b-row>
                          <b-col md="12">
                            <span>
                              <label>Ticket Category</label>
                            </span>
                            <ACCDropDown
                              @change="Onticket_categoryChange"
                              :prop="PI_ticket_category"
                              v-model="M_Ticket.ticket_category"
                              :label="M_Ticket.ticket_categoryLabel"
                              :ref="'ref_ticket_category'"
                            />
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col md="12">
                            <span>
                              <label>Description</label>
                            </span>
                            <ACCTextArea :prop="PI_ticket_descs" v-model="M_Ticket.ticket_descs" ref="ref_ticket_descs" />
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col md="12" style="text-align: center;">
                            <img v-if="M_Ticket.file_path && M_Ticket.file_path !== ''"
                              id="ticket_attachment"
                              :src="url + M_Ticket.file_path"
                              alt
                              style="width: 200px;"
                            />
                            <ACCImageUpload
                              :prop="PI_ticket_attachment"
                              @change="Onticket_attachmentChange"
                              v-model="M_Ticket.file_name"
                            />
                          </b-col>
                        </b-row>
                        <b-row style="margin-top: 10px;">
                          <b-col md="12" style="text-align: center;">
                            <ABSButton
                              :text="'Submit Ticket'"
                              classButton="btn btn--default"
                              classIcon="icon-style-1"
                              @click="Save_Ticket"
                              styleButton="height: 40px;width: 75%;"
                            />
                          </b-col>
                        </b-row>
                        <b-row>

                        </b-row>
                      </b-form>
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
        PI_ticket_category: {
            dataLookUp: {
                LookUpCd:'GetTicketCategory',
                ColumnDB:'op_ticket_category_id',
                InitialWhere:"ss_portfolio_id='" + this.getDataUser().portfolio_id + "'",
                ParamWhere:'',
                OrderBy:'',
                ParamView:'',
                SourceField:'',
                DisplayLookUp:'ticket_category'
            },
            cValidate: "required",
            cName: "comodity",
            ckey: false,
            cOrder: 1,
            cProtect: false,
            cParentForm: "M_Ticket",
            cStatic: false,
            cOption: [],
            cDisplayColumn: "ticket_category",
            cInputStatus: "new"
        },
        PI_ticket_descs: {
          cValidate: "",
          cName: "ticket_descs",
          cOrder: 2,
          cKey: false,
          cProtect: false,
          cResize: false,
          cReadonly: false,
          cRows: 3,
          cMaxRows: 3,
          cSize: "md",
          cParentForm: "M_Ticket",
          cInputStatus: "new"
        },
        PI_ticket_attachment: {
          cName: 'attachment',
          cAccept: '.jpg, .png, .gif',
          cTitle: 'Attachment',
          cModule: 'OP',
        },
        M_Ticket: {
          ticket_category: "",
          ticket_categoryLabel: "",
          descs: "",
          file_name: "",
          file_path: ""
        },
        PI_get_out_destination: {
            cValidate: "required",
            cName: "get_out_destination",
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
        PI_return_empty_to: {
            dataLookUp: {
                LookUpCd:'GetPortfolioDeliveryAddress',
                ColumnDB:'cm_contact_delivery_address_id',
                InitialWhere:"ss_portfolio_id='" + this.getDataUser().portfolio_id + "'",
                ParamWhere:'',
                OrderBy:'',
                ParamView:'',
                SourceField:'',
                DisplayLookUp:'title'
            },
            cValidate: "required",
            cName: "comodity",
            ckey: false,
            cOrder: 3,
            cProtect: true,
            cParentForm: "OP_SL_PlanExecution",
            cStatic: false,
            cOption: [],
            cDisplayColumn: "title",
            cInputStatus: "new"
        },
        PI_current_km: {
            cValidate: "required",
            cName: "current_km",
            cOrder: 4,
            cKey: false,
            cType: "numeric",
            cProtect: false,
            cParentForm: "OP_SL_PlanExecution",
            cDecimal: 2,
            cInputStatus: this.inputStatus
        },
        PI_note: {
            cValidate: "",
            cName: "note",
            cOrder: 2,
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
        M_ModalPict: {
          file: ''
        },
        M_DataPost: {},
        M_FU_Plan: {
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
            loading_comodity: "",
            loading_total_item: "",
            loading_kgs: "",
            loading_cbm: "",
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
            get_out_destination: new Date(),
            return_empty: false,
            return_empty_to: "",
            return_empty_toLabel: "",
            current_km: "",
            note: ""
        },
        PlanConsole_H: [
          {
            key: "row_number",
            label: "No",
            tdClass: "ContentACCList2 notranslate th-cus-center",
            thClass: "HeaderACCList2 th-cus-center"
          },
          {
            key: "order_no",
            label: "Order No",
            tdClass: "ContentACCList2 notranslate th-cus-center",
            thClass: "HeaderACCList2 S th-cus-center"
          },
          {
            key: "pickup_date",
            label: "Pickup Date",
            tdClass: "ContentACCList2 notranslate th-cus-center",
            thClass: "HeaderACCList2 S th-cus-center"
          },
          {
            key: "from_to",
            label: "From To",
            tdClass: "ContentACCList2 notranslate th-cus-center",
            thClass: "HeaderACCList2 S th-cus-center"
          },
          {
            key: "company",
            label: "Company",
            tdClass: "ContentACCList2 notranslate th-cus-center",
            thClass: "HeaderACCList2 S th-cus-center"
          },
          {
            key: "kgs",
            label: "KGS",
            tdClass: "ContentACCList2 notranslate th-cus-center",
            thClass: "HeaderACCList2 S th-cus-center"
          },
          {
            key: "cbm",
            label: "CBM",
            tdClass: "ContentACCList2 notranslate th-cus-center",
            thClass: "HeaderACCList2 S th-cus-center"
          },
          {
            key: "row_id",
            label: "",
            tdClass: "ContentACCList2 notranslate th-cus-center",
            thClass: "HeaderACCList2 th-cus-center"
          }
        ],
        PlanConsole_D: [],
        PlanTicket_H: [
          {
            key: "row_number",
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
            key: "ticket_category",
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
            key: "doc_file_name",
            label: "Attachment",
            tdClass: "ContentACCList2 notranslate th-cus-center",
            thClass: "HeaderACCList2 S th-cus-center"
          },
        ],
        PlanTicket_D: [],
        PlanCosting_H: [
          {
            key: "row_number",
            label: "No",
            tdClass: "ContentACCList2 notranslate th-cus-center",
            thClass: "HeaderACCList2 th-cus-center"
          },
          {
            key: "cost_type",
            label: "Cost Type",
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
            key: "cost_value",
            label: "Value",
            tdClass: "ContentACCList2 notranslate th-cus-center",
            thClass: "HeaderACCList2 S th-cus-center"
          },
          {
            key: "order_cost_status",
            label: "Status",
            tdClass: "ContentACCList2 notranslate th-cus-center",
            thClass: "HeaderACCList2 S th-cus-center"
          },
          {
            key: "row_id", //untuk button delete
            label: "",
            tdClass: "ContentACCList2 notranslate th-cus-center",
            thClass: "HeaderACCList2 th-cus-center"
          },
        ],
        PlanCosting_D: [],
        PlanExtra_H: [
          {
            key: "row_number",
            label: "No",
            tdClass: "ContentACCList2 notranslate th-cus-center",
            thClass: "HeaderACCList2 th-cus-center"
          },
          {
            key: "location",
            label: "Location",
            tdClass: "ContentACCList2 notranslate th-cus-center",
            thClass: "HeaderACCList2 S th-cus-center"
          },
          {
            key: "address",
            label: "Address",
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
            key: "row_id", //untuk button delete
            label: "",
            tdClass: "ContentACCList2 notranslate th-cus-center",
            thClass: "HeaderACCList2 th-cus-center"
          },
        ],
        PlanExtra_D: [],
        PlanDocument: []
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
    doDeleteExtra(record, index) {
      this.alertConfirmation("Are You Sure Want To Delete This Data ?").then(
        (ress) => {
          if (ress.value) {
            var param = {
              option_url: "/OP/OP_Order",
              line_no: 2,
              id: record.row_id,
              lastupdatestamp: record.lastupdatestamp,
            };
            this.deleteJSON(this.getUrlCRUD(), param).then((response) => {
              if (response == null) return;
              this.alertSuccess("Data Has Been Deleted").then(() => {
                this.GetDataBy();
              });
            });
          }
        }
      );
    },
    doDeleteCosting(record, index) {
      this.alertConfirmation("Are You Sure Want To Delete This Data ?").then(
        (ress) => {
          if (ress.value) {
            var param = {
              option_url: "/OP/OP_Order",
              line_no: 1,
              id: record.row_id,
              lastupdatestamp: record.lastupdatestamp,
            };
            this.deleteJSON(this.getUrlCRUD(), param).then((response) => {
              if (response == null) return;
              this.alertSuccess("Data Has Been Deleted").then(() => {
                this.GetDataBy();
              });
            });
          }
        }
      );
    },
    doDeleteConsole(record, index) {},
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
      this.alertConfirmation("Are You Sure Want To Delete This Document ?").then(
        ress => {
          if (ress.value) {
            this.PlanDocument[id].doc_path_file = ""
            this.PlanDocument[id].doc_file_name = ""
          }
        }
      );
    },
    OncomodityChange(data) {
        this.M_PlanExe.comodity = data.id;
        this.M_PlanExe.comodityLabel = data.label;
    },
    return_empty_change(data) {
        console.log(data)
        if (data) {
            this.PI_return_empty_to.cProtect = false
            this.PI_return_empty_to.cValidate = 'required'
        }
        else {
            this.PI_return_empty_to.cProtect = true
            this.PI_return_empty_to.cValidate = ''
            this.M_PlanExe.return_empty_to = ''
            this.M_PlanExe.return_empty_toLabel = ''
        }
    },
    Onreturn_empty_toChange(data) {
        this.M_PlanExe.return_empty_to = data.id;
        this.M_PlanExe.return_empty_toLabel = data.label;
    },
    doSave() {
      this.$validator._base.validateAll("OP_SL_PlanExecution").then(result => {
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
          ress => {
            if (ress.value) {
              this.$validator.errors.clear("OP_SL_PlanExecution");
              this.M_Update();
            }
          }
        );
      });
    },
    M_Update() {
      var paramH = {
        _Method_: "UPDATE",
        _LineNo_: 0,
        ss_portfolio_id: this.M_DataPost.ss_portfolio_id && this.M_DataPost.ss_portfolio_id !== '' ? this.M_DataPost.ss_portfolio_id : "NULL",
        ss_subportfolio_id: this.M_DataPost.ss_subportfolio_id && this.M_DataPost.ss_subportfolio_id !== '' ? this.M_DataPost.ss_subportfolio_id : "NULL",
        op_order_id: this.paramFromList.row_id,
        order_no: this.M_DataPost.order_no && this.M_DataPost.order_no !== '' ? this.M_DataPost.order_no : "NULL",
        order_status: this.M_DataPost.order_status && this.M_DataPost.order_status !== '' ? this.M_DataPost.order_status : "NULL",
        cm_contact_id: this.M_DataPost.cm_contact_id && this.M_DataPost.cm_contact_id !== '' ? this.M_DataPost.cm_contact_id : "NULL",
        descs: this.M_DataPost.descs && this.M_DataPost.descs !== '' ? this.M_DataPost.descs : "NULL",
        pickup_date: this.M_DataPost.pickup_date && this.M_DataPost.pickup_date !== '' ? this.M_DataPost.pickup_date : "NULL",
        fr_cm_contact_delivery_address_id: this.M_DataPost.fr_cm_contact_delivery_address_id && this.M_DataPost.fr_cm_contact_delivery_address_id !== '' ? this.M_DataPost.fr_cm_contact_delivery_address_id : "NULL",
        to_cm_contact_delivery_address_id: this.M_DataPost.to_cm_contact_delivery_address_id && this.M_DataPost.to_cm_contact_delivery_address_id !== '' ? this.M_DataPost.to_cm_contact_delivery_address_id : "NULL",
        fr_cm_zone_id: this.M_DataPost.fr_cm_zone_id && this.M_DataPost.fr_cm_zone_id !== '' ? this.M_DataPost.fr_cm_zone_id : "NULL",
        to_cm_zone_id: this.M_DataPost.to_cm_zone_id && this.M_DataPost.to_cm_zone_id !== '' ? this.M_DataPost.to_cm_zone_id : "NULL",
        fm_fleet_type_id: this.M_DataPost.fm_fleet_type_id && this.M_DataPost.fm_fleet_type_id !== '' ? this.M_DataPost.fm_fleet_type_id : "NULL",
        assign_date: this.M_DataPost.assign_date && this.M_DataPost.assign_date !== '' ? this.M_DataPost.assign_date : "NULL",
        assign_fleet_status: this.M_DataPost.assign_fleet_status && this.M_DataPost.assign_fleet_status !== '' ? this.M_DataPost.assign_fleet_status : "NULL",
        vendor_cm_contact_id: this.M_DataPost.vendor_cm_contact_id && this.M_DataPost.vendor_cm_contact_id !== '' ? this.M_DataPost.vendor_cm_contact_id : "NULL",
        fm_fleet_mstr_id: this.M_DataPost.fm_fleet_mstr_id && this.M_DataPost.fm_fleet_mstr_id !== '' ? this.M_DataPost.fm_fleet_mstr_id : "NULL",
        license_plate_no: this.M_DataPost.license_plate_no && this.M_DataPost.license_plate_no !== '' ? this.M_DataPost.license_plate_no : "NULL",
        fm_driver_id: this.M_DataPost.fm_driver_id && this.M_DataPost.fm_driver_id !== '' ? this.M_DataPost.fm_driver_id : "NULL",
        driver_name: this.M_DataPost.driver_name && this.M_DataPost.driver_name !== '' ? this.M_DataPost.driver_name : "NULL",
        fm_driver_id2: this.M_DataPost.fm_driver_id2 && this.M_DataPost.fm_driver_id2 !== '' ? this.M_DataPost.fm_driver_id2 : "NULL",
        driver_name2: this.M_DataPost.driver_name2 && this.M_DataPost.driver_name2 !== '' ? this.M_DataPost.driver_name2 : "NULL",
        remarks: this.M_DataPost.remarks && this.M_DataPost.remarks !== '' ? this.M_DataPost.remarks : "NULL",
        dispatch_date: this.M_DataPost.dispatch_date && this.M_DataPost.dispatch_date !== '' ? this.M_DataPost.dispatch_date : "NULL",
        dispatch_km: this.M_DataPost.dispatch_km && this.M_DataPost.dispatch_km !== '' ? this.M_DataPost.dispatch_km : "NULL",
        dispatach_notes: this.M_DataPost.dispatach_notes && this.M_DataPost.dispatach_notes !== '' ? this.M_DataPost.dispatach_notes : "NULL",
        arrival_date: this.M_DataPost.arrival_date && this.M_DataPost.arrival_date !== '' ? this.M_DataPost.arrival_date : "NULL",
        arrival_notes: this.M_DataPost.arrival_notes && this.M_DataPost.arrival_notes !== '' ? this.M_DataPost.arrival_notes : "NULL",
        start_loading_date: this.M_DataPost.start_loading_date && this.M_DataPost.start_loading_date !== '' ? this.M_DataPost.start_loading_date : "NULL",
        start_loading_notes: this.M_DataPost.start_loading_notes && this.M_DataPost.start_loading_notes !== '' ? this.M_DataPost.start_loading_notes : "NULL",
        finish_loading_date: this.M_DataPost.finish_loading_date && this.M_DataPost.finish_loading_date !== '' ? this.M_DataPost.finish_loading_date : "NULL",
        cm_commodity_id: this.M_DataPost.cm_commodity_id && this.M_DataPost.cm_commodity_id !== '' ? this.M_DataPost.cm_commodity_id : "NULL",
        total_loading_item: this.M_DataPost.total_loading_item && this.M_DataPost.total_loading_item !== '' ? this.M_DataPost.total_loading_item : "NULL",
        total_loading_kgs: this.M_DataPost.total_loading_kgs && this.M_DataPost.total_loading_kgs !== '' ? this.M_DataPost.total_loading_kgs : "NULL",
        total_loading_cbm: this.M_DataPost.total_loading_cbm && this.M_DataPost.total_loading_cbm !== '' ? this.M_DataPost.total_loading_cbm : "NULL",
        finish_loading_notes: this.M_DataPost.finish_loading_notes && this.M_DataPost.finish_loading_notes !== '' ? this.M_DataPost.finish_loading_notes : "NULL",
        get_out_arrival_date: this.M_DataPost.get_out_arrival_date && this.M_DataPost.get_out_arrival_date !== '' ? this.M_DataPost.get_out_arrival_date : "NULL",
        get_out_arrival_notes: this.M_DataPost.get_out_arrival_notes && this.M_DataPost.get_out_arrival_notes !== '' ? this.M_DataPost.get_out_arrival_notes : "NULL",
        arrival_destination_date: this.M_DataPost.arrival_destination_date && this.M_DataPost.arrival_destination_date !== '' ? this.M_DataPost.arrival_destination_date : "NULL",
        arrival_destination_notes: this.M_DataPost.arrival_destination_notes && this.M_DataPost.arrival_destination_notes !== '' ? this.M_DataPost.arrival_destination_notes : "NULL",
        start_unloading_date: this.M_DataPost.start_unloading_date && this.M_DataPost.start_unloading_date !== '' ? this.M_DataPost.start_unloading_date : "NULL",
        start_unloading_notes: this.M_DataPost.start_unloading_notes && this.M_DataPost.start_unloading_notes !== '' ? this.M_DataPost.start_unloading_notes : "NULL",
        total_delivered_item: this.M_DataPost.total_delivered_item && this.M_DataPost.total_delivered_item !== '' ? this.M_DataPost.total_delivered_item : "NULL",
        total_delivered_kgs: this.M_DataPost.total_delivered_kgs && this.M_DataPost.total_delivered_kgs !== '' ? this.M_DataPost.total_delivered_kgs : "NULL",
        total_delivered_cbm: this.M_DataPost.total_delivered_cbm && this.M_DataPost.total_delivered_cbm !== '' ? this.M_DataPost.total_delivered_cbm : "NULL",
        finish_unloading_notes: this.M_DataPost.finish_unloading_notes && this.M_DataPost.finish_unloading_notes !== '' ? this.M_DataPost.finish_unloading_notes : "NULL",
        finish_unloading_date: this.M_DataPost.finish_unloading_date && this.M_DataPost.finish_unloading_date !== '' ? this.M_DataPost.finish_unloading_date : "NULL",
        get_out_destination_date: this.M_PlanExe.get_out_destination && this.M_PlanExe.get_out_destination !== '' ? this.M_PlanExe.get_out_destination : "NULL", // DARI FORM
        return_empty_to: this.M_PlanExe.return_empty_to && this.M_PlanExe.return_empty_to !== '' ? this.M_PlanExe.return_empty_to : "NULL",
        get_out_destination_km: this.M_PlanExe.current_km && this.M_PlanExe.current_km !== '' ? this.M_PlanExe.current_km : "NULL",
        get_out_destination_notes: this.M_PlanExe.note && this.M_PlanExe.note !== '' ? this.M_PlanExe.note : "NULL",
        ref_op_order_id: this.M_DataPost.ref_op_order_id && this.M_DataPost.ref_op_order_id !== '' ? this.M_DataPost.ref_op_order_id : "NULL",
        ref_op_order_no: this.M_DataPost.ref_op_order_no && this.M_DataPost.ref_op_order_no !== '' ? this.M_DataPost.ref_op_order_no : "NULL",
        total_order_amt: this.M_DataPost.total_order_amt && this.M_DataPost.total_order_amt !== '' ? this.M_DataPost.total_order_amt : "NULL",
        total_order_cost: this.M_DataPost.total_order_cost && this.M_DataPost.total_order_cost !== '' ? this.M_DataPost.total_order_cost : "NULL",
        lastupdatestamp: this.paramFromList.lastupdatestamp,
        user_edit: this.getDataUser().user_id
      },
      paramD = [];

      for (let i = 0; i < this.PlanDocument.length; i++) {
        paramD.push({
          _Method_: "UPDATE",
          _LineNo_: 4,
          op_order_document_id: this.PlanDocument[i].row_id,
          op_order_id: this.M_DataPost.row_id,
          mk_dokument_type_id: this.PlanDocument[i].mk_dokument_type_id,
          descs: this.PlanDocument[i].descs,
          doc_file_name: this.PlanDocument[i].doc_file_name && this.PlanDocument[i].doc_file_name !== '' ? this.PlanDocument[i].doc_file_name : "NULL",
          doc_path_file: this.PlanDocument[i].doc_path_file && this.PlanDocument[i].doc_path_file !== '' ? this.PlanDocument[i].doc_path_file : "NULL",
          doc_status: this.PlanDocument[i].doc_status,
          lastupdatestamp: this.PlanDocument[i].lastupdatestamp,
          user_edit: this.getDataUser().user_id
        })
      }

      var param = {
        option_url: "/OP/OP_Order",
        line_no: 0,
        Data: [
          {
            A_Update: paramH,
            B_Looping: paramD
          }
        ]
      };

      this.postJSONMulti(this.getUrlProsesDataPostMulti(), param).then(
        response => {
          if (response == null) return;
          this.alertSuccess("Update Data Has Been Successfully").then(() => {
            this.doBack();
          });
        }
      );
    },
    doCreateTicket() {
      this.M_Ticket = {
        ticket_category: "",
        ticket_categoryLabel: "",
        descs: "",
        file_name: "",
        file_path: ""
      }

      this.$refs.Modal_Ticket._show();
    },
    ticketClick(record, index) {
      var param = {
        option_url: "/OP/OP_Order",
        line_no: 3,
        id: record.row_id,
        lastupdatestamp: record.lastupdatestamp
      };

      this.getJSON(this.getUrlCRUD(), param).then(response => {
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
          lastupdatestamp: record.lastupdatestamp
        }

        this.$refs.Modal_Ticket._show();
      });
    },
    Onticket_categoryChange(data) {
      this.M_Ticket.ticket_category = data.id
      this.M_Ticket.ticket_categoryLabel = data.label
    },
    Onticket_attachmentChange(data) {
      this.M_Ticket.file_name = data.name;
      this.M_Ticket.file_path = data.path;
    },
    Save_Ticket() {
      this.$validator._base.validateAll("M_Ticket").then(result => {
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
          ress => {
            if (ress.value) {
              this.$validator.errors.clear("M_Ticket");
              var param = {}
              if (this.M_Ticket.op_order_ticket_id && this.M_Ticket.op_order_ticket_id !== '') {
                param = {
                  option_url: "/OP/OP_Order",
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
                  ticket_status: this.M_Ticket.ticket_status && this.M_Ticket.ticket_status !== '' ? this.M_Ticket.ticket_status : "NULL",
                  remarks: this.M_Ticket.remarks && this.M_Ticket.remarks !== '' ? this.M_Ticket.remarks : "NULL",
                  wo_status: this.M_Ticket.wo_status && this.M_Ticket.wo_status !== '' ? this.M_Ticket.wo_status : "NULL",
                  claim_status: this.M_Ticket.claim_status && this.M_Ticket.claim_status !== '' ? this.M_Ticket.claim_status : "NULL",
                  change_vehicle_status: this.M_Ticket.change_vehicle_status && this.M_Ticket.change_vehicle_status !== '' ? this.M_Ticket.change_vehicle_status : "NULL",
                  fm_fleet_mstr_id: this.M_Ticket.fm_fleet_mstr_id && this.M_Ticket.fm_fleet_mstr_id !== '' ? this.M_Ticket.fm_fleet_mstr_id : "NULL",
                  license_plate_no: this.M_Ticket.license_plate_no && this.M_Ticket.license_plate_no !== '' ? this.M_Ticket.license_plate_no : "NULL",
                  fm_driver_id: this.M_Ticket.fm_driver_id && this.M_Ticket.fm_driver_id !== '' ? this.M_Ticket.fm_driver_id : "NULL",
                  fm_driver_id2: this.M_Ticket.fm_driver_id2 && this.M_Ticket.fm_driver_id2 !== '' ? this.M_Ticket.fm_driver_id2 : "NULL",
                  lastupdatestamp: this.M_Ticket.lastupdatestamp,
                  user_edit: this.getDataUser().user_id
                };

                this.putJSON(this.getUrlCRUD(), param).then(response => {
                  if (response == null) return;
                  this.alertSuccess(response.Message).then(() => {
                    this.$refs.Modal_Ticket._hide();
                    this.GetDataBy();
                  });
                });
              }
              else {
                param = {
                  option_url: "/OP/OP_Order",
                  line_no: 3,
                  ss_portfolio_id: this.getDataUser().portfolio_id,
                  op_order_id: this.paramFromList.row_id,
                  ticket_date: new Date(),
                  op_ticket_category_id: this.M_Ticket.ticket_category,
                  descs: this.M_Ticket.ticket_descs,
                  doc_file_name: this.M_Ticket.file_name,
                  doc_path_file: this.M_Ticket.file_path,
                  remarks: 'NULL',
                  wo_status: 'NULL',
                  claim_status: 'NULL',
                  change_vehicle_status: 'NULL',
                  fm_fleet_mstr_id: this.M_DataPost.fm_fleet_mstr_id,
                  license_plate_no: this.M_DataPost.license_plate_no,
                  fm_driver_id: this.M_DataPost.fm_driver_id,
                  fm_driver_id2: this.M_DataPost.fm_driver_id2,
                  user_input: this.getDataUser().user_id
                };

                this.postJSON(this.getUrlCRUD(), param).then(response => {
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
    doCreateConsole() {},
    doCosting() {
      var param = this.M_DataPost;
      param.isEdit = false;

      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "OP_PlanExecutionCosting" });
    },
    doExtraPict() {
      var param = this.paramFromList;
      param.isEdit = false;
      param.isPick = true;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "OP_PlanExecutionPickDrop" });
    },
    doExtraDrop() {
      var param = this.paramFromList;
      param.isEdit = false;
      param.isPick = false;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "OP_PlanExecutionPickDrop" });
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
        get_out_destination: new Date(),
        return_empty: false,
        return_empty_to: "",
        return_empty_toLabel: "",
        current_km: "",
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
        this.M_DataPost = data;
        console.log(data)
        
        this.M_FU_Plan = {
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
            loading_comodity: data.commodity_descs,
            loading_total_item: data.total_loading_item && data.total_loading_item !== '' ? data.total_loading_item : 0,
            loading_kgs: data.total_loading_kgs && data.total_loading_kgs !== '' ? data.total_loading_kgs : 0,
            loading_cbm: data.total_loading_cbm && data.total_loading_cbm !== '' ? data.total_loading_cbm : 0,
            total_delivered_item: data.total_delivered_item && data.total_delivered_item !== '' ? data.total_delivered_item : 0,
            total_delivered_kgs: data.total_delivered_kgs && data.total_delivered_kgs !== '' ? data.total_delivered_kgs : 0,
            total_delivered_cbm:  data.total_delivered_cbm && data.total_delivered_cbm !== '' ? data.total_delivered_cbm : 0,
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
            order_date: this.momentDateFormatting(data.order_date, "YYYY-MM-DD HH:mm"),
            assign_date: this.momentDateFormatting(data.assign_date, "YYYY-MM-DD HH:mm"),
            dispatch_date: this.momentDateFormatting(data.dispatch_date, "YYYY-MM-DD HH:mm"),
            arrival_date: this.momentDateFormatting(data.arrival_date, "YYYY-MM-DD HH:mm"),
            start_loading_date: this.momentDateFormatting(data.start_loading_date, "YYYY-MM-DD HH:mm"),
            finish_loading_date: this.momentDateFormatting(data.finish_loading_date, "YYYY-MM-DD HH:mm"),
            get_out_arrival_date: this.momentDateFormatting(data.get_out_arrival_date, "YYYY-MM-DD HH:mm"),
            get_out_destination_date: this.momentDateFormatting(data.get_out_destination_date, "YYYY-MM-DD HH:mm"),
            start_unloading_date: this.momentDateFormatting(data.start_unloading_date, "YYYY-MM-DD HH:mm"),
            finish_unloading_date: this.momentDateFormatting(data.finish_unloading_date, "YYYY-MM-DD HH:mm")
        }

        this.PlanTicket_D = !data.detail_ticket || data.detail_ticket == null || data.detail_ticket == undefined ? [] : data.detail_ticket
        this.PlanCosting_D = !data.detail_cost || data.detail_cost == null || data.detail_cost == undefined ? [] : data.detail_cost
        this.PlanExtra_D = !data.detail_pick_drop || data.detail_pick_drop == null || data.detail_pick_drop == undefined ? [] : data.detail_pick_drop
        this.PlanConsole_D = !data.detail_console || data.detail_console == null || data.detail_console == undefined ? [] : data.detail_console
        this.PlanDocument = !data.detail_document || data.detail_document == null || data.detail_document == undefined ? [] : data.detail_document

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
