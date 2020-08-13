<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <ACCList2
            :prop="propList"
            :title="'Console'"
            @rowClicked="rowClicked"
            @rowDblClicked="doDoubleClick"
            @rowLinkClick="rowLink"
            @pageSize="M_PageSize"
            @pagination="M_Pagination"
            @filter="M_Advance_Filter"
            @headTable="M_Head_Table"
            @refreshColumn="refreshColumn"
            ref="ref_ConsolePlan"
            WithRowId
          >
            <template slot="HeaderTable">
              <b-row>
                <b-col>LTL Order List</b-col>
                <b-col md="2">
                    <b-row>
                        <b-col style="max-width:fit-content !important;">
                            <label for="">Zone</label>
                        </b-col>
                        <b-col>
                            <ACCDropDown
                                @change="dofilterZone"
                                :prop="PI_Zone"
                                v-model="M_Console.Zone"
                                :label="M_Console.ZoneLabel"
                                ref="ref_Zone"
                            />
                        </b-col>
                    </b-row>
                </b-col>
              </b-row>
            </template>
            <template slot="row_id" slot-scope="data">
                <b-button
                    style="background-color: transparent; color: black; border: none; padding: unset !important;"
                    @click="doAdd(data.item)"
                >
                    <font-awesome-icon
                    icon="plus-circle"
                    class="icon-style-default"
                    style="margin-right: 5px;"
                    size="lg"
                    /> Add
                </b-button>
            </template>
          </ACCList2>
        </b-col>
      </b-row>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      PI_Zone: {
        dataLookUp: {
            LookUpCd:'GetZone',
            ColumnDB:'cm_zone_id',
            InitialWhere:"ss_portfolio_id='" + this.getDataUser().portfolio_id + "'",
            ParamWhere:'',
            OrderBy:'',
            ParamView:'',
            SourceField:'',
            DisplayLookUp:'zone_code'
        },
        cValidate: "",
        cName: "zone",
        ckey: false,
        cOrder: 2,
        cProtect: false,
        cParentForm: "OP_SL_PlanExecution",
        cStatic: false,
        cOption: [],
        cDisplayColumn: "zone_code",
        cInputStatus: this.inputStatus
      },
      propList: {
        OptionUrl: "/OP/OP_Order",
        initialWhere: "",
        LineNo: 5,
        PageLevel: 1,
        TabIndex: 1,
        OrderBy: "",
        SourceField: "",
        ParamView: "",
      },

      M_Console: {
        zone: "",
        zoneLabel: "",
      },
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
        }
  },
  methods: {
    doBack() {
      this.$router.go(-1);
    },
    rowClicked(record, index) {},
    doDoubleClick(record, index) {},
    doViewClick(record, index) {
    },
    doDeleteClick(record, index) {},
    rowLink(url) {},
    M_PageSize() {},
    M_Pagination() {},
    M_Advance_Filter() {},
    M_Head_Table() {},
    refreshColumn() {},
    onSearchEnter(data) {},
    onAddClick() {
    },

    dofilterZone(data) {
      this.$nextTick(() => {
        this.M_Console.zone = data.id
        this.M_Console.zoneLabel = data.label
        this.propList.initialWhere = "ss_portfolio_id='" + this.getDataUser().portfolio_id + "' AND fr_cm_zone_id="+this.paramFromList.fr_cm_zone_id+" AND to_cm_zone_id="+data.id;
        this.$refs.ref_ConsolePlan.doGetList("");
      });
    },
    doAdd(data) {
        this.alertConfirmation("Are You Sure Want To Add This Data ?").then(
          ress => {
            if (ress.value) {
              this.M_Save(data);
            }
          }
        );
    },
    M_Save(data) {
        console.log(data)
        var param = {
            option_url: "/OP/OP_Order",
            line_no: 5,
            ss_portfolio_id: this.paramFromList.ss_portfolio_id,
            ss_subportfolio_id: this.paramFromList.ss_subportfolio_id,
            console_op_order_id: this.paramFromList.row_id,
            op_order_id: data.row_id,
            tmp_fr_cm_zone_id: this.paramFromList.fr_cm_zone_id,
            tmp_to_cm_zone_id: this.paramFromList.to_cm_zone_id,
            tmp_fm_fleet_type_id: this.paramFromList.fm_fleet_type_id,
            tmp_schedule_date: this.paramFromList.pickup_date,
            user_input: this.getDataUser().user_id
        };

        this.postJSON(this.getUrlCRUD(), param).then(response => {
            if (response == null) return;
            this.alertSuccess(response.Message).then(() => {
                this.doBack();
            });
        });
    },
  },
  mounted() {
    this.propList.initialWhere = "ss_portfolio_id='" + this.getDataUser().portfolio_id + "' AND fr_cm_zone_id="+this.paramFromList.fr_cm_zone_id;
    this.$refs.ref_ConsolePlan.doGetList("");
  },
  created() {
  },
};
</script>

<style>
</style>