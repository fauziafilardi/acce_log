<template>
  <b-tabs :class="classObject" v-model="tabIndex">
    <b-tab
      :disabled="isTabDisable"
      v-for="(parent, index) in listTab"
      :key="PageLevel+'_'+index"
      :title="parent.query_name"
      @click="tabClicked((index + 1).toString())"
    >
    <!-- {{parent.url}} -->
      <ABSTabDetailVuex
        v-model="parent.dataInsert"
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
            return ''
        //   if (this.getLevel == this.PageLevel) {
        //     return 'ABSTabs__active'
        //   } else {
        //     return 'ABSTabs__inActive'
        //   }
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
        // listTab: function (newData, oldData) {
        //     if (this.PageLevel == '1') {
        //         this.$parent.doGetTabDetail(this.listTab[0])
        //     } else if (this.PageLevel == '2') {
        //         this.$parent.doGetTabChild(this.listTab[0])
        //     }
        // }
    },
    methods: {
        tabClicked (tabIndex) {
            // this.$children[0].$children[tabIndex - 1].$children[0].$children[0].paramFromParent()
            this.$emit('onTabClick', tabIndex)
        },
        setTabDisable (status) {
            this.isTabDisable = status
        },
        getChild() {
            return this.$children[0].$children[this.tabIndex].$children[0].$children[0]
        }
    },
    created () {
    }
}
</script>