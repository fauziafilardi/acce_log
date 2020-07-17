<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Quotation</span>
                </b-col>
                <b-col style="text-align: right;">
                  <ABSButton
                    v-show="is_hide_button"
                    :text="'FTL'"
                    classButton="button button--back"
                    classIcon="icon-style-1"
                    @click="doFTL"
                  />
                  <ABSButton
                    v-show="is_hide_button"
                    :text="'LTL'"
                    classButton="button button--back"
                    classIcon="icon-style-1"
                    @click="doLTL"
                  />
                  <ABSButton
                    v-show="is_hide_button"
                    :text="'Rental'"
                    classButton="button button--back"
                    classIcon="icon-style-1"
                    @click="doRental"
                  />
                  <ABSButton
                    v-show="is_hide_button"
                    :text="'Project'"
                    classButton="button button--back"
                    classIcon="icon-style-1"
                    @click="doProject"
                  />
                  <ABSButton
                    v-show="is_hide_button"
                    :text="'Required Doc'"
                    classButton="button button--back"
                    classIcon="icon-style-1"
                    @click="doRequiredDoc"
                  />
                  <ABSButton
                    v-show="is_hide_button"
                    :text="'Log Book'"
                    classButton="button button--back"
                    classIcon="icon-style-1"
                    @click="doLogBook"
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
              <b-form :data-vv-scope="'MK_AddQuotation'" :data-vv-value-path="'MK_AddQuotation'">
                <b-row>
                  <b-col md="2" style="text-align: center;">
                    <img :src="require('@/assets/paper.png')" alt style="width: 70px;" />
                  </b-col>
                  <b-col md="10">
                    <b-row>
                      <b-col md="6">
                        <b-row>
                          <b-col>
                            <span>{{ M_Quotation.customer }}</span>
                            <br />
                            <span>
                              <font-awesome-icon
                                class="icon-style-default"
                                icon="map-marker-alt"
                                size="lg"
                              />
                              &nbsp;
                              {{ M_Quotation.fulladdress }}
                            </span>
                            <br />
                            <span>
                              <font-awesome-icon
                                class="icon-style-default"
                                icon="phone-square-alt"
                                size="lg"
                              />
                              {{ M_Quotation.phone_no }}
                            </span> &nbsp;
                            <span>
                              <font-awesome-icon
                                class="icon-style-default"
                                icon="globe-americas"
                                size="lg"
                              />
                              {{ M_Quotation.website }}
                            </span>
                            <br />
                            <span>
                              <font-awesome-icon class="icon-style-default" icon="user" size="lg" />
                              {{ M_Quotation.pic }}
                            </span> &nbsp;
                            <span>
                              <font-awesome-icon
                                class="icon-style-default"
                                icon="phone-square-alt"
                                size="lg"
                              />
                              {{ M_Quotation.pic_phone_no }}
                            </span> &nbsp;
                            <span>
                              <font-awesome-icon
                                class="icon-style-default"
                                icon="envelope"
                                size="lg"
                              />
                              {{ M_Quotation.email }}
                            </span> &nbsp;
                          </b-col>
                        </b-row>
                      </b-col>
                      <b-col style="text-align: right; margin-top: 10px;">
                        <div v-show="is_hide_button">
                          <span>
                            <font-awesome-icon
                              class="icon-style-default"
                              icon="print"
                              size="sm"
                              style="font-size: 17px;
                                margin-right: 10px;
                                margin-left: 10px;
                                cursor: pointer;"
                              @click="doPrint"
                            />
                          </span>
                          <span>
                            <font-awesome-icon
                              class="icon-style-default"
                              icon="phone-square-alt"
                              size="sm"
                              style="font-size: 17px;
                                margin-right: 10px;
                                margin-left: 10px;
                                cursor: pointer;"
                            />
                          </span>
                          <span>
                            <font-awesome-icon
                              class="icon-style-default"
                              icon="envelope"
                              size="sm"
                              style="font-size: 17px;
                                margin-right: 10px;
                                margin-left: 10px;
                                cursor: pointer;"
                              @click="doEmail"
                            />
                          </span>
                          <span>
                            <font-awesome-icon
                              class="icon-style-default"
                              icon="comment-alt"
                              size="sm"
                              style="font-size: 17px;
                                margin-right: 10px;
                                margin-left: 10px;
                                cursor: pointer;"
                              @click="doChat"
                            />
                          </span>
                          <span>
                            <ABSButton
                              :text="'Delete'"
                              classButton="btn btn--default"
                              classIcon="icon-style-1"
                              @click="doDelete"
                              :disabled="!isShow"
                            />
                          </span>
                          <span>
                            <ABSButton
                              :text="'Edit'"
                              classButton="btn btn--default"
                              classIcon="icon-style-1"
                              @click="doEdit"
                              :disabled="ButtonStatus == null ? false : !ButtonStatus.btnEdit"
                            />
                          </span>
                        </div>
                        <br />
                        <span>
                          <font-awesome-icon
                            class="icon-style-default"
                            icon="user"
                            style="margin-top:10px;"
                            size="sm"
                          />&nbsp;&nbsp;User : User Account
                        </span> &nbsp;
                      </b-col>
                    </b-row>
                    <hr />
                    <b-row>
                      <b-col
                        style="max-width: fit-content !important; margin-right: 20px; padding-bottom: 5px"
                        class="row-view"
                      >
                        <span>
                          <label style="margin-bottom: 0px !important;">Quotation Number</label>
                        </span>
                        <br />
                        <span style="color: #999999;">{{ M_Quotation.quotation_no }}</span>
                      </b-col>
                      <b-col
                        style="max-width: fit-content !important; margin-right: 20px; padding-bottom: 5px"
                        class="row-view"
                      >
                        <span>
                          <label style="margin-bottom: 0px !important;">Valid Thru</label>
                        </span>
                        <br />
                        <span
                          style="color: #999999;"
                        >{{ M_Quotation.date + ' - ' + M_Quotation.date2}}</span>
                      </b-col>
                      <b-col
                        style="max-width: fit-content !important; margin-right: 20px; padding-bottom: 5px"
                        class="row-view"
                      >
                        <span>
                          <label style="margin-bottom: 0px !important;">Status</label>
                        </span>
                        <br />
                        <span style="color: #999999;">{{ M_Quotation.status }}</span>
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col
                        style="max-width: fit-content !important; margin-right: 20px; padding-bottom: 5px"
                        class="row-view"
                      >
                        <span>
                          <label style="margin-bottom: 0px !important;">Project Name</label>
                        </span>
                        <br />
                        <span style="color: #999999;">{{ M_Quotation.project_name }}</span>
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col
                        style="max-width: fit-content !important; margin-right: 20px; padding-bottom: 5px"
                        class="row-view"
                      >
                        <span>
                          <label style="margin-bottom: 0px !important;">Description</label>
                        </span>
                        <br />
                        <span style="color: #999999; text-align: justify;">{{ M_Quotation.descs }}</span>
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col
                        style="max-width: fit-content !important; margin-right: 20px; padding-bottom: 5px"
                        class="row-view"
                      >
                        <span>
                          <label style="margin-bottom: 0px !important;">Extra Pick/Drop Charges</label>
                        </span>
                        <br />
                        <span style="color: #999999;">{{ M_Quotation.extra_charge }}</span>
                      </b-col>
                      <b-col
                        style="max-width: fit-content !important; margin-right: 20px; padding-bottom: 5px"
                        class="row-view"
                      >
                        <span>
                          <label style="margin-bottom: 0px !important;">Over Night Charges</label>
                        </span>
                        <br />
                        <span style="color: #999999;">{{ M_Quotation.overnight_charge }}</span>
                      </b-col>
                    </b-row>
                    <br />
                    <b-row>
                      <b-col>
                        <ABSButton
                          v-show="is_hide_button"
                          :disabled="!isShow"
                          :text="'Proposed'"
                          classButton="btn btn--default"
                          classIcon="icon-style-1"
                          size="6x"
                          @click="doConfirm"
                          styleButton="width: 20%; height: 150%;"
                        />
                      </b-col>
                    </b-row>
                    <br />
                    <b-row>
                      <b-col>
                        <span style="color: #333399; font-size: 15px; font-weight: bold;">FTL</span>
                        <div class="table--list" id="ftl_tb">
                          <b-table
                            :responsive="true"
                            :striped="false"
                            :bordered="true"
                            :outlined="false"
                            :small="false"
                            :hover="false"
                            :dark="false"
                            :fixed="false"
                            :foot-clone="false"
                            :fields="FTLHeader"
                            :items="FTLItems"
                            class="table-sm table-style-3"
                            @row-clicked="doFTL"
                          >
                            <template v-slot:cell(no)="data">{{data.index + 1}}</template>

                            <template v-slot:cell(price_amt)="data">
                              <b-row>
                                <b-col class="col-right">
                                  <font-awesome-icon
                                    v-if="data.item.old_price_amt > data.item.price_amt"
                                    class="icon-style-default"
                                    icon="arrow-down"
                                    style="color: red"
                                  />
                                  <font-awesome-icon
                                    v-if="data.item.old_price_amt < data.item.price_amt"
                                    class="icon-style-default"
                                    icon="arrow-up"
                                    style="color: blue"
                                  />

                                  <span
                                    :style="data.item.old_price_amt > data.item.price_amt ? 'color: red' : 'color: blue'"
                                  >{{isCurrency(data.item.price_amt, decimal)}}</span>
                                </b-col>
                                <!-- <b-col style="max-width: fit-content !important;">
                                </b-col> -->
                              </b-row>
                            </template>
                          </b-table>
                        </div>
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col>
                        <span style="color: #333399; font-size: 15px; font-weight: bold;">LTL</span>
                        <div class="table--list" id="ltl_tb">
                          <b-table
                            :responsive="true"
                            :striped="false"
                            :bordered="true"
                            :outlined="false"
                            :small="false"
                            :hover="false"
                            :dark="false"
                            :fixed="false"
                            :foot-clone="false"
                            :fields="LTLHeader"
                            :items="LTLItems"
                            class="table-sm table-style-3"
                            @row-clicked="doLTL"
                          >
                            <template v-slot:cell(no)="data">{{data.index + 1}}</template>

                            <template v-slot:cell(kgs_price_amt)="data">
                              <b-row>
                                <b-col class="col-right">
                                  <font-awesome-icon
                                    v-if="data.item.old_kgs_price_amt > data.item.kgs_price_amt"
                                    class="icon-style-default"
                                    icon="arrow-down"
                                    style="color: red"
                                  />
                                  <font-awesome-icon
                                    v-if="data.item.old_kgs_price_amt < data.item.kgs_price_amt"
                                    class="icon-style-default"
                                    icon="arrow-up"
                                    style="color: blue"
                                  />

                                  <span
                                    :style="data.item.old_kgs_price_amt > data.item.kgs_price_amt ? 'color: red' : 'color: blue'"
                                  >{{isCurrency(data.item.kgs_price_amt, decimal)}}</span>
                                </b-col>
                                <!-- <b-col style="max-width: fit-content !important;">
                                </b-col> -->
                              </b-row>
                            </template>
                            <template v-slot:cell(cbm_price_amt)="data">
                              <b-row>
                                <b-col class="col-right">
                                  <font-awesome-icon
                                    v-if="data.item.cbm_price_amt > data.item.cbm_price_amt"
                                    class="icon-style-default"
                                    icon="arrow-down"
                                    style="color: red"
                                  />
                                  <font-awesome-icon
                                    v-if="data.item.cbm_price_amt < data.item.cbm_price_amt"
                                    class="icon-style-default"
                                    icon="arrow-up"
                                    style="color: blue"
                                  />

                                  <span
                                    :style="data.item.cbm_price_amt > data.item.cbm_price_amt ? 'color: red' : 'color: blue'"
                                  >{{isCurrency(data.item.cbm_price_amt, decimal)}}</span>
                                </b-col>
                                <!-- <b-col style="max-width: fit-content !important;">
                                </b-col> -->
                              </b-row>
                            </template>
                          </b-table>
                        </div>
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col>
                        <span style="color: #333399; font-size: 15px; font-weight: bold;">Rental</span>
                        <div class="table--list" id="rental_tb">
                          <b-table
                            :responsive="true"
                            :striped="false"
                            :bordered="true"
                            :outlined="false"
                            :small="false"
                            :hover="false"
                            :dark="false"
                            :fixed="false"
                            :foot-clone="false"
                            :fields="RentalHeader"
                            :items="RentalItems"
                            class="table-sm table-style-3"
                            @row-clicked="doRental"
                          >
                            <template v-slot:cell(no)="data">{{data.index + 1}}</template>

                            <template v-slot:cell(price_amt)="data">
                              <b-row>
                                <b-col class="col-right">
                                  <font-awesome-icon
                                    v-if="data.item.old_price_amt > data.item.price_amt"
                                    class="icon-style-default"
                                    icon="arrow-down"
                                    style="color: red"
                                  />
                                  <font-awesome-icon
                                    v-if="data.item.old_price_amt < data.item.price_amt"
                                    class="icon-style-default"
                                    icon="arrow-up"
                                    style="color: blue"
                                  />
                                </b-col>
                                <b-col style="max-width: fit-content !important;">
                                  <span
                                    :style="data.item.old_price_amt > data.item.price_amt ? 'color: red' : 'color: blue'"
                                  >{{isCurrency(data.item.price_amt, decimal)}}</span>
                                </b-col>
                              </b-row>
                            </template>
                            <template v-slot:cell(include_driver_status)="data">
                              <span>{{data.item.include_driver_status == "Y" ? "Yes" : "No"}}</span>
                            </template>
                          </b-table>
                        </div>
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col>
                        <span style="color: #333399; font-size: 15px; font-weight: bold;">Project</span>
                        <div class="table--list" id="project_tb">
                          <b-table
                            :responsive="true"
                            :striped="false"
                            :bordered="true"
                            :outlined="false"
                            :small="false"
                            :hover="false"
                            :dark="false"
                            :fixed="false"
                            :foot-clone="false"
                            :fields="ProjectHeader"
                            :items="ProjectItems"
                            class="table-sm table-style-3"
                            @row-clicked="doProject"
                          >
                            <template v-slot:cell(no)="data">{{data.index + 1}}</template>

                            <template v-slot:cell(price_amt)="data">
                              <b-row>
                                <b-col class="col-right">
                                  <font-awesome-icon
                                    v-if="data.item.old_price_amt > data.item.price_amt"
                                    class="icon-style-default"
                                    icon="arrow-down"
                                    style="color: red"
                                  />
                                  <font-awesome-icon
                                    v-if="data.item.old_price_amt < data.item.price_amt"
                                    class="icon-style-default"
                                    icon="arrow-up"
                                    style="color: blue"
                                  />
                                </b-col>
                                <b-col style="max-width: fit-content !important;">
                                  <span
                                    :style="data.item.old_price_amt > data.item.price_amt ? 'color: red' : 'color: blue'"
                                  >{{isCurrency(data.item.price_amt, decimal)}}</span>
                                </b-col>
                              </b-row>
                            </template>
                          </b-table>
                        </div>
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col>
                        <span
                          style="color: #333399; font-size: 15px; font-weight: bold;"
                        >Document Type</span>
                        <div class="table--list" id="document_tb">
                          <b-table
                            :responsive="true"
                            :striped="false"
                            :bordered="true"
                            :outlined="false"
                            :small="false"
                            :hover="false"
                            :dark="false"
                            :fixed="false"
                            :foot-clone="false"
                            :fields="DocHeader"
                            :items="DocItems"
                            class="table-sm table-style-3"
                            @row-clicked="doRequiredDoc"
                          >
                            <template v-slot:cell(no)="data">{{data.index + 1}}</template>
                          </b-table>
                        </div>
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col>
                        <span style="color: #333399; font-size: 15px; font-weight: bold;">LogBook</span>
                        <div class="table--list" id="logbook_tb">
                          <b-table
                            :responsive="true"
                            :striped="false"
                            :bordered="true"
                            :outlined="false"
                            :small="false"
                            :hover="false"
                            :dark="false"
                            :fixed="false"
                            :foot-clone="false"
                            :fields="LogBookHeader"
                            :items="LogBookItems"
                            class="table-sm table-style-3"
                            @row-clicked="doLogBook"
                          >
                            <template v-slot:cell(no)="data">{{data.index + 1}}</template>
                            <template
                              v-slot:cell(logbook_date)="data"
                            >{{momentDateFormat(data.item.logbook_date, "DD-MM-YYYY HH:mm")}}</template>
                          </b-table>
                        </div>
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

    <div id="forPrint" style="display: none;">
      <b-row>
        <b-col md="6">
          <b-row>
            <b-col>
              <span>{{ M_Quotation.customer }}</span>
              <br />
              <span>
                <font-awesome-icon
                  style="color: #333399;font-size: 0.875em;width: 0.75em;"
                  icon="map-marker-alt"
                  size="sm"
                />
                &nbsp;
                {{ M_Quotation.fulladdress }}
              </span>
              <br />
              <span>
                <font-awesome-icon
                  style="color: #333399;font-size: 0.875em;width: 0.75em;"
                  icon="phone-square-alt"
                  size="sm"
                />
                {{ M_Quotation.phone_no }}
              </span> &nbsp;
              <span>
                <font-awesome-icon
                  style="color: #333399;font-size: 0.875em;width: 0.75em;"
                  icon="globe-americas"
                  size="sm"
                />
                {{ M_Quotation.website }}
              </span>
              <br />
              <span>
                <font-awesome-icon
                  style="color: #333399;font-size: 0.875em;width: 0.75em;"
                  icon="user"
                  size="sm"
                />
                {{ M_Quotation.pic }}
              </span> &nbsp;
              <span>
                <font-awesome-icon
                  style="color: #333399;font-size: 0.875em;width: 0.75em;"
                  icon="phone-square-alt"
                  size="sm"
                />
                {{ M_Quotation.pic_phone_no }}
              </span> &nbsp;
              <span>
                <font-awesome-icon
                  style="color: #333399;font-size: 0.875em;width: 0.75em;"
                  icon="envelope"
                  size="sm"
                />
                {{ M_Quotation.email }}
              </span>
            </b-col>
          </b-row>
        </b-col>
        <b-col style="text-align: right; margin-top: 10px;">
          <span>
            <font-awesome-icon
              style="color: #333399;font-size: 0.875em;width: 0.75em;margin-top:10px;"
              icon="user"
              size="sm"
            />&nbsp;&nbsp;User : User Account
          </span> &nbsp;
        </b-col>
      </b-row>
      <hr />
      <b-row
        style="display: flex; flex-wrap: wrap; margin-right: unset !important; margin-left: unset !important;"
      >
        <b-col
          style="max-width: fit-content !important; margin-right: 20px; position: relative; width: 100%; border-bottom: solid 2px rgb(153, 153, 153); padding-bottom: 5px"
        >
          <span>
            <label style="margin-bottom: 0px !important;">Quotation Number</label>
          </span>
          <br />
          <span style="color: #999999;">{{ M_Quotation.quotation_no }}</span>
        </b-col>
        <b-col
          style="max-width: fit-content !important; margin-right: 20px; position: relative; width: 100%; border-bottom: solid 2px rgb(153, 153, 153); padding-bottom: 5px"
        >
          <span>
            <label style="color: #999999; margin-bottom: 0px !important;">Valid Thru</label>
          </span>
          <br />
          <span>{{ M_Quotation.date + ' - ' + M_Quotation.date2 }}</span>
        </b-col>
        <b-col
          style="max-width: fit-content !important; margin-right: 20px; position: relative; width: 100%; border-bottom: solid 2px rgb(153, 153, 153); padding-bottom: 5px"
        >
          <span>
            <label style="margin-bottom: 0px !important;">Status</label>
          </span>
          <br />
          <span style="color: #999999;">{{ M_Quotation.status }}</span>
        </b-col>
      </b-row>
      <b-row
        style="margin-top: 10px !important; margin-bottom: 10px !important; font-size: 15px !important"
      >
        <b-col
          style="max-width: fit-content !important; margin-right: 20px; position: relative; width: 100%; border-bottom: solid 2px rgb(153, 153, 153); padding-bottom: 5px"
        >
          <span>
            <label style="margin-bottom: 0px !important;">Project Name</label>
          </span>
          <br />
          <span style="color: #999999;">{{ M_Quotation.project_name }}</span>
        </b-col>
      </b-row>
      <b-row style="margin-bottom: 10px; !important">
        <b-col
          style="max-width: fit-content !important; margin-right: 20px; position: relative; width: 100%; border-bottom: solid 2px rgb(153, 153, 153); padding-bottom: 5px"
        >
          <span>
            <label style="margin-bottom: 0px !important;">Description</label>
          </span>
          <br />
          <span style="color: #999999; text-align: justify;">{{ M_Quotation.descs }}</span>
        </b-col>
      </b-row>
      <b-row
        style="display: flex; flex-wrap: wrap; margin-right: unset !important; margin-left: unset !important;"
      >
        <b-col
          style="max-width: fit-content !important; margin-right: 20px; position: relative; width: 100%; border-bottom: solid 2px rgb(153, 153, 153); padding-bottom: 5px"
        >
          <span>
            <label style="margin-bottom: 0px !important;">Extra Pick/Drop Charges</label>
          </span>
          <br />
          <span style="color: #999999;">{{ M_Quotation.extra_charge }}</span>
        </b-col>
        <b-col
          style="max-width: fit-content !important; margin-right: 20px; position: relative; width: 100%; border-bottom: solid 2px rgb(153, 153, 153); padding-bottom: 5px"
        >
          <span>
            <label style="margin-bottom: 0px !important;">Over Night Charges</label>
          </span>
          <br />
          <span style="color: #999999;">{{ M_Quotation.overnight_charge }}</span>
        </b-col>
      </b-row>
      <b-row
        style="display: flex; flex-wrap: wrap; margin-right: unset !important; margin-left: unset !important;"
      >
        <b-col style="position: relative; width: 100%;">
          <span style="color: #333399; font-size: 15px; font-weight: bold;">FTL</span>
          <div class="table--list" id="ftl_tb">
            <b-table
              :responsive="true"
              :striped="false"
              :bordered="true"
              :outlined="false"
              :small="false"
              :hover="false"
              :dark="false"
              :fixed="false"
              :foot-clone="false"
              :fields="FTLHeader"
              :items="FTLItems"
              class="table-sm table-style-3"
              @row-clicked="doFTL"
            >
              <template v-slot:cell(no)="data">{{data.index + 1}}</template>

              <template v-slot:cell(price_amt)="data">
                <b-row>
                  <b-col md="1">
                    <font-awesome-icon
                      v-if="data.item.old_price_amt > data.item.price_amt"
                      class="icon-style-default"
                      icon="arrow-down"
                      style="color: red"
                    />
                    <font-awesome-icon
                      v-if="data.item.old_price_amt < data.item.price_amt"
                      class="icon-style-default"
                      icon="arrow-up"
                      style="color: blue"
                    />
                  </b-col>
                  <b-col style="max-width: fit-content !important;">
                    <span
                      :style="data.item.old_price_amt > data.item.price_amt ? 'color: red' : 'color: blue'"
                    >{{data.item.price_amt}}</span>
                  </b-col>
                </b-row>
              </template>
            </b-table>
          </div>
        </b-col>
      </b-row>
    </div>

    <!-- Modal Reason -->
    <ABSModal id="Modal_MK_Quotation" ref="Modal_MK_Quotation" size="sm">
      <template slot="headerTitle">Delete</template>
      <template slot="content">
        <b-row>
          <b-col md="12">
            <b-form
              :data-vv-scope="'FormScope_' + 1 + '_' + 1"
              :data-vv-value-path="'FormScope_' + 1 + '_' + 1"
            >
              <b-row>
                <b-col md="12">
                  <b-row>
                    <b-col md="12" style="text-align: center;">
                      <span>Are You Sure Want To Delete ?</span>
                    </b-col>
                  </b-row>
                  <b-row style="margin-top: 10px;">
                    <b-col md="6" style="text-align: center;">
                      <ABSButton
                        :text="'No'"
                        classButton="btn btn--default"
                        classIcon="icon-style-1"
                        @click="NoDelete"
                        styleButton="height: 40px;width: 100%;"
                      />
                    </b-col>
                    <b-col md="6" style="text-align: center;">
                      <ABSButton
                        :text="'Yes'"
                        classButton="btn btn--default"
                        classIcon="icon-style-1"
                        @click="YesDelete"
                        styleButton="height: 40px;width: 100%;"
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

    <!-- Modal Email -->
    <ABSModal id="Modal_Email" ref="Modal_Email" size="md">
      <template slot="headerTitle">Email</template>
      <template slot="content">
        <b-row>
          <b-col md="12">
            <b-form
              :data-vv-scope="'FormScope_' + 1 + '_' + 1"
              :data-vv-value-path="'FormScope_' + 1 + '_' + 1"
            >
              <b-row>
                <b-col md="12">
                  <b-row>
                    <b-col md="12">
                      <span>
                        <label>To :</label>
                      </span>
                      <ACCTextBox :prop="PI_to" v-model="M_Quotation.to" ref="ref_to" />
                    </b-col>
                  </b-row>
                  <b-row>
                    <b-col md="12">
                      <span>
                        <label>CC :</label>
                      </span>
                      <ACCTextBox :prop="PI_cc" v-model="M_Quotation.cc" ref="ref_cc" />
                    </b-col>
                  </b-row>
                  <b-row>
                    <b-col md="12">
                      <span>
                        <label>Subject :</label>
                      </span>
                      <ACCTextBox
                        :prop="PI_subject"
                        v-model="M_Quotation.subject"
                        ref="ref_subject"
                      />
                    </b-col>
                  </b-row>
                  <b-row>
                    <b-col md="12">
                      <span>
                        <label>Body Message</label>
                      </span>
                      <ACCTextArea :prop="PI_body" v-model="M_Quotation.body" ref="ref_body" />
                    </b-col>
                  </b-row>
                  <b-row style="margin-top: 10px;">
                    <b-col md="12">
                      <ABSButton
                        :text="'Send'"
                        classButton="btn btn--default"
                        classIcon="icon-style-1"
                        @click="doSendEmail"
                        styleButton="height: 40px;width: 100%;"
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

    <!-- Modal Chat -->
    <ABSModal id="Modal_Chat" ref="Modal_Chat" size="sm">
      <template slot="headerTitle">Live Chat</template>
      <template slot="content">
        <b-row>
          <b-col md="12">
            <b-form
              :data-vv-scope="'FormScope_' + 1 + '_' + 1"
              :data-vv-value-path="'FormScope_' + 1 + '_' + 1"
            >
              <b-row>
                <b-col md="12">
                  <b-row>
                    <b-col md="12">
                      <span>
                        <label>Document :</label>
                      </span>
                      <ACCTextBox
                        :prop="PI_document"
                        v-model="M_Quotation.document"
                        ref="ref_document"
                      />
                    </b-col>
                  </b-row>
                  <b-row>
                    <b-col md="12">
                      <span>
                        <label>Document No :</label>
                      </span>
                      <ACCTextBox :prop="PI_doc_no" v-model="M_Quotation.doc_no" ref="ref_doc_no" />
                    </b-col>
                  </b-row>
                  <b-row>
                    <b-col md="12">
                      <span>
                        <label>Chat To :</label>
                      </span>
                      <ACCLookUp
                        @change="Onchat_toChange"
                        :prop="PI_chat_to"
                        v-model="M_Quotation.chat_to"
                        :label="M_Quotation.chat_toLabel"
                        ref="ref_chat_to"
                      />
                    </b-col>
                  </b-row>

                  <b-row style="margin-top: 10px;">
                    <b-col md="12">
                      <ABSButton
                        :text="'Start Chat'"
                        classButton="btn btn--default"
                        classIcon="icon-style-1"
                        @click="doStartChat"
                        styleButton="height: 40px;width: 100%;"
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

    <iframe
      name="print_frame"
      id="print_frame"
      width="0"
      height="0"
      frameborder="0"
      src="about:blank"
    ></iframe>
  </div>
