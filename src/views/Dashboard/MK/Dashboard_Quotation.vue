<template>
    <div class="card" style="height: 95%;">
        <div class="card__title">
            <b-row>
                <b-col style="max-width:fit-content !important;">
                    <span>Quotation</span>
                </b-col>
                <b-col style="text-align: right;">
                    <span>
                    <ABSButton
                        :text="'Expire Soon ('+ExpireSoon+')'"
                        classButton="button button--new"
                        classIcon="icon-style-1"
                        styleButton="background-color: red; color: white; border-color: red;"
                        :disabled="false"
                        @click="doExpireSoon"
                    />
                    </span>
                    <span>
                    <ABSButton
                        :text="'Add New'"
                        classButton="button button--new"
                        classIcon="icon-style-1"
                        :disabled="false"
                        @click="doAddNew"
                    />
                    </span>
                    <span>
                    <ABSButton
                        :text="'View All'"
                        classButton="button button--new"
                        classIcon="icon-style-1"
                        :disabled="false"
                        @click="doViewAllQuotation"
                    />
                    </span>
                </b-col>
            </b-row>
        </div>
        <div class="card__body">
            <b-table
                class="table-sm table-style-3"
                :responsive="true"
                :striped="false"
                :bordered="true"
                :outlined="false"
                :small="false"
                :hover="false"
                :dark="false"
                :fixed="false"
                :foot-clone="false"
                :fields="Quotation.Header"
                :items="Quotation.Data"
                thStyle="padding: 5px !important;"
                @row-clicked="viewClicked"
            >
                <template v-slot:cell(no)="data">{{data.index + 1}}</template>
                <template v-slot:cell(status)="data">{{data.item.status_descs}}</template>
            </b-table>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            ExpireSoon: 0,
            Quotation: {
                Header: [
                {
                    key: "no",
                    label: "No",
                    thClass: "HeaderTable",
                    tdClass: "ContentTable__Center"
                },
                {
                    key: "customer",
                    label: "Customer",
                    thClass: "HeaderTable",
                    tdClass: "ContentTable"
                },
                {
                    key: "quotation_no",
                    label: "Quotation No",
                    thClass: "HeaderTable",
                    tdClass: "ContentTable__Center"
                },
                {
                    key: "quotation_date",
                    label: "Date",
                    thClass: "HeaderTable",
                    tdClass: "ContentTable__Center"
                },
                {
                    key: "status",
                    label: "Status",
                    thClass: "HeaderTable",
                    tdClass: "ContentTable__Center"
                }
                ],
                Data: []
            },
        }
    },
    methods: {
        viewClicked(record, index) {
            var param = record;
            this.$store.commit("setParamPage", param);
            this.$router.push({ name: "MK_ViewQuotation" });
        },
        doExpireSoon() {
            var param = {
                isEdit: false
            }
            this.$router.push({ name: "MK_Quotation_ExpireSoon", params: param });
        },
        doAddNew() {
            var param = {
                isEdit: false
            }
            this.$store.commit("setParamPage", param);
            this.$router.push({ name: "MK_AddQuotation" });
        },
        doViewAllQuotation() {
            var url = "MK_Quotation";
            if (!url || url == "" || url == undefined) return;
            var param = {
                // option_url: this.getOptionUrl(),
                // title: this.title,
                isEdit: false
            };
            this.$router.push({ name: url, params: param });
        },
        getListQuotation() {
            var param = {
                option_url: "/MK/MK_Quotation",
                line_no: 0,
                user_id: this.getDataUser().user_id,
                portfolio_id: this.getDataUser().portfolio_id,
                subportfolio_id: this.getDataUser().subportfolio_id,
                current_page: 1,
                per_page: 8,
                param_where: "",
                initial_where: "ss_portfolio_id='" + this.getDataUser().portfolio_id + "'  AND status IN ('N','P')",
                sort_field: "status_descs ASC",
                source_field: "",
                param_view: ""
            };
            // AND marketing_id='" + this.getDataUser().user_id + "'
            this.postJSON(this.getUrlList(), param).then(response => {
                this.Quotation.Data = response.Data;
                this.GetCntExpireSoon();
            });
        },
        GetCntExpireSoon() {
            var param = {
                option_function_cd: "GetSumExpirySoonQuotation",
                module_cd: "MK",
                ss_portfolio_id: this.getDataUser().portfolio_id,
                user_id: this.getDataUser().user_id
            };
            
            this.CallFunction(param).then(response => {
                if (response == null) return
                var data = response.Data[0];
                
                this.ExpireSoon = data.fop_sum_expire_soon_quotation && data.fop_sum_expire_soon_quotation !== '' ? data.fop_sum_expire_soon_quotation : 0;
            })
        }
    },
    mounted() {
        this.getListQuotation();
    }
}
</script>