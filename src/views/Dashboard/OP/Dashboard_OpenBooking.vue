<template>
    <div class="card">
        <div class="card__title" style="border-bottom-style: unset !important;">
            <b-row>
                <b-col md="8">Open Booking</b-col>
                <b-col md="3" class="col-right">
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
                                <div class="CardTag-Title" style="height: 50px; font-size: 13px !important;">{{data.from_to}}</div>
                                <div class="CardTag-Descs">
                                    <div style="margin-bottom: 5px; heigth: 10px; height: 18px; overflow-y: hidden;">
                                        <span style="color: #333399; font-weight: bold;">{{data.customer}}</span>
                                    </div>
                                    <div style="margin-bottom: 5px;">
                                        <span style="color: #7f8186">{{data.category !== 'LTL' ? (data.category + ' | ' + data.fleet_type) : data.category}}</span>
                                    </div>
                                    <div style="margin-bottom: 5px;">
                                        <span style="color: #7f8186">{{data.status}}</span>
                                    </div>
                                </div>
                            </div>
                        </b-col>
                    </b-row>
                </b-col>
                <b-col md="1" style="border-left: solid 1px rgb(127, 129, 134);">
                    <div 
                        class="CardTag-Title" style="border-radius: 10px !important; padding-top: 40px; padding-top: 20px !important; padding-bottom: 14px !important; cursor: pointer;"
                        @click="IncomingClick"
                    >
                        <span> Incoming Booking</span>
                        <br> <br>
                        <span style="font-size: 15px;"> {{IncomingBookingCount}} </span>
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
            OpenBooking: [],
            IncomingBookingCount: 0
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
        IncomingClick() {
            this.$router.push({name: "OP_IncomingBooking"});
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
        },
        GetIncomingBookingCount() {
            var param = {
                option_function_cd: "GetSumIncomingBooking",
                module_cd: "OP",
                ss_portfolio_id: this.getDataUser().portfolio_id,
                user_id: this.getDataUser().user_id
            };
            
            this.CallFunction(param).then(response => {
                if (response == null) return
                var data = response.Data[0];

                this.IncomingBookingCount = data.fop_sum_incoming_booking && data.fop_sum_incoming_booking !== '' ? data.fop_sum_incoming_booking : 0
            })
        }
    },
    mounted() {
        this.doGetList();
        this.GetIncomingBookingCount();
    }
}
</script>

<style>

</style>