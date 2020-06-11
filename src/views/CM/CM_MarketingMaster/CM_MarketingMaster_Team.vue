<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card">
            <div class="card__title" style="padding-bottom: 5px !important;">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Marketing Master - Team Setup</span>
                </b-col>
                <!-- <b-col style="text-align: right;">
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
                </b-col> -->
                <!-- <b-col md="2">
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
                </b-col> -->
                <!-- <b-col md="3">
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
                </b-col> -->
                <b-col class="col-right">
                  <!-- <span>
                    <ABSButton
                      :text="'Search'"
                      classButton="button button--back2"
                      classIcon="icon-style-1"
                      @click="onSearchEnter"
                    />
                  </span> -->

                  <!-- <span>
                    <ABSButton
                        :text="'Team'"
                        classButton="button button--back2"
                        classIcon="icon-style-1"
                        @click="onTeamClick"
                    />
                  </span>

                  <span>
                    <ABSButton
                        :text="'Customer List'"
                        classButton="button button--back2"
                        classIcon="icon-style-1"
                        @click="onCustomerListClick"
                    />
                  </span> -->

                  <span>
                    <ABSButton
                      :text="'Back'"
                      classButton="button button--back2"
                      classIcon="icon-style-1"
                      @click="doBack"
                    />
                  </span>
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
                <!-- <b-row>
                    <b-col md="2">
                        <b-row>
                            <b-col md="3">
                                Marketing &nbsp;&nbsp;
                            </b-col>
                            <b-col>
                                <b-form-select
                                    id="cmbMarketing"
                                    v-model="filterActionM"
                                    @change="dofilterActionM"
                                    :options="cmbMarketing"
                                    :disabled="isDisableTable"
                                    style="height: 22px !important; width: 100% !important; margin-bottom: 5px;"
                                ></b-form-select>
                            </b-col>
                        </b-row>
                    </b-col>
                    <b-col md="2">
                        <b-row>
                            <b-col md="3">
                                Year &nbsp;&nbsp;
                            </b-col>
                            <b-col>
                                <b-form-select
                                    id="cmbYear"
                                    v-model="filterAction"
                                    @change="dofilterAction"
                                    :options="cmbYear"
                                    :disabled="isDisableTable"
                                    style="height: 22px !important; width: 100% !important; margin-bottom: 5px;"
                                ></b-form-select>
                            </b-col>
                        </b-row>
                    </b-col>
                </b-row> -->

              <div class="table--list" :id="'marketingmaster_team'">
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
                  class="table-sm table-style-3"
                >
                    <template v-slot:cell(monthly_point)="data">
                        <!-- {{data.item.monthly_point}} -->
                        <ACCTextBox
                          :prop="{
                                cValidate: '',
                                cName: 'monthly_point_' + data.index,
                                cOrder: 1,
                                cKey: false,
                                cType: 'numeric',
                                cProtect: false,
                                cParentForm: 'MarketingMaster',
                                cDecimal: 2,
                                cInputStatus: 'new'
                          }"
                          v-model="data.item.monthly_point"
                          :ref="'ref_monthly_point_' + data.index"
                        />
                    </template>
                    <template v-slot:cell(monthly_new_prospect)="data">
                        <!-- {{data.item.monthly_new_prospect}} -->
                        <ACCTextBox
                          :prop="{
                                cValidate: '',
                                cName: 'monthly_new_prospect_' + data.index,
                                cOrder: 2,
                                cKey: false,
                                cType: 'numeric',
                                cProtect: false,
                                cParentForm: 'MarketingMaster',
                                cDecimal: 2,
                                cInputStatus: 'new'
                          }"
                          v-model="data.item.monthly_new_prospect"
                          :ref="'ref_monthly_new_prospect_' + data.index"
                        />
                    </template>
                    <template v-slot:cell(is_my_team)="data">
                        <b-form-checkbox
                            :id="'cbTeam_'+data.index"
                            :name="'cbTeam_'+data.index"
                            v-model="data.item.is_my_team"
                            :value="true"
                            :unchecked-value="false"
                            style="min-height:15px !important;padding-top:0px !important;"
                        />
                    </template>
                </b-table>
              </div>
            </div>
            <div class="card__footer" style="padding-bottom: 10px;">
                <b-row>
                    <b-col md="12" style="text-align: center;">
                        <ABSButton
                            :text="'Save'"
                            classButton="btn btn--default"
                            classIcon="icon-style-1"
                            @click="doSave"
                            styleButton="height: 40px;width: 75%;"
                        />
                    </b-col>
                </b-row>
              <!-- <b-form inline style="float: left; color: #333;">
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
              ></b-pagination> -->
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
        initialWhere: "",
        LineNo: 0,
        PageLevel: 1,
        TabIndex: 1,
        OrderBy: " time_edit DESCS ",
        SourceField: "",
        ParamView: ""
      },

      //For List
      cmbMarketing: [],
      cmbYear: [],
      WithViewButton: false,
      isFirst: false,
      selected: false,
      rowSelected: [],
      dataSelected: [],
      rowSel: -1,
      filterActionM: "",
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

      sortedField: [{ field: "time_edit", sort: "DESCS" }],
      isDisableTable: false,
      responses: []
    };
  },
  computed: {
        paramFromList() {
            var param = this.$route.params;
            // if (param == null || param == undefined) {
            //     this.doBack();
            // } else {
            //     if (Object.keys(param).length < 1) {
            //         this.doBack();
            //     } else {
                    return param;
            //     }
            // }
        },
  },
  methods: {
        doBack() {
            this.$router.go(-1);
        },
        // Onmonthly_pointInput(data,index) {
        //     this.$nextTick(() => {
        //         this.items[index].monthly_point = data
        //     })
        //     this.$forceUpdate();
        // },
        // Onmonthly_new_prospectInput(data,index) {
        //     this.$nextTick(() => {
        //         this.items[index].monthly_new_prospect = data
        //     })
        //     this.$forceUpdate();
        // },
    rowClicked(record, index) {},
    doDoubleClick(record, index) {},
    doViewClick(record, index) {
      //target ntr
    },
    rowLink(url) {},
    M_PageSize() {},
    M_Pagination() {},
    M_Advance_Filter() {},
    M_Head_Table() {},
    refreshColumn() {},
    onSearchEnter(data) {
    //   this.doGetList(this.search, "onSearchEnter");
    },
    onTeamClick() {},
    onCustomerListClick() {},
    // doProspect() {
    //   var filter = " contact_type = 'P'";
    //   this.propList.initialWhere = filter;
    //   this.doGetList(this.search);
    // },
    // doCustomer() {
    //   var filter = " contact_type = 'C'";
    //   this.propList.initialWhere = filter;
    //   this.doGetList(this.search);
    // },

    dofilterAction() {
    //   var filter = " action = '" + this.filterAction + "'";
    //   this.propList.initialWhere = filter;
      this.doGetList2();
    },
    // dofilterActionM() {
    //     this.doGetList2();
    // },
    doGetList(search) {
      var param = {
        option_url: "/CM/CM_MarketingMaster",
        line_no: 2,
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
        var x = ",L,S,S,L,S,S,S";
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
            tdClass: "ContentACCList2 notranslate",
            text: val
          });

          filteredColumn.push({
            value: idx + 1,
            key: val,
            thClass: thClass,
            tdClass: "ContentACCList2 notranslate"
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

          var thClass = "HeaderACCList2 ";
          if (str_array[i] !== "no") {
            thClass += defineSize[i];
          }
          //   var thClass = "HeaderACCList2 L";

          var tdClass = "ContentACCList2 notranslate";
          if (
            str_array[i].toLowerCase().includes("amount") ||
            str_array[i].toLowerCase().includes("amt") ||
            str_array[i].toLowerCase().includes("rate") ||
            str_array[i].toLowerCase().includes("price")
          ) {
            tdClass = "ABStdClassList2 notranslate";
            thClass = "ABSthClassList2";
          }
          else if (str_array[i].toLowerCase() == "target") {
              thClass += " th-cus-center"
              tdClass += " td-cus-center";
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
                value: "Target"
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
    doGetList2() {
        var param = {
            portfolio_id: this.getDataUser().portfolio_id,
            user_id: this.getDataUser().user_id
        }

        this.fieldHeader = [
            {
                value: 1,
                key: "no",
                thClass: "HeaderACCList2",
                tdClass: "ContentACCList2 notranslate",
                label: "No"
            },
            {
                value: 2,
                key: "marketing_id",
                thClass: "HeaderACCList2 S",
                tdClass: "ContentACCList2 notranslate",
                label: "Marketing ID"
            },
            {
                value: 3,
                key: "name",
                thClass: "HeaderACCList2 M",
                tdClass: "ContentACCList2 notranslate",
                label: "Name"
            },
            {
                value: 4,
                key: "join_date",
                thClass: "HeaderACCList2 M",
                tdClass: "ContentACCList2 notranslate",
                label: "Join Date"
            },
            {
                value: 5,
                key: "monthly_point",
                thClass: "HeaderACCList2 S",
                tdClass: "ContentACCList2 notranslate",
                label: "Monthly Point"
            },
            {
                value: 6,
                key: "monthly_new_prospect",
                thClass: "HeaderACCList2 S",
                tdClass: "ContentACCList2 notranslate",
                label: "Monthly New Prospect"
            },
            {
                value: 7,
                key: "is_my_team",
                thClass: "HeaderACCList2",
                tdClass: "ContentACCList2 notranslate",
                label: "Set As My Team"
            },
        ];

        this.getJSON(this.getUrlMarketingTeam(), param).then(response => {
            // response from API
            if (response == null) return;
            this.$nextTick(() => {
                this.items = [];
                this.responses = response.Data;
                for (let i = 0; i < response.Data.length; i++) {
                    this.items.push({
                        no: i + 1,
                        marketing_id: response.Data[i].marketing_id,
                        name: response.Data[i].name,
                        join_date2: response.Data[i].join_date,
                        join_date: this.momentDateFormat(response.Data[i].join_date, 'YYYY-MM-DD'),
                        monthly_point: 0,
                        monthly_new_prospect: 0,
                        is_my_team: false
                    })
                }
            })

            this.$forceUpdate();

            this.getList();
        })
    },
    getList() {
        this.$nextTick(() => {
            for (let i = 0; i < this.items.length; i++) {
                this.items[i].monthly_point = this.responses[i] !== undefined ? (this.responses[i].monthly_point && this.responses[i].monthly_point !== '' ? this.responses[i].monthly_point : 0) : 0
                this.items[i].monthly_new_prospect = this.responses[i] !== undefined ? (this.responses[i].monthly_new_prospect && this.responses[i].monthly_new_prospect !== '' ? this.responses[i].monthly_new_prospect : 0) : 0
                this.items[i].is_my_team = this.responses[i].is_my_team
            }
        })

        this.$forceUpdate();
    },
    doSave() {
        this.alertConfirmation("Are You Sure Want To Save This Data ?").then(ress => {
            if (ress.value) {
                this.M_Save();
            }
        });
    },
    M_Save() {
        var paramInsert = [];

        this.items.forEach((data, index) => {
            paramInsert.push({
                marketing_id: data.marketing_id,
                name: data.name,
                join_date: data.join_date2,
                monthly_point: data.monthly_point,
                monthly_new_prospect: data.monthly_new_prospect,
                is_my_team: data.is_my_team
            })
        })

        var param = {
            portfolio_id: this.getDataUser().portfolio_id,
            user_id: this.getDataUser().user_id,
            data_team: paramInsert
        };

        this.postJSON(this.getUrlMarketingTeam(), param).then(response => {
            if (response == null) return;
            this.alertSuccess("Save Data Has Been Successfully").then(() => {
                this.doBack();
            });
        });
    }
  },
  mounted() {
    //   if (this.paramFromList !== undefined) {
        this.doGetList2();
    //   }
  },
  created() {
  }
};
</script>

<style>
</style>