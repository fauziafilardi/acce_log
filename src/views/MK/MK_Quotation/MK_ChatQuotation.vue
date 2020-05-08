<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Quotation</span>
                </b-col>
                <b-col style="text-align: right;">
                  <ABSButton
                    :text="'Back'"
                    classButton="button button--back"
                    classIcon="icon-style-1"
                    @click="doBack"
                  />
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <b-form :data-vv-scope="'MK_AddQuotation'" :data-vv-value-path="'MK_AddQuotation'">
                <b-row>
                  <b-col md="2" style="text-align: center;">
                    <img :src="require('@/assets/paper.png')" alt style="width: 70px;" />
                  </b-col>
                  <b-col md="10">
                    <b-row>
                      <b-col md="3" style="width: 36% !important">
                        <span>
                          <label style="color: #999999; margin-bottom: 0px !important;">Date</label>
                        </span>
                        <br />
                        <span>{{ M_Quotation.date }}</span>
                      </b-col>
                      <b-col md="3" style="width: 26% !important">
                        <span>
                          <label style="color: #999999; margin-bottom: 0px !important;">Type</label>
                        </span>
                        <br />
                        <span>{{ M_Quotation.type }}</span>
                      </b-col>
                      <b-col md="3" style="width: 38% !important">
                        <span>
                          <label
                            style="color: #999999; margin-bottom: 0px !important;"
                          >Quotation Number</label>
                        </span>
                        <br />
                        <span>{{ M_Quotation.quotation_no }}</span>
                      </b-col>
                    </b-row>
                    <b-row
                      style="margin-top: 10px !important; margin-bottom: 10px !important; font-size: 15px !important"
                    >
                      <b-col>
                        <span>{{ M_Quotation.project_name }}</span>
                      </b-col>
                    </b-row>
                    <b-row style="margin-bottom: 10px; !important">
                      <b-col style="text-align: justify;">
                        <span>{{ M_Quotation.descs }}</span>
                      </b-col>
                    </b-row>
                    <hr />
                    <b-row>
                      <div
                        style="width: 100%;max-height: 290px;overflow: auto;margin-bottom: 10px;"
                      >
                        <b-col md="12">
                          <div class="chat">
                            <template v-for="(data,index) in ChatFill">
                              <div
                                v-bind:key="index"
                                :class="data.position == 'r' ? 'bubble-me me' : 'bubble-you you'"
                              >
                                <p>{{data.chat_text}}</p>
                                <span
                                  :class="data.position == 'r' ? 'time-right' : 'time-left'"
                                >{{ data.user_name }}</span>
                              </div>
                            </template>

                            <!-- <div class="bubble-you you">
                              <p>Hello there!</p>
                              <span class="time-left">First User</span>
                            </div>
                            <div class="bubble-me me">
                              <p>Hi. I'm an expandeable Hi. I'm an expandeable Hi. I'm an expandeableHi. I'm an expandeableHi. I'm an expandeableHi. I'm an expandeableHi. I'm an expandeableHi. I'm an expandeable</p>
                              <span class="time-right">Second User</span>
                            </div>
                            <div class="bubble-you you">
                              <p>Awesome.</p>
                              <span class="time-left">First User</span>
                            </div> -->
                          </div>
                        </b-col>
                      </div>
                    </b-row>
                    <b-row>
                      <b-col md="12">
                        <ACCTextBox @onEnterPress="doSendChat" :prop="PI_chat" v-model="M_Quotation.chat" ref="ref_chat" />
                        <span style="top: 10px; position: absolute; right: 10px;">
                          <font-awesome-icon
                            class="icon-style-default"
                            icon="paper-plane"
                            size="sm"
                            style="font-size: 17px;
                                margin-right: 10px;
                                margin-left: 10px;
                                cursor: pointer;"
                            @click="doSendChat"
                          />
                        </span>
                      </b-col>
                    </b-row>
                  </b-col>
                </b-row>
              </b-form>
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
      M_Quotation: {
        chatid: "",
        date: "",
        type: "",
        quotation_no: "",
        project_name: "",
        descs: "",
        chat: ""
      },
      PI_chat: {
        cValidate: "",
        cName: "chat",
        cOrder: 12,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      ChatFill: [],
      timeout: null
    };
  },
  computed: {
    paramFromList() {
      var param = this.$route.params;
      if (param == null || param == undefined) {
        this.doBack();
      } else {
        if (Object.keys(param).length < 1) {
          this.doBack();
        } else {
          return param;
        }
      }
    }
  },
  methods: {
    doSendChat() {
      this.ChatFill.push({
        position: "r",
        chat_date: new Date(),
        chat_text: this.M_Quotation.chat,
        user_id_from: this.getDataUser().user_id,
        user_name: this.getDataUser().user_name
      });

      var param = {
        ss_chat_h_id: this.M_Quotation.chatid,
        chat_text: this.M_Quotation.chat,
        chat_date: new Date(),
        user_id_from: this.getDataUser().user_id,
        // user_id_to: "OPI",
        user_input: this.getDataUser().user_id
      }

      this.postJSON(this.getUrlAPIChat(), param).then(response => {
        if (response == null) return;
      });
    },
    doBack() {
      this.$router.go(-1);
    },
    M_ClearForm() {
      this.M_Quotation = {
        chatid: "",
        customer: "",
        fulladdress: "",
        address: "",
        phone_no: "",
        email: "",
        website: "",
        pic: "",
        pic_phone_no: ""
      };
    },
    GetDataBy() {
      var param = {
        option_url: "/MK/MK_Quotation",
        line_no: 0,
        id: this.paramFromList.dataList.row_id,
        lastupdatestamp: this.paramFromList.dataList.lastupdatestamp
      };

      this.getJSON(this.getUrlCRUD(), param).then(response => {
        // response from API
        console.log(response);
        if (response == null) return;

        var data = response.Data[0];

        this.M_Quotation = {
          // customer: data.name,
          // fulladdress:
          //   data.address +
          //   ", " +
          //   data.district +
          //   ", " +
          //   data.city +
          //   ", " +
          //   data.province +
          //   " - " +
          //   data.country,
          // address: data.address,
          // phone_no: data.phone_no && data.phone_no !== "" ? data.phone_no : "-",
          // email: data.email && data.email !== "" ? data.email : "-",
          // website: data.website && data.website !== "" ? data.website : "-",
          // pic:
          //   data.contact_person && data.contact_person !== ""
          //     ? data.contact_person
          //     : "-",
          // pic_phone_no:
          //   data.contact_phone_no && data.contact_phone_no !== ""
          //     ? data.contact_phone_no
          //     : "-",
          date:
            data.quotation_date && data.quotation_date !== ""
              ? this.momentDateFormatting(
                  new Date(data.quotation_date),
                  "DD-MM-YYYY HH.mm"
                )
              : "-",
          type: data.type && data.type !== "" ? data.type : "-",
          quotation_no:
            data.quotation_no && data.quotation_no !== ""
              ? data.quotation_no
              : "-",
          project_name:
            data.project_name && data.project_name !== ""
              ? data.project_name
              : "-",
          descs: data.descs && data.descs !== "" ? data.descs : "-"
          // project_value:
          //   data.project_value && data.project_value !== ""
          //     ? this.isCurrency(data.project_value, this.decimal)
          //     : "-",
          // valid_until:
          //   data.expired_date && data.expired_date !== ""
          //     ? this.momentDateFormatting(
          //         new Date(data.expired_date),
          //         "DD-MM-YYYY"
          //       )
          //     : "-"
        };

        this.GetChat();
      });
    },
    GetChat() {
      var param = {
        portfolio_id: this.getDataUser().portfolio_id,
        subportfolio_id: this.getDataUser().subportfolio_id,
        doc_type: "quotation",
        doc_no: this.M_Quotation.quotation_no
      };

      this.postJSON(this.getUrlCheckChat(), param).then(response => {
        // response from API
        console.log(response);
        if (response == null) return;

        var data = response;
        var chatFill = data.Data.chat && data.Data.chat.length > 0 ? data.Data.chat : [];
        this.M_Quotation.chatid = data.Data.row_id
        // this.M_Quotation.chat_to
        this.ChatFill = [];
        var isUs = this.getDataUser().user_name;
        for (let i = 0; i < chatFill.length; i++) {
          this.ChatFill.push({
            position: chatFill[i].user_name == isUs ? "r" : "l",
            chat_date: chatFill[i].chat_date,
            chat_text: chatFill[i].chat_text,
            user_id_from: chatFill[i].user_id_from,
            user_name: chatFill[i].user_name
          });
        }

        this.LoopChat();
      });
    },
    GetNewChat() {
      var param = {
        id: this.M_Quotation.chatid,
        user_id: this.getDataUser().user_id
      };

      this.getJSON(this.getUrlAPIChat(), param).then(response => {
        // response from API
        console.log(response);
        if (response == null) return;

        var data = response;
        var chatFill = data.Data && data.Data.length > 0 ? data.Data : [];
        for (let i = 0; i < chatFill.length; i++) {
          this.ChatFill.push({
            position: "l",
            chat_date: chatFill[i].chat_date,
            chat_text: chatFill[i].chat_text,
            user_id_from: chatFill[i].user_id_from,
            user_name: chatFill[i].user_name
          });
        }

        this.LoopChat();
      });
    },
    LoopChat() {
      this.timeout = setTimeout(() => {
        this.GetNewChat();
      }, 15000);
    }
  },
  mounted() {
    this.M_ClearForm();
    this.GetDataBy();

    // this.LoopChat()
  },
  beforeDestroy() {
    clearTimeout(this.timeout)
  }
};
</script>

