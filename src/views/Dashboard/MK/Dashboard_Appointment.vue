<template>
    <div class="card" style="height: 95%;">
        <div class="card__title">
            <b-row>
                <b-col style="max-width:fit-content !important;">
                    <span>Appointment</span>
                </b-col>
                <b-col style="text-align: right;">
                    <span>
                    <ABSButton
                        :text="'View All'"
                        classButton="button button--new"
                        classIcon="icon-style-1"
                        :disabled="false"
                        @click="doViewAllAppointment"
                    />
                    </span>
                </b-col>
            </b-row>
        </div>
        <div class="card__body">
            <b-row
            class="AppointmentData"
            v-for="(data, index) in Appointment"
            v-bind:key="index"
            >
                <b-col style="max-width:fit-content !important;">
                    <div style="width:50px;">
                    <div
                        class="CalendarTagMonth"
                    >{{momentDateFormat2(data.next_action, 'DD-MM-YYYY HH:mm', 'MMM')}}</div>
                    <div
                        class="CalendarTagDate"
                    >{{momentDateFormat2(data.next_action, 'DD-MM-YYYY HH:mm', 'DD')}}</div>
                    </div>
                </b-col>
                <b-col style="margin: auto;">
                    <span
                    class="AppointmentTitle"
                    >{{momentDateFormat2(data.next_action, 'DD-MM-YYYY HH:mm', 'HH:mm')}}</span>
                    <br />
                    <span class="AppointmentDescs">{{data.customer_name}}</span>
                </b-col>
                <b-col class="AppointmentIcon">
                    <span>
                    <font-awesome-icon
                        v-if="data.action == 'C'"
                        style="color: #333399;"
                        icon="phone-square-alt"
                        size="lg"
                    />
                    <font-awesome-icon
                        v-else-if="data.action == 'E'"
                        style="color: #333399;"
                        icon="utensils"
                        size="lg"
                    />
                    <font-awesome-icon
                        v-else-if="data.action == 'V'"
                        style="color: #333399;"
                        icon="hand-paper"
                        size="lg"
                    />
                    </span>
                </b-col>
            </b-row>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            Appointment: [],
        }
    },
    methods: {
        getListAppointment() {
            var param = {
                option_url: "/MK/MK_Appointment",
                line_no: 0,
                user_id: this.getDataUser().user_id,
                portfolio_id: this.getDataUser().portfolio_id,
                subportfolio_id: this.getDataUser().subportfolio_id,
                current_page: 1,
                per_page: 4,
                param_where: "",
                initial_where: "next_action is not null",
                sort_field: "",
                source_field: "",
                param_view: ""
            };

            this.postJSON(this.getUrlList(), param).then(response => {
                this.Appointment = response.Data;
            });
        },
        doViewAllAppointment() {
            this.$router.push({ name: "MK_Appointment" });
        },
    },
    mounted() {
        this.getListAppointment();
    }
}
</script>