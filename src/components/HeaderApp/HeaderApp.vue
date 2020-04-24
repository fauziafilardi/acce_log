<template>
  <div>
    <!-- <b-modal id="modallg" size="lg" title="Change SubPortFolio">
      <b-container fluid>
        <b-row class="mb-1 text-center">
        </b-row>
      </b-container>
      <div slot="modal-footer" class="w-100">
      </div>
    </b-modal>-->
    <div
      class="header--top"
      id="header--top"
      :class="{ 'header--dark': classHeader }"
      :style="{ paddingLeft: paddingHeader }"
    >
      <!-- <div
      class="header--top"
      id="header--top"
      :class="{ 'header--dark': classHeader }"      
      >-->
      <!-- <div class="pull--left">
        <router-link :to="'/'">
          <div class="header--top__tagline">
            <font-awesome-icon icon="bars"/>
            PAMS APP
          </div>
        </router-link>
      </div>-->

      <!-- <div 
        class="pull--left"
        @click="offText"         
        v-if="textMenu"
      >        
          <div class="header--top__tagline">
            <font-awesome-icon icon="bars" />
            PAMS APP
          </div>        
      </div>
      <div 
        class="pull--left"
        @click="onText"         
        v-else
      >        
          <div class="header--top__tagline">
            <font-awesome-icon icon="bars"/>
            PAMS APP
          </div>        
      </div>-->
      <span>
        <div class="pull--left" v-if="textMenu">
          <div class="header--top__tagline" @click="offText">
            <div
              style="border-radius: 5px;
                  background-color: #333399;
                  border: 0px;
                  height: 32px;
                  width: 42px;
                  margin-left: 8px"
            >
              <font-awesome-icon
                icon="bars"
                style="color: white;
                    margin-bottom: 3px;
                    margin-left: 12px;"
              />
            </div>
          </div>
        </div>
        <div class="pull--left" v-else>
          <div class="header--top__tagline" @click="onText">
            <div
              style="border-radius: 5px;
                  background-color: #333399;
                  border: 0px;
                  height: 32px;
                  width: 42px;
                  margin-left: 8px"
            >
              <font-awesome-icon
                icon="bars"
                style="color: white;
                    margin-bottom: 4px;
                    margin-left: 12px;"
              />
            </div>
          </div>
        </div>
      </span>
      <!-- <div class="logo"> -->
      <span>
        <img :src="require('@/assets/acce_logo.png')" alt style="width: 130px;" />
      </span>
      <!-- </div> -->

      <div class="pull--right">
        <div class="header--top__info-subportfolio notranslate">
          {{label}}
          <!-- | {{language}} -->
        </div>
        <!-- <div class="container-notif">
          <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
            <i class="fa fa-envelope" style="color: #c8c4c4;"></i>  <span class="label label-warning notif">16</span>
          </a>
          <ul class="dropdown-menu dropdown-messages dropdown-menu-right">
            <li>
                <div class="dropdown-messages-box">
                    <a class="dropdown-item float-left" href="#">
                        <ABSAvatar :image="require('@/assets/avatar.png')"  size="45" />
                    </a>
                    <div class="media-body">
                        <small class="float-right">46h ago</small>
                        <strong>Mike Loreipsum</strong> started following <strong>Monica Smith</strong>. <br>
                        <small class="text-muted">3 days ago at 7:58 pm - 10.06.2014</small>
                    </div>
                </div>
            </li>
            <li class="dropdown-divider"></li>
            <li>
                <div class="dropdown-messages-box">
                    <a class="dropdown-item float-left" href="#">
                        <ABSAvatar :image="require('@/assets/avatar.png')"  size="45" />
                    </a>
                    <div class="media-body ">
                        <small class="float-right text-navy">5h ago</small>
                        <strong>Chris Johnatan Overtunk</strong> started following <strong>Monica Smith</strong>. <br>
                        <small class="text-muted">Yesterday 1:21 pm - 11.06.2014</small>
                    </div>
                </div>
            </li>
            <li class="dropdown-divider"></li>
            <li>
                <div class="dropdown-messages-box">
                    <a class="dropdown-item float-left" href="#">
                        <ABSAvatar :image="require('@/assets/avatar.png')"  size="45" />
                    </a>
                    <div class="media-body ">
                        <small class="float-right">23h ago</small>
                        <strong>Monica Smith</strong> love <strong>Kim Smith</strong>. <br>
                        <small class="text-muted">2 days ago at 2:30 am - 11.06.2014</small>
                    </div>
                </div>
            </li>
            <li class="dropdown-divider"></li>
            <li>
                <div class="text-center link-block">
                    <a href="mailbox.html" class="dropdown-item">
                        <i class="fa fa-envelope"></i> <strong>Read All Messages</strong>
                    </a>
                </div>
            </li>
          </ul>
        </div>-->
        <!-- <div class="container-notif">
          <a
            class="dropdown-toggle count-info"
            data-toggle="dropdown"
            href="#"
            @click="dropdownMenuFavorite = !dropdownMenuFavorite"
            v-click-outside="closeFavorite"
          >
            <i class="fa fa-star" style="color: #c8c4c4;"></i>
          </a>          
        </div>-->

        <div class="container-notif">
          <a
            class="dropdown-toggle count-info"
            data-toggle="dropdown"
            href="#"
            @click="notification()"
          >
            <i class="fa fa-bell" style="color: #999999;"></i>
            <span class="label label-primary notif">8</span>
          </a>
          <!-- <ul
            class="dropdown-menu dropdown-menu-left dropdown-alerts"
            style="right: -150% !important;"
          >
            <li>
              <a href="#" class="dropdown-item">
                <div>
                  <i class="fa fa-envelope fa-fw"></i> You have 16 messages
                  <span class="float-right text-muted small">4 minutes ago</span>
                </div>
              </a>
            </li>
            <li class="dropdown-divider"></li>
            <li>
              <a href="#" class="dropdown-item">
                <div>
                  <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                  <span class="float-right text-muted small">12 minutes ago</span>
                </div>
              </a>
            </li>
            <li class="dropdown-divider"></li>
            <li>
              <a href="#" class="dropdown-item">
                <div>
                  <i class="fa fa-upload fa-fw"></i> Server Rebooted
                  <span class="float-right text-muted small">4 minutes ago</span>
                </div>
              </a>
            </li>
            <li class="dropdown-divider"></li>
            <li>
              <div class="text-center link-block">
                <a href="#" class="dropdown-item">
                  <strong>See All Alerts</strong>
                  <i class="fa fa-angle-right"></i>
                </a>
              </div>
            </li>
          </ul>-->
        </div>

        <!-- <div
          class="header--top__profile-menu"
          @click="dropdownMenuHeaderTop = !dropdownMenuHeaderTop"
          v-click-outside="closeHeader"
        >
          <div class="avatar">
            <div class="image">              
              <font-awesome-icon icon="sign-out-alt" style="color: #999999;" />
            </div>
          </div>
          <div class="information">
            <div class="username notranslate" title="EPRO">Logout</div>
          </div>
        </div>-->
        <div class="header--top__profile-menu" @click="signOut" v-click-outside="closeHeader">
          <div class="avatar">
            <div class="image">
              <font-awesome-icon icon="sign-out-alt" style="color: #999999;" />
            </div>
          </div>
          <div class="information">
            <div class="username notranslate" title="EPRO">Logout</div>
          </div>
        </div>
      </div>
    </div>
    <div class="dropdown-profile" v-if="dropdownMenuHeaderTop">
      <div class="dropdown-profile__list-menu">
        <div @click="showChangeSubportfolio()" class="list">
          <div class="title">
            <span>Change Sub Portfolio</span>
          </div>
          <div class="icon">
            <i class="icon-list"></i>
          </div>
        </div>
        <!-- <div v-b-modal.modal-language class="list">
          <div class="title">
            <span>Change Language</span>
          </div>
          <div class="icon">
            <i class="icon-film"></i>
          </div>
        </div>-->
        <div @click="changePassword" class="list">
          <div class="title">
            <span>Change Password</span>
          </div>
          <div class="icon">
            <i class="icon-key"></i>
          </div>
        </div>
        <div @click="myProfile" class="list">
          <div class="title">
            <span>My Profile</span>
          </div>
          <div class="icon">
            <i class="icon-user"></i>
          </div>
        </div>
        <div @click="signOut" class="list">
          <div class="title">
            <span>Sign Out</span>
          </div>
          <div class="icon">
            <i class="icon-logout"></i>
          </div>
        </div>
      </div>
    </div>

    <!-- <div class="dropdown-profile" style="right:18% !important;" v-if="dropdownMenuFavorite">
      <div class="dropdown-profile__list-menu">
        <div v-for="(fm, index) in favoriteMenus" :key="index" @click="doCallMenu(fm)" class="list">
          <div class="title">
            <span>{{fm.text_menu}}</span>
          </div>
          <div class="icon">
            <i class="icon-star"></i>
          </div>
        </div>
      </div>
    </div>-->

    <!-- MODAL CHANGE SUB PORTFLIO -->
    <b-modal
      id="modal-center"
      :hide-footer="true"
      :hide-header-close="true"
      ref="modalSubPortfolio"
      centered
      class="modal-customize-abs"
    >
      <b-container class="bv-example-row">
        <b-row>
          <b-col sm="12">
            <div class="modal-customize-abs__modal-header">
              <div class="modal-customize-abs__modal-header--title">Change Subportfolio</div>
              <div
                class="modal-customize-abs__modal-header--icon"
                @click="$refs.modalSubPortfolio.hide()"
              >
                <i class="icon-close"></i>
              </div>
            </div>
            <div class="modal-customize-abs__modal-body">
              <treeselect
                :multiple="false"
                :options="options"
                :clearable="false"
                placeholder="Select SubPortFolio"
                v-model="value"
              />
              <br />
            </div>
          </b-col>
        </b-row>
      </b-container>
    </b-modal>
    <!-- /.MODAL CHANGE SUB PORTFLIO -->

    <!-- MODAL CHANGE LANGUAGE -->
    <b-modal
      id="modal-language"
      :hide-footer="true"
      :hide-header-close="true"
      ref="modalChangeLanguage"
      centered
      class="modal-customize-abs"
    >
      <b-container class="bv-example-row">
        <b-row>
          <b-col sm="12">
            <div class="modal-customize-abs__modal-header">
              <div class="modal-customize-abs__modal-header--title">Change Language</div>
              <div
                class="modal-customize-abs__modal-header--icon"
                @click="$refs.modalChangeLanguage.hide()"
              >
                <i class="icon-close"></i>
              </div>
            </div>
            <div class="modal-customize-abs__modal-body">
              <div id="google_translate_element"></div>
              <!-- <ul class="box-languages">
                <li
                  v-for="(lang, index) in languages"
                  :key="index"
                  @click="handleChangeLang(lang.alias)"
                >
                  {{ lang.name }}
                </li>
              </ul>-->
            </div>
          </b-col>
        </b-row>
      </b-container>
    </b-modal>
    <!-- /.MODAL CHANGE LANGUAGE -->

    <simplert :useRadius="true" :useIcon="true" ref="simplert"></simplert>
    <ABSLoader />
  </div>
