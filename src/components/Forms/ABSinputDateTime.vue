<template>
  <span>
    <b-row v-show="prop.cVisible">
      <b-col :md="prop.cLabelSize" class="lbl-col-align">
        
        <template v-if="languageStatus">
          <label v-show="inputStatus=='new' || inputStatus=='edit'" class="text-field-form"><span v-if="isRequired" style="color:red;">*</span> {{ $t(prop.cName) == prop.cName ? prop.cLabel : $t(prop.cName)}} </label>
          <label v-show="inputStatus=='view'" class="lbl-view-form"><span v-if="isRequired" style="color:red;">*</span> {{ $t(prop.cName) == prop.cName ? prop.cLabel : $t(prop.cName)}} </label>
        </template>
        <template v-else>
          <label v-show="inputStatus=='new' || inputStatus=='edit'" class="text-field-form"><span v-if="isRequired" style="color:red;">*</span> {{ prop.cLabel }} </label>
          <label v-show="inputStatus=='view'" class="lbl-view-form"><span v-if="isRequired" style="color:red;">*</span> {{ prop.cLabel }} </label>
        </template>
        
      </b-col>

      <b-col>
        <span @click="showDatepicker(prop.cName)">
          <masked-input
            :placeholder="prop.cFormat"
            v-model="valueMasking"
            v-show="inputStatus!=='view'"
            v-bind:name="prop.cName"
            v-bind:data-vv-as="prop.cLabel"
            :disabled="inputStatus=='edit' && prop.cKey || prop.cProtect"
            :tabindex="prop.cOrder"
            mask="11/11/1111"
            :id="prop.cName"
            class="text-field-form form-control"
            :class="{'input': true, 'error-text-field': errors.has(prop.cParentForm + '.' + prop.cName)}"
            input-class="cDate"
            @blur.native="hideDatepicker(prop.cName)" />
            <!-- @input="handleInputMasking(arguments[1])" -->
        </span>
        
        <span v-show="errors.has(prop.cParentForm+'.'+prop.cName)"
          class="error-span">{{ errors.first(prop.cParentForm+'.'+prop.cName) }}
        </span>

        <label class="lbl-value-view-form notranslate" v-show="inputStatus=='view'">{{valueLabel}}</label>
        <datepicker
          v-validate="prop.cValidate"
          placeholder="Select Date" 
          v-show="inputStatus!=='view'"
          type="date"
          v-bind:name="prop.cName"
          v-bind:data-vv-as="prop.cLabel"
          v-bind:value="value"
          v-model="value"
          @input="handleInput"
          :disabled="inputStatus=='edit' && prop.cKey || prop.cProtect"
          :format="prop.cFormat"
          :ref="prop.cName"
          :id="prop.cParentForm + '.' + prop.cName"
          :highlighted="highlighted"
        />
      </b-col>

    <b-col md=1 style="text-align: right">
        <!-- <span>Time</span> -->
        <template v-if="languageStatus">
          <label v-show="inputStatus=='new' || inputStatus=='edit'" class="text-field-form"> {{ $t('Time')}} </label>
          <label v-show="inputStatus=='view'" class="lbl-view-form"> {{ $t('Time')}} </label>
        </template>
        <template v-else>
          <label v-show="inputStatus=='new' || inputStatus=='edit'" class="text-field-form"> Time </label>
          <label v-show="inputStatus=='view'" class="lbl-view-form"> Time </label>
        </template>
    </b-col>

    <b-col>
        <masked-input
        placeholder="HH:mm"
        v-validate="'invalidHour|invalidTime'"
        v-model="valueMaskingTime"
        v-show="inputStatus!=='view'"
        v-bind:name="prop.cName + 'Time'"
        v-bind:data-vv-as="prop.cLabel + 'Time'"
        :disabled="inputStatus=='edit' && prop.cKey || prop.cProtect"
        :tabindex="prop.cOrder"
        mask="11:11"
        :id="prop.cName + 'Time'"
        class="text-field-form form-control"
        @blur.native="addTime"
        :class="{'input': true, 'error-text-field': errors.has(prop.cParentForm + '.' + prop.cName + 'Time')}" />
        
        <span v-show="errors.has(prop.cParentForm+'.'+prop.cName + 'Time')"
          class="error-span">{{ errors.first(prop.cParentForm+'.'+prop.cName + 'Time') }}
        </span>

        <label class="lbl-value-view-form notranslate" v-show="inputStatus=='view'">{{valueLabelTime}}</label>
    </b-col>

      <b-col md="1">
        <label class="lbl-value-view-form">{{ prop.cLastLabel }}</label>
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
      cName: String,
      cLabel: String,
      cLabelSize: {type: Number, default: 5 },
      cOrder: Number,
      // cValue: String,
      cKey: Boolean,
      cProtect: Boolean,
      cFormat: String,
      cPageLevel: String,
      cTabIndex: String,
      cParentForm: String,
      cLastLabel: String
    },
    // cValue: String
    value: ''
  },
  data() {
    return {
      valueMasking: null,
      valueMaskingTime: '',
      isRequired: false,
      highlighted: {
        dates: [
          new Date()
        ],
      }
    }
  },
  watch: {
    value: function(newData, oldData) {
      if (this.value == '' || this.value == null) {
        this.valueMasking = ''
        this.valueMaskingTime = ''
      } else {
        // let tanggal = newData
        // if (newData.includes('/')) {
        //   var a = newData.split(' ')[0].split('/')
        //   var b = newData.split(' ')[1]
        //   tanggal = a[2] + '-' + a[1] + '-' + a[0] + ' ' + b
        //   this.value = tanggal
        // }
        // this.valueMasking = this.momentDateFormatting(new Date(tanggal), this.replaceAllString(this.prop.cFormat.toUpperCase(), '/', '-'))
        // this.valueMasking = this.replaceAllString(this.valueMasking, '-', '/')

        this.valueMasking = this.momentDateFormatting(new Date(newData), this.replaceAllString(this.prop.cFormat.toUpperCase(), '/', '-'))
        this.valueMasking = this.replaceAllString(this.valueMasking, '-', '/')

        this.valueMaskingTime = this.momentDateFormatting(newData, "HH:mm")

        this.value = this.momentDateFormatting(this.value, "YYYY-MM-DD HH:mm")
      }
      // this.value = this.momentDateFormatting(this.value, "YYYY-MM-DD HH:mm")
      this.$emit('input', this.value == null ? '' : this.value)
    }
  },
  computed: {
    inputStatus () {
      this.$validator.pause()
      this.$nextTick(() => {
        this.$validator.errors.clear(this.prop.cParentForm)
        this.$validator.resume()
      })
      
      if (this.$store.getters.getLevel == this.prop.cPageLevel && this.$store.getters.getTab == this.prop.cTabIndex){
        return this.$store.getters.getStatus
      }
      else {
        return 'view'
      }
    },

    valueLabel() {
      // return this.value?moment(new Date(this.value)).format('DD MMM YYYY') : ''
      return this.value?moment(new Date(this.value)).format('DD/MM/YYYY') : ''
    },

    valueLabelTime() {
      return this.value?moment(new Date(this.value)).format('HH:mm') : ''
    },
    
    languageStatus () {
      return this.$store.getters.languageStatus
    }
  },
  methods: {
    focus(DateTime = '') {
      this.$nextTick().then(() => {
        document.getElementById(this.prop.cName + DateTime).focus()
        this.showDatepicker(this.prop.cName + DateTime)
      })
    },
    handleInput() {
      var xx = this.valueMaskingTime != '' ? this.valueMaskingTime : "00:00"
      var dxx = moment(this.value).format('YYYY-MM-DD') + " " + xx
      this.value = this.momentDateFormatting(new Date(dxx), "YYYY-MM-DD HH:mm")
    },
    hideDatepicker(calendar) {
      // if contain _ on blur, return value before editing
      if (this.valueMasking == '__/__/____') {
        this.value = ''
      }
      else if (this.valueMasking.includes("_")) {
        // this.valueMasking = this.value
        if (this.value == null) {
          this.valueMasking = null
        } else {
          this.valueMasking = this.momentDateFormatting(new Date(this.value), this.replaceAllString(this.prop.cFormat.toUpperCase(), '/', '-'))
          this.valueMasking = this.replaceAllString(this.valueMasking, '-', '/')
        }
        
      } else {
        // if input type oke
        // console.log(this.valueMaskingTime)
        // this.value = this.momentDateFormat(this.valueMasking, this.prop.cFormat.toUpperCase())
        // this.value = moment(this.valueMasking, this.prop.cFormat.toUpperCase()).format("YYYY-MM-DD HH:mm")
        // console.log(this.valueMasking)
        // console.log(this.valueMaskingTime)
        // console.log(moment(this.valueMasking, this.prop.cFormat.toUpperCase()).format("YYYY-MM-DD"))
        var xx = this.valueMaskingTime != '' ? this.valueMaskingTime : "00:00"
        var dxx = moment(this.valueMasking, this.prop.cFormat.toUpperCase()).format("YYYY-MM-DD") + " " + xx
        this.value = this.momentDateFormatting(new Date(dxx), "YYYY-MM-DD HH:mm")
        // console.log(this.value)

        // if (this.value == 'Invalid date') {
        //   this.errors.clear()
        //   this.errors.add({
        //     field: this.prop.cParentForm + '.' + this.prop.cName,
        //     msg: 'Invalid Date'
        //   })
        // } else {
        //   this.errors.clear()
        // }
      }
      this.$refs[calendar].close()
    },
    addTime () {
      // console.log(moment(this.valueMasking, this.prop.cFormat.toUpperCase()).format("YYYY-MM-DD"))
      if (moment(this.valueMasking, this.prop.cFormat.toUpperCase()).format("YYYY-MM-DD") !== "Invalid date") {
        var xx = this.valueMaskingTime != '' ? this.valueMaskingTime : "00:00"
        if (xx == '__:__') {
          xx = '00:00'
        }
        var dxx = moment(this.valueMasking, this.prop.cFormat.toUpperCase()).format("YYYY-MM-DD") + " " + xx
        this.value = this.momentDateFormatting(new Date(dxx), "YYYY-MM-DD HH:mm")
        // console.log(this.value)
      }
    },
    showDatepicker(calendar) {
      
      if (this.prop.cProtect) return

      if (this.prop.cKey && this.inputStatus == 'edit') return

      if (this.$refs[calendar].isOpen) {
        return this.$refs[calendar].close()
      }                
      
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
    this.prop.cLabelSize = this.prop.cLabelSize || this.prop.cLabelSize=='' ? this.prop.cLabelSize : 4
    this.prop.cProtect = this.prop.cProtect ? this.prop.cProtect : false
    this.prop.cFormat = this.prop.cFormat ? this.prop.cFormat : "dd/MM/yyyy"
    
    this.prop.cVisible = this.prop.cVisible === undefined ? true : this.prop.cVisible
    
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

    if (this.value != null) {
      this.valueMasking = this.momentDateFormatting(new Date(this.value), this.replaceAllString(this.prop.cFormat.toUpperCase(), '/', '-'))
      this.valueMasking = this.replaceAllString(this.valueMasking, '-', '/')
    }

    if (this.value == '') {
      this.valueMasking = ''
    }

    this.$validator.extend('invalidDateC', {
      getMessage(field, val) {
        return 'Invalid Date'
      },
      validate(value, field) {
        // let startParts = self.startDate.split('-')
        // let endParts = value.split('-')
        // let start = new Date(startParts[2], startParts[1] -1, startParts[0]) // month is 0-based
        // let end = new Date(endParts[2], endParts[1] -1, endParts[0])

        // return end > start
        // alert(value)
        if (value == 'Invalid date') {
          // this.errors.clear()
          // this.errors.add({
          //   field: this.prop.cParentForm + '.' + this.prop.cName,
          //   msg: 'Invalid Date'
          // })
          return false
        } else {
          // this.errors.clear()
          return true
        }
      }
    })

    this.$validator.extend('invalidHour', {
      getMessage(field, val) {
        return 'Invalid Hour'
      },
      validate(value, field) {
        // let startParts = self.startDate.split('-')
        // let endParts = value.split('-')
        // let start = new Date(startParts[2], startParts[1] -1, startParts[0]) // month is 0-based
        // let end = new Date(endParts[2], endParts[1] -1, endParts[0])

        // return end > start
        // alert(value)
        var H = value.substring(0,2)
        // console.log(H)
        // var M = value.substring(3,2)

        if (H > 23) {
          // this.errors.clear()
          // this.errors.add({
          //   field: this.prop.cParentForm + '.' + this.prop.cName,
          //   msg: 'Invalid Date'
          // })
          return false
        } else {
            // var M = value.substring(3,5)
            // console.log(M)
            // if (M > 59) {
            //     return false
            // }
            // else {
                return true
            // }
          // this.errors.clear()
        }
      }
    })

    this.$validator.extend('invalidTime', {
      getMessage(field, val) {
        return 'Invalid Time'
      },
      validate(value, field) {
        // let startParts = self.startDate.split('-')
        // let endParts = value.split('-')
        // let start = new Date(startParts[2], startParts[1] -1, startParts[0]) // month is 0-based
        // let end = new Date(endParts[2], endParts[1] -1, endParts[0])

        // return end > start
        // alert(value)
        var M = value.substring(3,5)
        // console.log(H)
        // var M = value.substring(3,2)

        if (M > 59) {
          // this.errors.clear()
          // this.errors.add({
          //   field: this.prop.cParentForm + '.' + this.prop.cName,
          //   msg: 'Invalid Date'
          // })
          return false
        } else {
            // var M = value.substring(3,5)
            // console.log(M)
            // if (M > 59) {
            //     return false
            // }
            // else {
                return true
            // }
          // this.errors.clear()
        }
      }
    })

    if (this.prop.cValidate == undefined || this.prop.cValidate == null || this.prop.cValidate == '') {
      this.prop.cValidate = 'invalidDateC'
    } else {
      this.prop.cValidate += '|invalidDateC'
    }
  },
  // updated: function () {
  //   if (this.value == '' || this.value == null) {
  //     this.valueMasking = ''
  //     this.$emit('input', '')
  //   }
  // },
  mounted: function () {
    var x = document.getElementById(this.prop.cParentForm + '.' + this.prop.cName)
    x.style.visibility = 'hidden'
  },
}
</script>

<style scoped>
  /* .cDate {
    width:100%
  } */
  /* .vdp-datepicker__calendar{
    top: 0px !important;
    width: 255px !important;
  } */

  /* .vdp-datepicker__calendar .cell{ */
    /* display: inline-table !important; */
   /* height: 25px !important; */
    /* line-height: 0px !important; */

    /* display: inline-block;
    padding: 0px 5px;
    width: 14.285714%; */    
    /* text-align: center;
    vertical-align: middle;
    border: 1px solid transparent; */
/* } */
</style>
