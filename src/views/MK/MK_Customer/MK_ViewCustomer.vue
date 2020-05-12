<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card">
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
              <b-form :data-vv-scope="'parent'" :data-vv-value-path="'parent'">
                <b-row>
                  <b-col md="2" style="margin-bottom: 15px !important;">
                    <div>
                      <img :src="M_Customer.path_file" alt width="100%" />
                    </div>
                  </b-col>
                  <b-col md="10">
                    <b-row>
                      <b-col>
                        <span>
                          <label>{{M_Customer.customer_name}}</label>
                        </span>
                      </b-col>
                      <b-col style="text-align: right;">
                        <span>
                          <ABSButton
                            :text="'Contact'"
                            classButton="btn btn--default"
                            classIcon="icon-style-1"
                            @click="doContact"
                          />
                        </span>
                        <span>
                          <ABSButton
                            :text="'Edit'"
                            classButton="btn btn--default"
                            classIcon="icon-style-1"
                            @click="doEdit"
                          />
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view" style="padding-top: 5px; padding-bottom: 10px;">
                      <b-col>
                        <span>
                          <font-awesome-icon class="icon-style-default" icon="check-circle" />
                          {{M_Customer.contact_created}}
                        </span>
                      </b-col>
                      <b-col style="text-align: right;">
                        <span>
                          <font-awesome-icon class="icon-style-default" icon="user" />&nbsp;&nbsp;User : User Account
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Address</label>
                        </span>
                        <br />
                        <span>
                          <label>{{M_Customer.address}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Phone No.</label>
                        </span>
                        <br />
                        <span>
                          <label>{{M_Customer.phone_no}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Email</label>
                        </span>
                        <br />
                        <span>
                          <label>{{M_Customer.email}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Website</label>
                        </span>
                        <br />
                        <span>
                          <label>{{M_Customer.website}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col>
                        <b-button
                          style="background-color: transparent; color: black; border: none;"
                          @click="doAddPIC"
                        >
                          <font-awesome-icon
                            icon="plus-circle"
                            class="icon-style-default"
                            style="margin-right: 5px;"
                          />Add PIC
                        </b-button>
                      </b-col>
                    </b-row>
                    <b-row style="margin-top: 10px;">
                      <b-col md="12">
                        <b-list-group>
                          <b-list-group-item
                            class="flex-column align-items-start"
                            style="padding-top: 5px !important; padding-bottom: 5px !important;"
                          >
                            <b-row>
                              <b-col>
                                <span>Contact Person</span>
                              </b-col>
                              <b-col>
                                <span>Phone No</span>
                              </b-col>
                              <b-col>
                                <span>Email</span>
                              </b-col>
                              <b-col>
                                <span>&nbsp;</span>
                              </b-col>
                            </b-row>
                          </b-list-group-item>
                          <b-list-group-item
                            @dblclick="onDataDblClick(index)"
                            v-for="(data, index) in dataPIC"
                            href="#"
                            class="flex-column align-items-start"
                            v-bind:key="index"
                            style="padding-top: 5px !important; padding-bottom: 5px !important;"
                          >
                            <!-- <font-awesome-icon
                              icon="trash-alt"
                              class="icon-style-1__deleteMobile"
                              @click="doDelete(index)"
                            />-->
                            <b-row>
                              <b-col>
                                <span>{{data.name}}</span>
                              </b-col>
                              <b-col>
                                <span>{{data.phone_no}}</span>
                              </b-col>
                              <b-col>
                                <span>{{data.email}}</span>
                              </b-col>
                              <b-col class="center-delete-list" style="max-width:100% !important;">
                                <font-awesome-icon
                                  icon="trash-alt"
                                  class="icon-style-1__deleteMobile"
                                  @click="M_Delete(index)"
                                />
                              </b-col>
                            </b-row>
                          </b-list-group-item>
                        </b-list-group>
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
    <ABSModal id="Modal_PIC" ref="Modal_PIC" size="sm">
      <template slot="headerTitle">PIC</template>
      <!-- <template slot="headerClose">
        <span @click="_hide" class="close-multiple">&times;</span>
      </template>-->
      <template slot="content">
        <b-row>
          <b-col md="12">
            <b-form :data-vv-scope="'MK_ContactPerson'" :data-vv-value-path="'MK_ContactPerson'">
              <b-row>
                <b-col md="12">
                  <b-row>
                    <b-col md="12">
                      <span>
                        <label>Contact Person</label>
                      </span>
                      <ACCTextBox
                        :prop="PI_contact_person"
                        v-model="M_Pic.contact_person"
                        ref="ref_contact_person_modal"
                      />
                    </b-col>
                  </b-row>
                  <b-row>
                    <b-col md="3" class="col-p-1">
                      <span>
                        <label style="width: 100px;">Contact Phone No.</label>
                      </span>
                      <ACCTextBox
                        :prop="PI_contact_phone_no_1"
                        v-model="M_Pic.contact_phone_no_1"
                        ref="ref_contact_phone_no_1"
                        style="width: 50px;"
                      />
                    </b-col>
                    <b-col md="3" class="col-p-2">
                      <span>
                        <label>&nbsp;</label>
                      </span>
                      <ACCTextBox
                        :prop="PI_contact_phone_no_2"
                        v-model="M_Pic.contact_phone_no_2"
                        ref="ref_contact_phone_no_2"
                      />
                    </b-col>
                    <b-col md="6" class="col-p-3">
                      <span>
                        <label>&nbsp;</label>
                      </span>
                      <ACCTextBox
                        :prop="PI_contact_phone_no_3"
                        v-model="M_Pic.contact_phone_no_3"
                        ref="ref_contact_phone_no_3"
                      />
                    </b-col>
                  </b-row>
                  <b-row>
                    <b-col md="12">
                      <span>
                        <label>Email</label>
                      </span>
                      <ACCTextBox :prop="PI_email" v-model="M_Pic.email" ref="ref_email_modal" />
                    </b-col>
                  </b-row>

                  <b-row style="margin-top: 10px;">
                    <b-col md="12">
                      <ABSButton
                        :text="'Save'"
                        classButton="btn btn--default"
                        classIcon="icon-style-1"
                        @click="M_Save"
                        styleButton="height: 40px;width: 100%;"
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
</template>

<script>
export default {
  data() {
    return {
      dataPIC: [],
      inputStatus: "",
      currentPage: 1,
      perPage: 10,
      sort: "time_edit DESC",
      sourceField: "",
      paramView: "",
      M_Pic: {
        email: "",
        contact_person: "",
        contact_phone_no_1: "+62",
        contact_phone_no_2: "",
        contact_phone_no_3: "",
        cm_contact_id: "",
        cm_contact_person_id: "",
        lastupdatestamp: ""
      },
      M_Customer: {
        customer_name: "",
        address: "",
        phone_no: "",
        email: "",
        website: "",
        contact_person: "",
        contact_phone_no: "",
        path_file: ""
      },
      PI_contact_person: {
        cValidate: "",
        cName: "contact_person",
        cOrder: 12,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "MK_ContactPerson",
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
        cParentForm: "MK_ContactPerson",
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
        cParentForm: "MK_ContactPerson",
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
        cParentForm: "MK_ContactPerson",
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
        cParentForm: "MK_ContactPerson",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      M_GetDataBy: null
    };
  },
  computed: {
    paramFromList() {
      var param = this.$route.params;
      if (param == null || param == undefined) {
        this.doBack();
      } else {
        if (Object.keys(param).length < 1) {
          this.doBack();
        } else {
          return param;
        }
      }
    }
  },
  methods: {
    // Modal Start
    // _hide() {
    //   this.$refs.Modal_PIC._hide();
    //   this.GetDataBy();
    // },
    M_ClearPIC() {
      this.M_Pic = {
        contact_person: "",
        contact_phone_no_1: "+62",
        contact_phone_no_2: "",
        contact_phone_no_3: "",
        email: ""
      };
    },
    doAddPIC() {
      this.M_ClearPIC();
      this.inputStatus = "new";
      this.$refs.Modal_PIC._show();
    },
    M_Save() {
      this.$validator._base.validateAll("MK_ContactPerson").then(result => {
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
          ress => {
            if (ress.value) {
              this.$validator.errors.clear("MK_ContactPerson");
              if (this.inputStatus == "edit") {
                this.doUpdatePIC();
              } else {
                this.doSavePIC();
              }
            }
          }
        );
      });
    },
    M_Delete(index) {
      this.alertConfirmation("Are You Sure Want To Delete This Data ?").then(
        ress => {
          if (ress.value) {
            this.doDelete(index);
          }
        }
      );
    },
    doDelete(index) {
      var param = {
        option_url: "/MK/MK_Customer",
        line_no: 1,
        id: this.dataPIC[index].row_id,
        lastupdatestamp: this.dataPIC[index].lastupdatestamp
      };

      this.deleteJSON(this.getUrlCRUD(), param).then(response => {
        this.alertSuccess("Data has been deleted").then(() => {
          this.doGetList();
        });
      });
    },
    doUpdatePIC() {
      var param = {
        option_url: "/MK/MK_Customer",
        line_no: 1,
        cm_contact_id: this.M_Pic.cm_contact_id,
        cm_contact_person_id: this.M_Pic.cm_contact_person_id,
        name: this.M_Pic.contact_person,
        phone_no:
          this.M_Pic.contact_phone_no_1 +
          "-" +
          this.M_Pic.contact_phone_no_2 +
          "-" +
          this.M_Pic.contact_phone_no_3,
        email: this.M_Pic.email,
        lastupdatestamp: this.M_Pic.lastupdatestamp,
        user_edit: this.getDataUser().user_id
      };

      this.putJSON(this.getUrlCRUD(), param).then(response => {
        // console.log(response)
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          this.$refs.Modal_PIC._hide();
          this.doGetList();
          // this.GetDataBy();
        });
      });
    },

    doSavePIC() {
      var param = {
        option_url: "/MK/MK_Customer",
        line_no: 1,
        cm_contact_id: this.paramFromList.cm_contact_id,
        name: this.M_Pic.contact_person,
        phone_no:
          this.M_Pic.contact_phone_no_1 +
          "-" +
          this.M_Pic.contact_phone_no_2 +
          "-" +
          this.M_Pic.contact_phone_no_3,
        email: this.M_Pic.email,
        // lastupdatestamp: this.paramFromList.lastupdatestamp,
        user_input: this.getDataUser().user_id
      };

      this.postJSON(this.getUrlCRUD(), param).then(response => {
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          this.$refs.Modal_PIC._hide();
          this.doGetList();
          // this.GetDataBy();
          // this.doBack();
        });
      });
    },
    // Modal End
    doBack() {
      this.$router.go(-1);
    },
    doEdit() {
      var param = this.paramFromList;
      param.isEdit = true;
      this.$router.push({ name: "MK_AddEditCustomer", params: param });
    },
    doContact() {
      var param = this.paramFromList;
      // param.isEdit = true;
      this.$router.push({ name: "MK_ToDoCustomer", params: param });
    },
    doGetList(search) {
      var param = {
        option_url: "/MK/MK_Customer",
        line_no: 1,
        user_id: this.getDataUser().user_id,
        portfolio_id: this.getDataUser().portfolio_id,
        subportfolio_id: this.getDataUser().subportfolio_id,
        current_page: 1,
        per_page: 10,
        param_where: "",
        initial_where: " cm_contact_id = " + this.paramFromList.cm_contact_id,
        sort_field: "",
        source_field: "",
        param_view: ""
      };

      this.postJSON(this.getUrlList(), param).then(response => {
        if (response == null) return;
        console.log(response.Data);
        this.dataPIC = response.Data;
      });
    },
    onDataDblClick(index) {
      this.inputStatus = "edit";
      var param = {
        option_url: "/MK/MK_Customer",
        line_no: 1,
        id: this.dataPIC[index].row_id,
        lastupdatestamp: this.dataPIC[index].lastupdatestamp
      };

      this.getJSON(this.getUrlCRUD(), param).then(response => {
        if (response == null) return;
        var data = response.Data[0];
        this.$refs.Modal_PIC._show();

        var phone_no =
          data.phone_no && data.phone_no !== "" ? data.phone_no.split("-") : "";

        this.M_Pic = {
          cm_contact_id: data.cm_contact_id,
          cm_contact_person_id: data.cm_contact_person_id,
          contact_person: data.name,
          contact_phone_no_1: phone_no !== "" ? phone_no[0] : phone_no,
          contact_phone_no_2: phone_no !== "" ? phone_no[1] : phone_no,
          contact_phone_no_3: phone_no !== "" ? phone_no[2] : phone_no,
          email: data.email,
          lastupdatestamp: data.lastupdatestamp
        };
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
        this.M_GetDataBy = data;

        this.M_Customer = {
          customer_name: data.name,
          contact_created: this.momentDateFormatting(
            new Date(data.contact_created),
            "DD-MM-YYYY HH.mm"
          ),
          address:
            data.address +
            ", " +
            data.district +
            ", " +
            data.city +
            ", " +
            data.province +
            ", " +
            data.country,
          phone_no: data.phone_no,
          email: data.email,
          website: data.website,
          contact_person: data.contact_person,
          contact_phone_no: data.contact_phone_no
          // path_file: this.url + data.path_file
        };
        if (data.path_file == "" || data.path_file == null) {
          this.M_Customer.path_file = require("@/assets/default_photo_.png");
        } else {
          this.M_Customer.path_file = this.url + data.path_file;
        }
        // this.M_Customer.contact_phone_no_1 = "+62";
      });
    }
  },
  mounted() {
    this.GetDataBy();
    this.doGetList();
  },
  beforeMount() {}
};
</script>

<style>
</style>