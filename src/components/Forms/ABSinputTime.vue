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

      <b-col md="4">
        <masked-input
        :placeholder="prop.cFormat"
        v-validate="'invalidHour|invalidTime'"
        v-model="valueFrom"
        v-show="inputStatus!=='view'"
        v-bind:name="prop.cName + 'TimeFrom'"
        v-bind:data-vv-as="prop.cLabel + 'TimeFrom'"
        :disabled="inputStatus=='edit' && prop.cKey || prop.cProtect"
        :tabindex="prop.cOrder"
        mask="11:11"
        class="text-field-form form-control"
        :class="{'input': true, 'error-text-field': errors.has(prop.cParentForm + '.' + prop.cName + 'TimeFrom')}"
        @blur.native="timeFrom" />
        <!-- @blur.native="addTime" -->
        
        <span v-show="errors.has(prop.cParentForm+'.'+prop.cName + 'TimeFrom')"
          class="error-span">{{ errors.first(prop.cParentForm+'.'+prop.cName + 'TimeFrom') }}
        </span>

        <label class="lbl-value-view-form notranslate" v-show="inputStatus=='view'">{{valueFrom}}</label>
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
      cVisible: Boolean,
      cKey: Boolean,
      cProtect: Boolean,
      cFormat: String,
      cPageLevel: String,
      cTabIndex: String,
      cParentForm: String
    },
    valueFrom: '',
    valueTo: ''
  },
  data() {
    return {
      isRequired: false,
    }
  },
  watch: {
  },
  computed: {
    inputStatus () {
      this.$validator.pause()
      this.$nextTick(() => {
        this.$validator.errors.clear(this.prop.cParentForm)
        this.$validator.resume()
      })
      
      if (this.$store.getters.getLevel == this.prop.cPageLevel && this.$store.getters.getTab == this.prop.cTabIndex) {
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
    timeFrom () {
      this.$emit('from', this.valueFrom == null ? '' : this.valueFrom)
    },
    handleInput() {
    },
    addTime () {
    },
  },
  created: function() {
    this.prop.cLabelSize = this.prop.cLabelSize || this.prop.cLabelSize=='' ? this.prop.cLabelSize : 4
    this.prop.cProtect = this.prop.cProtect ? this.prop.cProtect : false
    this.prop.cFormat = this.prop.cFormat ? this.prop.cFormat : "HH:mm"
    
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
    this.$validator.extend('invalidHour', {
      getMessage(field, val) {
        return 'Invalid Hour'
      },
      validate(value, field) {
        var H = value.substring(0,2)
        if (H > 23 || H.includes('_')) {
          return false
        } else {
                return true
        }
      }
    })

    this.$validator.extend('invalidTime', {
      getMessage(field, val) {
        return 'Invalid Time'
      },
      validate(value, field) {
        var M = value.substring(3,5)
        if (M > 59 || M.includes('_')) {
          return false
        } else {
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
  mounted: function () {
  },
}
</script>
