<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card">
            <div class="card__title" style="padding-bottom: 5px !important;">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>To Do List</span>
                </b-col>
                <b-col style="text-align: right;">
                  <b-badge variant="primary" @click="doProspect" style="cursor: pointer;">&nbsp;</b-badge>
                  <span
                    style="color: #7f8084; font-weight: normal; margin-left: 5px; cursor: pointer;"
                    @click="doProspect"
                  >Prospect</span> &nbsp;
                  <b-badge variant="success" @click="doCustomer" style="cursor: pointer;">&nbsp;</b-badge>
                  <span
                    style="color: #7f8084; font-weight: normal; margin-left: 5px; cursor: pointer;"
                    @click="doCustomer"
                  >Customer</span> &nbsp;
                </b-col>
                <b-col md="2">
                  <b-form-select
                    id="cmbFilter"
                    v-model="filterAction"
                    @input="dofilterAction"
                    :options="[
                                            {value: 'C', text: 'Call'},
                                            {value: 'V', text: 'Visit'},
                                            {value: 'E', text: 'Entertainment'}
                                        ]"
                    :disabled="isDisableTable"
                    style="height: 22px !important; width: 100% !important; margin-bottom: 5px;"
                  ></b-form-select>
                </b-col>
                <b-col md="3">
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
                    style="width: 100% !important;"
                  ></b-form-input>
                </b-col>
                <b-col style="max-width: fit-content !important;" class="col-right">
                  <span>
                    <ABSButton
                      :text="'Search'"
                      classButton="button button--back2"
                      classIcon="icon-style-1"
                      @click="onSearchEnter"
                    />
                  </span>

                  <!-- <span>
                                        <ABSButton
                                            :text="'Add New'"
                                            classButton="button button--back2"
                                            classIcon="icon-style-1"
                                            :disabled="!isCanAdd"
                                            @click="onAddNewClick"
                                        />
                  </span>-->

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
                  :bordered="true"
                  :outlined="true"
                  :small="false"
                  :hover="true"
                  :dark="false"
                  :fixed="false"
                  :foot-clone="false"
                  :fields="fieldHeader"
                  :items="items"
                  class="table-sm table-style-3"
                >
                  <template v-slot:cell(row_id)="data">
                    <b-button
                      v-if="WithViewButton == true"
                      size="sm"
                      @click.stop="viewClicked(data.item, data.index)"
                      :disabled="false"
                      class="btn btn--default"
                    >View</b-button>
                    <span v-else>{{data.item.row_id}}</span>
                  </template>

                  <template v-slot:cell(status)="data">
                    <span>
                      <b-badge
                        :style="`background-color:`+data.item.customer_status_colour+`; width: 75px; padding: 6px !important; border-radius: 4px !important; font-weight: normal !important;`"
                      >{{data.item.status}}</b-badge>
                    </span>
                    <!-- <div
                      class="badge-primary badgeStatus"
                      :style="`background-color:`+data.item.customer_status_colour+` !important;`"
                    >{{data.item.status}}</div>-->
                    <!-- <span class="badge-danger badgeStatus">Maintain</span> -->
                    <!-- {{data.item.customer_name}} -->
                  </template>

                  <template
                    v-slot:cell(last_action)="data"
                  >{{data.item.last_action && data.item.last_action !== '' ? data.item.last_action : '-'}}</template>

                  <template v-slot:cell(next_action)="data">
                    <span>
                      <font-awesome-icon
                        v-if="IsWarning(data.item.next_action)"
                        style="color: red;"
                        icon="exclamation-triangle"
                        size="sm"
                      />
                      {{momentDateFormat2(data.item.next_action,'DD/MM/YYYY HH:mm', 'DD/MM/YYYY')}}
                    </span>
                  </template>

                  <template v-slot:cell(action)="data">
                    <div v-if="data.item.row_id && data.item.lastupdatestamp">
                      <span>
                        <b-badge
                          style="width: 15px; height: 15px; padding: 6px !important; border-radius: 15px !important;"
                          :variant="data.item.status == 'New' ? 'primary' : 'success'"
                        >&nbsp;</b-badge>
                      </span>
                      <span>
                        <b-badge
                          style="padding-top: 8px;
                                height: 35px;
                                margin-left: 10px;
                                border-radius: 4px;
                                width: 120px;
                                font-weight: normal;
                                background-color: white !important;
                                color: black;
                                border: solid 1px #ced4da;
                                text-align: left;"
                          @click="doEdit(data.item)"
                        >
                          <font-awesome-icon
                            class="icon-style-default"
                            :icon="data.item.action=='C' ? 'phone-square-alt' : (data.item.action=='V' ? 'hand-paper' : 'utensils')"
                            size="lg"
                          />
                          {{ data.item.action=='C' ? 'Call' : (data.item.action=='V' ? 'Visit' : 'Entertainment') }}
                        </b-badge>
                      </span>
                      <!-- <span
                        style="border-radius: 4px; border: solid 1px #d4d7d8; padding: 5px; width: 100px !important;"
                      >
                        <font-awesome-icon
                          style="color: blue;"
                          :icon="data.item.action=='C' ? 'phone-square-alt' : (data.item.action=='V' ? 'hand-paper' : 'utensils')"
                          size="lg"
                        />
                        {{ data.item.action=='C' ? 'Entertainment' : (data.item.action=='V' ? 'Visit' : 'Entertainment') }}
                      </span>-->
                    </div>

                    <!-- <span>
                      <span
                        class="ChartLegend__Content"
                        :style="'background-color: '+(data.item.action == '1' ? 'blue' : 'green')+'; width: 10px; height: 10px; padding: 10px; border-radius: 10px;'"
                      ></span>
                    </span>
                    <span>
                      <div style="border-radius: 4px; border: solid 1px #d4d7d8; padding: 5px;">
                        <font-awesome-icon
                          style="color: blue;"
                          :icon="data.item.action=='C' ? 'phone-square-alt' : (data.item.action=='V' ? 'hand-paper' : 'utensils')"
                          size="lg"
                        />
                        {{ data.item.action=='C' ? 'Call' : (data.item.action=='V' ? 'Visit' : 'Entertainment') }}
                      </div>
                    </span>-->
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
  </div>
