<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Quotation</span>
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
              <b-form :data-vv-scope="'MK_AddQuotation'" :data-vv-value-path="'MK_AddQuotation'">
                <b-row>
                  <b-col md="2" style="text-align: center;">
                    <b-row>
                      <b-col>
                        <img :src="require('@/assets/paper.png')" alt style="width: 70px;" />
                      </b-col>
                    </b-row>

                    <b-row style="margin-top:25px;">
                      <b-col>
                        <span>
                          <b-badge
                            :style="`font-size: 12px; font-weight: bold;background-color:#339; width: 100px; padding: 6px !important; border-radius: 4px !important; font-weight: normal !important;`"
                          >{{M_Quotation.status}}</b-badge>
                        </span>
                      </b-col>
                    </b-row>
                  </b-col>
                  <b-col md="10">
                    <b-row>
                      <b-col md="6">
                        <b-row>
                          <b-col>
                            <span>{{ M_Quotation.customer }}</span>
                            <br />
                            <span>
                              <font-awesome-icon
                                class="icon-style-default"
                                icon="map-marker-alt"
                                size="lg"
                              />
                              &nbsp; &nbsp;
                              {{ M_Quotation.fulladdress }}
                            </span>
                            <br />
                            <span>
                              <font-awesome-icon
                                class="icon-style-default"
                                icon="phone-square-alt"
                                size="lg"
                              />
                              &nbsp; &nbsp;
                              {{ M_Quotation.phone_no }}
                            </span> &nbsp; &nbsp; &nbsp;
                            <span>
                              <font-awesome-icon
                                class="icon-style-default"
                                icon="globe-americas"
                                size="lg"
                              />
                              &nbsp; &nbsp;
                              {{ M_Quotation.website }}
                            </span>
                            <br />
                            <span>
                              <font-awesome-icon class="icon-style-default" icon="user" size="lg" />
                              &nbsp; &nbsp; {{ M_Quotation.pic }}
                            </span> &nbsp; &nbsp; &nbsp;
                            <span>
                              <font-awesome-icon
                                class="icon-style-default"
                                icon="phone-square-alt"
                                size="lg"
                              />
                              &nbsp; &nbsp;
                              {{ M_Quotation.pic_phone_no }}
                            </span> &nbsp; &nbsp; &nbsp;
                            <span>
                              <font-awesome-icon
                                class="icon-style-default"
                                icon="envelope"
                                size="lg"
                              />
                              &nbsp; &nbsp;
                              {{ M_Quotation.email }}
                            </span>
                          </b-col>
                        </b-row>
                      </b-col>
                    </b-row>
                    <hr />
                    <b-row>
                      <b-col
                        style="max-width: fit-content !important; margin-right: 20px; padding-bottom: 5px"
                        class="row-view"
                      >
                        <span>
                          <label style="margin-bottom: 0px !important;">Quotation Number</label>
                        </span>
                        <br />
                        <span style="color: #999999;">{{ M_Quotation.quotation_no }}</span>
                      </b-col>
                      <b-col
                        style="max-width: fit-content !important; margin-right: 20px; padding-bottom: 5px"
                        class="row-view"
                      >
                        <span>
                          <label style="margin-bottom: 0px !important;">Valid Thru</label>
                        </span>
                        <br />
                        <span
                          style="color: #999999;"
                        >{{ M_Quotation.date + ' - ' + M_Quotation.date2}}</span>
                      </b-col>
                      <b-col
                        style="max-width: fit-content !important; margin-right: 20px; padding-bottom: 5px"
                        class="row-view"
                      >
                        <span>
                          <label style="margin-bottom: 0px !important;">Marketing Name</label>
                        </span>
                        <br />
                        <span style="color: #999999;">{{ paramFromList.marketing_name }}</span>
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col
                        style="max-width: fit-content !important; margin-right: 20px; padding-bottom: 5px"
                        class="row-view"
                      >
                        <span>
                          <label style="margin-bottom: 0px !important;">Project Name</label>
                        </span>
                        <br />
                        <span style="color: #999999;">{{ M_Quotation.project_name }}</span>
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col
                        style="max-width: fit-content !important; margin-right: 20px; padding-bottom: 5px"
                        class="row-view"
                      >
                        <span>
                          <label style="margin-bottom: 0px !important;">Description</label>
                        </span>
                        <br />
                        <span style="color: #999999; text-align: justify;">{{ M_Quotation.descs }}</span>
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col
                        style="max-width: fit-content !important; margin-right: 20px; padding-bottom: 5px"
                        class="row-view"
                      >
                        <span>
                          <label style="margin-bottom: 0px !important;">Extra Pick/Drop Charges</label>
                        </span>
                        <br />
                        <span style="color: #999999;">{{ M_Quotation.extra_charge }}</span>
                      </b-col>
                      <b-col
                        style="max-width: fit-content !important; margin-right: 20px; padding-bottom: 5px"
                        class="row-view"
                      >
                        <span>
                          <label style="margin-bottom: 0px !important;">Over Night Charges</label>
                        </span>
                        <br />
                        <span style="color: #999999;">{{ M_Quotation.overnight_charge }}</span>
                      </b-col>
                    </b-row>
                    <br />
                    <b-row>
                      <b-col>
                        <span
                          style="color: #333399; font-size: 15px; font-weight: bold;"
                        >Selling Price</span>
                        <div class="table--list" id="selling_price_tb">
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
                            :fields="SellingHeader"
                            :items="SellingItems"
                            class="table-sm table-style-3"
                          >
                            <template v-slot:cell(from_address)="data">
                              <span>{{data.item.from_address + " - " + data.item.to_address}}</span>
                            </template>

                            <template v-slot:cell(from_zone)="data">
                              <span>{{data.item.from_zone + " - " + data.item.to_zone}}</span>
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
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col>
                        <span
                          style="color: #333399; font-size: 15px; font-weight: bold;"
                        >Costing &nbsp;</span>
                        <span @click="doAddCosting" style="width: 20%; cursor: pointer;">
                          <font-awesome-icon
                            class="icon-style-default"
                            icon="plus-circle"
                            size="lg"
                          />&nbsp;
                          <span
                            style="position: absolute; font-size: 15px; color: #333399; font-weight: bold;"
                          >Add Costing</span>
                        </span>
                        <div class="table--list" id="costing_tb">
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
                            :fields="CostingHeader"
                            :items="CostingItems"
                            class="table-sm table-style-3"
                            @row-clicked="doEditCosting"
                          >
                            <template v-slot:cell(no)="data">{{data.index + 1}}</template>

                            <template
                              v-slot:cell(cost_value)="data"
                            >{{isCurrency(data.item.cost_value, decimal)}}</template>

                            <template v-slot:cell(row_id)="data">
                              <ABSButton
                                :icon="'trash'"
                                classButton="button button--delete"
                                classIcon="icon-style-1"
                                @click="deleteClicked(data.item, data.index)"
                              />
                            </template>
                          </b-table>
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
      M_Quotation: {
        customer: "",
        fulladdress: "",
        address: "",
        phone_no: "",
        email: "",
        website: "",
        pic: "",
        pic_phone_no: "",
        date: "",
        type: "",
        quotation_no: "",
        project_name: "",
        descs: "",
        project_value: "",
        date: "",
        date2: "",
        extra_charge: "",
        overnight_charge: "",
      },
      AllData: {},
      responses: {},
      SellingHeader: [
        {
          key: "from_address",
          label: "From - To Address",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
        {
          key: "from_zone",
          label: "From - To Zone",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
        {
          key: "category",
          label: "Category",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 S th-cus-center",
        },
        {
          key: "type",
          label: "Type",
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
      SellingItems: [],
      CostingHeader: [
        {
          key: "no",
          label: "No",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 th-cus-center",
        },
        {
          key: "cost_type",
          label: "Cost Type",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 M th-cus-center",
        },
        {
          key: "descs",
          label: "Description",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 M th-cus-center",
        },
        {
          key: "cost_value",
          label: "Value",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 M th-cus-center",
        },
        {
          key: "row_id",
          label: " ",
          tdClass: "ContentACCList2 notranslate th-cus-center",
          thClass: "HeaderACCList2 th-cus-center",
        },
      ],
      CostingItems: [],
    };
  },
  computed: {
    paramFromList() {
      var param = this.$store.getters.getParamPage;
      console.log(param);
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
    ButtonStatus() {
      return this.$store.getters.getButtonStatus;
    },
  },
  methods: {
    doBack() {
      this.$router.go(-1);
    },
    doEditCosting(record, index) {
      var param = this.paramFromList;
      param.isEdit = true;
      param.ForCosting = {
        mk_quotation_id: this.paramFromList.row_id,
        mk_quotation_price_id: this.M_Quotation.mk_quotation_price_id,
        row_id: record.row_id,
        lastupdatestamp: record.lastupdatestamp,
      };
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "MK_QuotationCostingForm_D" });
    },
    doAddCosting() {
      var param = this.paramFromList;
      param.isEdit = false;
      param.ForCosting = {
        mk_quotation_id: this.paramFromList.row_id,
        mk_quotation_price_id: this.M_Quotation.mk_quotation_price_id,
      };
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "MK_QuotationCostingForm_D" });
    },
    deleteClicked(record, index) {
      this.alertConfirmation("Are You Sure Want To Delete This Data ?").then(
        (ress) => {
          if (ress.value) {
            this.M_Delete(record);
          }
        }
      );
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
        pic_phone_no: "",
        date: "",
        type: "",
        quotation_no: "",
        project_name: "",
        descs: "",
        project_value: "",
        date: "",
        date2: "",
        extra_charge: "",
        overnight_charge: "",
      };
    },
    M_Delete(record) {
      var param = {
        option_url: "/MK/MK_QuotationCosting",
        line_no: 1,
        id: record.row_id,
        lastupdatestamp: record.lastupdatestamp,
      };
      this.deleteJSON(this.getUrlCRUD(), param).then((response) => {
        // response from API
        if (response == null) return;

        this.alertSuccess("Data Has Been Deleted").then(() => {
          this.GetCostingList();
        });
      });
    },
    GetDataBy() {
      var param = {
        option_url: "/MK/MK_QuotationCosting",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp,
      };

      this.getJSON(this.getUrlCRUD(), param).then((response) => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];

        this.AllData = data;

        this.M_Quotation = {
          customer: data.name,
          fulladdress: data.address,
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
              : "-",
          type: data.type && data.type !== "" ? data.type : "-",
          quotation_no:
            data.quotation_no && data.quotation_no !== ""
              ? data.quotation_no
              : "-",
          project_name:
            data.project_name && data.project_name !== ""
              ? data.project_name
              : "-",
          descs: data.descs && data.descs !== "" ? data.descs : "-",
          project_value:
            data.project_value && data.project_value !== ""
              ? this.isCurrency(data.project_value, this.decimal)
              : "-",
          date:
            data.start_date && data.start_date !== ""
              ? this.momentDateFormatting(
                  new Date(data.start_date),
                  "DD-MMM-YYYY"
                )
              : "-",
          date2:
            data.expired_date && data.expired_date !== ""
              ? this.momentDateFormatting(
                  new Date(data.expired_date),
                  "DD-MMM-YYYY"
                )
              : "-",
          status: data.status == "P" ? "Proposed" : "Pending",
          extra_charge: this.isCurrency(
            data.extra_pick_drop_charges,
            this.decimal
          ),
          overnight_charge: this.isCurrency(
            data.over_night_charges,
            this.decimal
          ),
          mk_quotation_price_id: data.mk_quotation_price_id,
        };

        this.SellingItems = [
          {
            from_address:
              data.from_addr && data.from_addr !== "" ? data.from_addr : "",
            to_address: data.to_addr && data.to_addr !== "" ? data.to_addr : "",
            from_zone:
              data.from_zone && data.from_zone !== "" ? data.from_zone : "",
            to_zone: data.to_zone && data.to_zone !== "" ? data.to_zone : "",
            category:
              data.category && data.category !== "" ? data.category : "",
            type: data.type && data.type !== "" ? data.type : "",
            selling_price:
              data.selling_price && data.selling_price !== ""
                ? data.selling_price
                : 0,
            cost_price:
              data.cost_price && data.cost_price !== "" ? data.cost_price : 0,
            margin: data.margin && data.margin !== "" ? data.margin : 0,
          },
        ];

        this.GetCostingList();
      });
    },
    GetCostingList() {
      var param = {
        option_function_cd: "GetListMkQuotCost",
        module_cd: "MK",
        row_id: this.paramFromList.row_id,
      };

      this.CallFunction(param).then((response) => {
        if (response == null) return;
        var data = response.Data;

        this.CostingItems = data;
      });
    },
  },
  mounted() {
    this.M_ClearForm();
    this.GetDataBy();
  },
};
</script>

<style>
</style>