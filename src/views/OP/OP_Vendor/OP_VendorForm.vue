<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>{{title}} Vendor</span>
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
                          <label>Vendor Name</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_customer_name"
                          v-model="M_NewProspect.customer_name"
                          ref="ref_customer_name"
                        />
                      </b-col>
                    </b-row>
                    <!-- <b-row
                      class="row-view"
                      style="padding-bottom: 10px;padding-top: 5px; margin-left: 5px !important;"
                    >
                      <b-col>
                        <span>
                          <font-awesome-icon class="icon-style-default" icon="check-circle" />
                          {{M_NewProspect.contact_created}}
                        </span>
                      </b-col>
                    </b-row>-->
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
                      <b-col md="2" class="col-p-1">
                        <span>
                          <label style="width: 100px;">Phone No.</label>
                        </span>
                        <!-- <ACCTextBox
                          :prop="PI_phone_no_1"
                          v-model="M_NewProspect.phone_no_1"
                          ref="ref_phone_no_1"
                        />-->
                        <ACCDropDown
                          @change="Onphone_no_1Change"
                          :prop="PI_phone_no_1"
                          v-model="M_NewProspect.phone_no_1"
                          :label="M_NewProspect.phone_no_1Label"
                          ref="ref_phone_no_1"
                        />
                      </b-col>
                      <!-- <b-col md="1" style="margin-top: 35px;">
                        <span>&nbsp;&nbsp;-</span>
                      </b-col>-->

                      <b-col md="4" class="col-p-3">
                        <span>
                          <label>&nbsp;</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_phone_no_2"
                          v-model="M_NewProspect.phone_no_2"
                          ref="ref_phone_no_2"
                        />
                      </b-col>
                      <b-col md="6">
                        <span>
                          <label>Email</label>
                        </span>
                        <ACCTextBox :prop="PI_email" v-model="M_NewProspect.email" ref="ref_email" />
                      </b-col>
                    </b-row>
                    <!-- <b-row>
                      <b-col md="6">
                        <span>
                          <label>Email</label>
                        </span>
                        <ACCTextBox :prop="PI_email" v-model="M_NewProspect.email" ref="ref_email" />
                      </b-col>
                    </b-row>-->
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
                          <label>Bank Name</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_bank_name"
                          v-model="M_NewProspect.bank_name"
                          ref="ref_bank_name"
                        />
                      </b-col>
                      <b-col md="6">
                        <span>
                          <label>Bank Account</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_bank_acct_no"
                          v-model="M_NewProspect.bank_acct_no"
                          ref="ref_bank_acct_no"
                        />
                      </b-col>
                    </b-row>

                    <b-row>
                      <b-col md="6">
                        <b-row>
                          <b-col>
                            <span>
                              <label>NPWP Number</label>
                            </span>
                            <ACCTextBox
                              :prop="PI_npwp_no"
                              v-model="M_NewProspect.npwp_no"
                              ref="ref_npwp_no"
                            />
                          </b-col>
                        </b-row>
                        <!-- <b-row>
                          <b-col>
                            <span>
                              <label>Customer Status</label>
                            </span>
                            <ACCDropDown
                              @change="Oncustomer_statusChange"
                              :prop="PI_customer_status"
                              v-model="M_NewProspect.customer_status"
                              :label="M_NewProspect.customer_statusLabel"
                              ref="ref_customer_status"
                            />
                          </b-col>
                        </b-row>-->
                      </b-col>
                      <b-col md="6">
                        <b-row
                          class="row-bordered"
                          style="background-color: #ced4da;margin-top: 27px;"
                        >
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
                                  <font-awesome-icon
                                    class="icon-style-danger"
                                    icon="times-circle"
                                    size="lg"
                                    style="cursor: pointer; top: -5px; right: 0px; position: absolute;"
                                    @click="Delete_Pict(index)"
                                  />
                                </b-col>
                              </template>
                            </b-row>
                            <b-row>
                              <b-col md="12">
                                <div @click="addPict" style="width: 20%; cursor: pointer;">
                                  <font-awesome-icon
                                    class="icon-style-default"
                                    icon="plus-circle"
                                    size="2x"
                                  />&nbsp; &nbsp;
                                  <span
                                    style="position: absolute; font-size: 15px; color: #333399; font-weight: bold;"
                                  >Upload NPWP & Document</span>
                                </div>
                              </b-col>
                            </b-row>
                          </b-col>
                        </b-row>
                      </b-col>
                    </b-row>
                    <b-row style="margin-top: 10px;">
                      <b-col md="6">
                        <ABSButton
                          :text="'Save '"
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
              <ABSModal id="Modal_Picture" ref="Modal_Picture" size="sm">
                <template slot="headerTitle">Upload NPWP & Document</template>
                <template slot="content">
                  <b-row>
                    <b-col md="12">
                      <b-form
                        :data-vv-scope="'Parent_Picture'"
                        :data-vv-value-path="'Parent_Picture'"
                      >
                        <b-row>
                          <b-col md="12">
                            <b-row>
                              <b-col md="12" style="text-align: center;">
                                <img
                                  id="logo"
                                  :src="M_ModalPict.file_show"
                                  alt
                                  style="width: 200px;"
                                />
                              </b-col>
                              <b-col md="12">
                                <ACCImageUpload
                                  :prop="PI_add_pict"
                                  @change="Onadd_pictChange"
                                  v-model="M_ModalPict.file_logo"
                                />
                              </b-col>
                            </b-row>
                            <b-row>
                              <b-col style="text-align: center;">
                                <ABSButton
                                  :text="'Save'"
                                  classButton="btn btn--default"
                                  classIcon="icon-style-default"
                                  @click="doAddPict"
                                  styleButton="height: 40px;width: 70%;"
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
      title: "",
      PI_logo: {
        cName: "Logo",
        cAccept: ".jpg, .png, .gif",
        cTitle: "Add Logo",
        cModule: "MK",
      },
      PI_customer_name: {
        cValidate: "max:100",
        cName: "customer_name",
        cOrder: 1,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "MK_AddNewProspect",
        cDecimal: 2,
        cInputStatus: this.inputStatus,
      },
      PI_address: {
        cValidate: "max:255",
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
        cInputStatus: this.inputStatus,
      },

      PI_phone_no_1: {
        dataLookUp: null,
        cValidate: "",
        cName: "phone_no_1",
        ckey: false,
        cOrder: 1,
        cProtect: false,
        cParentForm: "MK_AddNewProspect",
        cStatic: true,
        cOption: [{ id: "+62", label: "+62" }],
        cDisplayColumn: "action_type,descs",
        cInputStatus: this.inputStatus,
      },

      PI_phone_no_2: {
        cValidate: "max:20",
        cName: "phone_no_2",
        cOrder: 8,
        cKey: false,
        cType: "decimal",
        cProtect: false,
        cParentForm: "MK_AddNewProspect",
        cDecimal: 2,
        cInputStatus: this.inputStatus,
      },
      PI_phone_no_3: {
        cValidate: "",
        cName: "phone_no_3",
        cOrder: 9,
        cKey: false,
        cType: "numeric",
        cProtect: false,
        cParentForm: "MK_AddNewProspect",
        cDecimal: 2,
        cInputStatus: this.inputStatus,
      },
      PI_email: {
        cValidate: "max:60",
        cName: "email",
        cOrder: 10,
        cKey: false,
        cType: "email",
        cProtect: false,
        cParentForm: "MK_AddNewProspect",
        cDecimal: 2,
        cInputStatus: this.inputStatus,
      },
      PI_website: {
        cValidate: "max:60",
        cName: "website",
        cOrder: 11,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "MK_AddNewProspect",
        cDecimal: 2,
        cInputStatus: this.inputStatus,
      },
      PI_bank_name: {
        cValidate: "max:60",
        cName: "bank_name",
        cOrder: 12,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "MK_AddNewProspect",
        cDecimal: 2,
        cInputStatus: this.inputStatus,
      },
      PI_bank_acct_no: {
        cValidate: "max:60",
        cName: "bank_acct_no",
        cOrder: 13,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "MK_AddNewProspect",
        cDecimal: 2,
        cInputStatus: this.inputStatus,
      },
      PI_npwp_no: {
        cValidate: "max:60",
        cName: "npwp_no",
        cOrder: 14,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "MK_AddNewProspect",
        cDecimal: 2,
        cInputStatus: this.inputStatus,
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
        cInputStatus: this.inputStatus,
      },
      PI_contact_phone_no_1: {
        cValidate: "",
        cName: "contact_phone_no_1",
        cOrder: 13,
        cKey: false,
        cType: "tel",
        cProtect: false,
        cParentForm: "MK_AddNewProspect",
        cDecimal: 2,
        cInputStatus: this.inputStatus,
      },
      PI_contact_phone_no_2: {
        cValidate: "",
        cName: "contact_phone_no_2",
        cOrder: 14,
        cKey: false,
        cType: "numeric",
        cProtect: false,
        cParentForm: "MK_AddNewProspect",
        cDecimal: 2,
        cInputStatus: this.inputStatus,
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
        cInputStatus: this.inputStatus,
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
          DisplayLookUp: "descs,time_edit",
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
        cInputStatus: this.inputStatus,
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
        phone_no_1Label: "+62",
        phone_no_2: "",
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
        file_logo_path: "",
        bank_name: "",
        bank_acct_no: "",
        npwp_no: "",
      },
      PI_add_pict: {
        cName: "picture",
        cAccept: ".jpg, .png, .gif",
        cTitle: "Browse",
        cModule: "OP",
      },
      M_ModalPict: {
        file_logo: "",
        file_logo_name: "",
        file_logo_path: "",
        file_show: require("@/assets/default_photo_.png"),
      },
      M_Picture: [],
      default_pic: require("@/assets/default_photo_.png"),
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
    },
  },
  methods: {
    Delete_Pict(i) {
      this.M_Picture.splice(i, 1);
    },
    Onadd_pictChange(data) {
      this.M_ModalPict.file_logo_name = data.name;
      this.M_ModalPict.file_logo_path = data.path;
      this.M_ModalPict.file_show = this.url + data.path;
    },
    addPict() {
      this.$refs.Modal_Picture._show();
      this.M_ModalPict = {
        file_logo: "",
        file_logo_name: "",
        file_logo_path: "",
        file_show: require("@/assets/default_photo_.png"),
      };
    },
    doAddPict() {
      this.M_Picture.push(this.M_ModalPict);
      this.$refs.Modal_Picture._hide();
    },
    showPict(pict) {
      this.M_ModalPict = pict;
      this.$refs.Show_Picture._show();
    },
    doBack() {
      this.$router.go(-1);
    },
    doBack() {
      this.$router.go(-1);
    },
    Onphone_no_1Change(data) {
      this.$nextTick(() => {
        this.M_NewProspect.phone_no_1 = data.id;
        this.M_NewProspect.phone_no_1Label = data.label;
      });
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
        phone_no_1Label: "+62",
        phone_no_2: "",
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
        file_logo_path: "",
        bank_name: "",
        bank_acct_no: "",
        npwp_no: "",
      };
    },
    onlogoChange(data) {
      console.log(data);
      this.M_NewProspect.file_logo_name = data.name;
      this.M_NewProspect.file_logo_path = data.path;
      this.M_NewProspect.file_show = this.url + data.path;
    },

    Oncustomer_statusChange(data) {
      this.$nextTick(() => {
        this.M_NewProspect.customer_status = data.id;
        this.M_NewProspect.customer_statusLabel = data.label;
      });
    },
    doSave() {
      this.$validator._base.validateAll("MK_AddNewProspect").then((result) => {
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
          (ress) => {
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
      var paramH = {
          _Method_: "SAVE",
          _LineNo_: 0,
          ss_portfolio_id: this.getDataUser().portfolio_id,
          contact_type: "V",
          contact_status: "N",
          // contact_created: '',
          name: this.M_NewProspect.customer_name,
          address: this.M_NewProspect.address,
          phone_no:
            this.M_NewProspect.phone_no_1 + "-" + this.M_NewProspect.phone_no_2,
          email: this.M_NewProspect.email,
          website: this.M_NewProspect.website,
          cm_customer_status_id: "NULL",
          file_name: this.M_NewProspect.file_logo_name,
          path_file: this.M_NewProspect.file_logo_path,
          marketing_id: this.getDataUser().user_id,
          bank_name: this.M_NewProspect.bank_name,
          bank_acct_no: this.M_NewProspect.bank_acct_no,
          npwp_no: this.M_NewProspect.npwp_no,
          user_input: this.getDataUser().user_id,
        },
        paramD = [];
      this.M_Picture.forEach((pict, index) => {
        paramD.push({
          _Method_: "SAVE",
          _LineNo_: 5,
          cm_contact_id: "A_Insert.row_id_output",
          doc_file_name: pict.file_logo_name,
          doc_path_file: pict.file_logo_path,
          user_input: this.getDataUser().user_id,
        });
      });
      // option_url: "/OP/OP_Vendor",
      //   line_no: 0,

      var param = {
        option_url: "/OP/OP_Vendor",
        line_no: 0,
        Data: [
          {
            A_Insert: paramH,
            B_Looping: paramD,
          },
        ],
      };

      this.postJSONMulti(this.getUrlProsesDataPostMulti(), param).then(
        (response) => {
          // console.log(response)
          if (response == null) return;
          this.alertSuccess("Save Data Has Been Successfully").then(() => {
            // this.doBack();

            var param = {
              row_id: response.Data["A_Insert"].row_id,
              lastupdatestamp: 0,
            };
            param.isEdit = true;
            param.isView = true;
            this.$store.commit("setParamPage", param);
            this.$router.replace({ name: "OP_VendorView" });
          });
        }
      );
      // this.postJSON(this.getUrlCRUD(), param).then((response) => {
      //   // console.log(response)
      //   if (response == null) return;

      //   this.alertSuccess(response.Message).then(() => {
      //     // this.doBack();
      //     var param = {
      //       row_id: response.Data[0].row_id,
      //       lastupdatestamp: 0,
      //     };
      //     param.isEdit = true;
      //     param.isView = true;
      //     this.$store.commit("setParamPage", param);
      //     this.$router.replace({ name: "MK_CustomerView" });
      //   });
      // });
    },
    GetDataBy() {
      var param = {
        option_url: "/OP/OP_Vendor",
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
          file_logo_path: data.path_file,
          bank_name: data.bank_name,
          bank_acct_no: data.bank_acct_no,
          npwp_no: data.npwp_no,
        };
        var dataDoc = data.detail_document;
        if (dataDoc.length > 0) {
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
      });
    },
    M_Update() {
      var paramH = {
          _Method_: "UPDATE",
          _LineNo_: 0,
          cm_contact_id: this.paramFromList.row_id,
          ss_portfolio_id: this.getDataUser().portfolio_id,
          name: this.M_NewProspect.customer_name,
          address: this.M_NewProspect.address,
          phone_no:
            this.M_NewProspect.phone_no_1 + "-" + this.M_NewProspect.phone_no_2,
          email: this.M_NewProspect.email,
          website: this.M_NewProspect.website,
          cm_customer_status_id: "NULL",
          file_name: this.M_NewProspect.file_logo_name,
          path_file: this.M_NewProspect.file_logo_path,
          marketing_id: this.getDataUser().user_id,
          bank_name: this.M_NewProspect.bank_name,
          bank_acct_no: this.M_NewProspect.bank_acct_no,
          npwp_no: this.M_NewProspect.npwp_no,
          lastupdatestamp: this.paramFromList.lastupdatestamp,
          user_edit: this.getDataUser().user_id,
        },
        paramD = [];
      this.M_Picture.forEach((pict, index) => {
        paramD.push({
          _Method_: "SAVE",
          _LineNo_: 5,
          cm_contact_id: this.paramFromList.row_id,
          doc_file_name: pict.file_logo_name,
          doc_path_file: pict.file_logo_path,
          user_input: this.getDataUser().user_id,
        });
      });

      var paramDelDOc = {
        _Method_: "DELETE",
        _LineNo_: 5,
        row_id: this.paramFromList.row_id,
        lastupdatestamp: 0,
      };

      var param = {
        option_url: "/OP/OP_Vendor",
        line_no: 0,
        Data: [
          {
            A_Insert: paramH,
            B_Delete: paramDelDOc,
            C_Looping: paramD,
          },
        ],
      };

      this.postJSONMulti(this.getUrlProsesDataPostMulti(), param).then(
        (response) => {
          // console.log(response)
          if (response == null) return;
          this.alertSuccess("Save Data Has Been Successfully").then(() => {
            // this.doBack();

            this.$router.replace({ name: "OP_VendorView" });
          });
        }
      );
      // this.putJSON(this.getUrlCRUD(), param).then((response) => {
      //   // console.log(response)
      //   if (response == null) return;
      //   this.alertSuccess(response.Message).then(() => {
      //     // if (this.inputStatus == "new") {
      //     //   this.doBack();
      //     // } else {
      //     this.$router.replace({ name: "MK_CustomerView" });
      //     // }
      //   });
      // });
    },
  },
  mounted() {
    this.M_ClearForm();
    if (this.inputStatus == "edit") {
      this.title = "Edit";
      this.GetDataBy();
    } else {
      this.title = "Add";
    }
  },
};
</script>

<style>
</style>