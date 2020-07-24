<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Add Quotation</span>
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
                            Company
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
                    <b-row v-if="inputStatus == 'edit'">
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
                              {{ M_Quotation.picLabel }}
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
                    <hr v-if="inputStatus == 'edit'" />
                    <b-row>
                      <b-col md="8">
                        <span>
                          <label>Select PIC</label>
                        </span>
                        <ACCLookUp
                          @change="OnpicChange"
                          :prop="PI_pic"
                          v-model="M_Quotation.pic"
                          :label="M_Quotation.picLabel"
                          ref="ref_pic"
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
                      <b-col md="4" style="padding-right: 0px !important;">
                        <span>
                          <label>Valid Thru</label>
                        </span>
                        <ACCDateTime
                          @input="OndateChange"
                          :prop="PI_date"
                          v-model="M_Quotation.date"
                          ref="ref_date"
                        />
                      </b-col>
                      <div style="margin-top: 35px; width: fit-content;">
                        <span>
                          -
                        </span>
                      </div>
                      <b-col md="4">
                        <span>
                          <label>&nbsp;</label>
                        </span>
                        <ACCDateTime
                          @input="Ondate2Change"
                          :prop="PI_date2"
                          v-model="M_Quotation.date2"
                          ref="ref_date2"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="8">
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
                      <b-col md="8">
                        <span>
                          <label>Description</label>
                        </span>
                        <ACCTextArea :prop="PI_descs" v-model="M_Quotation.descs" ref="ref_descs" />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="4">
                        <span>
                          <label>Extra Pick/Drop Charges</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_extra_charge"
                          v-model="M_Quotation.extra_charge"
                          ref="ref_extra_charge"
                        />
                      </b-col>
                      <b-col md="4">
                        <span>
                          <label>Over Night Charges</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_overnight_charge"
                          v-model="M_Quotation.overnight_charge"
                          ref="ref_overnight_charge"
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
        picLabel: "",
        pic_phone_no: "",
        date: this.momentDate(new Date()),
        date2: this.momentDate(new Date()),
        quotation_no: "",
        project_name: "",
        descs: "",
        extra_charge: "",
        overnight_charge: ""
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
      PI_pic: {
        dataLookUp: {
          LookUpCd: "GetContactPerson",
          ColumnDB: "contact_person_id",
          InitialWhere: " cm_contact_id = 0 ",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "name,phone_no,email,time_edit"
        },
        cValidate: "required",
        cName: "pic",
        ckey: false,
        cOrder: 2,
        cProtect: false,
        cParentForm: "MK_AddQuotation",
        cStatic: false,
        cOption: [],
        cDisplayColumn: "name",
        cInputStatus: this.inputStatus
      },
      PI_quotation_no: {
        cValidate: "",
        cName: "quotation_no",
        cOrder: 3,
        cKey: false,
        cType: "text",
        cProtect: true,
        cParentForm: "MK_AddQuotation",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_date: {
        cValidate: "",
        cName: "date",
        cOrder: 4,
        cKey: false,
        cProtect: false,
        cWithTime: false,
        cFormat: "dd/MM/yyyy",
        cParentForm: "MK_AddQuotation",
        cInputStatus: this.inputStatus
      },
      PI_date2: {
        cValidate: "",
        cName: "date2",
        cOrder: 5,
        cKey: false,
        cProtect: false,
        cWithTime: false,
        cFormat: "dd/MM/yyyy",
        cParentForm: "MK_AddQuotation",
        cInputStatus: this.inputStatus
      },
      PI_project_name: {
        cValidate: "max:60",
        cName: "project_name",
        cOrder: 6,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "MK_AddQuotation",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_descs: {
        cValidate: "required|max:500",
        cName: "descs",
        cOrder: 7,
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
      PI_extra_charge: {
        cValidate: "",
        cName: "extra_charge",
        cOrder: 8,
        cKey: false,
        cType: "decimal",
        cProtect: false,
        cParentForm: "MK_AddQuotation",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_overnight_charge: {
        cValidate: "",
        cName: "overnight_charge",
        cOrder: 9,
        cKey: false,
        cType: "decimal",
        cProtect: false,
        cParentForm: "MK_AddQuotation",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
    };
  },
  computed: {
    paramFromList() {
      var param = this.$store.getters.getParamPage;
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
      var param = this.$store.getters.getParamPage;
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
        this.PI_pic.dataLookUp.InitialWhere = " cm_contact_id = '" + data.row_id + "' ";
        // this.M_Quotation.fulladdress =
        //   data.address +
        //   ", " +
        //   data.district +
        //   ", " +
        //   data.city +
        //   ", " +
        //   data.province +
        //   " - " +
        //   data.country;
        // this.M_Quotation.address = data.address;
        // this.M_Quotation.phone_no =
        //   data.phone_no && data.phone_no !== "" ? data.phone_no : "-";
        // this.M_Quotation.email =
        //   data.email && data.email !== "" ? data.email : "-";
        // this.M_Quotation.website =
        //   data.website && data.website !== "" ? data.website : "-";
        // this.M_Quotation.pic =
        //   data.contact_person && data.contact_person !== ""
        //     ? data.contact_person
        //     : "-";
        // this.M_Quotation.pic_phone_no =
        //   data.contact_phone_no && data.contact_phone_no !== ""
        //     ? data.contact_phone_no
        //     : "-";
      });
    },
    OnpicChange(data) {
      this.M_Quotation.pic = data.id;
      this.M_Quotation.picLabel = data.label;
    },
    OndateChange(data) {
      this.PI_date2.cValidate = "min_date:" + this.momentDate(new Date(data))
    },
    Ondate2Change(data) {
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
        picLabel: "",
        pic_phone_no: "",
        date: this.momentDate(new Date()),
        date2: this.momentDate(new Date()),
        quotation_no: "",
        project_name: "",
        descs: "",
        extra_charge: "",
        overnight_charge: ""
      };
    },
    doSave() {
      this.$validator._base.validateAll("MK_AddQuotation").then(result => {
        // console.log(result)
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
          ress => {
            if (ress.value) {
              this.$validator.errors.clear("MK_AddQuotation");
              if (this.inputStatus == "edit") {
                this.M_Update();
              } else {
                this.M_Insert();
              }
            }
          }
        );
      });
    },
    M_Insert() {
      // console.log(this.M_Quotation)
      var param = {
        option_url: "/MK/MK_Quotation",
        line_no: 0,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        ss_subportfolio_id: this.getDataUser().subportfolio_id,
        cm_contact_id: this.M_Quotation.customer && this.M_Quotation.customer !== '' ? this.M_Quotation.customer : "NULL",
        cm_contact_person_id: this.M_Quotation.pic && this.M_Quotation.pic !== '' ? this.M_Quotation.pic : "NULL",
        quotation_date: this.momentDate(new Date()),
        quotation_type: this.M_Quotation.type,
        project_name: this.M_Quotation.project_name,
        descs: this.M_Quotation.descs,
        // project_value: this.M_Quotation.project_value && this.M_Quotation.project_value !== '' ? this.replaceAllString(this.M_Quotation.project_value, ',', '', 'number') : 0,
        start_date: this.M_Quotation.date && this.M_Quotation.date !== '' ? this.M_Quotation.date : "NULL",
        expired_date: this.M_Quotation.date2 && this.M_Quotation.date2 !== '' ? this.M_Quotation.date2 : "NULL",
        extra_pick_drop_charges: this.replaceAllString(this.M_Quotation.extra_charge, ',', '', 'number'),
        over_night_charges: this.replaceAllString(this.M_Quotation.overnight_charge, ',', '', 'number'),
        status: "N",
        user_input: this.getDataUser().user_id
      };

      this.postJSON(this.getUrlCRUD(), param).then(response => {
        // console.log(response)
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          // this.doBack();
          var param = {
            row_id: response.Data[0].row_id,
            lastupdatestamp: 0
          }
          this.$store.commit("setParamPage", param);
          this.$router.replace({ name: "MK_ViewQuotation" });
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
        cm_contact_id: this.M_Quotation.customer && this.M_Quotation.customer !== '' ? this.M_Quotation.customer : "NULL",
        cm_contact_person_id: this.M_Quotation.pic && this.M_Quotation.pic !== '' ? this.M_Quotation.pic : "NULL",
        quotation_no: this.M_Quotation.quotation_no,
        quotation_date: this.M_Quotation.quotation_date && this.M_Quotation.quotation_date !== '' ? this.M_Quotation.quotation_date : "NULL",
        start_date: this.M_Quotation.date && this.M_Quotation.date !== '' ? this.M_Quotation.date : "NULL",
        expired_date: this.M_Quotation.date2 && this.M_Quotation.date2 !== '' ? this.M_Quotation.date2 : "NULL",
        project_name: this.M_Quotation.project_name,
        descs: this.M_Quotation.descs,
        extra_pick_drop_charges: this.M_Quotation.extra_charge && this.M_Quotation.extra_charge !== '' ? this.replaceAllString(this.M_Quotation.extra_charge, ',', '', 'number') : 0,
        over_night_charges: this.M_Quotation.overnight_charge && this.M_Quotation.overnight_charge !== '' ? this.replaceAllString(this.M_Quotation.overnight_charge, ',', '', 'number') : 0,
        expired_date: this.M_Quotation.valid_until && this.M_Quotation.valid_until !== '' ? this.M_Quotation.valid_until : "NULL",
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
            data.address,
          address: data.address,
          phone_no: data.phone_no && data.phone_no !== "" ? data.phone_no : "-",
          email: data.email && data.email !== "" ? data.email : "-",
          website: data.website && data.website !== "" ? data.website : "-",
          pic_phone_no:
            data.contact_phone_no && data.contact_phone_no !== ""
              ? data.contact_phone_no
              : "-",
          date: data.start_date,
          date2: data.expired_date,
          type: data.quotation_type,
          typeLabel: data.type,
          quotation_no: data.quotation_no,
          quotation_date: data.quotation_date,
          project_name: data.project_name,
          descs: data.descs,
          extra_charge: this.isCurrency(data.extra_pick_drop_charges, this.decimal),
          overnight_charge: this.isCurrency(data.over_night_charges, this.decimal),
          valid_until: data.expired_date,
          status: data.status,
          pic: data.cm_contact_person_id,
          picLabel: data.contact_person_name
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