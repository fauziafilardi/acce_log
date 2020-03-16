<template>
  <div class="dashboard-page-chart">
    <!-- <div class="dashboard-page-chart__title">
      <b-row>
        <b-col cols="12" class="dash-header">
          {{ $t("dashboard") }}
        </b-col>
      </b-row>
    </div>-->
    <div class="dashboard-page-chart__body">
      <b-row style="margin: 0px !important;">
        <b-col md="6" style="padding: 5px !important">
          <div class="card" style="font-size:11px;">
            <div class="dash-title">Log Book</div>
            <div class="card-body" style="padding:10px !important;">
              <b-list-group>
                <b-list-group-item
                  @click="onDataDblClick(index)"
                  v-for="(data, index) in DataLogBook"
                  href="#"
                  class="flex-column align-items-start"
                  v-bind:key="index"
                >
                  <div
                    style="
                          float: left;
                          margin: 0px 15px 0px 0px;
                        "
                  >
                    <div class="container-ava">
                      <ABSAvatar :fullname="data.customer_name" letter="2" size="54" />
                    </div>
                  </div>

                  <b-row>
                    <b-col>
                      <b-row>
                        <b-col md="5">
                          <p
                            class="p-list"
                            style="color: #F99500; font-size: 14px; font-weight: bold;"
                          >
                            <!-- color: orange, size: large, style: bold -->
                            {{ data.customer_name && data.customer_name != '' ? data.customer_name : '-' }}
                          </p>
                        </b-col>
                        <b-col md="5">
                          <p class="p-list" style="color: #0680FF; font-size: 11px;">
                            <!-- color: blue, size: small -->
                            {{ data.log_book_date && data.log_book_date != '' ? data.log_book_date : '-' }}
                          </p>
                        </b-col>
                        <b-col md="5">
                          <p class="p-list" style="color: #555555; font-size: 11px;">
                            <!-- color: black, size: small -->
                            {{ data.remark && data.remark != '' ? data.remark : '-' }}
                          </p>
                        </b-col>
                        <b-col md="5">
                          <p class="p-list" style="color: #2C9D05; font-size: 11px;">
                            <!-- color: green, size: small -->
                            {{ data.contact_status_descs && data.contact_status_descs != '' ? data.contact_status_descs : '-' }}
                          </p>
                        </b-col>
                        <b-col md="5">
                          <p class="p-list" style="color: #F50404; font-size: 11px;">
                            <!-- color: red, size: small -->
                            <!-- {{ data.follow_up_descs && data.follow_up_descs != '' ? data.follow_up_descs : '-' }}  -->
                            {{ data.follow_updescs && data.follow_updescs != '' ? data.follow_updescs : '-' }}
                          </p>
                        </b-col>
                      </b-row>
                    </b-col>
                    <b-col md="1" class="center-delete-list" style="max-width:100% !important;">
                      <ABSButton
                        v-show="isCanDelete"
                        text="Delete"
                        icon="trash"
                        classButton="button button--delete"
                        classIcon="icon-style-1"
                        styleButton
                        @click="M_Delete(index)"
                      />
                    </b-col>
                  </b-row>
                </b-list-group-item>
              </b-list-group>

              <b-row style="padding-top:10px">
                <b-col md="6" style="width:50%">
                  <ABSButton
                    text="New"
                    icon="plus"
                    classButton="button button--new"
                    classIcon="icon-style-1"
                    @click="doNew"
                    :disabled="!LogBookCanAdd"
                  />
                </b-col>
                <b-col md="6" style="width:50%;text-align:right">
                  <ABSButton
                    text="View More"
                    icon="file-excel"
                    classButton="button button--save"
                    classIcon="icon-style-1"
                    @click="viewMore"
                    :disabled="disabled"
                  />
                </b-col>
              </b-row>
            </div>
          </div>
        </b-col>
        <b-col md="6" style="padding: 5px !important">
          <div class="card">
            <div class="dash-title">Bar Chart</div>
            <div class="card-body">
              <bar-chart :data="dataBar"></bar-chart>
            </div>
          </div>
        </b-col>
      </b-row>
      <b-row style="margin: 0px !important;">
        <b-col md="12" style="padding: 5px !important">
          <div class="card">
            <div class="dash-title">Calender Schedule</div>
            <div class="card-body" id="testcalender">
              <CalenderView
                :events="items"
                :show-date="showDate"
                :time-format-options="{ hour: 'numeric', minute: '2-digit' }"
                :enable-drag-drop="true"
                :disable-past="disablePast"
                :disable-future="disableFuture"
                :show-event-times="showEventTimes"
                :display-period-uom="displayPeriodUom"
                :display-period-count="displayPeriodCount"
                :starting-day-of-week="startingDayOfWeek"
                :class="themeClasses"
                :period-changed-callback="periodChanged"
                :current-period-label="useTodayIcons ? 'icons' : ''"
                @drop-on-date="onDrop"
                @click-date="onClickDay"
                @click-event="onClickItem"
              >
                <CalenderViewHeader
                  slot="header"
                  slot-scope="t"
                  :header-props="t.headerProps"
                  @input="setShowDate"
                />
              </CalenderView>
            </div>
          </div>
        </b-col>
      </b-row>
      <b-row style="margin: 0px !important;">
        <b-col md="12" style="padding: 5px !important">
          <div class="card">
            <div class="dash-title">Area Chart</div>
            <div class="card-body">
              <area-chart :data="dataArea" :library="{backgroundColor: '#c69500'}"></area-chart>
            </div>
          </div>
        </b-col>
      </b-row>
      <b-row style="margin: 0px !important;">
        <b-col md="6" style="padding: 5px !important">
          <div class="card">
            <div class="dash-title">Line Chart</div>
            <div class="card-body">
              <line-chart :data="dataLine" />
            </div>
          </div>
        </b-col>
        <b-col md="6" style="padding: 5px !important">
          <div class="card">
            <div class="dash-title">Column Chart</div>
            <div class="card-body">
              <column-chart
                :data="dataColumn"
                :colors="['#b00', '#666', '#28a745']"
                :borderColor="['#b00', '#666', '#28a745']"
              ></column-chart>
            </div>
          </div>
        </b-col>
      </b-row>

      <b-row style="margin: 0px !important;">
        <b-col md="3" style="padding: 5px !important">
          <div class="card">
            <div class="dash-title">Pie Chart</div>
            <div class="card-body">
              <pie-chart :data="dataPie"></pie-chart>
            </div>
          </div>
        </b-col>
        <b-col md="3" style="padding: 5px !important">
          <div class="card">
            <div class="dash-title">Pie Chart</div>
            <div class="card-body">
              <pie-chart
                :data="dataPie"
                :donut="true"
                :library="{backgroundColor: '#c69500'}"
                :colors="['#b00', '#666']"
                :borderColor="['#b00', '#666']"
              ></pie-chart>
              <!-- <pie-chart :data="dataPie" :donut="true"></pie-chart> -->
            </div>
          </div>
        </b-col>
        <b-col md="3" style="padding: 5px !important">
          <div class="card">
            <div class="dash-title">Pie Chart</div>
            <div class="card-body">
              <pie-chart :data="dataPie" :donut="true" :library="{cutoutPercentage: 10}"></pie-chart>
            </div>
          </div>
        </b-col>
        <b-col md="3" style="padding: 5px !important">
          <div class="card">
            <div class="dash-title">Pie Chart</div>
            <div class="card-body">
              <pie-chart :data="dataPie" :dataset="{borderWidth: 10}"></pie-chart>
            </div>
          </div>
        </b-col>
      </b-row>
    </div>
  </div>
