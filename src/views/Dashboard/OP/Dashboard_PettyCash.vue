<template>
    <div class="card">
        <div class="card__title">
            <b-row>
                <b-col style="max-width:fit-content !important;">
                    <span>Fleet Availability</span> &nbsp;
                </b-col>
                <b-col style="text-align: right;">
                    <span>
                        <ABSButton
                            :text="'View All'"
                            classButton="button button--back2"
                            classIcon="icon-style-1"
                            :disabled="false"
                            @click="doViewAll"
                        />
                    </span>
                </b-col>
            </b-row>
        </div>
        <div class="card__body" style="height: 225px;">
            <div class="div-console">
                <b-row class="row-petty-cash">
                    <b-col
                        md="4"
                        v-for="(data, index) in OPPettyCash"
                        v-bind:key="index"
                        style="margin-bottom: 10px; padding-right: 15px !important;width:33% !important"
                    >
                        <div class="CardTag-Title" style="font-size:13px !important;">{{data.coverage}}</div>
                        <div class="CardTag-Descs" style="padding-top:9px; padding-bottom:10px;">
                            <span>{{data.user_id}}</span>
                            <br />
                            <span style="color: red">{{data.balance_amt}}</span>
                        </div>
                    </b-col>
                </b-row>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            OPPettyCash: []
        }
    },
    methods: {
        doGetList() {
            var param = {
                option_url: "/OP/OP_Dashboard",
                line_no: 3,
                user_id: this.getDataUser().user_id,
                portfolio_id: this.getDataUser().portfolio_id,
                subportfolio_id: this.getDataUser().subportfolio_id,
                current_page: 1,
                per_page: 6,
                param_where: "",
                initial_where: "",
                sort_field: "",
                source_field: "",
                param_view: ""
            };

            this.postJSON(this.getUrlList(), param).then(response => {
                if (response == null) return;
                var data = response.Data;
                this.OPPettyCash = data;
            })
        },
        doViewAll(){
            this.$router.push({ name: "OP_PettyCash" });
        }
    },
    mounted() {
        this.doGetList();
    }
}
</script>

<style>

</style>