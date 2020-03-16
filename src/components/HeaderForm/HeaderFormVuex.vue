<template>
    <div>
    <div class="header--content">      
      <!-- <div class="header--content__title" style="border-bottom:1px solid #dddddd !important;" :style="{ 'margin-right': widthRightbar}">
        <b-row>
          <b-col>
            <div>{{ BreadCrumbs[BreadCrumbs.length - 1].name }}</div>
          </b-col>
          <b-col>
            <div class="abs-page-info">Level {{pageLevel}} and Tab {{tabIndex}} is active</div>        
          </b-col>
        </b-row>        
      </div> -->
      <!-- <div class="header--content__title" style="border-bottom:1px solid #dddddd !important;" :style="{ 'margin-right': widthRightbar}">
        <ABSToolBarVuex
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
            @onSearchEnter="doOnSearchEnter" />
      </div> -->
    </div>
  </div>
</template>

<script>
export default {
  computed: {
    widthRightbar () {
      return this.$store.getters.widthRightbar
    },
    pageLevel () {
      return this.$store.getters.getLevel
    },
    tabIndex () {
      return this.$store.getters.getTab
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
    }
  },
  watch: {
    
  },
  methods: {
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