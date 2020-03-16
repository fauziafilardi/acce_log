<template>
  <div class="abs-login">
    <div class="abs-login__box-position-left">
      <div class="box-layer-form" style="width:100%;">
        <div class="row">
          <div class="column-left">
            <img :src="require('@/assets/acce_logo.png')" alt />
            <br />
            <span style="font-size:18px;color:hsl(0, 0%, 58%);">Transportation Management System</span>
          </div>
          <div class="column-right">
            <div class="box-layer-form">
              <div class="box-login-form">
                <b-form @submit.prevent="onSubmit">
                  <div class="form-label-group">
                    <input
                      v-model="userName"
                      type="text"
                      id="inputUsername"
                      class="form-control input-field"
                      placeholder="Username"
                      autofocus
                      autocomplete="off"
                      style="height:50px;border-radius:8px !important;font-size:14px !important;font-weight:400;margin-bottom:12px;"
                    />
                  </div>
                  <div class="form-label-group">
                    <input
                      v-model="passWord"
                      type="password"
                      id="inputPassword"
                      class="form-control"
                      placeholder="Password"
                      autocomplete="off"
                      style="height:50px;border-radius:8px !important;font-size:14px !important;font-weight:400;margin-bottom:12px;"
                    />
                  </div>
                  <div v-show="captchaTxt">
                    <label
                      style="text-align: center; width: 100%; background-color: cadetblue; border-radius: 5px;"
                      for="captcha"
                    >{{captcha}}</label>
                    <input
                      v-model="captCha"
                      type="text"
                      id="inputCaptcha"
                      class="form-control"
                      placeholder="input captcha"
                      autocomplete="off"
                      style="height:50px;border-radius:8px !important;font-size:14px !important;font-weight:400;margin-bottom:12px;"
                    />
                  </div>
                  <!-- <div class="checkbox mb-3">
                    <label>
                      <input type="checkbox" v-model="rememberMe" /> Remember me
                    </label>
                  </div>-->
                  <button
                    class="btn btn-big btn-block"
                    style="background-color:hsl(240, 49%, 41%);height:50px;color:white;border-radius:8px;font-size:14px !important;margin-bottom:5px;"
                    type="submit"
                  >Sign In</button>
                  <div class="forgot-password" style="text-align:center;">
                    <a href="#">
                      <label
                        for
                        style="font-size:14px !important;color:hsl(240, 49%, 41%);"
                      >Forget Password ?</label>
                    </a>
                  </div>
                </b-form>
              </div>
            </div>
          </div>
          <ABSLoader />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Vue from "vue";
import VueSweetalert2 from "vue-sweetalert2";
Vue.use(VueSweetalert2);

