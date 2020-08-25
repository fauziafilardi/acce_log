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
                <b-row class="ListingRowHeader">
                    <b-col md="4" style="width: 30% !important;">
                        <font-awesome-icon style="color: #333399;" icon="map-marker-alt" size="lg" />&nbsp;
                        <span>Zone</span>
                    </b-col>
                    <b-col md="4" style="width: 35% !important; text-align:center;">
                        <!-- <font-awesome-icon style="color: #333399;" icon="dice-d6" size="lg" />&nbsp; -->
                        <b-badge variant="success">&nbsp;</b-badge>&nbsp;
                        <span>Available</span>
                    </b-col>
                    <b-col md="4" style="width: 35% !important; text-align:center;">
                        <!-- <font-awesome-icon style="color: #333399;" icon="balance-scale" size="lg" />&nbsp; -->
                        <b-badge variant="primary">&nbsp;</b-badge>&nbsp;
                        <span>Incoming</span>
                    </b-col>
                </b-row>
                <b-row
                    v-for="(data, index) in FleetAvailability"
                    v-bind:key="index"
                    class="ListingRowBody"
                >
                    <!-- style="height: 29.25px !important;" -->
                    <b-col md="4" style="width: 30% !important;">
                        <span>{{data.zone_cd}}</span>
                    </b-col>
                    <b-col md="4" style="width: 35% !important; text-align:center;">
                        <span>{{data.available}}</span>
                    </b-col>
                    <b-col md="4" style="width: 35% !important; text-align:center;">
                        <span>{{data.incoming_fleet}}</span>
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
            FleetAvailability: []
        }
    },
    methods: {
        doGetList() {
            var param = {
                option_url: "/OP/OP_Dashboard",
                line_no: 5,
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
                this.FleetAvailability = data;
            })
        },
        doViewAll(){
            this.$router.push({ name: "OP_FleetAvailability" });
        }
    },
    mounted() {
        this.doGetList();
    }
}
</script>

<style>

</style>