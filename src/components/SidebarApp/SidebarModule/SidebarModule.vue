<template>
  <!-- <span> -->
  <div class="sidebar-app__box-menu" style="width: 230px !important;">
    <!-- <div class="list-menus" v-for="(fm, index) in modules" :key="index" @click="doCallMenu(fm)">
        <div class="icon">
          <i class="icon-list"></i>
        </div>
        <div class="text" v-if="textMenu">
          <span>{{fm.menu_name}}</span>
        </div>
    </div>-->

    <!-- <div class="container" style="padding-left:5px !important;padding-right:0px !important;"> -->
    <div>
      <div class="row">
        <!-- <div class="col-md-12" style="padding-right:0px !important;"> -->
        <!-- <div
            id="main-menu"
            class="list-group"
            style="margin-bottom:0px !important; width:230px !important;"
          >
            <a
              href
              class="list-group-item"
              style="border: 0px solid #e7eaec !important;height:30px;"
              @click="dashboard()"
            >
              <span style="font-size:12px;">Dashboard</span>
            </a>
        </div>-->

        <div
          id="main-menu"
          class="list-group"
          v-for="(fm, index) in modules"
          :key="index"
          style="margin-bottom:0px !important; width:230px !important;"
        >
          <a
            role="button"
            class="list-group-item"
            v-if="textMenu"
            v-b-toggle="'collapseE_'+index"
            :id="'collapseE_' + index"
            @click="doCallMenu(fm)"
            style="border: 0px solid #e7eaec !important;height:30px; cursor:pointer !important;"
          >
            <span style="padding-left: 20px; padding-right: 5px;" v-if="fm.menu_type == 'O'">-</span>
            <font-awesome-icon
              v-else
              :id="'closedE_'+index"
              icon="chevron-circle-down"
              style="float:left; margin-top:5px; padding-top:5px; margin-right: 5px;"
            />
            <font-awesome-icon
              :id="'openedE_'+index"
              icon="chevron-circle-down"
              style="float:left; margin-top:5px; padding-top:5px; margin-right: 5px; display:none"
            />

            <span style="font-size:12px;">{{fm.title}}</span>
          </a>
          <b-collapse
            :id="'collapseE_'+index"
            :visible="false"
            v-for="(event, indexEvent) in events.filter(x => x.parent_menu_id == fm.ss_menu_id)"
            :key="indexEvent"
            accordion="collapseE"
          >
            <a
              role="button"
              class="list-group-item"
              v-b-toggle="'collapseO_'+index+'_'+indexEvent"
              :id="'collapseO_'+index+'_'+indexEvent"
              @click="doCallMenu(event)"
              style="border: 0px solid #e7eaec !important;height:30px; cursor:pointer !important;"
            >
              <span style="padding-left: 15px; padding-right: 10px;" v-if="event.menu_type == 'O'">-</span>
              <font-awesome-icon
                v-else
                :id="'closedO_'+index+'_'+indexEvent"
                icon="chevron-circle-down"
                style="float:left; margin-top:5px; padding-top:5px; margin-left:10px; margin-right: 5px;"
              />
              <font-awesome-icon
                :id="'openedO_'+index+'_'+indexEvent"
                icon="chevron-circle-down"
                style="float:left; margin-top:5px; margin-left:10px; padding-top:5px; margin-right: 5px; display:none;"
              />
              <span style="font-size:12px; padding-left:0px;">{{event.title}}</span>
            </a>

            <!-- <a
                href="#"
                class="list-group-item"
                v-b-toggle="'collapseO_'+index+'_'+indexEvent"
                :id="'collapseO_'+index+'_'+indexEvent"
                style="border: 0px solid #e7eaec !important;height:30px;background-color:#3d3d3d;"
                v-if="segmentUrl == event.menu_url"
                @click="doCallMenu(event)"
              >
                <span
                  style="padding-left: 15px; padding-right: 10px;"
                  v-if="event.menu_type == 'O'"
                >-</span>
                <font-awesome-icon
                  v-else
                  :id="'closedO_'+index+'_'+indexEvent"
                  icon="chevron-circle-down"
                  style="float:left; margin-top:5px; padding-top:5px; margin-left:10px; margin-right: 5px;"
                />
                <font-awesome-icon
                  :id="'openedO_'+index+'_'+indexEvent"
                  icon="chevron-circle-down"
                  style="float:left; margin-top:5px; margin-left:10px; padding-top:5px; margin-right: 5px; display:none;"
                />
                <span style="font-size:12px; padding-left:0px;">{{event.title}}</span>
              </a>

              <a
                v-else
                href="#"
                class="list-group-item"
                v-b-toggle="'collapseO_'+index+'_'+indexEvent"
                :id="'collapseO_'+index+'_'+indexEvent"
                style="border: 0px solid #e7eaec !important;height:30px;"
                @click="doCallMenu(event)"
              >
                <span
                  style="padding-left: 15px; padding-right: 10px;"
                  v-if="event.menu_type == 'O'"
                >-</span>
                <font-awesome-icon
                  v-else
                  :id="'closedO_'+index+'_'+indexEvent"
                  icon="chevron-circle-down"
                  style="float:left; margin-top:5px; padding-top:5px; margin-left:10px; margin-right: 5px;"
                />
                <font-awesome-icon
                  :id="'openedO_'+index+'_'+indexEvent"
                  icon="chevron-circle-down"
                  style="float:left; margin-top:5px; margin-left:10px; padding-top:5px; margin-right: 5px; display:none;"
                />
                <span style="font-size:12px; padding-left:0px;">{{event.title}}</span>
            </a>-->

            <b-collapse
              :id="'collapseO_'+index+'_'+indexEvent"
              :visible="false"
              v-for="(option, indexChild) in options.filter(x => x.parent_menu_id == event.ss_menu_id)"
              :key="indexChild"
            >
              <a
                role="button"
                class="list-group-item"
                style="border: 0px solid #e7eaec !important;height:30px;background-color:#3d3d3d; cursor:pointer !important;"
                @click="doCallMenu(option)"
                v-if="segmentUrl == option.menu_url"
              >
                <span style="padding-left: 20px; padding-right: 5px;">-</span>
                <span style="font-size:12px;">{{option.title}}</span>
              </a>
              <a
                v-else
                class="list-group-item"
                style="border: 0px solid #e7eaec !important;height:30px;cursor:pointer;"
                @click="doCallMenu(option)"
              >
                <span style="padding-left: 20px; padding-right: 5px;">-</span>
                <span style="font-size:12px;">{{option.title}}</span>
              </a>
            </b-collapse>
          </b-collapse>
        </div>
        <!-- </div> -->
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
      menus: [],
      modules: [],
      events: [],
      options: [],
      lefta: true,
      downa: false,
      leftb: true,
      downb: false,
      styleCustom: "margin-bottom:0px !important; width:230px !important;",
      segmentUrl: ""
    };
  },
  created: function() {
    // this.favoriteMenus = JSON.parse(localStorage.lsFavoriteMenu)
    this.menus = this.getMenu();
    // console.log(JSON.stringify(this.menus))

    this.modules = this.menus.filter(function(x) {
      return x.level.toString() == "1";
    });
    // console.log(this.modules)

    this.events = this.menus.filter(x => {
      return x.level.toString() == "2";
    });

    // console.log(this.events);

    this.options = this.menus.filter(x => {
      return x.level.toString() == "3";
    });

    // this.menus === undefined ? undefined : this.menus.module_list;
    // this.events = this.menus === undefined ? undefined : this.menus.event_with_child;
  },
  mounted() {
    // this.getSegmentUrl();
    this.$root.$on("bv::collapse::state", (collapseId, isJustShown) => {
      // console.log("collapseId:", collapseId);
      // console.log("isJustShown:", isJustShown);
      var indexM = null;
      var indexE = null;
      if (collapseId.includes("collapseE")) {
        indexM = collapseId.split("_")[1];

        if (isJustShown) {
          // document.getElementById("collapseE_" + indexM).style.backgroundColor =
          //   "red";

          document.getElementById("openedE_" + indexM).style.display = "block";
          document.getElementById("closedE_" + indexM).style.display = "none";
        } else {
          document.getElementById("openedE_" + indexM).style.display = "none";
          document.getElementById("closedE_" + indexM).style.display = "block";
        }
      } else {
        indexM = collapseId.split("_")[1];
        indexE = collapseId.split("_")[2];
        if (isJustShown) {
          document.getElementById(
            "openedO_" + indexM + "_" + indexE
          ).style.display = "block";

          // document.getElementById("collapseE_" + indexM).style.backgroundColor =
          //   "";

          // document.getElementById(
          //   "collapseO_" + indexM + "_" + indexE
          // ).style.backgroundColor = "red";

          document.getElementById(
            "closedO_" + indexM + "_" + indexE
          ).style.display = "none";
        } else {
          document.getElementById(
            "openedO_" + indexM + "_" + indexE
          ).style.display = "none";

          // document.getElementById(
          //   "openedO_" + indexM + "_" + indexE
          // ).style.backgroundColor = "inherit";

          document.getElementById(
            "closedO_" + indexM + "_" + indexE
          ).style.display = "block";
        }
      }
    });
  },
  methods: {
    getSegmentUrl() {
      var currentUrl = window.location.href;
      var arrayUrl = currentUrl.split("/");

      this.segmentUrl = "/" + arrayUrl[3] + "/" + arrayUrl[4];
    },
    dashboard() {
      this.$router.push("/");
    },
    // test() {
    //   if (this.lefta == true) {
    //     this.lefta = false;
    //     this.downa = true;
    //     this.styleCustom =
    //       "margin-bottom:0px !important; width:230px !important; border-left: 4px solid #19aa8d !important;";
    //   } else {
    //     this.lefta = true;
    //     this.downa = false;
    //     this.styleCustom =
    //       "margin-bottom:0px !important; width:230px !important;";
    //   }
    // },
    // testb() {
    //   if (this.leftb == true) {
    //     this.leftb = false;
    //     this.downb = true;
    //   } else {
    //     this.leftb = true;
    //     this.downb = false;
    //   }
    // },
    doInsert: function(menuSeqNo, optionSeq, ps, indexChild) {
      var param = {
        user_id: this.getDataUser().user_id,
        subportfolio_cd: this.getDataUser().subportfolio_cd,
        OptionSeq: optionSeq,
        PS: ps
      };
      this.postEncode(this.getUrlInsertFavorite(), param).then(response => {
        if (response == null) return;

        for (var i = 0; i < this.menus.event_with_child.length; i++) {
          if (this.menus.event_with_child[i].menu_seq_no == menuSeqNo) break;
        }

        this.menus.event_with_child[i].child[indexChild].fav = 1;

        localStorage.lsMenu = JSON.stringify(this.menus);
        this.events = this.menus.event_with_child;

        localStorage.lsFavoriteMenu = JSON.stringify(response.Data);
        this.$parent.$children[1].$children[3].changeFavMenu(
          localStorage.lsFavoriteMenu
        );
      });
    },
    doDelete: function(menuSeqNo, optionSeq, indexChild) {
      var param = {
        user_id: this.getDataUser().user_id,
        subportfolio_cd: this.getDataUser().subportfolio_cd,
        OptionSeq: optionSeq
      };
      this.postEncode(this.getUrlDeleteFavorite(), param).then(response => {
        if (response == null) return;

        for (var i = 0; i < this.menus.event_with_child.length; i++) {
          if (this.menus.event_with_child[i].menu_seq_no == menuSeqNo) break;
        }
        this.menus.event_with_child[i].child[indexChild].fav = 0;

        localStorage.lsMenu = JSON.stringify(this.menus);
        this.events = this.menus.event_with_child;

        localStorage.lsFavoriteMenu = JSON.stringify(response.Data);
        this.$parent.$children[1].$children[3].changeFavMenu(
          localStorage.lsFavoriteMenu
        );
      });
    },
    doCallMenu: function(menu) {
      // console.log(menu);
      // return;
      if (
          !menu.menu_url || menu.menu_url == null || menu.menu_url == undefined || menu.menu_url == '' || menu.menu_url == '#'
        ) return;
      // this.getSegmentUrl();
      // this.$store.dispatch('handlePaddingHeader', '0px')
      // this.$store.dispatch('handlePaddingLeftContent', '0px')
      // this.$store.dispatch('handleWidthSidebar', '0px')
      // this.$store.dispatch('handleWidthRightbar', '0px')
      // this.$store.dispatch('handleTextMenu', false)

      // this.$store.commit('setParentSeqNo', menu.menu_seq_no)
      // this.$store.commit('setModuleName', menu.menu_name)

      //   this.$router.push({
      //       name: 'Menu',
      //       params: {
      //           module_seq_no: menu.menu_seq_no,
      //           moduleName: menu.menu_name
      //       }
      //   })
      //   // localStorage.setItem('lsOptionSeq', JSON.stringify(menu))
      //   this.$router.push(menu.menu_url)
      //   this.closeBigMenu()
      //   // this.$store.commit('setByPassCancel', false)
      //   this.$store.commit('setIsPost', false)
      //   this.$store.commit('setSearch1', '')
      //   this.$store.commit('setSearch2', '')
      //   this.$store.commit('setSearch3', '')
      //   this.$store.commit('setPsMenu', menu)
      //   // this.$store.commit('setStatusLoader', true)

      // console.log(menu);
      this.$store.dispatch("handlePaddingHeader", "225px");
      this.$store.dispatch("handlePaddingLeftContent", "230px");
      this.$store.dispatch("handleWidthSidebar", "230px");
      this.$store.dispatch("handleWidthRightbar", "0px");
      this.$store.dispatch("handleTextMenu", true);
      // this.$store.commit('setHideSideMenu', true)
      // localStorage.setItem('lsOptionSeq', JSON.stringify(menu))
      this.$router.push(menu.menu_url);
      this.segmentUrl = menu.menu_url;
      // this.$store.commit('setByPassCancel', false)
      this.$store.commit("setIsPost", false);
      this.$store.commit("setSearch1", "");
      this.$store.commit("setSearch2", "");
      this.$store.commit("setSearch3", "");
      this.$store.commit("setPsMenu", menu);
      this.$store.commit("setNewStatus", true);
      this.$store.commit("setEditStatus", true);
      this.$store.commit("setDeleteStatus", true);
      // this.$store.commit('setStatusLoader', true)
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
  background-color: #3d3d3d;
  color: #fff;
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