</template>

<script>
export default {
  mounted() {
    // this.$store.dispatch("handlePaddingHeader", "0px");
    // this.$store.dispatch("handlePaddingLeftContent", "0px");
    // this.$store.dispatch("handleWidthSidebar", "0px");
    // this.$store.dispatch("handleWidthRightbar", "0px");
    // this.$store.dispatch("handleTextMenu", false);

    this.$store.dispatch("handlePaddingHeader", "225px");
    this.$store.dispatch("handlePaddingLeftContent", "230px");
    this.$store.dispatch("handleWidthSidebar", "230px");
    this.$store.dispatch("handleWidthRightbar", "0px");
    this.$store.dispatch("handleTextMenu", true);

    // cek if user login or not
    if (this.getDataUser() === undefined) {
      this.$router.replace({
        path: "/sign-in"
      });
      return;
    }
    // this.$i18n.locale = this.getDataUser().language;
    // this.getAliasLanguage();

    // this.getSubportfolio();
    // console.log(this.getDataUser());
    this.value = this.getDataUser().subportfolio_cd;
    this.label =
      this.getDataUser().portfolio_short_name +
      " - " +
      this.getDataUser().subportfolio_short_name;
    // console.log(this.label);
    this.Username = this.getDataUser().user_name;
  },
  data() {
    return {
      favoriteMenus: [],
      language: null,
      classHeader: false,
      languages: [
        {
          name: "Indonesia",
          alias: "id"
        },
        {
          name: "English",
          alias: "en"
        }
      ],
      dropdownMenuHeaderTop: false,
      dropdownMenuFavorite: false,
      // options: [{
      //           id: 'fruits',
      //           label: 'Fruits'
      //           }],
      options: [],
      value: null,
      statusValue: false,
      label: "",
      Username: ""
    };
  },
  created: function() {
    // this.favoriteMenus = JSON.parse(localStorage.lsShortcutMenu)
    this.favoriteMenus = this.getShortcitMenu();
  },
  computed: {
    paddingHeader() {
      return this.$store.getters.paddingHeader;
    },
    textMenu() {
      return this.$store.getters.textMenu;
    }
  },
  watch: {
    value: function(newData, oldData) {
      if (oldData === null) {
        return;
      }
      if (this.statusValue) {
        this.statusValue = false;
        return;
      }

      if (newData != undefined) {
        this.changeSubPortFolio(newData, oldData);
      } else {
        this.statusValue = true;
        this.value = oldData;
        this.$forceUpdate();
      }
    },
    $route(to, from) {
      if (this.$route.path === "/") {
        this.classHeader = true;
      } else {
        this.classHeader = false;
      }
    }
  },
  methods: {
    notification() {
      this.$router.push("/Notification");
    },
    onText() {
      this.$store.dispatch("handlePaddingHeader", "225px");
      this.$store.dispatch("handlePaddingLeftContent", "230px");
      this.$store.dispatch("handleWidthSidebar", "230px");
      this.$store.dispatch("handleWidthRightbar", "0px");
      this.$store.dispatch("handleTextMenu", true);
      // this.$store.commit('setHideSideMenu', true)
    },
    offText() {
      this.$store.dispatch("handlePaddingHeader", "0px");
      this.$store.dispatch("handlePaddingLeftContent", "0px");
      this.$store.dispatch("handleWidthSidebar", "0px");
      this.$store.dispatch("handleWidthRightbar", "0px");
      this.$store.dispatch("handleTextMenu", false);
      // this.$store.commit('setHideSideMenu', false)
    },
    showChangeSubportfolio() {
      // this.statusValue = true
      this.value = this.getDataUser().subportfolio_cd;
      this.$refs.modalSubPortfolio.show();
    },
    getAliasLanguage() {
      var lang = this.getDataUser().language;
      var data = this.languages.filter(function(data) {
        return data.alias == lang;
      });
      this.language = data[0].name;
    },
    handleChangeLang(lang) {
      // set language to localStorage
      var lsDataUser = localStorage.lsDataUser;

      lsDataUser = JSON.parse(lsDataUser);
      lsDataUser.Language = lang;

      lsDataUser = JSON.stringify(lsDataUser);
      localStorage.lsDataUser = lsDataUser;

      this.getAliasLanguage();

      this.$i18n.locale = lang;
      this.$refs.modalChangeLanguage.hide();
      location.reload();
      // this.dropdownMenuHeaderTop = !this.dropdownMenuHeaderTop
    },
    getSubportfolio() {
      var param = {
        user_id: this.getDataUser().user_id
      };
      this.postEncode(this.getUrlSubportfolio(), param).then(response => {
        if (response == null) return;
        this.options = response.Data;
      });
    },
    changeSubPortFolio(subPortFolio, oldData) {
      this.$swal({
        title: "Confirmation",
        text: "Are you sure want to change subportfolio ?",
        // text: 'Are you sure want to change subportfolio to ' + subPortFolio + ' ?',
        type: "warning",
        showCancelButton: true,
        confirmButtonText: "Yes",
        cancelButtonText: "No",
        showCloseButton: true,
        showLoaderOnConfirm: true
      }).then(result => {
        if (result.value) {
          var param = {
            UserId: this.getDataUser().user_id,
            SubPortfolioCd: this.value
          };
          this.postEncode(this.getUrlChangeSubportfolio(), param).then(
            response => {
              if (response == null) return;

              var data = response.Data;
              var dataUser = data.DataUser[0];

              var favoriteMenu = JSON.stringify(data.FavoriteMenu);
              var menu = JSON.stringify(data.Menu);

              // const session = {
              //   sessionId: data.Session_Id,
              //   sessionIdle: data.Idle
              // }
              // set language hardcode
              dataUser.Language = "en";
              localStorage.lsDataUser = JSON.stringify(dataUser);

              localStorage.lsShortcutMenu = favoriteMenu;
              localStorage.lsMenu = menu;
              this.$parent.$children[1].$children[2].changeFavMenu(
                favoriteMenu
              );
              this.label = this.getDataUser().label;
              // localStorage.lsSession = JSON.stringify(session)
              this.$router.push("/");
              this.$refs.modalSubPortfolio.hide();
            }
          );
          // this.dropdownMenuHeaderTop = !this.dropdownMenuHeaderTop
        } else {
          this.statusValue = true;
          this.value = oldData;
        }
      });
    },
    showError(title, message) {
      // Use sweetalert2
      this.$swal(title, message, "error");
    },
    signOut() {
      let confirmFn = function() {
        var param = {
          UserLog: this.getDataUser().user_id
        };
        this.postEncode(this.getUrlLogout(), param).then(response => {
          if (response == null) return;
          // this.options = response.Data
          this.doClearLocalStorage();

          // push user to sign-in
          this.$router.replace({
            path: "/sign-in"
          });
          // this.dropdownMenuHeaderTop = !this.dropdownMenuHeaderTop
        });
      };
      let obj = {
        title: "Close System",
        message: "If you close the system, all processes will be stopped",
        type: "info",
        useConfirmBtn: true,
        onConfirm: confirmFn
      };
      this.$refs.simplert.openSimplert(obj);
    },
    // closeHeader () {
    //   alert('woi')
    // }
    closeHeader() {
      // alert('woi')
      this.dropdownMenuHeaderTop = false;
    },
    closeFavorite() {
      // alert('woi')
      this.dropdownMenuFavorite = false;
    },

    changePassword() {
      this.$router.push("/ChangePassword?oid=854baa156adec53293270ee476389a51");
    },

    myProfile() {
      this.$router.push(
        "/SS/SS_UserProfile?oid=b171ac8a2f20079b41434d2840272672"
      );
    }
  },
  // events: {
  //   // nameOfCustomEventToCall: function (event) {
  //   //   // do something - probably hide the dropdown menu / modal etc.
  //   // }
  //   closeHeader () {
  //     // this.dropdownMenuHeaderTop = !this.dropdownMenuHeaderTop
  //     alert('wio')
  //   }
  // }
  directives: {
    "click-outside": {
      bind: function(el, binding, vNode) {
        // Provided expression must evaluate to a function.
        if (typeof binding.value !== "function") {
          const compName = vNode.context.name;
          let warn = `[Vue-click-outside:] provided expression '${binding.expression}' is not a function, but has to be`;
          if (compName) {
            warn += `Found in component '${compName}'`;
          }

          console.warn(warn);
        }
        // Define Handler and cache it on the element
        const bubble = binding.modifiers.bubble;
        const handler = e => {
          if (bubble || (!el.contains(e.target) && el !== e.target)) {
            binding.value(e);
          }
        };
        el.__vueClickOutside__ = handler;

        // add Event Listeners
        document.addEventListener("click", handler);
      },

      unbind: function(el, binding) {
        // Remove Event Listeners
        document.removeEventListener("click", el.__vueClickOutside__);
        el.__vueClickOutside__ = null;
      }
    }
  }
};
</script>
<style>
/* .goog-te-banner-frame .skiptranslate {
    display: none !important;
  } */
