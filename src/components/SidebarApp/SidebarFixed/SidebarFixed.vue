<template>
  <!-- <div
    class="sidebar-app__box-menu-fixed"
    style="height: 30px;color: white; padding: 0px 0px !important"
  >    
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
  </div>-->
  <div class="sidebar-app__box-menu" style="width: 230px !important;">
    <div>
      <div class="row">
        <div
          id="main-menu"
          class="list-group"
          style="margin-bottom:0px !important; width:230px !important;"
        >
          <a
            role="button"
            class="list-group-item"
            v-if="textMenu"
            @click="linkMenu('')"
            style="border: 0px solid #e7eaec !important;height:30px; cursor:pointer !important;"
          >
            <font-awesome-icon
              icon="circle"
              style="float:left; margin-top:5px; padding-top:5px; margin-right: 5px;"
            />

            <span style="font-size:12px;">Dashboard</span>
          </a>
        </div>
      </div>
    </div>
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

<style scoped>
/* .nav-link[data-toggle].collapsed:after {
    content: "▾";
}
.nav-link[data-toggle]:not(.collapsed):after {
    content: "▴";
} */

#main-menu {
  background-color: rgb(51, 51, 153);
}

.list-group-item {
  background-color: rgb(51, 51, 153);
  border: none;
}

a.list-group-item {
  color: #ffffff;
}

a.list-group-item:hover,
a.list-group-item:focus {
  background-color: #ffffff;
  color: #339;
}

a.list-group-item.active,
a.list-group-item.active:hover,
a.list-group-item.active:focus {
  color: #fff;
  background-color: #ffb43a;
  border: none;
}

.list-group-item:first-child,
.list-group-item:last-child {
  border-radius: 0;
}

.list-group-level1 .list-group-item {
  padding-left: 30px;
}

.list-group-level2 .list-group-item {
  padding-left: 60px;
}

/* .collapsed > .when-opened,
:not(.collapsed) > .when-closed {
  display: none;
} */
</style>
