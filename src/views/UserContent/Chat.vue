
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
              <b-row class="notification">
                <b-col style="margin: auto;">
                  <b-row>
                    <b-col md="8">
                      <span
                        class="notification__descs"
                      >New Prospect Added PT Gemini Gemilang Perkasa</span>
                    </b-col>
                    <b-col md="4">
                      <span class="notification__time">5 Minutes Ago</span>
                    </b-col>
                  </b-row>
                </b-col>
                <b-col class="notification__icon">
                  <span>
                    <font-awesome-icon style="color: hsl(0, 100%, 40%);" icon="trash" size="lg" />
                  </span>
                </b-col>
              </b-row>
              <b-row class="notification">
                <b-col style="margin: auto;">
                  <b-row>
                    <b-col md="8">
                      <span
                        class="notification__descs"
                      >Outstanding Payment on oder PT. Gajah Bumi Tunggal</span>
                    </b-col>
                    <b-col md="4">
                      <span class="notification__time">12 Hours Ago</span>
                    </b-col>
                  </b-row>
                </b-col>
                <b-col class="notification__icon">
                  <span>
                    <font-awesome-icon style="color: hsl(0, 100%, 40%);" icon="trash" size="lg" />
                  </span>
                </b-col>
              </b-row>
              <b-row class="notification">
                <b-col style="margin: auto;">
                  <b-row>
                    <b-col md="8">
                      <span class="notification__descs">There is Problem on order no #344343</span>
                    </b-col>
                    <b-col md="4">
                      <span class="notification__time">2 Days Ago</span>
                    </b-col>
                  </b-row>
                </b-col>
                <b-col class="notification__icon">
                  <span>
                    <font-awesome-icon style="color: hsl(0, 100%, 40%);" icon="trash" size="lg" />
                  </span>
                </b-col>
              </b-row>
              <b-row class="notification">
                <b-col style="margin: auto;">
                  <b-row>
                    <b-col md="8">
                      <span
                        class="notification__descs-disabled"
                      >Outstanding Payment on oder PT. Gajah Bumi Tunggal</span>
                    </b-col>
                    <b-col md="4">
                      <span class="notification__time">2 Days Ago</span>
                    </b-col>
                  </b-row>
                </b-col>
                <b-col class="notification__icon">
                  <span>
                    <font-awesome-icon style="color: hsl(0, 100%, 40%);" icon="trash" size="lg" />
                  </span>
                </b-col>
              </b-row>
              <b-row class="notification">
                <b-col style="margin: auto;">
                  <b-row>
                    <b-col md="8">
                      <span
                        class="notification__descs-disabled"
                      >Outstanding Payment on oder PT. Gajah Bumi Tunggal</span>
                    </b-col>
                    <b-col md="4">
                      <span class="notification__time">2 Days Ago</span>
                    </b-col>
                  </b-row>
                </b-col>
                <b-col class="notification__icon">
                  <span>
                    <font-awesome-icon style="color: hsl(0, 100%, 40%);" icon="trash" size="lg" />
                  </span>
                </b-col>
              </b-row>
            </div>
          </div>
        </b-col>
      </b-row>
    </div>
  </div>
  <!-- <div>
    <div class="header--content">
      <div class="header--content__title">
        <b-row class="header-toolbar">
          <b-col sm="12">
            Notification
            <div class="container-refresh">
              <ABSButton
                text="Back"
                icon="check-circle"
                classButton="button-cancel button--cancelnew"
                classIcon="icon-style-1"
                @click="doBack"
                :styleButton="{color: 'black'}"
              />
            </div>
          </b-col>
        </b-row>
      </div>
    </div>
    <div class="content-app-form__body">
      <div class="block-scope-mobile">
        <b-list-group>
          <b-row>
            <b-col md="12">
              <b-row>
                <b-col md="8">
                  <div class="notification">New Prospect Added PT Gemini Gemilang Perkasa</div>
                </b-col>
                <b-col md="3">
                  <div class="time">5 Minutes Ago</div>
                </b-col>
                <b-col md="1">
                  <div class="icon">
                    <font-awesome-icon icon="trash" class="icon-style-1" />
                  </div>
                </b-col>
              </b-row>
            </b-col>
          </b-row>
        </b-list-group>
      </div>
    </div>
  </div>-->
</template>
  
  <script>
export default {};
</script>
  
  <style>
.container-refresh {
  float: right;
  color: #215b7d;
}
</style>