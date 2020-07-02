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
                    :text="'FTL'"
                    classButton="button button--back"
                    classIcon="icon-style-1"
                    @click="doFTL"
                  />
                  <ABSButton
                    :text="'LTL'"
                    classButton="button button--back"
                    classIcon="icon-style-1"
                    @click="doLTL"
                  />
                  <ABSButton
                    :text="'Rental'"
                    classButton="button button--back"
                    classIcon="icon-style-1"
                    @click="doRental"
                  />
                  <ABSButton
                    :text="'Project'"
                    classButton="button button--back"
                    classIcon="icon-style-1"
                    @click="doProject"
                  />
                  <ABSButton
                    :text="'Required Doc'"
                    classButton="button button--back"
                    classIcon="icon-style-1"
                    @click="doRequiredDoc"
                  />
                  <ABSButton
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
                                size="sm"
                              />
                              &nbsp;
                              {{ M_Quotation.fulladdress }}
                            </span>
                            <br />
                            <span>
                              <font-awesome-icon
                                class="icon-style-default"
                                icon="phone-square-alt"
                                size="sm"
                              />
                              {{ M_Quotation.phone_no }}
                            </span> &nbsp;
                            <span>
                              <font-awesome-icon
                                class="icon-style-default"
                                icon="globe-americas"
                                size="sm"
                              />
                              {{ M_Quotation.website }}
                            </span>
                            <br />
                            <span>
                              <font-awesome-icon class="icon-style-default" icon="user" size="sm" />
                              {{ M_Quotation.pic }}
                            </span> &nbsp;
                            <span>
                              <font-awesome-icon
                                class="icon-style-default"
                                icon="phone-square-alt"
                                size="sm"
                              />
                              {{ M_Quotation.pic_phone_no }}
                            </span> &nbsp;
                            <span>
                              <font-awesome-icon
                                class="icon-style-default"
                                icon="envelope"
                                size="sm"
                              />
                              {{ M_Quotation.email }}
                            </span> &nbsp;
                          </b-col>
                        </b-row>
                      </b-col>
                      <b-col style="text-align: right; margin-top: 10px;">
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
                          />
                        </span>
                        <span>
                          <ABSButton
                            :text="'Edit'"
                            classButton="btn btn--default"
                            classIcon="icon-style-1"
                            @click="doEdit"
                            :disabled="!ButtonStatus.btnEdit"
                          />
                        </span>
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
                        style="max-width: fit-content !important; margin-right: 20px; border-bottom: solid 2px rgb(153, 153, 153);"
                      >
                        <span>
                          <label style="margin-bottom: 0px !important;">Quotation Number</label>
                        </span>
                        <br />
                        <span style="color: #999999;">{{ M_Quotation.quotation_no }}</span>
                      </b-col>
                      <b-col
                        style="max-width: fit-content !important; margin-right: 20px; border-bottom: solid 2px rgb(153, 153, 153);"
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
                        style="max-width: fit-content !important; margin-right: 20px; border-bottom: solid 2px rgb(153, 153, 153);"
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
                        style="max-width: fit-content !important; margin-right: 20px; border-bottom: solid 2px rgb(153, 153, 153);"
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
                        style="max-width: fit-content !important; margin-right: 20px; border-bottom: solid 2px rgb(153, 153, 153);"
                      >
                        <span>
                          <label style="margin-bottom: 0px !important;">Description</label>
                        </span>
                        <br />
                        <span style="color: #999999;">{{ M_Quotation.descs }}</span>
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col
                        style="max-width: fit-content !important; margin-right: 20px; border-bottom: solid 2px rgb(153, 153, 153);"
                      >
                        <span>
                          <label style="margin-bottom: 0px !important;">Extra Pick/Drop Charges</label>
                        </span>
                        <br />
                        <span style="color: #999999;">{{ M_Quotation.extra_charge }}</span>
                      </b-col>
                      <b-col
                        style="max-width: fit-content !important; margin-right: 20px; border-bottom: solid 2px rgb(153, 153, 153);"
                      >
                        <span>
                          <label style="margin-bottom: 0px !important;">Over Night Charges</label>
                        </span>
                        <br />
                        <span style="color: #999999;">{{ M_Quotation.overnight_charge }}</span>
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col>
                        <ABSButton
                          :text="'Proposed'"
                          classButton="btn btn--default"
                          classIcon="icon-style-1"
                          size="6x"
                          @click="doConfirm"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col>
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
                          ></b-table>
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
                  icon="envelope"
                  size="sm"
                />
                {{ M_Quotation.email }}
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
        <!-- <div> -->
        <b-col
          md="3"
          style="-webkit-box-flex: 0; flex: 0 0 25%; max-width: 25%; position: relative; width: 100%"
        >
          <span>
            <label style="color: #999999; margin-bottom: 0px !important;">Date</label>
          </span>
          <br />
          <span>{{ M_Quotation.date }}</span>
        </b-col>
        <b-col
          md="3"
          style="-webkit-box-flex: 0; flex: 0 0 25%; max-width: 25%; position: relative; width: 100%"
        >
          <span>
            <label style="color: #999999; margin-bottom: 0px !important;">Type</label>
          </span>
          <br />
          <span>{{ M_Quotation.type }}</span>
        </b-col>
        <b-col
          md="3"
          style="-webkit-box-flex: 0; flex: 0 0 25%; max-width: 25%; position: relative; width: 100%"
        >
          <span>
            <label style="color: #999999; margin-bottom: 0px !important;">Quotation Number</label>
          </span>
          <br />
          <span>{{ M_Quotation.quotation_no }}</span>
        </b-col>
        <!-- </div> -->
      </b-row>
      <b-row
        style="margin-top: 10px !important; margin-bottom: 10px !important; font-size: 15px !important"
      >
        <b-col>
          <span>{{ M_Quotation.project_name }}</span>
        </b-col>
      </b-row>
      <b-row style="margin-bottom: 10px; !important">
        <b-col style="text-align: justify;">
          <span>{{ M_Quotation.descs }}</span>
        </b-col>
      </b-row>
      <b-row
        style="display: flex; flex-wrap: wrap; margin-right: unset !important; margin-left: unset !important;"
      >
        <b-col
          style="-webkit-box-flex: 0; flex: 0 0 20%; max-width: 20%; position: relative; width: 20%"
        >
          <span>
            <font-awesome-icon
              style="color: #333399;font-size: 0.875em;width: 0.75em;"
              icon="coins"
              size="sm"
            />&nbsp;
            <label>Project Value</label>
          </span>
        </b-col>
        <b-col
          style="-webkit-box-flex: 0; flex: 0 0 80%; max-width: 80%; position: relative; width: 80%"
        >
          <span>: Rp {{ M_Quotation.project_value }}</span>
        </b-col>
      </b-row>
      <b-row
        style="display: flex; flex-wrap: wrap; margin-right: unset !important; margin-left: unset !important;"
      >
        <b-col
          style="-webkit-box-flex: 0; flex: 0 0 20%; max-width: 20%; position: relative; width: 20%"
        >
          <span>
            <font-awesome-icon
              style="color: #333399;font-size: 0.875em;width: 0.75em;"
              icon="calendar-alt"
              size="sm"
            />&nbsp;
            <label>Valid Until</label>
          </span>
        </b-col>
        <b-col
          style="-webkit-box-flex: 0; flex: 0 0 80%; max-width: 80%; position: relative; width: 80%"
        >
          <span>: {{ M_Quotation.valid_until }}</span>
        </b-col>
      </b-row>
    </div>

    <!-- Modal Reason -->
    <ABSModal id="Modal_MK_Quotation" ref="Modal_MK_Quotation" size="sm">
      <template slot="headerTitle">Cancel Quotation</template>
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
                        <label>Reason</label>
                      </span>
                      <ACCLookUp
                        @change="OnReasonChange"
                        :prop="PI_reason_cd"
                        v-model="M_Quotation.reason_cd"
                        :label="M_Quotation.reasonCdLabel"
                        ref="ref_reason_cd"
                      />
                    </b-col>
                  </b-row>
                  <b-row>
                    <b-col md="12">
                      <span>
                        <label>Description</label>
                      </span>
                      <ACCTextArea
                        :prop="PI_reason_descs"
                        v-model="M_Quotation.reason_descs"
                        ref="ref_reason_descs"
                      />
                    </b-col>
                  </b-row>
                  <b-row style="margin-top: 10px;">
                    <b-col md="12">
                      <ABSButton
                        :text="'Save'"
                        classButton="btn btn--default"
                        classIcon="icon-style-1"
                        @click="doSaveReason"
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

    <!-- Modal LogBook -->
    <ABSModal id="Modal_LogBook" ref="Modal_LogBook" size="sm">
      <template slot="headerTitle">Add New Log Book</template>
      <template slot="content">
        <b-row>
          <b-col md="12">
            <b-form :data-vv-scope="'Frm_Logbook'" :data-vv-value-path="'Frm_Logbook'">
              <b-row>
                <b-col md="12">
                  <b-row>
                    <b-col md="12">
                      <span>
                        <label>Description</label>
                      </span>
                      <ACCTextArea
                        :prop="PI_logbook_descs"
                        v-model="M_LogBook.descs"
                        ref="ref_logbook_descs"
                      />
                    </b-col>
                  </b-row>

                  <b-row style="margin-top: 10px;">
                    <b-col md="12">
                      <ABSButton
                        :text="'Save'"
                        classButton="btn btn--default"
                        classIcon="icon-style-1"
                        @click="saveLogBook"
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
        valid_until: "",
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
        // cDefault: '',
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
      LogBookHeader: [
        // {
        //   value: 1,
        //   key: "logbook_date",
        //   thClass: thClass,
        //   tdClass: tdClass,
        //   label: "Date"
        // },
        // {
        //   value: 2,
        //   key: "descs",
        //   thClass: thClass,
        //   tdClass: tdClass,
        //   label: "Description"
        // }
      ],
      LogBookItems: []
    };
  },
  computed: {
    paramFromList() {
      var param = this.$route.params;
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
    // Modal Start
    // Email
    doDelete() {
      this.addStatus = true;
      // this.M_ClearForm();
      this.$refs.Modal_MK_Quotation._show();
    },
    doPrint() {
      // $('#forPrint').printThis();
      // $('#print_frame').printThis();
      window.frames[
        "print_frame"
      ].document.body.innerHTML = document.getElementById("forPrint").innerHTML;
      window.frames["print_frame"].window.focus();
      window.frames["print_frame"].window.print();
    },
    doEmail() {
      // this.addStatus = true;
      // this.M_ClearForm();
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
        this.M_Quotation.valid_until;

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
    // Reason
    doSaveReason() {
      var param = {
        option_url: "/MK/MK_Quotation",
        line_no: 1,
        mk_quotation_id: this.paramFromList.row_id,
        reason_cd: this.M_Quotation.reason_cd,
        reason_descs: this.M_Quotation.reason_descs,
        lastupdatestamp: this.paramFromList.lastupdatestamp,
        user_edit: this.getDataUser().user_id
      };

      this.putJSON(this.getUrlCRUD(), param).then(response => {
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
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
        this.$router.push({ name: url, params: param });
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
          this.$router.push({ name: url, params: param });
        }
      });
    },
    doFTL() {
      var param = this.paramFromList;
      param.isEdit = false;
      this.$router.push({ name: "MK_Quotation_ftlForm", params: param });
    },
    doLTL() {
      var param = this.paramFromList;
      param.isEdit = false;
      this.$router.push({ name: "MK_Quotation_ltlForm", params: param });
    },
    doRental() {
      var param = this.paramFromList;
      param.isEdit = false;
      this.$router.push({ name: "MK_Quotation_rentalForm", params: param });
    },
    doProject() {
      var param = this.paramFromList;
      param.isEdit = false;
      this.$router.push({ name: "MK_Quotation_projectForm", params: param });
    },
    doRequiredDoc() {
      var param = this.paramFromList;
      param.isEdit = false;
      this.$router.push({ name: "MK_Quotation_documentForm", params: param });
    },
    doLogBook() {
      var param = this.paramFromList;
      param.isEdit = false;
      this.$router.push({ name: "MK_Quotation_logbookForm", params: param });
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
    newLogBook() {
      this.$refs.Modal_LogBook._show();
    },
    saveLogBook() {
      var param = {
        option_url: "/MK/MK_Quotation",
        line_no: 2,
        ss_portfolio_id: this.AllData.ss_portfolio_id,
        logbook_type: this.AllData.quotation_type,
        referance_no: this.AllData.quotation_no,
        logbook_date: this.momentDateFormatting(new Date(), "YYYY-MM-DD HH:mm"),
        descs: this.M_LogBook.descs,
        cm_contact_id: this.AllData.cm_contact_id,
        cm_contact_person_id: "NULL",
        action_type: "",
        meeting_address: "",
        user_input: this.getDataUser().user_id
      };

      this.postJSON(this.getUrlCRUD(), param).then(response => {
        // response from API
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          this.M_LogBook.descs = "";
          this.$refs.Modal_LogBook._hide();
          this.GetLogBookList();
        });
      });
    },
    doEdit() {
      var param = this.paramFromList;
      param.isEdit = true;
      this.$router.push({ name: "MK_AddQuotation", params: param });
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
    M_ClearForm_Email() {
      this.M_Quotation = {
        to: "",
        cc: "",
        subject: "",
        body: ""
      };
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

        this.AllData = data;

        this.M_Quotation = {
          customer: data.name,
          fulladdress:
            data.address + data.district && data.district !== ""
              ? ", " + data.district
              : "" + data.city && data.city !== ""
              ? ", " + data.city
              : "" + data.province && data.province !== ""
              ? ", " + data.province
              : "" + data.country && data.country !== ""
              ? ", " + data.country
              : "",
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
          date:
            data.quotation_date && data.quotation_date !== ""
              ? this.momentDateFormatting(
                  new Date(data.quotation_date),
                  "DD-MM-YYYY HH.mm"
                )
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
          valid_until:
            data.expired_date && data.expired_date !== ""
              ? this.momentDateFormatting(
                  new Date(data.expired_date),
                  "DD-MM-YYYY"
                )
              : "-"
        };
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
          this.M_Quotation.valid_until;

        this.GetLogBookList();
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
        per_page: 5,
        param_where: "",
        initial_where: "",
        sort_field: "",
        source_field: "",
        param_view: ""
      };

      this.postJSON(this.getUrlList(), param).then(response => {
        if (response == null) return;
        this.responses = response;
        // console.log(this.cmbMarketing, ix)
        this.LogBookItems = [];
        this.LogBookHeader = [];
        this.LogBookItems = this.responses.Data;

        var str_array =
          this.responses.DefineColumn && this.responses.DefineColumn !== ""
            ? this.responses.DefineColumn.split(",")
            : this.responses.AllColumn.split(",");
        var x = "S,L";
        // var defineSize = this.responses.DefineSize.split(",");
        var defineSize = x.split(",");

        // this.allColumn_bf = this.responses.AllColumn.split(",");
        // var index = this.allColumn_bf.indexOf("lastupdatestamp");
        // if (index > -1) {
        //   this.allColumn_bf.splice(index, 1);
        // }
        var allColumn = [];
        var filteredColumn = [];
        var definedColumn = [];

        // this.allColumn_bf.forEach((val, idx) => {
        //   var thClass = "HeaderACCList2";
        //   var isSorted = this.sortedField.map(x => x.field).indexOf(val);
        //   if (isSorted > -1) {
        //     if (this.sortedField[isSorted].sort == "ASC") {
        //       thClass = thClass + " AscSorted";
        //     } else {
        //       thClass = thClass + " DescSorted";
        //     }
        //   }

        //   allColumn.push({
        //     value: idx + 1,
        //     key: val,
        //     thClass: thClass,
        //     tdClass: "ContentACCList2 notranslate",
        //     text: val
        //   });

        //   filteredColumn.push({
        //     value: idx + 1,
        //     key: val,
        //     thClass: thClass,
        //     tdClass: "ContentACCList2 notranslate"
        //   });
        // });

        for (var i = 0; i < str_array.length; i++) {
          filteredColumn = filteredColumn.filter(val => {
            if (val.key == str_array[i]) {
              definedColumn.push({
                value: val.value,
                key: val.key,
                thClass: val.thClass,
                tdClass: val.tdClass,
                text: val.key
              });
            }

            return val.key != str_array[i];
          });

          var thClass = "HeaderACCList2 ";
          if (str_array[i] !== "no") {
            thClass += defineSize[i];
          }

          var tdClass = "ContentACCList2 notranslate";
          if (
            str_array[i].toLowerCase().includes("amount") ||
            str_array[i].toLowerCase().includes("amt") ||
            str_array[i].toLowerCase().includes("rate") ||
            str_array[i].toLowerCase().includes("price")
          ) {
            tdClass = "ABStdClassList2 notranslate";
            thClass = "ABSthClassList2";
          } else if (str_array[i].toLowerCase() == "target") {
            thClass += " th-cus-center";
            tdClass += " td-cus-center";
          }

          // var isSorted = this.sortedField
          //   .map(x => x.field)
          //   .indexOf(str_array[i]);
          // if (isSorted > -1) {
          //   if (this.sortedField[isSorted].sort == "ASC") {
          //     thClass = thClass + " AscSorted";
          //   } else {
          //     thClass = thClass + " DescSorted";
          //   }
          // }

          if (this.languageStatus) {
            this.LogBookHeader.push({
              value: i + 1,
              key: str_array[i],
              thClass: thClass,
              tdClass: tdClass,
              label: this.$t(str_array[i])
            });
          } else {
            if (str_array[i] == "lastupdatestamp") continue;

            var listReplace = [
              {
                key: "_",
                value: " "
              },
              {
                key: "Amt",
                value: " Amount"
              },
              {
                key: "Cd",
                value: " Code"
              },
              {
                key: "Descs",
                value: " Description"
              },
              {
                key: "Time Edit",
                value: "Last Update"
              },
              {
                key: "Batch Status",
                value: "Status"
              },
              {
                key: "garing",
                value: "/"
              },
              {
                key: "titik",
                value: "."
              },
              {
                key: "SnP",
                value: "SnP "
              },
              {
                key: "VO",
                value: "VO "
              },
              {
                key: "Quotation Date",
                value: "Date"
              },
              {
                key: "Row Id",
                value: "View"
              }
            ];
            var isGotIt = false;
            var labelHeader = undefined;

            if (str_array[i].includes("_")) {
              labelHeader = str_array[i]
                .toLowerCase()
                .split("_")
                .map(s => {
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

            this.LogBookHeader.push({
              value: i + 1,
              key: str_array[i],
              thClass: thClass,
              tdClass: tdClass,
              label: labelHeader
            });
          }
        }
      });
    }
  },
  mounted() {
    this.M_ClearForm();
    this.GetDataBy();
  }
};
</script>

<style>
</style>