export default {
  data() {
    return {
      userName: null,
      passWord: null,
      rememberMe: false,
      captchaTxt: false,
      captcha: "",
      captCha: ""
    };
  },
  mounted() {
    // clear cookies
    // document.cookie = ""
    // jika dia mau sign-in sedangkan datanya masih ada di localStorage maka push ke dashboard
    if (this.getDataUser() != undefined) {
      this.$router.replace({
        path: "/"
      });
    } else {
      var cookies = document.cookie.split(";");
      if (cookies == "") {
        return;
      }
      for (var i = 0; i < cookies.length; i++) {
        var x = cookies[i].split("=");

        if (x[0].trim() == "username") {
          this.userName = x[1];
        } else if (x[0].trim() == "password") {
          this.passWord = x[1];
        }
      }
      if (this.userName != null || this.passWord != null) {
        this.rememberMe = true;
      }
    }
  },
  methods: {
    showAlert(title, message, icon) {
      // icon alert=>warning, error, success, info
      this.$swal(title, message, icon);
    },
    onSubmit() {
      this.$store.commit("setStatusLoader", true);

      let param = {
        UserLog: this.userName,
        PassLog: this.passWord,
        Captcha: this.captCha
      };

      axios
        .post(this.getUrlLogin(), param, {
          headers: {
            "Content-Type": "application/json",
            Accept: "application/json"
          }
        })
        .then(response => {
          this.$store.commit("setStatusLoader", false);

          var responses = response.data;
          var error = responses.Error;
          var message = responses.Message;

          // console.log(responses.Data.Captcha);
          // return;

          // if (error) {
          //   this.showAlert("Warning", message, "warning");
          // } else {
          var data = responses;

          var dataUser = data.Data.data_user;

          // document.cookie = "googtrans=/en/" + dataUser.default_language;

          if (this.rememberMe) {
            var dataCookie = "username=" + this.userName; // + '; path=/sign-in' + ''
            document.cookie = dataCookie;

            dataCookie = "password=" + this.passWord; // + '; path=/sign-in' + ''
            document.cookie = dataCookie;
          }

          // var favoriteMenu = JSON.stringify(data.FavoriteMenu);
          var menu = JSON.stringify(data.Data.menu);

          const session = {
            Session_Id: data.Data.token,
            sessionIdle: data.Data.idle
          };

          // set language hardcode
          // dataUser.language = "en";

          localStorage.lsDataUser = JSON.stringify(dataUser);

          // localStorage.lsFavoriteMenu = favoriteMenu;
          localStorage.lsMenu = menu;

          localStorage.lsSession = JSON.stringify(session);

          this.$router.push("/");
          location.reload();
          // }
        })
        .catch(err => {
          this.showAlert("Warning", err.response.data.Message, "warning");

          this.captcha = err.response.data.Data.Captcha;

          if (this.captcha == "" || this.captcha == undefined) {
            this.captchaTxt = false;
          } else {
            this.captchaTxt = true;
            document.getElementById("inputCaptcha").required;
          }
          this.$store.commit("setStatusLoader", false);
        });
    },
    onSubmit_() {
      this.$store.commit("setStatusLoader", true);
      var querystring = require("querystring");
      axios
        .post(
          this.getUrlLogin(),
          querystring.stringify({
            UserLog: this.userName,
            PassLog: this.passWord
          }),
          {
            headers: {
              "Content-Type": "application/json",
              Accept: "application/json"
            }
          }
        )
        .then(response => {
          this.$store.commit("setStatusLoader", false);
          // response from API
          var responses = response.data;
          // console.log(responses);

          var error = responses.Error;
          var message = responses.Message;

          if (error) {
            this.showAlert("Warning", message, "warning");
          } else {
            var data = responses.Data;
            var dataUser = data.DataUser[0];

            document.cookie = "googtrans=/en/" + dataUser.default_language;

            if (this.rememberMe) {
              var dataCookie = "username=" + this.userName; // + '; path=/sign-in' + ''
              document.cookie = dataCookie;

              dataCookie = "password=" + this.passWord; // + '; path=/sign-in' + ''
              document.cookie = dataCookie;
            }

            var favoriteMenu = JSON.stringify(data.FavoriteMenu);
            var menu = JSON.stringify(data.Menu);

            const session = {
              Session_Id: data.Session_Id,
              sessionIdle: data.Idle
            };

            // set language hardcode
            dataUser.language = "en";

            localStorage.lsDataUser = JSON.stringify(dataUser);

            localStorage.lsFavoriteMenu = favoriteMenu;
            localStorage.lsMenu = menu;

            localStorage.lsSession = JSON.stringify(session);

            this.$router.push("/");
            location.reload();
          }
        })
        .catch(err => {
          // console.log(err)
          this.$store.commit("setStatusLoader", false);
        });
    }
  }
};
</script>

<style scoped>
/* .btn-login {
  background-color: #55b3ff;
  color: #ffffff;
} */
.vue-treeselect__control {
  border-radius: 0px;
}
/* ::placeholder {
  color: white !important;
} */

* {
  box-sizing: border-box;
}

/* Create two equal columns that floats next to each other */
.column-left {
  text-align: center;
  float: right;
  width: 50%;
  padding: 10px;
  /* height: 250px; Should be removed. Only for demonstration */
}

.column-right {
  float: left;
  background-color: white;
  padding: 30px;
  border-radius: 8px;
  width: 384px;
  margin: unset;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - makes the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .column {
    width: 100%;
  }
}
</style>
