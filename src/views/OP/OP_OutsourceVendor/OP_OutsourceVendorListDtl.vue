<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card">
            <div class="card__title" style="padding-bottom: 5px !important;">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Outsource Order</span>
                </b-col>

                <b-col class="col-right" style="text-align: right;">
                  <b-row class="col-right" md="2">
                    <b-col>
                      <ACCDropDown
                        @change="OncompanyChange"
                        :prop="PI_company"
                        v-model="M_OutsouceOrder.company"
                        :label="M_OutsouceOrder.companyLabel"
                        ref="ref_company"
                      />
                    </b-col>
                  </b-row>
                </b-col>
                <!-- <b-col style="text-align: right;">
                  <b-form-select
                    id="cmbFilter"
                    v-model="M_OutsouceOrder.company"
                    @input="OncompanyChange"
                    :options="dropCompany"
                    style="height: 22px !important; width: 100% !important; margin-bottom: 5px;"
                  ></b-form-select>
                </b-col>-->
                <b-col style="text-align: right;">
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
            <div class="card__body">
              <div>
                <b-row>
                  <b-col>
                    <span style="font-size: 15px;">
                      <label>Vendor : {{M_OutsouceOrder.vendor_name}}</label>
                    </span>
                  </b-col>
                </b-row>
                <b-row>
                  <b-col>
                    <span style="font-size: 15px;">
                      <font-awesome-icon class="icon-style-default" icon="user" size="sm" />
                      {{ M_OutsouceOrder.pic }}
                    </span> &nbsp;&nbsp;
                    <span style="font-size: 15px;">
                      <font-awesome-icon
                        class="icon-style-default"
                        icon="phone-square-alt"
                        size="sm"
                      />
                      {{ M_OutsouceOrder.contact_phone_pic }}
                    </span>
                  </b-col>
                </b-row>
              </div>
              <br />
              <div class="table--list" :id="'MarketingCustomerList'">
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
                  @row-clicked="viewClicked"
                  class="table-sm table-style-3"
                >
                  <!-- <template v-slot:cell(row_id)="data">
                    <b-button
                      v-if="WithViewButton == true"
                      size="sm"
                      @click.stop="viewClicked(data.item, data.index)"
                      :disabled="false"
                      class="btn btn--default"
                    >View</b-button>
                    <span v-else>{{data.item.row_id}}</span>
                  </template>-->
                  <!-- <template v-slot:cell(status)="data">
                      <span
                  </template>-->
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
        initialWhere: "",
        LineNo: 1,
        PageLevel: 1,
        TabIndex: 1,
        OrderBy: "",
        SourceField: "",
        ParamView: "",
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
      sort: "status desc,order_no ASC",

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

      sortedField: [{ field: "order_no", sort: "ASC" }],
      isDisableTable: false,
      responses: [],
      M_OutsouceOrder: {
        vendor_name: "",
        pic: "",
        contact_phone_pic: "",
        company: "",
        companyLabel: "",
      },
      PI_company: {
        dataLookUp: {
          LookUpCd: "GetOutsourceOrderCompany",
          ColumnDB: "cm_contact_id",
          InitialWhere: "",
          ParamWhere: "",
          OrderBy: "",
          ParamView: "",
          SourceField: "",
          DisplayLookUp: "",
        },
        cValidate: "",
        cName: "company",
        cOrder: 1,
        cKey: false,
        cStatic: false,
        cProtect: false,
        cParentForm: "M_OutsouceOrder",
        cOption: [],
        cDisplayColumn: "name",
        cInputStatus: this.inputStatus,
      },
      dropCompany: [],
    };
  },
  computed: {
    paramFromList() {
      var param = this.$store.getters.getParamPage;
      if (param == null || param == undefined) {
        this.doBack();
      } else {
        if (Object.keys(param).length < 1) {
          this.doBack();
        } else {
          return param;
        }
      }
    },
  },
  methods: {
    OncompanyChange(data) {
      this.$nextTick(() => {
        var filter = "cm_contact_id = " + data.id;
        this.propList.initialWhere = filter;
        this.doGetList(this.search);
      });
    },
    doBack() {
      this.$router.go(-1);
    },
    rowClicked(record, index) {},
    doDoubleClick(record, index) {},
    doViewClick(record, index) {
      //   var param = record;
      // param.option_url = '/OP/OP_OutsourceVendor'
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
    viewClicked(record, index) {
      var param = this.paramFromList;
      param.detailList = record;
      param.isView = true;
      this.$store.commit("setParamPage", param);
      if (record.status == "Pending") {
        this.$router.push({ name: "OP_OutsourceVendorViewPending" });
      } else if (record.status == "Completed") {
        this.$router.push({ name: "OP_OutsourceVendorViewCompleted" });
      }
    },
    dofilterAction() {
      var filter = " action = '" + this.filterAction + "'";
      this.propList.initialWhere = filter;
      this.doGetList(this.search);
    },
    dogetget() {
      this.doGetList(this.search);
    },

    doGetList(search, a = null) {
      var param = {
        option_url: "/OP/OP_OutsourceVendor",
        line_no: 1,
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
        var x = ",S,S,S,S,S,S,S,S";
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

          var thClass = "HeaderACCList2 " + defineSize[i];
          //   var thClass = "HeaderACCList L";

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
            if (str_array[i] == "row_id") continue;

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
              {
                key: "Name",
                value: "Customer",
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
      this.$router.push({ name: "OP_OutsourceVendorView", params: param });
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
    GetDataBy() {
      var param = {
        option_url: "/OP/OP_OutsourceVendor",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp,
      };

      this.getJSON(this.getUrlCRUD(), param).then((response) => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];
        console.log(data);
        this.M_OutsouceOrder = {
          vendor_name: data.name,
          pic: data.contact_person,
          contact_phone_pic: data.contact_phone_no,
        };
        var filter = "vendor_cm_contact_id = " + data.cm_contact_id;
        this.propList.initialWhere = filter;
        this.doGetList(this.search);

        this.PI_company.dataLookUp.InitialWhere = filter;
        // this.doGetList2();
      });
    },
  },
  mounted() {
    this.GetDataBy();
  },
  created() {},
};
</script>

<style>
</style>