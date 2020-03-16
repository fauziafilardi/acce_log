<template>
  <span>
    <b-row v-show="prop.cVisible">
      <!-- <b-col class="lbl-col-align"> -->
      <b-col :class="prop.cClass">
        <template v-if="languageStatus">
          <label v-show="inputStatus=='new' || inputStatus=='edit'" class="text-field-form" :style="prop.cStyle"> {{ $t(prop.cLabel)}} </label>
          <label v-show="inputStatus=='view'" class="lbl-view-form" :style="prop.cStyle">{{ $t(prop.cLabel)}} </label>
        </template>
        <template v-else>
          <label v-show="inputStatus=='new' || inputStatus=='edit'" class="text-field-form" :style="prop.cStyle"> {{ prop.cLabel }} </label>
          <label v-show="inputStatus=='view'" class="lbl-view-form" :style="prop.cStyle"> {{ prop.cLabel }} </label>
        </template>
      </b-col>
    </b-row>
  </span>
</template>

<script>

export default {
  props: {
    prop: {
      cLabel: String,
      cValue: String,
      cPageLevel: Number,
      cTabIndex: Number,
      cVisible: Boolean,
      cStyle: String
    }
  },
  data() {
    return {
    }
  },
  methods: {
  },
  watch: {
  },
  computed: {
    inputStatus() {
      if(this.$store.getters.getLevel == this.prop.cPageLevel && this.$store.getters.getTab == this.prop.cTabIndex){
        return this.$store.getters.getStatus
      }
      else {
        return 'view'
      }
    },
    languageStatus () {
      return this.$store.getters.languageStatus
    }
  },
  created: function() {
    this.prop.cVisible = this.prop.cVisible === undefined ? true : this.prop.cVisible
    this.prop.cClass = this.prop.cClass ? this.prop.cClass : ""
    this.prop.cStyle = this.prop.cStyle ? this.prop.cStyle : ""
  }
}
</script>