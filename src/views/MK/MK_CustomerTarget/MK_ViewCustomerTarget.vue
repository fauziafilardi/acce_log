<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card">
            <div class="card__title" style="padding-bottom: 5px !important;">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Customer Target</span>
                </b-col>
                <b-col class="col-right">
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
                    <b-col md="2">
                        <b-row>
                            <b-col style="max-width:fit-content !important;">
                                Year &nbsp;&nbsp;
                            </b-col>
                            <b-col>
                                <!-- <b-form-select v-if="inputStatus !== 'view'"
                                    id="cmbYear"
                                    v-model="filterAction"
                                    :options="cmbYear"
                                    :disabled="isDisableTable"
                                    style="height: 22px !important; width: 100% !important; margin-bottom: 5px;"
                                ></b-form-select> -->

                                <span> {{ paramFromList.years }} </span>
                            </b-col>
                        </b-row>
                    </b-col>
                    <b-col md="4">
                        <b-row>
                            <b-col style="max-width:fit-content !important;">
                                Customer &nbsp;&nbsp;
                            </b-col>
                            <b-col>
                                <!-- <b-form-select v-if="inputStatus !== 'view'"
                                    id="cmbMarketing"
                                    v-model="filterActionM"
                                    :options="cmbMarketing"
                                    :disabled="isDisableTable"
                                    style="height: 22px !important; width: 100% !important; margin-bottom: 5px;"
                                ></b-form-select> -->

                                <span> {{ paramFromList.customer_name }} </span>
                            </b-col>
                        </b-row>
                    </b-col>
                    <b-col class="col-right">
                        <span>
                            <ABSButton
                            :text="'Delete'"
                            classButton="button button--default"
                            classIcon="icon-style-1"
                            @click="doDelete"
                            />
                        </span>
                        <span>
                            <ABSButton
                            :text="'Edit'"
                            classButton="button button--default"
                            classIcon="icon-style-1"
                            @click="doEdit"
                            />
                        </span>
                    </b-col>
                </b-row>

              <div class="table--list" :id="'CustomerTarget'" style="margin-top: 10px">
                <b-table
                  :responsive="true"
                  :striped="false"
                  :bordered="false"
                  :outlined="false"
                  :small="false"
                  :hover="true"
                  :dark="false"
                  :fixed="false"
                  :foot-clone="false"
                  :fields="fieldHeader"
                  :items="items"
                  class="table-sm table-style-3"
                >
                    <template v-slot:cell(ftl)="data">
                        <ACCTextBox v-if="inputStatus !== 'view'"
                          :prop="{
                                cValidate: '',
                                cName: 'ftl_' + data.index,
                                cOrder: 1,
                                cKey: false,
                                cType: 'decimal',
                                cProtect: false,
                                cParentForm: 'CustomerTarget',
                                cDecimal: 2,
                                cInputStatus: 'new'
                          }"
                          v-model="data.item.ftl"
                          :ref="'ref_ftl_' + data.index"
                        />

                        <span v-else> {{data.item.ftl}} </span>
                    </template>

                    <template v-slot:cell(ltl)="data">
                        <ACCTextBox v-if="inputStatus !== 'view'"
                          :prop="{
                                cValidate: '',
                                cName: 'ltl_' + data.index,
                                cOrder: 2,
                                cKey: false,
                                cType: 'decimal',
                                cProtect: false,
                                cParentForm: 'CustomerTarget',
                                cDecimal: 2,
                                cInputStatus: 'new'
                          }"
                          v-model="data.item.ltl"
                          :ref="'ref_ltl_' + data.index"
                        />

                        <span v-else> {{data.item.ltl}} </span>
                    </template>

                    <template v-slot:cell(project)="data">
                        <ACCTextBox v-if="inputStatus !== 'view'"
                          :prop="{
                                cValidate: '',
                                cName: 'project_' + data.index,
                                cOrder: 3,
                                cKey: false,
                                cType: 'decimal',
                                cProtect: false,
                                cParentForm: 'CustomerTarget',
                                cDecimal: 2,
                                cInputStatus: 'new'
                          }"
                          v-model="data.item.project"
                          :ref="'ref_project_' + data.index"
                        />

                        <span v-else> {{data.item.project}} </span>
                    </template>
                    
                    <template v-slot:cell(rental)="data">
                        <ACCTextBox v-if="inputStatus !== 'view'"
                          :prop="{
                                cValidate: '',
                                cName: 'rental_' + data.index,
                                cOrder: 4,
                                cKey: false,
                                cType: 'decimal',
                                cProtect: false,
                                cParentForm: 'CustomerTarget',
                                cDecimal: 2,
                                cInputStatus: 'new'
                          }"
                          v-model="data.item.rental"
                          :ref="'ref_rental_' + data.index"
                        />

                        <span v-else> {{data.item.rental}} </span>
                    </template>

                    <template v-slot:cell(total)="data">
                        <span> {{data.item.total}} </span>
                    </template>

                </b-table>
              </div>
            </div>
            <div class="card__footer" style="padding-bottom: 10px;">
                <!-- <b-row>
                    <b-col md="12" style="text-align: center;">
                        <ABSButton
                            :text="'Save'"
                            classButton="btn btn--default"
                            classIcon="icon-style-1"
                            @click="doSave"
                            styleButton="height: 40px;width: 75%;"
                        />
                    </b-col>
                </b-row> -->
            </div>
            <iframe name="print_frame" width="0" height="0" frameborder="0" src="about:blank"></iframe>
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
        initialWhere: "",
        LineNo: 0,
        PageLevel: 1,
        TabIndex: 1,
        OrderBy: "",
        SourceField: "",
        ParamView: ""
      },

      //For List
      cmbMarketing: [],
      cmbYear: [],
      WithViewButton: false,
      isFirst: false,
      selected: false,
      rowSelected: [],
      dataSelected: [],
      rowSel: -1,
      filterActionM: "",
      filterAction: "",

      search: "",
      isSearchDisable: false,
      fieldHeader: [],
      items: [],
      firstSort: true,
      sort: "",

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

      sortedField: [],
      isDisableTable: false,
      responses: [],

      M_Target: {
          cm_contact_id: '',
          customer_name: ''
      }
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
        inputStatus() {
            var param = this.$store.getters.getParamPage;
            if (param.isEdit && param.isEdit === true) {
                return "edit";
            } else if (param.isView && param.isView === true) {
                return "view";
            } else {
                return "new";
            }
        }
  },
  methods: {
        doBack() {
            this.$router.go(-1);
        },
        doDelete() {
            this.alertConfirmation("Are You Sure Want To Delete ?")
            .then(ress => {
                if (ress.value) {
                    this.M_Delete();
                }
            })
        },
        doEdit() {
            var param = this.paramFromList;
            param.isView = false;
            param.isEdit = true;
            this.$store.commit("setParamPage", param);
            this.$router.push({ name: "MK_AddCustomerTarget" });
        },
    rowClicked(record, index) {},
    doDoubleClick(record, index) {},
    doViewClick(record, index) {
      //target ntr
    },
    rowLink(url) {},
    M_PageSize() {},
    M_Pagination() {},
    M_Advance_Filter() {},
    M_Head_Table() {},
    refreshColumn() {},
    onSearchEnter(data) {
    },
    onTeamClick() {},
    onCustomerListClick() {},

    dofilterAction() {
    },
    dofilterActionM(data) {
        console.log(data)
        this.M_Target.customer_name = data.customer_name;
    },
    doGetList2() {
        this.$store.commit('setStatusLoader', true)
        var param = {
            option_function_cd: "GetCustomerTarget",
            module_cd: "MK",
            ss_portfolio_id: this.getDataUser().portfolio_id,
            cm_contact_id: this.paramFromList.cm_contact_id,
            year: this.paramFromList.years
        };

        this.CallFunction(param).then(response => {
            this.$store.commit('setStatusLoader', false)
            if (response == null) return

            var data = response.Data;
            for (let i = 0; i < this.items.length; i++) {
                var ftl = data[i] !== undefined ? (data[i].ftl_amt && data[i].ftl_amt !== '' ? data[i].ftl_amt : 0) : 0
                var ltl = data[i] !== undefined ? (data[i].ltl_amt && data[i].ltl_amt !== '' ? data[i].ltl_amt : 0) : 0
                var project = data[i] !== undefined ? (data[i].project_amt && data[i].project_amt !== '' ? data[i].project_amt : 0) : 0
                var rental = data[i] !== undefined ? (data[i].rental_amt && data[i].rental_amt !== '' ? data[i].rental_amt : 0) : 0

                this.items[i].ftl = this.isCurrency(ftl, this.decimal)
                this.items[i].ltl = this.isCurrency(ltl, this.decimal)
                this.items[i].project = this.isCurrency(project, this.decimal)
                this.items[i].rental = this.isCurrency(rental, this.decimal)
                this.items[i].total = this.isCurrency((ftl + ltl + project + rental), this.decimal)
            }
        })
    },
    getYear() {
        var param = {
            option_function_cd: "GetYearMarketingTarget",
            module_cd: "MK",
            user_id: this.getDataUser().user_id
        };
        
        this.CallFunction(param).then(response => {
          if (response == null) return
            var data = response.Data;

            this.filterAction = Object.keys(this.paramFromList).length > 0 ? this.paramFromList.years : data[0].years;

            for (let i = 0; i < data.length; i++) {
                this.cmbYear.push({value: data[i].years, text: data[i].years});
            }
        })
    },
    getCustomer() {
        var param = {
            option_function_cd: "GetCustomer",
            module_cd: "MK",
            user_id: this.getDataUser().user_id
        };

        this.CallFunction(param).then(response => {
            if (response == null) return
            var data = response.Data;

            this.filterActionM = Object.keys(this.paramFromList).length > 0 ? this.paramFromList.cm_contact_id : data[0].cm_contact_id;
            this.M_Target.cm_contact_id = Object.keys(this.paramFromList).length > 0 ? this.paramFromList.cm_contact_id : data[0].cm_contact_id;
            this.M_Target.customer_name = Object.keys(this.paramFromList).length > 0 ? this.paramFromList.customer_name : data[0].customer_name;

            for (let i = 0; i < data.length; i++) {
                if (data[i].cm_contact_id == this.filterActionM) {
                    this.M_Target.customer_name = data[i].customer_name
                }
                this.cmbMarketing.push({value: data[i].cm_contact_id, text: data[i].cm_contact_id + ' - ' + data[i].customer_name});
            }
        })
    },
    renderTable() {
        this.fieldHeader = [
            {
                value: 1,
                key: "no",
                thClass: "HeaderACCList2",
                tdClass: "ContentACCList2 notranslate",
                label: "No"
            },
            {
                value: 2,
                key: "month",
                thClass: "HeaderACCList2 M",
                tdClass: "ContentACCList2 notranslate",
                label: "Month"
            },
            {
                value: 3,
                key: "ftl",
                thClass: "HeaderACCList2 M",
                tdClass: "ContentACCList2 notranslate",
                label: "FTL"
            },
            {
                value: 4,
                key: "ltl",
                thClass: "HeaderACCList2 M",
                tdClass: "ContentACCList2 notranslate",
                label: "LTL"
            },
            {
                value: 5,
                key: "project",
                thClass: "HeaderACCList2 M",
                tdClass: "ContentACCList2 notranslate",
                label: "Project"
            },
            {
                value: 6,
                key: "rental",
                thClass: "HeaderACCList2 M",
                tdClass: "ContentACCList2 notranslate",
                label: "Rental"
            },
            {
                value: 7,
                key: "total",
                thClass: "HeaderACCList2 M",
                tdClass: "ContentACCList2 notranslate",
                label: "Total"
            }
        ];

        var arrDate = [
            {'M': 'January', 'm': 'Jan'},
            {'M': 'February', 'm': 'Feb'},
            {'M': 'March', 'm': 'Mar'},
            {'M': 'April', 'm': 'Apr'},
            {'M': 'May', 'm': 'May'},
            {'M': 'June', 'm': 'Jun'},
            {'M': 'July', 'm': 'Jul'},
            {'M': 'August', 'm': 'Aug'},
            {'M': 'September', 'm': 'Sep'},
            {'M': 'October', 'm': 'Oct'},
            {'M': 'November', 'm': 'Nov'},
            {'M': 'December', 'm': 'Dec'}
        ];

        for (let i = 0; i < 12; i++) {
            this.items.push({
                no: (i + 1),
                month: arrDate[i].M,
                ftl: this.isCurrency(0, this.decimal),
                ltl: this.isCurrency(0, this.decimal),
                project: this.isCurrency(0, this.decimal),
                rental: this.isCurrency(0, this.decimal),
                total: this.isCurrency(0, this.decimal)
            });
        }

        this.doGetList2();
    },
    M_Delete(){
        var paramDelete = {
            _Method_: 'DELETE',
            _LineNo_: 0,
            ss_portfolio_id: this.getDataUser().portfolio_id,
            cm_contact_id: this.paramFromList.cm_contact_id,
            year: this.paramFromList.years
        }

        var param = {
            option_url: "/MK/MK_CustomerTarget",
            line_no: 0,
            Data: [{
                A_Delete: paramDelete,
            }]
        };

        this.postJSONMulti(this.getUrlProsesDataPostMulti(), param).then(response => {
            if (response == null) return;
                this.alertSuccess("Data Has Been Deleted").then(() => {
                this.doBack();
            });
        });
    },
  },
  mounted() {
    //   if (this.paramFromList !== undefined) {
        this.renderTable();
    //   }
  },
  created() {
  }
};
</script>

<style>
</style>