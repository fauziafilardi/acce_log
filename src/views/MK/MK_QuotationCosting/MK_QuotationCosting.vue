<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card">
            <div class="card__title" style="padding-bottom: 5px !important;">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Quotation Costing Adjustment</span>
                </b-col>

                <b-col style="text-align: right;">
                  <b-row>
                    <b-col>
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
                    </b-col>
                  </b-row>
                </b-col>
                <b-col class="col-right" style="max-width: fit-content !important">
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
                      :text="'Back'"
                      classButton="button button--back2"
                      classIcon="icon-style-1"
                      @click="doBack"
                    />
                  </span>
                </b-col>
              </b-row>
            </div>
          </div>
        </b-col>
        <!-- <div> -->
        <!-- {{dataList}} -->
        <b-col md="12" v-for="(dataList,indexs) in cmbMarketing" v-bind:key="indexs">
          <div class="card">
            <div class="card__title" style="padding-bottom: 5px !important;">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>{{dataList.marketing_name}}</span>
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <div class="table--list" :id="'customer_list_'+indexs">
                <b-table
                  :responsive="true"
                  :striped="false"
                  :bordered="true"
                  :outlined="false"
                  :small="false"
                  :hover="false"
                  :dark="false"
                  :fixed="false"
                  :foot-clone="false"
                  :fields="fieldHeader"
                  :items="dataList.items"
                  @row-clicked="doViewClick"
                  class="table-sm table-style-3"
                >
                  <template v-slot:cell(row_id)="data">
                    <b-button
                      size="sm"
                      @click.stop="doViewClick(data.item, data.index)"
                      :disabled="false"
                      class="btn btn--default"
                    >View</b-button>
                  </template>

                  <template v-slot:cell(selling_price)="data">
                    <span>{{isCurrency(data.item.selling_price, decimal)}}</span>
                  </template>

                  <template v-slot:cell(cost_price)="data">
                    <span>{{isCurrency(data.item.cost_price, decimal)}}</span>
                  </template>

                  <template v-slot:cell(margin)="data">
                    <span
                      style="color: red;"
                    >{{isCurrency(data.item.margin, decimal)}} &nbsp; ({{data.item.margin_percent}}%)</span>
                  </template>
                </b-table>
              </div>
            </div>
            <div class="card__footer" :id="`customer_list_footer_`+indexs">
              <b-form inline style="float: left; color: #333;">
                <label
                  class="font-lbl"
                  style="margin-bottom:0px !important; margin-right:0px !important;"
                >Page Size</label>
                <b-form-select
                  id="cmbPerPage"
                  v-model="dataList.perPage"
                  v-on:change="doGetList2(indexs)"
                  :options="pagingData"
                  class="sm-3 mgn-left-10 font-lbl page-size-left"
                  :disabled="isDisableTable"
                ></b-form-select>
                of {{ dataList.totalRows }} Records
              </b-form>

              <b-pagination
                align="right"
                v-model="dataList.currentPage"
                @change="doGetList2(indexs)"
                :total-rows="dataList.totalRows"
                :per-page="dataList.perPage"
                :limit="dataList.limit"
                style="margin-bottom: 0px;"
                :disabled="isDisableTable"
              ></b-pagination>
            </div>
            <iframe
              :name="`print_frame_`+indexs"
              :id="`print_frame_`+indexs"
              width="0"
              height="0"
              frameborder="0"
              src="about:blank"
            ></iframe>
          </div>
        </b-col>
        <!-- </div> -->
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
        ParamView: "",
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

      sortedField: [],
      isDisableTable: false,
      responses: [],
    };
  },
  computed: {
    paramFromList() {
      var param = this.$store.getters.getParamPage;
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
    rowClicked(record, index) {},
    doDoubleClick(record, index) {},
    doViewClick(record, index) {
      var param = record;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "MK_QuotationCostingView" });
    },
    rowLink(url) {},
    M_PageSize() {},
    M_Pagination() {},
    M_Advance_Filter() {},
    M_Head_Table() {},
    refreshColumn() {},
    onSearchEnter(data) {
      // this.doGetList(this.search, "onSearchEnter");
      for (let i = 0; i < this.cmbMarketing.length; i++) {
        // this.cmbMarketing.push({
        //   marketing_id: data[i].marketing_id,
        //   marketing_name: data[i].marketing_name,
        //   items: [],
        //   currentPage: 1,
        //   lastPage = 1,
        //   totalRows: 0,
        //   perPage: 5,
        //   limit = 2
        // });

        this.doGetList2(i);
      }
    },
    doGetList2(ix = null) {
      if (ix == null || ix == undefined || ix < 0) return;
      if (this.cmbMarketing[ix] == undefined) return;
      // console.log(this.cmbMarketing, ix)

      var totalRows = this.cmbMarketing[ix].totalRows,
        currentPage = this.cmbMarketing[ix].currentPage,
        lastPage = this.cmbMarketing[ix].lastPage,
        perPage = this.cmbMarketing[ix].perPage,
        limit = this.cmbMarketing[ix].limit,
        where = " marketing_id = '" + this.cmbMarketing[ix].marketing_id + "' ",
        // marketing_id
        param = {
          option_url: "/MK/MK_QuotationCosting",
          line_no: 0,
          user_id: this.getDataUser().user_id,
          portfolio_id: this.getDataUser().portfolio_id,
          subportfolio_id: this.getDataUser().subportfolio_id,
          current_page: currentPage,
          per_page: perPage,
          param_where: this.search,
          initial_where: where,
          sort_field: "",
          source_field: "",
          param_view: "",
        };

      this.postJSON(this.getUrlList(), param).then((response) => {
        if (response == null) return;
        this.responses = response;
        // console.log(this.cmbMarketing, ix)
        this.cmbMarketing[ix].items = [];
        this.fieldHeader = [];
        this.cmbMarketing[ix].items = this.responses.Data;

        var str_array =
          this.responses.DefineColumn && this.responses.DefineColumn !== ""
            ? this.responses.DefineColumn.split(",")
            : this.responses.AllColumn.split(",");
        // var x = "S,S,L,S,S,S,S";
        // var defineSize = x.split(",");
        var defineSize = this.responses.DefineSize.split(",");

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
          if (str_array[i] !== "no") {
            thClass += defineSize[i];
          }

          var tdClass = "ContentACCList2 notranslate";
          if (
            str_array[i].toLowerCase().includes("amount") ||
            str_array[i].toLowerCase().includes("amt") ||
            str_array[i].toLowerCase().includes("rate") ||
            str_array[i].toLowerCase().includes("price") ||
            str_array[i].toLowerCase().includes("margin")
          ) {
            tdClass = "ABStdClassList2 notranslate";
            thClass = "ABSthClassList2";
          } else if (str_array[i].toLowerCase() == "target") {
            thClass += " th-cus-center";
            tdClass += " td-cus-center";
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

        // this.availableColumn = filteredColumn;
        // this.selectedColumn = definedColumn;

        // this.availableColumnTemp = filteredColumn;
        // this.selectedColumnTemp = definedColumn;
        // this.totalRows = this.responses.Total;
        this.cmbMarketing[ix].totalRows = this.responses.Total;
        this.cmbMarketing[ix].lastPage = this.responses.Last_Page;
      });
    },
    getMarketing() {
      var param = {
        option_function_cd: "GetMarketingTeam",
        module_cd: "MK",
        user_id: this.getDataUser().user_id,
      };

      this.CallFunction(param).then((response) => {
        if (response == null) return;
        var data = response.Data;
        for (let i = 0; i < data.length; i++) {
          this.cmbMarketing.push({
            marketing_id: data[i].marketing_id,
            marketing_name: data[i].marketing_name,
            items: [],
            currentPage: 1,
            lastPage: 1,
            totalRows: 0,
            perPage: 5,
            limit: 2,
          });

          this.doGetList2(i);
        }

        // this.getList();
      });
    },
  },
  mounted() {
    this.getMarketing();
    this.$store.commit("setParamPage", {});
  },
  created() {},
};
</script>

<style>
</style>