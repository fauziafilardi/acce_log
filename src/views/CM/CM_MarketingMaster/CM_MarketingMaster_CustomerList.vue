<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card">
            <div class="card__title" style="padding-bottom: 5px !important;">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Marketing Master - Customer List</span>
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
              <div class="table--list" :id="'marketingmaster_customerlist'">
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
                  <template v-slot:cell(child_marketing_id)="data">
                    <b-button
                      v-if="WithViewButton == true"
                      size="sm"
                      @click.stop="viewClicked(data.item, data.index)"
                      :disabled="false"
                      class="btn btn--default"
                    >Change Marketing</b-button>
                    <span v-else>{{data.item.child_marketing_id}}</span>
                  </template>
                </b-table>
              </div>
            </div>
            <div class="card__footer">
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
          <ABSModal id="Modal_Mkt" ref="Modal_Mkt" size="sm">
            <template slot="headerTitle">Change Marketing</template>
            <template slot="content">
                <b-row>
                <b-col md="12">
                    <b-form :data-vv-scope="'M_Mkt'" :data-vv-value-path="'M_Mkt'">
                    <b-row>
                        <b-col md="12">
                            <b-row>
                                <b-col style="text-align:center;">
                                    Please Select Marketing
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col offset="3" md="6">
                                    <ACCRadioButton
                                        :prop="PI_marketing_id"
                                        v-model="M_Mkt.marketing_id"
                                        ref="ref_marketing_id"
                                    />
                                </b-col>
                            </b-row>
                            <b-row style="margin-top: 10px;">
                                <b-col md="12" style="text-align:center;">
                                    <ABSButton
                                        :text="'Save'"
                                        classButton="btn btn--default"
                                        classIcon="icon-style-1"
                                        @click="SaveModal"
                                        styleButton="height: 40px;width: 75%;"
                                    />
                                </b-col>
                                <!-- <b-col md="6">
                                <ABSButton
                                    :text="'Cancel'"
                                    classButton="btn btn--back"
                                    classIcon="icon-style-1"
                                    @click="CancelModal"
                                    styleButton="height: 40px;width: 100%;"
                                />
                                </b-col> -->
                            </b-row>
                        </b-col>
                    </b-row>
                    </b-form>
                </b-col>
                </b-row>
            </template>
            </ABSModal>
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
        OrderBy: "",
        SourceField: "",
        ParamView: ""
      },

      //For List
      WithViewButton: true,
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
      sort: "",

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

      sortedField: [],
      isDisableTable: false,
      responses: [],
        PI_marketing_id: {
            cValidate :'',
            cName: 'marketing_id',
            cId: 'rdbmarketing_id',
            cRadioOptions: [],
            cRadioDefaultOption: '',
            cOrder: 1,
            cProtect: false,
            cVisible:  true,
            cParentForm: 'MK_AddQuotation',
            cInputStatus: 'new',
            cGroup: true
        },
        M_Mkt: {
            marketing_id: ''
        },
        isChange: {}
    };
  },
  methods: {
      doBack() {
        this.$router.go(-1);
      },
    rowClicked(record, index) {},
    doDoubleClick(record, index) {},
    viewClicked(record, index) {
        this.isChange = record
        this.M_Mkt.marketing_id = record.marketing_id
        this.OpenModal();
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
    OpenModal() {
      this.$refs.Modal_Mkt._show();
    },
    CancelModal() {
      this.$refs.Modal_Mkt._hide();
    },
    SaveModal() {
        var param = {
            option_url: "/CM/CM_MarketingMaster",
            line_no: 2,
            row_id: this.isChange.row_id,
            ss_portfolio_id: this.isChange.ss_portfolio_id,
            marketing_id: this.M_Mkt.marketing_id,
            lastupdatestamp: this.isChange.lastupdatestamp,
            user_edit: this.getDataUser().user_id
        }

        this.putJSON(this.getUrlCRUD(), param).then(response => {
            // console.log(response)
            if (response == null) return;
            this.alertSuccess(response.Message).then(() => {
                this.CancelModal();
                this.doGetList("");
            });
        });
    },
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
      var filter = " action = '" + this.filterAction + "'";
      this.propList.initialWhere = filter;
      this.doGetList(this.search);
    },
    doGetList(search, a = null) {
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
                key: "Child Marketing Id",
                value: "Change Marketing"
              },
              {
                key: "Marketing Id",
                value: "User Id"
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
                  if (labelHeader == "Child Marketing Id" && !this.WithViewButton) continue;
                  // if (labelHeader == 'Child Marketing Id' && !this.WithViewButton) {

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

            if (labelHeader == "Child Marketing Id") continue;

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
    getMarketing() {
        var param = {
            option_function_cd: "GetMarketingTeam",
            module_cd: "MK",
            user_id: this.getDataUser().user_id
        };

        this.CallFunction(param).then(response => {
            if (response == null) return
            var data = response.Data;
            var opt = []

            for (let i = 0; i < data.length; i++) {
                opt.push({
                    text: data[i].marketing_name,
                    value: data[i].marketing_id
                })
            }

            this.PI_marketing_id.cRadioOptions = opt;
        })
    },
  },
  mounted() {
    this.doGetList("");
    this.getMarketing();
  },
  created() {
  }
};
</script>

<style>
</style>