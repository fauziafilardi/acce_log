<template>
    <div class="card" style="height: 95%;">
        <div class="card__title">
            <b-row>
                <b-col style="max-width:fit-content !important;">
                    <span>Commision</span>
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
            <b-row class="CommisionData">
                <b-col class="CommisionIcon">
                    <span>
                    <font-awesome-icon
                        style="color: #333399;margin-right: 20px;"
                        icon="coins"
                        size="4x"
                    />
                    </span>
                </b-col>
                <b-col style="margin: auto;">
                    <span class="Commision__TitleBlue">Paid</span> &nbsp;
                    <span class="CommisionTitle">(Last 12 Months)</span>
                    <br />
                    <span class="CommisionDescs">{{`Rp `+isCurrency(DataComission.paid, decimal)}}</span>
                </b-col>
                </b-row>
                <b-row class="CommisionData">
                <b-col class="CommisionIcon">
                    <span>
                    <font-awesome-icon
                        style="color: #cc0000;margin-right: 20px;"
                        icon="exclamation-circle"
                        size="4x"
                    />
                    </span>
                </b-col>
                <b-col style="margin: auto;">
                    <span class="Commision__TitleRed">Overdue</span> &nbsp;
                    <span class="CommisionTitle"></span>
                    <br />
                    <span class="CommisionDescs">{{`Rp `+isCurrency(DataComission.overdue, decimal)}}</span>
                </b-col>
                </b-row>
                <b-row class="CommisionData">
                <b-col class="CommisionIcon">
                    <span>
                    <font-awesome-icon
                        style="color: #00cc33;margin-right: 20px;"
                        icon="stopwatch"
                        size="5x"
                    />
                    </span>
                </b-col>
                <b-col style="margin: auto;">
                    <span class="Commision__TitleGreen">Pending</span> &nbsp;
                    <span class="CommisionTitle"></span>
                    <br />
                    <span class="CommisionDescs">{{`Rp `+isCurrency(DataComission.pending, decimal)}}</span>
                </b-col>
            </b-row>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            DataComission: {
                paid: 0,
                overdue: 0,
                pending: 0
            },
        }
    },
    methods: {
        getCommision() {
            var param = {
                option_function_cd: "GetMkCommisionDash",
                module_cd: "MK",
                ss_portfolio_id: this.getDataUser().portfolio_id,
                user_id: this.getDataUser().user_id
            };
            this.CallFunction(param).then(ress => {
                if (ress == null) return;

                if (ress.Data.length > 0) {
                var data = ress.Data[0];

                this.DataComission = {
                    paid: data.paid_amt,
                    overdue: data.overdue_amt,
                    pending: data.pending_amt
                };
                }
            });
        },
    },
    mounted() {
        this.getCommision();
    }
}
</script>