<template>
  <div class="height--full" id="entryPage">
    <div
      class="header--content"
      style="margin-top: 32px !important;margin-left:0px !important;margin-right:0px !important;position: fixed;width: 100%;"
    >
      <div class="header--content__title">
        <b-row class="header-toolbar">
          <b-col sm="12">
            Menu Access Entry |
            <ABSButton
              text="Save"
              icon="save"
              classButton="button button--save"
              classIcon="icon-style-1"
              @click="M_Insert"
            />

            <!-- <ABSButton
              text="Back"
              icon="chevron-left"
              classButton="button-cancel button--cancelnew"
              classIcon="icon-style-1"
              @click="onGoBack"
              :styleButton="{color: 'black'}"
            />-->
          </b-col>
        </b-row>
      </div>
    </div>
    <div class="content-app-form__body">
      <div class="block-scope-mobile" style="top:13%;margin:0px !important;padding-top:15px;">
        <b-row style="margin: 0px !important;">
          <b-col md="12" class="bColMasterForm" style="padding: 5px !important">
            <div class="card" style="font-size:11px; border:0px !important;">
              <b-modal
                id="modalModulAccessEntry"
                :title="TitleLevel"
                size="lg"
                ref="modalModulAccessEntry"
                class="modalCustomABS"
              >
                <b-row>
                  <b-col sm="6">
                    <b-form data-vv-scope="'FormScope_1_1'" data-vv-value-path="'FormScope_1_1'">
                      <ABSInputSelect2
                        @change="OnmodulecdChange"
                        :prop="PI_modulecd"
                        :value="M_SS_MenuEntry.moduleid"
                        ref="ref_modulecd"
                      />
                      <ABSinputTextVuex :prop="PI_title" v-model="M_SS_MenuEntry.title" />
                      <ABSinputTextVuex :prop="PI_menu_url" v-model="M_SS_MenuEntry.menu_url" />
                      <ABSinputTextVuex :prop="PI_icon_class" v-model="M_SS_MenuEntry.icon_class" />

                      <ABSinputRadioButtonVuex
                        @input="Onpmenu_typeChange"
                        :prop="PI_menu_type"
                        v-model="M_SS_MenuEntry.menu_type"
                        ref="ref_menu_type"
                      />
                    </b-form>
                  </b-col>
                </b-row>
                <div slot="modal-footer" class="w-100">
                  <div style="padding-right:20px">
                    <b-btn
                      size="sm"
                      class="float-right btnModal__btnCancel"
                      @click="$refs.modalModulAccessEntry.hide()"
                    >Cancel</b-btn>
                    <!-- <b-btn size="sm" class="float-right btnModal__btnOK" variant="primary" @click="modalModulAccessEntryHandleOk"> -->
                    <b-btn
                      size="sm"
                      class="float-right btnModal__btnOK"
                      variant="primary"
                      @click="M_Save"
                    >OK</b-btn>
                  </div>
                </div>
              </b-modal>

              <b-row
                style="padding-top:10px padding-right: 10px padding-left: 20px padding-bottom: 10px !important"
              >
                <b-col sm="4">
                  <ABSButton
                    @click="openModalMenuEntry(1)"
                    icon="plus"
                    text="Add"
                    classButton="btnList__btnPrimary"
                    classIcon="icon-style-1"
                  />
                  <ABSButton
                    @click="openModalMenuUpdate(1)"
                    icon="edit"
                    text="Edit"
                    classButton="btnList__btnPrimary"
                    classIcon="icon-style-2"
                  />
                  <ABSButton
                    @click="M_Delete(1)"
                    icon="trash"
                    text="Delete"
                    classButton="btnList__btnPrimary"
                    classIcon="icon-style-2"
                  />
                  <ABSButton
                    @click="moveUpDown('U','M')"
                    icon="arrow-up"
                    text="Up"
                    classButton="btnList__btnPrimary"
                    classIcon="icon-style-1"
                  />
                  <ABSButton
                    @click="moveUpDown('D','M')"
                    icon="arrow-down"
                    text="Down"
                    classButton="btnList__btnPrimary"
                    classIcon="icon-style-2"
                  />
                  <!-- <button @click="moveUpDown('U','M')">Up</button>
                  <button @click="moveUpDown('D','M')">Down</button>-->
                  <div>Level 1</div>
                  <!-- <b-form-select onDblClick="openEditModuleAccsessEntry(this.value)" class="selectCustom" v-model="moduleAccessEntrySelected" :options="optLevel1" :select-size="15">
                  </b-form-select> onDblClick="alert(this.value)"-->

                  <ABSMultiSelect
                    id="MySelect"
                    v-model="moduleAccessEntrySelected"
                    :options="optLevel1"
                    :multi="false"
                    @change="onChangeLevel1"
                    size="10"
                    class="selectCustom"
                    style="margin-top:5px !important"
                  />

                  <!-- <draggable v-if="optLevel1.length > 0" v-model="optLevel1" @start="drag=true" @end="drag=false" class="drag-area">
                  <div @click="getDataLevel2" v-for="element in optLevel1" :key="element.value" class="draggable">
                    {{element.key}}
                     <span>                  
                      <span class="btn-remove" style="margin-top:0px float:right" @click="M_moveLeft(element.value)">
                        <font-awesome-icon icon="trash" /> Delete
                      </span>
                    </span>
                  </div>
                  </draggable>-->
                </b-col>
                <b-col sm="4">
                  <ABSButton
                    :disabled="!moduleAccessEntrySelected"
                    @click="openModalMenuEntry(2)"
                    icon="plus"
                    text="Add"
                    classButton="btnList__btnPrimary"
                    classIcon="icon-style-1"
                  />
                  <ABSButton
                    :disabled="!moduleAccessEntrySelected"
                    @click="openModalMenuUpdate(2)"
                    icon="edit"
                    text="Edit"
                    classButton="btnList__btnPrimary"
                    classIcon="icon-style-2"
                  />
                  <ABSButton
                    :disabled="!moduleAccessEntrySelected"
                    @click="M_Delete(2)"
                    icon="trash"
                    text="Delete"
                    classButton="btnList__btnPrimary"
                    classIcon="icon-style-2"
                  />
                  <ABSButton
                    :disabled="!moduleAccessEntrySelected"
                    @click="moveUpDown('U','E')"
                    icon="arrow-up"
                    text="Up"
                    classButton="btnList__btnPrimary"
                    classIcon="icon-style-1"
                  />
                  <ABSButton
                    :disabled="!moduleAccessEntrySelected"
                    @click="moveUpDown('D','E')"
                    icon="arrow-down"
                    text="Down"
                    classButton="btnList__btnPrimary"
                    classIcon="icon-style-2"
                  />
                  <div>Level 2</div>
                  <ABSMultiSelect
                    v-model="Level_2_Selected"
                    :options="optLevel2"
                    :multi="false"
                    @change="onChangeLevel2"
                    size="10"
                    class="selectCustom"
                    style="margin-top:5px !important"
                  />
                </b-col>
                <b-col sm="4">
                  <ABSButton
                    :disabled="!Level_2_Selected || !moduleAccessEntrySelected"
                    @click="openModalMenuEntry(3)"
                    icon="plus"
                    text="Add"
                    classButton="btnList__btnPrimary"
                    classIcon="icon-style-1"
                  />
                  <ABSButton
                    :disabled="!Level_2_Selected || !moduleAccessEntrySelected"
                    @click="openModalMenuUpdate(3)"
                    icon="edit"
                    text="Edit"
                    classButton="btnList__btnPrimary"
                    classIcon="icon-style-2"
                  />
                  <ABSButton
                    :disabled="!moduleAccessEntrySelected"
                    @click="M_Delete(3)"
                    icon="trash"
                    text="Delete"
                    classButton="btnList__btnPrimary"
                    classIcon="icon-style-2"
                  />
                  <!-- <ABSButton :disabled="!Level_2_Selected || !moduleAccessEntrySelected" icon="trash" text="Delete" classButton="btnList__btnPrimary" classIcon="icon-style-2"/> -->
                  <ABSButton
                    :disabled="!Level_2_Selected || !moduleAccessEntrySelected"
                    @click="moveUpDown('U','O')"
                    icon="arrow-up"
                    text="Up"
                    classButton="btnList__btnPrimary"
                    classIcon="icon-style-1"
                  />
                  <ABSButton
                    :disabled="!Level_2_Selected || !moduleAccessEntrySelected"
                    @click="moveUpDown('D','O')"
                    icon="arrow-down"
                    text="Down"
                    classButton="btnList__btnPrimary"
                    classIcon="icon-style-2"
                  />
                  <div>Level 3</div>
                  <ABSMultiSelect
                    v-model="Level_3_Selected"
                    :options="optLevel3"
                    :multi="false"
                    @change="onChangeLevel3"
                    size="10"
                    class="selectCustom"
                    style="margin-top:5px !important"
                  />
                </b-col>
                <!-- <b-col sm="3">
                <b-form-select id="select2" multiple :select-size="4" v-model="selected" :options="options" class="mb-3">
                </b-form-select>
                <input v-on:click="upDownButton('up')" type="button" value="Up">
                <input v-on:click="upDownButton('Down')" type="button" value="Down">
                </b-col>-->
              </b-row>
              <!-- <b-row>
            <b-col sm="12">
                <button @click="M_SaveSort">Save</button>
            </b-col>
              </b-row>-->
            </div>
          </b-col>
        </b-row>
      </div>
    </div>
    <ABSLoader />
  </div>
