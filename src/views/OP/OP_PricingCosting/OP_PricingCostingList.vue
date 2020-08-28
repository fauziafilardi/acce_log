<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Standard Pricing & Costing</span>
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
                      :text="'Add FTL'"
                      classButton="button button--back2"
                      classIcon="icon-style-1"
                      @click="onFTLEnter"
                    />
                  </span>
                  <span>
                    <ABSButton
                      :text="'Add LTL'"
                      classButton="button button--back2"
                      classIcon="icon-style-1"
                      @click="onLTLEnter"
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
              <b-row>
                <b-col>
                  <ACCList2
                    :prop="propListFTL"
                    :title="'FTL'"
                    @rowClicked="rowClickedFTL"
                    @buttonDeleteClicked="doDeleteClick"
                    @rowDblClicked="doDoubleClick"
                    @rowLinkClick="rowLink"
                    @pageSize="M_PageSize"
                    @pagination="M_Pagination"
                    @filter="M_Advance_Filter"
                    @headTable="M_Head_Table"
                    @refreshColumn="refreshColumn"
                    ref="ref_OPPricingCostingFTL"
                    ButtonBackDisabled
                    SearchDisabled
                    @buttonViewClicked="doViewClick"
                  >
                    <template slot="selling_price" slot-scope="data">
                      <span>{{ isCurrency(data.item.selling_price,decimal) }}</span>
                    </template>
                    <template slot="cost_price" slot-scope="data">
                      <span>{{ isCurrency(data.item.cost_price,decimal) }}</span>
                    </template>
                    <template slot="margin" slot-scope="data">
                      <span>{{ isCurrency(data.item.margin,decimal) +`(`+data.item.margin_percent+`%)`}}</span>
                    </template>
                  </ACCList2>
                </b-col>
              </b-row>
              <b-row>
                <b-col>
                  <ACCList2
                    :prop="propListLTL"
                    :title="'LTL'"
                    @rowClicked="rowClickedLTL"
                    @buttonDeleteClicked="doDeleteClick"
                    @rowDblClicked="doDoubleClick"
                    @rowLinkClick="rowLink"
                    @pageSize="M_PageSize"
                    @pagination="M_Pagination"
                    @filter="M_Advance_Filter"
                    @headTable="M_Head_Table"
                    @refreshColumn="refreshColumn"
                    ref="ref_OPPricingCostingLTL"
                    ButtonBackDisabled
                    SearchDisabled
                    @buttonViewClicked="doViewClick"
                  >
                    <template slot="selling_price_kgs" slot-scope="data">
                      <span>{{ isCurrency(data.item.selling_price_kgs,decimal) }}</span>
                    </template>
                    <template slot="cost_price_kgs" slot-scope="data">
                      <span>{{ isCurrency(data.item.cost_price_kgs,decimal) }}</span>
                    </template>
                    <template slot="margin_kgs" slot-scope="data">
                      <span>{{ isCurrency(data.item.margin_kgs,decimal) +`(`+data.item.margin_percent_kgs+`%)`}}</span>
                    </template>
                    <template slot="selling_price_cbm" slot-scope="data">
                      <span>{{ isCurrency(data.item.selling_price_cbm,decimal) }}</span>
                    </template>
                    <template slot="cost_price_cbm" slot-scope="data">
                      <span>{{ isCurrency(data.item.cost_price_cbm,decimal) }}</span>
                    </template>
                    <template slot="margin_cbm" slot-scope="data">
                      <span>{{ isCurrency(data.item.margin_cbm,decimal) +`(`+data.item.margin_percent_cbm+`%)`}}</span>
                    </template>
                  </ACCList2>
                </b-col>
              </b-row>
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
      propListFTL: {
        OptionUrl: "/OP/OP_PricingCosting",
        initialWhere:
          "ss_portfolio_id='" + this.getDataUser().portfolio_id + "'",
        LineNo: 0,
        PageLevel: 1,
        TabIndex: 1,
        OrderBy: "category ASC",
        SourceField: "",
        ParamView: "",
        ParamWhere: "",
      },
      propListLTL: {
        OptionUrl: "/OP/OP_PricingCosting",
        initialWhere:
          "ss_portfolio_id='" + this.getDataUser().portfolio_id + "'",
        LineNo: 2,
        PageLevel: 1,
        TabIndex: 1,
        OrderBy: "category ASC",
        SourceField: "",
        ParamView: "",
        ParamWhere: "",
      },
      search: "",
      titleList: "",
    };
  },
  computed: {
    paramFromList() {
      var param = this.$store.getters.getParamPage;
      if (param == null || param == undefined) {
        // this.doBack();
      } else {
        if (Object.keys(param).length < 1) {
          // this.doBack();
        } else {
          return param;
        }
      }
    },
  },
  methods: {
    onFTLEnter() {
      var param = {
        isEdit: false,
      };
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "OP_PricingCostingFTL" });
    },
    onLTLEnter() {
      var param = {
        isEdit: false,
      };
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "OP_PricingCostingLTL" });
    },
    onSearchEnter(data) {
      this.propListFTL.ParamWhere = this.search;
      this.propListLTL.ParamWhere = this.search;
      this.$refs.ref_OPPricingCostingFTL.doGetList("");
      this.$refs.ref_OPPricingCostingLTL.doGetList("");
    },
    doBack() {
      this.$router.go(-1);
    },
    rowClickedFTL(record, index) {
      console.log(record);
      var param = record;
      param.isView = true;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "OP_PricingCostingViewFTL" });
    },
    doViewClick(record, index) {},
    rowClickedLTL(record, index) {
      console.log(record);
      var param = record;
      param.isView = true;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "OP_PricingCostingViewLTL" });
    },
    doDoubleClick(record, index) {},
    doDeleteClick(record, index) {
      this.alertConfirmation("Are You Sure Want To Delete This Data ?").then(
        (ress) => {
          if (ress.value) {
            this.M_Delete(record, index);
          }
        }
      );
    },
    M_Delete(record, index) {
      var param = {
        option_url: "/OP/OP_PricingCosting",
        line_no: 0,
        id: record.row_id,
        lastupdatestamp: record.lastupdatestamp,
      };
      this.deleteJSON(this.getUrlCRUD(), param).then((response) => {
        // response from API
        if (response == null) return;

        this.alertSuccess("Data Has Been Deleted").then(() => {
          this.$refs.ref_OPPricingCostingFTL.doGetList("");
        });
      });
    },
    rowLink(url) {},
    M_PageSize() {},
    M_Pagination() {},
    M_Advance_Filter() {},
    M_Head_Table() {},
    refreshColumn() {},
  },
  mounted() {
    this.$refs.ref_OPPricingCostingFTL.doGetList("");
    this.$refs.ref_OPPricingCostingLTL.doGetList("");
  },
  created() {
    // this.$store.commit("setParamPage", {});
  },
};
</script>

<style>
</style>
