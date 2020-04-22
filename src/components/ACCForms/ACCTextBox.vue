<template>
  <span>
    <b-form-input
      v-validate="prop.cValidate"
      :class="{'input': true, 'error-text-field': errors.has(prop.cParentForm+'.'+prop.cName)}"
      :type="type"
      v-bind:data-vv-name="prop.cName"
      v-model="value"
      class="text-field-form"
      @input="handleInput"
      :maxlength="size"
      :tabindex="prop.cOrder"
      :disabled="(inputStatus == 'edit' && prop.cKey) || prop.cProtect"
      @keypress.native="formatNumber"
      :style="style"
      @blur.native="isCurrency2"
      :ref="prop.cName"
      :id="prop.cName"
      @paste.native="onPaste"
    />

    <span v-show="errors.has(prop.cParentForm+'.'+prop.cName)"
      class="error-span">{{ errors.first(prop.cParentForm+'.'+prop.cName) }}
    </span>
  </span>
</template>

<script>

export default {
  props: {
    prop: {
      cValidate: String,
      cName: String,
      cOrder: Number,
      cKey: Boolean,
      cType: String,
      cProtect: Boolean,
      cParentForm: String,
      cStyle: String,
      cDecimal: [String, Number],
      cInputStatus: String
    },
    value: [String, Number]
  },
  data() {
    return {
      size: 9999,
      isRequired: false,
      style: {},
      decimals: "00",
      type: "text"
    }
  },
  computed: {
    inputStatus() {
      this.$validator.pause()
      this.$nextTick(() => {
        this.$validator.errors.clear(this.prop.cParentForm)
        this.$validator.resume()
      })
      
      return this.prop.cInputStatus.toLowerCase()
    },
    languageStatus () {
      return this.$store.getters.languageStatus
    }
  },
  methods: {
    onPaste (evt) {
      if (this.prop.cType == 'decimal' || this.prop.cType == 'numeric') {
        var prevValue = this.value
        this.$nextTick(() => {
          for (var i = 0; i < this.value.length; i++) {
            var code = this.value.charCodeAt(i)
            // ASCII 0 - 9 AND , AND .
            if (!(code >= 48 && code <= 57) && !(code == 44) && !(code == 46)) {
              this.$nextTick(() => {
                // this.value = prevValue
                if (this.prop.cType == 'decimal') {
                  this.value = '0.00'
                } else {
                  this.value = ''
                }
              })
              break
            }    
          }
          this.$forceUpdate()
        })
      }
    },
    computedClass(index) {
      if (index % 2 == 0) {
        return 'genap'
      } else {
        return 'ganjil'
      }
    },
    handleInput () {
      if (this.prop.cType == 'text') {
        if (this.value) {
          this.value = this.value.toString()
        }
      }
      else {
        this.value = this.value
      }
      this.$emit('input', this.value)
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
      evt = (evt) ? evt : window.event
      var charCode = (evt.which) ? evt.which : evt.keyCode
      
      if(this.prop.cType == 'decimal' || this.prop.cType == 'numeric' || this.prop.cType == 'tel'){
        // console.log('lala')
        
        
        if ((charCode > 31 && (charCode < 48 || charCode > 57)) && (charCode !== 46 && charCode !== 43)) {
          evt.preventDefault()
        }
        else if(charCode == 46){
          if (this.prop.cType == 'numeric' || this.prop.cType == 'tel') {
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
        else if (charCode == 43) {
            if (this.prop.cType !== 'tel' && this.prop.cType !== 'text') {
                evt.preventDefault()
            }
            else if(this.prop.cType == 'tel') {
                var str = this.value
                if(str.indexOf('+') !== -1){
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
        else if (charCode == 13) {
          this.$emit('onEnterPress', this.value)
          return true
        }
        else {
          return true
        }
      }else{
          if (charCode == 13) {
            this.$emit('onEnterPress', this.value)
            return true
          }
      }
    },
    isCurrency2 () {
      // console.log(this.value)
      if (this.prop.cType == 'decimal') {
        // console.log(this.value)
        // this.value = this.isCurrency(this.value, this.decimal)
        if(this.value !== ''){
          var num = this.replaceAllString(this.value, ',', '', 'number')
          // console.log(num)
          var numSplit = null
          if (num.toString().indexOf('.') > -1) {
            numSplit = num.toString().split('.')
            if (numSplit[1].length < this.prop.cDecimal) {
              var dc = this.decimals.slice(0, (this.prop.cDecimal - numSplit[1].length))
              numSplit[1] += dc
            }
            else {
              var x = parseFloat(num).toFixed(this.prop.cDecimal)
              var nn = x.toString().split('.')
              numSplit[0] = nn[0]
              numSplit[1] = nn[1]
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
      this.$emit('input', this.value)
    },
    onFocus () {
      if (this.prop.cType == 'decimal') {
        this.value = this.replaceAllString(this.value, ',', '', 'number')
      }
    },
    focus() {
      this.$nextTick().then(() => document.getElementById(this.prop.cName).focus())
    }
  },
  watch: {
  },
  created: function() {
    // this.prop.cLabelSize = this.prop.cLabelSize ? this.prop.cLabelSize : 0
    this.prop.cDecimal = this.prop.cDecimal ? parseInt(this.prop.cDecimal) : 2
    this.prop.cType = this.prop.cType ? this.prop.cType : "text"
    this.prop.cProtect = this.prop.cProtect ? this.prop.cProtect : false
    // this.prop.cLastLabelShow = this.prop.cLastLabelShow === undefined ? true : this.prop.cLastLabelShow
    // this.prop.cVisible = this.prop.cVisible === undefined ? true : this.prop.cVisible
    this.value = this.prop.cDefault ? this.prop.cDefault : ''
    // this.prop.cRowDisable = this.prop.cRowDisable === undefined ? [] : this.prop.cRowDisable
    // this.prop.cHideRowColumnCSS = this.prop.cHideRowColumnCSS ? this.prop.cHideRowColumnCSS : false
    // this.prop.cRowDisable = this.prop.cRowDisable && this.prop.cRowDisable.length > 0 ? this.prop.cRowDisable.length : []
    this.prop.cInputStatus = this.prop.cInputStatus ? this.prop.cInputStatus : "new"
    this.prop.cStyle = this.prop.cStyle ? this.prop.cStyle : ""
    this.style +=this.prop.cStyle

    if (this.prop.cType == 'email') {
        this.type = "email"
    }
    else {
        this.type = "text"
    }

    if (this.prop.cType == 'decimal') {
      
      this.decimals = ""
      for (let i = 1; i <= this.prop.cDecimal; i++) {
        this.decimals += "0"

        if (i === this.prop.cDecimal) {
          this.isCurrency2()
        }
      }

      // this.style = { 'text-align': 'right', 'font-family': 'VnArialNarrow' }
      this.style += "text-align: right !important;"
    }

    if (this.prop.cType == 'numeric') {
      // this.style = { 'text-align': 'right' }
    }

    // get max, for maxlength
    if (this.prop.cValidate !== undefined && this.prop.cValidate !== null && this.prop.cValidate !== '' && this.prop.cValidate) {
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
    // if (this.prop.cIsAlwaysShow == undefined) {
    //   this.prop.cIsAlwaysShow = false
    // } else if (this.prop.cIsAlwaysShow == "") {
    //   this.prop.cIsAlwaysShow = false
    // }
  },
  beforeDestroy: function() {
  },
  updated: function () {
  }
}
</script>