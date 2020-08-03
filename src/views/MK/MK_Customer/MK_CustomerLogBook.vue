<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Log Book</span>
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
                :data-vv-scope="'MK_EditAppointment'"
                :data-vv-value-path="'MK_EditAppointment'"
              >
                <b-row>
                  <b-col md="2" style="text-align: center;">
                    <img :src="require('@/assets/list.png')" alt style="width: 100px;" />
                  </b-col>
                  <b-col md="10">
                    <b-row>
                      <b-col>
                        <span>{{ M_Dt_Appointment.name }}</span>
                        <br />
                        <span>
                          <font-awesome-icon
                            class="icon-style-default"
                            icon="map-marker-alt"
                            size="sm"
                          />
                          &nbsp;
                          {{ M_Dt_Appointment.address }}
                        </span>
                        <br />
                        <span>
                          <font-awesome-icon
                            class="icon-style-default"
                            icon="phone-square-alt"
                            size="sm"
                          />
                          {{ M_Dt_Appointment.phone_no }}
                        </span> &nbsp;
                        <span>
                          <font-awesome-icon class="icon-style-default" icon="envelope" size="sm" />
                          {{ M_Dt_Appointment.email }}
                        </span> &nbsp;
                        <span>
                          <font-awesome-icon
                            class="icon-style-default"
                            icon="globe-americas"
                            size="sm"
                          />
                          {{ M_Dt_Appointment.website }}
                        </span>
                        <br />
                        <span>
                          <font-awesome-icon class="icon-style-default" icon="user" size="sm" />
                          {{ M_Dt_Appointment.pic }}
                        </span> &nbsp;
                        <span>
                          <font-awesome-icon
                            class="icon-style-default"
                            icon="phone-square-alt"
                            size="sm"
                          />
                          {{ M_Dt_Appointment.pic_phone_no }}
                        </span>
                      </b-col>
                    </b-row>
                    <hr style="border: solid 1px #ced4da;" />
                    <b-row style="margin-top: 10px; margin-bottom: 10px;">
                      <b-col>
                        <span>
                          <font-awesome-icon class="icon-style-default" icon="user" size="lg" />
                          {{'Marketing'}}
                        </span>
                        <br />
                      </b-col>
                    </b-row>
                    <b-row class="my-1" style="margin-top: 5px;">
                      <b-col sm="6">
                        <span>
                          <label>Action</label>
                        </span>
                        <ACCDropDown
                          @change="OnactionChange"
                          :prop="PI_action"
                          v-model="M_Appointment.action"
                          :label="M_Appointment.actionLabel"
                          ref="ref_action"
                        />
                      </b-col>
                      <b-col sm="6">
                        <b-row>
                          <b-col md="6">
                            <span>
                              <label>Last Action Date</label>
                            </span>
                            <br />
                            <span>
                              <label>{{M_Appointment.last_action_date}}</label>
                            </span>
                          </b-col>
                          <b-col md="6">
                            <span>
                              <label>Marketing Name</label>
                            </span>
                            <br />
                            <span>
                              <label>{{M_Appointment.marketing_name}}</label>
                            </span>
                          </b-col>
                        </b-row>
                      </b-col>
                    </b-row>
                    <b-row style="margin-top: 5px;">
                      <b-col md="6">
                        <span>
                          <label>PIC</label>
                        </span>
                        <!-- <ACCTextBox
                          :prop="PI_contact_person"
                          v-model="M_Appointment.contact_person"
                          ref="ref_contact_person"
                        />-->
                        <ACCDropDown
                          @change="Oncontact_personChange"
                          :prop="PI_contact_person"
                          v-model="M_Appointment.contact_person"
                          :label="M_Appointment.contact_personLabel"
                          ref="ref_contact_person"
                        />
                        <ACCTextBox
                          @input="fn_kosong"
                          :prop="PI_contact_person_label"
                          v-model="M_Appointment.contact_person_Label2"
                          ref="mref_contact_person_label2"
                        />
                      </b-col>
                      <b-col md="6">
                        <b-row>
                          <b-col sm="2">
                            <b-button
                              style="background-color: transparent; color: black; border: none;"
                              @click="doAddPIC(1)"
                            >
                              <font-awesome-icon
                                icon="plus-square"
                                class="icon-style-default"
                                style="margin-right: 5px;margin-top: 70%;"
                                size="3x"
                              />
                            </b-button>
                          </b-col>
                          <b-col sm="2">
                            <br />
                            <br />
                            <span>
                              <label>Add PIC</label>
                            </span>
                          </b-col>
                        </b-row>
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="12">
                        <span>
                          <label>Description</label>
                        </span>
                        <ACCTextArea
                          :prop="PI_descs2"
                          v-model="M_Appointment.descs2"
                          ref="ref_descs2"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Co Marketing I</label>
                        </span>
                        <ACCDropDown
                          @change="Onco_marketing1Change"
                          :prop="PI_co_marketing1"
                          v-model="M_Appointment.co_marketing1"
                          :label="M_Appointment.co_marketing1Label"
                          ref="ref_co_marketing1"
                        />
                      </b-col>
                      <b-col md="6">
                        <span>
                          <label>Co Marketing II</label>
                        </span>
                        <ACCDropDown
                          @change="Onco_marketing2Change"
                          :prop="PI_co_marketing2"
                          v-model="M_Appointment.co_marketing2"
                          :label="M_Appointment.co_marketing2Label"
                          ref="ref_co_marketing2"
                        />
                      </b-col>
                    </b-row>
                    <hr style="border: solid 1px #ced4da;" />
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Next Appointment</label>
                        </span>
                        <ACCDropDown
                          @change="Onnext_appointmentChange"
                          :prop="PI_next_appointment"
                          v-model="M_Appointment.next_appointment"
                          :label="M_Appointment.next_appointmentLabel"
                          ref="ref_next_appointment"
                        />
                      </b-col>
                      <b-col md="6">
                        <span>
                          <label>Description</label>
                        </span>
                        <ACCTextArea
                          :prop="PI_descs"
                          v-model="M_Appointment.descs"
                          ref="ref_descs"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Date</label>
                        </span>
                        <ACCDateTime
                          @input="Onappointment_dateChange"
                          :prop="PI_appointment_date"
                          v-model="M_Appointment.nappointment_date"
                          ref="ref_appointment_date"
                        />
                      </b-col>
                    </b-row>
                    <b-row style="margin-top: 5px;">
                      <b-col md="6">
                        <span>
                          <label>PIC</label>
                        </span>
                        <ACCDropDown
                          @change="Oncontact_personChange2"
                          :prop="PI_next_contact_person"
                          v-model="M_Appointment.next_contact_person"
                          :label="M_Appointment.next_contact_personLabel"
                          ref="ref_next_contact_person"
                        />
                      </b-col>
                      <b-col md="6">
                        <b-row>
                          <b-col sm="2">
                            <b-button
                              style="background-color: transparent; color: black; border: none;"
                              @click="doAddPIC(2)"
                            >
                              <font-awesome-icon
                                icon="plus-square"
                                class="icon-style-default"
                                style="margin-right: 5px;margin-top: 70%;"
                                size="3x"
                              />
                            </b-button>
                          </b-col>
                          <b-col sm="2">
                            <br />
                            <br />
                            <span>
                              <label>Add PIC</label>
                            </span>
                          </b-col>
                        </b-row>
                      </b-col>
                    </b-row>
                    <b-row style="margin-top: 10px;">
                      <b-col md="6">
                        <ABSButton
                          :text="'Save'"
                          classButton="btn btn--default"
                          classIcon="icon-style-default"
                          @click="doSave"
                          styleButton="height: 40px;width: 100%;"
                        />
                      </b-col>
                    </b-row>
                    <b-row style="margin-top: 10px;">
                      <b-col>
                        <label style="font-weight: bold; color: #333399;">Log Book</label>
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-table
                        :responsive="true"
                        :striped="false"
                        :bordered="true"
                        :outlined="false"
                        :small="false"
                        :hover="true"
                        :dark="false"
                        :fixed="false"
                        :foot-clone="false"
                        :fields="fieldHeader"
                        :items="items"
                        class="table-sm table-style-3"
                      >
                        <template v-slot:cell(date)="data">
                          <!-- <div v-if="data.item.customer_status == 'N'"> -->
                          <span>{{ data.item.logbook_date }}</span>
                          <!-- </div> -->
                        </template>
                        <template v-slot:cell(pic)="data">
                          <!-- <div v-if="data.item.customer_status == 'N'"> -->
                          <span>{{ data.item.contact_person_name }}</span>
                          <!-- </div> -->
                        </template>
                        <template v-slot:cell(action)="data">
                          <!-- <div v-if="data.item.customer_status == 'N'"> -->
                          <span>
                            <font-awesome-icon
                              class="icon-style-default"
                              :icon="data.item.action_type=='C' ? 'phone-square-alt' : (data.item.action_type=='V' ? 'hand-paper' : 'utensils')"
                              size="lg"
                            />
                            {{ data.item.action }}
                          </span>
                          <!-- </div> -->
                        </template>
                      </b-table>
                    </b-row>
                    <hr />
                    <b-row>
                      <b-col md="6">
                        <b-form inline style="float: left; color: #333;">
                          <label
                            class="font-lbl"
                            style="margin-bottom:0px !important; margin-right:0px !important;"
                          >Page Size</label>
                          <b-form-select
                            id="cmbPerPage"
                            v-model="perPage"
                            v-on:input="doGetList(search, 'pageSize')"
                            :options="pagingData"
                            class="sm-3 mgn-left-10 font-lbl page-size-left"
                            :disabled="isDisableTable"
                          ></b-form-select>
                          of {{ this.totalRows }} Records
                        </b-form>
                      </b-col>
                      <b-col md="6">
                        <b-pagination
                          align="right"
                          v-model="currentPage"
                          @input="doGetList(search, 'pagination')"
                          :total-rows="totalRows"
                          :per-page="perPage"
                          :limit="limit"
                          style="margin-bottom: 0px;"
                          :disabled="isDisableTable"
                        ></b-pagination>
                      </b-col>
                    </b-row>
                  </b-col>
                </b-row>
              </b-form>
              <ABSModal id="Modal_PIC" ref="Modal_PIC" size="md">
                <template slot="headerTitle">Add PIC</template>
                <template slot="content">
                  <b-row>
                    <b-col sm="12">
                      <b-form :data-vv-scope="'Parent_PIC'" :data-vv-value-path="'Parent_PIC'">
                        <b-row>
                          <b-col sm="12">
                            <b-row class="my-1">
                              <b-col sm="2">
                                <span>
                                  <label>Name</label>
                                </span>
                              </b-col>
                              <b-col sm="10">
                                <ACCTextBox
                                  :prop="MForm.PI_contact_person"
                                  v-model="M_Pic.contact_person"
                                  ref="mref_contact_person_modal"
                                />
                              </b-col>
                            </b-row>
                            <b-row class="my-1">
                              <b-col sm="2">
                                <span>
                                  <label>Position</label>
                                </span>
                              </b-col>
                              <b-col sm="10">
                                <ACCTextBox
                                  :prop="MForm.PI_position"
                                  v-model="M_Pic.position"
                                  ref="mref_position_modal"
                                />
                              </b-col>
                            </b-row>
                            <b-row class="my-1">
                              <b-col sm="2">
                                <span>
                                  <label>Email</label>
                                </span>
                              </b-col>
                              <b-col sm="10">
                                <ACCTextBox
                                  :prop="MForm.PI_email"
                                  v-model="M_Pic.email"
                                  ref="mref_email_modal"
                                />
                              </b-col>
                            </b-row>
                            <b-row class="my-1">
                              <b-col sm="2" class="col-p-1">
                                <span>
                                  <label style="width: 100px;">Telp</label>
                                </span>
                              </b-col>
                              <b-col sm="10">
                                <b-row>
                                  <b-col sm="2">
                                    <ACCTextBox
                                      :prop="MForm.PI_contact_phone_no_1"
                                      v-model="M_Pic.contact_phone_no_1"
                                      ref="mref_contact_phone_no_1"
                                      style="width: 50px;"
                                    />
                                  </b-col>
                                  <b-col sm="10">
                                    <ACCTextBox
                                      :prop="MForm.PI_contact_phone_no_2"
                                      v-model="M_Pic.contact_phone_no_2"
                                      ref="mref_contact_phone_no_2"
                                    />
                                  </b-col>
                                </b-row>
                              </b-col>
                            </b-row>
                            <b-row class="my-1">
                              <b-col sm="2">
                                <span>
                                  <label>Description</label>
                                </span>
                              </b-col>
                              <b-col sm="10">
                                <ACCTextArea
                                  :prop="MForm.PI_pic_descs"
                                  v-model="M_Pic.descs"
                                  ref="mref_descs_modal"
                                />
                              </b-col>
                            </b-row>
                            <b-row style="margin-top: 10px;">
                              <b-col sm="12">
                                <ABSButton
                                  :text="'Save'"
                                  classButton="btn btn--default"
                                  classIcon="icon-style-1"
                                  @click="SaveModal"
                                  styleButton="height: 40px;width: 100%;"
                                />
                              </b-col>
                              <!-- <b-col md="6">
                                <ABSButton
                                  :text="'Cancel'"
                                  classButton="btn btn--back"
                                  classIcon="icon-style-1"
                                  @click="CancelModal"
                                  styleButton="height: 40px;width: 100%;"
                                />
                              </b-col>-->
                            </b-row>
                          </b-col>
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

      //For List
      WithViewButton: false,
      addPic: 0,
      search: "",
      fieldHeader: [],
      items: [],
      firstSort: true,
      sort: "time_edit DESC",

      totalRows: 0,
      currentPage: 1,
      lastPage: 1,
      perPage: 5,
      limit: 2,
      pagingData: [
        { value: 5, text: "5" },
        { value: 10, text: "10" },
        { value: 15, text: "15" },
        { value: 20, text: "20" },
        { value: 40, text: "40" },
        { value: 60, text: "60" },
        { value: 80, text: "80" },
        { value: 100, text: "100" },
        { value: 1000, text: "1000" },
      ],

      sortedField: [{ field: "time_edit", sort: "DESC" }],
      isDisableTable: false,
      responses: [],

      M_Dt_Appointment: {
        mk_appointment_id: "",
        name: "",
        address: "",
        country: "",
        province: "",
        city: "",
        district: "",
        email: "",
        website: "",
        phone_no: "",
        pic: "",
        pic_phone_no: "",
      },

      M_Appointment: {
        customer: "",
        customerLabel: "",
        action: "C",
        actionLabel: "",
        contact_person: "",
        contact_personLabel: "",
        contact_person_Label2: "",
        appointment_date: this.momentDate(new Date()),
        nappointment_date: this.momentDate(new Date()),
        meeting_location: "",
        descs: "",
        descs2: "",
        co_marketing1: "",
        co_marketing1Label: "",
        co_marketing2: "",
        co_marketing2Label: "",
        next_appointment: "",
        next_appointmentLabel: "",
        next_contact_person: "",
        next_contact_personLabel: "",
        last_action_date: null,
        marketing_name: "",
        marketing_id: "",
      },
      PI_action: {
        dataLookUp: null,
        cValidate: "",
        cName: "action",
        ckey: false,
        cOrder: 1,
        cProtect: false,
        cParentForm: "MK_EditAppointment",
        cStatic: true,
        cOption: [
          { id: "C", label: "Call" },
          { id: "V", label: "Visit" },
          { id: "E", label: "Entertaintment" },
        ],
        cDisplayColumn: "action_type,descs",
        cInputStatus: this.inputStatus,
      },
      // PI_contact_person: {
      //   cValidate: "",
      //   cName: "contact_person",
      //   cOrder: 2,
      //   cKey: false,
      //   cType: "text",
      //   cProtect: false,
      //   cParentForm: "MK_EditAppointment",
      //   cDecimal: 2,
      //   cInputStatus: this.inputStatus
      // },
      PI_contact_person_label: {
        cValidate: "",
        cName: "contact_person_Label2",
        cOrder: 1,
        cKey: false,
        cType: "text",
        cProtect: true,
        cParentForm: "MK_EditAppointment",
        cDecimal: 2,
        cInputStatus: this.inputStatus,
      },
      PI_contact_person: {
        dataLookUp: {
          LookUpCd: "GetContactPerson",
          ColumnDB: "contact_person_id",
          InitialWhere: "",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "name,phone_no,email,time_edit",
        },
        cValidate: "required",
        cName: "contact_person",
        ckey: false,
        cOrder: 3,
        cProtect: false,
        cParentForm: "MK_AddAppointment",
        cStatic: false,
        cOption: [],
        cDisplayColumn: "name",
        cInputStatus: this.inputStatus,
      },
      PI_descs2: {
        cValidate: "",
        cName: "descs2",
        cOrder: 3,
        cKey: false,
        cProtect: false,
        cResize: false,
        cReadonly: false,
        cRows: 3,
        cMaxRows: 3,
        cSize: "md",
        cParentForm: "MK_EditAppointment",
        cInputStatus: this.inputStatus,
      },
      PI_co_marketing1: {
        dataLookUp: null,
        cValidate: "",
        cName: "co_marketing1",
        ckey: false,
        cOrder: 4,
        cProtect: false,
        cParentForm: "MK_EditAppointment",
        cStatic: true,
        cOption: [{}],
        cDisplayColumn: "name",
        cInputStatus: this.inputStatus,
      },
      PI_co_marketing2: {
        dataLookUp: null,
        cValidate: "",
        cName: "co_marketing2",
        ckey: false,
        cOrder: 5,
        cProtect: false,
        cParentForm: "MK_EditAppointment",
        cStatic: true,
        cOption: [{}],
        cDisplayColumn: "name",
        cInputStatus: this.inputStatus,
      },
      PI_next_appointment: {
        dataLookUp: null,
        cValidate: "",
        cName: "next_appointment",
        ckey: false,
        cOrder: 4,
        cProtect: false,
        cParentForm: "MK_EditAppointment",
        cStatic: true,
        cOption: [
          { id: "C", label: "Call" },
          { id: "V", label: "Visit" },
          { id: "E", label: "Entertaintment" },
        ],
        cDisplayColumn: "action_type,descs",
        cInputStatus: this.inputStatus,
      },
      PI_appointment_date: {
        cValidate: "",
        cName: "nappointment_date",
        cOrder: 5,
        cKey: false,
        cProtect: false,
        cWithTime: true,
        cFormat: "dd/MM/yyyy",
        cParentForm: "MK_EditAppointment",
      },
      // PI_meeting_location: {
      //   cValidate: "",
      //   cName: "meeting_location",
      //   cOrder: 5,
      //   cKey: false,
      //   cProtect: false,
      //   cResize: false,
      //   cReadonly: false,
      //   cRows: 1,
      //   cMaxRows: 2,
      //   cSize: "md",
      //   cParentForm: "MK_EditAppointment",
      //   cInputStatus: this.inputStatus
      // },
      PI_descs: {
        cValidate: "",
        cName: "descs",
        cOrder: 6,
        cKey: false,
        cProtect: false,
        cResize: false,
        cReadonly: false,
        cRows: 3,
        cMaxRows: 3,
        cSize: "md",
        cParentForm: "MK_EditAppointment",
        cInputStatus: this.inputStatus,
      },
      PI_next_contact_person: {
        dataLookUp: {
          LookUpCd: "GetContactPerson",
          ColumnDB: "contact_person_id",
          InitialWhere: "",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "name,phone_no,email,time_edit",
        },
        cValidate: "required",
        cName: "next_contact_person",
        ckey: false,
        cOrder: 7,
        cProtect: false,
        cParentForm: "MK_AddAppointment",
        cStatic: false,
        cOption: [],
        cDisplayColumn: "name",
        cInputStatus: this.inputStatus,
      },

      MForm: {
        PI_contact_person: {
          cValidate: "",
          cName: "contact_person",
          cOrder: 1,
          cKey: false,
          cType: "text",
          cProtect: false,
          cParentForm: "Parent_PIC",
          cDecimal: 2,
          cInputStatus: this.inputStatus,
        },
        PI_position: {
          cValidate: "",
          cName: "position",
          cOrder: 2,
          cKey: false,
          cType: "text",
          cProtect: false,
          cParentForm: "Parent_PIC",
          cDecimal: 2,
          cInputStatus: this.inputStatus,
        },
        PI_contact_phone_no_1: {
          cValidate: "max:3",
          cName: "contact_phone_no_1",
          cOrder: 3,
          cKey: false,
          cType: "tel",
          cProtect: false,
          cParentForm: "Parent_PIC",
          cDecimal: 2,
          cInputStatus: this.inputStatus,
        },
        PI_contact_phone_no_2: {
          cValidate: "max:20",
          cName: "contact_phone_no_2",
          cOrder: 4,
          cKey: false,
          cType: "numeric",
          cProtect: false,
          cParentForm: "Parent_PIC",
          cDecimal: 2,
          cInputStatus: this.inputStatus,
        },
        PI_contact_phone_no_3: {
          cValidate: "max:8",
          cName: "contact_phone_no_3",
          cOrder: 5,
          cKey: false,
          cType: "numeric",
          cProtect: false,
          cParentForm: "Parent_PIC",
          cDecimal: 2,
          cInputStatus: this.inputStatus,
        },
        PI_email: {
          cValidate: "",
          cName: "email",
          cOrder: 6,
          cKey: false,
          cType: "email",
          cProtect: false,
          cParentForm: "Parent_PIC",
          cDecimal: 2,
          cInputStatus: this.inputStatus,
        },
        PI_pic_descs: {
          cValidate: "",
          cName: "descs",
          cOrder: 6,
          cKey: false,
          cType: "email",
          cProtect: false,
          cParentForm: "Parent_PIC",
          cDecimal: 2,
          cInputStatus: this.inputStatus,
        },
      },
      M_Pic: {
        email: "",
        contact_person: "",
        contact_phone_no_1: "+62",
        contact_phone_no_2: "",
        contact_phone_no_3: "",
        cm_contact_id: "",
        cm_contact_person_id: "",
        position: "",
        descs: "",
        lastupdatestamp: "",
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
          console.log(param);
          return param;
        }
      }
    },
    inputStatus() {
      var param = this.$store.getters.getParamPage;
      if (param.isEdit && param.isEdit === true) {
        return "edit";
      } else {
        return "new";
      }
    },
  },
  methods: {
    Onco_marketing2Change(data) {
      this.$nextTick(() => {
        this.M_Appointment.co_marketing2 = data.id;
        this.M_Appointment.co_marketing2Label = data.label;
      });
    },
    Onco_marketing1Change(data) {
      this.$nextTick(() => {
        this.M_Appointment.co_marketing1 = data.id;
        this.M_Appointment.co_marketing1Label = data.label;
      });
    },
    fn_kosong() {},
    CancelModal() {
      this.$refs.Modal_PIC._hide();
      this.M_ClearPIC();
    },
    M_ClearPIC() {
      this.M_Pic = {
        contact_person: "",
        contact_phone_no_1: "+62",
        contact_phone_no_2: "",
        contact_phone_no_3: "",
        email: "",
        descs: "",
      };
    },
    doBack() {
      this.$router.go(-1);
    },
    doAddPIC(data) {
      this.addPic = data;
      this.M_ClearPIC();
      this.inputStatus = "new";
      this.$refs.Modal_PIC._show();
    },
    SaveModal() {
      this.$validator._base.validateAll("Parent_PIC").then((result) => {
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
          (ress) => {
            if (ress.value) {
              this.$validator.errors.clear("Parent_PIC");
              this.SaveModals();
            }
          }
        );
      });
    },
    SaveModals() {
      var param = {
        option_url: "/MK/MK_Appointment",
        line_no: 2,
        cm_contact_id: this.M_Appointment.cm_contact_id,
        name: this.M_Pic.contact_person,
        phone_no:
          this.M_Pic.contact_phone_no_1 + "-" + this.M_Pic.contact_phone_no_2,
        email: this.M_Pic.email,
        position: this.M_Pic.position,
        descs: this.M_Pic.descs,
        user_input: this.getDataUser().user_id,
      };

      this.postJSON(this.getUrlCRUD(), param).then((response) => {
        // console.log(response); return;
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          var dtrow = response.Data[0].row_id;

          if (this.addPic == 1) {
            this.M_Appointment.contact_person = dtrow;
            this.M_Appointment.contact_personLabel = this.M_Pic.contact_person;
            this.M_Appointment.contact_person_Label2 =
              param.phone_no +
              "  " +
              this.M_Pic.email +
              "  " +
              this.M_Pic.position;
          } else {
            this.M_Appointment.next_contact_person = dtrow;
            this.M_Appointment.next_contact_personLabel = this.M_Pic.contact_person;
          }

          this.CancelModal();
        });
      });
    },
    OncustomerChange(data) {
      this.$nextTick(() => {
        this.M_Appointment.customer = data.row_id;
        this.M_Appointment.customerLabel = data.name;
        this.M_Appointment.contact_person = data.contact_person;
      });
    },
    OnactionChange(data) {
      this.$nextTick(() => {
        this.M_Appointment.action = data.id;
        this.M_Appointment.actionLabel = data.label;
      });
    },
    Oncontact_personChange(data) {
      console.log(data);
      this.$nextTick(() => {
        this.M_Appointment.contact_person = data.id;
        this.M_Appointment.contact_personLabel = data.label;
        this.M_Appointment.contact_person_label2 =
          data.phone_no +
          "  " +
          data.email +
          "  " +
          (data.position == null ? "" : data.position); // data.position;
      });
    },
    Oncontact_personChange2(data) {
      this.$nextTick(() => {
        this.M_Appointment.next_contact_person = data.id;
        this.M_Appointment.next_contact_personLabel = data.label;
      });
    },
    Onnext_appointmentChange(data) {
      this.$nextTick(() => {
        this.M_Appointment.next_appointment = data.id;
        this.M_Appointment.next_appointmentLabel = data.label;
      });
    },
    Onappointment_dateChange(data) {
      this.$nextTick(() => {
        // alert("date");
        // this.M_Appointment.nappointment_date = data;
        // console.log(this.M_Appointment.nappointment_date);
      });
    },
    M_ClearForm() {
      this.M_Appointment = {
        customer: "",
        customerLabel: "",
        action: "C",
        actionLabel: "C",
        contact_person: "",
        contact_personLabel: "",
        appointment_date: this.momentDate(new Date()),
        nappointment_date: this.momentDate(new Date()),
        meeting_location: "",
        descs: "",
        descs2: "",
        co_marketing1: "",
        co_marketing1Label: "",
        co_marketing2: "",
        co_marketing2Label: "",
        next_appointment: "",
        next_appointmentLabel: "",
        contact_person_Label2: "",
        marketing_name: "",
        marketing_id: "",
      };

      this.M_Dt_Appointment = {
        mk_appointment_id: "",
        name: "",
        address: "",
        country: "",
        province: "",
        city: "",
        district: "",
        email: "",
        website: "",
        phone_no: "",
        pic: "",
        pic_phone_no: "",
      };
    },
    doSave() {
      this.PI_descs2.cValidate = "required";
      this.$validator._base.validateAll("MK_EditAppointment").then((result) => {
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
          (ress) => {
            if (ress.value) {
              this.$validator.errors.clear("MK_EditAppointment");
              this.M_Save();
            }
          }
        );
      });
    },
    M_Save() {
      if (this.M_Appointment.descs2 == "") {
        this.alertError("Log Book Decsription field is required ");
        return;
      }
      var param = {
        option_url: "/MK/MK_Appointment",
        line_no: 0,

        mk_appointment_id: 0,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        cm_contact_id: this.paramFromList.row_id,
        cm_contact_person_id: this.M_Appointment.contact_person,
        action_type: this.M_Appointment.action,
        meeting_address: "", //this.M_Dt_Appointment.addr,
        descs: this.M_Appointment.descs2,
        appointment_date: this.momentDate(new Date()), //this.M_Appointment.appointment_date,
        appointment_type: "A",
        next_action_type:
          this.M_Appointment.next_appointment == null ||
          this.M_Appointment.next_appointment == ""
            ? "NULL"
            : this.M_Appointment.next_appointment,
        next_appointment_date: this.M_Appointment.nappointment_date,
        next_meeting_address: "", //this.M_Appointment.meeting_location,
        next_descs: this.M_Appointment.descs,
        next_cm_contact_person_id:
          this.M_Appointment.next_contact_person == null ||
          this.M_Appointment.next_contact_person == ""
            ? "NULL"
            : this.M_Appointment.next_contact_person,
        status: "N",
        user_input: this.getDataUser().user_id,
        marketing_id: this.M_Appointment.marketing_id,
        co_marketing_id1:
          this.M_Appointment.co_marketing1 == null ||
          this.M_Appointment.co_marketing1 == ""
            ? "NULL"
            : this.M_Appointment.co_marketing1,
        co_marketing_id2:
          this.M_Appointment.co_marketing2 == null ||
          this.M_Appointment.co_marketing2 == ""
            ? "NULL"
            : this.M_Appointment.co_marketing2,
        lastupdatestamp:
          this.paramFromList.lastupdatestamp == null ||
          this.paramFromList.lastupdatestamp == "undefined"
            ? 0
            : this.paramFromList.lastupdatestamp,
      };

      this.putJSON(this.getUrlCRUD(), param).then((response) => {
        // console.log(response)
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          this.doBack();
        });
      });
    },
    GetDataBy() {
      var param = {
        option_url: "/MK/MK_Customer",
        line_no: 3,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp,
      };

      this.getJSON(this.getUrlCRUD(), param).then((response) => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];
        this.$nextTick(() => {
          this.M_Dt_Appointment = {
            mk_appointment_id: data.mk_appointment_id,
            name: data.name,
            address: data.address,
            addr: data.address,
            email: data.email,
            website: data.website,
            phone_no: data.phone_no,
            pic: data.pic,
            pic_phone_no: data.contact_phone_no,
          };
        });

        this.M_Appointment = {
          action: "C",
          //   actionLabel: data.action_type,
          contact_person: data.cm_contact_person_id,
          contact_personLabel: data.contact_person,

          next_contact_person: data.cm_contact_person_id,
          next_contact_personLabel: data.contact_person,
          contact_person_Label2:
            data.contact_phone_no +
            "  " +
            data.contact_email +
            "  " +
            (data.contact_position == null ? "" : data.contact_position),
          //   appointment_date: data.appointment_date,
          //   meeting_location: data.next_meeting_address,
          //   descs2: data.descs,
          descs: "", //data.next_descs,
          //   next_appointment: data.next_action_type,
          //   next_appointmentLabel: data.next_action_type,
          last_action_date:
            data.last_action_date == null
              ? ""
              : this.momentDate(data.last_action_date),
          nappointment_date: this.momentDate(new Date()),
        };
        this.M_Appointment.cm_contact_id = this.paramFromList.cm_contact_id;
        this.M_Appointment.mk_appointment_id = 0;
        this.M_Appointment.marketing_id =
          data.marketing_id == null || data.marketing_id.length == 0
            ? this.getDataUser().user_id
            : data.marketing_id;
        this.M_Appointment.marketing_name =
          data.marketing_id == null || data.marketing_id.length == 0
            ? this.getDataUser().user_name
            : data.marketing_name;
        this.PI_contact_person.dataLookUp.InitialWhere =
          "cm_contact_id =" + this.paramFromList.cm_contact_id;
        this.PI_next_contact_person.dataLookUp.InitialWhere =
          "cm_contact_id =" + this.paramFromList.cm_contact_id;
        // console.log(this.M_Appointment);
        this.doGetlist(this.search);
      });
    },
    doGetlist(search) {
      var param = {
        option_url: "/MK/MK_Appointment",
        line_no: 1,
        user_id: this.getDataUser().user_id,
        portfolio_id: this.getDataUser().portfolio_id,
        subportfolio_id: this.getDataUser().subportfolio_id,
        current_page: this.currentPage,
        per_page: this.perPage,
        param_where: search,
        initial_where: " cm_contact_id = " + this.paramFromList.row_id,
        sort_field: this.sort,
        source_field: this.propList.SourceField,
        param_view: this.propList.ParamView,
      };

      this.postJSON(this.getUrlList(), param).then((response) => {
        if (response == null) return;
        // this.selected = false;

        // this.rowSelected = [];

        // this.rowSel = 0;

        this.responses = response;

        // this.ExportToken = this.responses.ExportToken;

        if (this.responses.Data.length > 0) {
        }
        this.items = [];
        this.fieldHeader = [];

        this.items = this.responses.Data;

        var str_array =
          this.responses.DefineColumn && this.responses.DefineColumn !== ""
            ? this.responses.DefineColumn.split(",")
            : this.responses.AllColumn.split(",");
        var x = "M,L,M,S";
        // var defineSize = this.responses.DefineSize.split(",");
        var defineSize = x.split(",");
        this.allColumn_bf = this.responses.AllColumn.split(",");
        var index = this.allColumn_bf.indexOf("lastupdatestamp");
        if (index > -1) {
          this.allColumn_bf.splice(index, 1);
        }
        var allColumn = [];
        var filteredColumn = [];
        var definedColumn = [];

        this.allColumn_bf.forEach((val, idx) => {
          var thClass = "HeaderACCList";
          var isSorted = this.sortedField.map((x) => x.field).indexOf(val);
          if (isSorted > -1) {
            if (this.sortedField[isSorted].sort == "ASC") {
              thClass = thClass + " AscSorted";
            } else {
              thClass = thClass + " DescSorted";
            }
          }

          allColumn.push({
            value: idx + 1,
            key: val,
            thClass: thClass,
            tdClass: "ContentACCList notranslate",
            text: val,
          });

          filteredColumn.push({
            value: idx + 1,
            key: val,
            thClass: thClass,
            tdClass: "ContentACCList notranslate",
          });
        });

        for (var i = 0; i < str_array.length; i++) {
          filteredColumn = filteredColumn.filter((val) => {
            if (val.key == str_array[i]) {
              definedColumn.push({
                value: val.value,
                key: val.key,
                thClass: val.thClass,
                tdClass: val.tdClass,
                text: val.key,
              });
            }

            return val.key != str_array[i];
          });

          var thClass = "HeaderACCList " + defineSize[i];
          // var thClass = "HeaderACCList L";

          var tdClass = "ContentACCList notranslate";
          if (
            str_array[i].toLowerCase().includes("amount") ||
            str_array[i].toLowerCase().includes("amt") ||
            str_array[i].toLowerCase().includes("rate") ||
            str_array[i].toLowerCase().includes("price")
          ) {
            tdClass = "ABStdClassList2 notranslate";
            thClass = "ABSthClassList2";
          }

          var isSorted = this.sortedField
            .map((x) => x.field)
            .indexOf(str_array[i]);
          if (isSorted > -1) {
            if (this.sortedField[isSorted].sort == "ASC") {
              thClass = thClass + " AscSorted";
            } else {
              thClass = thClass + " DescSorted";
            }
          }

          if (this.languageStatus) {
            this.fieldHeader.push({
              value: i + 1,
              key: str_array[i],
              thClass: thClass,
              tdClass: tdClass,
              label: this.$t(str_array[i]),
            });
          } else {
            if (str_array[i] == "lastupdatestamp") continue;

            var listReplace = [
              {
                key: "_",
                value: " ",
              },
              {
                key: "Cd",
                value: " Code",
              },
              {
                key: "Descs",
                value: " Description",
              },
              {
                key: "Time Edit",
                value: "Last Update",
              },
              {
                key: "garing",
                value: "/",
              },
              {
                key: "titik",
                value: ".",
              },
              {
                key: "Row Id",
                value: "View",
              },
              {
                key: "Pic",
                value: "PIC",
              },
            ];
            var isGotIt = false;
            var labelHeader = undefined;

            // console.log(str_array[i])

            if (str_array[i].includes("_")) {
              labelHeader = str_array[i]
                .toLowerCase()
                .split("_")
                .map((s) => {
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

            this.fieldHeader.push({
              value: i + 1,
              key: str_array[i],
              thClass: thClass,
              tdClass: tdClass,
              label: labelHeader,
            });
          }
        }

        // this.availableColumn = filteredColumn;
        // this.selectedColumn = definedColumn;

        // this.availableColumnTemp = filteredColumn;
        // this.selectedColumnTemp = definedColumn;
        this.totalRows = this.responses.Total;
        this.lastPage = this.responses.Last_Page;
      });
    },
    doGetCoMarketing() {
      var param = {
        option_function_cd: "GetLookupMarketingTeam",
        module_cd: "MK",
        ss_portfolio_id: this.getDataUser().portfolio_id,
        user_id: this.getDataUser().user_id,
      };
      this.CallFunction(param).then((ress) => {
        if (ress == null) return;
        this.dataCoMarketing = [];
        var now = new Date();
        for (let i = 0; i < ress.Data.length; i++) {
          var next_action = new Date(ress.Data[i].next_action);
          // console.log(next_action);
          this.PI_co_marketing2.cOption.push({
            id: ress.Data[i].marketing_id,
            label: ress.Data[i].marketing_name,
          });
          this.PI_co_marketing1.cOption.push({
            id: ress.Data[i].marketing_id,
            label: ress.Data[i].marketing_name,
          });
          // this.dataCoMarketing.push({
          //   id: ress.Data[i].marketing_id,
          //   label: ress.Data[i].marketing_name
          // });
        }
        this.$forceUpdate();
      });
    },
  },
  mounted() {
    this.M_ClearForm();
    this.GetDataBy();
    this.doGetCoMarketing();
  },
};
</script>

<style scoped>
ul.pagination {
  margin-top: 10px !important;
}
</style>>
