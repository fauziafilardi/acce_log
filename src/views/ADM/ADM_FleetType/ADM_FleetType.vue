<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card">
            <div class="card__title" style="padding-bottom: 5px !important;">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Fleet Type</span>
                </b-col>
                <b-col style="text-align: right;">
                  <b-row>
                    <b-col>
                      <span>
                        <b-form-input
                          id="txtSearch"
                          v-model="search"
                          type="text"
                          placeholder="Search...."
                          v-shortkey.focus="['f1']"
                          class="text-field-search"
                          @keyup.enter.native="onSearchEnter"
                          autocomplete="off"
                          :disabled="isSearchDisable"
                        ></b-form-input>
                      </span>
                    </b-col>
                  </b-row>
                </b-col>
                <b-col md="4" class="col-right">
                  <span>
                    <ABSButton
                      :text="'Search'"
                      classButton="button button--back2"
                      classIcon="icon-style-1"
                      @click="onSearchEnter"
                    />
                  </span>

                  <span>
                    <ABSButton
                      :text="'Add New'"
                      classButton="button button--back2"
                      classIcon="icon-style-1"
                      :disabled="false"
                      @click="onAddNewClick"
                    />
                  </span>

                  <span>
                    <ABSButton
                      :text="'Back'"
                      classButton="button button--back2"
                      classIcon="icon-style-1"
                      @click="$router.go(-1)"
                    />
                  </span>
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <div class="table--list" :id="'appointmentList'">
                <b-table
                  :responsive="true"
                  :striped="false"
                  :bordered="false"
                  :outlined="false"
                  :small="false"
                  :hover="true"
                  :dark="false"
                  :fixed="false"
                  :foot-clone="false"
                  :fields="fieldHeader"
                  :items="items"
                  @row-dblclicked="doDoubleClick"
                  class="table-sm table-style-2"
                >
                  <template v-slot:cell(path_file)="data">
                    <img
                      id="logo"
                      :src="data.item.path_file == '' || data.item.path_file == null ? this.defaultPic : 'http://acc.api.absoluteconnection.co.id/' + data.item.path_file"
                      alt
                      style="width: 50px;"
                    />
                  </template>
                </b-table>
              </div>
            </div>
            <div class="card__footer">
              <b-form inline style="float: left; color: #333;">
                <label
                  class="font-lbl"
                  style="margin-bottom:0px !important; margin-right:0px !important;"
                >Page Size</label>
                <b-form-select
                  id="cmbPerPage"
                  v-model="perPage"
                  v-on:input="doGetList(search, 'pageSize')"
                  :options="pagingData"
                  class="sm-3 mgn-left-10 font-lbl page-size-left"
                  :disabled="isDisableTable"
                ></b-form-select>
                of {{ this.totalRows }} Records
              </b-form>

              <b-pagination
                align="right"
                v-model="currentPage"
                @input="doGetList(search, 'pagination')"
                :total-rows="totalRows"
                :per-page="perPage"
                :limit="limit"
                style="margin-bottom: 0px;"
                :disabled="isDisableTable"
              ></b-pagination>
            </div>
            <iframe name="print_frame" width="0" height="0" frameborder="0" src="about:blank"></iframe>
          </div>
        </b-col>
      </b-row>
    </div>
    <ABSModal id="Modal_FleetType" ref="Modal_FleetType" size="sm">
      <template slot="headerTitle">Fleet Type</template>
      <template slot="content">
        <b-row>
          <b-col md="12">
            <b-form
              :data-vv-scope="'FormScope_' + 1 + '_' + 1"
              :data-vv-value-path="'FormScope_' + 1 + '_' + 1"
            >
              <b-row>
                <b-col md="12">
                  <b-row>
                    <b-col md="12">
                      <span>
                        <label>Fleet Type Code</label>
                      </span>
                      <ACCTextBox
                        :prop="PI_fleet_cd"
                        v-model="M_FleetType.fleet_cd"
                        ref="ref_reason_descs"
                      />
                    </b-col>
                  </b-row>
                  <b-row>
                    <b-col md="12">
                      <span>
                        <label>Description</label>
                      </span>
                      <ACCTextArea
                        :prop="PI_fleet_descs"
                        v-model="M_FleetType.fleet_descs"
                        ref="ref_reason_descs"
                      />
                    </b-col>
                  </b-row>
                  <b-row>
                    <b-col md="6">
                      <!-- <div> -->
                      <img id="logo" :src="M_FleetType.file_show" alt style="width: 50px;" />
                      <!-- </div>                       -->
                    </b-col>
                    <b-col md="6">
                      <ACCImageUpload
                        :prop="PI_logo"
                        @change="onlogoChange"
                        v-model="M_FleetType.file_logo"
                      />
                    </b-col>
                  </b-row>
                  <b-row style="margin-top: 10px;">
                    <b-col md="6">
                      <ABSButton
                        :text="'Save'"
                        classButton="btn btn--default"
                        classIcon="icon-style-1"
                        @click="M_Save"
                        styleButton="height: 40px;width: 100%;"
                      />
                    </b-col>
                    <b-col md="6">
                      <ABSButton
                        :text="'Cancel'"
                        classButton="btn btn--back"
                        classIcon="icon-style-1"
                        @click="doCancel"
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
      inputStatus: "",
      defaultPic: require("@/assets/default_photo_.png"),
      M_FleetType: {
        fleet_cd: "",
        fleet_descs: "",
        file_show: require("@/assets/default_photo_.png"),
        file_logo: "",
        file_logo_name: "",
        file_logo_path: "",
        fm_fleet_type_id: "",
        lastupdatestamp: ""
      },

      PI_fleet_cd: {
        cValidate: "",
        cName: "fleet_cd",
        cOrder: 1,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_fleet_descs: {
        cValidate: "",
        cName: "descs",
        cOrder: 2,
        cKey: false,
        cProtect: false,
        cResize: false,
        cReadonly: false,
        cRows: 1,
        cMaxRows: 2,
        cSize: "md",
        cParentForm: "",
        cInputStatus: this.inputStatus
      },
      PI_logo: {
        cName: "Logo",
        cAccept: ".jpg, .png, .gif",
        cTitle: "Add Icon",
        cModule: "MK"
      },

      propList: {
        initialWhere: "",
        LineNo: 0,
        PageLevel: 1,
        TabIndex: 1,
        OrderBy: "",
        SourceField: "",
        ParamView: ""
      },

      //For List
      WithViewButton: false,
      isFirst: false,
      selected: false,
      rowSelected: [],
      dataSelected: [],
      rowSel: -1,
      filterAction: "",

      search: "",
      isSearchDisable: false,
      fieldHeader: [],
      items: [],
      firstSort: true,
      sort: "time_edit DESC",

      totalRows: 0,
      currentPage: 1,
      lastPage: 1,
      perPage: 5,
      limit: 2,
      pagingData: [
        { value: 5, text: "5" },
        { value: 10, text: "10" },
        { value: 15, text: "15" },
        { value: 20, text: "20" },
        { value: 40, text: "40" },
        { value: 60, text: "60" },
        { value: 80, text: "80" },
        { value: 100, text: "100" },
        { value: 1000, text: "1000" }
      ],

      fileName: "TestExport",
      ExportToken: "",

      availableColumn: [],
      availableColumnTemp: [],
      availableColumnSelected: null,
      selectedColumn: [],
      selectedColumnTemp: [],
      selectedColumnSelected: [],

      sortedField: [{ field: "time_edit", sort: "DESC" }],
      isDisableTable: false,
      responses: []
    };
  },
  methods: {
    M_ClearForm() {
      this.M_FleetType = {
        fleet_cd: "",
        fleet_descs: "",
        file_logo: "",
        file_show: require("@/assets/default_photo_.png"),
        file_logo_name: "",
        file_logo_path: ""
      };
    },
    M_Save() {
      this.$validator._base.validateAll("MK_ContactPerson").then(result => {
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
          ress => {
            if (ress.value) {
              this.$validator.errors.clear("MK_ContactPerson");
              if (this.inputStatus == "edit") {
                this.doUpdate();
              } else {
                this.doSave();
              }
            }
          }
        );
      });
    },
    doCancel() {
      this.M_ClearForm();
      this.$refs.Modal_FleetType._hide();
    },
    doSave() {
      var param = {
        option_url: "/ADM/ADM_FleetType",
        line_no: 0,
        user_input: this.getDataUser().user_id,
        fleet_cd: this.M_FleetType.fleet_cd,
        descs: this.M_FleetType.fleet_descs,
        file_name: this.M_FleetType.file_logo_name,
        path_file: this.M_FleetType.file_logo_path
      };

      this.postJSON(this.getUrlCRUD(), param).then(response => {
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          this.$refs.Modal_FleetType._hide();
          this.doGetList("");
        });
      });
    },
    doUpdate() {
      var param = {
        option_url: "/ADM/ADM_FleetType",
        line_no: 0,
        fm_fleet_type_id: this.M_FleetType.fm_fleet_type_id,
        fleet_cd: this.M_FleetType.fleet_cd,
        descs: this.M_FleetType.fleet_descs,
        file_name: this.M_FleetType.file_logo_name,
        path_file: this.M_FleetType.file_logo_path,
        lastupdatestamp: this.M_FleetType.lastupdatestamp,
        user_edit: this.getDataUser().user_id
      };

      this.putJSON(this.getUrlCRUD(), param).then(response => {
        // console.log(response)
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          this.$refs.Modal_FleetType._hide();
          this.doGetList("");
        });
      });
    },
    onAddNewClick() {
      this.inputStatus = "new";
      this.PI_fleet_cd.cProtect = false;
      this.$refs.Modal_FleetType._show();
      this.M_ClearForm();
    },
    onlogoChange(data) {
      this.M_FleetType.file_logo_name = data.name;
      this.M_FleetType.file_logo_path = data.path;
      this.M_FleetType.file_show = this.url + data.path;
    },
    rowClicked(record, index) {},
    doDoubleClick(record, index) {
      this.inputStatus = "edit";
      var param = {
        option_url: "/ADM/ADM_FleetType",
        line_no: 0,
        id: record.row_id,
        lastupdatestamp: record.lastupdatestamp
      };

      this.getJSON(this.getUrlCRUD(), param).then(response => {
        if (response == null) return;
        var data = response.Data[0];
        this.$refs.Modal_FleetType._show();

        this.M_FleetType = {
          fm_fleet_type_id: data.fm_fleet_type_id,
          fleet_cd: data.fleet_cd,
          fleet_descs: data.descs,
          file_logo: data.file_name,
          file_show:
            data.path_file && data.path_file !== ""
              ? this.url + data.path_file
              : require("@/assets/default_photo_.png"),
          file_logo_name: data.file_name,
          file_logo_path: data.path_file,
          lastupdatestamp: data.lastupdatestamp
        };

        this.PI_fleet_cd.cProtect = true;
      });
    },
    doViewClick(record, index) {
      //   var param = record;
      // param.option_url = this.getOptionUrl()
      // param.urlAdd="MK_AddNewProspect"
      // param.title = "New Prospect"
      //   this.$router.push({ name: "MK_ViewNewProspect", params: param });
    },
    rowLink(url) {},
    M_PageSize() {},
    M_Pagination() {},
    M_Advance_Filter() {},
    M_Head_Table() {},
    refreshColumn() {},
    onSearchEnter(data) {
      this.doGetList(this.search, "onSearchEnter");
    },

    doGetList(search) {
      var param = {
        option_url: this.getOptionUrl(),
        line_no: 0,
        user_id: this.getDataUser().user_id,
        portfolio_id: this.getDataUser().portfolio_id,
        subportfolio_id: this.getDataUser().subportfolio_id,
        current_page: this.currentPage,
        per_page: this.perPage,
        param_where: search,
        initial_where: this.propList.initialWhere,
        sort_field: this.sort,
        source_field: this.propList.SourceField,
        param_view: this.propList.ParamView
      };

      this.postJSON(this.getUrlList(), param).then(response => {
        if (response == null) return;
        this.selected = false;

        this.rowSelected = [];

        this.rowSel = 0;

        this.responses = response;

        this.ExportToken = this.responses.ExportToken;

        if (this.responses.Data.length > 0) {
        }
        this.items = [];
        this.fieldHeader = [];

        this.items = this.responses.Data;

        var str_array =
          this.responses.DefineColumn && this.responses.DefineColumn !== ""
            ? this.responses.DefineColumn.split(",")
            : this.responses.AllColumn.split(",");
        var x = ",S,L,L";
        // var defineSize = this.responses.DefineSize.split(",");
        var defineSize = x.split(",");

        this.allColumn_bf = this.responses.AllColumn.split(",");
        var index = this.allColumn_bf.indexOf("lastupdatestamp");
        if (index > -1) {
          this.allColumn_bf.splice(index, 1);
        }
        var allColumn = [];
        var filteredColumn = [];
        var definedColumn = [];

        this.allColumn_bf.forEach((val, idx) => {
          var thClass = "HeaderACCList";
          var isSorted = this.sortedField.map(x => x.field).indexOf(val);
          if (isSorted > -1) {
            if (this.sortedField[isSorted].sort == "ASC") {
              thClass = thClass + " AscSorted";
            } else {
              thClass = thClass + " DescSorted";
            }
          }

          allColumn.push({
            value: idx + 1,
            key: val,
            thClass: thClass,
            tdClass: "ContentACCList notranslate",
            text: val
          });

          filteredColumn.push({
            value: idx + 1,
            key: val,
            thClass: thClass,
            tdClass: "ContentACCList notranslate"
          });
        });

        for (var i = 0; i < str_array.length; i++) {
          filteredColumn = filteredColumn.filter(val => {
            if (val.key == str_array[i]) {
              definedColumn.push({
                value: val.value,
                key: val.key,
                thClass: val.thClass,
                tdClass: val.tdClass,
                text: val.key
              });
            }

            return val.key != str_array[i];
          });

          var thClass = "HeaderACCList " + defineSize[i];
          //   var thClass = "HeaderACCList L";

          var tdClass = "ContentACCList notranslate";
          if (
            str_array[i].toLowerCase().includes("amount") ||
            str_array[i].toLowerCase().includes("amt") ||
            str_array[i].toLowerCase().includes("rate") ||
            str_array[i].toLowerCase().includes("price")
          ) {
            tdClass = "ABStdClassList2 notranslate";
            thClass = "ABSthClassList2";
          } else if (str_array[i].toLowerCase() == "action") {
            thClass += " th-cus-center";
            tdClass += " th-cus-center";
          }

          var isSorted = this.sortedField
            .map(x => x.field)
            .indexOf(str_array[i]);
          if (isSorted > -1) {
            if (this.sortedField[isSorted].sort == "ASC") {
              thClass = thClass + " AscSorted";
            } else {
              thClass = thClass + " DescSorted";
            }
          }

          if (this.languageStatus) {
            this.fieldHeader.push({
              value: i + 1,
              key: str_array[i],
              thClass: thClass,
              tdClass: tdClass,
              label: this.$t(str_array[i])
            });
          } else {
            if (str_array[i] == "lastupdatestamp") continue;

            var listReplace = [
              {
                key: "_",
                value: " "
              },
              {
                key: "Amt",
                value: " Amount"
              },
              {
                key: "Cd",
                value: " Code"
              },
              {
                key: "Descs",
                value: " Description"
              },
              {
                key: "Time Edit",
                value: "Last Update"
              },
              {
                key: "Batch Status",
                value: "Status"
              },
              {
                key: "garing",
                value: "/"
              },
              {
                key: "titik",
                value: "."
              },
              {
                key: "SnP",
                value: "SnP "
              },
              {
                key: "VO",
                value: "VO "
              },
              {
                key: "Row Id",
                value: "View"
              }
            ];
            var isGotIt = false;
            var labelHeader = undefined;

            // console.log(str_array[i])

            if (str_array[i].includes("_")) {
              labelHeader = str_array[i]
                .toLowerCase()
                .split("_")
                .map(s => {
                  return s.charAt(0).toUpperCase() + s.substring(1);
                })
                .join(" ");
            } else {
              // if (str_array[i] !== 'lastupdatestamp') {
              labelHeader =
                str_array[i].charAt(0).toUpperCase() +
                str_array[i].substring(1);
              // }
            }

            for (var data of listReplace) {
              if (labelHeader == undefined) {
                labelHeader = this.replaceAllString(
                  str_array[i],
                  data.key,
                  data.value
                );
              } else {
                if (labelHeader.includes(data.key)) {
                  if (labelHeader == "Row Id" && !this.WithViewButton) continue;
                  // if (labelHeader == 'Row Id' && !this.WithViewButton) {

                  // }
                  // else {
                  labelHeader = this.replaceAllString(
                    labelHeader,
                    data.key,
                    data.value
                  );
                  // }
                }
              }
            }

            if (labelHeader == "Row Id") continue;

            this.fieldHeader.push({
              value: i + 1,
              key: str_array[i],
              thClass: thClass,
              tdClass: tdClass,
              label: labelHeader
            });
          }
        }

        this.availableColumn = filteredColumn;
        this.selectedColumn = definedColumn;

        this.availableColumnTemp = filteredColumn;
        this.selectedColumnTemp = definedColumn;
        this.totalRows = this.responses.Total;
        this.lastPage = this.responses.Last_Page;
      });
    },
    doEdit(record) {
      var param = record;
      param.isEdit = true;
      this.$router.push({ name: "MK_EditAppointment", params: param });
    }
  },
  mounted() {
    this.doGetList("");
  }
};
</script>

<style>
</style>