<template>
    <div class="card">
        <div class="card__title">
            <b-row>
                <b-col style="max-width:fit-content !important;">
                    <span>Order</span>
                </b-col>
                <b-col style="text-align: right;">
                    <b-badge variant="warning" style="cursor: pointer;">{{Order.pending}}</b-badge>
                    <span style="color: #7f8084; font-weight: normal; margin-left: 5px; cursor: pointer;">Pending</span> &nbsp;
                    <b-badge variant="success" style="cursor: pointer;">{{Order.progress}}</b-badge>
                    <span style="color: #7f8084; font-weight: normal; margin-left: 5px; cursor: pointer;">On Progress</span> &nbsp;
                    <b-badge variant="danger" style="cursor: pointer;">{{Order.issue}}</b-badge>
                    <span style="color: #7f8084; font-weight: normal; margin-left: 5px; cursor: pointer;">Issue</span> &nbsp;

                    <span>
                    <ABSButton
                        :text="'View All'"
                        classButton="button button--new"
                        classIcon="icon-style-1"
                        :disabled="false"
                        @click="doViewAllOrder"
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
            :fields="Order.Header"
            :items="Order.Data"
            >
            <template v-slot:cell(no)="data">{{data.index + 1}}</template>
            <template v-slot:cell(customer_status)="data">
                <b-badge
                style="height: 12px !important; width: 12px !important; font-size: 10px !important; padding: 1px 3px !important;"
                variant="warning"
                >{{data.item.pending}}</b-badge>&nbsp;
                <b-badge
                style="height: 12px !important; width: 12px !important; font-size: 10px !important; padding: 1px 3px !important;"
                variant="success"
                >{{data.item.progress}}</b-badge>&nbsp;
                <b-badge
                style="height: 12px !important; width: 12px !important; font-size: 10px !important; padding: 1px 3px !important;"
                variant="danger"
                >{{data.item.issue}}</b-badge>
            </template>
            </b-table>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            Order: {
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
                        key: "customer_status",
                        label: "Status",
                        thClass: "HeaderTable",
                        tdClass: "ContentTable__Center"
                    }
                ],
                Data: [],
                pending: 0,
                progress: 0,
                issue: 0
            }
        }
    },
    methods: {
        doViewAllOrder() {
            var url = "MK_ListOrder";
            if (!url || url == "" || url == undefined) return;
            var param = {
                // option_url: this.getOptionUrl(),
                // title: this.title,
                isEdit: false
            };
            this.$router.push({ name: url, params: param });
        },
        getListOrder() {
            var param = {
                option_url: "/MK/MK_Order",
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
                this.Order.Data = response.Data;
                this.Order.pending = response.Data.map(z => z.pending).reduce(function(a, b) {
                    return a + b;
                }, 0);

                this.Order.progress = response.Data.map(z => z.progress).reduce(function(a, b) {
                    return a + b;
                }, 0);

                this.Order.issue = response.Data.map(z => z.issue).reduce(function(a, b) {
                    return a + b;
                }, 0);
            });
        }
    },
    mounted() {
        this.getListOrder();
    }
}
</script>