</template>

<script>
export default {
  data() {
    return {
      propList: {
        initialWhere:
          "ss_portfolio_id='" +
          this.getDataUser().portfolio_id +
          "' AND appointment_type = 'T' AND status_logbook = 'N' ",
        LineNo: 0,
        PageLevel: 1,
        TabIndex: 1,
        OrderBy: "",
        SourceField: "",
        ParamView: "",
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
      perPage: 10,
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
        { value: 1000, text: "1000" },
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
      responses: [],
    };
  },
  methods: {
    rowClicked(record, index) {},
    doDoubleClick(record, index) {},
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
    doProspect() {
      var filter = " contact_type = 'P'";
      this.propList.initialWhere = filter;
      this.doGetList(this.search);
    },
    doCustomer() {
      var filter = " contact_type = 'C'";
      this.propList.initialWhere = filter;
      this.doGetList(this.search);
    },

    dofilterAction() {
      var filter = " action = '" + this.filterAction + "'";
      this.propList.initialWhere = filter;
      this.doGetList(this.search);
    },
    dogetget() {
      this.doGetList(this.search);
    },
    GenDoList() {
      var param = {
        option_function_cd: "GenToDoList",
        module_cd: "MK",
        ss_portfolio_id: this.getDataUser().portfolio_id,
        user_id: this.getDataUser().user_id,
      };

      this.CallFunction(param).then((response) => {
        // response from API
        if (response == null) return;
        this.dogetget();
      });
    },
    doGetList(search, a = null) {
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
        param_view: this.propList.ParamView,
      };

      this.postJSON(this.getUrlList(), param).then((response) => {
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
        var x = "S,S,L,S,S,S";
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
          var thClass = "HeaderACCList2";
          var isSorted = this.sortedField.map((x) => x.field).indexOf(val);
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
            tdClass: "ContentACCList2 notranslate",
            text: val,
          });

          filteredColumn.push({
            value: idx + 1,
            key: val,
            thClass: thClass,
            tdClass: "ContentACCList2 notranslate",
          });
        });

        for (var i = 0; i < str_array.length; i++) {
          filteredColumn = filteredColumn.filter((val) => {
            if (val.key == str_array[i]) {
              definedColumn.push({
                value: val.value,
                key: val.key,
                thClass: val.thClass,
                tdClass: val.tdClass,
                text: val.key,
              });
            }

            return val.key != str_array[i];
          });

          var thClass = "HeaderACCList2 ";
          //   var thClass = "HeaderACCList2 L";
          if (str_array[i] !== "no") {
            thClass += defineSize[i];
          }

          var tdClass = "ContentACCList2 notranslate";
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
            .map((x) => x.field)
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
              label: this.$t(str_array[i]),
            });
          } else {
            if (str_array[i] == "lastupdatestamp") continue;

            var listReplace = [
              {
                key: "_",
                value: " ",
              },
              {
                key: "Amt",
                value: " Amount",
              },
              {
                key: "Cd",
                value: " Code",
              },
              {
                key: "Descs",
                value: " Description",
              },
              {
                key: "Time Edit",
                value: "Last Update",
              },
              {
                key: "Batch Status",
                value: "Status",
              },
              {
                key: "garing",
                value: "/",
              },
              {
                key: "titik",
                value: ".",
              },
              {
                key: "SnP",
                value: "SnP ",
              },
              {
                key: "VO",
                value: "VO ",
              },
              {
                key: "Row Id",
                value: "View",
              },
            ];
            var isGotIt = false;
            var labelHeader = undefined;

            // console.log(str_array[i])

            if (str_array[i].includes("_")) {
              labelHeader = str_array[i]
                .toLowerCase()
                .split("_")
                .map((s) => {
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
              label: labelHeader,
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
      param.isView = true;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "MK_EditToDoList", params: param });
    },
    IsWarning(date) {
      var arrDate = date.split("/");
      date = arrDate[1] + "/" + arrDate[0] + "/" + arrDate[2];

      var next_action = new Date(date);
      var now = new Date();

      if (next_action < now) {
        return true;
      }
      return false;
    },
  },
  mounted() {
    // this.doGetList("");
    // this.GenDoList();
  },
  created() {
    this.GenDoList();
  },
};
</script>

<style>
</style>