<template>
  <b-row v-show="prop.cVisible">
      <b-col :md="prop.cLabelSize" class="lbl-col-align">

        <template v-if="languageStatus">
          <label class="text-field-form"><span v-if="isRequired" style="color:red;">*</span> {{ $t(prop.cName) == prop.cName ? prop.cLabel : $t(prop.cName)}} </label>
          <!-- <label v-show="inputStatus=='view'" class="lbl-view-form"><span v-if="isRequired" style="color:red;">*</span> {{ $t(prop.cName) == prop.cName ? prop.cLabel : $t(prop.cName)}} </label> -->
        </template>
        <template v-else>
          <label class="text-field-form"><span v-if="isRequired" style="color:red;">*</span> {{ prop.cLabel }} </label>
          <!-- <label v-show="inputStatus=='view'" class="lbl-view-form"><span v-if="isRequired" style="color:red;">*</span> {{ prop.cLabel }} </label> -->
        </template>

      </b-col>
      <b-col>
          <b-form-radio-group
            v-show="inputStatus!=='view'" 
            v-validate="prop.cValidate"
            :class="{'input': true, 'error-text-field': errors.has(prop.cParentForm+'.'+prop.cName)}"
            :id="prop.cName"
            :name="prop.cName"
            :options="prop.cRadioOptions"
            :disabled="prop.cProtect"
            v-model="value"
            @input="handleInput"
            :tabindex="prop.cOrder"
            :ref="prop.cName"
            :buttons="prop.cButton"
            button-variant="outline-primary"
            :size="prop.cSize">
          </b-form-radio-group>

          <span v-show="errors.has(prop.cParentForm+'.'+prop.cName)"
            class="error-span">{{ errors.first(prop.cParentForm+'.'+prop.cName) }}
          </span>

          <label class="lbl-value-view-form" v-show="inputStatus=='view'">{{ value && value!=='' ? prop.cRadioOptions[prop.cRadioOptions.map(function(e) { return e.value }).indexOf(value)].text : '' }}</label>
      </b-col>
      <b-col md=1>
        <span v-show="inputStatus!='view' && prop.cShowClearButton" class="forClear" @click="clearSelected">Clear</span>
      </b-col>
  </b-row>
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
      cButton: Boolean,
      cSize: String
    },
    value : [String, Number],
    inputStatus: String
  },
  data() {
    return {
      required: false,
      selected: null,
      isRequired: false,
    }
  },
  computed: {
    inputStatus2() {
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
    clearSelected () {
      this.value = null
    },
    clearValidator() {
      this.$validator.errors.clear(this.prop.cParentForm)
    },
    handleInput (val) {
      this.$emit('input', this.value)
    },
  },
  created: function() {
    if(this.prop.cRadioDefaultOption !== null && this.prop.cRadioDefaultOption !== undefined && this.prop.cRadioDefaultOption !== ''){
      this.value = this.prop.cRadioDefaultOption
    }

    this.prop.cLabelSize = this.prop.cLabelSize ? this.prop.cLabelSize : 4

    this.prop.cShowClearButton = this.prop.cShowClearButton ? this.prop.cShowClearButton : false

    this.prop.cVisible = this.prop.cVisible === undefined || this.prop.cVisible === null ? true : this.prop.cVisible

    this.prop.cProtect = this.prop.cProtect ? this.prop.cProtect : false

    this.inputStatus = this.inputStatus === undefined ? 'new' : this.inputStatus

    this.prop.cButton = this.prop.cButton ? this.prop.cButton : false
    this.prop.cSize = this.prop.cSize ? this.prop.cSize : 'md'

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