</template>

<script>
export default {
  data() {
    return {
      is_hide_button: true,
      isShow: true,
      M_Quotation: {
        customer: "",
        fulladdress: "",
        address: "",
        phone_no: "",
        email: "",
        website: "",
        pic: "",
        pic_phone_no: "",
        date: "",
        type: "",
        quotation_no: "",
        project_name: "",
        descs: "",
        project_value: "",
        date: "",
        date2: "",
        extra_charge: "",
        overnight_charge: "",
        reason_cd: "",
        reasonCdLabel: "",
        reason_descs: "",
        to: "",
        cc: "",
        subject: "",
        body: "",
        chat_to: "",
        chat_toLabel: ""
      },
      PI_reason_cd: {
        dataLookUp: {
          LookUpCd: "GetCmReason",
          ColumnDB: "reason_cd",
          InitialWhere: "",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "reason_cd,descs,time_edit"
        },
        cValidate: "",
        cName: "reason_cd",
        ckey: false,
        cOrder: 3,
        cProtect: false,
        cParentForm: "",
        cStatic: false,
        cOption: [],
        cDisplayColumn: "reason_cd,descs",
        cInputStatus: this.inputStatus
      },
      PI_reason_descs: {
        cValidate: "",
        cName: "reason_descs",
        cOrder: 2,
        cKey: false,
        cProtect: false,
        cResize: false,
        cReadonly: false,
        cRows: 1,
        cMaxRows: 2,
        cSize: "md",
        cParentForm: "",
        cInputStatus: this.inputStatus
      },
      PI_to: {
        cValidate: "",
        cName: "to",
        cOrder: 12,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_cc: {
        cValidate: "",
        cName: "cc",
        cOrder: 12,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_subject: {
        cValidate: "",
        cName: "subject",
        cOrder: 12,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_body: {
        cValidate: "",
        cName: "body",
        cOrder: 2,
        cKey: false,
        cProtect: false,
        cResize: false,
        cReadonly: false,
        cRows: 10,
        cMaxRows: 10,
        cSize: "md",
        cParentForm: "",
        cInputStatus: this.inputStatus,
        cStyle: "text-align: justify;"
      },
      PI_document: {
        cValidate: "",
        cName: "document",
        cOrder: 12,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_doc_no: {
        cValidate: "",
        cName: "doc_no",
        cOrder: 12,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_chat_to: {
        dataLookUp: {
          LookUpCd: "GetUser",
          ColumnDB: "ss_user_id",
          InitialWhere: "",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "user_id,user_name,time_edit"
        },
        cValidate: "required",
        cName: "chat_to",
        ckey: false,
        cOrder: 1,
        cProtect: false,
        cParentForm: "MK_AddQuotation",
        cStatic: false,
        cOption: [],
        cDisplayColumn: "user_id,user_name,time_edit",
        cInputStatus: this.inputStatus
      },
      PI_logbook_descs: {
        cValidate: "",
        cName: "logbook_descs",
        cOrder: 1,
        cKey: false,
        cProtect: false,
        cResize: false,
        cReadonly: false,
        cRows: 1,
        cMaxRows: 2,
        cSize: "md",
        cParentForm: "Frm_Logbook",
        cInputStatus: "new"
      },
      M_LogBook: {
        descs: ""
      },
      AllData: {},
      responses: {},
      FTLHeader: [
        {
          key: "no",
          label: "No",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 th-cus-center"
        },
        {
          key: "from_address",
          label: "From",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center"
        },
        {
          key: "to_address",
          label: "To",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center"
        },
        {
          key: "fleet_type_descs",
          label: "Vehicle Type",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center"
        },
        {
          key: "price_amt",
          label: "Price",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center"
        }
      ],
      FTLItems: [],
      LTLHeader: [
        {
          key: "no",
          label: "No",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 th-cus-center"
        },
        {
          key: "from_address",
          label: "From",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center"
        },
        {
          key: "to_address",
          label: "To",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center"
        },
        {
          key: "kgs_price_amt",
          label: "KGS Price",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center"
        },
        {
          key: "cbm_price_amt",
          label: "CBM Price",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center"
        }
      ],
      LTLItems: [],
      RentalHeader: [
        {
          key: "no",
          label: "No",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 th-cus-center"
        },
        {
          key: "fleet_type_descs",
          label: "Vehicle Type",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center"
        },
        {
          key: "include_driver_status",
          label: "Include Driver",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center"
        },
        {
          key: "price_amt",
          label: "Price",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center"
        }
      ],
      RentalItems: [],
      ProjectHeader: [
        {
          key: "no",
          label: "No",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 th-cus-center"
        },
        {
          key: "from_address",
          label: "From",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center"
        },
        {
          key: "to_address",
          label: "To",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center"
        },
        {
          key: "charge_by",
          label: "Charge By",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center"
        },
        {
          key: "price_amt",
          label: "Price",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center"
        }
      ],
      ProjectItems: [],
      DocHeader: [
        {
          key: "no",
          label: "No",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 th-cus-center"
        },
        {
          key: "dokument_type",
          label: "Type",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center"
        },
        {
          key: "descs",
          label: "Description",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 M th-cus-center"
        }
      ],
      DocItems: [],
      LogBookHeader: [
        {
          key: "no",
          label: "No",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 th-cus-center"
        },
        {
          key: "logbook_date",
          label: "Date",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center"
        },
        {
          key: "descs",
          label: "Description",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 M th-cus-center"
        }
      ],
      LogBookItems: []
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
    ButtonStatus() {
      return this.$store.getters.getButtonStatus;
    }
  },
  methods: {
    doDelete() {
      this.addStatus = true;
      this.$refs.Modal_MK_Quotation._show();
    },
    doPrint() {
      window.frames[
        "print_frame"
      ].document.body.innerHTML = document.getElementById("forPrint").innerHTML;
      window.frames["print_frame"].window.focus();
      window.frames["print_frame"].window.print();
    },
    doEmail() {
      this.$refs.Modal_Email._show();
    },
    doSendEmail() {
      var bodyMessage =
        this.M_Quotation.customer +
        "\n\n" +
        this.M_Quotation.fulladdress +
        "\n" +
        "Phone : " +
        this.M_Quotation.phone_no +
        ", Email: " +
        this.M_Quotation.email +
        ", Website : " +
        this.M_Quotation.website +
        "\n" +
        "PIC : " +
        this.M_Quotation.pic +
        ", PIC Phone : " +
        this.M_Quotation.pic_phone_no +
        "\n\n" +
        "Date &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Type &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Quotation Number" +
        "\n" +
        this.M_Quotation.date +
        "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
        this.M_Quotation.type +
        "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
        this.M_Quotation.quotation_no +
        "\n\n" +
        this.M_Quotation.project_name +
        "\n" +
        this.M_Quotation.descs +
        "\n\n" +
        "Project Value : Rp. " +
        this.M_Quotation.project_value +
        "\n" +
        "Valid Until      : " +
        this.M_Quotation.date2;

      var param = {
        portfolio_id: this.getDataUser().portfolio_id,
        subportfolio_id: this.getDataUser().subportfolio_id,
        to: this.M_Quotation.to,
        cc: this.M_Quotation.cc,
        subject: this.M_Quotation.subject,
        body: this.replaceAllString(bodyMessage, "\n", "<br>", "string"),
        doc_type: "Q",
        doc_no: this.M_Quotation.quotation_no,
        user_id: this.getDataUser().user_id
      };

      this.postJSON(this.sendEmail(), param).then(response => {
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          // this.M_ClearForm_Email();
          this.$refs.Modal_Email._hide();
          // this.doBack();
        });
      });
    },
    // Delete
    NoDelete() {
      this.$refs.Modal_MK_Quotation._hide();
    },
    YesDelete() {
      var param = {
        option_url: "/MK/MK_Quotation",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };

      this.deleteJSON(this.getUrlCRUD(), param).then(response => {
        if (response == null) return;
        this.alertSuccess("Data Has Been Deleted").then(() => {
          this.$refs.Modal_MK_Quotation._hide();
          this.doBack();
        });
      });
    },
    OnReasonChange(data) {
      this.$nextTick(() => {
        this.M_Quotation.reason_cd = data.reason_cd;
        this.M_Quotation.reasonCdLabel = data.label;
        this.M_Quotation.reason_descs = data.descs;
      });
    },
    Onchat_toChange(data) {
      this.$nextTick(() => {
        this.M_Quotation.chat_to = data.user_id;
        this.M_Quotation.chat_toLabel = data.user_name;
      });
    },
    doStartChat() {
      //saveHeader
      var paramSaveH = {
        portfolio_id: this.getDataUser().portfolio_id,
        subportfolio_id: this.getDataUser().subportfolio_id,
        subject: "Quotation No. " + this.M_Quotation.doc_no,
        user_id_to: this.M_Quotation.chat_to,
        user_id_from: this.getDataUser().user_id,
        doc_type: "quotation",
        doc_no: this.M_Quotation.doc_no,
        current_page: 0,
        user_input: this.getDataUser().user_id
      };

      this.postJSON(this.getUrlSaveHeaderChat(), paramSaveH).then(response => {
        // response from API
        if (response == null) return;
        var url = "MK_ChatQuotation";
        if (!url || url == "" || url == undefined) return;
        var param = {
          isEdit: false,
          dataList: this.paramFromList,
          chatFill: []
        };
        this.$store.commit("setParamPage", param);
        this.$router.push({ name: url });
      });
    },
    // Modal End
    doChat() {
      var param = {
        portfolio_id: this.getDataUser().portfolio_id,
        subportfolio_id: this.getDataUser().subportfolio_id,
        doc_type: "quotation",
        doc_no: this.M_Quotation.quotation_no,
        current_page: 1
      };

      this.postJSON(this.getUrlCheckChat(), param).then(response => {
        // response from API
        if (response == null) return;

        var data = response;
        if (data.Data == null) {
          this.$nextTick(() => {
            this.M_Quotation.doc_no = this.M_Quotation.quotation_no;
          });
          this.$forceUpdate();
          this.$refs.Modal_Chat._show();
        } else {
          var url = "MK_ChatQuotation";
          if (!url || url == "" || url == undefined) return;
          var param = {
            isEdit: false,
            dataList: this.paramFromList
          };
          this.$store.commit("setParamPage", param);
          this.$router.push({ name: url });
        }
      });
    },
    doFTL(record = null) {
      var param = this.paramFromList;
      param.isEdit = record == null ? false : true;
      param.DetailList = record;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "MK_Quotation_ftlForm" });
    },
    doLTL(record) {
      var param = this.paramFromList;
      param.isEdit = record == null ? false : true;
      param.DetailList = record;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "MK_Quotation_ltlForm" });
    },
    doRental(record) {
      var param = this.paramFromList;
      param.isEdit = record == null ? false : true;
      param.DetailList = record;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "MK_Quotation_rentalForm" });
    },
    doProject(record) {
      var param = this.paramFromList;
      param.isEdit = record == null ? false : true;
      param.DetailList = record;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "MK_Quotation_projectForm" });
    },
    doRequiredDoc(record) {
      var param = this.paramFromList;
      param.isEdit = record == null ? false : true;
      param.DetailList = record;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "MK_Quotation_documentForm" });
    },
    doLogBook(record) {
      var param = this.AllData;
      param.isEdit = record == null ? false : true;
      param.DetailList = record;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "MK_Quotation_logbookForm" });
    },
    doBack() {
      this.$router.go(-1);
    },
    doConfirm() {
      var param = {
        option_url: "/MK/MK_Quotation",
        line_no: 1,
        mk_quotation_id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp,
        user_edit: this.getDataUser().user_id
      };

      this.postJSON(this.getUrlCRUD(), param).then(response => {
        // response from API
        if (response == null) return;
        this.alertSuccess("Confirmation Success").then(() => {
          this.doBack();
        });
      });
    },
    doEdit() {
      var param = this.paramFromList;
      param.isEdit = true;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "MK_AddQuotation" });
    },
    M_ClearForm() {
      this.M_Quotation = {
        customer: "",
        fulladdress: "",
        address: "",
        phone_no: "",
        email: "",
        website: "",
        pic: "",
        pic_phone_no: ""
      };
    },
    GetDataBy() {
      var param = {
        option_url: "/MK/MK_Quotation",
        line_no: 0,
        id: this.is_hide_button
          ? this.paramFromList.row_id
          : this.paramFromList.DetailList.row_id,
        lastupdatestamp: this.is_hide_button
          ? this.paramFromList.lastupdatestamp
          : this.paramFromList.DetailList.lastupdatestamp
      };

      this.getJSON(this.getUrlCRUD(), param).then(response => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];

        this.AllData = data;

        this.M_Quotation = {
          portfolio_id: data.ss_portfolio_id,
          customer: data.name,
          fulladdress: data.address,
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
          type: data.type && data.type !== "" ? data.type : "-",
          quotation_no:
            data.quotation_no && data.quotation_no !== ""
              ? data.quotation_no
              : "-",
          project_name:
            data.project_name && data.project_name !== ""
              ? data.project_name
              : "-",
          descs: data.descs && data.descs !== "" ? data.descs : "-",
          project_value:
            data.project_value && data.project_value !== ""
              ? this.isCurrency(data.project_value, this.decimal)
              : "-",
          date:
            data.start_date && data.start_date !== ""
              ? this.momentDateFormatting(
                  new Date(data.start_date),
                  "DD-MMM-YYYY"
                )
              : "-",
          date2:
            data.expired_date && data.expired_date !== ""
              ? this.momentDateFormatting(
                  new Date(data.expired_date),
                  "DD-MMM-YYYY"
                )
              : "-",
          status: data.status == "P" ? "Proposed" : "Pending",
          extra_charge: this.isCurrency(
            data.extra_pick_drop_charges,
            this.decimal
          ),
          overnight_charge: this.isCurrency(
            data.over_night_charges,
            this.decimal
          )
        };

        if (data.status == "P") {
          this.isShow = false
        }
        else {
          this.isShow = true
        }

        this.M_Quotation.body =
          this.M_Quotation.customer +
          "\n\n" +
          this.M_Quotation.fulladdress +
          "\n" +
          "Phone : " +
          this.M_Quotation.phone_no +
          ", Email: " +
          this.M_Quotation.email +
          ", Website : " +
          this.M_Quotation.website +
          "\n" +
          "PIC : " +
          this.M_Quotation.pic +
          ", PIC Phone : " +
          this.M_Quotation.pic_phone_no +
          "\n\n" +
          "Date                            Type                    Quotation Number" +
          "\n" +
          this.M_Quotation.date +
          "        " +
          this.M_Quotation.type +
          "                      " +
          this.M_Quotation.quotation_no +
          "\n\n" +
          this.M_Quotation.project_name +
          "\n" +
          this.M_Quotation.descs +
          "\n\n" +
          "Project Value : Rp. " +
          this.M_Quotation.project_value +
          "\n" +
          "Valid Until      : " +
          this.M_Quotation.date2;

        this.GetFTLList();
        this.GetLTLList();
        this.GetRentalList();
        this.GetProjectList();
        this.GetDocList();
        this.GetLogBookList();
      });
    },
    GetFTLList() {
      var param = {
        option_function_cd: "GetListMkQuotFTL",
        module_cd: "MK",
        row_id: this.paramFromList.row_id
      };

      this.CallFunction(param).then(response => {
        if (response == null) return;
        var data = response.Data;

        this.FTLItems = data;
      });
    },
    GetLTLList() {
      var param = {
        option_function_cd: "GetListMkQuotLTL",
        module_cd: "MK",
        row_id: this.paramFromList.row_id
      };

      this.CallFunction(param).then(response => {
        if (response == null) return;
        var data = response.Data;

        this.LTLItems = data;
      });
    },
    GetRentalList() {
      var param = {
        option_function_cd: "GetListMkQuotRental",
        module_cd: "MK",
        row_id: this.paramFromList.row_id
      };

      this.CallFunction(param).then(response => {
        if (response == null) return;
        var data = response.Data;

        this.RentalItems = data;
      });
    },
    GetProjectList() {
      var param = {
        option_function_cd: "GetListMkQuotProject",
        module_cd: "MK",
        row_id: this.paramFromList.row_id
      };

      this.CallFunction(param).then(response => {
        if (response == null) return;
        var data = response.Data;

        this.ProjectItems = data;
      });
    },
    GetDocList() {
      var param = {
        option_function_cd: "GetListMkQuotDocument",
        module_cd: "MK",
        row_id: this.paramFromList.row_id
      };

      this.CallFunction(param).then(response => {
        if (response == null) return;
        var data = response.Data;

        this.DocItems = data;
      });
    },
    GetLogBookList() {
      var param = {
        option_url: "/MK/MK_Quotation",
        line_no: 2,
        user_id: this.getDataUser().user_id,
        portfolio_id: this.getDataUser().portfolio_id,
        subportfolio_id: this.getDataUser().subportfolio_id,
        current_page: 1,
        per_page: 1000,
        param_where: "",
        initial_where: " ss_portfolio_id = '" + this.M_Quotation.portfolio_id + "' AND referance_no = '" + this.M_Quotation.quotation_no + "'",
        sort_field: "",
        source_field: "",
        param_view: ""
      };

      this.postJSON(this.getUrlList(), param).then(response => {
        if (response == null) return;
        this.responses = response;
        // console.log(this.cmbMarketing, ix)
        // this.LogBookItems = [];
        // this.LogBookHeader = [];
        this.LogBookItems = this.responses.Data;
      });
    }
  },
  mounted() {
    if (this.paramFromList.FromCustomer) {
      this.is_hide_button = false;
    } else {
      this.is_hide_button = true;
    }
    this.M_ClearForm();
    this.GetDataBy();
  }
};
</script>

<style>
</style>