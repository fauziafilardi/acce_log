<template>
  <div class="big-menu" v-if="menuBig">
    <div class="big-menu__list-menu">
      <div class="title-top">
        <span style="font-size: 14px">All Menu</span>
        <i @click="clearMenu" v-if="!showSubList" class="icon-close"></i>
      </div>
      <div class="box-lists" id="myDIV">
        <div
          v-for="(module, index) in modules"
          :key="index"
          class="list"
          :class="{ 'activeClicked': activeIndex === index}"
          @click="getEvent(module.menu_seq_no, index)"
        >
          <div class="list__name">{{module.menu_name}}</div>
        </div>
      </div>
    </div>
    <div class="big-menu__sub-list-menu" v-if="showSubList">
      <div class="filtering">
        <div class="pull--left">
          <b-form-input
            :disabled="isDisableFilter"
            @keyup.enter.native="onFilterKeyUp"
            size="sm"
            placeholder="Filter"
            style="font-size: 12px"
            v-model="filter"
          ></b-form-input>
        </div>
        <!-- <div class="pull--right" v-b-toggle="'menuCollapseAll'+indexEvent"> -->
        <div class="pull--right">
          <span
            class="filtering__ex-col when-closed"
            style="font-size: 12px"
            @click="collapseAll"
          >Collapse All</span> |
          <span
            class="filtering__ex-col when-opened"
            style="font-size: 12px"
            @click="expandAll"
          >Expand All</span>
          <span class="filtering__ex-col" @click="clearMenu">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <i class="icon-close"></i>
          </span>
        </div>
      </div>
      <div class="box-lists" v-show="!onFiltered">
        <div v-for="(event, indexEvent) in ev" :key="indexEvent">
          <div class="title-top" @click="collapseOrExpand(indexEvent)">
            <span>{{ event.menu_name }}</span>
            <hr />
            <div class="icon-right">
              <i class="icon-arrow-down"></i>
            </div>
          </div>
          <!-- <b-collapse :id="'menuCollapseAll'+indexEvent"> -->
          <b-collapse :visible="collapsed[indexEvent]" :id="'menuCollapseAll'+indexEvent">
            <div
              class="list"
              v-for="(option, indexChild) in event.child"
              :key="indexChild"
              @click.self="doCallMenu(option)"
            >
              <div class="list__name" @click.self="doCallMenu(option)">{{option.menu_name}}</div>
              <!-- kalau Fav === 0 maka ga muncul bintang -->
              <div v-if="option.fav === 0" class="list__icon-right">
                <i
                  class="icon-star"
                  @click="doInsert(event.menu_seq_no, option.OptionSeq, option.ps, indexChild)"
                ></i>
              </div>
              <!-- selain 0 dia muncul bintang -->
              <div v-else class="list__icon-right is-favorite">
                <i
                  class="icon-star"
                  @click="doDelete(event.menu_seq_no, option.OptionSeq, indexChild)"
                ></i>
              </div>
            </div>
          </b-collapse>
          <!-- </b-collapse> -->
          <div class="mg-bottom--sub-list-menu"></div>
        </div>
      </div>

      <div class="box-lists" v-show="onFiltered">
        <div
          class="list"
          v-for="(option, index) in menuFilter"
          :key="index"
          @click.self="doCallMenu(option)"
        >
          <div class="list__name" @click.self="doCallMenu(option)">{{option.menu_name}}</div>
          <div v-if="option.fav === '0'" class="list__icon-right">
            <i
              class="icon-star"
              @click="doInsert(option.menu_seq_no, option.OptionSeq, option.ps, index)"
            ></i>
          </div>
          <div v-else class="list__icon-right is-favorite">
            <i class="icon-star" @click="doDelete(option.menu_seq_no, option.OptionSeq, index)"></i>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  computed: {
    menuBig() {
      return this.$store.getters.menuBig;
    }
  },
  data() {
    return {
      showSubList: false,
      activeIndex: undefined,
      menus: [],
      // 1. module
      // 2. event
      // 3. option
      modules: [],
      events: [],
      ev: [],
      statusRendered: false,
      responses: [],
      error: true,
      message: null,

      filter: "",
      module: "",
      onFiltered: false,
      menuFilter: [],
      collapsed: [],
      isDisableFilter: true
    };
  },
  mounted: function() {},
  created: function() {
    this.menus = this.getMenu();
    this.modules =
      this.menus === undefined ? undefined : this.menus.module_list;
    this.events =
      this.menus === undefined ? undefined : this.menus.event_with_child;
  },
  updated: function() {
    // this.$nextTick(function () {
    //   if(this.statusRendered) {
    //     return
    //   }
    //   this.statusRendered = true
    //   // Get the container element
    //   var btnContainer = document.getElementById("myDIV");
    //   // Get all buttons with class="btn" inside the container
    //   var btns = btnContainer.getElementsByClassName("list");
    //   // Loop through the buttons and add the active class to the current/clicked button
    //   for (var i = 0; i < btns.length; i++) {
    //     btns[i].addEventListener("click", function() {
    //       var current = document.getElementsByClassName("active-after-click");
    //       // If there's no active class
    //       if (current.length > 0) {
    //         current[0].className = current[0].className.replace(" active-after-click", "");
    //       }
    //       // Add the active class to the current/clicked button
    //       this.className += " active-after-click";
    //     });
    //   }
    // })
  },
  destroyed: function() {},
  methods: {
    clearMenu() {
      this.activeIndex = undefined;
      this.ev = [];
      this.filter = "";
      this.isDisableFilter = true;
      this.menuFilter = [];
      this.showSubList = false;
      this.closeBigMenu();
    },
    onFilterKeyUp() {
      if (this.filter !== "") {
        this.onFiltered = true;
        // console.log(this.filter)
        // console.log(this.module)
        this.getMenuBy();
      } else {
        this.onFiltered = false;
      }
    },
    getMenuBy() {
      var param = {
        MenuSeqNo: this.module,
        UserId: this.getDataUser().user_id,
        SubPortfolioCd: this.getDataUser().subportfolio_cd,
        ParamWhere: this.filter
      };

      this.postJSON(this.getUrlGetMenuBy(), param).then(response => {
        // response from API
        // console.log(response)
        if (response == null) return;
        var data = response.Data;
        data.forEach((el, idx) => {
          data[idx].menu_seq_no = this.module;
        });
        this.menuFilter = data;

        // console.log(this.menuFilter)
      });
    },
    doCollapse: function() {
      var coll = document.getElementsByClassName("title-top");
      var i;

      for (i = 0; i < coll.length; i++) {
        coll[i].addEventListener("click", function() {
          this.classList.toggle("active");
          var content = this.nextElementSibling;
          if (content.style.display === "block") {
            content.style.display = "none";
          } else {
            content.style.display = "block";
          }
        });
      }
    },
    doCallMenu: function(menu) {
      // localStorage.setItem('lsOptionSeq', JSON.stringify(menu))
      this.$router.push(menu.menu_url);
      this.clearMenu();
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
    },
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

        localStorage.lsShortcutMenu = JSON.stringify(response.Data);
        this.$parent.$children[1].$children[2].changeFavMenu(
          localStorage.lsShortcutMenu
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

        localStorage.lsShortcutMenu = JSON.stringify(response.Data);
        this.$parent.$children[1].$children[2].changeFavMenu(
          localStorage.lsShortcutMenu
        );
      });
    },
    getEvent: function(parentSeqNo, index) {
      this.isDisableFilter = false;
      this.activeIndex = index;
      this.onFiltered = false;
      this.filter = "";
      this.collapsed = [];
      this.module = parentSeqNo;
      // this.events = this.ev.filter(function(event) {
      // return event.Menu_status == 2 && event.parent_seq_no == parentSeqNo
      this.ev = this.events.filter(function(event) {
        return event.parent_seq_no == parentSeqNo;
      });

      this.ev.forEach(el => {
        this.collapsed.push(true);
      });
      this.showSubList = true;
    },
    collapseOrExpand: function(index) {
      // this.collapsed[index] = !this.collapsed[index]
      var x = [];
      this.collapsed.forEach((val, id) => {
        if (id == index) {
          x.push(!val);
        } else {
          x.push(val);
        }
      });

      this.collapsed = x;
    },
    collapseAll: function() {
      var x = [];
      this.collapsed.forEach((val, id) => {
        x.push(false);
      });

      this.collapsed = x;
    },
    expandAll: function() {
      var x = [];
      this.collapsed.forEach((val, id) => {
        x.push(true);
      });

      this.collapsed = x;
    }
  }
};
</script>

<style>
/* Enter and leave animations can use different */
/* durations and timing functions.              */
.slide-fade-enter-active {
  transition: all 0.3s ease;
}
.slide-fade-leave-active {
  transition: all 0.8s cubic-bezier(1, 0.5, 0.8, 1);
}
.slide-fade-enter, .slide-fade-leave-to
/* .slide-fade-leave-active below version 2.1.8 */ {
  transform: translateX(10px);
  opacity: 0;
}
/* .big-menu__list-menu .box-lists .list .list__name { */
.big-menu__list-menu .box-lists .list .list__name,
.big-menu__sub-list-menu .box-lists .list .list__name,
.title-top {
  font-size: 12px;
}
.big-menu__sub-list-menu {
  width: 650px;
}
.activeClicked {
  /* background-color: #666; */
  background-color: rgb(182, 182, 182);
  /* color: white; */
}

.collapsed > .when-opened,
:not(.collapsed) > .when-closed {
  display: none;
}
</style>
