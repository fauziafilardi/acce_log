<template>
    <div class="card">
        <div class="card__title" style="border-bottom-style: unset !important;">
            <b-row>
                <b-col md="9">Open Booking</b-col>
                <b-col md="2" class="col-right">
                    <span>
                        <ABSButton
                            :text="'Create Booking'"
                            classButton="button button--back2"
                            classIcon="icon-style-1"
                            @click="onCreateBooking"
                        />
                    </span>
                    <span>
                        <ABSButton
                            :text="'View All'"
                            classButton="button button--back2"
                            classIcon="icon-style-1"
                            @click="onViewAll"
                        />
                    </span>
                </b-col>
            </b-row>
        </div>
        <div class="card__body">
            <b-row>
                <b-col md="11">
                    <b-row>
                        <b-col
                            v-for="(data, index) in OpenBooking"
                            v-bind:key="index"
                            md="2"
                            style="margin-bottom: 5px"
                        >
                            <div>
                                <div class="CardTag-Title">{{data.from_to}}</div>
                                <div class="CardTag-Descs">
                                    <span style="color: #333399; font-weight: bold;">{{data.customer}}</span>
                                    <br />
                                    <span style="color: #7f8186">{{data.category !== 'LTL' ? (data.category + ' | ' + data.fleet_type) : data.category}}</span>
                                    <br />
                                    <span style="color: #7f8186">{{data.status}}</span>
                                </div>
                            </div>
                        </b-col>
                    </b-row>
                </b-col>
                <b-col md="1" style="border-left: solid 1px rgb(127, 129, 134);">
                    <div class="CardTag-Title" style="border-radius: 10px !important; padding-top: 40px; padding-top: 25px !important; padding-bottom: 9px !important;">
                        <span> Incoming Booking</span>
                        <br> <br>
                        <span style="font-size: 15px;"> {{'6'}} </span>
                    </div>
                    <!-- <div class="ChartLegend__Wrap" style="height:74px;margin:5px;">
                        <div
                            class="ChartLegend-Content"
                            style="margin-left: auto !important;margin-right: auto !important;margin-top: 17px !important;"
                        >
                            <span style="font-size: 14px; padding-right: 5px;">View All</span>
                            <span>
                                <font-awesome-icon icon="chevron-right" size="lg" />
                            </span>
                        </div>
                    </div> -->
                </b-col>
            </b-row>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            OpenBooking: []
        }
    },
    methods: {
        onCreateBooking() {
            var param = {
                isEdit: false
            }
            this.$store.commit("setParamPage", param);
            this.$router.push({name: "OP_AddBookingEntry"});
        },
        onViewAll() {
            this.$router.push({name: "OP_BookingEntry"});
        },
        doGetList() {
            var param = {
                option_url: "/OP/OP_Dashboard",
                line_no: 2,
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
                this.OpenBooking = data;
            })
        }
    },
    mounted() {
        this.doGetList();
    }
}
</script>

<style>

</style>