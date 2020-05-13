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
                    <img :src="require('@/assets/paper.png')" alt style="width: 100px;" />
                  </b-col>
                  <b-col md="10">
                    <b-row>
                      <b-col md="8">
                        <span>
                          <label v-if="inputStatus == 'new'">
                            Customer
                            <span style="color:red;">*</span>
                          </label>
                          <template v-if="inputStatus == 'edit'">{{ M_Quotation.customerLabel }}</template>
                        </span>
                        <ACCLookUp
                          v-if="inputStatus == 'new'"
                          @change="OncustomerChange"
                          :prop="PI_customer"
                          v-model="M_Quotation.customer"
                          :label="M_Quotation.customerLabel"
                          ref="ref_customer"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="8">
                        <b-row>
                          <b-col>
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
                    </b-row>
                    <hr />
                    <b-row>
                      <b-col md="4">
                        <span>
                          <label>Date</label>
                        </span>
                        <ACCDateTime
                          @input="OndateChange"
                          :prop="PI_date"
                          v-model="M_Quotation.date"
                          ref="ref_date"
                        />
                      </b-col>
                      <b-col md="4">
                        <span>
                          <label>Type</label>
                        </span>
                        <ACCDropDown
                          @change="OntypeChange"
                          :prop="PI_type"
                          v-model="M_Quotation.type"
                          :label="M_Quotation.typeLabel"
                          ref="ref_type"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="4">
                        <span>
                          <label>Quotation Number</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_quotation_no"
                          v-model="M_Quotation.quotation_no"
                          ref="ref_quotation_no"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Project Name</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_project_name"
                          v-model="M_Quotation.project_name"
                          ref="ref_project_name"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Description</label>
                        </span>
                        <ACCTextArea :prop="PI_descs" v-model="M_Quotation.descs" ref="ref_descs" />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Project Value</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_project_value"
                          v-model="M_Quotation.project_value"
                          ref="ref_project_value"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="4">
                        <span>
                          <label>Valid Until</label>
                        </span>
                        <ACCDateTime
                          @input="Onvalid_untilChange"
                          :prop="PI_valid_until"
                          v-model="M_Quotation.valid_until"
                          ref="ref_valid_until"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="4">
                        <span>
                          <label>Status</label>
                        </span>
                        <ACCDropDown
                          @change="OnstatusChange"
                          :prop="PI_status"
                          v-model="M_Quotation.status"
                          :label="M_Quotation.statusLabel"
                          ref="ref_status"
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
      M_Quotation: {
        customer: "",
        customerLabel: "",
        fulladdress: "",
        address: "",
        phone_no: "",
        email: "",
        website: "",
        pic: "",
        pic_phone_no: "",
        date: this.momentDate(new Date()),
        type: "",
        typeLabel: "",
        quotation_no: "",
        project_name: "",
        descs: "",
        project_value: "",
        valid_until: "",
        status: "N",
        statusLabel: "New"
      },
      PI_customer: {
        dataLookUp: {
          LookUpCd: "GetCMContact",
          ColumnDB: "contact_id",
          InitialWhere: "",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "name,contact_person,time_edit"
        },
        cValidate: "required",
        cName: "customer",
        ckey: false,
        cOrder: 1,
        cProtect: false,
        cParentForm: "MK_AddQuotation",
        cStatic: false,
        cOption: [],
        cDisplayColumn: "name,contact_person,time_edit",
        cInputStatus: this.inputStatus
      },
      PI_date: {
        cValidate: "",
        cName: "date",
        cOrder: 2,
        cKey: false,
        cProtect: false,
        cWithTime: true,
        cFormat: "dd/MM/yyyy",
        cParentForm: "MK_AddQuotation",
        cInputStatus: this.inputStatus
      },
      PI_type: {
        dataLookUp: null,
        cValidate: "",
        cName: "type",
        ckey: false,
        cOrder: 3,
        cProtect: false,
        cParentForm: "MK_AddQuotation",
        cStatic: true,
        cOption: [
          { id: "F", label: "FTL" },
          { id: "L", label: "LTL" },
          { id: "R", label: "Rental" },
          { id: "P", label: "Project Base" }
        ],
        cDisplayColumn: "type_type,descs",
        cInputStatus: this.inputStatus
      },
      PI_quotation_no: {
        cValidate: "",
        cName: "quotation_no",
        cOrder: 4,
        cKey: false,
        cType: "text",
        cProtect: true,
        cParentForm: "MK_AddQuotation",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_project_name: {
        cValidate: "",
        cName: "project_name",
        cOrder: 5,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "MK_AddQuotation",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_descs: {
        cValidate: "",
        cName: "descs",
        cOrder: 6,
        cKey: false,
        cProtect: false,
        cResize: false,
        cReadonly: false,
        cRows: 3,
        cMaxRows: 10,
        cSize: "md",
        cParentForm: "MK_AddQuotation",
        cInputStatus: this.inputStatus
      },
      PI_project_value: {
        cValidate: "",
        cName: "project_value",
        cOrder: 7,
        cKey: false,
        cType: "decimal",
        cProtect: false,
        cParentForm: "MK_AddQuotation",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_valid_until: {
        cValidate: "",
        cName: "valid_until",
        cOrder: 8,
        cKey: false,
        cProtect: false,
        cWithTime: false,
        cFormat: "dd/MM/yyyy",
        cParentForm: "MK_AddQuotation",
        cInputStatus: this.inputStatus
      },
      PI_status: {
        dataLookUp: null,
        cValidate: "",
        cName: "status",
        ckey: false,
        cOrder: 9,
        cProtect: false,
        cParentForm: "MK_AddQuotation",
        cStatic: true,
        cOption: [
          { id: "N", label: "New" },
          { id: "C", label: "Close" },
          { id: "X", label: "Cancel" }
        ],
        cDisplayColumn: "status_cd,descs",
        cInputStatus: this.inputStatus
      }
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
    OncustomerChange(data) {
      this.$nextTick(() => {
        this.M_Quotation.customer = data.row_id;
        this.M_Quotation.customerLabel = data.name;
        this.M_Quotation.fulladdress =
          data.address +
          ", " +
          data.district +
          ", " +
          data.city +
          ", " +
          data.province +
          " - " +
          data.country;
        this.M_Quotation.address = data.address;
        this.M_Quotation.phone_no =
          data.phone_no && data.phone_no !== "" ? data.phone_no : "-";
        this.M_Quotation.email =
          data.email && data.email !== "" ? data.email : "-";
        this.M_Quotation.website =
          data.website && data.website !== "" ? data.website : "-";
        this.M_Quotation.pic =
          data.contact_person && data.contact_person !== ""
            ? data.contact_person
            : "-";
        this.M_Quotation.pic_phone_no =
          data.contact_phone_no && data.contact_phone_no !== ""
            ? data.contact_phone_no
            : "-";
      });
    },
    OndateChange(data) {
      this.PI_valid_until.cValidate = "min_date:" + this.momentDate(new Date(data))
    },
    OntypeChange(data) {
      this.$nextTick(() => {
        this.M_Quotation.type = data.id;
        this.M_Quotation.typeLabel = data.label;
      });
    },
    Onvalid_untilChange(data) {},
    OnstatusChange(data) {
      this.$nextTick(() => {
        this.M_Quotation.status = data.id;
        this.M_Quotation.statusLabel = data.label;
      });
    },
    M_ClearForm() {
      this.M_Quotation = {
        customer: "",
        customerLabel: "",
        fulladdress: "",
        address: "",
        phone_no: "",
        email: "",
        website: "",
        pic: "",
        pic_phone_no: "",
        date: this.momentDateFormatting(new Date(), 'YYYY-MM-DD HH:mm'),
        type: "",
        typeLabel: "",
        quotation_no: "",
        project_name: "",
        descs: "",
        project_value: "",
        valid_until: "",
        status: "N",
        statusLabel: "New"
      };

      this.PI_valid_until.cValidate = "min_date:" + this.getToday()
    },
    doSave() {
      this.$validator._base.validateAll("MK_AddQuotation").then(result => {
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
          ress => {
            if (ress.value) {
              this.$validator.errors.clear("MK_AddQuotation");
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
        line_no: 0,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        ss_subportfolio_id: this.getDataUser().subportfolio_id,
        cm_contact_id: this.M_Quotation.customer,
        // quotation_no: this.M_Quotation.quotation_no,
        quotation_date: this.M_Quotation.date,
        quotation_type: this.M_Quotation.type,
        project_name: this.M_Quotation.project_name,
        descs: this.M_Quotation.descs,
        project_value: this.M_Quotation.project_value,
        expired_date: this.M_Quotation.valid_until,
        status: this.M_Quotation.status,
        user_input: this.getDataUser().user_id
      };

      this.postJSON(this.getUrlCRUD(), param).then(response => {
        // console.log(response)
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          this.doBack();
        });
      });
    },
    M_Update() {
      var param = {
        option_url: "/MK/MK_Quotation",
        line_no: 0,
        mk_quotation_id: this.paramFromList.row_id,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        ss_subportfolio_id: this.getDataUser().subportfolio_id,
        cm_contact_id: this.M_Quotation.customer,
        quotation_no: this.M_Quotation.quotation_no,
        quotation_date: this.M_Quotation.date,
        quotation_type: this.M_Quotation.type,
        project_name: this.M_Quotation.project_name,
        descs: this.M_Quotation.descs,
        project_value: this.M_Quotation.project_value,
        expired_date: this.M_Quotation.valid_until,
        status: this.M_Quotation.status,
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
        option_url: "/MK/MK_Quotation",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };

      this.getJSON(this.getUrlCRUD(), param).then(response => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];

        this.M_Quotation = {
          customer: data.cm_contact_id,
          customerLabel: data.name,
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
          date: data.quotation_date,
          type: data.quotation_type,
          typeLabel: data.type,
          quotation_no: data.quotation_no,
          project_name: data.project_name,
          descs: data.descs,
          project_value: this.isCurrency(data.project_value, this.decimal),
          valid_until: data.expired_date,
          status: data.status,
          statusLabel: data.status
        };
      });
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