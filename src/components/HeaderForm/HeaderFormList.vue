<template>
  <!-- <div style="position: fixed;width: 95%; z-index:2;"> -->
  <div>
    <div class="header--content">
      <!-- <div> -->
      <!-- <div class="header--content__breadcrumbs">        
        <span v-for="(bread, index) in BreadCrumbs" :key="index">
          <span v-if="bread.link != ''">
            <router-link :to="bread.link">{{ bread.name }}</router-link>
          </span>
          <span v-else>{{ bread.name }}</span>
          <span v-if="index != (BreadCrumbs.length - 1)">&nbsp; - &nbsp;</span>
        </span>
      </div> -->
    <!-- </div> -->
     <!-- <div class="header--content__breadcrumbs">        
        <span v-for="(bread, index) in BreadCrumbs" :key="index">
          <span v-if="bread.link != ''">
            <router-link :to="bread.link">{{ bread.name }}</router-link>
          </span>
          <span v-else>{{ bread.name }}</span>
          <span v-if="index != (BreadCrumbs.length - 1)">&nbsp; - &nbsp;</span>
        </span>
      </div>
      <div class="header--content__title" style="border-bottom:1px solid #dddddd !important;" :style="{ 'margin-right': widthRightbar}">
        <b-row>
          <b-col>
            <div>{{ BreadCrumbs[BreadCrumbs.length - 1].name }}</div>
          </b-col>
          <b-col>
            <div class="abs-page-info">Level {{PageLevel}} and Tab {{TabIndex}} is active</div>        
          </b-col>
        </b-row>        
      </div> -->
      <div class="header--content__title" :style="{ 'margin-right': widthRightbar}">
        <ABSToolBarFormHeader
            @new="doNew"
            @edit="doEdit"
            @delete="doDelete"
            @save="doSave"
            @cancel="doCancel"
            @refresh="doRefresh"
            @post="doPost"
            @export="doExport"
            @columns="doColumns"
            @advanceFilter="doAdvanceFilter"
            @onSearchEnter="doOnSearchEnter" 
            @GetPageLevel="getPageLevel"
            @GetTabIndex="getTabIndex"/>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  computed: {
    widthRightbar () {
      return this.$store.getters.widthRightbar
    }
  },
  components: {},
  mounted() {
    this.BreadCrumbs = this.$route.meta.breadcrumbs
  },
  beforeMount() {
    
  },
  props: {
    
  },
  data () {
    return {
      BreadCrumbs : [],
      PageLevel: '1',
      TabIndex: '1'
    }
  },
  watch: {
    
  },
  methods: {
    getPageLevel (data) {
      this.PageLevel = data
      // this.TabIndex = data.TabIndex
    },
    getTabIndex (data) {
      // this.PageLevel = data.PageLevel
      this.TabIndex = data.TabIndex
    },
    doNew () {
      this.$emit('new')
    },
    doEdit () {
      this.$emit('edit')
    },
    doDelete (data) {
      this.$emit('delete', data)
    },
    doSave () {
      this.$emit('save')
    },
    doCancel () {
      this.$emit('cancel')
    },
    doRefresh () {
      this.$emit('refresh')
    },
    doPost (data) {
      this.$emit('post', data)
    },
    doExport (data) {
      this.$emit('export', data)
    },
    doColumns () {
      this.$emit('columns')
    },
    doAdvanceFilter () {
      this.$emit('advanceFilter')
    },
    doOnSearchEnter (search) {
      this.$emit('onSearchEnter', search)
    }
  }
}
</script>