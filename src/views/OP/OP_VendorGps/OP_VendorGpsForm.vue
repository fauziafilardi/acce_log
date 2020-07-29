<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>{{title}} VendorGps</span>
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
                :data-vv-scope="'OP_FormOpVendorGps'"
                :data-vv-value-path="'OP_FormOpVendorGps'"
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
                          <label>Vendor Name</label>
                        </span>
                        <ACCTextBox
                          :prop = "PI_vendor_name"
                          v-model = "M_OpVendorGps.vendor_name"
                          ref = "ref_vendor_name"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Pic</label>
                        </span>
                        <ACCTextBox
                          :prop = "PI_pic"
                          v-model = "M_OpVendorGps.pic"
                          ref = "ref_pic"
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
                          v-model = "M_OpVendorGps.phone_no"
                          ref = "ref_phone_no"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Descs</label>
                        </span>
                        <ACCTextBox
                          :prop = "PI_descs"
                          v-model = "M_OpVendorGps.descs"
                          ref = "ref_descs"
                        />
                      </b-col>
                    </b-row>
				
					<b-row style="margin-top: 10px;">
                      <b-col md="6">
                        <ABSButton
                          :text="'Save VendorGps'"
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

      M_OpVendorGps :{
        op_vendor_gps_id : 0,
        vendor_name : '',
        pic : '',
        phone_no : '',
        descs : '',
        user_input : '',
        user_edit : '',
        time_input : '',
        time_edit : '',
        row_id : 0,
        lastupdatestamp : 0
      }
            ,
      PI_vendor_name: {
        cValidate: '',
        cName: "vendor_name",
        cOrder: 1,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "OP_FormOpVendorGps",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_pic: {
        cValidate: '',
        cName: "pic",
        cOrder: 2,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "OP_FormOpVendorGps",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_phone_no: {
        cValidate: '',
        cName: "phone_no",
        cOrder: 3,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "OP_FormOpVendorGps",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_descs: {
        cValidate: '',
        cName: "descs",
        cOrder: 4,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "OP_FormOpVendorGps",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },

    };
  },
  computed: {
    paramFromList() {
      var param = this.$store.getters.getParamPage;
      return param;
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

      this.M_OpVendorGps = {
        op_vendor_gps_id : 0,
        vendor_name : '',
        pic : '',
        phone_no : '',
        descs : '',
        user_input : '',
        user_edit : '',
        time_input : '',
        time_edit : '',
        row_id : 0,
        lastupdatestamp : 0
      }
                 
    },
   
    doSave() {
      this.$validator._base.validateAll("OP_FormOpVendorGps").then(result => {
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
          ress => {
            if (ress.value) {
              this.$validator.errors.clear("OP_FormOpVendorGps");
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
        option_url : "/OP/OP_VendorGps",
        line_no :0, 
        vendor_name:this.M_OpVendorGps.vendor_name,
        pic:this.M_OpVendorGps.pic,
        phone_no:this.M_OpVendorGps.phone_no,
        descs:this.M_OpVendorGps.descs,
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
        option_url : "/OP/OP_VendorGps",
        line_no :0, 
        ovendor_gps_id:this.M_OpVendorGps.ovendor_gps_id,
        vendor_name:this.M_OpVendorGps.vendor_name,
        pic:this.M_OpVendorGps.pic,
        phone_no:this.M_OpVendorGps.phone_no,
        descs:this.M_OpVendorGps.descs,
        lastupdatestamp:this.paramFromList.lastupdatestamp,
        user_edit:this.getDataUser().user_id
      }

      this.putJSON(this.getUrlCRUD(), param).then(response => {
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          if (this.inputStatus == 'new') {
            this.doBack();
          } else {
          this.$router.replace({ name: "OP_VendorGps" });
          }
        });
      });
           
    },
	doDelete(){
		this.alertConfirmation("Are You Sure Want To Delete This Data ?")
            .then(ress => {
				if(ress.value){
					this.M_Delete();
				}
			});
	},
	M_Delete() {
      var param = {
        option_url: "/OP/OP_VendorGps",
        line_no: {LineNo},
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
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
        option_url: "/OP/OP_VendorGps",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };

      this.getJSON(this.getUrlCRUD(), param).then(response => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];

      this.M_OpVendorGps  = {
        op_vendor_gps_id : data.op_vendor_gps_id,
        vendor_name : data.vendor_name__tb_1,
        pic : data.pic__tb_2,
        phone_no : data.phone_no__tb_3,
        descs : data.descs__tb_4,
        user_input : data.user_input,
        user_edit : data.user_edit,
        time_input : data.time_input,
        time_edit : data.time_edit,
        row_id : data.row_id,
        lastupdatestamp : data.lastupdatestamp
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

