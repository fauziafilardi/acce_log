<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>View Standard Pricing & Costing FTL</span>
                </b-col>
                <b-col style="text-align: right;">
                  <span>
                    <ABSButton
                      :text="'Add Costing'"
                      classButton="button button--back"
                      classIcon="icon-style-1"
                      @click="doAddCosting"
                    />
                  </span>
                  <span>
                    <ABSButton
                      :text="'Back'"
                      classButton="button button--back"
                      classIcon="icon-style-1"
                      @click="doBack"
                    />
                  </span>
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <b-form :data-vv-scope="'parent'" :data-vv-value-path="'parent'">
                <b-row>
                  <b-col md="12">
                    <b-row>
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
                    <b-row>
                      <!-- <b-col>
                        <span>
                          <label>Monthly Point</label>
                        </span>
                        <br />
                        <span>
                          <label>{{M_OpPricingCosting .monthly_point}}</label>
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
                            <template v-slot:cell(margin)="data">
                              <span style="text-align:center;">
                                {{isCurrency(data.item.margin,decimal)}}
                                <b>({{data.item.margin_percent}}%)</b>
                              </span>
                            </template>
                            <template v-slot:cell(selling_price)="data">
                              <span
                                style="text-align:rigth;"
                              >{{isCurrency(data.item.selling_price,decimal)}}</span>
                            </template>
                            <template v-slot:cell(cost_price)="data">
                              <span
                                style="text-align:rigth;"
                              >{{isCurrency(data.item.cost_price,decimal)}}</span>
                            </template>
                          </b-table>
                        </div>
                      </div>
                    </b-row>
                    <b-row>
                      <b-col md="12">
                        <span>
                          <label style="font-size: 15px; color: #333399; font-weight: bold;">Costing</label>
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
                              @row-clicked="doEditCosting"
                              class="table-sm table-style-3"
                            >
                              <template v-slot:cell(row_id)="data">
                                <ABSButton
                                  v-show="data.item.footer == false"
                                  :icon="'trash'"
                                  classButton="button button--delete"
                                  classIcon="icon-style-1"
                                  @click="doDeletedtl(data.item, data.index)"
                                />
                              </template>
                            </b-table>
                          </div>
                        </div>
                        <!-- <div class="card__footer" style="padding-bottom: 10px;">
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
                        </div>-->
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
        OrderBy: "zone_from ASC ",
        SourceField: "",
        ParamView: "",
      },
      M_OpPricingCosting: {
        op_pricing_costing_id: 0,
        ss_portfolio_id: 0,
        category: "",
        fr_cm_zone_id: 0,
        fr_zone_cdLabel: "",
        to_cm_zone_id: 0,
        to_zone_cdLabel: "",
        fm_fleet_type_id: 0,
        fleet_cdLabel: "",
        cm_commodity_id: 0,
        commodity_cdLabel: "",
        selling_price: 0,
        cbm_selling_price: 0,
        kgs_selling_price: 0,
        total_cost_value: 0,
        remarks: "",
        user_input: "",
        user_edit: "",
        time_input: "",
        time_edit: "",
        row_id: 0,
        lastupdatestamp: 0,
      },
      fieldHeader2: [
        {
          value: 1,
          key: "no",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 th-cus-center",
          label: "No",
        },
        {
          value: 2,
          key: "cost_type",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
          label: "Cost Type",
        },
        {
          value: 3,
          key: "descs",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 L th-cus-center",
          label: "Description",
        },
        {
          value: 4,
          key: "on_order",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
          label: "On Order",
        },
        {
          value: 5,
          key: "return_empty",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
          label: "Return Empty",
        },
        {
          value: 6,
          key: "value",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
          label: "Value",
        },
        {
          value: 7,
          key: "row_id",
          thClass: "HeaderACCList2",
          tdClass: "ContentACCList2 notranslate",
          label: "",
        },
      ],
      items2: [],
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
      fieldHeader: [
        {
          key: "no",
          label: "No",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 th-cus-center",
        },
        {
          key: "from_zone",
          label: "From Zone",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
        {
          key: "to_zone",
          label: "To Zone",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
        {
          key: "fleet_cd",
          label: "Type",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
        {
          key: "period",
          label: "Period",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
        {
          key: "selling_price",
          label: "Selling Price",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
        {
          key: "cost_price",
          label: "Cost Price",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
        {
          key: "margin",
          label: "Margin",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
      ],
      items: [],
      firstSort: true,
      sort: "from_zone ASC",

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

      sortedField: [{ field: "marketing_id", sort: "ASC" }],
      isDisableTable: false,
      responses: [],
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
    doBack() {
      this.$router.go(-1);
    },
    doEditCosting(record, index) {
      if (record.footer == true) return
      var param = this.paramFromList;
      param.isEdit = true;
      param.DetailList = record;

      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "OP_PricingCostingFormDetail" });
    },
    doAddCosting() {
      var param = this.paramFromList;
      param.isEdit = false;

      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "OP_PricingCostingFormDetail" });
    },
    doEdit() {
      var param = this.paramFromList;
      param.isEdit = true;
      param.isView = true;
      this.$store.commit("setParamPage", param);
      if (this.M_OpPricingCosting.category == "L") {
        this.$router.push({ name: "OP_PricingCostingLTL" });
      } else {
        this.$router.push({ name: "OP_PricingCostingFTL" });
      }
    },

    doGetList2() {
      var param = {
        option_function_cd: "GetListOPPricingDtl",
        module_cd: "OP",
        row_id: this.paramFromList.row_id,
      };
      this.CallFunction(param).then((response) => {
        // response from API
        if (response == null) return;
        this.$nextTick(() => {
          this.items2 = [];
          this.responses2 = response.Data;
          var ttl = 0;
          for (let i = 0; i < response.Data.length; i++) {
            if (response.Data[i].cost_value && response.Data[i].cost_value !== '') {
              ttl += parseFloat(response.Data[i].cost_value);
            }
            this.items2.push({
              no: i + 1,
              cost_type: response.Data[i].cost_type,
              value: this.isCurrency(response.Data[i].cost_value, this.decimal),
              descs: response.Data[i].description,
              on_order: response.Data[i].on_order,
              return_empty: response.Data[i].return_empty,
              row_id: response.Data[i].row_id,
              lastupdatestamp: response.Data[i].lastupdatestamp,
              footer: false
            });
          }
          if (response.Data.length > 0) {
            this.items2.push({
              no: '',
              cost_type: 'Total',
              value: this.isCurrency(ttl, this.decimal),
              descs: '',
              on_order: '',
              return_empty: '',
              row_id: '',
              lastupdatestamp: '',
              footer: true,
              _rowVariant: 'dark'
            });
          }
        });

        this.$forceUpdate();
      });
    },

    doSave() {
      this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
        (ress) => {
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
          is_my_team: data.is_my_team,
        });
      });

      var param = {
        portfolio_id: this.getDataUser().portfolio_id,
        user_id: this.getDataUser().user_id,
        data_team: paramInsert,
      };

      this.postJSON(this.getUrlMarketingTeam(), param).then((response) => {
        if (response == null) return;
        this.alertSuccess("Save Data Has Been Successfully").then(() => {
          this.doBack();
        });
      });
    },
    doDelete() {
      this.alertConfirmation("Are You Sure Want To Delete This Data ?").then(
        (ress) => {
          if (ress.value) {
            this.M_Delete();
          }
        }
      );
    },
    doDeletedtl(record, index) {
      this.alertConfirmation("Are You Sure Want To Delete This Data ?").then(
        (ress) => {
          if (ress.value) {
            this.M_DeleteDtl(record, index);
          }
        }
      );
    },
    M_Delete() {
      var param = {
        option_url: "/OP/OP_PricingCosting",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp,
      };
      this.deleteJSON(this.getUrlCRUD(), param).then((response) => {
        // response from API
        if (response == null) return;

        this.alertSuccess("Data Has Been Deleted").then(() => {
          this.doBack();
        });
      });
    },
    M_DeleteDtl(record, index) {
      var param = {
        option_url: "/OP/OP_PricingCosting",
        line_no: 1,
        id: record.row_id,
        lastupdatestamp: record.lastupdatestamp,
      };
      this.deleteJSON(this.getUrlCRUD(), param).then((response) => {
        // response from API
        if (response == null) return;

        this.alertSuccess("Data Has Been Deleted").then(() => {
          this.doBack();
        });
      });
    },
    GetDataBy() {
      var param = {
        option_url: "/OP/OP_PricingCosting",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp,
      };

      this.getJSON(this.getUrlCRUD(), param).then((response) => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];
        // var st_date = data.start_date == null ? "" : data.start_date;
        // var ex_date = data.expired_date == null ? "" : data.expired_date;
        // var period_data = "";
        // if (data.start_date == null && data.expired_date == null) {
        //   period_data = "-";
        // } else {
        //   period_data =
        //     this.momentDateFormatting(data.start_date, "DD/MM/YYYY") +
        //     " - " +
        //     this.momentDateFormatting(data.expired_date, "DD/MM/YYYY");
        // }

        this.items.push({
          no: 1,
          from_zone: data.fr_zone_cd__lbl__lo_1,
          to_zone: data.to_zone_cd__lbl__lo_2, //this.isCurrency(response.Data[i].cost_value, this.decimal),
          fleet_cd: data.fleet_cd__lbl__lo_3,
          period: data.period,
          selling_price: data.selling_price__tb_5,
          cost_price: data.total_cost_value,
          margin: data.margin_ftl,
          margin_percent: data.margin_percent_ftl,
        });
        this.M_OpPricingCosting = {
          op_pricing_costing_id: data.op_pricing_costing_id,
          ss_portfolio_id: data.ss_portfolio_id,
          category: data.category,
          fr_cm_zone_id: data.fr_cm_zone_id__lo_1,
          fr_zone_cdLabel: data.fr_zone_cd__lbl__lo_1,
          to_cm_zone_id: data.to_cm_zone_id__lo_2,
          to_zone_cdLabel: data.to_zone_cd__lbl__lo_2,
          fm_fleet_type_id: data.fm_fleet_type_id__lo_3,
          fleet_cdLabel: data.fleet_cd__lbl__lo_3,
          cm_commodity_id: data.cm_commodity_id__lo_4,
          commodity_cdLabel: data.commodity_cd__lbl__lo_4,
          selling_price: data.selling_price__tb_5,
          cbm_selling_price: data.cbm_selling_price__tb_6,
          kgs_selling_price: data.kgs_selling_price__tb_7,
          total_cost_value: data.total_cost_value,
          remarks: data.remarks__tb_8,
          user_input: data.user_input,
          user_edit: data.user_edit,
          time_input: data.time_input,
          time_edit: data.time_edit,
          row_id: data.row_id,
          lastupdatestamp: data.lastupdatestamp,
        };
        var filter = " AND row_id = " + data.row_id;
        this.propList.initialWhere += filter;
        this.doGetList2();
      });
    },
  },
  mounted() {
    this.GetDataBy();
  },
  beforeMount() {},
};
</script>

<style>
  .table-dark td {
    border-color: #95999c !important;
    color: black !important;
  }
</style>
