<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>View Field Clerk</span>
                </b-col>
                <b-col style="text-align: right;">
                  <span>
                    <ABSButton
                      :text="'Add Coverage Address'"
                      classButton="button button--back"
                      classIcon="icon-style-1"
                      @click="doAddItem"
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
                  <b-col md="2">
                    <div>
                      <!-- <img :src="M_NewProspect.path_file" alt width="100%" /> -->
                      <img :src="require('@/assets/paper.png')" alt style="width: 70px;" />
                    </div>
                  </b-col>
                  <b-col md="10">
                    <b-row>
                      <b-col>
                        <b-row>
                          <b-col class="col-right">
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
                      </b-col>
                    </b-row>
                    <br />
                    <b-row class="row-bordered">
                      <b-col md="6" offset="2">
                        <b-row class="row-view">
                          <b-col>
                            <span>
                              <label>Coverage</label>
                            </span>
                            <br />
                            <span>
                              <label>{{M_OpFieldClerk.coverage}}</label>
                            </span>
                          </b-col>
                        </b-row>
                        <b-row class="row-view">
                          <b-col>
                            <span>
                              <label>PIC</label>
                            </span>
                            <br />
                            <span>
                              <label>{{M_OpFieldClerk.user_name}}</label>
                            </span>
                          </b-col>
                          <b-col>
                            <span>
                              <label>Advanced Limit</label>
                            </span>
                            <br />
                            <span>
                              <label>{{M_OpFieldClerk.advanced_limit}}</label>
                            </span>
                          </b-col>
                          <b-col>
                            <span>
                              <label>Reinbursment Limit</label>
                            </span>
                            <br />
                            <span>
                              <label>{{M_OpFieldClerk.reinbursment_limit}}</label>
                            </span>
                          </b-col>
                        </b-row>
                        <!-- <b-row class="row-view">
                         
                        </b-row>
                        <b-row class="row-view">
                          
                        </b-row>-->
                        <b-row class="row-view">
                          <b-col>
                            <span>
                              <label>Descs</label>
                            </span>
                            <br />
                            <span>
                              <label>{{M_OpFieldClerk.descs}}</label>
                            </span>
                          </b-col>
                        </b-row>
                      </b-col>
                    </b-row>
                    <b-row class="row-bordered">
                      <b-col>
                        <b-row>
                          <b-col>
                            <label
                              style="font-size: 15px; color: #333399; font-weight: bold;"
                            >Coverage Address</label>
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col>
                            <!-- <div class="table--list" :id="'itemList'">
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
                                :fields="Items.Tb_Header"
                                :items="Items.Tb_Data"
                                class="table-sm table-style-3"
                                @row-clicked="doItemClick"
                              >
                                <template v-slot:cell(no)="data">{{data.index + 1}}</template>
                                <template v-slot:cell(row_id)="data">
                                  <span>
                                    <font-awesome-icon
                                      class="icon-style-default"
                                      icon="trash"
                                      size="lg"
                                      style="cursor: pointer;"
                                      @click.stop="Delete_Item(data.item)"
                                    />
                                  </span>
                                </template>
                              </b-table>
                            </div>-->
                            <ACCFormList
                              :prop="propList"
                              :title="'Maintenance Type'"
                              @rowClicked="rowClicked"
                              @rowDblClicked="doDoubleClick"
                              @rowLinkClick="rowLink"
                              @pageSize="M_PageSize"
                              @pagination="M_Pagination"
                              @filter="M_Advance_Filter"
                              @headTable="M_Head_Table"
                              @refreshColumn="refreshColumn"
                              ref="ref_MmMaintenanceType"
                              WithDeleteButton
                              @buttonDeleteClicked="doDeleteClick"
                            />
                          </b-col>
                        </b-row>
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
        OptionUrl: "/OP/OP_FieldClerk",
        LineNo: 1,
        initialWhere: "",
        OrderBy: "customer_name ASC",
        SourceField: "",
        ParamView: "",
      },
      M_OpFieldClerk: {
        op_field_clerk_id: 0,
        ss_portfolio_id: 0,
        coverage: "",
        user_id: "",
        user_name: "",
        advanced_limit: 0,
        reinbursment_limit: 0,
        descs: "",
        user_input: "",
        user_edit: "",
        time_input: "",
        time_edit: "",
        row_id: 0,
        lastupdatestamp: 0,
      },
      // Items: {
      //   Tb_Header: [
      //     {
      //       key: "no",
      //       label: "No",
      //       thClass: "HeaderACCList2 th-cus-center",
      //       tdClass: "ContentACCList2 notranslate th-cus-center",
      //     },
      //     {
      //       key: "customer_name",
      //       label: "Customer Name",
      //       thClass: "HeaderACCList2 M th-cus-center",
      //       tdClass: "ContentACCList2 notranslate",
      //     },
      //     {
      //       key: "address",
      //       label: "Address",
      //       thClass: "HeaderACCList2 L th-cus-center",
      //       tdClass: "ContentACCList2 notranslate th-cus-center",
      //     },
      //     {
      //       key: "row_id",
      //       label: " ",
      //       thClass: "HeaderACCList2 th-cus-center",
      //       tdClass: "ContentACCList2 notranslate th-cus-center",
      //     },
      //   ],
      //   Tb_Data: [],
      // },
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
    doAddItem() {
      var param = this.paramFromList;
      param.isEdit = false;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "OP_FieldClerkDtlForm" });
    },
    doBack() {
      this.$router.go(-1);
    },
    doItemClick(record, index) {
      var param = this.paramFromList;
      param.isEdit = true;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "OP_FieldClerkForm" });
    },
    doEdit() {
      var param = this.paramFromList;
      param.isView = false;
      param.isEdit = true;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "OP_FieldClerkForm", params: param });
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
    M_Delete() {
      var param = {
        option_url: "/OP/OP_FieldClerk",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp,
      };
      this.deleteJSON(this.getUrlCRUD(), param).then((response) => {
        if (response == null) return;
        this.alertSuccess("Data Has Been Deleted").then(() => {
          this.doBack();
        });
      });
    },
    doDeleteClick(record, index) {
      this.alertConfirmation("Are You Sure Want To Delete This Data ?").then(
        (ress) => {
          if (ress.value) {
            this.M_DeleteI(record, index);
          }
        }
      );
    },
    M_DeleteI(record, index) {
      var param = {
        option_url: "/OP/OP_FieldClerk",
        line_no: 1,
        id: record.row_id,
        lastupdatestamp: record.lastupdatestamp,
      };
      this.deleteJSON(this.getUrlCRUD(), param).then((response) => {
        if (response == null) return;
        this.alertSuccess("Data Has Been Deleted").then(() => {
          // this.doBack();
          this.$refs.ref_MmMaintenanceType.doGetList("");
        });
      });
    },
    // getItems() {
    //   var param = {
    //     option_function_cd: "GetListOPMaintenanceTypeDtl",
    //     module_cd: "OP",
    //     row_id: this.paramFromList.row_id,
    //   };

    //   this.CallFunction(param).then((response) => {
    //     if (response == null) return;
    //     this.Items.Tb_Data = response.Data;
    //   });
    // },
    GetDataBy() {
      var param = {
        option_url: "/OP/OP_FieldClerk",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp,
      };

      this.getJSON(this.getUrlCRUD(), param).then((response) => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];

        this.M_OpFieldClerk = {
          op_field_clerk_id: data.op_field_clerk_id,
          ss_portfolio_id: data.ss_portfolio_id,
          coverage: data.coverage__tb_1,
          user_id: data.user_id__lo_2,
          user_name: data.user_id__lo_2,
          advanced_limit: data.advanced_limit__tb_3,
          reinbursment_limit: data.reinbursment_limit__tb_4,
          descs: data.descs__tb_5,
          user_input: data.user_input,
          user_edit: data.user_edit,
          time_input: data.time_input,
          time_edit: data.time_edit,
          row_id: data.row_id,
          lastupdatestamp: data.lastupdatestamp,
        };
        // this.getItems();
        this.propList.initialWhere =
          "ss_portfolio_id='" +
          this.getDataUser().portfolio_id +
          "' and op_field_clerk_id =" +
          this.paramFromList.row_id;
        this.$refs.ref_MmMaintenanceType.doGetList("");
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
</style>