.goog-te-banner-frame {
  display: none !important;
}
body {
  top: 0px !important;
}
.container-notif {
  border-radius: 3px;
  float: left;
  display: block;
  padding: 12px 20px 0px 0px;
  min-height: 45px;
  position: relative;
}
.notif {
  top: 10px;
  right: 8px;
  position: absolute;
  padding: 3px 5px !important;
  font-size: 11px !important;
}
.count-info {
  display: inline-flex;
}
.dropdown-menu {
  border: medium none;
  border-radius: 3px;
  box-shadow: 0 0 3px rgba(86, 96, 117, 0.7);
  display: none;
  float: left;
  font-size: 12px !important;
  left: 0;
  list-style: none outside none;
  padding: 0;
  position: absolute;
  text-shadow: none;
  top: 100%;
  z-index: 1000;
}
.dropdown-menu-left {
  right: 0 !important;
  left: auto !important;
}
.dropdown-messages,
.dropdown-alerts {
  padding: 10px 10px 10px 10px !important;
  width: 310px;
  min-height: 0;
}
.show {
  display: block;
}
.float-left {
  float: left !important;
}
.dropdown-item {
  display: block;
  width: auto;
  padding: 0.25rem 0.8rem;
  clear: both;
  font-weight: 400;
  color: #212529;
  text-align: inherit;
  white-space: nowrap;
  background-color: transparent;
  border: 0;
}
.dropdown-messages-box {
  line-height: 1.5;
}
</style>

