<template>
    <div class="card">
        <div class="card__title" style="padding-bottom: 5px !important;">
            <b-row>
            <b-col>
                <span>Execution Plan</span>
            </b-col>
            <!-- <b-col style="text-align: right;">
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
            </b-col> -->
            <b-col style="max-width: fit-content !important;" class="col-right">
                <span>
                <ABSButton
                    :text="'History'"
                    classButton="button button--back2"
                    classIcon="icon-style-1"
                    @click="onHistory"
                />
                </span>
                <span>
                <ABSButton
                    :text="'View All'"
                    classButton="button button--back2"
                    classIcon="icon-style-1"
                    @click="onViewAll"
                />
                </span>
            </b-col>
            </b-row>
        </div>
        <div class="card__body">
            <div class="card">
                <div
                    class="card__title"
                    style="background-color: rgb(227, 231, 238) !important; padding-bottom: unset;"
                >
                    <b-row>
                    <div
                        :class="'col-md-1 isTabs' + (FilterC == 'F' ? ' active' : '')"
                        style="cursor: pointer;"
                        @click="filterTable('C', 'F')"
                    >
                        <span style="font-size: 13px; color: white; font-weight: bold;">FTL</span>
                    </div>
                    <div
                        :class="'col-md-1 isTabs' + (FilterC == 'L' ? ' active' : '')"
                        style="cursor: pointer;"
                        @click="filterTable('C', 'L')"
                    >
                        <span style="font-size: 13px; color: white; font-weight: bold;">LTL</span>
                    </div>
                    <div
                        :class="'col-md-1 isTabs' + (FilterC == 'C' ? ' active' : '')"
                        style="cursor: pointer;"
                        @click="filterTable('C', 'C')"
                    >
                        <span style="font-size: 13px; color: white; font-weight: bold;">Console</span>
                    </div>
                    <div
                        :class="'col-md-1 isTabs' + (FilterC == 'P' ? ' active' : '')"
                        style="cursor: pointer;"
                        @click="filterTable('C', 'P')"
                    >
                        <span style="font-size: 13px; color: white; font-weight: bold;">Project</span>
                    </div>
                    <div
                        :class="'col isTabs' + (FilterC == 'R' ? ' active' : '')"
                        style="max-width: fit-content !important; cursor: pointer;"
                        @click="filterTable('C', 'R')"
                    >
                        <span style="font-size: 13px; color: white; font-weight: bold;">Return Empty</span>
                    </div>
                    <div
                      class="col col-right"
                      style="cursor: pointer;"
                    >
                      <!-- <span style="font-size: 13px; color: white; font-weight: bold;">POD</span> -->
                      <span>
                        <ABSButton
                            :text="'POD'"
                            classButton="button button--primary"
                            styleButton="background-color: #359a9a;"
                            classIcon="icon-style-1"
                            @click="goPOD"
                        />
                      </span>
                    </div>
                    </b-row>
                </div>
                <div
                    class="card__body"
                    style="background-color: rgb(227, 231, 238) !important; padding: unset; border-radius: 0px 0px 8px 8px;"
                >
                    <b-row style="min-width: 800px;">
                    <b-col
                        class="ChartLegend__Wrap"
                        style="min-width:712px; padding: 0px !important;"
                    >
                        <b-row
                        style="border-radius: 0px 0px 8px 8px; !important; border: solid 1px #ccc !important"
                        >
                        <b-col
                            style="border-radius: 0px 0px 0px 8px !important; cursor: pointer; background-color: white; border-right: solid 1px #ccc; border-bottom: solid 1px #ccc;"
                            @click="filterTable('S','')"
                        >
                            <div
                            :class="'Plan-Dot-Primary'"
                            style="margin-top: 10px !important; border-radius: 8px !important;"
                            >
                            <span>{{PlanExecution.length}}</span>
                            </div>
                            <div class="Plan-Dot-Text">All</div>
                        </b-col>
                        <template v-for="(data, index) in Status">
                          <b-col
                              v-bind:key="index"
                              style="margin-bottom: 10px; cursor: pointer;"
                              @click="filterTable('S', data)"
                              v-if="data.label !== 'POD'"
                          > 
                              <div
                              :class="'Plan-Dot-' + data.variant"
                              :style="'margin-top: 10px !important; width: 36px !important; height: 36px !important; padding-top: 9px; !important' + (FilterS == data.key ? 'font-weight: bold;' : '')"
                              >
                              <span>{{PlanExecution && PlanExecution.length > 0 ? PlanExecution.filter(x => x.status == data.key).length : 0}}</span>
                              </div>
                              <div
                              class="Plan-Dot-Text"
                              :style="FilterS == data.key ? 'font-weight: bold;' : ''"
                              >{{data.label}}</div>
                          </b-col>
                        </template>
                        </b-row>
                    </b-col>
                    </b-row>
                </div>
                <br>
                <div>
                    <ACCFormList
                        :prop="propList"
                        :title="''"
                        @rowClicked="rowClicked"
                        ref="ref_OrderList"
                        @onRenderData="onRenderData"
                    >
                        <template slot="status" slot-scope="data">
                        <div :class="'Plan-Dot-' + (Status[data.item.status].variant)" :style="(data.item.status == 'POD' ? 'font-size: 9px !important;' : 'font-size: 10px !important;') +  'padding-top: 9px !important;'">{{data.item.status}}</div>
                        </template>
                    </ACCFormList>
                </div>
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
        OptionUrl: "/OP/OP_Booking",
        LineNo: 2,
        initialWhere: "",
        OrderBy: "",
        SourceField: "",
        ParamView: "",
        PerPage: 8,
      },
      FilterC: "",
      FilterS: "",
      PlanExecution: [],
      Status: {
        NW: { key: "NW", label: "New", variant: "Magenta" },
        AS: { key: "AS", label: "Assign", variant: "Lime" },
        DP: { key: "DP", label: "Dispatch", variant: "Green" },
        AR: { key: "AR", label: "Arrived", variant: "Purple" },
        SL: { key: "SL", label: "Start Loading", variant: "Blue" },
        FL: { key: "FL", label: "Finish Loading", variant: "Orange" },
        GO: { key: "GO", label: "Get Out", variant: "Red" },
        AD: { key: "AD", label: "Arrive Destination", variant: "Gold" },
        SU: { key: "SU", label: "Start Unloading", variant: "LightGreen" },
        FU: { key: "FU", label: "Finish Unloading", variant: "Pink" },
        GD: { key: "GD", label: "Get Out Destination", variant: "Red" },
        POD: { key: "POD", label: "POD", variant: "LightGreen" },
      },
    };
  },
  computed: {},
  methods: {
    onHistory() {
      this.$router.push({name: "OP_PlanExecutionHistory"});
    },
    goPOD() {
      this.$router.push({name: "OP_PlanExecutionPODList"});
    },
    onViewAll() {
      this.$router.push({name: "OP_PlanExecution"});
    },
    rowClicked(record, index) {
        var param = record;
        this.$store.commit("setParamPage", param);
        //   console.log(record);
        switch (record.status) {
            case "NW":
            this.$router.push({ name: "OP_PlanExecutionNew" });
            break;
            case "AS":
            this.$router.push({ name: "OP_PlanExecutionAS" });
            break;
            case "DP":
            // code block
            this.$router.push({ name: "OP_PlanExecutionDP" });
            break;
            case "AR":
            this.$router.push({ name: "OP_PlanExecutionAR" });
            break;
            case "SL":
            this.$router.push({ name: "OP_PlanExecutionSL" });
            break;
            case "FL":
            this.$router.push({ name: "OP_PlanExecutionFL" });
            break;
            case "GO":
            this.$router.push({ name: "OP_PlanExecutionGO" });
            break;
            case "AD":
            this.$router.push({ name: "OP_PlanExecutionAD" });
            break;
            case "SU":
            this.$router.push({ name: "OP_PlanExecutionSU" });
            break;
            case "FU":
            this.$router.push({ name: "OP_PlanExecutionFU" });
            break;
            case "GD":
            this.$router.push({ name: "OP_PlanExecutionGD" });
            break;
            case "POD":
            this.$router.push({ name: "OP_PlanExecutionPOD" });
            break;
            default:
            this.$router.push({ name: "OP_ViewPlanExecution" });
        }

        // console.log(this.$refs.ref_OrderList.items)
    },
    filterTable(fr, data) {
      if (fr == "C") {
        this.FilterC = data;
        // this.FilterS = "";
        var str = "FTL";
        var whereStatus = this.FilterS && this.FilterS !== "" ? " AND status='"+this.FilterS+"'" : ""
        switch (data) {
          case "F":
            this.propList.initialWhere = "category='FTL'" + whereStatus;
            this.$refs.ref_OrderList.doGetList("");
            break;
          case "L":
            this.propList.initialWhere = "category='LTL'" + whereStatus;
            this.$refs.ref_OrderList.doGetList("");
            break;
          case "P":
            this.propList.initialWhere = "category='Project'" + whereStatus;
            this.$refs.ref_OrderList.doGetList("");
            break;
          case "C":
            this.propList.initialWhere = "category='Console'" + whereStatus;
            this.$refs.ref_OrderList.doGetList("");
            break;
          case "R":
            // this.propList.initialWhere = "category='Console'"
            // this.$refs.ref_OrderList.doGetList("");
            break;
          default:
            this.propList.initialWhere = "";
            this.$refs.ref_OrderList.doGetList("");
            break;
        }
      } else {
        // console.log(data);
        if (data == "") {
          this.FilterC = "";
          this.FilterS = data;
          this.propList.initialWhere = data;
          this.$refs.ref_OrderList.doGetList("");
        } else {
          // this.FilterC = "";
          this.FilterS = data.key;
          var whereCategory = ""
          if (this.FilterC == 'F') {
            whereCategory = "AND category='FTL'";
          }
          else if (this.FilterC == 'L') {
            whereCategory = "AND category='LTL'";
          }
          else if (this.FilterC == 'P') {
            whereCategory = "AND category='Project'";
          }
          else if (this.FilterC == 'C') {
            whereCategory = "AND category='Console'";
          }

          this.propList.initialWhere = "status='" + data.key + "'" + whereCategory;
          this.$refs.ref_OrderList.doGetList("");
        }
      }
    },
    RenderData() {
      this.$refs.ref_OrderList.doGetList("");
    },
    onRenderData(data) {
      if (this.PlanExecution.length == 0) {
        var x = data;
        this.PlanExecution = x;
      }
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