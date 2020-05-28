<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Role Management</span>
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
                :data-vv-scope="'ADM_AddGroupManagement'"
                :data-vv-value-path="'ADM_AddGroupManagement'"
              >
                <b-row class="row-view">
                    <b-col md="1">
                        <span>
                            <label> Role </label>
                        </span>
                    </b-col>
                    <b-col md="2">
                        <ACCTextBox
                          :prop="PI_short_descs"
                          v-model="M_GroupManagement.short_descs"
                          ref="ref_short_descs"
                        />
                    </b-col>
                    <b-col md="4">
                        <ACCTextBox
                          :prop="PI_descs"
                          v-model="M_GroupManagement.descs"
                          ref="ref_descs"
                        />
                    </b-col>
                </b-row>
                <b-row>
                    <b-col offset="1">
                      <!-- Level1 -->
                        <div v-for="(module, indexModule) in M_MenuJSON" v-bind:key="indexModule">
                          <b-row :no-gutters="true">
                            <b-col cols="auto" v-show="module.level_2 && module.level_2.length > 0"> <span @click="onExpand('M', module.ss_menu_id)" class="module" :id="'module_'+module.ss_menu_id"><font-awesome-icon :icon="isActive == 'module_'+module.ss_menu_id?'minus-circle':'plus-circle'" class="icon-expand" /></span> </b-col>
                            <b-col cols="auto"> <input style="vertical-align:middle !important" type="checkbox" name="cb_module" :id="'M_'+module.ss_menu_id"  v-model="module.is_check" @click="onCheck(1,indexModule)" > </b-col>
                            <b-col cols="auto"> <span>{{ module.title }}</span> </b-col>
                          </b-row>
                          <b-collapse :id="'bmodule_'+module.ss_menu_id" :visible="isActive == 'module_'+module.ss_menu_id" v-show="module.level_2 && module.level_2.length > 0">

                            <!-- Level2 -->
                            <div v-for="(event, indexEvent) in module.level_2" v-bind:key="indexEvent" style="margin-left: 3%;">
                              <b-row :no-gutters="true">
                                <b-col cols="auto" v-show="event.level_3 && event.level_3.length > 0"> <span @click="onExpand('E', event.ss_menu_id)" class="event" :id="'event_'+event.ss_menu_id"><font-awesome-icon :icon="isActive2 == 'event_'+event.ss_menu_id?'minus-circle':'plus-circle'" class="icon-expand" /></span> </b-col>
                                <b-col cols="auto"> <input style="vertical-align:middle !important" type="checkbox" name="cb_event" :id="'M_'+event.ss_menu_id" v-model="event.is_check" @click="onCheck(2,indexModule, indexEvent)"> </b-col>
                                <b-col cols="auto"> <span>{{ event.title }}</span> </b-col>
                              </b-row>
                              <b-collapse :id="'bevent_'+event.ss_menu_id" :visible="isActive2 == 'event_'+event.ss_menu_id" v-show="event.level_3 && event.level_3.length > 0">

                                <!-- Level3 -->
                                <div v-for="(option, indexOption) in event.level_3" v-bind:key="indexOption" style="margin-left: 3%;">
                                  <b-row :no-gutters="true">
                                    <!-- <b-col cols="auto"> <span @click="isActive3 = (isActive3 == 'option_'+option.ss_menu_id ? '' : 'option_'+option.ss_menu_id)" class="option" :id="'option_'+option.ss_menu_id"><font-awesome-icon :icon="isActive2 == 'option_'+option.ss_menu_id?'minus-circle':'plus-circle'" class="icon-expand" /></span> </b-col> -->
                                    <b-col cols="auto"> <input style="vertical-align:middle !important" type="checkbox" name="cb_option" :id="'M_'+option.ss_menu_id" v-model="option.is_check" @click="onCheck(3,indexModule,indexEvent,indexOption)"> </b-col>
                                    <b-col cols="auto"> <span>{{ option.title }}</span> </b-col>
                                  </b-row>
                                </div>
                                <!-- Level3 -->
                                
                              </b-collapse>
                            </div>
                            <!-- Level2 -->

                          </b-collapse>
                        </div>
                      <!-- Level1 -->
                    </b-col>
                </b-row>
                <b-row style="margin-top: 10px;">
                  <b-col md="6">
                    <ABSButton
                      :text="'Save Role'"
                      classButton="btn btn--default"
                      classIcon="icon-style-default"
                      @click="doSave"
                      styleButton="height: 40px;width: 100%;"
                    />
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
      isActive: "",
      isActive2: "",
      isActive3: "",
      PI_short_descs: {
        cValidate: "",
        cName: "short_descs",
        cOrder: 1,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "ADM_AddGroupManagement",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_descs: {
        cValidate: "",
        cName: "descs",
        cOrder: 2,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "ADM_AddGroupManagement",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      M_GroupManagement: {
          short_descs: "",
          descs: ""
      },
      M_MenuJSON: []
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
    onExpand(from, id) {
      var ids = ""
      if (from == 'M') {
        ids = 'module_' + id
        this.isActive = (this.isActive == ids ? '' : ids)
      }
      else if (from == 'E') {
        ids = 'event_' + id
        this.isActive2 = (this.isActive2 == ids ? '' : ids)
      }
    },
    onCheck(level, indexModule, indexEvent = null, indexOption = null) {
      console.log(this.M_MenuJSON)
      if (level == 1) {
        // if (this.M_MenuJSON[indexModule].level_2 == null) return;
        this.M_MenuJSON[indexModule].add_status = !this.M_MenuJSON[indexModule].is_check
        this.M_MenuJSON[indexModule].edit_status = !this.M_MenuJSON[indexModule].is_check
        this.M_MenuJSON[indexModule].delete_status = !this.M_MenuJSON[indexModule].is_check
        this.M_MenuJSON[indexModule].post_status = !this.M_MenuJSON[indexModule].is_check
        this.M_MenuJSON[indexModule].view_status = !this.M_MenuJSON[indexModule].is_check

        if (this.M_MenuJSON[indexModule].level_2 !== null) {
          this.M_MenuJSON[indexModule].level_2.forEach((event, index) => {
            event.is_check = !this.M_MenuJSON[indexModule].is_check
            event.add_status = !this.M_MenuJSON[indexModule].is_check
            event.edit_status = !this.M_MenuJSON[indexModule].is_check
            event.delete_status = !this.M_MenuJSON[indexModule].is_check
            event.post_status = !this.M_MenuJSON[indexModule].is_check
            event.view_status = !this.M_MenuJSON[indexModule].is_check
  
            if (event.level_3 !== null) {
              event.level_3.forEach((option, index) => {
                option.is_check = !this.M_MenuJSON[indexModule].is_check
                option.add_status = !this.M_MenuJSON[indexModule].is_check
                option.edit_status = !this.M_MenuJSON[indexModule].is_check
                option.delete_status = !this.M_MenuJSON[indexModule].is_check
                option.post_status = !this.M_MenuJSON[indexModule].is_check
                option.view_status = !this.M_MenuJSON[indexModule].is_check
              });
            }
          });
        }
      }
      else if (level == 2) {
        // if (this.M_MenuJSON[indexModule].level_2[indexEvent].level_3 == null) return;
        var isChecked = !this.M_MenuJSON[indexModule].level_2[indexEvent].is_check
        //check child
        if (this.M_MenuJSON[indexModule].level_2[indexEvent].level_3 !== null) {
          this.M_MenuJSON[indexModule].level_2[indexEvent].level_3.forEach((option, index) => {
            option.is_check = !this.M_MenuJSON[indexModule].level_2[indexEvent].is_check
            option.add_status = !this.M_MenuJSON[indexModule].level_2[indexEvent].is_check
            option.edit_status = !this.M_MenuJSON[indexModule].level_2[indexEvent].is_check
            option.delete_status = !this.M_MenuJSON[indexModule].level_2[indexEvent].is_check
            option.post_status = !this.M_MenuJSON[indexModule].level_2[indexEvent].is_check
            option.view_status = !this.M_MenuJSON[indexModule].level_2[indexEvent].is_check
          });
        }

        //check parent
        if (isChecked) {
          this.M_MenuJSON[indexModule].is_check = isChecked
          this.M_MenuJSON[indexModule].add_status = isChecked
          this.M_MenuJSON[indexModule].edit_status = isChecked
          this.M_MenuJSON[indexModule].delete_status = isChecked
          this.M_MenuJSON[indexModule].post_status = isChecked
          this.M_MenuJSON[indexModule].view_status = isChecked

          this.M_MenuJSON[indexModule].level_2[indexEvent].is_check = isChecked
          this.M_MenuJSON[indexModule].level_2[indexEvent].add_status = isChecked
          this.M_MenuJSON[indexModule].level_2[indexEvent].edit_status = isChecked
          this.M_MenuJSON[indexModule].level_2[indexEvent].delete_status = isChecked
          this.M_MenuJSON[indexModule].level_2[indexEvent].post_status = isChecked
          this.M_MenuJSON[indexModule].level_2[indexEvent].view_status = isChecked
        }
        else {
          this.M_MenuJSON[indexModule].is_check = false
          this.M_MenuJSON[indexModule].add_status = false
          this.M_MenuJSON[indexModule].edit_status = false
          this.M_MenuJSON[indexModule].delete_status = false
          this.M_MenuJSON[indexModule].post_status = false
          this.M_MenuJSON[indexModule].view_status = false

          this.M_MenuJSON[indexModule].level_2.forEach((event, index) => {
            if (index == indexEvent) {
              //false
            }
            else {
              if (event.is_check) {
                this.M_MenuJSON[indexModule].is_check = true
                this.M_MenuJSON[indexModule].add_status = true
                this.M_MenuJSON[indexModule].edit_status = true
                this.M_MenuJSON[indexModule].delete_status = true
                this.M_MenuJSON[indexModule].post_status = true
                this.M_MenuJSON[indexModule].view_status = true
                return
              }
            }
          });
        }
      }
    },
    M_ClearForm() {
      this.M_GroupManagement = {
          short_descs: "",
          descs: ""
      }
    },
    M_GetMenu() {
      var param = {
        portfolio_id: this.getDataUser().portfolio_id,
        // group_id: this.getDataUser().group_id,
        group_id: this.paramFromList.row_id && this.paramFromList.row_id !== '' ? this.paramFromList.row_id : "NULL"
      };

      this.getJSON(this.getUrlGroupJson(), param).then(response => {
        // response from API
        if (response == null) return;

        this.M_MenuJSON = JSON.parse(response.Data[0].get_menu_json_group);
        console.log(this.M_MenuJSON)
      });
    },
    doSave() {
      this.$validator._base.validateAll("ADM_AddGroupManagement").then(result => {
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
          ress => {
            if (ress.value) {
              this.$validator.errors.clear("ADM_AddGroupManagement");
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
      var dtl = []

      this.M_MenuJSON.forEach((menu, index) => {
        if (menu.is_check === true) {
          dtl.push({
            ss_menu_id: menu.ss_menu_id,
            add_status: menu.add_status,
            edit_status: menu.edit_status,
            delete_status: menu.delete_status,
            view_status: menu.view_status,
            post_status: menu.post_status
          })
        }

        if (menu.level_2 !== null) {
          menu.level_2.forEach((event, indexE) => {
            if (event.is_check === true) {
              dtl.push({
                ss_menu_id: event.ss_menu_id,
                add_status: event.add_status,
                edit_status: event.edit_status,
                delete_status: event.delete_status,
                view_status: event.view_status,
                post_status: event.post_status
              })
            }

            if (event.level_3 !== null) {
              event.level_3.forEach((option, indexO) => {
                if (option.is_check === true) {
                  dtl.push({
                    ss_menu_id: option.ss_menu_id,
                    add_status: option.add_status,
                    edit_status: option.edit_status,
                    delete_status: option.delete_status,
                    view_status: option.view_status,
                    post_status: option.post_status
                  })
                }
              })
            }
          })
        }
      })

      var param = {
        portfolio_id: this.getDataUser().portfolio_id,
        DataHeader: {
          descs: this.M_GroupManagement.descs,
          short_descs: this.M_GroupManagement.short_descs,
          user_type: "E",
          user_input: this.getDataUser().user_id
        },
        DataDetail: dtl
      };

      this.postJSON(this.getUrlAPIGroup(), param).then(response => {
        // console.log(response)
        if (response == null) return;
        this.alertSuccess("Save Data Has Been Successfully").then(() => {
          this.doBack();
        });
      });
    },
    GetDataBy() {
      var param = {
        option_url: "/ADM/ADM_GroupManagement",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };

      this.getJSON(this.getUrlCRUD(), param).then(response => {
        // response from API
        if (response == null) return;
        this.$store.commit('setStatusLoader', true)

        var data = response.Data[0];

        this.M_GroupManagement = {
            short_descs: data.short_descs,
            descs: data.descs
        };

        setTimeout(() => {
          this.$store.commit('setStatusLoader', false)
        }, 3000);
      });
    },
    M_Update() {
      var dtl = []

      this.M_MenuJSON.forEach((menu, index) => {
        if (menu.is_check === true) {
          dtl.push({
            ss_menu_id: menu.ss_menu_id,
            add_status: menu.add_status,
            edit_status: menu.edit_status,
            delete_status: menu.delete_status,
            view_status: menu.view_status,
            post_status: menu.post_status
          })
        }

        if (menu.level_2 !== null) {
          menu.level_2.forEach((event, indexE) => {
            if (event.is_check === true) {
              dtl.push({
                ss_menu_id: event.ss_menu_id,
                add_status: event.add_status,
                edit_status: event.edit_status,
                delete_status: event.delete_status,
                view_status: event.view_status,
                post_status: event.post_status
              })
            }

            if (event.level_3 !== null) {
              event.level_3.forEach((option, indexO) => {
                if (option.is_check === true) {
                  dtl.push({
                    ss_menu_id: option.ss_menu_id,
                    add_status: option.add_status,
                    edit_status: option.edit_status,
                    delete_status: option.delete_status,
                    view_status: option.view_status,
                    post_status: option.post_status
                  })
                }
              })
            }
          })
        }
      })

      var param = {
        portfolio_id: this.getDataUser().portfolio_id,
        DataHeader: {
          ss_group_id: this.paramFromList.row_id,
          descs: this.M_GroupManagement.descs,
          short_descs: this.M_GroupManagement.short_descs,
          user_type: "E",
          user_edit: this.getDataUser().user_id,
          lastupdatestamp: this.paramFromList.lastupdatestamp
        },
        DataDetail: dtl
      };

      this.putJSON(this.getUrlAPIGroup(), param).then(response => {
        // console.log(response)
        if (response == null) return;
        this.alertSuccess("Update Data Has Been Successfully").then(() => {
          this.doBack();
        });
      });
    }
  },
  mounted() {
    this.M_ClearForm();
    this.M_GetMenu();
    if (this.inputStatus == "edit") {
      this.GetDataBy();
    }
  }
};
</script>

<style>
</style>