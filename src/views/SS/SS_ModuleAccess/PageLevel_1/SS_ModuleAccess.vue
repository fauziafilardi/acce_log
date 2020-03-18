<template>
  <div>
    <b-modal
      id="modalModulAccessEntry"
      title="Module Access Entry"
      size="lg"
      ref="modalModulAccessEntry"
      class="modalCustomABS"
    >
      <b-row>
        <b-col sm="6">
          <b-form data-vv-scope="'FormScope_1_1'" data-vv-value-path="'FormScope_1_1'">
            <ABSProcessinputText :prop="PI.ShortName" v-model="M_SS_ModuleAccess.ShortName" />
            <ABSProcessinputText :prop="PI.MenuName" v-model="M_SS_ModuleAccess.MenuName" />
          </b-form>
        </b-col>
      </b-row>
      <div slot="modal-footer" class="w-100">
        <div style="padding-right:20px;">
          <b-btn
            size="sm"
            class="float-right btnModal__btnCancel"
            @click="$refs.modalModulAccessEntry.hide()"
          >Cancel</b-btn>
          <!-- <b-btn size="sm" class="float-right btnModal__btnOK" variant="primary" @click="modalModulAccessEntryHandleOk"> -->
          <b-btn size="sm" class="float-right btnModal__btnOK" variant="primary" @click="M_Save">OK</b-btn>
        </div>
      </div>
    </b-modal>

    <b-modal
      id="modalEventAccess"
      title="Event Access Entry"
      size="lg"
      ref="modalEventAccess"
      class="modalCustomABS"
    >
      <b-row>
        <b-col sm="6">
          <b-form data-vv-scope="'FormScope_2_2'" data-vv-value-path="'FormScope_2_2'">
            <ABSProcessinputText :prop="PI.TextMenu" v-model="M_SS_EventAccess.TextMenu" />
          </b-form>
        </b-col>
      </b-row>
      <div slot="modal-footer" class="w-100">
        <div style="padding-right:20px;">
          <b-btn
            size="sm"
            class="float-right btnModal__btnCancel"
            @click="$refs.modalEventAccess.hide()"
          >Cancel</b-btn>
          <b-btn size="sm" class="float-right btnModal__btnOK" variant="primary" @click="M_Save">OK</b-btn>
        </div>
      </div>
    </b-modal>

    <b-modal
      id="modalSetOption"
      title="Sort Option"
      size="lg"
      ref="modalSetOption"
      class="modalCustomABS"
    >
      <b-row style="max-height: 500px;overflow-y: scroll;">
        <!-- <draggable v-if="eventOptionTemp.length > 0" v-model="eventOptionTemp" @start="drag=true" @end="drag=false" class="drag-area">
                  <div @click="dblclick()" v-for="element in eventOptionTemp" :key="element.value" class="draggable">
                    {{element.key}}
                  </div>
        </draggable>-->
        <div v-if="AllPage.length > 0">
          <b-container class="bv-example-row">
            <div v-for="(module) in AllModules" v-bind:key="module">
              <!-- Module -->
              <b-row :no-gutters="true">
                <b-col cols="auto">
                  <span @click="expand(module)" class="module" :id="'module_'+module">+</span>
                </b-col>
                <!-- <b-col cols="auto"> <input style="vertical-align:middle !important" type="checkbox" @click="Update('M', module)" name="cb_module" :id="'M_'+module" :checked="module.set" v-model="module.set" > </b-col> -->
                <b-col cols="auto">
                  <span>{{ module }}</span>
                </b-col>
              </b-row>
              <b-row
                :no-gutters="true"
                v-show="selectedModuleForMenu == module && onFilteredMenus.length > 0"
              >
                <b-container class="bv-example-row">
                  <div v-for="(menu) in onFilteredMenus" v-bind:key="menu.page_master_seq">
                    <!-- Menu -->
                    <b-row style="margin-left: 20px" :no-gutters="true">
                      <!-- <b-col cols="auto"> <input style="vertical-align:middle !important" type="checkbox" @click="Update('P', menu.page_master_seq)" name="cb_menu" :id="'P_'+menu.page_master_seq" :checked="menu.set" v-model="menu.set" > </b-col> -->
                      <b-col cols="auto">
                        <input
                          style="vertical-align:middle !important"
                          type="checkbox"
                          name="cb_menu"
                          :id="'P_'+menu.page_master_seq"
                          :checked="menu.set"
                          v-model="menu.set"
                          :disabled="menu.disabled"
                        />
                      </b-col>
                      <b-col cols="auto">
                        <span>{{ menu.text_menu }}</span>
                      </b-col>
                    </b-row>
                    <!-- End Menu -->
                  </div>
                </b-container>
              </b-row>
              <!-- End Module -->
            </div>
          </b-container>
        </div>
        <div v-else>
          <b>No Column Selected</b>
        </div>
      </b-row>
      <div slot="modal-footer" class="w-100">
        <div style="padding-right:20px;">
          <b-btn
            size="sm"
            class="float-right btnModal__btnCancel"
            @click="$refs.modalSetOption.hide()"
          >Cancel</b-btn>
          <b-btn size="sm" class="float-right btnModal__btnOK" variant="primary" @click="M_Save">OK</b-btn>
        </div>
      </div>
    </b-modal>

    <b-row
      style="padding-top:10px; padding-right: 10px; padding-left: 20px; padding-bottom: 10px; !important;"
    >
      <b-col sm="4">
        <ABSButton
          @click="openModalModulAccessEntry"
          icon="plus"
          text="Add"
          classButton="btnList__btnPrimary"
          classIcon="icon-style-1"
        />
        <ABSButton
          @click="M_Delete('M')"
          icon="trash"
          text="Delete"
          classButton="btnList__btnPrimary"
          classIcon="icon-style-2"
        />
        <!-- <button @click="moveUpDown('U','M')">Up</button>
        <button @click="moveUpDown('D','M')">Down</button>-->
        <div>Module Access Entry</div>
        <!-- <b-form-select onDblClick="openEditModuleAccsessEntry(this.value)" class="selectCustom" v-model="moduleAccessEntrySelected" :options="moduleAccessEntry" :select-size="15">
        </b-form-select> onDblClick="alert(this.value)"-->

        <ABSMultiSelect
          id="MySelect"
          v-model="moduleAccessEntrySelected"
          :options="moduleAccessEntry"
          :multi="false"
          @change="getEventAccess"
          size="10"
          class="selectCustom"
          style="margin-top:5px !important;"
        />

        <!-- <draggable v-if="moduleAccessEntry.length > 0" v-model="moduleAccessEntry" @start="drag=true" @end="drag=false" class="drag-area">
                  <div @click="getEventAccess" v-for="element in moduleAccessEntry" :key="element.value" class="draggable">
                    {{element.key}}
                     <span>                  
                      <span class="btn-remove" style="margin-top:0px; float:right;" @click="M_moveLeft(element.value)">
                        <font-awesome-icon icon="trash" /> Delete
                      </span>
                    </span>
                  </div>
        </draggable>-->
      </b-col>
      <b-col sm="4">
        <ABSButton
          :disabled="!moduleAccessEntrySelected"
          @click="openModalEventAccess"
          icon="plus"
          text="Add"
          classButton="btnList__btnPrimary"
          classIcon="icon-style-1"
        />
        <ABSButton
          :disabled="!moduleAccessEntrySelected"
          @click="M_Delete('E')"
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
        <div>Event Access Entry</div>
        <ABSMultiSelect
          v-model="eventAccessSelected"
          :options="eventAccessEntry"
          :multi="false"
          @change="getOptionInUse"
          size="10"
          class="selectCustom"
          style="margin-top:5px !important;"
        />
      </b-col>
      <b-col sm="4">
        <ABSButton
          :disabled="!eventAccessSelected || !moduleAccessEntrySelected"
          @click="openModalSetOption"
          icon="plus"
          text="Set"
          classButton="btnList__btnPrimary"
          classIcon="icon-style-1"
        />
        <!-- <ABSButton :disabled="!eventAccessSelected || !moduleAccessEntrySelected" icon="trash" text="Delete" classButton="btnList__btnPrimary" classIcon="icon-style-2"/> -->
        <ABSButton
          :disabled="!eventAccessSelected || !moduleAccessEntrySelected"
          @click="moveUpDown('U','O')"
          icon="arrow-up"
          text="Up"
          classButton="btnList__btnPrimary"
          classIcon="icon-style-1"
        />
        <ABSButton
          :disabled="!eventAccessSelected || !moduleAccessEntrySelected"
          @click="moveUpDown('D','O')"
          icon="arrow-down"
          text="Down"
          classButton="btnList__btnPrimary"
          classIcon="icon-style-2"
        />
        <div>Option (s) already used in system</div>
        <ABSMultiSelect
          v-model="eventOptionSelected"
          :options="eventOption"
          :multi="false"
          size="10"
          class="selectCustom"
          style="margin-top:5px !important;"
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
</template>