</template>

<script>
import { CalendarMathMixin } from "vue-simple-calendar";
require("vue-simple-calendar/static/css/default.css");
require("vue-simple-calendar/static/css/holidays-us.css");

export default {
  mixins: [CalendarMathMixin],
  data() {
    return {
      showDate: this.thisMonth(2),
      message: "",
      startingDayOfWeek: 0,
      disablePast: false,
      disableFuture: false,
      displayPeriodUom: "month",
      displayPeriodCount: 1,
      showEventTimes: true,
      newItemTitle: "",
      newItemStartDate: "",
      newItemEndDate: "",
      useDefaultTheme: true,
      useHolidayTheme: true,
      useTodayIcons: false,
      items: [
        // {
        // 	id: "e0",
        // 	startDate: "2018-01-05",
        // },
        // {
        // 	id: "e1",
        // 	startDate: this.thisMonth(15, 18, 30),
        // },
        // {
        // 	id: "e2",
        // 	startDate: this.thisMonth(15),
        // 	title: "Single-day item with a long title",
        // },
        // {
        // 	id: "e3",
        // 	startDate: this.thisMonth(7, 9, 25),
        // 	endDate: this.thisMonth(10, 16, 30),
        // 	title: "Multi-day item with a long title and times",
        // },
        // {
        // 	id: "e4",
        // 	startDate: this.thisMonth(20),
        // 	title: "My Birthday!",
        // 	classes: "birthday",
        // 	url: "https://en.wikipedia.org/wiki/Birthday",
        // },
        // {
        // 	id: "e5",
        // 	startDate: this.thisMonth(5),
        // 	endDate: this.thisMonth(12),
        // 	title: "Multi-day item",
        // 	classes: "purple",
        // },
        // {
        // 	id: "foo",
        // 	startDate: this.thisMonth(29),
        // 	title: "Same day 1",
        // },
        // {
        // 	id: "e6",
        // 	startDate: this.thisMonth(29),
        // 	title: "Same day 2",
        // 	classes: "orange",
        // },
        // {
        // 	id: "e7",
        // 	startDate: this.thisMonth(29),
        // 	title: "Same day 3",
        // },
        // {
        // 	id: "e8",
        // 	startDate: this.thisMonth(29),
        // 	title: "Same day 4",
        // 	classes: "orange",
        // },
        // {
        // 	id: "e9",
        // 	startDate: this.thisMonth(29),
        // 	title: "Same day 5",
        // },
        // {
        // 	id: "e10",
        // 	startDate: this.thisMonth(29),
        // 	title: "Same day 6",
        // 	classes: "orange",
        // },
        // {
        // 	id: "e11",
        // 	startDate: this.thisMonth(29),
        // 	title: "Same day 7",
        // },
      ],
      dataPie: [
        ["Blueberry", 44],
        ["Strawberry", 23],
        ["Banana", 23],
        ["Apple", 23],
        ["Grape", 23]
      ],
      dataBar: [
        ["Blueberry", 44],
        ["Strawberry", 23],
        ["Banana", 23],
        ["Apple", 23],
        ["Grape", 23]
      ],
      dataColumn: [
        ["Blueberry", 44],
        ["Strawberry", 23],
        ["Banana", 23],
        ["Apple", 23],
        ["Grape", 23]
      ],
      dataArea: {
        "2017-01-01 00:00:00 -0800": 2,
        "2017-01-02 00:01:00 -0800": 5,
        "2017-01-03 00:02:00 -0800": 10,
        "2017-01-04 00:03:00 -0800": 11,
        "2017-01-05 00:04:00 -0800": 30,
        "2017-01-06 00:05:00 -0800": 45,
        "2017-01-07 00:06:00 -0800": 50,
        "2017-01-08 00:07:00 -0800": 10
      },
      dataLine: [
        {
          name: "Workout",
          data: {
            "2017-01-01 00:00:00 -0800": 3,
            "2017-01-02 00:00:00 -0800": 4,
            "2017-01-3 00:00:00 -0800": 7
          }
        },
        {
          name: "Call parents",
          data: {
            "2017-01-01 00:00:00 -0800": 10,
            "2017-01-02 00:00:00 -0800": 6,
            "2017-01-4 00:00:00 -0800": 3
          }
        },
        {
          name: "Testimoni",
          data: {
            "2017-01-01 00:00:00 -0800": 4,
            "2017-01-02 00:00:00 -0800": 8,
            "2017-01-5 00:00:00 -0800": 6
          }
        },
        {
          name: "Eat",
          data: {
            "2017-01-01 00:00:00 -0800": 7,
            "2017-01-02 00:00:00 -0800": 10,
            "2017-01-3 00:00:00 -0800": 4
          }
        },
        {
          name: "Drink",
          data: {
            "2017-01-01 00:00:00 -0800": 8,
            "2017-01-02 00:00:00 -0800": 12,
            "2017-01-3 00:00:00 -0800": 9
          }
        },
        {
          name: "Summary",
          data: {
            "2017-01-01 00:00:00 -0800": 5,
            "2017-01-02 00:00:00 -0800": 14,
            "2017-01-3 00:00:00 -0800": 8
          }
        }
      ],

      currentPage: 1,
      perPage: 5,
      sort: "time_edit DESC",
      sourceField: "",
      paramView: "",

      PI_Ava: {
        fullname: "",
        size: 54,
        radius: 50,
        color: "",
        image: ""
      },

      OptionUrlLogBook: "MK_LogBook",
      DataLogBook: [],
      LogBookOption: null,
      LogBookCanAdd: true
    };
  },
  computed: {
    isCanAdd() {
      var canadd = this.LogBookOption
        ? this.LogBookOption.add_status == "1"
        : true;
      return canadd;
    },
    isCanDelete() {
      var candelete = this.LogBookOption
        ? this.LogBookOption.delete_status == "1"
        : true;
      return candelete;
    },
    userLocale() {
      return this.getDefaultBrowserLocale;
    },
    dayNames() {
      return this.getFormattedWeekdayNames(this.userLocale, "long", 0);
    },
    themeClasses() {
      return {
        "theme-default": this.useDefaultTheme,
        "holiday-us-traditional": this.useHolidayTheme,
        "holiday-us-official": this.useHolidayTheme
      };
    }
  },
  methods: {
    setShowDate(d) {
      this.showDate = d;
    },
    viewMore() {
      this.$router.push({
        name: "MK_LogBook_List2",
        params: { Option: this.LogBookOption }
      });
    },
    doNew() {
      this.$router.push({
        name: "MK_LogBook_New",
        params: { Option: this.LogBookOption }
      });
    },
    M_Delete(index) {
      this.alertConfirmation("Are You Sure Want To Delete This Data ?").then(
        result => {
          if (result.value) {
            var param = {
              OptionUrl: "MK_LogBook",
              LineNo: 0,
              mk_log_book_h_id: this.DataLogBook[index].row_id,
              lastupdatestamp: this.DataLogBook[index].lastupdatestamp
            };

            var url = this.getUrlV2(this.getUrlDelete());

            this.postJSON(url, param).then(response => {
              if (response == null) return;
              this.alertSuccess(response.Message);
              this.doGetList();
            });
          }
        }
      );
    },
    doGetLogBookOption() {
      var param = {
        OptionUrl: "MK/" + this.OptionUrlLogBook,
        user_id: this.getDataUser().user_id,
        subportfolio_cd: this.getDataUser().subportfolio_cd
      };

      this.postEncode(this.getPageInfoByOptionUrl(), param).then(response => {
        if (response == null) return;
        if (response.Data.length < 1) return;
        var data = response.Data[0];
        this.LogBookCanAdd = data.add_status == "1";

        this.LogBookOption = data;
      });
    },
    doGetList(search = "") {
      var param = {
        OptionUrl: this.OptionUrlLogBook,
        LineNo: 0,
        user_id: this.getDataUser().user_id,
        portfolio_cd: this.getDataUser().portfolio_cd,
        subportfolio_cd: this.getDataUser().subportfolio_cd,
        CurrentPage: this.currentPage,
        PerPage: this.perPage,
        ParamWhere: search,
        InitialWhere: "",
        SortField: this.sort,
        SourceField: this.sourceField,
        ParamView: this.paramView
      };

      var url = this.getUrlV2(this.getUrlList());

      this.postJSON(url, param).then(response => {
        if (response == null) return;
        this.DataLogBook = response.Data;
        this.doGetLogBookOption();

        // console.log(this.DataLogBook)

        // console.log(this.momentDateFormatting(response.Data[0].log_book_date, 'DD'))

        // var day = this.momentDateFormatting(response.Data[0].log_book_date, 'DD')

        for (let x = 0; x < response.Data.length; x++) {
          var D = response.Data[x].log_book_date;
          var res = D.substring(0, 2);
          var ND = parseInt(D);

          this.items.push({
            startDate: this.thisMonth(ND),
            title: response.Data[x].customer_name,
            id: response.Data[x].row_id,
            lastupdatestamp: response.Data[x].lastupdatestamp,
            classes: "purple"
          });
        }

        // console.log(this.items)

        // this.items.push({
        //     id: response.Data.no,
        //     startDate: this.thisMonth(20),
        //     title: "My Birthday!",
        //     classes: "birthday",
        //     url: "https://en.wikipedia.org/wiki/Birthday",
        //   }
        // )

        // var datas = []
        // for (let x = 0; x < response.Data.length; x ++) {
        //   datas.push({
        //     data: {
        //       firstname: response.Data[x].customer_name.match(/\b(\w)/g).join('').slice(0, 2),
        //       logbookdate: response.Data[x].log_book_date,
        //       customername: response.Data[x].customer_name,
        //       remark: response.Data[x].remark,
        //       contactstatusdescs: response.Data[x].contact_status_descs,
        //       followupdescs: response.Data[x].follow_up_descs
        //     }
        //   })
        // }

        // this.DataLogBook = datas
      });
    },
    onDataClick(index) {
      // if (index > -1) {
      //   this.DataLogBook[index].isActive = !this.DataLogBook[index].isActive ? false : true
      // }
    },
    onDataDblClick(index) {
      this.$router.push({
        name: "MK_LogBook_Edit",
        params: {
          Option: this.LogBookOption,
          mk_log_book_h_id: this.DataLogBook[index].row_id,
          lastupdatestamp: this.DataLogBook[index].lastupdatestamp
        }
      });
    },
    //calender start
    periodChanged() {
      // range, eventSource) {
      // Demo does nothing with this information, just including the method to demonstrate how
      // you can listen for changes to the displayed range and react to them (by loading items, etc.)
      //console.log(eventSource)
      //console.log(range)
    },
    thisMonth(d, h, m) {
      const t = new Date();
      return new Date(t.getFullYear(), t.getMonth(), d, h || 0, m || 0);
    },
    onClickDay(d) {
      // alert(d)
      this.message = `You clicked: ${d.toLocaleDateString()}`;
    },
    onClickItem(e) {
      // console.log(JSON.stringify(e))
      // console.log(JSON.stringify(e.originalEvent.id))
      // console.log(JSON.stringify(e.originalEvent.lastupdatestamp))
      this.$router.push({
        name: "MK_LogBook_New",
        params: {
          Option: this.LogBookOption,
          mk_log_book_h_id: e.originalEvent.id,
          lastupdatestamp: e.originalEvent.lastupdatestamp
        }
      });
      // this.message = `You clicked: ${e.title}`
    },
    setShowDate(d) {
      this.message = `Changing calendar view to ${d.toLocaleDateString()}`;
      this.showDate = d;
    },
    onDrop(item, date) {
      this.message = `You dropped ${item.id} on ${date.toLocaleDateString()}`;
      // Determine the delta between the old start date and the date chosen,
      // and apply that delta to both the start and end date to move the item.
      const eLength = this.dayDiff(item.startDate, date);
      item.originalEvent.startDate = this.addDays(item.startDate, eLength);
      item.originalEvent.endDate = this.addDays(item.endDate, eLength);
    },
    clickTestAddItem() {
      this.items.push({
        startDate: this.newItemStartDate,
        endDate: this.newItemEndDate,
        title: this.newItemTitle,
        id:
          "e" +
          Math.random()
            .toString(36)
            .substr(2, 10)
      });
      this.message = "You added a calendar item!";
    }
    //calender end
  },
  mounted() {
    // this.doGetList();
    // document.getElementById('nama').innerHTML = this.DataLogBook[index].customer_name.charAt(0)
    this.newItemStartDate = this.isoYearMonthDay(this.today());
    this.newItemEndDate = this.isoYearMonthDay(this.today());
  }
};
</script>

