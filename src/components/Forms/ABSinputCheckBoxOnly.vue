<template>
  <span>
    <template v-if="prop.cVisible && prop.cHideRowColumnCSS">
      <b-form-checkbox-group
        :name="prop.cName"
        :size="prop.cSize"
        :options="prop.cOptions"
        :disabled="(inputStatus=='edit' && prop.cKey) || prop.cProtect || inputStatus=='view' || prop.cRowDisable.indexOf(rowLine) != -1"
        v-model="value"
        :id="prop.cName"
        :tabindex="prop.cOrder"
        @input="handleInput"
        @change="handleChange"
        style="height: 20px !important"
        >
      </b-form-checkbox-group>
    </template>
    <template v-else-if="prop.cVisible">
      <b-form-checkbox-group
        :name="prop.cName"
        :size="prop.cSize"
        :options="prop.cOptions"
        :disabled="(inputStatus=='edit' && prop.cKey) || prop.cProtect || inputStatus=='view' || prop.cRowDisable.indexOf(rowLine) != -1"
        v-model="value"
        :id="prop.cName"
        :tabindex="prop.cOrder"
        @input="handleInput"
        @change="handleChange"
        >
      </b-form-checkbox-group>

      <span v-show="errors.has(prop.cParentForm+'.'+prop.cName)"
        class="error-span">{{ errors.first(prop.cParentForm+'.'+prop.cName) }}
      </span>
    </template>
  </span>
</template>

<script>
export default {
  props: {
    prop: {
      cValidate: String,
      cName: String,
      cLabel: String,
      cLabelSize: Number,
      cOptions: Array,
      cOrder: Number,
      cKey: Boolean,
      cVisible: Boolean,
      cProtect: Boolean,
      cPageLevel: String,
      cTabIndex: String,
      cParentForm: String,
      cNoValue: String,
      cDefault: [Array, String, Number],
      cHideRowColumnCSS: Boolean,
      cRowDisable: {type: Array, default: []},
      cSize: String
    },
    rowLine: {type: Number, default: 0},
    value: {
      type: [Array, String, Number],
      default: []
    }
  },
  computed: {
    inputStatus() {
      this.$validator.pause()
      this.$nextTick(() => {
        this.$validator.errors.clear(this.prop.cParentForm)
        this.$validator.resume()
      })

      if(this.$store.getters.getLevel == this.prop.cPageLevel && this.$store.getters.getTab == this.prop.cTabIndex){
        return this.$store.getters.getStatus
      }
      else {
        return 'view'
      }
    }
  },
  watch: {
    value(newData, oldData) {
      if (this.prop.cNoValue && this.prop.cNoValue != '') {
        if (newData === this.prop.cNoValue) {
          this.value = ''
        }
      }
    }
  },
  data() {
    return {
      selected: this.value,
      isRequired: false
    };
  },
  methods: {
    handleInput () {
      this.$emit('input', this.value)
    },
    handleChange () {
      this.$emit('change')
      // this.$emit('change', this.value)
    },
    focus() {
      this.$nextTick().then(() => document.getElementById(this.prop.cName).focus())
    }
  },
  created: function() {    
    this.prop.cLabelSize = this.prop.cLabelSize ? this.prop.cLabelSize : 4
    this.prop.cVisible = this.prop.cVisible === undefined || this.prop.cVisible === null ? true : this.prop.cVisible
    this.prop.cProtect = this.prop.cProtect ? this.prop.cProtect : false
    this.prop.cRowDisable = this.prop.cRowDisable === undefined ? [] : this.prop.cRowDisable
    this.prop.cHideRowColumnCSS = this.prop.cHideRowColumnCSS ? this.prop.cHideRowColumnCSS : false
    this.prop.cSize = this.prop.cSize ? this.prop.cSize : 'md'
    if (this.prop.cDefault) {
      this.value = this.prop.cDefault
    }

    if(this.prop.cValidate !== undefined && this.prop.cValidate !== null && this.prop.cValidate !== ''){
      var str_array = this.prop.cValidate.split('|')
      for (var i = 0; i < str_array.length; i++) {
        var s = str_array[i].split(':')
        if(s[0] == 'required') {
          this.isRequired = true
        }
      }
    }
  },
  mounted: function () {
  }
}
</script>
