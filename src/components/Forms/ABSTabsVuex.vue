<template>
  <b-tabs :class="classObject" v-model="tabIndex">
    <b-tab
      :disabled="isTabDisable"
      v-for="(parent, index) in listTab"
      :key="PageLevel+'_'+index"
      :title="parent.query_name"
      @click="tabClicked((index + 1).toString())"
    >
      <ABSTabDetailVuex
        :tabPath="tabPath"
        :tabUrl="parent.url"
        :data="parent"
        :PageLevel="PageLevel"
        :TabIndex="(index + 1).toString()"
      />
    </b-tab>
  </b-tabs>
</template>

<script>
export default {
  computed: {
    getLevel () {
      return this.$store.getters.getLevel
    },
    classObject: function () {
      if (this.getLevel == this.PageLevel) {
        return 'ABSTabs__active'
      } else {
        return 'ABSTabs__inActive'
      }
    },
  },
  props: {listTab: Array, tabPath: String, PageLevel: [String, Number]},
  data () {
    return {
      classes: '',
      isTabDisable: false,
      tabIndex: 0
    }
  },
  watch: {
    listTab: function (newData, oldData) {
      if (this.PageLevel == '1') {
        this.$parent.doGetTabDetail(this.listTab[0])
      } else if (this.PageLevel == '2') {
        this.$parent.doGetTabChild(this.listTab[0])
      }
    }
  },
  
  methods: {
    tabClicked (tabIndex) {
      this.$store.commit('setLevel', this.PageLevel)

      this.$store.commit('setTab', tabIndex)

      if (this.PageLevel == '1') {
        this.$parent.doGetTabDetail(this.listTab[tabIndex - 1])
      } else if (this.PageLevel == '2') {
        this.$parent.doGetTabChild(this.listTab[tabIndex - 1])
        this.$store.commit('setTabLevel2Active', tabIndex)
      } else if (this.PageLevel == '3') {
        this.$store.commit('setTabLevel3Active', tabIndex)
      }

      this.$store.commit('setFormType',this.$children[0].$children[tabIndex - 1].$children[0].$children[0].FormType)
      this.$parent.$children[0].$children[0].ProcessPS(this.listTab[tabIndex - 1].ps)
      this.$children[0].$children[tabIndex - 1].$children[0].$children[0].M_TabClick()
      this.$children[0].$children[tabIndex - 1].$children[0].$children[0].paramFromParent()
    },
    setTabIndex () {
      this.$store.commit('setTab', this.tabIndex + 1)
      this.$store.commit('setFormType',this.$children[0].$children[this.tabIndex].$children[0].$children[0].FormType)
      this.$parent.$children[0].$children[0].ProcessPS(this.listTab[this.tabIndex].ps)
    },
    setTabDisable (status) {
      this.isTabDisable = status
    }
  },
  created () {
  }
}
</script>