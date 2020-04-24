<template>
  <div
    class="sidebar-app__box-menu-fixed"
    style="height: 30px;color: white; padding: 0px 0px !important"
  >
    <!-- <router-link :to="'/'">
      <div class="list-menus">
        <div class="icon">
          <i class="icon-home"></i>
        </div>
        <div class="text" v-if="textMenu">
          <span>Dashboard</span>
        </div>
      </div>
    </router-link>

    <router-link :to="'/list-static'">
      <div class="list-menus">
        <div class="icon">
          <i class="icon-home"></i>
        </div>
        <div class="text" v-if="textMenu">
          <span>List Static</span>
        </div>
      </div>
    </router-link>

    <router-link :to="'/list-dynamic'">
      <div class="list-menus">
        <div class="icon">
          <i class="icon-home"></i>
        </div>
        <div class="text" v-if="textMenu">
          <span>List Dynamic</span>
        </div>
      </div>
    </router-link>
    
    <router-link :to="'/list-static-h'">
      <div class="list-menus">
        <div class="icon">
          <i class="icon-home"></i>
        </div>
        <div class="text" v-if="textMenu">
          <span>List Group H</span>
        </div>
      </div>
    </router-link>
    
    <router-link :to="'/list-static-tab'">
      <div class="list-menus">
        <div class="icon">
          <i class="icon-home"></i>
        </div>
        <div class="text" v-if="textMenu">
          <span>List Static Tab</span>
        </div>
      </div>
    </router-link>
    <router-link :to="'/subportfolio'">
      <div class="list-menus">
        <div class="icon">
          <i class="icon-home"></i>
        </div>
        <div class="text" v-if="textMenu">
          <span>List Subportfolio</span>
        </div>
      </div>
    </router-link>
    <router-link :to="'/subportfolio2'">
      <div class="list-menus">
        <div class="icon">
          <i class="icon-home"></i>
        </div>
        <div class="text" v-if="textMenu">
          <span>List Subportfolio 2</span>
        </div>
      </div>
    </router-link>-->
    <!-- <router-link :to="'/subportfolio3'"> -->
    <!-- <div class="list-menus" @click="linkMenu('subportfolio3')">
        <div class="icon">
          <i class="icon-home"></i>
        </div>
        <div class="text" v-if="textMenu">
          <span>List Subportfolio 3</span>
        </div>
      </div>

      <div class="list-menus" @click="linkMenu('currencyMaster')">
        <div class="icon">
          <i class="icon-home"></i>
        </div>
        <div class="text" v-if="textMenu">
          <span>Currency Master</span>
        </div>
    </div>-->
    <!-- <div class="list-menus" @click="linkMenu('tes')">
        <div class="icon">
          <i class="icon-home"></i>
        </div>
        <div class="text" v-if="textMenu">
          <span>Tes</span>
        </div>
      </div>
      <div class="list-menus" @click="linkMenu('CM_CountryCityMasterVuex')">
        <div class="icon">
          <i class="icon-home"></i>
        </div>
        <div class="text" v-if="textMenu">
          <span>Country City Vuex</span>
        </div>
    </div>-->
    <div
      class="list-menus"
      @click="linkMenu('')"
      style="height: 30px;color: white; padding: 0px 0px !important"
    >
      <div class="icon" style="margin-right: 8px !important;padding-left: 10px !important;">
        <font-awesome-icon icon="circle" style="float:left; margin-top:4px; padding-top:5px" />
      </div>
      <div class="text" @click="offText" v-if="textMenu">
        <span style="letter-spacing: 0px !important; color: white;">Dashboard</span>
      </div>
      <div class="text" @click="onMenu" v-else>
        <span style="letter-spacing: 0px !important; color: white;">Dashboard</span>
      </div>
    </div>
    <!-- </router-link> -->

    <!-- <div
      class="list-menus"
      @click="showMenuBig"
    >
      <div class="icon">
        <i class="icon-list"></i>
      </div>
      <div class="text" v-if="textMenu">
        <span>All Menu</span>
      </div>
    </div>-->
  </div>
</template>

<script>
export default {
  methods: {
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
    showMenuBig() {
      this.$store.dispatch("handleMenuBig", true);
      this.hideSideBarMenu();
    },
    linkMenu(menu) {
      this.$router.push("/" + menu);
    }
  },
  computed: {
    textMenu() {
      return this.$store.getters.textMenu;
    }
  }
};
</script>
