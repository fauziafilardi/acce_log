<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Contact To Do List</span>
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
              <b-form :data-vv-scope="'Mk_AddTodoList'" :data-vv-value-path="'Mk_AddTodoList'">
                <b-row>
                  <b-col md="2" style="text-align: center;">
                    <img :src="require('@/assets/list.png')" alt style="width: 100px;" />
                  </b-col>
                  <b-col md="10">
                    <!-- <b-row>
                    <b-col md="12">-->
                    <b-row>
                      <b-col md="9">
                        <span>
                          <label>Description</label>
                        </span>
                        <ACCTextBox :prop="PI_descs" v-model="MK_ToDo_List.descs" ref="ref_descs" />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Type</label>
                        </span>
                        <ACCDropDown
                          @change="OnactionChange"
                          :prop="PI_action_type"
                          v-model="MK_ToDo_List.action_type"
                          :label="MK_ToDo_List.action_typeLabel"
                          ref="ref_action"
                        />
                      </b-col>
                    </b-row>

                    <b-row style="margin-top: 10px;">
                      <b-col md="6">
                        <ABSButton
                          :text="'Add To Do List'"
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
      PI_descs: {
        cValidate: "",
        cName: "descs",
        cOrder: 1,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "Mk_AddTodoList",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },

      PI_action_type: {
        dataLookUp: null,
        cValidate: "",
        cName: "action_type",
        ckey: false,
        cOrder: 2,
        cProtect: false,
        cParentForm: "Mk_AddTodoList",
        cStatic: true,
        cOption: [
          { id: "C", label: "Call" },
          { id: "V", label: "Visit" },
          { id: "E", label: "Entertaintment" }
        ],
        cDisplayColumn: "action_type,descs",
        cInputStatus: this.inputStatus
      },

      MK_ToDo_List: {
        mk_todo_list_id: 0,
        cm_contact_id: 0,
        descs: "",
        action_type: ""
      },
      inputStatus: "",
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
    }
    // ,
    // inputStatus() {
    //   var param = this.$store.getters.getParamPage;
    //   if (param.isEdit && param.isEdit === true) {
    //     return "edit";
    //   } else {
    //     return "new";
    //   }
    // }
  },
  methods: {
    OnactionChange(data) {
      this.$nextTick(() => {
        this.MK_ToDo_List.action_type = data.id;
        this.MK_ToDo_List.action_typeLabel = data.label;
      });
    },
    doBack() {
      this.$router.go(-1);
    },
    M_ClearForm() {
      this.MK_ToDo_List = {
        descs: "",
        action_type: ""
      };
    },
    doSave() {
      this.$validator._base.validateAll("Mk_AddTodoList").then(result => {
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
          ress => {
            if (ress.value) {
              this.$validator.errors.clear("Mk_AddTodoList");
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
        option_url: "/MK/MK_NewProspect",
        line_no: 1,
        cm_contact_id: this.paramFromList.row_id,
        descs: this.MK_ToDo_List.descs,
        action_type: this.MK_ToDo_List.action_type,
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
        option_url: "/MK/MK_NewProspect",
        line_no: 1,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };

      this.getJSON(this.getUrlCRUD(), param).then(response => {
        // response from API
        if (response == null) return;
        // if (response == null) {
        //   this.inputStatus = "new";
        //   return;
        // }
        console.log(response.Data.length);
        if (response.Data.length == 0) {
          this.inputStatus = "new";
          return;
        }
        var data = response.Data[0];
        // this.MK_ToDo_List = {
        //     descs: data.name,
        //     contact_created: this.momentDateFormatting(new Date(data.contact_created), 'DD-MM-YYYY HH.mm'),
        //     action_type: (data.action_type + ", " + data.district + ", " + data.city + ", " + data.province + ", " + data.country),
        //     email: data.email,
        //     website: data.website,
        //     contact_person: data.contact_person,
        //     contact_phone_no: data.contact_phone_no
        // }

        this.MK_ToDo_List = {
          mk_todo_list_id: data.row_id,
          descs: data.descs,
          action_type: data.action_type
        };
        this.inputStatus = "edit";
      });
    },
    M_Update() {
      var param = {
        option_url: "/MK/MK_NewProspect",
        line_no: 1,
        mk_todo_list_id: this.MK_ToDo_List.mk_todo_list_id,
        cm_contact_id: this.paramFromList.row_id,
        descs: this.MK_ToDo_List.descs,
        action_type: this.MK_ToDo_List.action_type,
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
    console.log(this.paramFromList);
    // if (this.inputStatus == "edit") {
    this.GetDataBy();
    // }
  }
};
</script>

<style>
</style>