<style scoped>
/* .container {
  border: 2px solid #dedede;
  background-color: #f1f1f1;
  border-radius: 5px;
  padding: 10px;
  padding: 5px 10px 5px 10px;
  margin: 10px 0;
}

.darker {
  color: white;
  border-color: #333399;
  background-color: #333399;
}

.container::after {
  content: "";
  clear: both;
  display: table;
}

.container img {
  float: left;
  max-width: 60px;
  width: 100%;
  margin-right: 20px;
  border-radius: 50%;
}

.container img.right {
  float: right;
  margin-left: 20px;
  margin-right: 0;
}

.time-right {
  float: right;
  color: #aaa;
}

.time-left {
  float: left;
  color: #ccc;
} */

p {
  margin-top: 0px !important;
  margin-bottom: 0px !important;
  text-align: justify;
}

/* New */
.chat {
  /* width: 620px; */
}

.bubble-me {
  background-color: #333399;
  border-radius: 5px;
  box-shadow: 0 0 6px #b2b2b2;
  display: inline-block;
  padding: 10px 18px;
  position: relative;
  vertical-align: top;
  width: 50%;
}

.bubble-me::before {
  background-color: #333399;
  content: "\00a0";
  display: block;
  height: 16px;
  position: absolute;
  top: 11px;
  transform: rotate(29deg) skew(-35deg);
  -moz-transform: rotate(29deg) skew(-35deg);
  -ms-transform: rotate(29deg) skew(-35deg);
  -o-transform: rotate(29deg) skew(-35deg);
  -webkit-transform: rotate(29deg) skew(-35deg);
  width: 20px;
}

