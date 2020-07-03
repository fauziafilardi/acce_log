<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>{{title}} Document Type</span>
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
              <b-form :data-vv-scope="'{FormName}'" :data-vv-value-path="'{FormName}'">
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
                          <label>Dokument Type</label>
                        </span>
                        <ACCLookUp
                          @change="Onmk_dokument_type_idChange"
                          :prop="PI_mk_dokument_type_id"
                          v-model="M_MkQuotationDocument.mk_dokument_type_id"
                          :label="M_MkQuotationDocument.dokument_typeLabel"
                          ref="ref_mk_dokument_type_id"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Descs</label>
                        </span>
                        <ACCTextArea
                          :prop="PI_descs"
                          v-model="M_MkQuotationDocument.descs"
                          ref="ref_descs"
                        />
                      </b-col>
                    </b-row>

                    <b-row style="margin-top: 10px;">
                      <b-col md="6">
                        <ABSButton
                          :text="'Save Quotation'"
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

      M_MkQuotationDocument: {
        mk_quotation_document_id: 0,
        mk_quotation_id: 0,
        mk_dokument_type_id: 0,
        dokument_typeLabel: "",
        descs: "",
        user_input: "",
        user_edit: "",
        time_input: "",
        time_edit: "",
        row_id: 0,
        lastupdatestamp: 0
      },
      PI_mk_dokument_type_id: {
        dataLookUp: {
          LookUpCd: "GetMkDocumentType",
          ColumnDB: "mk_dokument_type_id",
          InitialWhere: "",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "dokument_type,descs"
        },
        cValidate: "",
        cName: "mk_dokument_type_id",
        cOrder: 1,
        cKey: false,
        cStatic: false,
        cProtect: false,
        cParentForm: "MK_FormMkQuotationDocument",
        cOption: [],
        cDisplayColumn: "",
        cInputStatus: this.inputStatus
      },
      PI_descs: {
        cValidate: "",
        cName: "descs",
        cOrder: 2,
        cKey: false,
        cProtect: false,
        cResize: false,
        cReadonly: false,
        cRows: 3,
        cMaxRows: 3,
        cSize: "md",
        cParentForm: "MK_FormMkQuotationDocument",
        cInputStatus: this.inputStatus
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
    Onmk_dokument_type_idChange(data) {
      this.$nextTick(() => {
        this.M_MkQuotationDocument.mk_dokument_type_id = data.row_id;
        this.M_MkQuotationDocument.dokument_typeLabel = data.descs;
      });
    },

    M_ClearForm() {
      this.M_MkQuotationDocument = {
        mk_quotation_document_id: 0,
        mk_quotation_id: 0,
        mk_dokument_type_id: 0,
        dokument_typeLabel: "",
        descs: "",
        user_input: "",
        user_edit: "",
        time_input: "",
        time_edit: "",
        row_id: 0,
        lastupdatestamp: 0
      };
    },

    doSave() {
      this.$validator._base
        .validateAll("MK_FormMkQuotationDocument")
        .then(result => {
          if (!result) return;
          this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
            ress => {
              if (ress.value) {
                this.$validator.errors.clear("MK_FormMkQuotationDocument");
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
        line_no: 7,
        mk_quotation_id: this.paramFromList.row_id,
        mk_dokument_type_id: this.M_MkQuotationDocument.mk_dokument_type_id,
        descs: this.M_MkQuotationDocument.descs,
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
        line_no: 7,
        mk_quotation_document_id: this.M_MkQuotationDocument
          .mk_quotation_document_id,
        mk_quotation_id: this.paramFromList.row_id,
        mk_dokument_type_id: this.M_MkQuotationDocument.mk_dokument_type_id,
        descs: this.M_MkQuotationDocument.descs,
        lastupdatestamp: this.M_MkQuotationDocument.lastupdatestamp,
        user_edit: this.getDataUser().user_id
      };

      this.putJSON(this.getUrlCRUD(), param).then(response => {
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          this.doBack();
        });
      });
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

        this.M_MkQuotationDocument = {
          mk_quotation_document_id: data.mk_quotation_document_id,
          mk_quotation_id: data.mk_quotation_id,
          mk_dokument_type_id: data.mk_dokument_type_id__lo_1,
          dokument_typeLabel: data.dokument_type__lbl__lo_1,
          descs: data.descs__tb_2,
          user_input: data.user_input,
          user_edit: data.user_edit,
          time_input: data.time_input,
          time_edit: data.time_edit,
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
      this.GetDataBy();
    } else {
      this.title = "Add";
    }
  }
};
</script>

