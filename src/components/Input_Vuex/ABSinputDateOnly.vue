<template>
  <span>
    <template v-if="prop.cVisible && prop.cHideRowColumnCSS">
      <template v-if="value == prop.cLabelValue">
        <!-- <label class="lbl-value-view-form notranslate">{{prop.cLabelValue}}</label> -->
        {{prop.cLabelValue}}
      </template>
      <template v-else>
        <span @click="showDatepicker(prop.cName)">
          <masked-input
            :placeholder="prop.cFormat.toLowerCase()"
            v-model="valueMasking"
            v-show="inputStatus!=='view'"
            v-bind:name="prop.cName"
            v-bind:data-vv-as="prop.cLabel"
            :disabled="inputStatus=='edit' && prop.cKey || prop.cProtect || prop.cRowDisable.indexOf(rowLine) != -1"
            :tabindex="prop.cOrder"
            mask="11/11/1111"
            class="text-field-form form-control"
            :class="{'input': true, 'error-text-field': errors.has(prop.cParentForm + '.' + prop.cName)}"
            input-class="cDate"
            @blur.native="hideDatepicker(prop.cName)" />
            <!-- @input="handleInputMasking(arguments[1])" -->
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
        :disabled="inputStatus=='edit' && prop.cKey || prop.cProtect || prop.cRowDisable.indexOf(rowLine) != -1"
        :format="prop.cFormat"
        :ref="prop.cName"
        :id="prop.cParentForm + '.' + prop.cName"
        :highlighted="highlighted"
      />
      </template>
    </template>
    <template v-else-if="prop.cVisible && prop.cIsAlwaysShow">
      <span @click="showDatepicker(prop.cName)">
        <masked-input
          :placeholder="prop.cFormat.toLowerCase()"
          v-model="valueMasking"
          v-show="inputStatus!=='view'"
          v-bind:name="prop.cName"
          v-bind:data-vv-as="prop.cLabel"
          :disabled="inputStatus=='edit' && prop.cKey || prop.cProtect || prop.cRowDisable.indexOf(rowLine) != -1"
          :tabindex="prop.cOrder"
          mask="11/11/1111"
          class="text-field-form form-control"
          :class="{'input': true, 'error-text-field': errors.has(prop.cParentForm + '.' + prop.cName)}"
          input-class="cDate"
          @blur.native="hideDatepicker(prop.cName)" />
      </span>
        
      <span v-show="errors.has(prop.cParentForm+'.'+prop.cName)"
        class="error-span">{{ errors.first(prop.cParentForm+'.'+prop.cName) }}
      </span>

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
        :disabled="inputStatus=='edit' && prop.cKey || prop.cProtect || prop.cRowDisable.indexOf(rowLine) != -1"
        :format="prop.cFormat"
        :ref="prop.cName"
        :id="prop.cParentForm + '.' + prop.cName"
        :highlighted="highlighted"
      />
    </template>
    <b-row v-else-if="prop.cVisible">
      <!-- <b-col :md="prop.cLabelSize" class="lbl-col-align">
        
        <template v-if="languageStatus">
          <label v-show="inputStatus=='new' || inputStatus=='edit'" class="lbl-text-form"><span v-if="isRequired" style="color:red;">*</span> {{ $t(prop.cName) == prop.cName ? prop.cLabel : $t(prop.cName)}} </label>
          <label v-show="inputStatus=='view'" class="lbl-view-form"><span v-if="isRequired" style="color:red;">*</span> {{ $t(prop.cName) == prop.cName ? prop.cLabel : $t(prop.cName)}} </label>
        </template>
        <template v-else>
          <label v-show="inputStatus=='new' || inputStatus=='edit'" class="lbl-text-form"><span v-if="isRequired" style="color:red;">*</span> {{ prop.cLabel }} </label>
          <label v-show="inputStatus=='view'" class="lbl-view-form"><span v-if="isRequired" style="color:red;">*</span> {{ prop.cLabel }} </label>
        </template>
        
      </b-col> -->

      <b-col md="6" :offset="prop.cLabelSize" style="margin: 0px;">
        <span @click="showDatepicker(prop.cName)">
          <masked-input
            :placeholder="prop.cFormat.toLowerCase()"
            v-model="valueMasking"
            v-show="inputStatus!=='view'"
            v-bind:name="prop.cName"
            v-bind:data-vv-as="prop.cLabel"
            :disabled="inputStatus=='edit' && prop.cKey || prop.cProtect || prop.cRowDisable.indexOf(rowLine) != -1"
            :tabindex="prop.cOrder"
            mask="11/11/1111"
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
          :disabled="inputStatus=='edit' && prop.cKey || prop.cProtect || prop.cRowDisable.indexOf(rowLine) != -1"
          :format="prop.cFormat"
          :ref="prop.cName"
          :id="prop.cParentForm + '.' + prop.cName"
          :highlighted="highlighted"
        />
      </b-col>
      <b-col md="1">
        <!-- <datepicker
          placeholder="Select Date" 
          v-show="inputStatus!=='view'"
          v-validate="prop.cValidate"
          type="date"
          v-bind:name="prop.cName"
          v-bind:data-vv-as="prop.cNameError"
          v-bind:value="value"
          v-model="value"
          @input="handleInput"
          :disabled="inputStatus=='edit' && prop.cKey || prop.cProtect"
          :format="prop.cFormat"
          :ref="prop.cName"
          :id="prop.cParentForm + '.' + prop.cName"
        /> -->
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
      cVisible: Boolean,
      cOrder: Number,
      // cValue: String,
      cKey: Boolean,
      cProtect: Boolean,
      cFormat: String,
      cPageLevel: String,
      cTabIndex: String,
      cParentForm: String,
      cIsAlwaysShow: Boolean,
      cHideRowColumnCSS: Boolean,
      cLabelValue: String,
      cRowDisable: {type: Array, default: []}
    },
    rowLine: {type: Number, default: 0},
    // cValue: String
    value: ''
  },
  data() {
    return {
      valueMasking: null,
      isRequired: false,
      highlighted: {
        // to: new Date(2016, 0, 5), // Highlight all dates up to specific date
        // from: new Date(2016, 0, 26), // Highlight all dates after specific date
        // days: [6, 0], // Highlight Saturday's and Sunday's
        // daysOfMonth: [15, 20, 31], // Highlight 15th, 20th and 31st of each month
        dates: [ // Highlight an array of dates
          new Date()
          // new Date(2016, 9, 16),
          // new Date(2016, 9, 17),
          // new Date(2016, 9, 18)
        ],
        // a custom function that returns true of the date is highlighted
        // this can be used for wiring you own logic to highlight a date if none
        // of the above conditions serve your purpose
        // this function should accept a date and return true if is highlighted
        // customPredictor: function(date) {
        //   // highlights the date if it is a multiple of 4
        //   if(date.getDate() % 4 == 0){
        //     return true
        //   }
        // },
        // includeDisabled: true // Highlight disabled dates
      }
    }
  },
  watch: {
    value: function(newData, oldData) {
      if (this.value == '' || this.value == null) {
        this.value=''
        this.valueMasking = ''
      } else {
        // let tanggal = newData
        // if (newData.includes(' ')) {
        //   var a = newData.split(' ')[0].split('/')
        //   tanggal = a[2] + '-' + a[1] + '-' + a[0]
        //   this.value = tanggal
        // }
        // this.valueMasking = this.momentDateFormatting(new Date(tanggal), this.replaceAllString(this.prop.cFormat.toUpperCase(), '/', '-'))
        // this.valueMasking = this.replaceAllString(this.valueMasking, '-', '/')

        this.valueMasking = this.momentDateFormatting(new Date(newData), this.replaceAllString(this.prop.cFormat.toUpperCase(), '/', '-'))
        this.valueMasking = this.replaceAllString(this.valueMasking, '-', '/')
      }
      // this.$emit('input', this.value)
      this.$emit('input', this.value == null ? '' : this.value)
      // if (this.inputStatus == 'new' && this.valueMasking == 'Invalid date') {
      //   this.valueMasking = ''
      // }
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
    
    languageStatus () {
      return this.$store.getters.languageStatus
    }
  },
  methods: {
    focus() {
      this.$nextTick().then(() => {
        document.getElementById(this.prop.cName).focus()
        this.showDatepicker(this.prop.cName)
      })
    },
    handleInput() {
      this.value = this.momentDate(new Date(this.value))
    },
    eventBusListener (action, data) {
      // this.inputStatus.isEdit = false
      this.inputStatus.isNew = data
      if(action == 'new'){
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
        this.value = this.momentDateFormat(this.valueMasking, this.prop.cFormat.toUpperCase())

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
    this.prop.cRowDisable = this.prop.cRowDisable === undefined ? [] : this.prop.cRowDisable
    this.prop.cHideRowColumnCSS = this.prop.cHideRowColumnCSS ? this.prop.cHideRowColumnCSS : false
    this.prop.cLabelSize = this.prop.cLabelSize || this.prop.cLabelSize=='' ? this.prop.cLabelSize : 0
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
      // 2019-01-15T00:00:00 before
      // 15/01/2019 0:00:00 after
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
    if (this.prop.cIsAlwaysShow == undefined) {
      this.prop.cIsAlwaysShow = false
    } else if (this.prop.cIsAlwaysShow == "") {
      this.prop.cIsAlwaysShow = false
    }

    var x = document.getElementById(this.prop.cParentForm + '.' + this.prop.cName)
    if (x) {
      x.style.visibility = 'hidden'
    }
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
