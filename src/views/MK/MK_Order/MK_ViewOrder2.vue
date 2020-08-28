<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
          <b-col md="12">
            <ACCList2
                :prop="propList"
                :title="'Order'"
                @rowClicked="rowClicked"
                ref="ref_ViewOrder"
            >
                <template slot="HeaderTable">
                    <b-row>
                        <b-col>
                            <span>{{ M_Quotation.customer }}</span>
                            <br />
                            <span>
                                <font-awesome-icon
                                class="icon-style-default"
                                icon="map-marker-alt"
                                size="sm"
                                />
                                &nbsp;
                                {{ M_Quotation.address }}
                            </span>
                            <br />
                            <span>
                                <font-awesome-icon
                                class="icon-style-default"
                                icon="phone-square-alt"
                                size="sm"
                                />
                                {{ M_Quotation.phone_no }}
                            </span> &nbsp;
                            <span>
                                <font-awesome-icon
                                class="icon-style-default"
                                icon="envelope"
                                size="sm"
                                />
                                {{ M_Quotation.email }}
                            </span> &nbsp;
                            <span>
                                <font-awesome-icon
                                class="icon-style-default"
                                icon="globe-americas"
                                size="sm"
                                />
                                {{ M_Quotation.website }}
                            </span>
                            <br />
                            <span>
                                <font-awesome-icon class="icon-style-default" icon="user" size="sm" />
                                {{ M_Quotation.pic }}
                            </span> &nbsp;
                            <span>
                                <font-awesome-icon
                                class="icon-style-default"
                                icon="phone-square-alt"
                                size="sm"
                                />
                                {{ M_Quotation.pic_phone_no }}
                            </span>
                        </b-col>
                    </b-row>
                </template>
                <template slot="status" slot-scope="data">
                  <div :class="'Plan-Dot-' + (Status[data.item.status].variant)" :style="(data.item.status == 'POD' ? 'font-size: 9px !important;' : 'font-size: 10px !important;') +  'padding-top: 9px !important;'">{{data.item.status}}</div>
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
        propList: {
            OptionUrl: "/MK/MK_Order",
            initialWhere: "",
            LineNo: 1,
            PageLevel: 1,
            TabIndex: 1,
            OrderBy: "",
            SourceField: "",
            ParamView: "",
            PerPage: 1000
        },
      M_Quotation: {
        customer: "",
        fulladdress: "",
        address: "",
        phone_no: "",
        email: "",
        website: "",
        pic: "",
        pic_phone_no: ""
      },

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
    doAdd() {
      var url = "MK_AddQuotation";
      if (!url || url == "" || url == undefined) return;
      var param = {
        // option_url: this.getOptionUrl(),
        // title: this.title,
        isEdit: false
      };
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: url });
    },
    doViewClick(record, index) {
      var param = record;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "MK_ViewOrder" });
    },
    rowClicked(record, index) {
      var param = this.paramFromList;
      param.isEdit = record == null ? false : true;
      param.DetailList = record;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "ViewDetailOrder" });
    },
    rowClicked2(record, index) {
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
    doBack() {
      this.$router.go(-1);
    },
    M_ClearForm() {
      this.M_Quotation = {
        customer: "",
        fulladdress: "",
        address: "",
        phone_no: "",
        email: "",
        website: "",
        pic: "",
        pic_phone_no: ""
      };
    },
    GetDataBy() {
      var param = {
        option_url: "/MK/MK_Customer",
        line_no: 3,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };

      this.getJSON(this.getUrlCRUD(), param).then(response => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];

        this.M_Quotation = {
          customer: data.name,
          fulladdress:
            data.address +
            ", " +
            data.district +
            ", " +
            data.city +
            ", " +
            data.province +
            " - " +
            data.country,
          address: data.address,
          phone_no: data.phone_no && data.phone_no !== "" ? data.phone_no : "-",
          email: data.email && data.email !== "" ? data.email : "-",
          website: data.website && data.website !== "" ? data.website : "-",
          pic:
            data.contact_person && data.contact_person !== ""
              ? data.contact_person
              : "-",
          pic_phone_no:
            data.contact_phone_no && data.contact_phone_no !== ""
              ? data.contact_phone_no
              : "-"
        };

        // this.doGetlist(this.search);
        this.propList.initialWhere = "cm_contact_id=" + this.paramFromList.cm_contact_id;
        this.$refs.ref_ViewOrder.doGetList("");
      });
    }
  },
  mounted() {
    this.M_ClearForm();
    this.GetDataBy();
  }
};
</script>

<style scoped>
@media screen and (max-width: 360px) {
  ul.pagination {
    margin-top: 15px !important;
  }
}
</style>>