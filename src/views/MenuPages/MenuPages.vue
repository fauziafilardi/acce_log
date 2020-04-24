<template>
  <div class="dashboard-page">
    <div class="dashboard-page__title">
      <b-row>
        <b-col cols="12">{{ $t(moduleName) }}</b-col>
      </b-row>
    </div>
    <!-- <div class="dashboard-page__body">
      <b-row>
        <b-col cols="2">
          <div class="box--counting box-outline--red">
            <div class="box--counting__number">23</div>
            <div class="box--counting__title">Total Data</div>

          </div>
        </b-col>
        <b-col cols="2">
          <div class="box--counting box-outline--green">
            <div class="box--counting__number">100</div>
            <div class="box--counting__title">Total Data</div>
          </div>
        </b-col>
        <b-col cols="2">
          <div class="box--counting box-outline--green">
            <div class="box--counting__number">100</div>
            <div class="box--counting__title">Total Data</div>
          </div>
        </b-col>
        <b-col cols="3">
          <div class="box--counting box-outline--grey">
            <div class="box--counting__number">45</div>
            <div class="box--counting__title">Total Data</div>
          </div>
        </b-col>
        <b-col cols="3">
          <div class="box--counting box-outline--blue">
            <div class="box--counting__number">1500</div>
            <div class="box--counting__title">Total Data</div>
          </div>
        </b-col>
        <b-col cols="6">
          <div class="box--counting">
            <div class="box--counting__number">23</div>
            <div class="box--counting__title">Total Data</div>
          </div>
        </b-col>
        <b-col cols="6">
          <div class="box--counting">
            <div class="box--counting__number">1456</div>
            <div class="box--counting__title">Total Data</div>
          </div>
        </b-col>
      </b-row>
      <b-row>
        <b-col cols="6">
          <div class="box--graphic">
            <div class="box--graphic__body">
              <pie-chart :data="dataPie"></pie-chart>
            </div>
          </div>
        </b-col>
        <b-col cols="6">
          <div class="box--graphic">
            <div class="box--graphic__body">
              <pie-chart :data="dataPie"></pie-chart>
            </div>
          </div>
        </b-col>
      </b-row>
      <b-row>
        <b-col cols="4">
          <div class="box--graphic">
            <div class="box--graphic__body">
              <pie-chart :data="dataPie"></pie-chart>
            </div>
          </div>
        </b-col>
        <b-col cols="4">
          <div class="box--graphic">
            <div class="box--graphic__body">
              <pie-chart :data="dataPie"></pie-chart>
            </div>
          </div>
        </b-col>
        <b-col cols="4">
          <div class="box--graphic">
            <div class="box--graphic__body">
              <area-chart :data="dataArea"></area-chart>
            </div>
          </div>
        </b-col>
      </b-row>
    </div>-->
    <div class="dashboard-page__body">
      <div class="yah">
        <b-col md="6">
          <div class="pull--left" style="width:100%;">
            <b-form-input
              @keyup.enter.native="onFilterKeyUp"
              size="sm"
              placeholder="Filter"
              style="font-size: 12px"
              v-model="filter"
            ></b-form-input>
          </div>
        </b-col>
        <b-col md="6">
          <div class="pull--right">
            <span
              class="filtering__ex-col"
              style="font-size: 12px"
              @click="collapseAll"
            >Collapse All</span> |
            <span class="filtering__ex-col" style="font-size: 12px" @click="expandAll">Expand All</span>
            <span class="filtering__ex-col" @click="clearMenu">
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <i class="icon-close"></i>
            </span>
          </div>
        </b-col>
      </div>
      <div class="yah" v-for="(event, indexEvent) in ev" :key="indexEvent" v-show="!onFiltered">
        <b-col>
          <div class="yah">
            <b-col>
              <div class="title-yah" @click="collapseOrExpand(indexEvent)">
                <span>{{ event.menu_name }}</span>
                <div class="pull-right icon-right">
                  <i class="icon-arrow-down"></i>
                </div>
                <hr />
              </div>
            </b-col>
          </div>
          <div class="yah">
            <b-collapse
              :visible="collapsed[indexEvent]"
              :id="'menuCollapseAll'+indexEvent"
              style="width: 100%"
            >
              <div class="yah">
                <b-col md="6" v-for="(option, indexChild) in event.child" :key="indexChild">
                  <!-- <div @click.self="doCallMenu(option)"> -->
                  <div class="name-yah" @click.self="doCallMenu(option)">
                    {{option.menu_name}}
                    <!-- kalau Fav === 0 maka ga muncul bintang -->
                    <div
                      v-if="option.fav === 0"
                      class="pull-right list__icon-right"
                      style="z-index: -1;"
                    >
                      <i
                        class="icon-star"
                        @click="doInsert(event.menu_seq_no, option.option_seq, option.ps, indexChild)"
                      ></i>
                    </div>
                    <!-- selain 0 dia muncul bintang -->
                    <div
                      v-else
                      class="pull-right list__icon-right is-favorite"
                      style="z-index: -1;"
                    >
                      <i
                        class="icon-star"
                        @click="doDelete(event.menu_seq_no, option.option_seq, indexChild)"
                      ></i>
                    </div>
                  </div>
                  <!-- </div> -->
                </b-col>
              </div>
            </b-collapse>
          </div>
        </b-col>
      </div>

      <!-- <div class="yah" v-show="onFiltered"> -->
      <div class="yah" v-show="onFiltered">
        <b-col
          md="6"
          v-for="(option, index) in menuFilter"
          :key="index"
          @click.self="doCallMenu(option)"
        >
          <div class="name-yah" @click.self="doCallMenu(option)">
            {{option.menu_name}}
            <div v-if="option.fav === '0'" class="pull-right list__icon-right">
              <i
                class="icon-star"
                @click="doInsert(option.menu_seq_no, option.option_seq, option.ps, index)"
              ></i>
            </div>
            <div v-else class="pull-right list__icon-right is-favorite">
              <i class="icon-star" @click="doDelete(option.menu_seq_no, option.option_seq, index)"></i>
            </div>
          </div>
        </b-col>
      </div>
      <!-- </div> -->
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      showSubList: false,
      activeIndex: undefined,
      menus: [],

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

  watch: {
    "$store.getters.getParentSeqNo"(newData, oldData) {
      this.renderMenu();
    }
  },

  computed: {
    parentSeqNo() {
      // return this.$route.params.module_seq_no
      // this.renderMenu()
      return this.$store.getters.getParentSeqNo;
    },
    moduleName() {
      // return this.$route.params.moduleName
      return this.$store.getters.getModuleName;
    }
  },

  created() {
    this.menus = this.getMenu();
    this.modules =
      this.menus === undefined ? undefined : this.menus.module_list;
    this.events =
      this.menus === undefined ? undefined : this.menus.event_with_child;
  },

  mounted() {
    this.$store.dispatch("handlePaddingHeader", "0px");
    this.$store.dispatch("handlePaddingLeftContent", "0px");
    this.$store.dispatch("handleWidthSidebar", "0px");
    this.$store.dispatch("handleWidthRightbar", "0px");
    this.$store.dispatch("handleTextMenu", false);
    // this.$store.commit('setHideSideMenu', false)

    this.renderMenu();
  },

  methods: {
    renderMenu() {
      // this.showSubList = false
      // var parentSeqNo = this.$route.params.module_seq_no
      // this.moduleName = this.$route.params.moduleName
      if (!this.parentSeqNo || this.parentSeqNo == "") {
        this.$router.push("/");
      }
      //   this.module = this.parentSeqNo
      this.isDisableFilter = false;
      this.onFiltered = false;
      this.filter = "";
      this.collapsed = [];
      this.module = this.parentSeqNo;
      var x = this.parentSeqNo;
      // this.events = this.ev.filter(function(event) {
      // return event.Menu_status == 2 && event.parent_seq_no == this.parentSeqNo
      this.ev = this.events.filter(function(event) {
        return event.parent_seq_no == x;
      });

      this.ev.forEach(el => {
        this.collapsed.push(true);
      });
      this.showSubList = true;
    },
    clearMenu() {
      this.$store.dispatch("handlePaddingHeader", "225px");
      this.$store.dispatch("handlePaddingLeftContent", "230px");
      this.$store.dispatch("handleWidthSidebar", "230px");
      this.$store.dispatch("handleWidthRightbar", "0px");
      this.$store.dispatch("handleTextMenu", true);
      // this.$store.commit('setHideSideMenu', true)
      this.$router.go(-1);
      // this.activeIndex = undefined
      // this.ev = []
      // this.filter = ''
      // this.isDisableFilter = true
      // this.menuFilter = []
      // this.showSubList = false
      // this.closeBigMenu()
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
        menu_seq_no: this.module,
        user_id: this.getDataUser().user_id,
        subportfolio_cd: this.getDataUser().subportfolio_cd,
        param_where: this.filter
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
        this.$parent.$children[1].$children[3].changeFavMenu(
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
        this.$parent.$children[1].$children[3].changeFavMenu(
          localStorage.lsShortcutMenu
        );
      });
    },
    doCallMenu: function(menu) {
      console.log(menu);
      this.$store.dispatch("handlePaddingHeader", "225px");
      this.$store.dispatch("handlePaddingLeftContent", "230px");
      this.$store.dispatch("handleWidthSidebar", "230px");
      this.$store.dispatch("handleWidthRightbar", "0px");
      this.$store.dispatch("handleTextMenu", true);
      // this.$store.commit('setHideSideMenu', true)
      // localStorage.setItem('lsOptionSeq', JSON.stringify(menu))
      this.$router.push(menu.menu_url);
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
.yah {
  /* display: -ms-flexbox;
        display: -webkit-box; */
  display: flex;
  /* -ms-flex-wrap: wrap; */
  flex-wrap: wrap;
  /* margin-right: 15px !important;
        margin-left: 15px !important; */
}
.title-yah {
  padding-top: 25px;
  font-weight: bold;
}
.name-yah {
  font-size: 12px;
  cursor: pointer;
  padding: 5px;
}
.name-yah:hover {
  color: #0680ff;
  /* background-color: #b6b6b6; */
}
.is-favorite {
  color: #ff9600;
}
</style>