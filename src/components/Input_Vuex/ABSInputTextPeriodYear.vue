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

      <b-col>
        <b-form-input
          v-validate="prop.cValidate"
          :class="{'input': true, 'error-text-field': errors.has(prop.cParentForm+'.'+prop.cName)}"
          type="text"
          v-bind:data-vv-name="prop.cName"
          v-bind:data-vv-as="prop.cLabel"
          v-model="valuePeriod"
          class="text-field-form"
          @input="handleInputPeriod"
          :maxlength="size"
          :tabindex="prop.cOrder"
          :disabled="inputStatus=='edit' && prop.cKey || prop.cProtect"
          @keypress.native="formatNumber"
          :style="style"
          @blur.native="isCurrency2"
          :ref="prop.cName"
          :id="prop.cName"
        />

        <!-- :width="prop.cSize+'px'" -->

        <span v-show="errors.has(prop.cParentForm+'.'+prop.cName)"
          class="error-span">{{ errors.first(prop.cParentForm+'.'+prop.cName) }}
        </span>
      </b-col>
      
      <b-col md=1 style="text-align: center">
        <span>/</span>
      </b-col>

      <b-col>
        <b-form-input
          v-validate="prop.cValidate"
          :class="{'input': true, 'error-text-field': errors.has(prop.cParentForm+'.'+prop.cName)}"
          type="text"
          v-bind:data-vv-name="prop.cName"
          v-bind:data-vv-as="prop.cLabel"
          v-model="valueYear"
          class="text-field-form"
          @input="handleInputYear"
          :maxlength="size"
          :tabindex="prop.cOrder"
          :disabled="inputStatus=='edit' && prop.cKey || prop.cProtect"
          @keypress.native="formatNumber"
          :style="style"
          @blur.native="isCurrency2"
          :ref="prop.cName"
          :id="prop.cName"
        />

        <!-- :width="prop.cSize+'px'" -->

        <span v-show="errors.has(prop.cParentForm+'.'+prop.cName)"
          class="error-span">{{ errors.first(prop.cParentForm+'.'+prop.cName) }}
        </span>
      </b-col>

      <b-col :md="prop.cType=='decimal'||prop.cType=='numeric'?3:''" v-show="inputStatus=='view'" :style="style">
        <label class="lbl-value-view-form notranslate">{{prop.cType=='decimal'?isCurrency(value):value}}</label>
      </b-col>
      <b-col md="1"></b-col>
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
      cKey: Boolean,
      cType: String,
      cDefault: String,
      cProtect: Boolean,
      cVisible: Boolean,
      cPageLevel: String,
      cTabIndex: String,
      cParentForm: String,
      cDecimal: [String, Number]
      // cSize: [Number, String]
    },
    valuePeriod: [String, Number],
    ValueYear: [String, Number]
  },
  data() {
    return {
      size: 9999,
      isRequired: false,
      style: {},
      decimals: "00"
    }
  },
  watch: {
    value(newData, oldData) {
      if (!newData) return
      // if (newData.indexOf('.') < 0) return
      if (!newData.toString().includes('.')) return
      
      var numSplit = newData.split('.')
      var temp
      if (numSplit[1].length > this.prop.cDecimal) {
        // temp = numSplit[1].substring(0, numSplit[1].length - this.prop.cDecimal)
        temp = numSplit[1].substring(0, this.prop.cDecimal)
        this.value = numSplit[0] + "." + temp
      }
    }
  },
  computed: {
    inputStatus() {
      this.$validator.pause()
      this.$nextTick(() => {
        this.$validator.errors.clear(this.prop.cParentForm)
        this.$validator.resume()
      })

      // if (this.$store.getters.getStatus !== 'view') {
      //   this.isCurrency2()
      // }

      if(this.$store.getters.getLevel == this.prop.cPageLevel && this.$store.getters.getTab == this.prop.cTabIndex){
        // if (this.prop.cType == 'decimal') {
        //   this.isCurrency2()
        // }
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
    handleInputPeriod () {
      if (this.prop.cType == 'text') {
        if (this.value) {
          this.value = this.value.toString()
        }
      }
      this.$emit('inputPeriod', this.value)
    },
    handleInputYear () {
      if (this.prop.cType == 'text') {
        if (this.value) {
          this.value = this.value.toString()
        }
      }
      this.$emit('inputYear', this.value)
    },
    checkSize (firstSize = 0) {
      if (firstSize === 0){
        return 0
      }
      else {
        var nums = ""
        var cnt = 0
        for (let i = 1; i <= firstSize; i++) {
          nums += "0"

          if (i === this.prop.cDecimal) {
            nums = nums.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
            cnt = ((nums.match(/,/g) || []).length) + 3
            return parseInt(firstSize) + cnt
          }
        }
      }
    },
    formatNumber(evt){
      if(this.prop.cType == 'decimal' || this.prop.cType == 'numeric'){
        // console.log('lala')
        evt = (evt) ? evt : window.event
        var charCode = (evt.which) ? evt.which : evt.keyCode
        if ((charCode > 31 && (charCode < 48 || charCode > 57)) && charCode !== 46) {
          evt.preventDefault()
        }
        else if(charCode == 46){
          if (this.prop.cType == 'numeric') {
            evt.preventDefault()
          }
          else {
            var str = this.value
            if(str.indexOf('.') !== -1){
              evt.preventDefault()
            }
            else {
              return true
            }
          }
        }
        else if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || charCode == 8 || charCode == 32) {
          evt.preventDefault()
        }
        else {
          return true
        }
      }
    },
    isCurrency2 () {
      if (this.prop.cType == 'decimal') {
        // console.log(this.value)
        if(this.value !== ''){
          var num = this.replaceAllString(this.value, ',', '', 'number')
          // console.log(num)
          var numSplit = null
          if (num.toString().indexOf('.') > -1) {
            numSplit = num.toString().split('.')
            // console.log(numSplit[1])
            if (numSplit[1].length < this.prop.cDecimal) {
              var dc = this.decimals.slice(0, (this.prop.cDecimal - numSplit[1].length))
              numSplit[1] += dc
            }
          } else {
            numSplit = [num, this.decimals]
          }

          // console.log(numSplit)
          var numReal = (numSplit[0] && numSplit[0] != '') ? numSplit[0] : 0
          var numDecimal = '.' + numSplit[1]

          this.value = numReal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + numDecimal
        }
      }

      this.$emit('onBlur', this.value)
    },
    onFocus () {
      if (this.prop.cType == 'decimal') {
        this.value = this.replaceAllString(this.value, ',', '', 'number')
      }
    }
  },
  created: function() {
    this.prop.cLabelSize = this.prop.cLabelSize ? this.prop.cLabelSize : 4
    this.prop.cDecimal = this.prop.cDecimal ? parseInt(this.prop.cDecimal) : 2
    this.prop.cType = this.prop.cType ? this.prop.cType : "text"
    this.prop.cProtect = this.prop.cProtect ? this.prop.cProtect : false
    this.prop.cVisible = this.prop.cVisible === undefined ? true : this.prop.cVisible
    this.value = this.prop.cDefault ? this.prop.cDefault : ''

    if (this.prop.cType == 'decimal') {
      
      this.decimals = ""
      for (let i = 1; i <= this.prop.cDecimal; i++) {
        this.decimals += "0"

        if (i === this.prop.cDecimal) {
          this.isCurrency2()
        }
      }

      this.style = { 'text-align': 'right' }
    }

    if (this.prop.cType == 'numeric') {
      // this.style = { 'text-align': 'right' }
    }

    // get max, for maxlength
    if(this.prop.cValidate !== undefined && this.prop.cValidate !== null && this.prop.cValidate !== ''){
      var str_array = this.prop.cValidate.split('|')
      for (var i = 0; i < str_array.length; i++) {
        var s = str_array[i].split(':')
        if(s[0] == 'max') {
          if (s[1] > 0) {
            // console.log(s[1], this.checkSize(s[1]))
            if (this.prop.cType == 'decimal') {
              this.prop.cValidate = this.replaceAllString(this.prop.cValidate, 'max:'+s[1], 'max:'+this.checkSize(s[1]), 'string')
              this.size = this.checkSize(s[1])
            }
            else {
              this.size = s[1]
            }
            this.size = this.prop.cType == 'decimal' ? this.checkSize(s[1]) : s[1]
          }
        }
        else if(s[0] == 'required') {
          this.isRequired = true
        }
      }
    }
    else {
      this.prop.cValidate = false
    }

    this.$validator.extend('greater', {
      getMessage (field, val) {
        // return 'The ' + field + ' field must be 1 or more.'
        return 'The ' + field + ' field must more than 0.'
      },
      validate (value, field) {
        if (value <= field) {
          return false
        } else {
          return true
        }
      }
    })
    
  },
  mounted: function () {
  },
  beforeDestroy: function() {
  },
  updated: function () {
  }
}
</script>