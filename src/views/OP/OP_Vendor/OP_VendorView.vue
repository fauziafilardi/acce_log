<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Vendor Master</span>
                </b-col>
                <b-col style="text-align: right;">
                  <!-- <ABSButton
                    :text="'Add Pick Up / Delivery Address'"
                    classButton="button button--back"
                    classIcon="icon-style-1"
                    @click="doPickUp"
                  />-->
                  <ABSButton
                    :text="'Add PIC'"
                    classButton="button button--back"
                    classIcon="icon-style-1"
                    @click="doPIC"
                  />
                  <!-- <ABSButton
                    :text="'Required Doc'"
                    classButton="button button--back"
                    classIcon="icon-style-1"
                    @click="doReqDoc"
                  />-->
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
                    <div v-if="M_Customer.file_show == ''">
                      <img :src="default_pic" alt style="width: 70px;" />
                    </div>
                    <div v-else>
                      <img id="logo" :src="M_Customer.file_show" alt width="100%" />
                    </div>
                  </b-col>
                  <b-col md="10">
                    <b-row>
                      <b-col md="6">
                        <b-row>
                          <b-col>
                            <span>
                              <h5>{{ M_Customer.customer }}</h5>
                            </span>
                            <br />
                            <span
                              class="badge-primary badgeStatus"
                              :style="`background-color:`+M_Customer.customer_status_colour+` !important;width: 65%;margin: auto;`"
                            >{{M_Customer.customer_status}}</span>
                            &nbsp;
                            <span>
                              <font-awesome-icon
                                class="icon-style-default"
                                icon="check-circle"
                                size="sm"
                              />
                              {{ M_Customer.date }}
                            </span>
                          </b-col>
                        </b-row>
                      </b-col>
                      <b-col style="text-align: right; margin-top: 10px;">
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
                            :disabled="ButtonStatus == null ? false : !ButtonStatus.btnEdit"
                          />
                        </span>
                        <br />
                        <span>
                          <font-awesome-icon
                            class="icon-style-default"
                            icon="user"
                            style="margin-top:10px;"
                            size="sm"
                          />
                          &nbsp;&nbsp;User : {{getDataUser().user_name}}
                        </span> &nbsp;
                      </b-col>
                    </b-row>
                    <hr />
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label style="margin-bottom: 0px !important;">Address</label>
                        </span>
                        <br />
                        <span style="color: #999999;">{{ M_Customer.fulladdress }}</span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col md="3">
                        <span>
                          <label style="margin-bottom: 0px !important;">Phone No</label>
                        </span>
                        <br />
                        <span style="color: #999999;">{{ M_Customer.phone_no }}</span>
                      </b-col>
                      <b-col md="3">
                        <span>
                          <label style="margin-bottom: 0px !important;">Email</label>
                        </span>
                        <br />
                        <span style="color: #999999;">{{ M_Customer.email }}</span>
                      </b-col>
                      <b-col md="6">
                        <span>
                          <label style="margin-bottom: 0px !important;">NPWP Number</label>
                        </span>
                        <br />
                        <span style="color: #999999;">{{ M_Customer.npwp_no }}</span>
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <b-row class="row-view">
                          <b-col>
                            <span>
                              <label style="margin-bottom: 0px !important;">Website</label>
                            </span>
                            <br />
                            <span
                              style="color: #999999; text-align: justify;"
                            >{{ M_Customer.website }}</span>
                          </b-col>
                        </b-row>
                        <b-row class="row-view">
                          <b-col md="6">
                            <span>
                              <label style="margin-bottom: 0px !important;">Bank Name</label>
                            </span>
                            <br />
                            <span style="color: #999999;">{{ M_Customer.bank_name }}</span>
                          </b-col>
                          <b-col md="6">
                            <span>
                              <label style="margin-bottom: 0px !important;">Bank Account</label>
                            </span>
                            <br />
                            <span style="color: #999999;">{{ M_Customer.bank_acct_no }}</span>
                          </b-col>
                        </b-row>
                      </b-col>
                      <b-col md="6">
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
                                </b-col>
                              </template>
                            </b-row>
                          </b-col>
                        </b-row>
                      </b-col>
                    </b-row>

                    <br />

                    <br />
                    <!-- <b-row> -->

                    <div class="card">
                      <div class="card__title">
                        <b-row>
                          <b-col style="max-width:fit-content !important;">
                            <span>PIC</span>
                          </b-col>
                          <b-col style="text-align: right;">
                            <span>
                              <ABSButton
                                :text="'View All'"
                                classButton="button button--new"
                                classIcon="icon-style-1"
                                :disabled="false"
                                @click="doViewAllPIC"
                              />
                            </span>
                          </b-col>
                        </b-row>
                      </div>
                      <div class="card__body">
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
                          :fields="PICHeader"
                          :items="PICItems"
                          class="table-sm table-style-3"
                          @row-clicked="doPIC"
                          thStyle="padding: 5px !important;"
                        >
                          <template v-slot:cell(row_id)="data">
                            <ABSButton
                              :icon="'trash'"
                              classButton="button button--delete"
                              classIcon="icon-style-1"
                              @click="doDeleteList(2,data.item, data.index)"
                            />
                          </template>
                        </b-table>
                      </div>
                    </div>

                    <div class="card">
                      <div class="card__title">
                        <b-row>
                          <b-col style="max-width:fit-content !important;">
                            <span>Order</span>
                          </b-col>
                          <b-col style="text-align: right;">
                            <span>
                              <ABSButton
                                :text="'View All'"
                                classButton="button button--new"
                                classIcon="icon-style-1"
                                :disabled="false"
                                @click="doViewAllOrder"
                              />
                            </span>
                          </b-col>
                        </b-row>
                      </div>
                      <div class="card__body">
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
                          :fields="OrderHeader"
                          :items="OrderItems"
                          class="table-sm table-style-3"
                          @row-clicked="doOrder"
                          thStyle="padding: 5px !important;"
                        >
                          <!-- <template v-slot:cell(row_id)="data">
                            <ABSButton
                              :icon="'trash'"
                              classButton="button button--delete"
                              classIcon="icon-style-1"
                              @click="doDeletedQuotation(data.item, data.index)"
                            />
                          </template>                         
                          <template v-slot:cell(order_status)="data">
                            <span v-if="data.item.order_status=='N'">Pending</span>
                            <span v-else-if="data.item.order_status=='P'">Progress</span>
                            <span v-else>Issue</span>
                          </template>-->
                          <template v-slot:cell(status)="data">
                            <div
                              :class="'Plan-Dot-' + (StatusOrder[data.item.status].variant)"
                              style="font-size: 10px !important; padding-top: 9px !important;"
                            >{{data.item.status}}</div>
                          </template>
                          <template v-slot:cell(pickup_date)="data">
                            {{momentDateFormatting(
                            new Date(data.item.pickup_date),
                            "DD/MM/YYYY HH:mm"
                            )}}
                          </template>
                        </b-table>
                      </div>
                    </div>

                    <div class="card">
                      <div class="card__title">
                        <b-row>
                          <b-col style="max-width:fit-content !important;">
                            <span>Outstanding Payment</span>
                          </b-col>
                          <b-col style="text-align: right;">
                            <span>
                              <ABSButton
                                :text="'View All'"
                                classButton="button button--new"
                                classIcon="icon-style-1"
                                :disabled="false"
                                @click="doViewAllOutStanding"
                              />
                            </span>
                          </b-col>
                        </b-row>
                      </div>
                      <div class="card__body">
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
                          :fields="OutstandingHeader"
                          :items="OutstandingItems"
                          class="table-sm table-style-3"
                          @row-clicked="doOutstanding"
                          thStyle="padding: 5px !important;"
                        >
                          <template v-slot:cell(invoice_date)="data">
                            <span>{{momentDateFormatting(data.item.invoice_date,"DD/MM/YYYY HH:mm")}}</span>
                          </template>
                          <template v-slot:cell(due_date)="data">
                            <span>{{momentDateFormatting(data.item.due_date,"DD/MM/YYYY HH:mm")}}</span>
                          </template>
                          <template v-slot:cell(trx_amt)="data">
                            <span>{{isCurrency(data.item.trx_amt,decimal)}}</span>
                          </template>
                        </b-table>
                      </div>
                    </div>

                    <div class="card">
                      <div class="card__title">
                        <b-row>
                          <b-col style="max-width:fit-content !important;">
                            <span>Log Book</span>
                          </b-col>
                          <b-col style="text-align: right;">
                            <span>
                              <ABSButton
                                :text="'View All'"
                                classButton="button button--new"
                                classIcon="icon-style-1"
                                :disabled="false"
                                @click="doViewAllLogBook"
                              />
                            </span>
                          </b-col>
                        </b-row>
                      </div>
                      <div class="card__body">
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
                          thStyle="padding: 5px !important;"
                        >
                          <!-- <template v-slot:cell(no)="data">{{data.index + 1}}</template> -->
                          <template v-slot:cell(logbook_date)="data">
                            {{momentDateFormatting(
                            new Date(data.item.logbook_date),
                            "DD/MM/YYYY HH:mm"
                            )}}
                          </template>

                          <template v-slot:cell(row_id)="data">
                            <span>
                              <font-awesome-icon
                                class="icon-style-default"
                                :icon="data.item.action_type=='C' ? 'phone-square-alt' : (data.item.action_type=='V' ? 'hand-paper' : 'utensils')"
                                size="lg"
                              />
                              {{ data.item.action }}
                            </span>
                          </template>
                        </b-table>
                      </div>
                    </div>
                  </b-col>
                </b-row>
              </b-form>
              <ABSModal id="Show_Picture" ref="Show_Picture" size="sm">
                <template slot="content">
                  <b-row>
                    <b-col md="12" style="text-align: center;">
                      <img id="show_pict" :src="M_ModalPict.file_show" alt style="width: 200px;" />
                    </b-col>
                  </b-row>
                </template>
              </ABSModal>
            </div>
          </div>
        </b-col>
      </b-row>
    </div>

    <!-- Modal Reason -->
    <!-- <ABSModal id="Modal_MK_Quotation" ref="Modal_MK_Quotation" size="sm">
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
    </ABSModal>-->

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
      propListReqDoc: {
        OptionUrl: "/MK/MK_Customer",
        LineNo: 4,
        initialWhere: "",
        OrderBy: "time_edit DESC",
        SourceField: "",
        ParamView: "",
      },
      default_pic: require("@/assets/default_photo_.png"),
      M_Customer: {
        customer_status: "",
        customer_status_colour: "",
        customer: "",
        fulladdress: "",
        address: "",
        phone_no: "",
        email: "",
        website: "",
        file_show: "",
        bank_name: "",
        bank_acct_no: "",
        npwp_no: "",
      },
      M_Picture: [],
      M_ModalPict: {
        file_logo: "",
        file_logo_name: "",
        file_logo_path: "",
        file_show: require("@/assets/default_photo_.png"),
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
        cInputStatus: "new",
      },
      M_LogBook: {
        descs: "",
      },
      StatusOrder: {
        NW: { key: "NW", label: "New", variant: "Magenta" },
        AS: { key: "AS", label: "Assign", variant: "Lime" },
        DP: { key: "DP", label: "Dispatch", variant: "Green" },
        AR: { key: "AR", label: "Arrived", variant: "Purple" },
        SL: { key: "SL", label: "Start Loading", variant: "Blue" },
        FL: { key: "FL", label: "Finish Loading", variant: "Orange" },
        GO: { key: "GO", label: "Get Out", variant: "Red" },
        AD: { key: "AD", label: "Arrive Destination", variant: "Gold" },
        SU: { key: "SU", label: "Start Unloading", variant: "LightGreen" },
        FU: { key: "FU", label: "Finish Unloading", variant: "Pink" },
        GD: { key: "GD", label: "Get Out", variant: "Red" },
        POD: { key: "POD", label: "POD", variant: "LightGreen" },
      },
      AllData: {},
      responses: {},

      OutstandingHeader: [
        {
          key: "row_number",
          label: "No",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 th-cus-center",
        },
        {
          key: "invoice_no",
          label: "Invoice No",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
        {
          key: "invoice_date",
          label: "Invoice Date",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
        {
          key: "due_date",
          label: "Due Date",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
        {
          key: "trx_amt",
          label: "Value",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
        {
          key: "overdue",
          label: "Overdue",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
      ],
      OutstandingItems: [],
      PICHeader: [
        {
          key: "row_number",
          label: "No",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 th-cus-center",
        },
        {
          key: "name",
          label: "Contact Person",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
        {
          key: "position",
          label: "Position",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
        {
          key: "phone_no",
          label: "Phone No",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
        {
          key: "email",
          label: "Email",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
        {
          key: "row_id",
          label: "",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
      ],
      PICItems: [],

      OrderHeader: [
        {
          key: "row_number",
          label: "No",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 th-cus-center",
        },
        {
          key: "order_no",
          label: "Order No",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
        {
          key: "pickup_date",
          label: "Pickup Date",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
        {
          key: "from_to",
          label: "From To",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
        {
          key: "category",
          label: "Category",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 M th-cus-center",
        },
        {
          key: "fleet_type",
          label: "Fleet Type",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 M th-cus-center",
        },
        {
          key: "fleet_no",
          label: "Fleet No",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 M th-cus-center",
        },
        {
          key: "status",
          label: "Status",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 M th-cus-center",
        },
      ],
      OrderItems: [],
      LogBookHeader: [
        {
          key: "row_number",
          label: "No",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 th-cus-center",
        },
        {
          key: "logbook_date",
          label: "Date",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
        {
          key: "descs",
          label: "Description",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 M th-cus-center",
        },
        {
          key: "contact_person_name",
          label: "PIC",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 M th-cus-center",
        },
        {
          key: "row_id",
          label: "Action",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 M th-cus-center",
        },
      ],
      LogBookItems: [],
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
    },
  },
  methods: {
    doViewAllPIC() {
      var param = this.paramFromList;
      param.isEdit = false;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "ViewAll_PIC" });
    },

    doViewAllOrder() {
      var param = this.paramFromList;
      param.isEdit = false;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "ViewAll_Order" });
    },
    // doViewAllReqDoc() {
    //   var param = this.paramFromList;
    //   param.isEdit = false;
    //   this.$store.commit("setParamPage", param);
    //   this.$router.push({ name: "ViewAll_ReqDoc" });
    // },
    doViewAllOutStanding() {
      var param = this.paramFromList;
      param.isEdit = false;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "ViewAll_Outstanding" });
    },
    doViewAllLogBook() {
      var param = this.paramFromList;
      param.isEdit = false;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "ViewAll_LogBook" });
    },
    showPict(pict) {
      this.M_ModalPict = pict;
      this.$refs.Show_Picture._show();
    },
    doDeleteListRequiredDocClick(record, index) {
      this.alertConfirmation("Are You Sure Want To Delete This Data ?").then(
        (ress) => {
          if (ress.value) {
            this.M_DeleteReqDoc(record, index);
          }
        }
      );
    },
    M_DeleteReqDoc(record, index) {
      var param = {
        option_url: "/MK/MK_Customer",
        line_no: 4,
        id: record.row_id,
        lastupdatestamp: record.lastupdatestamp,
      };
      this.deleteJSON(this.getUrlCRUD(), param).then((response) => {
        if (response == null) return;
        this.alertSuccess("Data Has Been Deleted").then(() => {
          // this.doBack();
          this.$refs.ref_CustomerRequiredDoc.doGetList("");
        });
      });
    },
    doDeleteList(from, record, index) {
      this.alertConfirmation("Are You Sure Want To Delete This Data ?").then(
        (ress) => {
          if (ress.value) {
            if (from == 1) {
              this.doDeletePickUp(record, index);
            } else {
              this.doDeletePIC(record, index);
            }
          }
        }
      );
    },
    doDeletePickUp(record, index) {
      var param = {
        option_url: "/MK/MK_Customer",
        line_no: 2,
        id: record.row_id,
        lastupdatestamp: record.lastupdatestamp,
      };

      this.deleteJSON(this.getUrlCRUD(), param).then((response) => {
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          this.GetPickUpList();
        });
      });
    },
    doDeletePIC(record, index) {
      var param = {
        option_url: "/MK/MK_Customer",
        line_no: 1,
        id: record.row_id,
        lastupdatestamp: record.lastupdatestamp,
      };

      this.deleteJSON(this.getUrlCRUD(), param).then((response) => {
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          // this.GetPICList();
          this.GetDataBy();
        });
      });
    },
    doOutstanding(record = null) {
      // var param = this.paramFromList;
      // param.isEdit = record == null ? false : true;
      // param.DetailList = record;
      // this.$store.commit("setParamPage", param);
      // this.$router.push({ name: "OP_VendorPickUp" });
    },
    doDelete() {
      // this.addStatus = true;
      // this.$refs.Modal_MK_Quotation._show();
      this.alertConfirmation("Are You Sure Want To Delete This Data ?").then(
        (ress) => {
          if (ress.value) {
            this.YesDelete();
          }
        }
      );
    },

    // Delete
    // NoDelete() {
    //   this.$refs.Modal_MK_Quotation._hide();
    // },
    YesDelete() {
      var param = {
        option_url: "/MK/MK_Customer",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp,
      };

      this.deleteJSON(this.getUrlCRUD(), param).then((response) => {
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          // this.$refs.Modal_MK_Quotation._hide();
          this.doBack();
        });
      });
    },
    OnReasonChange(data) {
      this.$nextTick(() => {
        this.M_Customer.reason_cd = data.reason_cd;
        this.M_Customer.reasonCdLabel = data.label;
        this.M_Customer.reason_descs = data.descs;
      });
    },
    Onchat_toChange(data) {
      this.$nextTick(() => {
        this.M_Customer.chat_to = data.user_id;
        this.M_Customer.chat_toLabel = data.user_name;
      });
    },

    doPickUp(record = null) {
      var param = this.paramFromList;
      param.isEdit = record == null ? false : true;
      param.DetailList = record;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "MK_CustomerPickUp" });
    },
    doPIC(record) {
      var param = this.paramFromList;
      param.isEdit = record == null ? false : true;
      param.DetailList = record;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "MK_CustomerPIC" });
    },
    doReqDoc(record) {
      var param = this.paramFromList;
      param.isEdit = record == null ? false : true;
      param.DetailList = record;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "MK_CustomerRequiredDoc" });
    },
    // doPIC(record) {
    //   var param = this.paramFromList;
    //   param.isEdit = record == null ? false : true;
    //   param.DetailList = record;
    //   this.$store.commit("setParamPage", param);
    //   this.$router.push({ name: "MK_Quotation_rentalForm" });
    // },
    doQuotation(record) {
      // var param = this.paramFromList;
      // param.isEdit = record == null ? false : true;
      // param.FromCustomer = true;
      // param.DetailList = record;
      // this.$store.commit("setParamPage", param);
      // this.$router.push({ name: "MK_ViewQuotation" });
    },
    doOrder(record) {
      var param = this.paramFromList;
      param.isEdit = record == null ? false : true;
      param.DetailList = record;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "ViewDetailOrder" });
    },
    doLogBook(record) {
      var param = this.AllData;
      param.isEdit = true;
      param.DetailList = record;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "OP_VendorLogBook" });
    },
    doBack() {
      this.$router.go(-1);
      // this.$router.push({ name: "MK_CustomerList" });
    },
    doConfirm() {
      var param = {
        option_url: "/MK/MK_Customer",
        line_no: 1,
        mk_quotation_id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp,
        user_edit: this.getDataUser().user_id,
      };

      this.postJSON(this.getUrlCRUD(), param).then((response) => {
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
      this.$router.push({ name: "OP_VendorForm" });
    },
    M_ClearForm() {
      this.M_Customer = {
        customer: "",
        fulladdress: "",
        address: "",
        phone_no: "",
        email: "",
        website: "",
        pic: "",
        pic_phone_no: "",
      };
    },
    GetDataBy() {
      var param = {
        option_url: "/MK/MK_Customer",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp,
      };

      this.getJSON(this.getUrlCRUD(), param).then((response) => {
        // response from API
        if (response == null) return;

        var data = JSON.parse(response.Data[0].fcm_contact_s_new)[0];
        // var data = response.Data[0];
        console.log(data);

        this.AllData = data;

        this.M_Customer = {
          customer: data.name,
          customer_status_colour: data.customer_status_colour,
          customer_status: data.customer_status,
          fulladdress: data.address,

          phone_no: data.phone_no && data.phone_no !== "" ? data.phone_no : "-",
          email: data.email && data.email !== "" ? data.email : "-",
          website: data.website && data.website !== "" ? data.website : "-",

          date:
            data.contact_created && data.contact_created !== ""
              ? this.momentDateFormatting(
                  new Date(data.contact_created),
                  "DD/MM/YYYY HH:mm"
                )
              : "-",
          file_show: data.path_file != "" ? this.url + data.path_file : "",
          bank_name: data.bank_name,
          bank_acct_no: data.bank_acct_no,
          npwp_no: data.npwp_no,
        };
        var dataDoc = data.detail_document;
        if (dataDoc != null) {
          for (let i = 0; i < dataDoc.length; i++) {
            this.M_Picture.push({
              file_logo: "dtfile_" + i,
              file_logo_name: dataDoc[i].doc_file_name,
              file_logo_path: dataDoc[i].doc_path_file,
              file_show:
                dataDoc[i].doc_path_file && dataDoc[i].doc_path_file !== ""
                  ? this.url + dataDoc[i].doc_path_file
                  : require("@/assets/default_photo_.png"),
            });
          }
        }

        this.PICItems = data.detail_pic;
        this.OrderItems = data.detail_order;

        this.OutstandingItems = data.detail_outstanding_payment;
        this.LogBookItems = data.detail_log_book;
        // this.propListReqDoc.initialWhere =
        //   "cm_contact_id=" + data.cm_contact_id;
        // this.$refs.ref_CustomerRequiredDoc.doGetList("");

        // this.GetPickUpList();
        // this.GetOutstandingList();
        // this.GetPICList();
        // this.GetQuotationList();
        // this.GetOrderList();
        // this.GetLogBookList();
      });
    },
  },
  mounted() {
    this.M_ClearForm();
    this.GetDataBy();
  },
};
</script>

<style>
</style>