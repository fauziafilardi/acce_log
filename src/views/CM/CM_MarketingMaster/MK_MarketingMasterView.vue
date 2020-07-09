<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>View Marketing Master</span>
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
                  <b-col md="12">
                    <b-row class="row-view">
                      <b-col style="text-align: right;">
                        <span>
                          <ABSButton
                            :text="'Delete'"
                            classButton="btn btn--default"
                            classIcon="icon-style-1"
                            @click="doDelete"
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
                    <b-row class="row-view">
                      <!-- <b-col>
                        <span>
                          <label>Monthly Point</label>
                        </span>
                        <br />
                        <span>
                          <label>{{M_MkMarketing.monthly_point}}</label>
                        </span>
                      </b-col>-->
                      <div class="card__body">
                        <div class="table--list" :id="'marketingmaster'">
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
                            :items="items"
                            class="table-sm table-style-3"
                          >
                            <template v-slot:cell(name)="data">
                              <span>{{data.item.marketing_id+" - " +data.item.name}}</span>
                            </template>
                          </b-table>
                        </div>
                      </div>
                    </b-row>
                    <b-row>
                      <b-col md="12">
                        <span>
                          <label>Add Team</label>
                        </span>
                        <div class="card__body">
                          <div class="table--list" :id="'marketingmaster_team'">
                            <b-table
                              :responsive="true"
                              :striped="false"
                              :bordered="true"
                              :outlined="false"
                              :small="false"
                              :hover="true"
                              :dark="false"
                              :fixed="false"
                              :foot-clone="false"
                              :fields="fieldHeader2"
                              :items="items2"
                              class="table-sm table-style-3"
                            >
                              <template v-slot:cell(name)="data">
                                <span>{{data.item.marketing_id+" - " +data.item.name}}</span>
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
                        </div>
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
  </div>
</template>