<style scoped>
/* calender Start */
#testcalender {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  color: #2c3e50;
  height: 100vh;
  /*width: 90vw; */
  width: 100%;
  margin-left: auto;
  margin-right: auto;
}
.calendar-controls {
  margin-right: 1rem;
  min-width: 14rem;
  max-width: 14rem;
}
.calendar-parent {
  display: flex;
  flex-direction: column;
  flex-grow: 1;
  overflow-x: hidden;
  overflow-y: hidden;
  max-height: 80vh;
  background-color: white;
}
/* For long calendars, ensure each week gets sufficient height. The body of the calendar will scroll if needed */
.cv-wrapper.period-month.periodCount-2 .cv-week,
.cv-wrapper.period-month.periodCount-3 .cv-week,
.cv-wrapper.period-year .cv-week {
  min-height: 6rem;
}
/* These styles are optional, to illustrate the flexbility of styling the calendar purely with CSS. */
/* Add some styling for items tagged with the "birthday" class */
.theme-default .cv-event.birthday {
  background-color: #e0f0e0;
  border-color: #d7e7d7;
}
.theme-default .cv-event.birthday::before {
  content: "\1F382"; /* Birthday cake */
  margin-right: 0.5em;
}
/* Calender End */

/* .card {
      font-size: 11px !important;
    } */
.card-list {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  transition: 0.3s;
  width: 100%;
  /* margin:15px; */
}

.card-list:hover {
  box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}

.container-list {
  padding: 2px 20px;
}

/* .p-list {
    margin-bottom: 0px !important;
    margin-top: 0px !important;
  } */

.list-group {
  padding-bottom: 0px !important;
}

.list-group-item {
  padding: 5px 10px !important;
}
.div-ava {
  width: 54px;
  height: 54px;
  border-radius: 100px;
  background: #86e4ecb0;
}
.div-nameava {
  width: 100%;
  text-align: center;
  color: white;
  font-size: 34px;
}
.dash-title {
  font-size: 13px;
  font-weight: bold;
  font-family: "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
  color: #676a6c;
  padding: 0.75rem 1.25rem;
  margin-bottom: 0;
  background-color: rgb(255, 255, 255) !important;
  border-bottom: 1px solid #e7eaec !important;
}
.dash-header {
  font-size: 20px;
  font-family: "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
  color: #676a6c;
  font-weight: normal !important;
}
</style>
