<template>
    <div class="card">
        <div class="card__title">
            <b-row>
                <b-col style="max-width:fit-content !important;">
                    <span>Console</span> &nbsp;
                </b-col>
                <b-col style="text-align: right;">
                    <span>
                        <ABSButton
                            :text="'Create Console'"
                            classButton="button button--new"
                            classIcon="icon-style-1"
                            :disabled="false"
                            @click="doCreateConsole"
                        />
                    </span>
                </b-col>
            </b-row>
        </div>
        <div class="card__body" style="height: 225px;">
            <div class="div-console">
                <b-row class="ListingRowHeader">
                    <b-col md="4" style="width: 30% !important;">
                        <font-awesome-icon style="color: #333399;" icon="map-marker-alt" size="lg" />&nbsp;
                        <span>Zone</span>
                    </b-col>
                    <b-col md="4" style="width: 35% !important; text-align:center;">
                        <font-awesome-icon style="color: #333399;" icon="dice-d6" size="lg" />&nbsp;
                        <span>m3</span>
                    </b-col>
                    <b-col md="4" style="width: 35% !important; text-align:center;">
                        <font-awesome-icon style="color: #333399;" icon="balance-scale" size="lg" />&nbsp;
                        <span>Kg</span>
                    </b-col>
                </b-row>
                <b-row
                    v-for="(data, index) in Console"
                    v-bind:key="index"
                    class="ListingRowBody"
                    style="height: 29.25px !important;"
                >
                    <b-col md="4" style="width: 30% !important;">
                        <span>{{data.zone}}</span>
                    </b-col>
                    <b-col md="4" style="width: 35% !important; text-align:center;">
                        <span>{{data.total_cbm}}</span>
                    </b-col>
                    <b-col md="4" style="width: 35% !important; text-align:center;">
                        <span>{{data.total_kgs}}</span>
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
            Console: []
        }
    },
    methods: {
        doGetList() {
            var param = {
                option_url: "/OP/OP_Dashboard",
                line_no: 4,
                user_id: this.getDataUser().user_id,
                portfolio_id: this.getDataUser().portfolio_id,
                subportfolio_id: this.getDataUser().subportfolio_id,
                current_page: 1,
                per_page: 5,
                param_where: "",
                initial_where: "",
                sort_field: "",
                source_field: "",
                param_view: ""
            };

            this.postJSON(this.getUrlList(), param).then(response => {
                if (response == null) return;
                var data = response.Data;
                this.Console = data;
            })
        },
        doCreateConsole(){
            this.$router.push({ name: "OP_OrderConsole" });
        }
    },
    mounted() {
        this.doGetList();
    }
}
</script>

<style>

</style>