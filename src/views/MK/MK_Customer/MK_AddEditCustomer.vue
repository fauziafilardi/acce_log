<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Customer List</span>
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
                :data-vv-scope="'MK_AddNewProspect'"
                :data-vv-value-path="'MK_AddNewProspect'"
              >
                <b-row>
                  <b-col md="2">
                    <div>
                      <img id="logo" :src="M_NewProspect.file_show" alt width="100%" />
                    </div>
                    <ACCImageUpload
                      :prop="PI_logo"
                      @change="onlogoChange"
                      v-model="M_NewProspect.file_logo"
                    />
                  </b-col>
                  <b-col md="10">
                    <!-- <b-row>
                    <b-col md="12">-->
                    <b-row>
                      <b-col md="9">
                        <span>
                          <label>Customer Name</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_customer_name"
                          v-model="M_NewProspect.customer_name"
                          ref="ref_customer_name"
                        />
                      </b-col>
                    </b-row>
                    <b-row
                      class="row-view"
                      style="padding-bottom: 10px;padding-top: 5px; margin-left: 5px !important;"
                    >
                      <b-col>
                        <span>
                          <font-awesome-icon class="icon-style-default" icon="check-circle" />
                          {{M_NewProspect.contact_created}}
                        </span>
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="9">
                        <span>
                          <label>Address</label>
                        </span>
                        <ACCTextArea
                          :prop="PI_address"
                          v-model="M_NewProspect.address"
                          ref="ref_address"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="3">
                        <span>
                          <label>District</label>
                        </span>
                        <ACCLookUp
                          @change="OndistrictChange"
                          :prop="PI_district"
                          v-model="M_NewProspect.district"
                          :label="M_NewProspect.districtLabel"
                          ref="ref_district"
                        />
                      </b-col>
                      <b-col md="3">
                        <span>
                          <label>City</label>
                        </span>
                        <ACCLookUp
                          @change="OncityChange"
                          :prop="PI_city"
                          v-model="M_NewProspect.city"
                          :label="M_NewProspect.cityLabel"
                          ref="ref_city"
                        />
                      </b-col>
                      <b-col md="3">
                        <span>
                          <label>Province</label>
                        </span>
                        <ACCLookUp
                          @change="OnprovinceChange"
                          :prop="PI_province"
                          v-model="M_NewProspect.province"
                          :label="M_NewProspect.provinceLabel"
                          ref="ref_province"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="3">
                        <span>
                          <label>Country</label>
                        </span>
                        <ACCLookUp
                          @change="OncountryChange"
                          :prop="PI_country"
                          v-model="M_NewProspect.country"
                          :label="M_NewProspect.countryLabel"
                          ref="ref_country"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="1" class="col-p-1">
                        <span>
                          <label style="width: 100px;">Phone No.</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_phone_no_1"
                          v-model="M_NewProspect.phone_no_1"
                          ref="ref_phone_no_1"
                        />
                      </b-col>
                      <b-col md="1" class="col-p-2">
                        <span>
                          <label>&nbsp;</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_phone_no_2"
                          v-model="M_NewProspect.phone_no_2"
                          ref="ref_phone_no_2"
                        />
                      </b-col>
                      <b-col md="4" class="col-p-3">
                        <span>
                          <label>&nbsp;</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_phone_no_3"
                          v-model="M_NewProspect.phone_no_3"
                          ref="ref_phone_no_3"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Email</label>
                        </span>
                        <ACCTextBox :prop="PI_email" v-model="M_NewProspect.email" ref="ref_email" />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Website</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_website"
                          v-model="M_NewProspect.website"
                          ref="ref_website"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Contact Person</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_contact_person"
                          v-model="M_NewProspect.contact_person"
                          ref="ref_contact_person"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="1" class="col-p-1">
                        <span>
                          <label style="width: 100px;">Contact Phone No.</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_contact_phone_no_1"
                          v-model="M_NewProspect.contact_phone_no_1"
                          ref="ref_contact_phone_no_1"
                          style="width: 50px;"
                        />
                      </b-col>
                      <b-col md="1" class="col-p-2">
                        <span>
                          <label>&nbsp;</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_contact_phone_no_2"
                          v-model="M_NewProspect.contact_phone_no_2"
                          ref="ref_contact_phone_no_2"
                        />
                      </b-col>
                      <b-col md="4" class="col-p-3">
                        <span>
                          <label>&nbsp;</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_contact_phone_no_3"
                          v-model="M_NewProspect.contact_phone_no_3"
                          ref="ref_contact_phone_no_3"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="3">
                        <span>
                          <label>Customer Status</label>
                        </span>
                        <ACCLookUp
                          @change="Oncustomer_statusChange"
                          :prop="PI_customer_status"
                          v-model="M_NewProspect.customer_status"
                          :label="M_NewProspect.customer_statusLabel"
                          ref="ref_customer_status"
                        />
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
                    <!-- </b-col>
                    </b-row>-->
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
      PI_logo: {
        cName: "Logo",
        cAccept: ".jpg, .png, .gif",
        cTitle: "Add Logo",
        cModule: "MK"
      },
      PI_customer_name: {
        cValidate: "",
        cName: "customer_name",
        cOrder: 1,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "MK_AddNewProspect",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_address: {
        cValidate: "",
        cName: "address",
        cOrder: 2,
        cKey: false,
        cProtect: false,
        cResize: false,
        cReadonly: false,
        cRows: 1,
        cMaxRows: 2,
        cSize: "md",
        cParentForm: "MK_AddNewProspect",
        cInputStatus: this.inputStatus
      },
      PI_district: {
        dataLookUp: {
          LookUpCd: "GetDistrict",
          ColumnDB: "district_id",
          InitialWhere: "ss_country_id = 2",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "district,city,province,country,time_edit"
        },
        cValidate: "",
        cName: "district",
        ckey: false,
        cOrder: 3,
        // cDefault: '',
        cProtect: false,
        cParentForm: "MK_AddNewProspect",
        cStatic: false,
        cOption: [],
        cDisplayColumn: "district,city,province,country,time_edit",
        cInputStatus: this.inputStatus
      },
      PI_city: {
        dataLookUp: {
          LookUpCd: "GetCity",
          ColumnDB: "city_id",
          InitialWhere: "ss_country_id = 2",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "city,province,country,time_edit"
        },
        cValidate: "",
        cName: "city",
        ckey: false,
        cOrder: 4,
        // cDefault: '',
        cProtect: false,
        cParentForm: "MK_AddNewProspect",
        cStatic: false,
        cOption: [],
        cDisplayColumn: "city,province,country,time_edit",
        cInputStatus: this.inputStatus
      },
      PI_province: {
        dataLookUp: {
          LookUpCd: "GetProvince",
          ColumnDB: "province_id",
          InitialWhere: "ss_country_id = 2",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "province,country,time_edit"
        },
        cValidate: "",
        cName: "province",
        ckey: false,
        cOrder: 5,
        // cDefault: '',
        cProtect: false,
        cParentForm: "MK_AddNewProspect",
        cStatic: false,
        cOption: [],
        cDisplayColumn: "province,country,time_edit",
        cInputStatus: this.inputStatus
      },
      PI_country: {
        dataLookUp: {
          LookUpCd: "GetCountry",
          ColumnDB: "country_id",
          InitialWhere: "",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "country,time_edit"
        },
        cValidate: "",
        cName: "country",
        ckey: false,
        cOrder: 6,
        // cDefault: '',
        cProtect: false,
        cParentForm: "MK_AddNewProspect",
        cStatic: false,
        cOption: [],
        cDisplayColumn: "country,time_edit",
        cInputStatus: this.inputStatus
      },
      PI_phone_no_1: {
        cValidate: "max:3",
        cName: "phone_no_1",
        cOrder: 7,
        cKey: false,
        cType: "tel",
        cProtect: false,
        cParentForm: "MK_AddNewProspect",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_phone_no_2: {
        cValidate: "max:3",
        cName: "phone_no_2",
        cOrder: 8,
        cKey: false,
        cType: "numeric",
        cProtect: false,
        cParentForm: "MK_AddNewProspect",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_phone_no_3: {
        cValidate: "max:8",
        cName: "phone_no_3",
        cOrder: 9,
        cKey: false,
        cType: "numeric",
        cProtect: false,
        cParentForm: "MK_AddNewProspect",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_email: {
        cValidate: "",
        cName: "email",
        cOrder: 10,
        cKey: false,
        cType: "email",
        cProtect: false,
        cParentForm: "MK_AddNewProspect",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_website: {
        cValidate: "",
        cName: "website",
        cOrder: 11,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "MK_AddNewProspect",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_contact_person: {
        cValidate: "",
        cName: "contact_person",
        cOrder: 12,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "MK_AddNewProspect",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_contact_phone_no_1: {
        cValidate: "max:3",
        cName: "contact_phone_no_1",
        cOrder: 13,
        cKey: false,
        cType: "tel",
        cProtect: false,
        cParentForm: "MK_AddNewProspect",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_contact_phone_no_2: {
        cValidate: "max:3",
        cName: "contact_phone_no_2",
        cOrder: 14,
        cKey: false,
        cType: "numeric",
        cProtect: false,
        cParentForm: "MK_AddNewProspect",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_contact_phone_no_3: {
        cValidate: "max:8",
        cName: "contact_phone_no_3",
        cOrder: 15,
        cKey: false,
        cType: "numeric",
        cProtect: false,
        cParentForm: "MK_AddNewProspect",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_customer_status: {
        dataLookUp: {
          LookUpCd: "GetCustomerStatus",
          ColumnDB: "customer_id",
          InitialWhere: "",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "descs,time_edit"
        },
        cValidate: "",
        cName: "customer_status",
        ckey: false,
        cOrder: 16,
        // cDefault: '',
        cProtect: false,
        cParentForm: "MK_AddNewProspect",
        cStatic: false,
        cOption: [],
        cDisplayColumn: "descs,time_edit",
        cInputStatus: this.inputStatus
      },
      M_NewProspect: {
        customer_name: "",
        contact_created: "",
        address: "",
        district: "",
        districtLabel: "",
        city: "",
        cityLabel: "",
        province: "",
        provinceLabel: "",
        country: "",
        countryLabel: "",
        phone_no_1: "+62",
        phone_no_2: "",
        phone_no_3: "",
        email: "",
        website: "",
        contact_person: "",
        contact_phone_no_1: "+62",
        contact_phone_no_2: "",
        contact_phone_no_3: "",
        customer_status: "",
        customer_statusLabel: "",
        file_logo: "",
        file_show: require("@/assets/default_photo_.png"),
        file_logo_name: "",
        file_logo_path: ""
      },
      default_pic: require("@/assets/default_photo_.png")
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
    M_ClearForm() {
      this.M_NewProspect = {
        customer_name: "",
        contact_created: this.momentDateFormatting(
          new Date(),
          "DD-MM-YYYY HH.mm"
        ),
        address: "",
        distric: "",
        districLabel: "",
        city: "",
        cityLabel: "",
        province: "",
        provinceLabel: "",
        country: "",
        countryLabel: "",
        phone_no_1: "+62",
        phone_no_2: "",
        phone_no_3: "",
        email: "",
        website: "",
        contact_person: "",
        contact_phone_no_1: "+62",
        contact_phone_no_2: "",
        contact_phone_no_3: "",
        customer_status: "",
        customer_statusLabel: "",
        file_logo: "",
        file_show: this.default_pic,
        file_logo_name: "",
        file_logo_path: ""
      };
    },
    onlogoChange(data) {
      console.log(data);
      this.M_NewProspect.file_logo_name = data.name;
      this.M_NewProspect.file_logo_path = data.path;
      this.M_NewProspect.file_show = this.url + data.path;
    },
    OndistrictChange(data) {
      console.log(data);
      this.$nextTick(() => {
        this.M_NewProspect.district = data.ss_district_id;
        this.M_NewProspect.districtLabel = data.district;
      });
    },
    OncityChange(data) {
      this.$nextTick(() => {
        this.M_NewProspect.city = data.ss_city_id;
        this.M_NewProspect.cityLabel = data.city;
      });
    },
    OnprovinceChange(data) {
      this.$nextTick(() => {
        this.M_NewProspect.province = data.ss_province_id;
        this.M_NewProspect.provinceLabel = data.province;
      });
    },
    OncountryChange(data) {
      this.$nextTick(() => {
        this.M_NewProspect.country = data.ss_country_id;
        this.M_NewProspect.countryLabel = data.country;
      });
    },
    Oncustomer_statusChange(data) {
      this.$nextTick(() => {
        this.M_NewProspect.customer_status = data.cm_customer_status_id;
        this.M_NewProspect.customer_statusLabel = data.descs;
      });
    },
    doSave() {
      this.$validator._base.validateAll("MK_AddNewProspect").then(result => {
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
          ress => {
            if (ress.value) {
              this.$validator.errors.clear("MK_AddNewProspect");
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
        option_url: "/MK/MK_Customer",
        line_no: 0,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        contact_type: "P",
        contact_status: "N",
        // contact_created: '',
        name: this.M_NewProspect.customer_name,
        address: this.M_NewProspect.address,
        ss_country_id: this.M_NewProspect.country,
        ss_province_id: this.M_NewProspect.province,
        ss_city_id: this.M_NewProspect.city,
        ss_district_id: this.M_NewProspect.district,
        phone_no:
          this.M_NewProspect.phone_no_1 +
          "-" +
          this.M_NewProspect.phone_no_2 +
          "-" +
          this.M_NewProspect.phone_no_3,
        email: this.M_NewProspect.email,
        website: this.M_NewProspect.website,
        contact_person: this.M_NewProspect.contact_person,
        contact_phone_no:
          this.M_NewProspect.contact_phone_no_1 +
          "-" +
          this.M_NewProspect.contact_phone_no_2 +
          "-" +
          this.M_NewProspect.contact_phone_no_3,
        cm_customer_status_id: this.M_NewProspect.customer_status,
        file_name: this.M_NewProspect.file_logo_name,
        path_file: this.M_NewProspect.file_logo_path,
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
    GetDataBy() {
      var param = {
        option_url: "/MK/MK_Customer",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };

      this.getJSON(this.getUrlCRUD(), param).then(response => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];

        // this.M_NewProspect = {
        //     customer_name: data.name,
        //     contact_created: this.momentDateFormatting(new Date(data.contact_created), 'DD-MM-YYYY HH.mm'),
        //     address: (data.address + ", " + data.district + ", " + data.city + ", " + data.province + ", " + data.country),
        //     email: data.email,
        //     website: data.website,
        //     contact_person: data.contact_person,
        //     contact_phone_no: data.contact_phone_no
        // }

        var phone_no =
          data.phone_no && data.phone_no !== "" ? data.phone_no.split("-") : "";
        var contact_phone_no =
          data.contact_phone_no && data.contact_phone_no !== ""
            ? data.contact_phone_no.split("-")
            : "";

        this.M_NewProspect = {
          customer_name: data.name,
          contact_created: this.momentDateFormatting(
            new Date(data.contact_created),
            "DD-MM-YYYY HH.mm"
          ),
          address: data.address,
          district: data.ss_district_id,
          districtLabel: data.district,
          city: data.ss_city_id,
          cityLabel: data.city,
          province: data.ss_province_id,
          provinceLabel: data.province,
          country: data.ss_country_id,
          countryLabel: data.country,
          phone_no_1: phone_no !== "" ? phone_no[0] : phone_no,
          phone_no_2: phone_no !== "" ? phone_no[1] : phone_no,
          phone_no_3: phone_no !== "" ? phone_no[2] : phone_no,
          email: data.email,
          website: data.website,
          contact_person: data.contact_person,
          contact_phone_no_1:
            contact_phone_no !== "" ? contact_phone_no[0] : contact_phone_no,
          contact_phone_no_2:
            contact_phone_no !== "" ? contact_phone_no[1] : contact_phone_no,
          contact_phone_no_3:
            contact_phone_no !== "" ? contact_phone_no[2] : contact_phone_no,
          customer_status: data.cm_customer_status_id,
          customer_statusLabel: data.customer_status,
          file_logo: data.file_name,
          file_show:
            data.path_file && data.path_file !== ""
              ? this.url + data.path_file
              : this.default_pic,
          file_logo_name: data.file_name,
          file_logo_path: data.path_file
        };
      });
    },
    M_Update() {
      var param = {
        option_url: "/MK/MK_Customer",
        line_no: 0,
        cm_contact_id: this.paramFromList.row_id,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        name: this.M_NewProspect.customer_name,
        address: this.M_NewProspect.address,
        ss_country_id: this.M_NewProspect.country,
        ss_province_id: this.M_NewProspect.province,
        ss_city_id: this.M_NewProspect.city,
        ss_district_id: this.M_NewProspect.district,
        phone_no:
          this.M_NewProspect.phone_no_1 +
          "-" +
          this.M_NewProspect.phone_no_2 +
          "-" +
          this.M_NewProspect.phone_no_3,
        email: this.M_NewProspect.email,
        website: this.M_NewProspect.website,
        contact_person: this.M_NewProspect.contact_person,
        contact_phone_no:
          this.M_NewProspect.contact_phone_no_1 +
          "-" +
          this.M_NewProspect.contact_phone_no_2 +
          "-" +
          this.M_NewProspect.contact_phone_no_3,
        cm_customer_status_id: this.M_NewProspect.customer_status,
        file_name: this.M_NewProspect.file_logo_name,
        path_file: this.M_NewProspect.file_logo_path,
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