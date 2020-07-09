<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>{{title}} Log Book</span>
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
              <b-form :data-vv-scope="'Frm_Logbook'" :data-vv-value-path="'Frm_Logbook'">
                <b-row>
                  <b-col md="2">
                    <div>
                      <!-- <img :src="M_NewProspect.path_file" alt width="100%" /> -->
                      <img :src="require('@/assets/paper.png')" alt style="width: 70px;" />
                    </div>
                  </b-col>
                  <b-col md="10">
                    <b-row>
                      <b-col md="6">
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
                      <b-col :md="mdSave">
                        <ABSButton
                          :text="'Save'"
                          classButton="btn btn--default"
                          classIcon="icon-style-default"
                          @click="doSave"
                          styleButton="height: 40px;width: 100%;"
                        />
                      </b-col>
                      <b-col md="3" v-if="disableBtnDelete==true">
                        <ABSButton
                          :text="'Delete'"
                          classButton="btn btn--default"
                          classIcon="icon-style-default"
                          @click="doDelete"
                          styleButton="height: 40px;width: 100%;"
                        />
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
      title: "",
      mdSave: 6,
      disableBtnDelete: false,
      M_LogBook: {
        mk_trx_logbook_id: 0,
        logbook_date: null,
        logbook_type: "",
        descs: ""
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
      }
    };
  },
  computed: {
    paramFromList() {
      var param = this.$route.params;
      return param;
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
      // this.$router.go(-1);
      this.$router.push({ name: "MK_Quotation" });
    },

    M_ClearForm() {
      this.M_LogBook = {
        mk_trx_logbook_id: 0,
        logbook_date: null,
        logbook_type: "",
        descs: ""
      };
    },

    doSave() {
      this.$validator._base.validateAll("Frm_Logbook").then(result => {
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
          ress => {
            if (ress.value) {
              this.$validator.errors.clear("Frm_Logbook");
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
      var param = {
        option_url: "/MK/MK_Quotation",
        line_no: 2,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        logbook_type: "F", //this.paramFromList.quotation_type,
        referance_no: this.paramFromList.quotation_no,
        logbook_date: this.momentDateFormatting(new Date(), "YYYY-MM-DD HH:mm"),
        descs: this.M_LogBook.descs,
        cm_contact_id: this.paramFromList.cm_contact_id,
        cm_contact_person_id: "NULL",
        action_type: "",
        meeting_address: "",
        user_input: this.getDataUser().user_id
      };

      this.postJSON(this.getUrlCRUD(), param).then(response => {
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          this.doBack();
        });
      });
    },
    M_Update() {
      var param = {
        option_url: "/MK/MK_Quotation",
        line_no: 2,
        mk_trx_logbook_id: this.M_LogBook.mk_trx_logbook_id,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        logbook_type: this.M_LogBook.logbook_type, //this.paramFromList.quotation_type,
        referance_no: this.paramFromList.quotation_no,
        logbook_date: this.M_LogBook.logbook_date, //this.momentDateFormatting(new Date(), "YYYY-MM-DD HH:mm"),
        descs: this.M_LogBook.descs,
        cm_contact_id: this.paramFromList.cm_contact_id,
        cm_contact_person_id: "NULL",
        action_type: "",
        meeting_address: "",
        lastupdatestamp: this.paramFromList.DetailList.lastupdatestamp,
        user_edit: this.getDataUser().user_id
      };

      this.putJSON(this.getUrlCRUD(), param).then(response => {
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          this.doBack();
        });
      });
    },
    doDelete() {
      this.alertConfirmation("Are You Sure Want To Delete This Data ?").then(
        ress => {
          if (ress.value) {
            this.M_Delete();
          }
        }
      );
    },
    M_Delete() {
      var param = {
        option_url: "/MK/MK_Quotation",
        line_no: 2,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.DetailList.lastupdatestamp
      };
      this.deleteJSON(this.getUrlCRUD(), param).then(response => {
        if (response == null) return;
        this.alertSuccess("Data Has Been Deleted").then(() => {
          this.doBack();
        });
      });
    },
    GetDataBy() {
      var param = {
        option_url: "/MK/MK_Quotation",
        line_no: 2,
        id: this.paramFromList.DetailList.row_id,
        lastupdatestamp: this.paramFromList.DetailList.lastupdatestamp
      };

      this.getJSON(this.getUrlCRUD(), param).then(response => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];

        this.M_LogBook = {
          mk_trx_logbook_id: data.mk_trx_logbook_id,
          descs: data.descs,
          logbook_date: data.logbook_date,
          logbook_type: data.logbook_type,
          row_id: data.row_id,
          lastupdatestamp: data.lastupdatestamp
        };
      });
    }
  },
  mounted() {
    this.M_ClearForm();
    if (this.inputStatus == "edit") {
      this.title = "Edit";
      this.mdSave = 3;
      this.disableBtnDelete = true;
      this.GetDataBy();
    } else {
      this.title = "Add";
    }
  }
};
</script>

