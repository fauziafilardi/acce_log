<template>
  <!-- <span> -->

  <div class="sidebar-app__box-menu">
    <div
      class="list-menus"
      v-for="(fm, index) in favoriteMenus"
      :key="index"
      @click="doCallMenu(fm)"
      style="height: 30px;color: white; padding: 0px 0px !important"
    >
      <div class="icon" style="margin-right: 8px !important;padding-left: 10px !important;">
        <font-awesome-icon icon="circle" style="float:left; margin-top:4px; padding-top:5px" />
      </div>

      <div class="text" @click="offText" v-if="textMenu">
        <span style="color:white;letter-spacing: 0px !important;">{{fm.text_menu}}</span>
      </div>
      <div class="text" @click="onText" v-else>
        <span style="color:white;letter-spacing: 0px !important;">{{fm.text_menu}}</span>
      </div>
    </div>
    <!-- <div v-for="i in 400" :key="i" class="list-menus">
        <div class="icon">
          <i class="icon-star"></i>
        </div>
        <div class="text">
          <span>Module Access Entry</span>
          <span v-if="i === 400">{{ i }}</span>
        </div>
    </div>-->
  </div>
  <!-- </span> -->
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
    // this.favoriteMenus = JSON.parse(localStorage.lsFavoriteMenu)
    this.favoriteMenus = this.getFavoriteMenu();
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
      // this.$store.commit('setStatusLoader', true)
    },
    changeFavMenu(data) {
      this.favoriteMenus = JSON.parse(data);
    }
  }
};
</script>
