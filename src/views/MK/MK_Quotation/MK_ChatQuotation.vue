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
                      <div style="width: 100%;max-height: 290px;overflow: auto;">
                        <b-col md="12">
                          <div class="container">
                            <!-- <img
                              :src="require('@/assets/avatar.png')"
                              alt="Avatar"
                              style="width:30px;"
                            />-->
                            <p>Hello. How are you today?</p>
                            <span class="time-right">11:00</span>
                          </div>

                          <div class="container darker">
                            <!-- <img
                              :src="require('@/assets/avatar.png')"
                              alt="Avatar"
                              class="right"
                              style="width:30px;"
                            />-->
                            <p>Hey! I'm fine. Thanks for asking!</p>
                            <span class="time-left">11:01</span>
                          </div>

                          <div class="container">
                            <!-- <img
                              :src="require('@/assets/avatar.png')"
                              alt="Avatar"
                              style="width:30px;"
                            />-->
                            <p>Sweet! So, what do you wanna do today?</p>
                            <span class="time-right">11:02</span>
                          </div>

                          <div class="container darker">
                            <!-- <img                              
                            :src="require('@/assets/avatar.png')"
                              alt="Avatar"
                              class="right"
                              style="width:30px;"
                            />-->
                            <p>Nah, I dunno. Play soccer.. or learn more coding perhaps?</p>
                            <span class="time-left">11:05</span>
                          </div>
                        </b-col>
                      </div>
                    </b-row>
                    <b-row>
                      <b-col md="12">
                        <ACCTextBox :prop="PI_chat" v-model="M_Quotation.chat" ref="ref_chat" />
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
      }
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
      alert("Chat Send");
    },
    doBack() {
      this.$router.go(-1);
    },
    M_ClearForm() {
      this.M_Quotation = {
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
      });
    }
  },
  mounted() {
    this.M_ClearForm();
    this.GetDataBy();
  }
};
</script>

<style scoped>
.container {
  border: 2px solid #dedede;
  background-color: #f1f1f1;
  border-radius: 5px;
  /* padding: 10px; */
  padding: 5px 10px 5px 10px;
  margin: 10px 0;
}

.darker {
  border-color: #ccc;
  background-color: #ddd;
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
  color: #999;
}

p {
  margin-top: 0px !important;
  margin-bottom: 0px !important;
}
</style>