<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>{{title}} TicketCategory</span>
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
                :data-vv-scope="'OP_FormOpTicketCategory'"
                :data-vv-value-path="'OP_FormOpTicketCategory'"
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
                          <label>Ticket Category</label>
                        </span>
                        <ACCTextBox
                          :prop = "PI_ticket_category"
                          v-model = "M_OpTicketCategory.ticket_category"
                          ref = "ref_ticket_category"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Solving Hour</label>
                        </span>
                        <ACCTextBox
                          :prop = "PI_solving_hour"
                          v-model = "M_OpTicketCategory.solving_hour"
                          ref = "ref_solving_hour"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Solving Minute</label>
                        </span>
                        <ACCTextBox
                          :prop = "PI_solving_minute"
                          v-model = "M_OpTicketCategory.solving_minute"
                          ref = "ref_solving_minute"
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
                          v-model = "M_OpTicketCategory.descs"
                          ref = "ref_descs"
                        />
                      </b-col>
                    </b-row>
				
					<b-row style="margin-top: 10px;">
                      <b-col md="6">
                        <ABSButton
                          :text="'Save TicketCategory'"
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

      M_OpTicketCategory :{
        op_ticket_category_id : 0,
        ss_portfolio_id : 0,
        ticket_category : '',
        solving_hour : 0,
        solving_minute : 0,
        descs : '',
        user_input : '',
        user_edit : '',
        time_input : '',
        time_edit : '',
        row_id : 0,
        lastupdatestamp : 0
      }
            ,
      PI_ticket_category: {
        cValidate: '',
        cName: "ticket_category",
        cOrder: 1,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "OP_FormOpTicketCategory",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_solving_hour: {
        cValidate: '',
        cName: "solving_hour",
        cOrder: 2,
        cKey: false,
        cType: "decimal",
        cProtect: false,
        cParentForm: "OP_FormOpTicketCategory",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_solving_minute: {
        cValidate: '',
        cName: "solving_minute",
        cOrder: 3,
        cKey: false,
        cType: "decimal",
        cProtect: false,
        cParentForm: "OP_FormOpTicketCategory",
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
        cParentForm: "OP_FormOpTicketCategory",
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

      this.M_OpTicketCategory = {
        op_ticket_category_id : 0,
        ss_portfolio_id : 0,
        ticket_category : '',
        solving_hour : 0,
        solving_minute : 0,
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
      this.$validator._base.validateAll("OP_FormOpTicketCategory").then(result => {
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
          ress => {
            if (ress.value) {
              this.$validator.errors.clear("OP_FormOpTicketCategory");
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
        option_url : "/OP/OP_TicketCategory",
        line_no :0, 
        ss_portfolio_id:this.getDataUser().portfolio_id,
        ticket_category:this.M_OpTicketCategory.ticket_category,
        solving_hour:this.M_OpTicketCategory.solving_hour,
        solving_minute:this.M_OpTicketCategory.solving_minute,
        descs:this.M_OpTicketCategory.descs,
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
        option_url : "/OP/OP_TicketCategory",
        line_no :0, 
        oticket_category_id:this.M_OpTicketCategory.oticket_category_id,
        ss_portfolio_id:this.getDataUser().portfolio_id,
        ticket_category:this.M_OpTicketCategory.ticket_category,
        solving_hour:this.M_OpTicketCategory.solving_hour,
        solving_minute:this.M_OpTicketCategory.solving_minute,
        descs:this.M_OpTicketCategory.descs,
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
	M_Delete() {
      var param = {
        option_url: "/OP/OP_TicketCategory",
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
        option_url: "/OP/OP_TicketCategory",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };

      this.getJSON(this.getUrlCRUD(), param).then(response => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];

      this.M_OpTicketCategory  = {
        op_ticket_category_id : data.op_ticket_category_id,
        ss_portfolio_id : data.ss_portfolio_id,
        ticket_category : data.ticket_category__tb_1,
        solving_hour : data.solving_hour__tb_2,
        solving_minute : data.solving_minute__tb_3,
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

