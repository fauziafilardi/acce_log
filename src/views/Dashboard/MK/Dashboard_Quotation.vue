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
            >
                <template v-slot:cell(no)="data">{{data.index + 1}}</template>
            </b-table>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
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
                initial_where: "",
                sort_field: "",
                source_field: "",
                param_view: ""
            };
            this.postJSON(this.getUrlList(), param).then(response => {
                this.Quotation.Data = response.Data;
            });
        },
    },
    mounted() {
        this.getListQuotation();
    }
}
</script>