<script>
export default {
  props: { PageLevel: "", TabIndex: "", data: "" },
  data() {
    return {
      Module: "SS",
      FormType: "Form",
      counter: 0,
      moduleAccessEntrySelected: null,
      moduleAccessEntry: [],
      eventAccessSelected: null,
      eventAccessEntry: [],
      eventOptionSelected: null,
      eventOption: [],
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
      M_SS_ModuleAccess: {
        ShortName: null,
        MenuName: null
      },
      M_SS_EventAccess: {
        TextMenu: null
      },
      IEBy: { Input: "", Edit: "" },

      PI: {
        ShortName: {
          cValidate: "required|min:2|max:60",
          cName: "ShortName",
          cLabel: "Short Name",
          cOrder: 1,
          cKey: true,
          cPageLevel: this.PageLevel,
          cTabIndex: this.TabIndex,
          cParentForm: "FormScope_1_1"
        },
        MenuName: {
          cValidate: "required|min:2|max:60",
          cName: "MenuName",
          cLabel: "Menu Name",
          cOrder: 2,
          cKey: true,
          cPageLevel: this.PageLevel,
          cTabIndex: this.TabIndex,
          cParentForm: "FormScope_1_1"
        },
        TextMenu: {
          cValidate: "required|min:2|max:60",
          cName: "TextMenu",
          cLabel: "Event Name",
          cOrder: 1,
          cKey: true,
          cPageLevel: this.PageLevel,
          cTabIndex: this.TabIndex,
          cParentForm: "FormScope_1_1"
        }
      },
      // PTanalysis: {
      //     cPageLevel: this.PageLevel,
      //     cTabIndex: this.TabIndex,
      //     cPageMasterSeq: this.data.PageMasterSeq,
      //     cFormPageNo: this.data.PageOrder
      // },
      AllModules: [],
      OptionSelected: [],
      OptionInUse: [],
      AllPage: [],
      AllPage_Temp: [],
      onFilteredMenus: [],
      selectedModuleForMenu: null
    };
  },
  methods: {
    M_PageSize() {},
    M_TabClick() {},
    M_Pagination() {},
    M_Advance_Filter() {},
    M_Search(data) {
      this.$store.commit("setEventStatus", "ONSEARCHENTER");
      this.$store.commit("setLevel", this.PageLevel);
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
      //       this.alertError("No Module Selected !");
      //       return;
      //     }
      //     if (this.eventAccessEntry.length > 0) {
      //       this.alertError("This Module Could Not Be Delete !");
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
      //           };
      //           this.postJSON(this.getUrlDelete(), param).then(response => {
      //             if (response == null) return;
      //             this.alertSuccess("Deleting Data Successfully").then(() => {
      //               this.eventAccessEntry = [];
      //               this.eventOption = [];
      //               this.moduleAccessEntrySelected = null;
      //               this.eventAccessSelected = null;
      //               this.eventOptionSelected = null;
      //               this.getDataLevel1();
      //             });
      //           });
      //         }
      //       });
      //     }
      //   } else if (from == "E") {
      //     if (this.eventAccessSelected == null) {
      //       this.alertError("No Event Selected !");
      //       return;
      //     }
      //     if (this.eventOption.length > 0) {
      //       this.alertError("This Event Could Not Be Delete !");
      //     } else {
      //       this.alertConfirmation(
      //         "Are You Sure Want To Delete This Event ?"
      //       ).then(ress => {
      //         // console.log(ress)
      //         if (ress.value) {
      //           var param = {
      //             OptionSeq: this.getOptionSeq().OptionSeq,
      //             LineNo: 1,
      //             module_seq: this.eventAccessSelected.module_seq,
      //             event_seq: this.eventAccessSelected.value,
      //             lastupdatestamp: this.eventAccessSelected.lastupdatestamp
      //           };
      //           this.postJSON(this.getUrlDelete(), param).then(response => {
      //             if (response == null) return;
      //             this.alertSuccess("Deleting Data Successfully").then(() => {
      //               this.eventOption = [];
      //               this.eventOptionSelected = null;
      //               this.getEventAccess(this.moduleAccessEntrySelected);
      //             });
      //           });
      //         }
      //       });
      //     }
      //   }
    },
    M_Save() {
      // alert(this.$store.getters.getStatus.toUpperCase())
    },
    // M_SaveSort(){
    M_Insert() {},
    paramFromParent() {},
    rowClicked(record, index) {
      this.$parent.state = "UPDATE";
      this.$store.commit("SetPage1Data", record);
      this.$store.commit("setEventStatus", "rowClick");
      this.$store.commit("setLevel", this.PageLevel);
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
      // if (from == 'M') {
      //     var moduleData = this.moduleAccessEntry
      //     if (direction == 'U') {
      //         // kalo pencet up berarti data yang dibawah adalah data yang dipilih
      //         var idxDown = moduleData.map(x => x.value).indexOf(this.moduleAccessEntrySelected.value)
      //         var idxUp = idxDown - 1

      //         if (idxUp >= 0) {
      //             var dataTempDown = moduleData[idxDown]
      //             var dataTempUp = moduleData[idxUp]

      //             this.$nextTick(() => {
      //                 this.moduleAccessEntry = []
      //                 moduleData[idxDown] = dataTempUp
      //                 moduleData[idxUp] = dataTempDown
      //                 setTimeout(() => {
      //                     this.moduleAccessEntry = moduleData
      //                 }, 0)
      //             })
      //         }
      //     }
      //     else if (direction == 'D') {
      //         var idxUp = moduleData.map(x => x.value).indexOf(this.moduleAccessEntrySelected.value)
      //         var idxDown = idxUp + 1

      //         if (idxUp < this.moduleAccessEntry.length - 1) {
      //             var dataTempUp = moduleData[idxUp]
      //             var dataTempDown = moduleData[idxDown]

      //             this.$nextTick(() => {
      //                 this.moduleAccessEntry = []
      //                 moduleData[idxUp] = dataTempDown
      //                 moduleData[idxDown] = dataTempUp
      //                 setTimeout(() => {
      //                     this.moduleAccessEntry = moduleData
      //                 }, 0)
      //             })
      //         }
      //     }
      // } else
      if (from == "E") {
        var eventData = this.eventAccessEntry;
        if (direction == "U") {
          // kalo pencet up berarti data yang dibawah adalah data yang dipilih
          var idxDown = eventData
            .map(x => x.value)
            .indexOf(this.eventAccessSelected.value);
          var idxUp = idxDown - 1;

          if (idxUp >= 0) {
            var dataTempDown = eventData[idxDown];
            var dataTempUp = eventData[idxUp];

            this.$nextTick(() => {
              this.eventAccessEntry = [];
              eventData[idxDown] = dataTempUp;
              eventData[idxUp] = dataTempDown;
              setTimeout(() => {
                this.eventAccessEntry = eventData;
              }, 0);
            });
          }
        } else if (direction == "D") {
          var idxUp = eventData
            .map(x => x.value)
            .indexOf(this.eventAccessSelected.value);
          var idxDown = idxUp + 1;

          if (idxUp < this.eventAccessEntry.length - 1) {
            var dataTempUp = eventData[idxUp];
            var dataTempDown = eventData[idxDown];

            this.$nextTick(() => {
              this.eventAccessEntry = [];
              eventData[idxUp] = dataTempDown;
              eventData[idxDown] = dataTempUp;
              setTimeout(() => {
                this.eventAccessEntry = eventData;
              }, 0);
            });
          }
        }
      } else if (from == "O") {
        var optionData = this.eventOption;
        if (direction == "U") {
          // kalo pencet up berarti data yang dibawah adalah data yang dipilih
          var idxDown = optionData
            .map(x => x.value)
            .indexOf(this.eventOptionSelected.value);
          var idxUp = idxDown - 1;

          if (idxUp >= 0) {
            var dataTempDown = optionData[idxDown];
            var dataTempUp = optionData[idxUp];

            this.$nextTick(() => {
              this.eventOption = [];
              optionData[idxDown] = dataTempUp;
              optionData[idxUp] = dataTempDown;
              setTimeout(() => {
                this.eventOption = optionData;
              }, 0);
            });
          }
        } else if (direction == "D") {
          var idxUp = optionData
            .map(x => x.value)
            .indexOf(this.eventOptionSelected.value);
          var idxDown = idxUp + 1;

          if (idxUp < this.eventOption.length - 1) {
            var dataTempUp = optionData[idxUp];
            var dataTempDown = optionData[idxDown];

            this.$nextTick(() => {
              this.eventOption = [];
              optionData[idxUp] = dataTempDown;
              optionData[idxDown] = dataTempUp;
              setTimeout(() => {
                this.eventOption = optionData;
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
      //   };
      //   this.postJSON(this.getUrlById(), param).then(response => {
      //     if (response == null) return;
      //     var data = response.Data;
      //     this.AllPage = [];
      //     this.AllModules = [];
      //     if (data.length > 0) {
      //       this.$nextTick(() => {
      //         this.AllPage = data;
      //         this.AllPage_Temp = data;
      //         this.AllModules = [
      //           ...new Set(data.map(x => x.module_cd.toUpperCase()))
      //         ];
      //       });
      //       this.$forceUpdate();
      //     }
      //   });
    },
    getFileInUse() {
      if (this.eventOption.length > 0) {
        this.$nextTick(() => {
          var allDatas = this.AllPage;
          this.eventOption.forEach(element => {
            var idx = allDatas
              .map(el => el.page_master_seq)
              .indexOf(element.value);
            var isInUse = this.OptionInUse.map(e => e.value).includes(
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
    getOptionInUse(datas) {
      //   this.eventOptionSelected = null;
      //   this.eventOption = [];
      //   var param = {
      //     OptionSeq: this.getOptionSeq().OptionSeq,
      //     LineNo: 2,
      //     module_seq: datas.module_seq,
      //     event_seq: datas.value
      //   };
      //   this.postJSON(this.getUrlById(), param).then(response => {
      //     if (response == null) return;
      //     var data = response.Data;
      //     this.$nextTick(() => {
      //       if (data.length > 0) {
      //         this.OptionInUse = [];
      //         data.forEach((dt, idx) => {
      //           this.OptionInUse.push({
      //             value: dt.page_master_seq,
      //             key: dt.text_menu
      //           });
      //         });
      //         this.getOptionSelected(datas);
      //       }
      //       this.$forceUpdate();
      //     });
      //     // this.eventOptionTemp = this.eventOption
      //   });
    },
    getOptionSelected(data) {
      // alert('tayo')
      //   var param = {
      //     OptionSeq: this.getOptionSeq().OptionSeq,
      //     LineNo: 6,
      //     module_seq: data.module_seq,
      //     event_seq: data.value
      //   };
      //   this.postJSON(this.getUrlById(), param).then(response => {
      //     if (response == null) return;
      //     var data = response.Data;
      //     this.OptionSelected = [];
      //     if (data.length > 0) {
      //       data.forEach((dt, idx) => {
      //         this.OptionSelected.push({
      //           value: dt.page_master_seq,
      //           key: dt.text_menu
      //         });
      //       });
      //     }
      //     this.eventOption = this.OptionInUse.concat(this.OptionSelected);
      //     this.eventOptionTemp = this.eventOption;
      //   });
    },
    getEventAccess(data) {
      //   var param = {
      //     OptionSeq: this.getOptionSeq().OptionSeq,
      //     LineNo: 1,
      //     module_seq: data.value
      //   };
      //   this.M_SS_EventAccess.ModuleSeq = data.value;
      //   this.postJSON(this.getUrlById(), param).then(response => {
      //     if (response == null) return;
      //     var data = response.Data;
      //     this.$nextTick(() => {
      //       this.eventAccessEntry = [];
      //       if (data.length > 0) {
      //         data.forEach((dt, idx) => {
      //           this.eventAccessEntry.push({
      //             value: dt.event_seq,
      //             key: dt.text_menu,
      //             module_seq: dt.module_seq,
      //             lastupdatestamp: dt.lastupdatestamp
      //           });
      //         });
      //       }
      //       this.eventOption = [];
      //       this.eventAccessSelected = null;
      //       this.eventOptionSelected = null;
      //       this.$forceUpdate();
      //     });
      //   });
    },
    getDataLevel1() {
      var param = "/datalist?parent_menu_id=0&level_no=0";
      this.getJSON(this.getUrlSsMenu() + param).then(response => {
        if (response == null) return;
        var data = response.Data;
        this.moduleAccessEntry = [];
        if (data.length > 0) {
          // data = data[0]
          this.$nextTick(() => {
            data.forEach((dt, idx) => {
              this.moduleAccessEntry.push({
                value: dt.module_seq,
                key: dt.menu_name,
                lastupdatestamp: dt.lastupdatestamp
              });
            });
          });
        }
      });
    },
    openModalModulAccessEntry() {
      this.M_SS_ModuleAccess.ShortName = "";
      this.M_SS_ModuleAccess.MenuName = "";

      this.$store.commit("setStatus", "MODULEENTRY");
      this.$refs.modalModulAccessEntry.show();
    },
    openEditModuleAccsessEntry(data) {
      alert(data);
    },
    openModalEventAccess(data) {
      // console.log(this.M_SS_EventAccess)
      this.M_SS_EventAccess.TextMenu = "";
      this.$store.commit("setStatus", "EVENTENTRY");
      this.$refs.modalEventAccess.show();
    },
    openModalSetOption() {
      // if( this.eventOption.length > 0 ){
      this.$store.commit("setStatus", "SETOPTION");
      this.$refs.modalSetOption.show();
      this.getFileInUse();
      // }
      // else {
      //     this.alertWarning('The event is empty')
      // }
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
    moduleAccessEntry() {},
    setToolbarButton() {
      this.getToolbar().isNew = true;
      this.getToolbar().statusFunction[6].disabled = true;
      this.getToolbar().statusFunction[7].disabled = false;
    }
  },
  beforeCreate: function() {},
  created: function() {
    this.$store.commit("setFormType", "List");
    this.getToolbar().ProcessPS();
  },
  beforeMount: function() {},
  mounted: function() {
    this.getDataLevel1();
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
  /* margin-bottom: -1px; */
  background-color: #fff;
  border-bottom: 1px solid #ddd;
}
</style>

