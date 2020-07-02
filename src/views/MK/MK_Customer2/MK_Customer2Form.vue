<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>{{title}} Customer2</span>
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
                :data-vv-scope="'{FormName}'"
                :data-vv-value-path="'{FormName}'"
              >
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
                          <label>Name</label>
                        </span>
                        <ACCTextBox
                          :prop = "PI_name"
                          v-model = "M_CmContact.name"
                          ref = "ref_name"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Address</label>
                        </span>
                        <ACCTextBox
                          :prop = "PI_address"
                          v-model = "M_CmContact.address"
                          ref = "ref_address"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>District</label>
                        </span>
                        <ACCLookUp
                          @change = "Onss_district_idChange"
                          :prop = "PI_ss_district_id"
                          v-model = "M_CmContact.ss_district_id"
                          :label = "M_CmContact.districtLabel"
                          ref = "ref_ss_district_id"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>City</label>
                        </span>
                        <ACCLookUp
                          @change = "Onss_city_idChange"
                          :prop = "PI_ss_city_id"
                          v-model = "M_CmContact.ss_city_id"
                          :label = "M_CmContact.cityLabel"
                          ref = "ref_ss_city_id"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Province</label>
                        </span>
                        <ACCLookUp
                          @change = "Onss_province_idChange"
                          :prop = "PI_ss_province_id"
                          v-model = "M_CmContact.ss_province_id"
                          :label = "M_CmContact.provinceLabel"
                          ref = "ref_ss_province_id"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Country</label>
                        </span>
                        <ACCLookUp
                          @change = "Onss_country_idChange"
                          :prop = "PI_ss_country_id"
                          v-model = "M_CmContact.ss_country_id"
                          :label = "M_CmContact.countryLabel"
                          ref = "ref_ss_country_id"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Phone No</label>
                        </span>
                        <ACCTextBox
                          :prop = "PI_phone_no"
                          v-model = "M_CmContact.phone_no"
                          ref = "ref_phone_no"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Customer Status</label>
                        </span>
                        <ACCLookUp
                          @change = "OnemailChange"
                          :prop = "PI_email"
                          v-model = "M_CmContact.email"
                          :label = "M_CmContact.customer_statusLabel"
                          ref = "ref_email"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Website</label>
                        </span>
                        <ACCTextBox
                          :prop = "PI_website"
                          v-model = "M_CmContact.website"
                          ref = "ref_website"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Contact Person</label>
                        </span>
                        <ACCTextBox
                          :prop = "PI_contact_person"
                          v-model = "M_CmContact.contact_person"
                          ref = "ref_contact_person"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Contact Phone No</label>
                        </span>
                        <ACCTextBox
                          :prop = "PI_contact_phone_no"
                          v-model = "M_CmContact.contact_phone_no"
                          ref = "ref_contact_phone_no"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Cm Customer Status Id</label>
                        </span>
                        <ACCLookUp
                          @change = "Oncm_customer_status_idChange"
                          :prop = "PI_cm_customer_status_id"
                          v-model = "M_CmContact.cm_customer_status_id"
                          :label = "M_CmContact.cm_customer_status_id"
                          ref = "ref_cm_customer_status_id"
                        />
                      </b-col>
                    </b-row>
				
					<b-row style="margin-top: 10px;">
                      <b-col md="6">
                        <ABSButton
                          :text="'Save Customer2'"
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
 	title:'',

      M_CmContact :{
        cm_contact_id : 0,
        ss_portfolio_id : 0,
        contact_type : '',
        contact_status : '',
        contact_created : '',
        name : '',
        address : '',
        ss_country_id : 0,
        countryLabel : '',
        ss_province_id : 0,
        provinceLabel : '',
        ss_city_id : 0,
        cityLabel : '',
        ss_district_id : 0,
        districtLabel : '',
        phone_no : '',
        email : '',
        website : '',
        contact_person : '',
        contact_phone_no : '',
        cm_customer_status_id : 0,
        customer_statusLabel : '',
        user_input : '',
        user_edit : '',
        time_input : '',
        time_edit : '',
        row_id : 0,
        lastupdatestamp : 0,
        file_name : '',
        path_file : ''
      }
            ,
      PI_name: {
        cValidate: '',
        cName: "name",
        cOrder: 1,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "MK_FormCmContact",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_address: {
        cValidate: '',
        cName: "address",
        cOrder: 2,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "MK_FormCmContact",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_ss_district_id: {
        dataLookUp:{
          LookUpCd:'',
          ColumnDB:'',
          InitialWhere:'',
          ParamWhere:'',
          OrderBy:'',
          ParamView:'',
          SourceField:'',
          DisplayLookUp:''
        },
        cValidate: '',
        cName: "ss_district_id",
        cOrder: 3,
        cKey: false,
        cStatic: false,
        cProtect: false,
        cParentForm: "MK_FormCmContact",
        cOption: [],
        cDisplayColumn: '',
        cInputStatus: this.inputStatus
      },
      PI_ss_city_id: {
        dataLookUp:{
          LookUpCd:'',
          ColumnDB:'',
          InitialWhere:'',
          ParamWhere:'',
          OrderBy:'',
          ParamView:'',
          SourceField:'',
          DisplayLookUp:''
        },
        cValidate: '',
        cName: "ss_city_id",
        cOrder: 4,
        cKey: false,
        cStatic: false,
        cProtect: false,
        cParentForm: "MK_FormCmContact",
        cOption: [],
        cDisplayColumn: '',
        cInputStatus: this.inputStatus
      },
      PI_ss_province_id: {
        dataLookUp:{
          LookUpCd:'',
          ColumnDB:'',
          InitialWhere:'',
          ParamWhere:'',
          OrderBy:'',
          ParamView:'',
          SourceField:'',
          DisplayLookUp:''
        },
        cValidate: '',
        cName: "ss_province_id",
        cOrder: 5,
        cKey: false,
        cStatic: false,
        cProtect: false,
        cParentForm: "MK_FormCmContact",
        cOption: [],
        cDisplayColumn: '',
        cInputStatus: this.inputStatus
      },
      PI_ss_country_id: {
        dataLookUp:{
          LookUpCd:'',
          ColumnDB:'',
          InitialWhere:'',
          ParamWhere:'',
          OrderBy:'',
          ParamView:'',
          SourceField:'',
          DisplayLookUp:''
        },
        cValidate: '',
        cName: "ss_country_id",
        cOrder: 6,
        cKey: false,
        cStatic: false,
        cProtect: false,
        cParentForm: "MK_FormCmContact",
        cOption: [],
        cDisplayColumn: '',
        cInputStatus: this.inputStatus
      },
      PI_phone_no: {
        cValidate: '',
        cName: "phone_no",
        cOrder: 7,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "MK_FormCmContact",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_email: {
        cValidate: '',
        cName: "email",
        cOrder: 8,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "MK_FormCmContact",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_website: {
        cValidate: '',
        cName: "website",
        cOrder: 9,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "MK_FormCmContact",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_contact_person: {
        cValidate: '',
        cName: "contact_person",
        cOrder: 10,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "MK_FormCmContact",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_contact_phone_no: {
        cValidate: '',
        cName: "contact_phone_no",
        cOrder: 11,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "MK_FormCmContact",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_cm_customer_status_id: {
        dataLookUp:{
          LookUpCd:'',
          ColumnDB:'',
          InitialWhere:'',
          ParamWhere:'',
          OrderBy:'',
          ParamView:'',
          SourceField:'',
          DisplayLookUp:''
        },
        cValidate: '',
        cName: "cm_customer_status_id",
        cOrder: 12,
        cKey: false,
        cStatic: false,
        cProtect: false,
        cParentForm: "MK_FormCmContact",
        cOption: [],
        cDisplayColumn: '',
        cInputStatus: this.inputStatus
      },

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
      this.$router.go(-1);
    },
    Onss_district_idChange(data) {
      this.$nextTick(() => {
        this.M_CmContact.ss_district_id = data.id
        this.M_CmContact.districtLabel = data.descs
      });
    },
    Onss_city_idChange(data) {
      this.$nextTick(() => {
        this.M_CmContact.ss_city_id = data.id
        this.M_CmContact.cityLabel = data.descs
      });
    },
    Onss_province_idChange(data) {
      this.$nextTick(() => {
        this.M_CmContact.ss_province_id = data.id
        this.M_CmContact.provinceLabel = data.descs
      });
    },
    Onss_district_idChange(data) {
      this.$nextTick(() => {
        this.M_CmContact.ss_district_id = data.id
        this.M_CmContact.ss_district_id = data.descs
      });
    },
    Onss_city_idChange(data) {
      this.$nextTick(() => {
        this.M_CmContact.ss_city_id = data.id
        this.M_CmContact.ss_city_id = data.descs
      });
    },
    Onss_province_idChange(data) {
      this.$nextTick(() => {
        this.M_CmContact.ss_province_id = data.id
        this.M_CmContact.ss_province_id = data.descs
      });
    },
    Onss_country_idChange(data) {
      this.$nextTick(() => {
        this.M_CmContact.ss_country_id = data.id
        this.M_CmContact.ss_country_id = data.descs
      });
    },
    Onss_country_idChange(data) {
      this.$nextTick(() => {
        this.M_CmContact.ss_country_id = data.id
        this.M_CmContact.countryLabel = data.descs
      });
    },
    Oncm_customer_status_idChange(data) {
      this.$nextTick(() => {
        this.M_CmContact.cm_customer_status_id = data.id
        this.M_CmContact.cm_customer_status_id = data.descs
      });
    },
		
    M_ClearForm() {

      this.M_CmContact = {
        cm_contact_id : 0,
        ss_portfolio_id : 0,
        contact_type : '',
        contact_status : '',
        contact_created : '',
        name : '',
        address : '',
        ss_country_id : 0,
        countryLabel : '',
        ss_province_id : 0,
        provinceLabel : '',
        ss_city_id : 0,
        cityLabel : '',
        ss_district_id : 0,
        districtLabel : '',
        phone_no : '',
        email : '',
        website : '',
        contact_person : '',
        contact_phone_no : '',
        cm_customer_status_id : 0,
        customer_statusLabel : '',
        user_input : '',
        user_edit : '',
        time_input : '',
        time_edit : '',
        row_id : 0,
        lastupdatestamp : 0,
        file_name : '',
        path_file : ''
      }
                 
    },
   
    doSave() {
      this.$validator._base.validateAll("MK_FormCmContact").then(result => {
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
          ress => {
            if (ress.value) {
              this.$validator.errors.clear("MK_FormCmContact");
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
        option_url : "/MK/MK_Customer2",
        line_no :0, 
        ss_portfolio_id:this.getDataUser().portfolio_id,
        contact_type:this.M_CmContact.contact_type,
        contact_status:this.M_CmContact.contact_status,
        name:this.M_CmContact.name,
        address:this.M_CmContact.address,
        ss_country_id:this.M_CmContact.ss_country_id,
        ss_province_id:this.M_CmContact.ss_province_id,
        ss_city_id:this.M_CmContact.ss_city_id,
        ss_district_id:this.M_CmContact.ss_district_id,
        phone_no:this.M_CmContact.phone_no,
        email:this.M_CmContact.email,
        website:this.M_CmContact.website,
        contact_person:this.M_CmContact.contact_person,
        contact_phone_no:this.M_CmContact.contact_phone_no,
        file_name:this.M_CmContact.file_name,
        path_file:this.M_CmContact.path_file,
        cm_customer_status_id:this.M_CmContact.cm_customer_status_id,
        marketing_id:this.M_CmContact.marketing_id,
        user_input:this.getDataUser().user_id
      }

      this.postJSON(this.getUrlCRUD(), param).then(response => {
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          this.doBack();
        });
      });
 
    },
	 M_Update() {     
      var param = {
        option_url : "/MK/MK_Customer2",
        line_no :0, 
        cm_contact_id:this.M_CmContact.cm_contact_id,
        ss_portfolio_id:this.getDataUser().portfolio_id,
        name:this.M_CmContact.name,
        address:this.M_CmContact.address,
        ss_country_id:this.M_CmContact.ss_country_id,
        ss_province_id:this.M_CmContact.ss_province_id,
        ss_city_id:this.M_CmContact.ss_city_id,
        ss_district_id:this.M_CmContact.ss_district_id,
        phone_no:this.M_CmContact.phone_no,
        email:this.M_CmContact.email,
        website:this.M_CmContact.website,
        contact_person:this.M_CmContact.contact_person,
        contact_phone_no:this.M_CmContact.contact_phone_no,
        file_name:this.M_CmContact.file_name,
        path_file:this.M_CmContact.path_file,
        cm_customer_status_id:this.M_CmContact.cm_customer_status_id,
        marketing_id:this.M_CmContact.marketing_id,
        lastupdatestamp:this.paramFromList.lastupdatestamp,
        user_edit:this.getDataUser().user_id
      }

      this.putJSON(this.getUrlCRUD(), param).then(response => {
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          this.doBack();
        });
      });
           
    },
    GetDataBy() {
      var param = {
        option_url: "/MK/MK_Customer2",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };

      this.getJSON(this.getUrlCRUD(), param).then(response => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];

      this.M_CmContact  = {
        cm_contact_id : data.cm_contact_id,
        ss_portfolio_id : data.ss_portfolio_id,
        contact_type : data.contact_type,
        contact_status : data.contact_status,
        contact_created : data.contact_created,
        name : data.name__tb_1,
        address : data.address__tb_2,
        ss_country_id : data.ss_country_id__lo_6,
        countryLabel : data.country__lbl__lo_6,
        ss_province_id : data.ss_province_id__lo_5,
        provinceLabel : data.province__lbl__lo_5,
        ss_city_id : data.ss_city_id__lo_4,
        cityLabel : data.city__lbl__lo_4,
        ss_district_id : data.ss_district_id__lo_3,
        districtLabel : data.district__lbl__lo_3,
        phone_no : data.phone_no__tb_7,
        email : data.email__tb_8,
        website : data.website__tb_9,
        contact_person : data.contact_person__tb_10,
        contact_phone_no : data.contact_phone_no__tb_11,
        cm_customer_status_id : data.cm_customer_status_id__lo_12,
        customer_statusLabel : data.customer_status__lbl__lo_12,
        user_input : data.user_input,
        user_edit : data.user_edit,
        time_input : data.time_input,
        time_edit : data.time_edit,
        row_id : data.row_id,
        lastupdatestamp : data.lastupdatestamp,
        file_name : data.file_name,
        path_file : data.path_file
      };
                   
      });
    }
   
  },
  mounted() {
    this.M_ClearForm();
    if (this.inputStatus == "edit") {
		this.title = 'Edit'
		this.GetDataBy();
    }else{
		this.title = 'Add'
	}
  }
};
</script>

