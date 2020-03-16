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
        <span @click="showDatepickerFrom(prop.cName + 'From')">
          <masked-input
            :placeholder="prop.cFormat.toLowerCase()"
            v-model="valueMaskingFrom"
            v-show="inputStatus!=='view'"
            v-bind:name="prop.cName + 'From'"
            v-bind:data-vv-as="prop.cLabel + ' From'"
            :disabled="inputStatus=='edit' && prop.cKey || prop.cProtect || prop.cProtectFrom"
            :tabindex="prop.cOrder"
            :id="prop.cName + 'From'"
            mask="11/11/1111"
            class="text-field-form form-control"
            :class="{'input': true, 'error-text-field': errors.has(prop.cParentForm + '.' + prop.cName + 'From')}"
            input-class="cDate"
            @blur.native="hideDatepickerFrom(prop.cName + 'From')" />
        </span>

        <span v-show="inputStatus!=='view' && errors.has(prop.cParentForm + '.' + prop.cName + 'From')"
          class="error-span">{{ errors.first(prop.cParentForm + '.' + prop.cName + 'From') }}
        </span>

        <label v-show="inputStatus=='view'" class="lbl-value-view-form notranslate">{{valueLabelFrom}}</label>
        <datepicker
          v-validate="prop.cValidate"
          placeholder="Select Date" 
          v-show="inputStatus!=='view'"
          type="date"
          v-bind:name="prop.cName + 'From'"
          v-bind:data-vv-as="prop.cLabel + ' From'"
          v-bind:value="valueFrom"
          v-model="valueFrom"
          @input="handleInputFrom"
          :disabled="inputStatus=='edit' && prop.cKey || prop.cProtect || prop.cProtectFrom"
          :ref="prop.cName + 'From'"
          :id="prop.cParentForm + '.' + prop.cName + 'From'"
          :highlighted="highlighted"
        />
          <!-- :format="prop.cFormat" -->
      </b-col>

      <b-col md=1 style="text-align: center">
        <span>-</span>
      </b-col>
      
      <b-col>
        <span @click="showDatepickerTo(prop.cName + 'To')">
          <masked-input
            :placeholder="prop.cFormat.toLowerCase()"
            v-model="valueMaskingTo"
            v-show="inputStatus!=='view'"
            v-bind:name="prop.cName + 'To'"
            v-bind:data-vv-as="prop.cLabel + ' To'"
            :disabled="inputStatus=='edit' && prop.cKey || prop.cProtect || prop.cProtectTo"
            :tabindex="prop.cOrder + 1"
            mask="11/11/1111"
            :id="prop.cName + 'To'"
            class="text-field-form form-control"
            :class="{'input': true, 'error-text-field': errors.has(prop.cParentForm + '.' + prop.cName + 'From')}"
            input-class="cDate"
            @blur.native="hideDatepickerTo(prop.cName + 'To')" />
        </span>

        <span v-show="inputStatus!=='view' && errors.has(prop.cParentForm + '.' + prop.cName + 'To')"
          class="error-span">{{ errors.first(prop.cParentForm + '.' + prop.cName + 'To') }}
        </span>

        <label v-show="inputStatus=='view'" class="lbl-value-view-form notranslate">{{valueLabelTo}}</label>
        <!-- {{prop.cFormat}} -->
          <!-- v-validate="prop.cValidate + '|after:' + prop.cName + 'From'" -->
          <!-- v-validate="prop.cValidate + '|invalidDateRange:$' + prop.cName + 'From'" -->
        <datepicker
          v-validate="prop.cValidateTo + '|invalidDateRange:' + valueFrom"
          placeholder="Select Date" 
          v-show="inputStatus!=='view'"
          type="date"
          v-bind:name="prop.cName + 'To'"
          v-bind:data-vv-as="prop.cLabel + ' To'"
          v-bind:value="valueTo"
          v-model="valueTo"
          @input="handleInputTo"
          :disabled="inputStatus=='edit' && prop.cKey || prop.cProtect || prop.cProtectTo"
          :ref="prop.cName + 'To'"
          :id="prop.cParentForm + '.' + prop.cName + 'To'"
          :highlighted="highlighted"
        />
          <!-- :format="prop.cFormat" -->
      </b-col>

      <b-col md="1">
        <!-- {{prop.cValidate + '|after:' + prop.cName + 'From'}} -->
      </b-col>
    </b-row>
    
  </span>
