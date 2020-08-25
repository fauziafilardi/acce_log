<template>
  <div class="card">
    <div class="card__title">
      <b-row>
        <b-col style="max-width:fit-content !important;">
          <span>Ticket</span> &nbsp;
        </b-col>
        <b-col style="text-align: right;">
          <span>
            <ABSButton
              :text="'View All'"
              classButton="button button--back2"
              classIcon="icon-style-1"
              :disabled="false"
              @click="doViewALl"
            />
          </span>
        </b-col>
      </b-row>
    </div>
    <div class="card__body" style="height: 230px;">
      <div>
        <!-- <b-table
                  :responsive="true"
                  :striped="false"
                  :bordered="true"
                  :outlined="false"
                  :small="false"
                  :hover="false"
                  :dark="false"
                  :fixed="false"
                  :foot-clone="false"
                  :fields="Vendor.Header"
                  :items="Vendor.Data"
                  thStyle="padding: 5px !important;"
                >
                  <template v-slot:cell(no)="data">{{data.index + 1}}</template>
        </b-table>-->
        <ACCFormList
          :prop="propList"
          :title="''"
          @rowClicked="rowClicked"
          ref="ref_VendorList"
          @onRenderData="onRenderData"
        >
          <!-- <template slot="status" slot-scope="data">
                        <div :class="'Plan-Dot-' + (Status[data.item.status].variant)" style="font-size: 10px !important; padding-top: 9px !important;">{{data.item.status}}</div>
          </template>-->
        </ACCFormList>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      search: "",
      propList: {
        OptionUrl: "/OP/OP_Dashboard",
        LineNo: 7,
        initialWhere:
          "ss_portfolio_id='" + this.getDataUser().portfolio_id + "'",
        OrderBy: "ticket_no",
        SourceField: "",
        ParamView: "",
        PerPage: 6,
      },
      FilterC: "",
      FilterS: "",
      PlanExecution: [],
    };
  },
  computed: {},
  methods: {
    doViewALl() {
      this.$router.push({ name: "OP_Ticket" });
    },
    rowClicked(record, index) {
      var param = record;
      param.isEdit = true;
      param.isView = true;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "OP_TicketForm" });
    },

    RenderData() {
      this.$refs.ref_VendorList.doGetList("");
    },
  },
  mounted() {
    this.RenderData();
  },
};
</script>

<style scoped>
.card {
  border: 0px solid #e7eaec !important;
}
.card-header:first-child {
  background-color: #eeeeee !important;
}

.tab-content > .active {
  padding: 0px !important;
}

.isTabs {
  border-top-right-radius: 5px;
  border-top-left-radius: 5px;
  background-color: #999999;
  width: 81px;
  text-align: center;
  height: 30px;
  padding-top: 0.3%;
  margin-right: 5px;
}

.active {
  background-color: #333399 !important;
}
</style>