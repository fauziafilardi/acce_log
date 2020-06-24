<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <template v-for="(data, index) in M_Row">
        <b-row class="dashboardBody" v-bind:key="index">
          <template v-for="(dash, dash_id) in M_Dash.filter(y => y.row == data)">
            <b-col v-if="dash.row == data" v-bind:key="dash_id" :md="dash.col !== 1 ? dash.size : ''">
              <keep-alive>
                <component :ref="'ref_'+dash.name" :is="dash.component"/>
              </keep-alive>
            </b-col>
          </template>
        </b-row>
      </template>
      <!-- <b-row class="dashboardBody">
        <b-col md="7">
          <component ref="ref_Target" :is="M_Target"/>
        </b-col>
        <b-col md="5">
          <component ref="ref_NewProspect" :is="M_NewProspect"/>
        </b-col>
      </b-row>
      <b-row class="dashboardBody">
        <b-col md="7">
          <component ref="ref_ToDoList" :is="M_ToDoList"/>
        </b-col>
        <b-col md="5">
          <component ref="ref_Appointment" :is="M_Appointment"/>
        </b-col>
      </b-row>
      <b-row class="dashboardBody">
        <b-col md="6">
          <component ref="ref_Quotation" :is="M_Quotation"/>
        </b-col>
        <b-col md="6">
          <component ref="ref_Order" :is="M_Order"/>
        </b-col>
      </b-row>
      <b-row class="dashboardBody">
        <b-col md="6">
          <component ref="ref_Outstanding" :is="M_Outstanding"/>
        </b-col>
        <b-col md="6">
          <component ref="ref_Commision" :is="M_Commision"/>
        </b-col>
      </b-row>
      <b-row class="dashboardBody">
        <b-col md="12">
          <component ref="ref_Bidding" :is="M_Bidding"/>
        </b-col>
      </b-row> -->
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      M_Target: null,
      M_NewProspect: null,
      M_ToDoList: null,
      M_Appointment: null,
      M_Quotation: null,
      M_Order: null,
      M_Outstanding: null,
      M_Commision: null,
      M_Bidding: null,

      M_Dash: [],
      M_Row: []
    };
  },
  computed: {},
  methods: {
    renderDash() {
      var Dash = [
        {
          id: 1,
          component: "/MK/Dashboard_Target",
          name: "Target",
          row: 1,
          col: 1,
          size: 7
        },
        {
          id: 2,
          component: "/MK/Dashboard_NewProspect",
          name: "NewProspect",
          row: 1,
          col: 2,
          size: 5
        },
        {
          id: 3,
          component: "/MK/Dashboard_ToDoList",
          name: "ToDoList",
          row: 2,
          col: 1,
          size: 7
        },
        {
          id: 4,
          component: "/MK/Dashboard_Appointment",
          name: "Appointment",
          row: 2,
          col: 2,
          size: 5
        },
        {
          id: 5,
          component: "/MK/Dashboard_Quotation",
          name: "Quotation",
          row: 3,
          col: 1,
          size: 6
        },
        {
          id: 6,
          component: "/MK/Dashboard_Order",
          name: "Order",
          row: 3,
          col: 2,
          size: 6
        },
        {
          id: 7,
          component: "/MK/Dashboard_Outstanding",
          name: "Outstanding",
          row: 4,
          col: 1,
          size: 6
        },
        {
          id: 8,
          component: "/MK/Dashboard_Commision",
          name: "Commision",
          row: 4,
          col: 2,
          size: 6
        },
        {
          id: 9,
          component: "/MK/Dashboard_Bidding",
          name: "Bidding",
          row: 5,
          col: 1,
          size: 12
        }
      ];
      this.M_Row = [...new Set(Dash.map(x => x.row))]
      for (let i = 0; i < Dash.length; i++) {
        var cmp = () => import("."+Dash[i].component+".vue")
        this.M_Dash.push({
          id: Dash[i].id,
          component: cmp,
          name: Dash[i].name,
          row: Dash[i].row,
          col: Dash[i].col,
          size: Dash[i].size
        })
      }

      this.$forceUpdate();
    }
  },
  mounted() {
    this.renderDash();
    // this.M_Target = () => import("./MK/Dashboard_Target.vue")
    // this.M_NewProspect = () => import("./MK/Dashboard_NewProspect.vue")
    // this.M_ToDoList = () => import("./MK/Dashboard_ToDoList.vue")
    // this.M_Appointment = () => import("./MK/Dashboard_Appointment.vue")
    // this.M_Quotation = () => import("./MK/Dashboard_Quotation.vue")
    // this.M_Order = () => import("./MK/Dashboard_Order.vue")
    // this.M_Outstanding = () => import("./MK/Dashboard_Outstanding.vue")
    // this.M_Commision = () => import("./MK/Dashboard_Commision.vue")
    // this.M_Bidding = () => import("./MK/Dashboard_Bidding.vue")
  }
};
</script>

<style scoped>
@import "./../../assets/css/Chart.min.css";
</style>
