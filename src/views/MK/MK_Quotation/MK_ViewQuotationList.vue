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
              <b-form
                :data-vv-scope="'MK_AddQuotation'"
                :data-vv-value-path="'MK_AddQuotation'"
              >
                <b-row>
                  <b-col md="2" style="text-align: center;">
                    <img :src="require('@/assets/date.png')" alt style="width: 100px;" />
                  </b-col>
                  <b-col md="10">
                    <b-row>
                        <b-col>
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
                                        {{ M_Quotation.fulladdress }}
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
                                        <font-awesome-icon class="icon-style-default" icon="envelope" size="sm" />
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
                        </b-col>
                    </b-row>
                    <hr>
                    <b-row>
                        <b-col>
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
                                class="table-sm table-style-2"
                            >
                                <template v-slot:cell(row_id)="data">
                                    <b-button
                                        v-if="WithViewButton == true"
                                        size="sm"
                                        @click.stop="viewClicked(data.item, data.index)"
                                        :disabled="false"
                                        class="btn btn--default"
                                    >View</b-button>
                                    <span v-else>{{data.item.row_id}}</span>
                                </template>
                            </b-table>
                        </b-col>
                    </b-row>
                    <b-row>
                        <b-col md="6">
                            <b-form inline style="float: left; color: #333;">
                            <label
                                class="font-lbl"
                                style="margin-bottom:0px !important; margin-right:0px !important;"
                            >Page Size</label>
                            <b-form-select
                                id="cmbPerPage"
                                v-model="perPage"
                                v-on:input="doGetList(search, 'pageSize')"
                                :options="pagingData"
                                class="sm-3 mgn-left-10 font-lbl page-size-left"
                                :disabled="isDisableTable"
                            ></b-form-select>
                            of {{ this.totalRows }} Records
                            </b-form>
                        </b-col>
                        <b-col md="6">
                            <b-pagination
                            align="right"
                            v-model="currentPage"
                            @input="doGetList(search, 'pagination')"
                            :total-rows="totalRows"
                            :per-page="perPage"
                            :limit="limit"
                            style="margin-bottom: 0px;"
                            :disabled="isDisableTable"
                            ></b-pagination>
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
                pic_phone_no: ""
            },

            //list
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
            WithViewButton: true,

            search: "",
            fieldHeader: [],
            items: [],
            firstSort: true,
            sort: "time_edit DESC",

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

            sortedField: [{ field: "time_edit", sort: "DESC" }],
            isDisableTable: false,
            responses: [],
        };
    },
    computed: {
        paramFromList() {
            var param = this.$route.params;
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
        viewClicked(record,index) {},
        GetDataBy() {
            // var param = {
            //     option_url: "/MK/MK_Quotation",
            //     line_no: 0,
            //     id: this.paramFromList.row_id,
            //     lastupdatestamp: this.paramFromList.lastupdatestamp
            // };

            // this.getJSON(this.getUrlCRUD(), param).then(response => {
            //     // response from API
            //     if (response == null) return;

            //     var data = response.Data[0];

            //     this.M_Quotation = {
            //         customer: data.customer,
            //         fulladdress: data.address + ", " + data.district + ", " + data.city + ", " + data.province + " - " + data.country,
            //         address: data.address,
            //         phone_no: (data.phone_no && data.phone_no !== '' ? data.phone_no : '-'),
            //         email: (data.email && data.email !== '' ? data.email : '-'),
            //         website: (data.website && data.website !== '' ? data.website : '-'),
            //         pic: (data.contact_person && data.contact_person !== '' ? data.contact_person : '-'),
            //         pic_phone_no: (data.contact_phone_no && data.contact_phone_no !== '' ? data.contact_phone_no : '-')
            //     }

                this.doGetlist(this.search);
            // });
        },
        doGetlist(search) {
            var param = {
                option_url: "/MK/MK_Quotation",
                line_no: 1,
                user_id: this.getDataUser().user_id,
                portfolio_id: this.getDataUser().portfolio_id,
                subportfolio_id: this.getDataUser().subportfolio_id,
                current_page: this.currentPage,
                per_page: this.perPage,
                param_where: search,
                initial_where: " cm_contact_id = " + this.paramFromList.cm_contact_id + " and quotation_type = '" + this.paramFromList.quotation_type + "'",
                sort_field: this.sort,
                source_field: this.propList.SourceField,
                param_view: this.propList.ParamView
            };

            this.postJSON(this.getUrlList(), param).then(response => {
                if (response == null) return;

                this.responses = response;
                
                if (this.responses.Data.length > 0) {
                }
                this.items = [];
                this.fieldHeader = [];

                this.items = this.responses.Data;

                var str_array =
                this.responses.DefineColumn && this.responses.DefineColumn !== ""
                    ? this.responses.DefineColumn.split(",")
                    : this.responses.AllColumn.split(",");
                var x = "M,L,M,S";
                
                var defineSize = x.split(",");
                this.allColumn_bf = this.responses.AllColumn.split(",");
                var index = this.allColumn_bf.indexOf("lastupdatestamp");
                if (index > -1) {
                this.allColumn_bf.splice(index, 1);
                }
                var allColumn = [];
                var filteredColumn = [];
                var definedColumn = [];

                this.allColumn_bf.forEach((val, idx) => {
                var thClass = "HeaderACCList";
                var isSorted = this.sortedField.map(x => x.field).indexOf(val);
                if (isSorted > -1) {
                    if (this.sortedField[isSorted].sort == "ASC") {
                    thClass = thClass + " AscSorted";
                    } else {
                    thClass = thClass + " DescSorted";
                    }
                }

                allColumn.push({
                    value: idx + 1,
                    key: val,
                    thClass: thClass,
                    tdClass: "ContentACCList notranslate",
                    text: val
                });

                filteredColumn.push({
                    value: idx + 1,
                    key: val,
                    thClass: thClass,
                    tdClass: "ContentACCList notranslate"
                });
                });

                for (var i = 0; i < str_array.length; i++) {
                    filteredColumn = filteredColumn.filter(val => {
                        if (val.key == str_array[i]) {
                            definedColumn.push({
                                value: val.value,
                                key: val.key,
                                thClass: val.thClass,
                                tdClass: val.tdClass,
                                text: val.key
                            });
                        }

                        return val.key != str_array[i];
                    });

                    var thClass = "HeaderACCList " + defineSize[i];

                    var tdClass = "ContentACCList notranslate";
                    if (
                        str_array[i].toLowerCase().includes("amount") ||
                        str_array[i].toLowerCase().includes("amt") ||
                        str_array[i].toLowerCase().includes("rate") ||
                        str_array[i].toLowerCase().includes("price")
                    ) {
                        tdClass = "ABStdClassList2 notranslate";
                        thClass = "ABSthClassList2";
                    }

                    var isSorted = this.sortedField
                        .map(x => x.field)
                        .indexOf(str_array[i]);
                    if (isSorted > -1) {
                        if (this.sortedField[isSorted].sort == "ASC") {
                        thClass = thClass + " AscSorted";
                        } else {
                        thClass = thClass + " DescSorted";
                        }
                    }

                    if (this.languageStatus) {
                        this.fieldHeader.push({
                        value: i + 1,
                        key: str_array[i],
                        thClass: thClass,
                        tdClass: tdClass,
                        label: this.$t(str_array[i])
                        });
                    } else {
                        if (str_array[i] == "lastupdatestamp") continue;

                        var listReplace = [
                            {
                                key: "_",
                                value: " "
                            },
                            {
                                key: "Cd",
                                value: " Code"
                            },
                            {
                                key: "Descs",
                                value: " Description"
                            },
                            {
                                key: "Time Edit",
                                value: "Last Update"
                            },
                            {
                                key: "garing",
                                value: "/"
                            },
                            {
                                key: "titik",
                                value: "."
                            },
                            {
                                key: "Row Id",
                                value: "View"
                            },
                            {
                                key: "Pic",
                                value: "PIC"
                            }
                        ];

                        var isGotIt = false;
                        var labelHeader = undefined;

                        if (str_array[i].includes("_")) {
                        labelHeader = str_array[i]
                            .toLowerCase()
                            .split("_")
                            .map(s => {
                            return s.charAt(0).toUpperCase() + s.substring(1);
                            })
                            .join(" ");
                        } else {
                            labelHeader =
                                str_array[i].charAt(0).toUpperCase() +
                                str_array[i].substring(1);
                        }

                        for (var data of listReplace) {
                            if (labelHeader == undefined) {
                                labelHeader = this.replaceAllString(
                                str_array[i],
                                data.key,
                                data.value
                                );
                            } else {
                                if (labelHeader.includes(data.key)) {
                                    if (labelHeader == "Row Id" && !this.WithViewButton) continue;

                                    labelHeader = this.replaceAllString(
                                        labelHeader,
                                        data.key,
                                        data.value
                                    );
                                }
                            }
                        }

                        if (labelHeader == "Row Id") continue;

                        this.fieldHeader.push({
                            value: i + 1,
                            key: str_array[i],
                            thClass: thClass,
                            tdClass: tdClass,
                            label: labelHeader
                        });
                    }
                }
                
                this.totalRows = this.responses.Total;
                this.lastPage = this.responses.Last_Page;
            });
        }
    },
    mounted() {
        this.M_ClearForm();
        this.GetDataBy();
    }
};
</script>

<style>
</style>