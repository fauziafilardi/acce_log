<template>
  <div v-show="hideSideMenu" id="sidebar-app">
    <div class="sidebar-app" :style="{ width: widthSidebar}" style="z-index:1;top:50px;">
      <!-- <div
        class="sidebar-app__hide-text-labels"
        @click="offText"
        v-if="textMenu"
      >
        <i class="icon-arrow-left"></i>
      </div>
      <div
        class="sidebar-app__hide-text-labels"
        @click="onText"
        v-else
      >
        <i class="icon-arrow-right"></i>
      </div>-->

      <!-- <div
                    class="sidebar-app__hide-text-labels"
        style="background-color: rgb(51, 51, 153);
                align-items: center;               
                text-align: center;                
                justify-content: center;
                padding: 15px !important;"
      >-->
      <div
        style="background-color: rgb(51, 51, 153);
                align-items: center;               
                text-align: center;                
                justify-content: center;
                padding: 15px !important;"
      >
        <!-- <i class="icon-arrow-right"></i> -->
        <div class="profile">
          <div @click="fn_profile" class="image" style="cursor:pointer;">
            <img :src="PathFile" alt style="width: 70px; border-radius: 50px;" />
          </div>
          <div class="title" style="color: #cccccc;">Welcome Back</div>
          <!-- <div
            class="title"
            @click="dropdownMenuHeaderTop = !dropdownMenuHeaderTop"
            v-click-outside="closeHeader"
            style="color:#FFFFFF !important; font-weight:700;"
          >-->
          <div class="title" style="color:#FFFFFF !important; font-weight:700;">
            <!-- <router-link
              :to="'/'"
              class="back-to-dashboard"
              style="color:#FFFFFF !important; font-weight:700;"
            >{{Username}}</router-link>-->
            {{Username}}
          </div>
        </div>
      </div>

      <!-- <div class="sidebar-app__divider-favorite"> -->
      <!-- <div class="icon">
          <i class="icon-list"></i>
        </div>
      <div class="title" v-if="textMenu">Module</div>-->
      <hr style="margin-top:5px !important; margin-bottom:5px !important; border-color: #babac6" />
      <div class="title" style="padding-left: 10px; color: white; font-weight: 700;">Short Cut</div>
      <hr style="margin-top:6px !important; margin-bottom:5px !important; border-color: #babac6" />
      <!-- </div> -->
      <!-- <sidebar-title></sidebar-title> -->
      <!-- <sidebar-fixed></sidebar-fixed> -->
      <sidebar-menu></sidebar-menu>
      <hr style="margin-top:6px !important; margin-bottom:5px !important; border-color: #babac6" />
      <div class="title" style="padding-left: 10px; color: white; font-weight: 700;">Modules</div>
      <hr style="margin-top:6px !important; margin-bottom:5px !important; border-color: #babac6" />
      <sidebar-module></sidebar-module>
      <!-- <div class="sidebar-app__divider-favorite">
        <hr>
      </div>-->
      <!-- <div class="sidebar-app__box-menu-fixed">
        <div class="list-menus" style="background: rgb(51, 51, 153);" @click="signOut">
          <div class="icon">
            <i class="icon-logout"></i>
          </div>
          <div class="text" v-if="textMenu">
            <span>Sign Out</span>
          </div>
        </div>
      </div>-->

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
          <!-- <div @click="signOut" class="list">
            <div class="title">
              <span>Sign Out</span>
            </div>
            <div class="icon">
              <i class="icon-logout"></i>
            </div>
          </div>-->
        </div>
      </div>

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

      <simplert :useRadius="true" :useIcon="true" ref="simplert1"></simplert>
    </div>
  </div>
</template>

<script>
import SidebarFixed from "@/components/SidebarApp/SidebarFixed/SidebarFixed";
import SidebarTitle from "@/components/SidebarApp/SidebarTitle/SidebarTitle";
import SidebarMenu from "@/components/SidebarApp/SidebarMenu/SidebarMenu";
import SidebarModule from "@/components/SidebarApp/SidebarModule/SidebarModule";

export default {
  data() {
    return {
      Username: "",
      PathFile: "",
      dropdownMenuHeaderTop: false
    };
  },
  components: {
    SidebarMenu,
    SidebarTitle,
    SidebarFixed,
    SidebarModule
  },
  computed: {
    widthSidebar() {
      return this.$store.getters.widthSidebar;
    },
    textMenu() {
      return this.$store.getters.textMenu;
    },
    hideSideMenu() {
      return this.$store.getters.getHideSideMenu;
    }
  },
  mounted() {
    console.log(this.getDataUser());
    if (
      this.getDataUser().path_file == "" ||
      this.getDataUser().path_file == null
    ) {
      this.PathFile = require("@/assets/avatar.png");
    } else {
      this.PathFile = this.url + this.getDataUser().path_file;
    }
    // this.$store.dispatch("handlePaddingHeader", "225px");
    // this.$store.dispatch("handlePaddingLeftContent", "230px");
    // this.$store.dispatch("handleWidthSidebar", "230px");
    // this.$store.dispatch("handleWidthRightbar", "0px");
    // this.$store.commit("setHideSideMenu", false);
    this.Username = this.getDataUser().user_name;
  },
  methods: {
    fn_profile() {
      // var param = data;
      // param.isEdit = true;
      // console.log(param);
      this.$router.push({ name: "SS_UserProfile" });
    },
    closeHeader() {
      // alert('woi')
      this.dropdownMenuHeaderTop = false;
    },
    showChangeSubportfolio() {
      // this.statusValue = true
      this.value = this.getDataUser().subportfolio_cd;
      this.$refs.modalSubPortfolio.show();
    },
    // getSubportfolio() {
    //   var param = {
    //     user_id: this.getDataUser().user_id
    //   };
    //   this.postEncode(this.getUrlSubportfolio(), param).then(response => {
    //     if (response == null) return;
    //     this.options = response.Data;
    //   });
    // },
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
    changePassword() {
      this.$router.push("/ChangePassword");
      this.dropdownMenuHeaderTop = false;
    },
    myProfile() {
      this.$router.push("/SS_UserProfile");
      this.dropdownMenuHeaderTop = false;
    },
    onText() {
      this.$store.dispatch("handlePaddingHeader", "225px");
      this.$store.dispatch("handlePaddingLeftContent", "230px");
      this.$store.dispatch("handleWidthSidebar", "230px");
      this.$store.dispatch("handleWidthRightbar", "0px");
      this.$store.dispatch("handleTextMenu", false);
    },
    offText() {
      this.$store.dispatch("handlePaddingHeader", "0px");
      this.$store.dispatch("handlePaddingLeftContent", "55px");
      this.$store.dispatch("handleWidthSidebar", "55px");
      this.$store.dispatch("handleWidthRightbar", "0px");
      this.$store.dispatch("handleTextMenu", true);
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
      this.$refs.simplert1.openSimplert(obj);
    }
  }
};
</script>
