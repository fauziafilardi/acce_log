<template>
  <span>
    <template v-if="prop.cVisible && prop.cHideRowColumnCSS">
      <b-form-radio-group 
        v-validate="prop.cValidate"
        :class="{'input': true, 'error-text-field': errors.has(prop.cParentForm+'.'+prop.cName)}"
        v-show="inputStatus!=='view'"
        :id="prop.cName"
        :name="prop.cName"
        :options="prop.cRadioOptions"
        :disabled="inputStatus=='edit' && prop.cKey || prop.cProtect || prop.cRowDisable.indexOf(rowLine) != -1"
        v-model="value"
        @input="handleInput"
        :tabindex="prop.cOrder"
        :ref="prop.cName">
      </b-form-radio-group>

      <span v-show="errors.has(prop.cParentForm+'.'+prop.cName)"
        class="error-span">{{ errors.first(prop.cParentForm+'.'+prop.cName) }}
      </span>

      <label class="lbl-value-view-form notranslate" v-show="inputStatus=='view'">{{ value && value!=='' ? prop.cRadioOptions[prop.cRadioOptions.map(function(e) { return e.value }).indexOf(value)].text : '' }}</label>
    </template>
    <template v-else-if="prop.cVisible">
      <b-row v-show="prop.cVisible">
        <!-- <b-col> -->
          <b-col :offset="prop.cLabelSize" :md="sizeElement">
            <b-form-radio-group 
              v-validate="prop.cValidate"
              :class="{'input': true, 'error-text-field': errors.has(prop.cParentForm+'.'+prop.cName)}"
              v-show="inputStatus!=='view'"
              :id="prop.cName"
              :name="prop.cName"
              :options="prop.cRadioOptions"
              :disabled="inputStatus=='edit' && prop.cKey || prop.cProtect || prop.cRowDisable.indexOf(rowLine) != -1"
              v-model="value"
              @input="handleInput"
              :tabindex="prop.cOrder"
              :ref="prop.cName">
            </b-form-radio-group>

            <span v-show="errors.has(prop.cParentForm+'.'+prop.cName)"
              class="error-span">{{ errors.first(prop.cParentForm+'.'+prop.cName) }}
            </span>

            <label class="lbl-value-view-form notranslate" v-show="inputStatus=='view'">{{ value && value!=='' ? prop.cRadioOptions[prop.cRadioOptions.map(function(e) { return e.value }).indexOf(value)].text : '' }}</label>
          </b-col>
          <b-col md=1>
            <span v-show="inputStatus!='view' && prop.cShowClearButton" class="forClear" @click="clearSelected">Clear</span>
          </b-col>
      </b-row>
    </template>
  </span>
</template>

<script>
export default {
  props: {
    prop: {
      cId: String,
      cName: String,
      cValidate: String,
      cRadioOptions: Array,
      cLabel: String,
      cLabelSize: String,
      cOrder: Number,
      cKey:Boolean,
      cVisible:Boolean,
      cRadioDefaultOption: [String, Number],
      cPageLevel: String,
      cTabIndex: String,
      cParentForm: String,
      cProtect: Boolean,
      cShowClearButton: Boolean,
      cHideRowColumnCSS: Boolean,
      cRowDisable: {type: Array, default: []}
    },
    rowLine: {type: Number, default: 0},
    value : [String, Number]
  },
  data() {
    return {
      required: false,
      selected: null,
      isRequired: false,
      sizeElement: 6
    }
  },
  computed: {
    inputStatus() {
      this.$validator.pause()
      this.$nextTick(() => {
        this.$validator.errors.clear(this.prop.cParentForm)
        this.$validator.resume()
      })
      // return this.$store.getters.getStatus

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
  methods: {
    focus() {
      this.$nextTick().then(() => document.getElementById(this.prop.cName).focus())
    },
    clearSelected () {
      this.value = null
    },
    handleInput (val) {
      this.$emit('input', this.value)
    },
    eventBusListener (action, data) {
      this.inputStatus.isNew = data
      if (action == 'new') {
        this.$validator.pause()
        this.$nextTick(() => {
          this.$validator.errors.clear(this.prop.cParentForm)
          this.$validator.resume()
        })
      }
      else if (action == 'edit') {
        this.inputStatus.isEdit = true
      }
      else if (action == 'cancel') {
        this.inputStatus.isEdit = false
      }
      else if (action == 'save') {
        this.inputStatus.isEdit = false
      }
    }
  },
  created: function() {
    this.prop.cRowDisable = this.prop.cRowDisable === undefined ? [] : this.prop.cRowDisable
    this.rowLine = this.rowLine === undefined ? 0 : this.rowLine
    this.prop.cHideRowColumnCSS = this.prop.cHideRowColumnCSS ? this.prop.cHideRowColumnCSS : false
    if(this.prop.cRadioDefaultOption !== null && this.prop.cRadioDefaultOption !== undefined && this.prop.cRadioDefaultOption !== ''){
      this.value = this.prop.cRadioDefaultOption
    }

    this.prop.cLabelSize = this.prop.cLabelSize ? this.prop.cLabelSize : 0

    this.sizeElement = 6 - parseInt(this.prop.cLabelSize)

    this.prop.cShowClearButton = this.prop.cShowClearButton ? this.prop.cShowClearButton : false

    this.prop.cVisible = this.prop.cVisible === undefined || this.prop.cVisible === null ? true : this.prop.cVisible

    this.prop.cProtect = this.prop.cProtect ? this.prop.cProtect : false

    // get max, for maxlength
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
  },
  beforeDestroy: function () {
  }
}
</script>

<style scoped>
  .forClear {
    color: blue;
    text-decoration: underline;
    cursor: pointer;
  }
</style>