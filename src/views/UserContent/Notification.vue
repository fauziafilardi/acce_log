
<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Notification</span>
                </b-col>
                <b-col style="text-align: right;">
                  <span>
                    <ABSButton
                      :text="'Back'"
                      classButton="button button--new"
                      classIcon="icon-style-1"
                      :disabled="true"
                    />
                  </span>
                </b-col>
              </b-row>
            </div>
            <div class="card__body" style="padding-top:0px !important;">
              <template v-for="(data, index) in M_Notif">
                <b-row class="notification" v-bind:key="index">
                  <b-col style="margin: auto;">
                    <b-row>
                      <b-col md="8">
                        <span @click="onNotifClick(data)"
                          :class="'notification__descs' + (data.notification_status == 'R' ? '-disabled' : '')"
                        >{{data.descs}}</span>
                      </b-col>
                      <b-col md="4">
                        <span class="notification__time">{{data.timestamp}}</span>
                      </b-col>
                    </b-row>
                  </b-col>
                  <b-col class="notification__icon">
                    <span @click="onDeleteNotif(data)">
                      <font-awesome-icon style="color: hsl(0, 100%, 40%);" icon="trash" size="lg" />
                    </span>
                  </b-col>
                </b-row>
              </template>
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
        M_Notif: []
      }
    },
    methods: {
      getNotification() {
        var param = {
          option_function_cd: "GetUserNotification",
          module_cd: "SS",
          ss_portfolio_id: this.getDataUser().portfolio_id,
          user_id: this.getDataUser().user_id
        };
        
        this.CallFunction(param).then(response => {
          if (response == null) return
          
          var data = response.Data;
          for (let i = 0; i < data.length; i++) {
            var dr = Math.abs(new Date() - new Date(data[i].notification_date))
            var days = Math.ceil(dr / (1000 * 60 * 60 * 24))
            var hours = Math.ceil(dr / (1000 * 60 * 60))
            var mins = Math.ceil(dr / (1000 * 60))
            var dates = this.momentDateFormatting(data[i].notification_date, "YYYY-MM-DD")
            var x = data[i]
            x.timestamp = days && days > 0 ? (days + (days < 1 ? ' Day Ago' : ' Days Ago')) : (hours && hours > 0 && hours <= 24 ? (hours + (hours < 1 ? ' Hour Ago' : ' Hours Ago')) : (mins && mins > 0 && mins <= 60 ? (mins + (mins < 1 ? ' Minute Ago' : ' Minutes Ago')) : dates))
            this.M_Notif.push(x)
          }
          // this.M_Notif = data.sort((a,b) => a.notification_status > b.notification_status)
          // console.log(this.M_Notif)
          // this.M_Notif = response.Data;
        })
      },
      onDeleteNotif(data) {
        var param = {
          option_function_cd: "DelUserNotification",
          module_cd: "SS",
          row_id: data.row_id,
          lastupdatestamp: data.lastupdatestamp
        };
        
        this.CallFunction(param).then(response => {
          if (response == null) return
          this.getNotification();
        })
      },
      onNotifClick(data) {}
    },
    mounted() {
      this.getNotification();
    }
  };
</script>
  
  <style>
.container-refresh {
  float: right;
  color: #215b7d;
}
</style>