.bubble-you {
  background-color: #f2f2f2;
  border-radius: 5px;
  box-shadow: 0 0 6px #b2b2b2;
  display: inline-block;
  padding: 10px 18px;
  position: relative;
  vertical-align: top;
  width: 50%;
}

.bubble-you::before {
  background-color: #f2f2f2;
  content: "\00a0";
  display: block;
  height: 16px;
  position: absolute;
  top: 11px;
  transform: rotate(29deg) skew(-35deg);
  -moz-transform: rotate(29deg) skew(-35deg);
  -ms-transform: rotate(29deg) skew(-35deg);
  -o-transform: rotate(29deg) skew(-35deg);
  -webkit-transform: rotate(29deg) skew(-35deg);
  width: 20px;
}

.me {
  float: right;
  margin: 5px 20px 5px 45px;
  color: white;
}

.me::before {
  box-shadow: 2px -2px 2px 0 rgba(178, 178, 178, 0.4);
  right: -9px;
}

.you {
  float: left;
  margin: 5px 45px 5px 20px;
}

.you::before {
  box-shadow: -2px 2px 2px 0 rgba(178, 178, 178, 0.4);
  left: -9px;
}

.time-right {
  float: right;
  color: white;
}

.time-left {
  float: left;
  color: black;
}
</style>