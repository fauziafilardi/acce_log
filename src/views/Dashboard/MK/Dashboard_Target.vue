<template>
    <div class="card" style="height: 95%;">
        <div class="card__title">
            <b-row>
            <b-col style="max-width:fit-content !important;">
                <span>Target</span>
            </b-col>
            <b-col style="text-align: right;">
                <span>
                <ABSButton
                    :text="'View All'"
                    classButton="button button--new"
                    classIcon="icon-style-1"
                    :disabled="false"
                    @click="doViewAllTarget"
                />
                </span>
            </b-col>
            </b-row>
        </div>
        <div class="card__body">
            <b-row>
            <b-col>
                <!-- <canvas id="bar-chart" width="350" height="100"></canvas> -->
                <div class="chart-target">
                <canvas id="bar-chart" height="100"></canvas>
                </div>
                <hr style="margin: 5px !important;" />
            </b-col>
            </b-row>
            <b-row class="row-comulative">
            <b-col md="2" style="margin:auto;">
                <span>Cumulative Total</span>
            </b-col>
            <b-col class="ChartLegend-Wrap">
                <span>
                <b-row>
                    <b-col style="max-width:fit-content !important;">
                    <b-row>
                        <b-col style="max-width:fit-content !important;">
                        <div class="ChartLegend-Content" style="text-align: right;">
                            <span style="color: #666666;">Target</span>
                        </div>
                        </b-col>
                    </b-row>
                    <b-row>
                        <b-col style="max-width:fit-content !important;">
                        <div class="ChartLegend-Content" style="text-align: right;">
                            <span style="color: #666666;">Achievement</span>
                        </div>
                        </b-col>
                    </b-row>
                    </b-col>
                    <b-col md="2">
                    <b-row>
                        <b-col style="max-width:fit-content !important;">
                        <div
                            class="ChartLegend-Content"
                            style="background-color: #333399; width: 10px; height: 10px; padding: 10px;"
                        ></div>
                        </b-col>
                        <b-col
                        class="ChartLegend-Content"
                        style="max-width:fit-content !important;"
                        >
                        <span
                            style="color: #666666;"
                        >{{ M_Target.target + " " + M_Target.satuan }}</span>
                        </b-col>
                    </b-row>
                    <b-row>
                        <b-col style="max-width:fit-content !important;">
                        <div
                            class="ChartLegend-Content"
                            style="background-color: #00cc33; width: 10px; height: 10px; padding: 10px;"
                        ></div>
                        </b-col>
                        <b-col
                        class="ChartLegend-Content"
                        style="max-width:fit-content !important;"
                        >
                        <span
                            style="color: #666666;"
                        >{{ M_Target.achievement + " " + M_Target.satuan }}</span>
                        </b-col>
                    </b-row>
                    </b-col>
                    <b-col md="8" style="max-width:fit-content !important;">
                    <span
                        style="font-size: 25px; font-weight: bold; color: #666666;"
                    >({{ M_Target.avg }} %)</span>
                    </b-col>
                </b-row>
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
                M_Target: {
                    target: 0,
                    achievement: 0,
                    avg: 0,
                    satuan: "M"
                }
            }
        },
        methods: {
            doViewAllTarget() {
                this.$router.push({ name: "MK_DashboardTarget" });
            },
            ChartClick(evt) {
                alert('hah')
                console.log(evt)
            },
            renderChart() {
                var param = {
                    option_function_cd: "GetMarketingTargetDash",
                    module_cd: "MK",
                    user_id: this.getDataUser().user_id,
                    ss_portfolio_id: this.getDataUser().portfolio_id
                };

                this.CallFunction(param).then(response => {
                    if (response == null) return;
                    var data = response.Data,
                    isMonth = new Date().getMonth(),
                    tg = [],
                    tg2 = [],
                    ac = [],
                    ac2 = [];

                    for (let i = 0; i < data.length; i++) {
                        if (i <= isMonth) {
                            tg2.push(Math.round(data[i].display_target_amt));
                            ac2.push(Math.round(data[i].display_achievement_amt));
                        }
                        tg.push(Math.round(data[i].display_target_amt));
                        ac.push(Math.round(data[i].display_achievement_amt));
                    }

                    var max = Math.max.apply(null, tg),
                    sumtg = tg2.reduce(function(a, b) {
                        return a + b;
                    }, 0),
                    sumac = ac2.reduce(function(a, b) {
                        return a + b;
                    }, 0);

                    this.M_Target.satuan = data[0].display_satuan;
                    this.M_Target.target = Math.round(sumtg).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                    this.M_Target.achievement = Math.round(sumac).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                    this.M_Target.avg = Math.round((sumac / sumtg) * 100);

                    var valuedata2 = [
                        {
                            label: "Target",
                            backgroundColor: "#333399",
                            data: tg
                        },
                        {
                            label: "Achievement",
                            backgroundColor: "#00cc33",
                            data: ac
                        }
                    ];

                    var valuelabel = [
                        "Jan",
                        "Feb",
                        "Mar",
                        "Apr",
                        "May",
                        "Jun",
                        "Jul",
                        "Aug",
                        "Sep",
                        "Oct",
                        "Nov",
                        "Dec"
                    ];

                    var ctx = document.getElementById("bar-chart").getContext("2d");

                    // Chart.plugins.unregister(ChartDataLabels)
                    Chart.helpers.merge(Chart.defaults.global.plugins.datalabels, {
                        color: "black"
                    });

                    var myBarChart = new Chart(ctx, {
                        type: "bar",
                        data: {
                            labels: valuelabel,
                            // datasets: [
                            //   {
                            //     label: "Population (millions)",
                            //     backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
                            //     data: valuedata
                            //   }
                            // ]
                            datasets: valuedata2
                        },
                        options: {
                            // events: ['click'],
                            // onClick: ChartClick,
                            // barValueSpacing: 20,
                            maintainAspectRatio: false,
                            legend: { display: false },
                            title: {
                                display: false,
                                text: "Predicted world population (millions) in 2050"
                            },
                            scales: {
                                xAxes: [
                                    {
                                        gridLines: {
                                            // display:false
                                            // offsetGridLines : true
                                        }
                                    }
                                ],
                                yAxes: [
                                    {
                                        scaleLabel: {
                                            // display: true,
                                            // labelString: 'cek'
                                        },
                                        gridLines: {
                                            // display:false,
                                            // drawBorder: false
                                        },
                                        ticks: {
                                            display: true,
                                            min: 0,
                                            stepSize: Math.round((max + 20) / 4),
                                            max: max + 20,
                                            callback: function(value, index, values) {
                                                return value + data[0].display_satuan;
                                            }
                                        }
                                    }
                                ]
                            },
                            animation: {
                                duration: 1,
                                onProgress: function(x) {
                                    var chartInstance = x.chartInstance;
                                    var ctx = chartInstance.ctx;
                                    var dete = chartInstance.data;

                                    ctx.font = Chart.helpers.fontString(
                                        Chart.defaults.global.defaultFontSize,
                                        Chart.defaults.global.defaultFontStyle,
                                        Chart.defaults.global.defaultFontFamily
                                    );
                                    ctx.textAlign = "center";
                                    ctx.textBaseline = "bottom";

                                    dete.datasets.forEach(function(dataset, i) {
                                        var meta = chartInstance.controller.getDatasetMeta(i);
                                        meta.data.forEach(function(bar, index) {
                                            var data = dataset.data[index];
                                            ctx.fillText(data, bar._model.x, bar._model.y - 5);
                                        });
                                    });
                                }
                            },
                            plugins: {
                                datalabels: {
                                    color: "black"
                                    // display: function(context) {
                                    //   return context.dataset.data[context.dataIndex] > 15;
                                    // },
                                    // font: {
                                    //   weight: 'bold'
                                    // },
                                    // formatter: function(value, context) {
                                    //   return context.dataIndex + ': ' + Math.round(value*100) + '%';
                                    // }
                                }
                            }
                        }
                    });

                    myBarChart.update();
                    this.$forceUpdate();
                });
            }
        },
        mounted() {
            this.renderChart();
        }
    }
</script>

<style scoped>
    @import "./../../../assets/css/Chart.min.css";
</style>
