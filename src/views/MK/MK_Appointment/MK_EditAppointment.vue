<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>To Do List</span>
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
                    <b-row>
                      <b-col md="6">
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
                    </b-row>
                    <b-row style="margin-top: 5px;">
                      <b-col md="6">
                        <span>
                          <label>PIC</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_contact_person"
                          v-model="M_Appointment.contact_person"
                          ref="ref_contact_person"
                        />
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
                          <label>Meeting Location</label>
                        </span>
                        <ACCTextArea
                          :prop="PI_meeting_location"
                          v-model="M_Appointment.meeting_location"
                          ref="ref_meeting_location"
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
                          v-model="M_Appointment.appointment_date"
                          ref="ref_appointment_date"
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
                        :bordered="false"
                        :outlined="false"
                        :small="false"
                        :hover="true"
                        :dark="false"
                        :fixed="false"
                        :foot-clone="false"
                        :fields="fieldHeader"
                        :items="items"
                        class="table-sm table-style-2"
                      >
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
                      <!-- <b-form inline style="float: left; color: #333;">
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

                      <b-pagination
                        align="right"
                        v-model="currentPage"
                        @input="doGetList(search, 'pagination')"
                        :total-rows="totalRows"
                        :per-page="perPage"
                        :limit="limit"
                        style="margin-bottom: 0px;"
                        :disabled="isDisableTable"
                      ></b-pagination>-->
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
        ParamView: ""
      },

      //For List
      WithViewButton: false,

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
        { value: 1000, text: "1000" }
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
        pic_phone_no: ""
      },

      M_Appointment: {
        customer: "",
        customerLabel: "",
        action: "",
        actionLabel: "",
        contact_person: "",
        appointment_date: "",
        meeting_location: "",
        descs: "",
        descs2: "",
        next_appointment: "",
        next_appointmentLabel: ""
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
          { id: "E", label: "Entertaintment" }
        ],
        cDisplayColumn: "action_type,descs",
        cInputStatus: this.inputStatus
      },
      PI_contact_person: {
        cValidate: "",
        cName: "contact_person",
        cOrder: 2,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "MK_EditAppointment",
        cDecimal: 2,
        cInputStatus: this.inputStatus
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
        cInputStatus: this.inputStatus
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
          { id: "E", label: "Entertaintment" }
        ],
        cDisplayColumn: "action_type,descs",
        cInputStatus: this.inputStatus
      },
      PI_appointment_date: {
        cValidate: "",
        cName: "appointment_date",
        cOrder: 6,
        cKey: false,
        cProtect: false,
        cFormat: "dd/MM/yyyy",
        cParentForm: "MK_EditAppointment"
      },
      PI_meeting_location: {
        cValidate: "",
        cName: "meeting_location",
        cOrder: 5,
        cKey: false,
        cProtect: false,
        cResize: false,
        cReadonly: false,
        cRows: 1,
        cMaxRows: 2,
        cSize: "md",
        cParentForm: "MK_EditAppointment",
        cInputStatus: this.inputStatus
      },
      PI_descs: {
        cValidate: "",
        cName: "descs",
        cOrder: 7,
        cKey: false,
        cProtect: false,
        cResize: false,
        cReadonly: false,
        cRows: 3,
        cMaxRows: 3,
        cSize: "md",
        cParentForm: "MK_EditAppointment",
        cInputStatus: this.inputStatus
      }
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
          console.log(param);
          return param;
        }
      }
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
    Onnext_appointmentChange(data) {
      this.$nextTick(() => {
        this.M_Appointment.next_appointment = data.id;
        this.M_Appointment.next_appointmentLabel = data.label;
      });
    },
    Onappointment_dateChange(data) {
      // this.M_Appointment.appointment_date = data
    },
    M_ClearForm() {
      this.M_Appointment = {
        customer: "",
        customerLabel: "",
        action: "",
        actionLabel: "",
        contact_person: "",
        appointment_date: "",
        meeting_location: "",
        descs: "",
        descs2: "",
        next_appointment: "",
        next_appointmentLabel: ""
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
        pic_phone_no: ""
      };
    },
    doSave() {
      this.$validator._base.validateAll("MK_EditAppointment").then(result => {
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
          ress => {
            if (ress.value) {
              this.$validator.errors.clear("MK_EditAppointment");
              this.M_Save();
            }
          }
        );
      });
    },
    M_Save() {
      var param = {
        option_url: "/MK/MK_Appointment",
        line_no: 0,
        mk_appointment_id: this.paramFromList.row_id,
        cm_contact_id: this.paramFromList.cm_contact_id,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        action_type: this.M_Appointment.action,
        pic: this.M_Appointment.contact_person,
        descs: this.M_Appointment.descs,
        next_action_type: this.M_Appointment.next_appointment,
        next_appointment_date: this.M_Appointment.appointment_date,
        next_meeting_address: this.M_Appointment.meeting_location,
        next_descs: this.M_Appointment.descs2,
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
        option_url: "/MK/MK_Appointment",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };

      this.getJSON(this.getUrlCRUD(), param).then(response => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];

        this.M_Dt_Appointment = {
          mk_appointment_id: data.mk_appointment_id,
          name: data.name,
          address:
            data.address +
            ", " +
            data.district +
            ", " +
            data.city +
            ", " +
            data.province +
            " - " +
            data.country,
          country: data.country,
          province: data.province,
          city: data.city,
          district: data.district,
          email: data.email,
          website: data.website,
          phone_no: data.phone_no,
          pic: data.pic,
          pic_phone_no: "-"
        };

        this.M_Appointment = {
          action: data.action_type,
          actionLabel: data.action_type,
          contact_person: data.pic,
          appointment_date: data.next_appointment_date,
          meeting_location: data.next_meeting_address,
          descs: data.descs,
          descs2: data.next_descs,
          next_appointment: data.next_action_type,
          next_appointmentLabel: data.next_action_type
        };

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
        initial_where: " cm_contact_id = " + this.paramFromList.cm_contact_id,
        sort_field: this.sort,
        source_field: this.propList.SourceField,
        param_view: this.propList.ParamView
      };

      this.postJSON(this.getUrlList(), param).then(response => {
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
          var isSorted = this.sortedField.map(x => x.field).indexOf(val);
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
            text: val
          });

          filteredColumn.push({
            value: idx + 1,
            key: val,
            thClass: thClass,
            tdClass: "ContentACCList notranslate"
          });
        });

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
            .map(x => x.field)
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
                key: "garing",
                value: "/"
              },
              {
                key: "titik",
                value: "."
              },
              {
                key: "Row Id",
                value: "View"
              },
              {
                key: "Pic",
                value: "PIC"
              }
            ];
            var isGotIt = false;
            var labelHeader = undefined;

            // console.log(str_array[i])

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

            this.fieldHeader.push({
              value: i + 1,
              key: str_array[i],
              thClass: thClass,
              tdClass: tdClass,
              label: labelHeader
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
    }
  },
  mounted() {
    this.M_ClearForm();
    this.GetDataBy();
  }
};
</script>

<style scoped>
ul.pagination {
  margin-top: 10px !important;
}
</style>>
