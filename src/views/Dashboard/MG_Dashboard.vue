<template>
    <div class="dashboard-page-chart">
        <div class="dashboard-page-chart__body">
            <b-row class="dashboardBody">
                <b-col md="8">
                    <div class="card">
                        <div class="card__title" style="border-bottom-style: unset !important;">Revenue</div>
                        <div class="card__body">
                            <b-row>
                                <b-col>
                                    <canvas id="revenue-chart" width="350" height="100"></canvas>
                                </b-col>
                            </b-row>
                        </div>
                    </div>
                </b-col>
                <b-col md="4">
                    <div class="card">
                        <div class="card__title">
                            <b-row>
                                <b-col style="max-width:fit-content !important;">
                                    <span>Truck Occupancy</span>
                                </b-col>
                                <b-col style="text-align: right;">
                                    <span>
                                        <ABSButton
                                        :text="'View All (5)'"
                                        classButton="button button--new"
                                        classIcon="icon-style-1"
                                        :disabled="true"
                                        />
                                    </span>
                                </b-col>
                            </b-row>
                        </div>
                        <div class="card__body">
                            <b-row>
                                <b-col>
                                    <canvas id="tOcupancy-chart"></canvas>
                                </b-col>
                            </b-row>
                        </div>
                    </div>
                </b-col>
            </b-row>
            <b-row class="dashboardBody">
                <b-col md="8">
                    <div class="card">
                        <div class="card__title" style="border-bottom-style: unset !important;">
                            <b-row>
                                <b-col style="max-width:fit-content !important;">
                                    <span>Marketing Performance</span>
                                </b-col>
                                <b-col style="text-align: right;">
                                    <span>
                                        <ABSButton
                                        :text="'View All (5)'"
                                        classButton="button button--new"
                                        classIcon="icon-style-1"
                                        :disabled="true"
                                        />
                                    </span>
                                </b-col>
                            </b-row>
                        </div>
                        <div class="card__body">
                            <b-row>
                                <b-col>
                                    <canvas id="marketing-chart" width="350" height="100"></canvas>
                                    <hr style="margin: 5px !important;" />
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="2" style="margin:auto;">
                                    <span>Cumulative Totale</span>
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
                                            <b-col style="max-width: fit-content !important;">
                                                <b-row style="width: 74px">
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
                                                        <span style="color: #666666;">53.4 M</span>
                                                    </b-col>
                                                </b-row>
                                                <b-row style="width: 74px">
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
                                                        <span style="color: #666666;">47.5 M</span>
                                                    </b-col>
                                                </b-row>
                                            </b-col>
                                            <b-col md="8" style="max-width:fit-content !important;">
                                                <span style="font-size: 29px; font-weight: bold; color: #666666;">(98.5 %)</span>
                                            </b-col>
                                        </b-row>
                                    </span>
                                </b-col>
                            </b-row>
                        </div>
                    </div>
                </b-col>
                <b-col md="4">
                    <div class="card">
                        <div class="card__title"> New Prospect </div>
                        <div class="card__body">
                            <b-row>
                                <b-col style="max-width: fit-content !important;">
                                    <span @click="changeCustomerPerformance('min')" style="cursor: pointer;">
                                        <font-awesome-icon class="isGrey" icon="less-than" size="lg" />
                                    </span>
                                </b-col>
                                <b-col style="text-align: center">
                                    <span>
                                        <h6 class="isGrey">{{ DataCustomerPerformance.monthName + ' ' + DataCustomerPerformance.year }}</h6>
                                    </span>
                                </b-col>
                                <b-col style="text-align: right;max-width: fit-content !important;">
                                    <span @click="changeCustomerPerformance('add')" style="cursor: pointer;">
                                        <font-awesome-icon class="isGrey" icon="greater-than" size="lg" />
                                    </span>
                                </b-col>
                            </b-row>
                            <b-row style="margin-top:6px;">
                                <b-col>
                                    <div class="buleth__blue">
                                        <span>{{ DataCustomerPerformance.booking && DataCustomerPerformance.booking !== '' ? DataCustomerPerformance.booking : 0 }}</span>
                                    </div>
                                    <div class="buleth-text">Booking</div>
                                </b-col>
                                <b-col>
                                    <div class="buleth__green">
                                        <span>{{ DataCustomerPerformance.fullfill && DataCustomerPerformance.fullfill !== '' ? DataCustomerPerformance.fullfill : 0 }}</span>
                                    </div>
                                    <div class="buleth-text">Fullfill</div>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="12" style="text-align: center;">
                                    <span style="font-size: 25px; font-weight: bold; color: #666666;">(78.5 %)</span>
                                </b-col>
                            </b-row>
                        </div>
                    </div>
                </b-col>
            </b-row>
            <b-row class="dashboardBody">
                <b-col md="6">
                    <div class="card">
                        <div class="card__title">Operational Performance</div>
                        <div class="card__body">
                            <b-row>
                                <b-col>
                                    <canvas id="operationalP-chart"></canvas>
                                </b-col>
                            </b-row>
                        </div>
                    </div>
                </b-col>
                <b-col md="6">
                    <div class="card">
                        <div class="card__title">Driver Performance</div>
                        <div class="card__body">
                            <b-row>
                                <b-col>
                                    <canvas id="driverP-chart"></canvas>
                                </b-col>
                            </b-row>
                        </div>
                    </div>
                </b-col>
            </b-row>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            CustomerPerformance: [
                {
                    month: "2",
                    year: "2020",
                    booking: 10,
                    fullfill: 3
                },
                {
                    month: "3",
                    year: "2020",
                    booking: 10,
                    fullfill: 7
                },
                {
                    month: "4",
                    year: "2020",
                    booking: 10,
                    fullfill: 9
                }
            ],

            DataCustomerPerformance: {
                month: "",
                monthName: "",
                year: "",
                booking: "",
                fullfill: ""
            }
        };
    },
    computed: {},
    methods: {
        renderRevenueChart() {
            var valuedata = [2478, 5267, 734, 784, 433];
            var valuedata2 = [
                {
                    label: "Profit",
                    backgroundColor: "#333399",
                    borderColor: "#333399",
                    data: [3.7, 4.5, 5],
                    fill: false
                },
                {
                    label: "Revenue",
                    backgroundColor: "#00cc33",
                    borderColor: "#00cc33",
                    data: [5.3, 8, 10.1],
                    fill: false
                },
                {
                    label: "Operational Cost",
                    backgroundColor: "#cd0303",
                    borderColor: "#cd0303",
                    data: [9, 10.5, 15],
                    fill: false
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

            var ctx = document.getElementById("revenue-chart").getContext("2d");

            // Chart.plugins.unregister(ChartDataLabels)
            Chart.helpers.merge(Chart.defaults.global.plugins.datalabels, {
                color: "black"
            });

            var myRevenueChart = new Chart(ctx, {
                type: "line",
                data: {
                    labels: valuelabel,
                    datasets: valuedata2
                },
                options: {
                    // barValueSpacing: 20,
                    legend: {
                        display: true,
                        position: "bottom",
                        align: "center",
                        labels: {
                            generateLabels: function(chart) {
                                var data = chart.data;
                                if (data.labels.length && data.datasets.length) {
                                    return data.datasets.map(function(x, i) {
                                        // console.log(x)
                                        var label = x.label
                                        var fill = x.backgroundColor
                                        var stroke = x.borderColor
                                        var total = 0
                                        x.data.map(datass => {
                                            total += datass
                                        })
                                        var meta = chart.getDatasetMeta(i);
                                        // var ds = data.datasets[i];
                                        // var arc = meta.data[i];
                                        // var custom = arc && arc.custom || {};
                                        // var getValueAtIndexOrDefault = theHelp.getValueAtIndexOrDefault;
                                        // var arcOpts = chart.options.elements.arc;
                                        // var fill = custom.backgroundColor ? custom.backgroundColor : getValueAtIndexOrDefault(ds.backgroundColor, i, arcOpts.backgroundColor);
                                        // var stroke = custom.borderColor ? custom.borderColor : getValueAtIndexOrDefault(ds.borderColor, i, arcOpts.borderColor);
                                        // var bw = custom.borderWidth ? custom.borderWidth : getValueAtIndexOrDefault(ds.borderWidth, i, arcOpts.borderWidth);
                                        return {
                                            text: label + ": " + total + " M",
                                            fillStyle: fill,
                                            strokeStyle: stroke,
                                            lineWidth: 1,
                                            hidden: isNaN(x.data[0]) || meta.data[0].hidden,
                                            datasetIndex: i
                                        };
                                    });
                                }
                            }
                        }
                    },
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
                                    stepSize: 5,
                                    max: 20,
                                    callback: function(value, index, values) {
                                        return value + " M";
                                    }
                                }
                            }
                        ]
                    },
                    animation: {
                        duration: 1,
                        onProgress: function(x) {
                            // var chartInstance = x.chartInstance;
                            // var ctx = chartInstance.ctx;
                            // var dete = chartInstance.data;

                            // ctx.font = Chart.helpers.fontString(
                            //     Chart.defaults.global.defaultFontSize,
                            //     Chart.defaults.global.defaultFontStyle,
                            //     Chart.defaults.global.defaultFontFamily
                            // );
                            // ctx.textAlign = "center";
                            // ctx.textBaseline = "bottom";

                            // dete.datasets.forEach(function(dataset, i) {
                            //     var meta = chartInstance.controller.getDatasetMeta(i);
                            //     meta.data.forEach(function(bar, index) {
                            //         var data = dataset.data[index];
                            //         ctx.fillText(data, bar._model.x, bar._model.y - 5);
                            //     });
                            // });
                        }
                    },
                    plugins: {
                        datalabels: {
                            color: "black"
                            // display: function(context) {
                            //   console.log("Algo: "+context);
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

            myRevenueChart.update();
        },
        renderTOcupancyChart() {
            var valuedata = [2478, 5267, 734, 784, 433];
            var valuedata2 = [
                {
                    label: "Total Available",
                    backgroundColor: "#333399",
                    borderColor: "#333399",
                    data: [20,22,25,22,20,27,20],
                    fill: true
                },
                {
                    label: "Reserve",
                    backgroundColor: "#00cc33",
                    borderColor: "#00cc33",
                    data: [17,19,20,20,15,20,20],
                    fill: true
                }
            ];
            var valuelabel = [
                // "Jan",
                // "Feb",
                // "Mar",
                // "Apr",
                // "May",
                // "Jun",
                // "Jul",
                // "Aug",
                // "Sep",
                // "Oct",
                // "Nov",
                // "Dec"
                "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"
            ];

            var ctx = document.getElementById("tOcupancy-chart").getContext("2d");

            // Chart.plugins.unregister(ChartDataLabels)
            Chart.helpers.merge(Chart.defaults.global.plugins.datalabels, {
                color: "black"
            });

            var myTOcupancyChart = new Chart(ctx, {
                type: "bar",
                data: {
                    labels: valuelabel,
                    datasets: valuedata2
                },
                options: {
                    // barValueSpacing: 20,
                    legend: {
                        display: true,
                        position: "bottom",
                        align: "center",
                        labels: {
                            generateLabels: function(chart) {
                                var data = chart.data;
                                if (data.labels.length && data.datasets.length) {
                                    return data.datasets.map(function(x, i) {
                                        // console.log(x)
                                        var label = x.label
                                        var fill = x.backgroundColor
                                        var stroke = x.borderColor
                                        var total = 0
                                        var percent = ''
                                        x.data.map(datass => {
                                            total += datass
                                        })
                                        if (label == "Reserve") {
                                            var tt = 0
                                            data.datasets[0].data.map( ss => {
                                                tt += ss
                                            })

                                            percent = " (" + Math.floor((total/tt)*100) + "%)"
                                        }
                                        var meta = chart.getDatasetMeta(i);
                                        return {
                                            text: label + " : " + total + percent,
                                            fillStyle: fill,
                                            strokeStyle: stroke,
                                            lineWidth: 1,
                                            hidden: isNaN(x.data[0]) || meta.data[0].hidden,
                                            datasetIndex: i
                                        };
                                    });
                                }
                            }
                        }
                    },
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
                                    stepSize: 10,
                                    max: 30,
                                    callback: function(value, index, values) {
                                        return value;
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
                            //   console.log("Algo: "+context);
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

            myTOcupancyChart.update();
        },
        renderMarketingChart() {
            var valuedata = [2478, 5267, 734, 784, 433];
            var valuedata2 = [
                {
                    label: "Target",
                    backgroundColor: "#333399",
                    data: [12,12,12,13,13,13,15,15,15,17,17,17]
                },
                {
                    label: "Achievement",
                    backgroundColor: "#00cc33",
                    data: [8, 10.5, 9.1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
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

            var ctx = document.getElementById("marketing-chart").getContext("2d");

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
                // barValueSpacing: 20,
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
                        stepSize: 5,
                        max: 20,
                        callback: function(value, index, values) {
                            return value + " M";
                        }
                        }
                    }
                    ]
                },
                animation: {
                    duration: 1,
                    onProgress: function(x) {
                    // console.log(x)
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
                    //   console.log("Algo: "+context);
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
        },
        getCustomerPerformance(date = null) {
            var now = date ? new Date(date) : new Date();
            var month = now.getMonth();
            var year = now.getFullYear();
            var datas = this.CustomerPerformance.filter(x => {
                return (
                    x.month.toString() === (month + 1).toString() &&
                    x.year.toString() === year.toString()
                );
            });
            console.log(datas);

            this.DataCustomerPerformance = {
                month: month + 1,
                monthName: this.getMonthName(now),
                year: year,
                booking: datas.length > 0 ? datas[0].booking : 0,
                fullfill: datas.length > 0 ? datas[0].fullfill : 0
            };

            console.log(this.DataCustomerPerformance);
        },
        changeCustomerPerformance(act) {
            var date = new Date();
            if (act === "min") {
                // var d = moment(date, 'YYYY-MM-DD').add(i, number)
                var mth =
                this.DataCustomerPerformance.month && this.DataCustomerPerformance.month !== ""
                    ? parseInt(this.DataCustomerPerformance.month)
                    : 0;
                var year = this.DataCustomerPerformance.year;
                mth = mth < 10 ? "0" + mth : mth;
                var frm = year + "-" + mth + "-" + "01";
                date = this.dateAdd2("m", frm, -1);
                // date = this.momentDateFormatting(date, frm)
            } else if (act === "add") {
                var mth =
                this.DataCustomerPerformance.month && this.DataCustomerPerformance.month !== ""
                    ? parseInt(this.DataCustomerPerformance.month)
                    : 0;
                var year = this.DataCustomerPerformance.year;
                mth = mth < 10 ? "0" + mth : mth;
                var frm = year + "-" + mth + "-" + "01";
                date = date = this.dateAdd2("m", frm, 1);
                // date = this.momentDateFormatting(date, frm)
            }

            // console.log(date);
            this.getCustomerPerformance(date);
        },
        renderOperationalPChart() {
            var valuedata = [2478, 5267, 734, 784, 433];
            var valuedata2 = [
                {
                    label: "Total",
                    backgroundColor: "#333399",
                    borderColor: "#333399",
                    data: [30,39,30],
                    fill: true
                },
                {
                    label: "Completed",
                    backgroundColor: "#00cc33",
                    borderColor: "#00cc33",
                    data: [27,35,28],
                    fill: true
                },
                {
                    label: "Issue",
                    backgroundColor: "#cd0303",
                    borderColor: "#cd0303",
                    data: [3,1,2],
                    fill: true
                }
            ];
            var valuelabel = [
                "Jan",
                "Feb",
                "Mar",
                "Apr",
                "May",
                "Jun"
                // "Jul",
                // "Aug",
                // "Sep",
                // "Oct",
                // "Nov",
                // "Dec"
                // "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"
            ];

            var ctx = document.getElementById("operationalP-chart").getContext("2d");

            // Chart.plugins.unregister(ChartDataLabels)
            Chart.helpers.merge(Chart.defaults.global.plugins.datalabels, {
                color: "black"
            });

            var myOperationalPChart = new Chart(ctx, {
                type: "bar",
                data: {
                    labels: valuelabel,
                    datasets: valuedata2
                },
                options: {
                    // barValueSpacing: 20,
                    legend: {
                        display: true,
                        position: "bottom",
                        align: "center",
                        labels: {
                            generateLabels: function(chart) {
                                var data = chart.data;
                                if (data.labels.length && data.datasets.length) {
                                    return data.datasets.map(function(x, i) {
                                        // console.log(x)
                                        var label = x.label
                                        var fill = x.backgroundColor
                                        var stroke = x.borderColor
                                        var total = 0
                                        var percent = ''
                                        x.data.map(datass => {
                                            total += datass
                                        })
                                        if (label == "Completed") {
                                            var tt = 0
                                            data.datasets[0].data.map( ss => {
                                                tt += ss
                                            })

                                            percent = " (" + Math.floor((total/tt)*100) + "%)"
                                        }
                                        var meta = chart.getDatasetMeta(i);
                                        return {
                                            text: label + " : " + total + percent,
                                            fillStyle: fill,
                                            strokeStyle: stroke,
                                            lineWidth: 1,
                                            hidden: isNaN(x.data[0]) || meta.data[0].hidden,
                                            datasetIndex: i
                                        };
                                    });
                                }
                            }
                        }
                    },
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
                                    stepSize: 10,
                                    max: 50,
                                    callback: function(value, index, values) {
                                        return value;
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
                            //   console.log("Algo: "+context);
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

            myOperationalPChart.update();
        },
        renderDriverPChart() {
            var valuedata = [2478, 5267, 734, 784, 433];
            var valuedata2 = [
                {
                    label: "Total",
                    backgroundColor: "#333399",
                    borderColor: "#333399",
                    data: [30,39,30],
                    fill: true
                },
                {
                    label: "Completed",
                    backgroundColor: "#00cc33",
                    borderColor: "#00cc33",
                    data: [27,35,28],
                    fill: true
                },
                {
                    label: "Issue",
                    backgroundColor: "#cd0303",
                    borderColor: "#cd0303",
                    data: [3,1,2],
                    fill: true
                }
            ];
            var valuelabel = [
                "Jan",
                "Feb",
                "Mar",
                "Apr",
                "May",
                "Jun"
                // "Jul",
                // "Aug",
                // "Sep",
                // "Oct",
                // "Nov",
                // "Dec"
                // "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"
            ];

            var ctx = document.getElementById("driverP-chart").getContext("2d");

            // Chart.plugins.unregister(ChartDataLabels)
            Chart.helpers.merge(Chart.defaults.global.plugins.datalabels, {
                color: "black"
            });

            var myDriverPChart = new Chart(ctx, {
                type: "bar",
                data: {
                    labels: valuelabel,
                    datasets: valuedata2
                },
                options: {
                    // barValueSpacing: 20,
                    legend: {
                        display: true,
                        position: "bottom",
                        align: "center",
                        labels: {
                            generateLabels: function(chart) {
                                var data = chart.data;
                                if (data.labels.length && data.datasets.length) {
                                    return data.datasets.map(function(x, i) {
                                        // console.log(x)
                                        var label = x.label
                                        var fill = x.backgroundColor
                                        var stroke = x.borderColor
                                        var total = 0
                                        var percent = ''
                                        x.data.map(datass => {
                                            total += datass
                                        })
                                        if (label == "Completed") {
                                            var tt = 0
                                            data.datasets[0].data.map( ss => {
                                                tt += ss
                                            })

                                            percent = " (" + Math.floor((total/tt)*100) + "%)"
                                        }
                                        var meta = chart.getDatasetMeta(i);
                                        return {
                                            text: label + " : " + total + percent,
                                            fillStyle: fill,
                                            strokeStyle: stroke,
                                            lineWidth: 1,
                                            hidden: isNaN(x.data[0]) || meta.data[0].hidden,
                                            datasetIndex: i
                                        };
                                    });
                                }
                            }
                        }
                    },
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
                                    stepSize: 10,
                                    max: 50,
                                    callback: function(value, index, values) {
                                        return value;
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
                            //   console.log("Algo: "+context);
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

            myDriverPChart.update();
        },
    },
    mounted() {
        this.renderRevenueChart();
        this.renderTOcupancyChart();
        this.renderMarketingChart();
        this.getCustomerPerformance();
        this.renderOperationalPChart();
        this.renderDriverPChart();
    }
};
</script>

<style scoped>
    @import "./../../assets/css/Chart.min.css";
</style>
