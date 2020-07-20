<template>
    <div class="card" style="height: 95%;">
        <div class="card__title">
            <b-row>
                <b-col style="max-width:fit-content !important;">
                    <span>Open Bidding</span>
                </b-col>
                <b-col style="text-align: right;">
                    <span>
                    <ABSButton
                        :text="'View All'"
                        classButton="button button--new"
                        classIcon="icon-style-1"
                        :disabled="false"
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
            :fields="Bidding.Header"
            :items="Bidding.Data"
            >
                <template v-slot:cell(order_date)="data">{{momentDateFormat2(data.item.order_date, "DD/MM/YYYY HH:mm", "DD/MM/YYYY")}}</template>
                <template v-slot:cell(value)="data">{{isCurrency(data.item.value, 0)}}</template>
            </b-table>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            Bidding: {
                Header: [
                    {
                        key: "no",
                        label: "No",
                        thClass: "HeaderTable",
                        tdClass: "ContentTable__Center"
                    },
                    {
                        key: "order_date",
                        label: "Date",
                        thClass: "HeaderTable",
                        tdClass: "ContentTable__Center"
                    },
                    {
                        key: "customer_name",
                        label: "Customer",
                        thClass: "HeaderTable",
                        tdClass: "ContentTable"
                    },
                    {
                        key: "from_to",
                        label: "From - To",
                        thClass: "HeaderTable",
                        tdClass: "ContentTable__Center"
                    },
                    {
                        key: "value",
                        label: "Value",
                        thClass: "HeaderTable",
                        tdClass: "ContentTable__Center"
                    },
                    {
                        key: "type",
                        label: "Type",
                        thClass: "HeaderTable",
                        tdClass: "ContentTable__Center"
                    }
                ],
                Data: []
            },
        }
    },
    methods: {
        getListBiding() {
            var param = {
                option_url: "/MK/MK_OpenOrder",
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
                this.Bidding.Data = response.Data;
            });
        },
    },
    mounted() {
        this.getListBiding();
    }
}
</script>