<script>
export default {
  data() {
    return {
      propList: {
        initialWhere:
          "ss_portfolio_id='" + this.getDataUser().portfolio_id + "'",
        LineNo: 0,
        PageLevel: 1,
        TabIndex: 1,
        OrderBy: "marketing_id ASC ",
        SourceField: "",
        ParamView: ""
      },
      M_MkMarketing: {
        mk_marketing_id: 0,
        ss_portfolio_id: 0,
        user_id: "",
        marketing_id: "",
        nameLabel: "",
        nik_id: "",
        address: "",
        email: "",
        hand_phone: "",
        status_active: "",
        join_date: "",
        monthly_point: 0,
        monthly_new_prospect: 0,
        user_input: "",
        user_edit: "",
        time_input: "",
        time_edit: "",
        minimum_margin: "",
        remarks: "",
        row_id: 0,
        lastupdatestamp: 0
      },
      fieldHeader2: [],
      items2: [],
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
      sort: "marketing_id ASC",

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

      sortedField: [{ field: "marketing_id", sort: "ASC" }],
      isDisableTable: false,
      responses: []
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
    doBack() {
      this.$router.go(-1);
    },
    doEdit() {
      var param = this.paramFromList;
      param.isEdit = true;
      this.$router.push({ name: "CM_MarketingMasterForm", params: param });
    },
    doGetList(search, a = null) {
      var param = {
        option_url: "/MK/MK_Marketing",
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

          var thClass = "HeaderACCList " + defineSize[i];
          if (str_array[i] !== "no") {
            thClass += defineSize[i];
          }
          //   var thClass = "HeaderACCList2 L";

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
                value: "View"
              },
              {
                key: "Row  Id",
                value: "View"
              },
              {
                key: "Name",
                value: "Marketing Name"
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

            // if (labelHeader == "Row Id") continue;

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
      };

      this.fieldHeader2 = [
        {
          value: 1,
          key: "no",
          thClass: "HeaderACCList2",
          tdClass: "ContentACCList2 notranslate",
          label: "No"
        },
        // {
        //     value: 2,
        //     key: "marketing_id",
        //     thClass: "HeaderACCList  S",
        //     tdClass: "ContentACCList2 notranslate",
        //     label: "Marketing ID"
        // },
        {
          value: 2,
          key: "name",
          thClass: "HeaderACCList  M",
          tdClass: "ContentACCList notranslate",
          label: "Marketing Name"
        },
        // {
        //     value: 4,
        //     key: "join_date",
        //     thClass: "HeaderACCList  M",
        //     tdClass: "ContentACCList2 notranslate",
        //     label: "Join Date"
        // },
        // {
        //     value: 5,
        //     key: "monthly_point",
        //     thClass: "HeaderACCList  S",
        //     tdClass: "ContentACCList2 notranslate",
        //     label: "Monthly Point"
        // },
        // {
        //     value: 6,
        //     key: "monthly_new_prospect",
        //     thClass: "HeaderACCList  S",
        //     tdClass: "ContentACCList2 notranslate",
        //     label: "Monthly New Prospect"
        // },
        {
          value: 3,
          key: "is_my_team",
          thClass: "HeaderACCList S",
          tdClass: "ContentACCList notranslate",
          label: "My Team"
        }
      ];

      this.getJSON(this.getUrlMarketingTeam(), param).then(response => {
        // response from API
        if (response == null) return;
        this.$nextTick(() => {
          this.items2 = [];
          this.responses2 = response.Data;
          for (let i = 0; i < response.Data.length; i++) {
            this.items2.push({
              no: i + 1,
              marketing_id: response.Data[i].marketing_id,
              name: response.Data[i].name,
              join_date2: response.Data[i].join_date,
              join_date: this.momentDateFormat(
                response.Data[i].join_date,
                "YYYY-MM-DD"
              ),
              monthly_point: 0,
              monthly_new_prospect: 0,
              is_my_team: false
            });
          }
        });

        this.$forceUpdate();

        this.getList();
      });
    },
    getList() {
      this.$nextTick(() => {
        for (let i = 0; i < this.items2.length; i++) {
          this.items2[i].monthly_point =
            this.responses2[i] !== undefined
              ? this.responses2[i].monthly_point &&
                this.responses2[i].monthly_point !== ""
                ? this.responses2[i].monthly_point
                : 0
              : 0;
          this.items2[i].monthly_new_prospect =
            this.responses2[i] !== undefined
              ? this.responses2[i].monthly_new_prospect &&
                this.responses2[i].monthly_new_prospect !== ""
                ? this.responses2[i].monthly_new_prospect
                : 0
              : 0;
          this.items2[i].is_my_team = this.responses2[i].is_my_team;
        }
      });

      this.$forceUpdate();
    },
    doSave() {
      this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
        ress => {
          if (ress.value) {
            this.M_Save();
          }
        }
      );
    },
    M_Save() {
      var paramInsert = [];

      this.items2.forEach((data, index) => {
        paramInsert.push({
          marketing_id: data.marketing_id,
          name: data.name,
          join_date: data.join_date2,
          monthly_point: data.monthly_point,
          monthly_new_prospect: data.monthly_new_prospect,
          is_my_team: data.is_my_team
        });
      });

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
    },
    doDelete() {
      this.alertConfirmation("Are You Sure Want To Delete This Data ?").then(
        ress => {
          if (ress.value) {
            this.M_Delete();
          }
        }
      );
    },
    M_Delete() {
      var param = {
        option_url: "/MK/MK_Marketing",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };
      this.deleteJSON(this.getUrlCRUD(), param).then(response => {
        // response from API
        if (response == null) return;

        this.alertSuccess("Data Has Been Deleted").then(() => {
          this.doBack();
        });
      });
    },
    GetDataBy() {
      var param = {
        option_url: "/MK/MK_Marketing",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };

      this.getJSON(this.getUrlCRUD(), param).then(response => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];

        this.M_MkMarketing = {
          mk_marketing_id: data.mk_marketing_id,
          ss_portfolio_id: data.ss_portfolio_id,
          user_id: data.user_id__lo_1,
          marketing_id: data.marketing_id,
          nameLabel: data.name__lbl__lo_1,
          nik_id: data.nik_id,
          address: data.address,
          email: data.email,
          hand_phone: data.hand_phone,
          status_active: data.status_active,
          join_date: data.join_date,
          monthly_point: data.monthly_point__tb_2,
          monthly_new_prospect: data.monthly_new_prospect__tb_3,
          user_input: data.user_input,
          user_edit: data.user_edit,
          time_input: data.time_input,
          time_edit: data.time_edit,
          minimum_margin: data.minimum_margin__tb_4,
          remarks: data.remarks__tb_5,
          row_id: data.row_id,
          lastupdatestamp: data.lastupdatestamp
        };
        var filter = " AND row_id = " + data.mk_marketing_id;
        this.propList.initialWhere += filter;
        this.doGetList(this.search);
        this.doGetList2();
      });
    }
  },
  mounted() {
    this.GetDataBy();
  },
  beforeMount() {}
};
</script>

<style>
</style>
