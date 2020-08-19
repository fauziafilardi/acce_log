<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Operation Petty Cash</span>
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
              <b-row>
                <b-col md="2">
                  <span
                    style="font-size: 15px; color: rgb(51, 51, 153); font-weight: bold;"
                  >{{Title}}</span>
                </b-col>
                <b-col>
                  <span>
                    <b-badge
                      :style="`font-size: 15px; font-weight: bold;background-color:#339; width: 175px; padding: 6px !important; border-radius: 4px !important; font-weight: normal !important;`"
                    >{{"On Hand : "+isCurrency(M_DataPost.onhand_amt,decimal)}}</b-badge>
                  </span>
                </b-col>
                <b-col>
                  <span>
                    <b-badge
                      :style="`font-size: 15px; font-weight: bold;background-color:#339; width: 175px; padding: 6px !important; border-radius: 4px !important; font-weight: normal !important;`"
                    >{{"Paid : "+isCurrency(M_DataPost.paid_amt,decimal)}}</b-badge>
                  </span>
                </b-col>
                <b-col>
                  <span>
                    <b-badge
                      :style="`font-size: 15px; font-weight: bold;background-color:#339; width: 175px; padding: 6px !important; border-radius: 4px !important; font-weight: normal !important;`"
                    >{{"Unpaid : "+isCurrency(M_DataPost.unpaid_amt,decimal)}}</b-badge>
                  </span>
                </b-col>
                <b-col>
                  <span>
                    <b-badge
                      :style="`font-size: 15px; font-weight: bold;background-color:#339; width: 175px; padding: 6px !important; border-radius: 4px !important; font-weight: normal !important;`"
                    >{{"Balance : "+isCurrency(M_DataPost.balance_amt,decimal)}}</b-badge>
                  </span>
                </b-col>
              </b-row>
              <b-row style="margin-top: 25px;">
                <b-col>
                  <ACCFormList
                    :prop="{}"
                    :title="''"
                    cStatic
                    :cHeader="PettyCash_H"
                    :cData="PettyCash_D"
                    @rowClicked="ListDropPickClick"
                    ref="ref_OP_PettyCash"
                    WithDeleteButton
                    @buttonDeleteClicked="doDeleteExtraList"
                  >
                    <!-- <template slot="ticket_date" slot-scope="data">
                                    <span>{{momentDateFormatting(data.item.ticket_date, "YYYY-MM-DD HH:mm")}}</span>
                    </template>-->
                  </ACCFormList>
                </b-col>
              </b-row>
            </div>
          </div>
        </b-col>
      </b-row>
      <ABSModal id="Show_Maps" ref="Show_Maps" size="lg">
        <template slot="content">
          <b-row>
            <b-col md="12" style="text-align: center;">
              <img :src="require('@/assets/map.png')" alt style="width: 100%;" />
            </b-col>
          </b-row>
        </template>
      </ABSModal>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      M_DataPost: null,
      propList: {
        OptionUrl: "/OP/OP_FleetAvailability",
        initialWhere:
          "ss_portfolio_id='" + this.getDataUser().portfolio_id + "'",
        LineNo: 1,
        PageLevel: 1,
        TabIndex: 1,
        OrderBy: "fleet ASC",
        SourceField: "",
        ParamView: "",
      },
      PettyCash_H: [
        {
          key: "row_number",
          label: "No",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 th-cus-center",
        },
        {
          key: "order_no",
          label: "Order No",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
        {
          key: "pickup_date",
          label: "Pick Up Date",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
        {
          key: "from_to",
          label: "From To",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
        {
          key: "fleet_type",
          label: "Fleet Type",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
        {
          key: "license_plate_no",
          label: "Fleet No",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
        {
          key: "company",
          label: "Company",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
        {
          key: "amount",
          label: "Amount",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
        {
          key: "status",
          label: "Status",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
      ],
      PettyCash_D: [],
      Title: "",
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
    doBack() {
      this.$router.go(-1);
    },
    rowClicked(record, index) {
      this.doViewClick(record, index);
    },
    doViewClick(record, index) {
      console.log(record);
      var param = this.paramFromList;
      param.detailList = record;
      if (record.fleet_status == "S") {
        param.isEdit = true;
        param.isView = true;
        this.$store.commit("setParamPage", param);
        this.$router.push({ name: "OP_FleetAvailabilityAssign" });
      } else if (record.fleet_status == "A") {
        param.isEdit = true;
        param.isView = true;
        this.$store.commit("setParamPage", param);
        this.$router.push({ name: "OP_FleetAvailabilityForm" });
      } else {
      }
    },
    rowClicked2(record, index) {
      console.log(record);
      // if(record.fleet_gps_id){
      this.$refs.Show_Maps._show();
      // }
      // this.doViewClick(record, index);
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
        option_url: "/OP/OP_FleetAvailability",
        line_no: 0,
        id: record.row_id,
        lastupdatestamp: record.lastupdatestamp,
      };
      this.deleteJSON(this.getUrlCRUD(), param).then((response) => {
        // response from API
        if (response == null) return;

        this.alertSuccess("Data Has Been Deleted").then(() => {
          this.$refs.ref_OPFleetAvailability.doGetList("");
        });
      });
    },
    rowLink(url) {},
    M_PageSize() {},
    M_Pagination() {},
    M_Advance_Filter() {},
    M_Head_Table() {},
    refreshColumn() {},
    GetDataBy() {
      var param = {
        option_url: "/OP/OP_PettyCash",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp,
      };

      this.getJSON(this.getUrlCRUD(), param).then((response) => {
        // response from API
        if (response == null) return;

        var data = JSON.parse(response.Data[0].fop_petty_cash_s)[0];
        this.M_DataPost = data;
        console.log(data);
        this.Title =
          this.paramFromList.coverage + " | " + this.paramFromList.user_id;
        // this.PlanDocument = !data.detail_document || data.detail_document == null || data.detail_document == undefined ? [] : data.detail_document

        // this.PettyCash_D = data.detail_order;
        for (let i = 0; i < data.detail_order.length; i++) {
          this.PettyCash_D.push({
            row_number: data.detail_order[i].row_number,
            order_no: data.detail_order[i].order_no,
            pickup_date: this.momentDateFormatting(
              data.detail_order[i].pickup_date,
              "DD-MM-YYYY HH:mm"
            ),
            from_to: data.detail_order[i].from_to,
            fleet_type: data.detail_order[i].fleet_type,
            license_plate_no: data.detail_order[i].license_plate_no,
            company: data.detail_order[i].company,
            amount: this.isCurrency(data.detail_order[i].amount, this.decimal),
            status: data.detail_order[i].status,
          });
        }
        // this.M_ClearForm();
      });
    },
  },
  mounted() {
    this.GetDataBy();
  },
  created() {
    // this.$store.commit("setParamPage", {});
  },
};
</script>

<style>
</style>
