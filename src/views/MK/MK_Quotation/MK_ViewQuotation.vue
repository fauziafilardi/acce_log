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
                                icon="envelope"
                                size="sm"
                              />
                              {{ M_Quotation.email }}
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
                            </span>
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
                                margin-left: 10px;"
                          />
                        </span>
                        <span>
                          <font-awesome-icon
                            class="icon-style-default"
                            icon="phone-square-alt"
                            size="sm"
                            style="font-size: 17px;
                                margin-right: 10px;
                                margin-left: 10px;"
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
                                margin-left: 10px;"
                          />
                        </span>
                        <span>
                          <ABSButton
                            :text="'Cancel'"
                            classButton="btn btn--default"
                            classIcon="icon-style-1"
                            @click="doCancel"
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
                      <!-- <div> -->
                      <b-col md="3" style="width: 36% !important">
                        <span>
                          <label style="color: #999999; margin-bottom: 0px !important;">Date</label>
                        </span>
                        <br />
                        <span>{{ M_Quotation.date }}</span>
                      </b-col>
                      <b-col md="3" style="width: 26% !important">
                        <span>
                          <label style="color: #999999; margin-bottom: 0px !important;">Type</label>
                        </span>
                        <br />
                        <span>{{ M_Quotation.type }}</span>
                      </b-col>
                      <b-col md="3" style="width: 38% !important">
                        <span>
                          <label
                            style="color: #999999; margin-bottom: 0px !important;"
                          >Quotation Number</label>
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
                    <b-row>
                      <b-col style="max-width: 100px !important;">
                        <span>
                          <font-awesome-icon
                            style="color: #333399;font-size: 13px;"
                            icon="coins"
                            size="lg"
                          />&nbsp;
                          <label>Project Value</label>
                        </span>
                      </b-col>
                      <b-col>
                        <span>: Rp {{ M_Quotation.project_value }}</span>
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col style="max-width: 100px !important;">
                        <span>
                          <font-awesome-icon
                            style="color: #333399;font-size: 13px;"
                            icon="calendar-alt"
                            size="lg"
                          />&nbsp;
                          <label>Valid Until</label>
                        </span>
                      </b-col>
                      <b-col>
                        <span>: {{ M_Quotation.valid_until }}</span>
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
    <!-- Modal Reason -->
    <ABSModal
      id="Modal_MK_Quotation"
      ref="Modal_MK_Quotation"
      size="sm"
      :okCancel="isCanEdit"
      :saveOnly="!isCanEdit"
      @modalOkClicked="modalOk"
      @modalCancelClicked="modalCancel"
    >
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
    <ABSModal
      id="Modal_Email"
      ref="Modal_Email"
      size="md"
      :okCancel="isCanEdit"
      :saveOnly="!isCanEdit"
      @modalOkClicked="modalOk"
      @modalCancelClicked="modalCancel"
    >
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
        body: ""
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
        cName: "descs",
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
          return param;
        }
      }
    }
  },
  methods: {
    doSaveReason() {},
    doSendEmail() {},
    OnReasonChange(data) {
      console.log(data);
      this.$nextTick(() => {
        this.M_Quotation.reason_cd = data.reason_cd;
        this.M_Quotation.reasonCdLabel = data.label;
        this.M_Quotation.reason_descs = data.descs;
      });
    },
    doCancel() {
      this.addStatus = true;
      this.M_ClearForm();
      this.$refs.Modal_MK_Quotation._show();
    },
    doEmail() {
      this.addStatus = true;
      this.M_ClearForm();
      this.$refs.Modal_Email._show();
      this.M_Quotation.reason_descs = this.M_Quotation.descs;
    },
    doBack() {
      this.$router.go(-1);
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
    GetDataBy() {
      var param = {
        option_url: "/MK/MK_Quotation",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };

      this.getJSON(this.getUrlCRUD(), param).then(response => {
        // response from API
        console.log(response);
        if (response == null) return;

        var data = response.Data[0];

        this.M_Quotation = {
          customer: data.name,
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