<template>
  <span>
    <b-row v-if="prop.cVisible && prop.cIsAlwaysShow">
      <b-col :md="prop.cLabelSize" class="lbl-col-align">
        <template v-if="languageStatus">
          <label class="lbl-text-form"><span v-if="isRequired" style="color:red;">*</span> {{ $t(prop.cName) == prop.cName ? prop.cLabel : $t(prop.cName)}} </label>
        </template>
        <template v-else>
          <label class="lbl-text-form"><span v-if="isRequired" style="color:red;">*</span> {{ prop.cLabel }} </label>
        </template>
      </b-col>
      <b-col :md="prop.cType=='decimal'||prop.cType=='numeric'?4:'7'">
        <b-form-input
          v-validate="prop.cValidate"
          :class="{'input': true, 'error-text-field': errors.has(prop.cParentForm+'.'+prop.cName)}"
          type="text"
          v-bind:data-vv-name="prop.cName"
          v-bind:data-vv-as="prop.cLabel"
          v-model="value"
          class="text-field-form"
          @input="handleInput"
          :maxlength="size"
          :tabindex="prop.cOrder"
          :disabled="prop.cKey || prop.cProtect"
          @keypress.native="formatNumber"
          :style="style"
          @blur.native="isCurrency2"
          :ref="prop.cName"
          :id="prop.cName"
          :readonly="prop.cReadOnly"
          @paste.native="onPaste"
          @keydown.native="onKeyDown"
        />

        <!-- :width="prop.cSize+'px'" -->

        <span v-show="errors.has(prop.cParentForm+'.'+prop.cName)"
          class="error-span">{{ errors.first(prop.cParentForm+'.'+prop.cName) }}
        </span>
      </b-col>
      <!-- <b-col :md="prop.cType=='decimal'||prop.cType=='numeric'?4:''" v-show="inputStatus=='view'" :style="style">
        <label class="lbl-value-view-form" :style="prop.cStyle">{{value}}</label>
      </b-col> -->
      <b-col v-if="prop.cLastLabel" md="1">
        <label class="lbl-value-view-form">{{ prop.cLastLabel }}</label>
      </b-col>
    </b-row>
    <!-- <b-row v-else-if="prop.cVisible" style="height: 30px !important;"> -->
      <b-row v-else-if="prop.cVisible">
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
      <!-- <b-col :md="prop.cType=='decimal'||prop.cType=='numeric'?4:''" v-show="inputStatus!=='view'" style="height: 30px !important;"> -->
        <b-col :md="prop.cType=='decimal'||prop.cType=='numeric'?4:'7'" v-show="inputStatus!=='view'">
        <b-form-input
          v-validate="prop.cValidate"
          :class="{'input': true, 'error-text-field': errors.has(prop.cParentForm+'.'+prop.cName)}"
          type="text"
          v-bind:data-vv-name="prop.cName"
          v-bind:data-vv-as="prop.cLabel"
          v-model="value"
          class="text-field-form"
          @input="handleInput"
          :maxlength="size"
          :tabindex="prop.cOrder"
          :disabled="inputStatus=='edit' && prop.cKey || prop.cProtect"
          @keypress.native="formatNumber"
          :style="style"
          @blur.native="isCurrency2"
          :readonly="prop.cReadOnly"
          :ref="prop.cName"
          :id="prop.cName"
          @paste.native="onPaste"
        />

        <!-- <span v-show="prop.cCalculator == true && prop.cType == 'decimal' && showCalc" >
          <b-row>
            <b-col md="4">
              <label v-show="prop.cCalculator == true && prop.cType == 'decimal' && showCalc" class="lbl-text-form">Calculator</label>
            </b-col>
            <b-col :md="prop.cType=='decimal'||prop.cType=='numeric'?4:'7'" v-show="inputStatus!=='view'">
              <b-form-input
                :class="{'input': true}"
                type="text"
                v-bind:data-vv-name="prop.cName+'calc'"
                v-bind:data-vv-as="prop.cLabel+'calc'"
                v-model="calc"
                class="text-field-form"
                @keypress.native="formatCalc"
                :ref="prop.cName+'calc'"
                :id="prop.cName+'calc'"
              />
            </b-col>
          </b-row>
          
        </span> -->

        <!-- :width="prop.cSize+'px'" -->

        <span v-show="errors.has(prop.cParentForm+'.'+prop.cName)"
          class="error-span">{{ errors.first(prop.cParentForm+'.'+prop.cName) }}
        </span>
      </b-col>
      <b-col md="4" v-if="inputStatus=='view' && prop.cType=='decimal'" style="text-align: right !important;">
        <!-- <label class="lbl-value-view-form notranslate" style="font-family: 'VnArialNarrow' !important;">{{value}}</label> -->
        <label class="lbl-value-view-form notranslate">{{value}}</label>
      </b-col>
      <b-col md="4" v-else-if="inputStatus=='view' && prop.cType=='numeric'">
        <label class="lbl-value-view-form notranslate">{{value}}</label>
      </b-col>
      <b-col md="" v-else-if="inputStatus=='view'">
        <label class="lbl-value-view-form notranslate">{{value}}</label>
      </b-col>
      <!-- <b-col :md="prop.cType=='decimal'||prop.cType=='numeric'?4:''" v-show="inputStatus=='view'" style="text-align: right !important;">
        <label class="lbl-value-view-form notranslate">{{value}}</label>
      </b-col> -->
      <b-col v-if="prop.cLastLabel" :md="prop.cType=='decimal'||prop.cType=='numeric'?3:1">
        <label class="lbl-value-view-form">{{ prop.cLastLabel }}</label>
      </b-col>
      <b-col md="1" v-show="prop.cCalculator == true">
        <div class="add-icon--plus" v-show="prop.cType=='decimal' && inputStatus!=='view'" @click="doShowCalc">
          <i class="icon-calculator"></i>
        </div>
      </b-col>
    </b-row>
    <b-row v-show="prop.cCalculator == true && prop.cType == 'decimal' && showCalc" >
      <!-- <b-col md="8">
        <b-row> -->
          <b-col :md="prop.cLabelSize" class="lbl-col-align" style="padding-top: auto">
            <label class="lbl-text-form" style="color: blue; font-weight: bold;">Calculator </label>
          </b-col>
          <b-col md="4" v-show="inputStatus!=='view'" style="padding-top: auto">
            <b-form-input
              style="border: 1px solid blue;"
              :class="{'input': true}"
              type="text"
              v-bind:data-vv-name="prop.cName+'calc'"
              v-bind:data-vv-as="prop.cLabel+'calc'"
              v-model="calc"
              class="text-field-form"
              @keypress.native="formatCalc"
              :ref="prop.cName+'calc'"
              :id="prop.cName+'calc'"
            />
          </b-col>
        <!-- </b-row>
      </b-col> -->
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
      cReadOnly: Boolean,
      cVisible: Boolean,
      cPageLevel: String,
      cTabIndex: String,
      cParentForm: String,
      cDecimal: [String, Number],
      cLastLabel: String,
      cStyle: String,
      cIsAlwaysShow: Boolean,
      NoPaste: Boolean,
      cCalculator: Boolean,
      cAllowMinus: Boolean
      // cSize: [Number, String]
    },
    value: [String, Number]
  },
  data() {
    return {
      size: 9999,
      isRequired: false,
      style: "",
      decimals: "00",
      showCalc: false,
      calc: '',
      ccx: {}
      // cRequiredMsg: ""
    }
  },
  watch: {
    value(newData, oldData) {
      if (!newData) return
      // if (newData.indexOf('.') < 0) return
      if (this.prop.cType == 'decimal') {
        // if (!newData.toString().includes('.')) return
        // // this.value = newData.toFixed(this.decimal)
        // // return
      
        // var numSplit = newData.toString().split('.')
        // var temp
        // if (numSplit[1].length > this.prop.cDecimal) {
        //   // temp = numSplit[1].substring(0, numSplit[1].length - this.prop.cDecimal)
        //   temp = numSplit[1].substring(0, this.prop.cDecimal)
        //   this.value = numSplit[0] + "." + temp
        // }
      }
    },
    'prop.cValidate'(newData, oldData) {
      // console.log(oldData, newData);
      if (newData && newData != ''){
        if (newData.includes('cRequired:')) {
          var msg = newData.match(new RegExp(/cRequired\:(.*)/));
          this.ccx.custom[this.prop.cName] = {
            'required' : msg[1].includes('|') ? msg[1].match(new RegExp(/(.*)\|/))[1] : msg[1]
          }

          this.$validator.localize('en', this.ccx)
          // this.$validator.extend('cRequired', {
          //   getMessage (field, args) {
          //     // vm.cRequiredMsg = args[0]
          //     return args[0]
          //   },
          //   validate (value, args) {
          //     // vm.cRequiredMsg = args[0]
          //     return true
          //   }
          // })
        }
        else if(newData.includes('cmin_value:')){
          var msg = newData.match(new RegExp(/cmin_value\:(.*)/));
          this.ccx.custom[this.prop.cName] = {
            'min_value' : msg[1].includes('|') ? msg[1].match(new RegExp(/(.*)\|/))[1] : msg[1]
          }

          this.$validator.localize('en', this.ccx)
          // this.$validator.extend('cmin_value', {
          //   getMessage (field, args) {
          //     console.log(args);
          //     // vm.cRequiredMsg = args[0]
          //     return args[0]
          //   },
          //   validate (value, args) {
          //     // vm.cRequiredMsg = args[0]
          //     return true
          //   }
          // })
        }
        else if(newData.includes('cmax_value:')){
          var msg = newData.match(new RegExp(/cmax_value\:(.*)/));
          this.ccx.custom[this.prop.cName] = {
            'max_value' : msg[1].includes('|') ? msg[1].match(new RegExp(/(.*)\|/))[1] : msg[1]
          }

          this.$validator.localize('en', this.ccx)
          // this.$validator.extend('cmax_value', {
          //   getMessage (field, args) {
          //     console.log(args);
          //     // vm.cRequiredMsg = args[0]
          //     return args[0]
          //   },
          //   validate (value, args) {
          //     // vm.cRequiredMsg = args[0]
          //     return true
          //   }
          // })
        }
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
          // if (this.$store.getters.getStatus !== 'view') {
            // this.value = this.isCurrency(this.value)
          // }
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
    doShowCalc() {
      this.showCalc = !this.showCalc
    },
    calculate() {
      var num = this.calc
      this.calc = ''
      var calc = eval(num)
      this.value = calc
      this.showCalc = false
      this.$refs[this.prop.cName].focus()
      // this.$forceUpdate()

      this.$nextTick(() => {
        this.calc = ''
      })
      this.$emit('input', this.value)

      this.$forceUpdate()
    },
    onPaste (evt) {
      console.log(evt)
      if (this.prop.NoPaste) {
        evt.preventDefault()
      }
      if (this.prop.cType == 'decimal' || this.prop.cType == 'numeric') {
        var prevValue = this.value
        this.$nextTick(() => {
          for (var i = 0; i < this.value.length; i++) {
            var code = this.value.charCodeAt(i)
            // ASCII 0 - 9 AND , AND .
            if (!(code >= 48 && code <= 57) && !(code == 44) && !(code == 46) && !(code == 45)) {
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
    handleInput () {
      if (this.prop.cType == 'text') {
        if (this.value) {
          this.value = this.value.toString()
        }
      }
      else {
        this.value = this.value //this.isCurrency(this.value)
        // document.getElementById(this.prop.cName).createTextRange().moveStart('character', thips.value.length - 3)
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
    formatCalc(evt) {
      evt = (evt) ? evt : window.event
      var charCode = (evt.which) ? evt.which : evt.keyCode
      if ((charCode > 31 && (charCode < 45 || charCode > 57)) && (charCode < 42 || charCode > 43)) {
        evt.preventDefault()
      }
      else if (charCode === 13) {
        this.calculate()
      }
      else {
        return true
      }
    },
    formatNumber(evt){
      if(this.prop.cType == 'decimal' || this.prop.cType == 'numeric'){
        // console.log('lala')
        evt = (evt) ? evt : window.event
        var charCode = (evt.which) ? evt.which : evt.keyCode
        // this.value = this.replaceAllString(str, '-', '', 'string')

        if ((charCode > 31 && (charCode < 48 || charCode > 57)) && charCode !== 46) {
          if (this.prop.cAllowMinus !== true) {
            evt.preventDefault()
          }
          else {
              var str = this.value
              if(str.indexOf('-') !== -1){
                evt.preventDefault()
              }
              else if(str.indexOf('-') > 0){
                this.value = this.replaceAllString(str, '-', '', 'string')
              }
              else {
                return true
              }
            }
          }
        else if(charCode == 46){ // .
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
      // else {
      //   evt = (evt) ? evt : window.event
      //   var charCode = (evt.which) ? evt.which : evt.keyCode
      //   console.log(charCode)
      //   if ((charCode > 31 && (charCode < 48 || charCode > 57)) && charCode !== 46 && charCode !== 45) {
      //     evt.preventDefault()
      //   }
      // }
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
  created: function() {
    var vm = this
    this.$validator.extend('cRequired', {
      getMessage (field, args) {
        // vm.cRequiredMsg = args[0]
        return args[0]
      },
      validate (value, args) {
        // vm.cRequiredMsg = args[0]
        return true
      }
    })
    this.$validator.extend('cmin_value', {
      getMessage (field, args) {
        console.log(args);
        // vm.cRequiredMsg = args[0]
        return args[0]
      },
      validate (value, args) {
        // vm.cRequiredMsg = args[0]
        return true
      }
    })
    this.$validator.extend('cmax_value', {
      getMessage (field, args) {
        console.log(args);
        // vm.cRequiredMsg = args[0]
        return args[0]
      },
      validate (value, args) {
        // vm.cRequiredMsg = args[0]
        return true
      }
    })
    

    this.ccx = {
      custom: {}
    }
    this.prop.cLabelSize = this.prop.cLabelSize ? this.prop.cLabelSize : 4
    this.prop.cDecimal = this.prop.cDecimal ? parseInt(this.prop.cDecimal) : 2
    this.prop.cType = this.prop.cType ? this.prop.cType : "text"
    this.prop.cProtect = this.prop.cProtect ? this.prop.cProtect : false
    this.prop.cReadOnly = this.prop.cReadOnly ? this.prop.cReadOnly : false
    this.prop.NoPaste = this.prop.NoPaste ? this.prop.NoPaste : false
    this.prop.cCalculator = this.prop.cCalculator ? this.prop.cCalculator : false
    this.prop.cAllowMinus = this.prop.cAllowMinus ? this.prop.cAllowMinus : false
    this.prop.cVisible = this.prop.cVisible === undefined ? true : this.prop.cVisible
    this.prop.cStyle = this.prop.cStyle ? this.prop.cStyle : ""
    this.value = this.prop.cDefault ? this.prop.cDefault : ''

    if (this.prop.cType == 'decimal') {
      
      this.decimals = ""
      for (let i = 1; i <= this.prop.cDecimal; i++) {
        this.decimals += "0"

        if (i === this.prop.cDecimal) {
          this.isCurrency2()
        }
      }

      this.style = "text-align: right !important; " + this.prop.cStyle
      // this.style = { 'text-align': 'right' }
    } else {
      this.style = this.prop.cStyle
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
        else if(s[0] == 'required' || s[0] == 'cRequired') {
          this.isRequired = true
          if (s[0] == 'cRequired') {
            this.ccx.custom[this.prop.cName] = {
              'required' : s[1]
            }

            // this.$validator.localize('en', this.ccx)
          }
        }
        else if(s[0] == 'min_value' || s[0] == 'cmin_value') {
          // this.isRequired = true
          if (s[0] == 'cmin_value') {
            this.ccx.custom[this.prop.cName] = {
              'min_value' : s[1]
            }

            // this.$validator.localize('en', this.ccx)
          }
        }
        else if(s[0] == 'max_value' || s[0] == 'cmax_value') {
          // this.isRequired = true
          if (s[0] == 'cmax_value') {
            this.ccx.custom[this.prop.cName] = {
              'max_value' : s[1]
            }

            // this.$validator.localize('en', this.ccx)
          }
        }
      }

      this.$validator.localize('en', this.ccx)
    }
    else {
      this.prop.cValidate = false
    }

    this.$validator.extend('greater', {
      getMessage (field, args) {
        // return 'The ' + field + ' field must be 1 or more.'
        return 'The ' + field + ' field must more than ' + args + '.'
      },
      validate (value, args) {
        if ( vm.replaceAllString(value, ',', '', 'number') <= args ) {
          return false
        } else {
          return true
        }
      }
    })

    this.$validator.extend('min_value', {
      getMessage (field, args) {
        // return 'The ' + field + ' field must be 1 or more.'
        return 'The ' + field + ' field must be ' + args + ' or more.'
      },
      validate (value, args) {
        if ( parseFloat(vm.replaceAllString(value, ',', '', 'number')) < parseFloat(args) ) {
          return false
        } else {
          return true
        }
      }
    })

    this.$validator.extend('max_value', {
      getMessage (field, args) {
        // return 'The ' + field + ' field must be 1 or more.'
        return 'The ' + field + ' field must be ' + args + ' or less.'
      },
      validate (value, args) {
        if ( parseFloat(vm.replaceAllString(value, ',', '', 'number')) > parseFloat(args) ) {
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