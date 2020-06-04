<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Customer Status</span>
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
                :data-vv-scope="'CM_CustomerStatus'"
                :data-vv-value-path="'CM_CustomerStatus'"
              >
                <b-row>
                  <b-col md="10">
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Customer Status</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_status"
                          v-model="M_CustomerStatus.status"
                          ref="ref_status"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <div style="cursor: pointer;" @click="OpenModal()">
                          <font-awesome-icon class="icon-style-default" icon="plus-circle" />Add Action
                        </div>
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
                          :items="M_CustomerStatusDtl"
                          class="table-sm table-style-2"
                        >
                          <template v-slot:cell(action_id)="data">
                            <b-button
                              size="sm"
                              @click.stop="viewClicked(data.item, data.index)"
                              :disabled="false"
                              class="btn btn--default"
                            >
                              <font-awesome-icon
                                icon="edit"
                                class="icon-style-default"
                                style="color: white;"
                              />
                            </b-button>
                          </template>
                        </b-table>
                      </b-col>
                    </b-row>
                    <b-row style="margin-top: 10px;">
                      <b-col md="6">
                        <ABSButton
                          :text="'Save Customer'"
                          classButton="btn btn--default"
                          classIcon="icon-style-default"
                          @click="doSave"
                          styleButton="height: 40px;width: 100%;"
                        />
                      </b-col>
                    </b-row>
                  </b-col>
                </b-row>
              </b-form>
              <ABSModal id="Modal_Status" ref="Modal_Status" size="sm">
                <template slot="headerTitle">Action</template>
                <template slot="content">
                  <b-row>
                    <b-col md="12">
                      <b-form :data-vv-scope="'MStatus'" :data-vv-value-path="'MStatus'">
                        <b-row>
                          <b-col md="12">
                            <b-row>
                              <b-col md="12">
                                <span>
                                  <label>Action</label>
                                </span>
                                <ACCDropDown
                                  @change="OnactionChange"
                                  :prop="PI_action"
                                  v-model="M_ModalStatus.action"
                                  :label="M_ModalStatus.actionLabel"
                                  ref="ref_action"
                                />
                              </b-col>
                            </b-row>
                            <b-row>
                              <b-col md="12">
                                <span>
                                  <label>Month</label>
                                </span>
                                <ACCTextBox
                                  :prop="PI_month"
                                  v-model="M_ModalStatus.month"
                                  ref="ref_month"
                                />
                              </b-col>
                            </b-row>
                            <b-row>
                              <b-col md="12">
                                <span>
                                  <label>Frequency</label>
                                </span>
                                <ACCTextBox
                                  :prop="PI_freq"
                                  v-model="M_ModalStatus.freq"
                                  ref="ref_freq"
                                />
                              </b-col>
                            </b-row>
                            <b-row style="margin-top: 10px;">
                              <b-col md="6">
                                <ABSButton
                                  :text="'Add'"
                                  classButton="btn btn--default"
                                  classIcon="icon-style-1"
                                  @click="SaveModal()"
                                  styleButton="height: 40px;width: 100%;"
                                />
                              </b-col>
                              <b-col md="6">
                                <ABSButton
                                  :text="'Cancel'"
                                  classButton="btn btn--back"
                                  classIcon="icon-style-1"
                                  @click="CancelModal()"
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
      PI_status: {
        cValidate: "required",
        cName: "status",
        cOrder: 1,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "CM_CustomerStatus",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      M_CustomerStatus: {
        status: ""
      },
      fieldHeader: [
        {
          key: "action",
          label: "Action",
          tdClass: "ABStdClassList2 notranslate th-cus-center",
          thClass: "ABStdClassList2 th-cus-center"
        },
        {
          key: "month",
          label: "Month",
          tdClass: "ABStdClassList2 notranslate th-cus-center",
          thClass: "ABStdClassList2 th-cus-center"
        },
        {
          key: "freq",
          label: "Frequency",
          tdClass: "ABStdClassList2 notranslate th-cus-center",
          thClass: "ABStdClassList2 th-cus-center"
        },
        {
          key: "action_id",
          label: "Edit",
          tdClass: "ABStdClassList2 notranslate th-cus-center",
          thClass: "ABStdClassList2 th-cus-center"
        }
      ],
      M_CustomerStatusDtl: [],
      M_ModalStatus: {
        action: "",
        actionLabel: "",
        month: "",
        freq: ""
      },
      PI_action: {
        dataLookUp: null,
        cValidate: "required",
        cName: "action",
        ckey: false,
        cOrder: 1,
        cProtect: false,
        cParentForm: "MStatus",
        cStatic: true,
        cOption: [
          { id: "C", label: "Call" },
          { id: "V", label: "Visit" },
          { id: "E", label: "Entertaintment" }
        ],
        cDisplayColumn: "action_type,descs",
        cInputStatus: this.inputStatus
      },
      PI_month: {
        cValidate: "",
        cName: "month",
        cOrder: 2,
        cKey: false,
        cType: "numeric",
        cProtect: false,
        cParentForm: "MStatus",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_freq: {
        cValidate: "",
        cName: "freq",
        cOrder: 3,
        cKey: false,
        cType: "numeric",
        cProtect: false,
        cParentForm: "MStatus",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      ModalIndex: null
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
    M_ClearForm() {
      this.M_CustomerStatus = {
        status: ""
      };
    },
    OnactionChange(data) {
      this.$nextTick(() => {
        this.M_ModalStatus.action = data.id;
        this.M_ModalStatus.actionLabel = data.label;
      });
    },
    viewClicked(record, index) {
      this.ModalIndex = index;
      this.OpenModal();
      var dt = this.M_CustomerStatusDtl[index];
      this.M_ModalStatus = {
        action: dt.action_id,
        actionLabel: dt.action,
        month: dt.month && dt.month !== "" ? dt.month : 0,
        freq: dt.freq && dt.freq !== "" ? dt.freq : 0
      };
    },
    M_ClearModal() {
      this.M_ModalStatus = {
        action: "",
        actionLabel: "",
        month: "",
        freq: ""
      };
    },
    OpenModal(from) {
      this.M_ClearModal();
      this.$refs.Modal_Status._show();
    },
    CancelModal() {
      this.$refs.Modal_Status._hide();
      this.ModalIndex = null;
    },
    SaveModal() {
      if (this.ModalIndex !== null) {
        this.M_CustomerStatusDtl[
          this.ModalIndex
        ].action = this.M_ModalStatus.actionLabel;
        this.M_CustomerStatusDtl[
          this.ModalIndex
        ].action_id = this.M_ModalStatus.action;
        this.M_CustomerStatusDtl[this.ModalIndex].month =
          this.M_ModalStatus.month && this.M_ModalStatus.month !== ""
            ? this.M_ModalStatus.month
            : 0;
        this.M_CustomerStatusDtl[this.ModalIndex].freq =
          this.M_ModalStatus.freq && this.M_ModalStatus.freq !== ""
            ? this.M_ModalStatus.freq
            : 0;
      } else {
        this.M_CustomerStatusDtl.push({
          action: this.M_ModalStatus.actionLabel,
          action_id: this.M_ModalStatus.action,
          month:
            this.M_ModalStatus.month && this.M_ModalStatus.month !== ""
              ? this.M_ModalStatus.month
              : 0,
          freq:
            this.M_ModalStatus.freq && this.M_ModalStatus.freq !== ""
              ? this.M_ModalStatus.freq
              : 0
        });
      }

      this.$forceUpdate();

      this.CancelModal();
    },
    doSave() {
      this.$validator._base.validateAll("CM_CustomerStatus").then(result => {
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
          ress => {
            if (ress.value) {
              this.$validator.errors.clear("CM_CustomerStatus");
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
      var paramD = [];
      var paramH = {
        _Method_: "SAVE",
        _LineNo_: 0,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        descs: this.M_CustomerStatus.status,
        user_input: this.getDataUser().user_id
      };

      this.M_CustomerStatusDtl.forEach((act, index) => {
        paramD.push({
          _Method_: "SAVE",
          _LineNo_: 1,
          cm_customer_status_id: "A_Insert.row_id_output",
          action_type: act.action_id,
          action: act.action,
          month: act.month && act.month !== "" ? parseInt(act.month) : 0,
          freq: act.freq && act.freq !== "" ? parseInt(act.freq) : 0,
          user_input: this.getDataUser().user_id
        });
      });

      var param = {
        option_url: "/CM/CM_CustomerStatus",
        line_no: 0,
        Data: [
          {
            A_Insert: paramH,
            B_Looping: paramD
          }
        ]
      };

      this.postJSONMulti(this.getUrlProsesDataPostMulti(), param).then(
        response => {
          if (response == null) return;
          this.alertSuccess("Save Data Has Been Successfully").then(() => {
            this.doBack();
          });
        }
      );
    },
    GetDataBy() {
      var param = {
        option_url: "/CM/CM_CustomerStatus",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };

      this.getJSON(this.getUrlCRUD(this.paramFromList.row_id), param).then(
        response => {
          // response from API
          if (response == null) return;

          var data = response.Data[0];
          this.M_CustomerStatus = {
            status: data.descs
          };

          response.Data.forEach((dtl, index) => {
            this.M_CustomerStatusDtl.push({
              action_id:
                dtl.action == "Call" ? "C" : dtl.action == "Visit" ? "V" : "E",
              action: dtl.action,
              month: dtl.month,
              freq: dtl.freq
            });
          });

          this.$forceUpdate();
        }
      );
    },
    M_Update() {
      var paramD = [];
      var paramH = {
        _Method_: "UPDATE",
        _LineNo_: 0,
        cm_customer_status_id: this.paramFromList.row_id,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        descs: this.M_CustomerStatus.status,
        user_edit: this.getDataUser().user_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };

      var paramDeleteDtl = {
        _Method_: "DELETE",
        _LineNo_: 2,
        cm_customer_status_id: this.paramFromList.row_id
      };

      this.M_CustomerStatusDtl.forEach((act, index) => {
        paramD.push({
          _Method_: "SAVE",
          _LineNo_: 1,
          cm_customer_status_id: this.paramFromList.row_id,
          action_type: act.action_id,
          action: act.action,
          month: act.month && act.month !== "" ? parseInt(act.month) : 0,
          freq: act.freq && act.freq !== "" ? parseInt(act.freq) : 0,
          user_input: this.getDataUser().user_id
        });
      });

      var param = {
        option_url: "/CM/CM_CustomerStatus",
        line_no: 0,
        Data: [
          {
            A_Update: paramH,
            B_Delete: paramDeleteDtl,
            C_Looping: paramD
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
</style>