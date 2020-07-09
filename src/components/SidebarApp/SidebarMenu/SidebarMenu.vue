<template>
  <div class="sidebar-app__box-menu" style="width: 230px !important;">
    <div>
      <div class="row">
        <div
          id="main-menu"
          class="list-group"
          v-for="(fm, index) in favoriteMenus"
          :key="index"
          style="margin-bottom:0px !important; width:230px !important;"
        >
          <a
            role="button"
            class="list-group-item"
            v-if="textMenu"
            @click="doCallMenu(fm)"
            style="border: 0px solid #e7eaec !important;height:30px; cursor:pointer !important;"
          >
            <font-awesome-icon
              icon="circle"
              style="float:left; margin-top:5px; padding-top:5px; margin-right: 5px;"
            />

            <span style="font-size:12px;">{{fm.title}}</span>
          </a>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  computed: {
    textMenu() {
      return this.$store.getters.textMenu;
    }
  },
  data() {
    return {
      favoriteMenus: []
    };
  },
  created: function() {
    // this.favoriteMenus = JSON.parse(localStorage.lsShortcutMenu)
    this.favoriteMenus = this.getShortcitMenu();
  },
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
      this.$store.dispatch("handlePaddingHeader", "50px");
      this.$store.dispatch("handlePaddingLeftContent", "0px");
      this.$store.dispatch("handleWidthSidebar", "0px");
      this.$store.dispatch("handleWidthRightbar", "0px");
      this.$store.dispatch("handleTextMenu", false);
      // this.$store.commit('setHideSideMenu', false)
    },
    doCallMenu: function(menu) {
      // localStorage.setItem('lsOptionSeq', JSON.stringify(menu))
      this.$router.push(menu.menu_url);
      this.closeBigMenu();
      // this.$store.commit('setByPassCancel', false)
      this.$store.commit("setIsPost", false);
      this.$store.commit("setSearch1", "");
      this.$store.commit("setSearch2", "");
      this.$store.commit("setSearch3", "");
      this.$store.commit("setPsMenu", menu);
      this.$store.commit("setParamPage", null);
      // this.$store.commit('setStatusLoader', true)
    },
    changeFavMenu(data) {
      this.favoriteMenus = JSON.parse(data);
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