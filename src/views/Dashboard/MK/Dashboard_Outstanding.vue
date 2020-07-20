<template>
    <div class="card" style="height: 95%;">
        <div class="card__title">
            <b-row>
            <b-col style="max-width:fit-content !important;">
                <span>Outstanding Payment</span>
            </b-col>
            <b-col style="text-align: right;">
                <span>
                <ABSButton
                    :text="'View All'"
                    classButton="button button--new"
                    classIcon="icon-style-1"
                    :disabled="false"
                    @click="doViewAllOutstandingPayment"
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
            :fields="Outstanding.Header"
            :items="Outstanding.Data"
            >
            <template v-slot:cell(no)="data">{{data.index + 1}}</template>

            <template
                v-slot:cell(outstanding_amt)="data"
            >{{isCurrency(data.item.outstanding_amt, decimal)}}</template>
            </b-table>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            Outstanding: {
                Header: [
                    {
                        key: "no",
                        label: "No",
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
                        key: "outstanding_amt",
                        label: "Total Outstanding Payment",
                        thClass: "HeaderTable",
                        tdClass: "ContentTable__Center"
                    }
                ],
                Data: []
            },
        }
    },
    methods: {
        doViewAllOutstandingPayment() {
            this.$router.push({ name: "MK_DashboardTarget" });
        },
        getListOutstandingPayment() {
            var param = {
                option_url: "/MK/MK_OutstandingPayment",
                line_no: 0,
                user_id: this.getDataUser().user_id,
                portfolio_id: this.getDataUser().portfolio_id,
                subportfolio_id: this.getDataUser().subportfolio_id,
                current_page: 1,
                per_page: 8,
                param_where: "",
                initial_where: "user_id='" + this.getDataUser().user_id + "'",
                sort_field: "",
                source_field: "",
                param_view: ""
            };
            this.postJSON(this.getUrlList(), param).then(response => {
                this.Outstanding.Data = response.Data;
            });
        },
    },
    mounted() {
        this.getListOutstandingPayment();
    }
}
</script>