</template>

<script>
export default {
  props: { PageLevel: "1", TabIndex: "1", data: "" },
  data() {
    return {
      Module: "SS",
      FormType: "Form",
      counter: 0,
      TitleLevel: "Level",
      Level_1_Id: 0,
      Level_2_id: 0,
      moduleAccessEntrySelected: null,
      optLevel1: [],
      Level_2_Selected: null,
      optLevel2: [],
      Level_3_Selected: null,
      optLevel3: [],
      ListModuel: [],
      eventOptionTemp: [],
      options: [
        { value: null, text: "Please select some item" },
        { value: "a", text: "This is option a" },
        { value: "b", text: "Default Selected Option b" },
        { value: "c", text: "This is option c" },
        { value: "d", text: "This one is disabled", disabled: true },
        { value: "e", text: "This is option e" },
        { value: "e", text: "This is option f" }
      ],
      M_SS_MenuEntry: {
        menu_id: 0,
        moduleid: 0,
        title: null,
        menu_url: null,
        icon_class: null,
        parent_menu_id: 0,
        menu_type: "M",
        level_no: 1,
        modulecdLabel: ""
      },
      M_SS_EventAccess: {
        TextMenu: null
      },
      IEBy: { Input: "", Edit: "" },

      // PI_modulecd: {
      //   dataLookUp: {
      //     LookUpCd: "GetLookupSSModule",
      //     ColumnDB: "ModuleCd",
      //     InitialWhere: "",
      //     ParamWhere: ""
      //   },
      //   cValidate: "required",
      //   cName: "moduleid",
      //   cLabel: "Module",
      //   cKey: false,
      //   cStatic: false,
      //   cOrder: 1,
      //   cPageLevel: 1,
      //   cTabIndex: 1,
      //   cParentForm: "FormScope_1_1",
      //   cMasterUrl: "",
      //   cDisplayColumn: "module_id,descs"
      // },
      PI_modulecd: {
        dataLookUp: null,
        cValidate: "",
        cName: "moduleid",
        cLabel: "Module",
        cLabelSize: 4,
        cOrder: 1,
        cKey: false,
        cTriggered: false,
        cDefault: "",
        cProtect: false,
        cVisible: true,
        cAsync: false,
        cFilter: true,
        cPageLevel: 1,
        cTabIndex: 1,
        cParentForm: "FormScope_1_1",
        cStatic: true,
        cOption: [
          // { label: "Staff", id: "S" },
          // { label: "Supervisor", id: "P" },
          // { label: "Manager", id: "M" }
        ],
        cMasterUrl: "",
        cDisplayColumn: ""
      },
      PI_title: {
        cValidate: "required",
        cName: "title",
        cLabel: "Menu Name",
        cOrder: 2,
        cKey: true,
        cPageLevel: 1,
        cTabIndex: 1,
        cParentForm: "FormScope_1_1"
      },
      PI_menu_url: {
        cValidate: "required|max:60",
        cName: "menu_url",
        cLabel: "Menu url",
        cOrder: 3,
        cKey: true,
        cPageLevel: 1,
        cTabIndex: 1,
        cParentForm: "FormScope_1_1"
      },
      PI_icon_class: {
        cValidate: "",
        cName: "icon_class",
        cLabel: "Icon Menu",
        cOrder: 4,
        cKey: true,
        cPageLevel: 1,
        cTabIndex: 1,
        cParentForm: "FormScope_1_1"
      },
      PI_menu_type: {
        cValidate: "",
        cName: "menu_type",
        cId: "rdbmenu_type",
        cRadioOptions: [
          { text: "Module", value: "M" },
          { text: "Event", value: "E" },
          { text: "Option", value: "O" }
        ],
        cRadioDefaultOption: "Y",
        cLabel: "Menu Type",
        cLabelSize: 4,
        cOrder: 6,
        cProtect: false,
        cVisible: true,
        cPageLevel: 1,
        cTabIndex: 1,
        cParentForm: "FormScope_1_1"
      },

      // PTanalysis: {
      //     cPageLevel: 1,
      //     cTabIndex: 1,
      //     cPageMasterSeq: this.data.PageMasterSeq,
      //     cFormPageNo: this.data.PageOrder
      // },
      AllModules: [],
      OptionSelected: [],
      DataLevel3: [],
      AllPage: [],
      AllPage_Temp: [],
      onFilteredMenus: [],
      selectedModuleForMenu: null
    };
  },
  methods: {
    OnmodulecdChange(data) {
      this.M_SS_MenuEntry.moduleid = data.id;
    },
    Onpmenu_typeChange() {},
    M_PageSize() {},
    M_TabClick() {},
    M_Pagination() {},
    M_Advance_Filter() {},
    M_Search(data) {
      this.$store.commit("setEventStatus", "ONSEARCHENTER");
      this.$store.commit("setLevel", 1);
      this.$parent.isDetail = false;
      this.FormToMasterPage().ValidasiPage();
      this.FormToABSList().doGetList(data, "eb_getList");
    },
    M_Post() {},
    M_Refresh() {},
    M_New() {
      this.$parent.state = "NEW";

      this.FormToMasterPage().ValidasiPage();
      this.$parent.isDetail = true;

      this.$nextTick().then(() => document.getElementById("TextMenu").focus());
    },
    M_Edit() {
      this.$nextTick().then(() => document.getElementById("TextMenu").focus());
    },
    M_Delete(from) {
      //   if (from == "M") {
      //     if (this.moduleAccessEntrySelected == null) {
      //       this.alertError("No Module Selected !")
      //       return
      //     }
      //     if (this.optLevel2.length > 0) {
      //       this.alertError("This Module Could Not Be Delete !")
      //     } else {
      //       this.alertConfirmation(
      //         "Are You Sure Want To Delete This Module ?"
      //       ).then(ress => {
      //         if (ress.value) {
      //           var param = {
      //             OptionSeq: this.getOptionSeq().OptionSeq,
      //             LineNo: 0,
      //             module_seq: this.moduleAccessEntrySelected.value,
      //             lastupdatestamp: this.moduleAccessEntrySelected.lastupdatestamp
      //           }
      //           this.postJSON(this.getUrlDelete(), param).then(response => {
      //             if (response == null) return
      //             this.alertSuccess("Deleting Data Successfully").then(() => {
      //               this.optLevel2 = []
      //               this.optLevel3 = []
      //               this.moduleAccessEntrySelected = null
      //               this.Level_2_Selected = null
      //               this.Level_3_Selected = null
      //               this.getDataLevel1()
      //             })
      //           })
      //         }
      //       })
      //     }
      //   } else if (from == "E") {
      //     if (this.Level_2_Selected == null) {
      //       this.alertError("No Event Selected !")
      //       return
      //     }
      //     if (this.optLevel3.length > 0) {
      //       this.alertError("This Event Could Not Be Delete !")
      //     } else {
      //       this.alertConfirmation(
      //         "Are You Sure Want To Delete This Event ?"
      //       ).then(ress => {
      //         // console.log(ress)
      //         if (ress.value) {
      //           var param = {
      //             OptionSeq: this.getOptionSeq().OptionSeq,
      //             LineNo: 1,
      //             module_seq: this.Level_2_Selected.module_seq,
      //             event_seq: this.Level_2_Selected.value,
      //             lastupdatestamp: this.Level_2_Selected.lastupdatestamp
      //           }
      //           this.postJSON(this.getUrlDelete(), param).then(response => {
      //             if (response == null) return
      //             this.alertSuccess("Deleting Data Successfully").then(() => {
      //               this.optLevel3 = []
      //               this.Level_3_Selected = null
      //               this.getDataLevel2(this.moduleAccessEntrySelected)
      //             })
      //           })
      //         }
      //       })
      //     }
      //   }
    },
    M_Save() {
      // alert(this.$store.getters.getStatus.toUpperCase())
      var param = {
        title: this.M_SS_MenuEntry.title,
        menu_url: this.M_SS_MenuEntry.menu_url,
        menu_type: this.M_SS_MenuEntry.menu_type,
        parent_menu_id: this.M_SS_MenuEntry.parent_menu_id,
        icon_class: this.M_SS_MenuEntry.icon_class,
        ss_module_id: this.M_SS_MenuEntry.moduleid,
        level_no: this.M_SS_MenuEntry.level_no,
        user_input: this.getDataUser().user_id
      };
      console.log(JSON.stringify(param, null, 2));

      this.postJSON(this.getUrlSsMenu(), param).then(response => {
        if (response == null) return;

        // this.$parent.resultInsert(response.Message);
        this.alertSuccess("Data Has Been Save Successfull");
        this.$refs.modalModulAccessEntry.hide();
        if (this.M_SS_MenuEntry.level_no == 1) {
          this.getDataLevel1();
          this.optLevel2 = [];
          this.optLevel3 = [];
        } else if (this.M_SS_MenuEntry.level_no == 2) {
          this.getDataLevel2(this.M_SS_MenuEntry.parent_menu_id);
          this.optLevel3 = [];
        } else {
          this.getDataLevel3(this.M_SS_MenuEntry.parent_menu_id);
        }
      });
    },
    // M_SaveSort(){
    M_Insert() {
      if (this.optLevel1.length > 0) {
        // level 1
        var dataLevel1ToSave = [];
        this.optLevel1.forEach((dt, id) => {
          var ids = id + 1;
          dataLevel1ToSave.push({
            menu_id: dt.value,
            parent_menu_id: dt.parent_menu_id,
            order_seq: ids,
            user_edit: this.getDataUser().user_id
          });
        });
        var param = {
          OptionUrl: this.getOptionUrl(),
          LineNo: 0,
          Data: dataLevel1ToSave
        };
        this.putJSONMulti(this.getUrlUpdateMulti(), param).then(response => {
          console.log("response", response);
          if (response == null) {
            this.alertError("Saving Data Level 1 Has A Problem");
            return;
          }
          if (this.optLevel2.length > 0) {
            // level 2
            var dataLevel2ToSave = [];
            this.optLevel2.forEach((dt, id) => {
              var ids = id + 1;
              dataLevel2ToSave.push({
                menu_id: dt.value,
                parent_menu_id: dt.parent_menu_id,
                order_seq: ids,
                user_edit: this.getDataUser().user_id
              });
            });

            param.Data = dataLevel2ToSave;
            this.putJSONMulti(this.getUrlUpdateMulti(), param).then(
              response => {
                console.log("response", response);
                if (response == null) {
                  this.alertError("Saving Data Level 2 Has A Problem");
                  return;
                }
                var dataLevel3ToSave = [];
                this.optLevel3.forEach((dt, id) => {
                  var ids = id + 1;
                  dataLevel3ToSave.push({
                    menu_id: dt.value,
                    parent_menu_id: dt.parent_menu_id,
                    order_seq: ids,
                    user_edit: this.getDataUser().user_id
                  });
                });

                param.Data = dataLevel3ToSave;
                this.putJSONMulti(this.getUrlUpdateMulti(), param).then(
                  response => {
                    console.log("response", response);
                    if (response == null) {
                      this.alertError("Saving Data Level 3 Has A Problem");
                      return;
                    }

                    this.alertSuccess("Data Has Been Save Successfull");
                  }
                );
              }
            );
          }
        });
      }
    },
    loopUpdateOrderSeq(dataLoop, level) {
      var dataLevelToSave = [];
      this.dataLoop.forEach((dt, id) => {
        var ids = id + 1;
        dataLevelToSave.push({
          menu_id: dt.value,
          parent_menu_id: dt.parent_menu_id,
          order_seq: ids,
          user_edit: this.getDataUser().user_id
        });
      });

      param.Data = dataLevelToSave;
      this.putJSONMulti(this.getUrlUpdateMulti(), param).then(response => {
        console.log("response", response);
        if (response == null) {
          let msg = "Saving Data Level" + level + " Has A Problem!";
          this.alertError(msg);
          return;
        }
      });
    },
    paramFromParent() {},
    rowClicked(record, index) {
      this.$parent.state = "UPDATE";
      this.$store.commit("SetPage1Data", record);
      this.$store.commit("setEventStatus", "rowClick");
      this.$store.commit("setLevel", 1);
      this.getDataBy(record);
      this.$parent.isDetail = true;

      this.PageMasterSeqShow = true;

      this.PageMasterSeq = record.page_master_seq;
      this.LastUpdateStamp = record.lastupdatestamp;

      this.FormToMasterPage().ValidasiPage();
    },
    rowLink: function(url) {
      this.$refs.modalTest.show();
    },
    moveUpDown(direction, from) {
      if (from == "M") {
        // Level 1
        var moduleData = this.optLevel1;
        if (direction == "U") {
          // kalo pencet up berarti data yang dibawah adalah data yang dipilih
          var idxDown = moduleData
            .map(x => x.value)
            .indexOf(this.moduleAccessEntrySelected.value);
          var idxUp = idxDown - 1;

          if (idxUp >= 0) {
            var dataTempDown = moduleData[idxDown];
            var dataTempUp = moduleData[idxUp];

            this.$nextTick(() => {
              this.optLevel1 = [];
              moduleData[idxDown] = dataTempUp;
              moduleData[idxUp] = dataTempDown;
              setTimeout(() => {
                this.optLevel1 = moduleData;
              }, 0);
            });
          }
        } else if (direction == "D") {
          var idxUp = moduleData
            .map(x => x.value)
            .indexOf(this.moduleAccessEntrySelected.value);
          var idxDown = idxUp + 1;

          if (idxUp < this.optLevel1.length - 1) {
            var dataTempUp = moduleData[idxUp];
            var dataTempDown = moduleData[idxDown];

            this.$nextTick(() => {
              this.optLevel1 = [];
              moduleData[idxUp] = dataTempDown;
              moduleData[idxDown] = dataTempUp;
              setTimeout(() => {
                this.optLevel1 = moduleData;
              }, 0);
            });
          }
        }
      } else if (from == "E") {
        var eventData = this.optLevel2;
        if (direction == "U") {
          // kalo pencet up berarti data yang dibawah adalah data yang dipilih
          var idxDown = eventData
            .map(x => x.value)
            .indexOf(this.Level_2_Selected.value);
          var idxUp = idxDown - 1;

          if (idxUp >= 0) {
            var dataTempDown = eventData[idxDown];
            var dataTempUp = eventData[idxUp];

            this.$nextTick(() => {
              this.optLevel2 = [];
              eventData[idxDown] = dataTempUp;
              eventData[idxUp] = dataTempDown;
              setTimeout(() => {
                this.optLevel2 = eventData;
              }, 0);
            });
          }
        } else if (direction == "D") {
          var idxUp = eventData
            .map(x => x.value)
            .indexOf(this.Level_2_Selected.value);
          var idxDown = idxUp + 1;

          if (idxUp < this.optLevel2.length - 1) {
            var dataTempUp = eventData[idxUp];
            var dataTempDown = eventData[idxDown];

            this.$nextTick(() => {
              this.optLevel2 = [];
              eventData[idxUp] = dataTempDown;
              eventData[idxDown] = dataTempUp;
              setTimeout(() => {
                this.optLevel2 = eventData;
              }, 0);
            });
          }
        }
      } else if (from == "O") {
        var optionData = this.optLevel3;
        if (direction == "U") {
          // kalo pencet up berarti data yang dibawah adalah data yang dipilih
          var idxDown = optionData
            .map(x => x.value)
            .indexOf(this.Level_3_Selected.value);
          var idxUp = idxDown - 1;

          if (idxUp >= 0) {
            var dataTempDown = optionData[idxDown];
            var dataTempUp = optionData[idxUp];

            this.$nextTick(() => {
              this.optLevel3 = [];
              optionData[idxDown] = dataTempUp;
              optionData[idxUp] = dataTempDown;
              setTimeout(() => {
                this.optLevel3 = optionData;
              }, 0);
            });
          }
        } else if (direction == "D") {
          var idxUp = optionData
            .map(x => x.value)
            .indexOf(this.Level_3_Selected.value);
          var idxDown = idxUp + 1;

          if (idxUp < this.optLevel3.length - 1) {
            var dataTempUp = optionData[idxUp];
            var dataTempDown = optionData[idxDown];

            this.$nextTick(() => {
              this.optLevel3 = [];
              optionData[idxUp] = dataTempDown;
              optionData[idxDown] = dataTempUp;
              setTimeout(() => {
                this.optLevel3 = optionData;
              }, 0);
            });
          }
        }
      }

      this.$forceUpdate();
    },
    getAllAccess() {
      //   var param = {
      //     OptionSeq: this.getOptionSeq().OptionSeq,
      //     LineNo: 3
      //   }
      //   this.postJSON(this.getUrlById(), param).then(response => {
      //     if (response == null) return
      //     var data = response.Data
      //     this.AllPage = []
      //     this.AllModules = []
      //     if (data.length > 0) {
      //       this.$nextTick(() => {
      //         this.AllPage = data
      //         this.AllPage_Temp = data
      //         this.AllModules = [
      //           ...new Set(data.map(x => x.module_cd.toUpperCase()))
      //         ]
      //       })
      //       this.$forceUpdate()
      //     }
      //   })
    },
    getFileInUse() {
      if (this.optLevel3.length > 0) {
        this.$nextTick(() => {
          var allDatas = this.AllPage;
          this.optLevel3.forEach(element => {
            var idx = allDatas
              .map(el => el.page_master_seq)
              .indexOf(element.value);
            var isInUse = this.DataLevel3.map(e => e.value).includes(
              element.value
            );

            if (idx > -1) {
              this.AllPage[idx].set = true;
              this.AllPage[idx].disabled = isInUse;
            }
          });
        });

        this.$forceUpdate();
      }
    },
    expand(param) {
      if (param == this.selectedModuleForMenu) {
        this.selectedModuleForMenu = null;
        this.onFilteredMenus = [];
        document.getElementById("module_" + param).innerHTML = "+";
      } else {
        // console.log(this.AllPage)
        this.onFilteredMenus = this.AllPage.filter(val => {
          return val.module_cd.toUpperCase() == param;
        });

        if (this.selectedModuleForMenu !== null) {
          document.getElementById(
            "module_" + this.selectedModuleForMenu
          ).innerHTML = "+";
        }

        this.selectedModuleForMenu = param;
        document.getElementById("module_" + param).innerHTML = "-";
      }
    },
    onChangeLevel3(data) {},
    onChangeLevel2(data) {
      this.Level_2_Id = data.value;
      this.getDataLevel3(data.value);
      //   this.Level_3_Selected = null
      //   this.optLevel3 = []
      //   var param = {
      //     OptionSeq: this.getOptionSeq().OptionSeq,
      //     LineNo: 2,
      //     module_seq: datas.module_seq,
      //     event_seq: datas.value
      //   }
      //   this.postJSON(this.getUrlById(), param).then(response => {
      //     if (response == null) return
      //     var data = response.Data
      //     this.$nextTick(() => {
      //       if (data.length > 0) {
      //         this.DataLevel3 = []
      //         data.forEach((dt, idx) => {
      //           this.DataLevel3.push({
      //             value: dt.page_master_seq,
      //             key: dt.text_menu
      //           })
      //         })
      //         this.getDataLevel3(datas)
      //       }
      //       this.$forceUpdate()
      //     })
      //     // this.eventOptionTemp = this.optLevel3
      //   })
    },
    getDataLevel3(datas) {
      console.log(datas);
      var param =
        "/datalist?initialwhere=parent_menu_id=" + datas + " and level_no=3";
      this.getJSON(this.getUrlSsMenu() + param).then(response => {
        if (response == null) return;
        var data = response.Data;
        this.optLevel3 = [];
        if (data.length > 0) {
          data.forEach((dt, idx) => {
            this.optLevel3.push({
              value: dt.ss_menu_id,
              key: dt.title,
              parent_menu_id: dt.parent_menu_id
            });
          });
        }
        // this.optLevel3 = this.DataLevel3.concat(this.OptionSelected)
        this.eventOptionTemp = this.optLevel3;
        this.Level_3_Selected = null;
      });
    },
    onChangeLevel1(data) {
      this.Level_1_Id = data.value;
      this.getDataLevel2(data.value);
    },
    getDataLevel2(datas) {
      var param =
        "/datalist?initialwhere=parent_menu_id=" + datas + " and level_no=2";
      this.getJSON(this.getUrlSsMenu() + param).then(response => {
        if (response == null) return;
        var data = response.Data;
        this.$nextTick(() => {
          this.optLevel2 = [];
          if (data.length > 0) {
            data.forEach((dt, idx) => {
              this.optLevel2.push({
                value: dt.ss_menu_id,
                key: dt.title,
                parent_menu_id: dt.parent_menu_id,
                lastupdatestamp: dt.lastupdatestamp
              });
            });
          }
          this.optLevel3 = [];
          this.Level_2_Selected = null;
          this.Level_3_Selected = null;
          this.$forceUpdate();
        });
      });
    },
    getDataLevel1() {
      var param = "/datalist?initialwhere=parent_menu_id=0 and level_no=1";
      this.getJSON(this.getUrlSsMenu() + param).then(response => {
        if (response == null) return;
        var data = response.Data;
        this.optLevel1 = [];
        if (data.length > 0) {
          // data = data[0]
          this.$nextTick(() => {
            data.forEach((dt, idx) => {
              this.optLevel1.push({
                value: dt.ss_menu_id,
                key: dt.title,
                parent_menu_id: dt.parent_menu_id,
                lastupdatestamp: dt.lastupdatestamp
              });
            });
          });
        }
      });
    },
    openModalMenuEntry(level) {
      this.TitleLevel = "Level " + level;

      this.M_SS_MenuEntry.moduleid = 0;
      this.M_SS_MenuEntry.title = "";
      this.M_SS_MenuEntry.level_no = level;
      if (level == 1) {
        this.M_SS_MenuEntry.parent_menu_id = 0;
      } else if (level == 2) {
        this.M_SS_MenuEntry.parent_menu_id = this.Level_1_Id;
      } else {
        this.M_SS_MenuEntry.parent_menu_id = this.Level_2_Id;
      }
      // this.getToolbar().FormStatus = "NEW";
      this.$refs.modalModulAccessEntry.show();
    },
    openModalMenuUpdate(level) {
      var param = 0;
      if (level == 1) {
        param = "/" + this.Level_1_Id;
      } else if (level == 2) {
        param = "/" + this.Level_2_Id;
      } else {
        param = "/" + this.Level_3_Id;
      }

      this.getJSON(this.getUrlSsMenu() + param).then(response => {
        if (response == null) return;
        var data = response.Data;

        this.$nextTick(() => {
          console.log("data", JSON.stringify(data, null, 0));
          this.M_SS_MenuEntry.menu_id = data.ss_menu_id;
          this.M_SS_MenuEntry.title = data.title;
          this.M_SS_MenuEntry.menu_url = data.menu_url;
          this.M_SS_MenuEntry.menu_type = data.menu_type;
          this.M_SS_MenuEntry.parent_menu_id = data.parent_menu_id;
          this.M_SS_MenuEntry.icon_class = data.icon_class;
          this.M_SS_MenuEntry.moduleid = data.ss_module_id;
          this.M_SS_MenuEntry.level_no = data.level_no;

          this.$refs.modalModulAccessEntry.show();
          console.log("Model", JSON.stringify(this.M_SS_MenuEntry, null, 0));
        });
      });
    },
    openEditModuleAccsessEntry(data) {
      alert(data);
    },

    modalModulAccessEntryHandleOk() {
      var scopeForm = "FormScope_1_1";

      this.$validator._base.validateAll(scopeForm).then(result => {
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
          ress => {
            if (ress.value) {
              this.$store.commit("setEventStatus", "SAVE");
              this.$validator.errors.clear(scopeForm);
              this.getChild().M_Save();
            }
          }
        );
      });
    },
    modalEventAccessHandleOk() {
      alert("modalEventAccessHandleOk");
    },
    modalSetOptionHandleOk() {
      alert("modalSetOptionHandleOk");
    },
    // optLevel1() {},
    setToolbarButton() {
      this.getToolbar().isNew = true;
      this.getToolbar().statusFunction[6].disabled = true;
      this.getToolbar().statusFunction[7].disabled = false;
    },

    getDataModule() {
      var param = "/datalist";
      this.getJSON(this.getUrlSsModule() + param).then(response => {
        if (response == null) return;
        var data = response.Data;
        this.ListModuel = [];
        if (data.length > 0) {
          // data = data[0]
          // this.$nextTick(() => {
          data.forEach((dt, idx) => {
            this.ListModuel.push({
              label: dt.descs,
              id: dt.ss_module_id
            });
          });
          this.PI_modulecd.cOption = this.ListModuel;
          // });
        }
      });
    }
  },
  beforeCreate: function() {},
  created: function() {
    this.$store.commit("setStatus", "new");
  },
  beforeMount: function() {},
  mounted: function() {
    this.getDataLevel1();
    this.getDataModule();

    // this.getAllAccess()
    // this.hideSideBarMenu()
  },
  beforeUpdate: function() {},
  updated: function() {},
  beforeDestroy: function() {},
  destroyed: function() {}
};
</script>

<style scoped>
div.draggable {
  cursor: move;
  position: relative;
  display: block;
  padding: 10px 15px;
  /* margin-bottom: -1px */
  background-color: #fff;
  border-bottom: 1px solid #ddd;
}
</style>

