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
    renderDash2() {
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
    },
    renderDash() {
      var param = {
        option_function_cd: "GetUserMenuDashboard",
        module_cd: "MK",
        ss_portfolio_id: this.getDataUser().portfolio_id,
        user_id: this.getDataUser().user_id,
        menu_url: "/MK_Dashboard"
      };
      
      this.CallFunction(param).then(response => {
        if (response == null) return
        
        var Dash = response.Data;
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
      })
    }
  },
  mounted() {
    this.renderDash();
  }
};
</script>

<style scoped>
@import "./../../assets/css/Chart.min.css";
</style>
