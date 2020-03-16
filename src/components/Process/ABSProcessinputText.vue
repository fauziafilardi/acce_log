<template>
  <span>
    <b-row v-show="prop.cVisible">
      <b-col :md="prop.cLabelSize" class="lbl-col-align">
        <template v-if="languageStatus">
          <label v-show="inputStatus=='new' || inputStatus=='edit'" class="lbl-text-form"><span v-if="isRequired" style="color:red;">*</span> {{ $t(prop.cName) == prop.cName ? prop.cLabel : $t(prop.cName)}} </label>
          <label v-show="inputStatus=='view'" class="lbl-view-form"><span v-if="isRequired" style="color:red;">*</span> {{ $t(prop.cName) == prop.cName ? prop.cLabel : $t(prop.cName)}} </label>
        </template>
        <template v-else>
          <label v-show="inputStatus=='new' || inputStatus=='edit'" class="lbl-text-form"><span v-if="isRequired" style="color:red;">*</span> {{ prop.cLabel }} </label>
          <label v-show="inputStatus=='view'" class="lbl-view-form"><span v-if="isRequired" style="color:red;">*</span> {{ prop.cLabel }} </label>
        </template>
      </b-col>
      <b-col v-if="inputStatus!=='view'">
        <b-form-input
          v-validate="prop.cValidate"
          :class="{'input': true, 'error-text-field': errors.has(prop.cParentForm+'.'+prop.cName)}"
          type="text"
          v-bind:name="prop.cName"
          v-bind:data-vv-as="prop.cLabel"
          v-model="value"
          class="text-field-form"
          @input="handleInput"
          :tabindex="prop.cOrder"
          :disabled="inputStatus=='edit' && prop.cKey || prop.cProtect"
          @keypress.native="formatNumber"
          :style="style"
          @blur.native="isCurrency"
          :ref="prop.cName"
          :id="prop.cName"
        />

          <span v-show="errors.has(prop.cParentForm+'.'+prop.cName)"
            class="error-span">{{ errors.first(prop.cParentForm+'.'+prop.cName) }}
          </span>
      </b-col>
      <b-col v-else>
        <label class="lbl-value-view-form notranslate">{{value}}</label>
      </b-col>
    </b-row>
  </span>
</template>

<script>
export default {
  props: {
    prop: {
      cValidate: String,
      cName: String,
      cLabel: String,
      cLabelSize: String,
      cOrder: Number,
      cType: String,
      cKey: Boolean,
      cDefault: String,
      cProtect: Boolean,
      cVisible: Boolean,
      cPageLevel: String,
      cTabIndex: String,
      cParentForm: String
    },
    value: [String, Number],
    inputStatus: String
  },
  data() {
    return {
      // isNew: false,
      // isEdit: false,
      size: 0,
      isRequired: false,
      style: {},
      // validators: {}
    };
  },
  methods: {
    clearValidator() {
      this.$validator.errors.clear(this.prop.cParentForm)
    },
    handleInput () {
      this.$emit('input', this.value)
    },
    formatNumber(evt){
      if(this.prop.cType == 'decimal'){
        // console.log(evt)
        evt = (evt) ? evt : window.event
        var charCode = (evt.which) ? evt.which : evt.keyCode
        if ((charCode > 31 && (charCode < 48 || charCode > 57)) && charCode !== 46) {
          evt.preventDefault()
        }
        else if(charCode == 46){
          var str = this.value
          if(str.indexOf('.') !== -1){
            evt.preventDefault()
          }
          else {
            return true
          }
        }
        else {
          return true
        }
      }
    },
    isCurrency () {
      if(this.prop.cType == 'decimal'){
        if(this.value !== ''){
          var num = this.value
          var numSplit = num.split('.')
          var numReal = numSplit[0].replace(',','')
          var numDecimal = numSplit[1] ? ("." + numSplit[1]) : '.00'

          this.value = numReal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + numDecimal
        }
      }
    },
  },
  computed: {
    languageStatus () {
      return this.$store.getters.languageStatus
    }
  },
  watch: {
  },
  created: function() {
    this.prop.cLabelSize = this.prop.cLabelSize ? this.prop.cLabelSize : 5
    this.prop.cType = this.prop.cType ? this.prop.cType : "text"
    this.prop.cProtect = this.prop.cProtect ? this.prop.cProtect : false
    this.prop.cVisible = this.prop.cVisible === undefined ? true : this.prop.cVisible
    this.value = this.prop.cDefault ? this.prop.cDefault : ''
    this.inputStatus = this.inputStatus === undefined ? 'new' : this.inputStatus

    if (this.prop.cType == 'decimal') {
      this.style = { 'text-align': 'right' }
    }

    // get max, for maxlength
    var str_array = this.prop.cValidate.split('|')
    for (var i = 0; i < str_array.length; i++) {
      var s = str_array[i].split(':')
      if(s[0] == 'max') {
        this.size = s[1]
      }
      else if(s[0] == 'required') {
        this.isRequired = true
      }

      // this.validators[s[0]] = s[1]==null || s[1]==undefined?true:s[1]
    }

  },
  mounted: function () {
  },
  beforeDestroy: function() {
  },
  updated: function () {
  }
}
</script>