</template>

<script>
import Datepicker from 'vuejs-datepicker'
import * as lang from "vuejs-datepicker/src/locale"
import moment from 'moment'

export default {
  components: { Datepicker },
  props: {
    prop: {
      cValidate: String,
      cValidateTo: String,
      cName: String,
      cLabel: String,
      cLabelSize: {type: Number, default: 5 },
      cOrder: Number,
      // cValue: String,
      cKey: Boolean,
      cProtect: Boolean,
      cProtectFrom: Boolean,
      cProtectTo: Boolean,
      cFormat: String,
      cPageLevel: String,
      cTabIndex: String,
      cParentForm: String
    },
    valueFrom: String,
    valueTo: String
    // from: String,
    // to: String
  },
  data() {
    return {
      valueMaskingFrom: null,
      valueMaskingTo: null,
      isRequired: false,
      highlighted: {
        dates: [
          new Date()
        ],
      },
      cLabel2: ''
      // value: null
      // valueFrom: '',
      // valueTo: ''
    }
  },
  watch: {
    valueFrom: function(newData, oldData) {
      if (this.valueFrom == '' || this.valueFrom == null) {
        this.valueMaskingFrom = ''
      } else {
        // let tanggal = newData
        // if (newData.includes(' ')) {
        //   var a = newData.split(' ')[0].split('/')
        //   tanggal = a[2] + '-' + a[1] + '-' + a[0]
        //   this.valueFrom = tanggal
        // }
        // this.valueMaskingFrom = this.momentDateFormatting(new Date(tanggal), this.replaceAllString(this.prop.cFormat.toUpperCase(), '/', '-'))
        // this.valueMaskingFrom = this.replaceAllString(this.valueMaskingFrom, '-', '/')

        this.valueMaskingFrom = this.momentDateFormatting(new Date(newData), this.replaceAllString(this.prop.cFormat.toUpperCase(), '/', '-'))
        this.valueMaskingFrom = this.replaceAllString(this.valueMaskingFrom, '-', '/')

      }
      // this.$emit('from', this.valueFrom)
      this.$emit('input', this.valueFrom == null ? '' : this.valueFrom, 'from')
      this.$emit('from', this.valueFrom == null ? '' : this.valueFrom, this.prop.cName)
      // this.$emit('input', this.valueFrom)
      // if (this.inputStatus == 'new' && this.valueMaskingFrom == 'Invalid date') {
      //   this.valueMaskingFrom = ''
      // }
      // if (this.momentDateBetween(this.valueFrom, this.valueTo)) {
      //   // this.$validator.errors.clear()
      // } else {
      //   // this.$validator.errors.clear()
      //   // this.$validator.errors.add({
      //   //   field: this.prop.cParentForm + '.' + this.prop.cName + 'From',
      //   //   msg: 'Invalid Date Range'
      //   // })
      // }
    },
    valueTo: function(newData, oldData) {
      if (this.valueTo == '' || this.valueTo == null) {
        this.valueMaskingTo = ''
      } else {
        // let tanggal = newData
        // if (newData.includes(' ')) {
        //   var a = newData.split(' ')[0].split('/')
        //   tanggal = a[2] + '-' + a[1] + '-' + a[0]
        //   this.valueTo = tanggal
        // }
        // this.valueMaskingTo = this.momentDateFormatting(new Date(tanggal), this.replaceAllString(this.prop.cFormat.toUpperCase(), '/', '-'))
        // this.valueMaskingTo = this.replaceAllString(this.valueMaskingTo, '-', '/')

        this.valueMaskingTo = this.momentDateFormatting(new Date(newData), this.replaceAllString(this.prop.cFormat.toUpperCase(), '/', '-'))
        this.valueMaskingTo = this.replaceAllString(this.valueMaskingTo, '-', '/')
      }
      // this.$emit('to', this.valueTo)
      this.$emit('input', this.valueTo == null ? '' : this.valueTo, 'to')
      this.$emit('to', this.valueTo == null ? '' : this.valueTo, this.prop.cName)
      // this.$emit('input', this.valueTo)
      // if (this.inputStatus == 'new' && this.valueMaskingTo == 'Invalid date') {
      //   this.valueMaskingTo = ''
      // }
      // if (this.momentDateBetween(this.valueFrom, this.valueTo)) {
      //   // this.$validator.errors.clear()
      // } else {
      //   // this.$validator.errors.clear()
      //   // this.$validator.errors.add({
      //   //   field: this.prop.cParentForm + '.' + this.prop.cName + 'To',
      //   //   msg: 'Invalid Date Range'
      //   // })
      // }
    },
  },
  computed: {
    inputStatus () {
      this.$validator.pause()
      this.$nextTick(() => {
        this.$validator.errors.clear(this.prop.cParentForm)
        this.$validator.resume()
      })
      // return this.$store.getters.getStatus
      if (this.$store.getters.getLevel == this.prop.cPageLevel && this.$store.getters.getTab == this.prop.cTabIndex){
        return this.$store.getters.getStatus
      }
      else {
        return 'view'
      }
    },
    // inputStatus () {
    //   return 'new'
    // },

    valueLabelFrom() {
      // return this.valueFrom?moment(new Date(this.valueFrom)).format('DD MMM YYYY') : ''
      return this.valueFrom?moment(new Date(this.valueFrom)).format('DD/MM/YYYY') : ''
    },
    valueLabelTo() {
      // return this.valueTo?moment(new Date(this.valueTo)).format('DD MMM YYYY') : ''
      return this.valueTo?moment(new Date(this.valueTo)).format('DD/MM/YYYY') : ''
    },
    languageStatus () {
      return this.$store.getters.languageStatus
    }
  },
  methods: {
    focus(FromTo = 'From') {
      this.$nextTick().then(() => {
        document.getElementById(this.prop.cName + FromTo).focus()
        this.showDatepicker(this.prop.cName + FromTo)
      })
    },
    handleInputFrom() {
      this.valueFrom = this.momentDate(new Date(this.valueFrom))
      // this.$forceUpdate()
    },
    handleInputTo() {
      this.valueTo = this.momentDate(new Date(this.valueTo))
      // this.$forceUpdate()
    },
    hideDatepickerFrom(calendar) {
      // if contain _ on blur, return value before editing
      if (this.valueMaskingFrom == '__/__/____') {
        this.valueFrom = ''
      } else if (this.valueMaskingFrom.includes("_")) {
        if (this.valueFrom == null) {
          this.valueMaskingFrom = null
        } else {
          this.valueMaskingFrom = this.momentDateFormatting(new Date(this.valueFrom), this.replaceAllString(this.prop.cFormat.toUpperCase(), '/', '-'))
          this.valueMaskingFrom = this.replaceAllString(this.valueMaskingFrom, '-', '/')
        }
        
      } else if (this.valueMaskingFrom == '') {
        this.valueFrom = ''
      } else {
        // if input type oke
        this.valueFrom = this.momentDateFormat(this.valueMaskingFrom, this.prop.cFormat.toUpperCase())

        // if (this.valueFrom == 'Invalid date') {
        //   this.$validator.errors.clear()
        //   this.$validator.errors.add({
        //     field: this.prop.cParentForm + '.' + this.prop.cName + 'From',
        //     msg: 'Invalid Date'
        //   })
        // } else {
        //   for (var i = 0; i < this.$validator.errors.items.length; i++) {
        //     var err = this.$validator.errors.items[i].msg
        //     if (err == 'Invalid Date') {
        //       this.$validator.errors.clear()
        //     }
        //   }
        // }
      }
      this.$emit('fromBlur', this.valueFrom == null ? '' : this.valueFrom)
      this.$refs[calendar].close()
    },
    hideDatepickerTo(calendar) {
      // if contain _ on blur, return value before editing
      if (this.valueMaskingTo == '__/__/____') {
        this.valueTo = ''
      } else if (this.valueMaskingTo.includes("_")) {
        if (this.valueTo == null) {
          this.valueMaskingTo = null
        } else {
          this.valueMaskingTo = this.momentDateFormatting(new Date(this.valueTo), this.replaceAllString(this.prop.cFormat.toUpperCase(), '/', '-'))
          this.valueMaskingTo = this.replaceAllString(this.valueMaskingTo, '-', '/')
        }
        
      } else if (this.valueMaskingTo == '') {
        this.valueTo = ''
      } else {
        // if input type oke
        this.valueTo = this.momentDateFormat(this.valueMaskingTo, this.prop.cFormat.toUpperCase())

        // if (this.valueTo == 'Invalid date') {
        //   this.$validator.errors.clear()
        //   this.$validator.errors.add({
        //     field: this.prop.cParentForm + '.' + this.prop.cName + 'To',
        //     msg: 'Invalid Date'
        //   })
        // } else {
        //   for (var i = 0; i < this.$validator.errors.items.length; i++) {
        //     var err = this.$validator.errors.items[i].msg
        //     if (err == 'Invalid Date') {
        //       this.$validator.errors.clear()
        //     }
        //   }
        // }
      }
      this.$emit('toBlur', this.valueTo == null ? '' : this.valueTo)
      this.$refs[calendar].close()
    },
    showDatepickerFrom(calendar) {
      if (this.prop.cProtect) return
      if (this.prop.cProtectFrom) return

      if (this.prop.cKey && this.inputStatus == 'edit') return

      if (this.$refs[calendar].isOpen) {
        return this.$refs[calendar].close()
      }

      // if (this.$refs[prop.cName + 'To'].isOpen) {
      //   return this.$refs[prop.cName + 'To'].close()
      // }
      
      if (!this.$refs[calendar].allowedToShowView('day')) return false
        this.$refs[calendar].close()
        this.$refs[calendar].showDayView = true
        if (!this.$refs[calendar].isInline) {
          setTimeout(() => {
            document.addEventListener('click', this.$refs[calendar].clickOutside, false)
          }, 100)
        }
    },
    showDatepickerTo(calendar) {
      if (this.prop.cProtect) return
      if (this.prop.cProtectTo) return

      if (this.prop.cKey && this.inputStatus == 'edit') return

      if (this.$refs[calendar].isOpen) {
        return this.$refs[calendar].close()
      }

      // if (this.$refs[prop.cName + 'From'].isOpen) {
      //   return this.$refs[prop.cName + 'From'].close()
      // }
      
      if (!this.$refs[calendar].allowedToShowView('day')) return false
        this.$refs[calendar].close()
        this.$refs[calendar].showDayView = true
        if (!this.$refs[calendar].isInline) {
          setTimeout(() => {
            document.addEventListener('click', this.$refs[calendar].clickOutside, false)
          }, 100)
        }
    },
  },
  created: function() {
    var vm = this
    this.prop.cLabelSize = this.prop.cLabelSize || this.prop.cLabelSize=='' ? this.prop.cLabelSize : 4
    this.prop.cProtect = this.prop.cProtect ? this.prop.cProtect : false
    this.prop.cProtectFrom = this.prop.cProtectFrom ? this.prop.cProtectFrom : false
    this.prop.cProtectTo = this.prop.cProtectTo ? this.prop.cProtectTo : false
    this.prop.cFormat = this.prop.cFormat ? this.prop.cFormat : "dd/MM/yyyy"
    
    this.prop.cVisible = this.prop.cVisible === undefined ? true : this.prop.cVisible

    this.cLabel2 = this.replaceAllString(this.replaceAllString(this.prop.cLabel, ' From', '', 'string'), ' To', '', 'string')

    this.prop.cValidateTo = this.prop.cValidateTo ? this.prop.cValidateTo : this.prop.cValidate
    
    // get max, for maxlength
    if (this.prop.cValidate !== undefined && this.prop.cValidate !== null && this.prop.cValidate !== ''){
      var str_array = this.prop.cValidate.split('|')
      for (var i = 0; i < str_array.length; i++) {
        var s = str_array[i].split(':')
        if(s[0] == 'required') {
          this.isRequired = true
        }
      }
    }

    if (this.valueFrom != null) {
      this.valueMaskingFrom = this.momentDateFormatting(new Date(this.valueFrom), this.replaceAllString(this.prop.cFormat.toUpperCase(), '/', '-'))
      this.valueMaskingFrom = this.replaceAllString(this.valueMaskingFrom, '-', '/')
    }

    if (this.valueTo != null) {
      this.valueMaskingTo = this.momentDateFormatting(new Date(this.valueTo), this.replaceAllString(this.prop.cFormat.toUpperCase(), '/', '-'))
      this.valueMaskingTo = this.replaceAllString(this.valueMaskingTo, '-', '/')
    }
    
    if (this.valueFrom == '') {
      this.valueMaskingFrom = ''
    }

    if (this.valueTo == '') {
      this.valueMaskingTo = ''
    }

    this.$validator.extend('invalidDateC', {
      getMessage (field, val) {
        return 'Invalid Date'
      },
      validate (value, field) {
        if (value == 'Invalid date') {
          return false
        } else {
          return true
        }
      }
    })

    // this.$validator.extend('invalidDateRange', {
    //   getMessage (field, val) {
    //     return 'Invalid Date Range'
    //   },
    //   validate (value, { min, max }) {
    //     if (this.momentDateBetween(this.valueFrom, this.valueTo)) {
    //       return true
    //     } else {
    //       return false
    //     }
    //   }
    // })

    const extendOptions = { hasTarget: true }
    // let self = this
    this.$validator.extend('invalidDateRange', {
      getMessage(field, val) {
        // return 'Must be after than Start Date'
        return 'End date must be higher than start date'
      },
      // validate(value, field) {
      validate(value, field) {
        // let startParts = self.valueFrom.split('-')

        let startParts = field[0].split('T')[0].split('-')
        let endParts = value.split('T')[0].split('-')
        // let startParts = field[0].split(' ')[0].split('-')
        // let endParts = value.split(' ')[0].split('-')

        // let start = new Date(startParts[2], startParts[1] -1, startParts[0]) // month is 0-based
        // let end = new Date(endParts[2], endParts[1] -1, endParts[0])
        let start = startParts[0] + startParts[1] + startParts[2] // month is 0-based
        let end = endParts[0] + endParts[1] + endParts[2]
        return end >= start
      }
    })
    // extendOptions

    this.$validator.extend('min_date', {
      getMessage(field, val) {
        // return 'Must be after than Start Date'
        return field + ' could not be less than ' + val
      },
      // validate(value, field) {
      validate(value, field) {
        return vm.momentDateFormatting(value, 'YYYY-MM-DD') >= vm.momentDateFormatting(field[0], 'YYYY-MM-DD')
      }
    })

    this.$validator.extend('max_date', {
      getMessage(field, val) {
        // return 'Must be after than Start Date'
        return field + ' could not be more than ' + val
      },
      // validate(value, field) {
      validate(value, field) {
        // console.log(value, field);
        return vm.momentDateFormatting(value, 'YYYY-MM-DD') <= vm.momentDateFormatting(field[0], 'YYYY-MM-DD')
      }
    })

    if (this.prop.cValidate == undefined || this.prop.cValidate == null || this.prop.cValidate == '') {
      this.prop.cValidate = 'invalidDateC'//|invalidDateRange:' + this.valueFrom + ',' + this.valueTo
    } else {
      this.prop.cValidate += '|invalidDateC'//|invalidDateRange:' + this.valueFrom + ',' + this.valueTo
    }
  },
  // updated: function () {
  //   if (this.valueFrom == '' || this.valueFrom == null) {
  //     this.valueMaskingFrom = ''
  //     this.$emit('from', '')
  //   }
  //   if (this.valueTo == '' || this.valueTo == null) {
  //     this.valueMaskingTo = ''
  //     this.$emit('to', '')
  //   }
  // },
  mounted: function () {
    var xFrom = document.getElementById(this.prop.cParentForm + '.' + this.prop.cName + 'From')
    xFrom.style.visibility = 'hidden'

    var xTo = document.getElementById(this.prop.cParentForm + '.' + this.prop.cName + 'To')
    xTo.style.visibility = 'hidden'
  },
}
</script>

<style>
  /* .cDate {
    width:100%
  } */
</style>
