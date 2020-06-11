<template>
  <span>
    <template>
      <b-row>
          <b-col :offset="prop.cLabelSize">
            <b-form-radio-group 
              v-validate="prop.cValidate"
              :class="{'input': true, 'error-text-field': errors.has(prop.cParentForm+'.'+prop.cName)}"
              v-show="inputStatus!=='view'"
              :id="prop.cName"
              :name="prop.cName"
              :options="prop.cRadioOptions"
              :disabled="inputStatus=='edit' && prop.cKey || prop.cProtect"
              v-model="value"
              @input="handleInput"
              :tabindex="prop.cOrder"
              :ref="prop.cName"
              :stacked="prop.cGroup">
            </b-form-radio-group>

            <span v-show="errors.has(prop.cParentForm+'.'+prop.cName)"
              class="error-span">{{ errors.first(prop.cParentForm+'.'+prop.cName) }}
            </span>

            <label class="lbl-value-view-form notranslate" v-show="inputStatus=='view'">{{ (value && value!=='') ? (prop.cRadioOptions.map(function(e) { return e.value }).indexOf(value) > -1 ? (prop.cRadioOptions[prop.cRadioOptions.map(function(e) { return e.value }).indexOf(value)].text) : '') : '' }}</label>
          </b-col>
          <b-col md=1>
            <span v-show="inputStatus!='view' && prop.cShowClearButton" class="forClear" @click="clearSelected">Clear</span>
          </b-col>
      </b-row>
      <!-- <b-row v-else>
        <b-col :offset="prop.cLabelSize">
          <b-form-group>
            <template v-for="(opt, index) in prop.cRadioOptions">
              <b-form-radio
                v-bind:key="index"
                v-model="value"
                :class="{'input': true, 'error-text-field': errors.has(prop.cParentForm+'.'+prop.cName)}"
                v-show="inputStatus!=='view'"
                :id="prop.cName"
                :name="prop.cName"
                :value="opt.value"
              >
                {{opt.text}}
              </b-form-radio>
            </template>
            <b-form-radio v-model="selected" name="some-radios" value="A">Option A</b-form-radio>
            <b-form-radio v-model="selected" name="some-radios" value="B">Option B</b-form-radio>
          </b-form-group>
            <b-form-radio-group 
              v-validate="prop.cValidate"
              :class="{'input': true, 'error-text-field': errors.has(prop.cParentForm+'.'+prop.cName)}"
              v-show="inputStatus!=='view'"
              :id="prop.cName"
              :name="prop.cName"
              :options="prop.cRadioOptions"
              :disabled="inputStatus=='edit' && prop.cKey || prop.cProtect"
              v-model="value"
              @input="handleInput"
              :tabindex="prop.cOrder"
              :ref="prop.cName">
            </b-form-radio-group>

            <span v-show="errors.has(prop.cParentForm+'.'+prop.cName)"
              class="error-span">{{ errors.first(prop.cParentForm+'.'+prop.cName) }}
            </span>

            <label class="lbl-value-view-form notranslate" v-show="inputStatus=='view'">{{ (value && value!=='') ? (prop.cRadioOptions.map(function(e) { return e.value }).indexOf(value) > -1 ? (prop.cRadioOptions[prop.cRadioOptions.map(function(e) { return e.value }).indexOf(value)].text) : '') : '' }}</label>
          </b-col>
      </b-row> -->
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
      cOrder: Number,
      cKey:Boolean,
      cVisible:Boolean,
      cRadioDefaultOption: [String, Number],
      cParentForm: String,
      cProtect: Boolean,
      cShowClearButton: Boolean,
      cInputStatus: String,
      cGroup: Boolean
    },
    value : [String, Number]
  },
  data() {
    return {
      required: false,
      selected: null,
      isRequired: false,
    }
  },
  computed: {
    inputStatus() {
      this.$validator.pause()
      this.$nextTick(() => {
        this.$validator.errors.clear(this.prop.cParentForm)
        this.$validator.resume()
      })

      return this.prop.cInputStatus.toLowerCase();
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
    }
  },
  created: function() {
    if(this.prop.cRadioDefaultOption !== null && this.prop.cRadioDefaultOption !== undefined && this.prop.cRadioDefaultOption !== ''){
      this.value = this.prop.cRadioDefaultOption
    }

    this.prop.cShowClearButton = this.prop.cShowClearButton ? this.prop.cShowClearButton : false

    this.prop.cVisible = this.prop.cVisible === undefined || this.prop.cVisible === null ? true : this.prop.cVisible

    this.prop.cProtect = this.prop.cProtect ? this.prop.cProtect : false

    this.prop.cInputStatus = this.prop.cInputStatus
      ? this.prop.cInputStatus
      : "new";

    this.prop.cGroup = this.prop.cGroup === undefined || this.prop.cGroup === null ? true : this.prop.cGroup

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