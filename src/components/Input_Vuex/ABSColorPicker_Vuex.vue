<template>
  <span>
    <!-- <b-row v-if="prop.cVisible && prop.cIsAlwaysShow">
      <b-col :md="prop.cLabelSize" class="lbl-col-align">
        <template v-if="languageStatus">
          <label class="text-field-form"><span v-if="isRequired" style="color:red;">*</span> {{ $t(prop.cName) == prop.cName ? prop.cLabel : $t(prop.cName)}} </label>
        </template>
        <template v-else>
          <label class="text-field-form"><span v-if="isRequired" style="color:red;">*</span> {{ prop.cLabel }} </label>
        </template>
      </b-col>
      <b-col :md="prop.cType=='decimal'||prop.cType=='numeric'?4:''">
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
          @paste.native="onPaste"
        />

        <span v-show="errors.has(prop.cParentForm+'.'+prop.cName)"
          class="error-span">{{ errors.first(prop.cParentForm+'.'+prop.cName) }}
        </span>
      </b-col>
      <b-col md="1">
        <label class="lbl-value-view-form">{{ prop.cLastLabel }}</label>
      </b-col>
    </b-row> -->
    <b-row v-if="prop.cVisible">
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
      <!-- <b-col :md="prop.cType=='decimal'||prop.cType=='numeric'?4:''" v-show="inputStatus!=='view'"> -->
      <b-col v-show="inputStatus!=='view'">
        <!-- <b-form-input
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
          :ref="prop.cName"
          :id="prop.cName"
          @paste.native="onPaste"
        /> -->

        <!-- :width="prop.cSize+'px'" -->
        <chrome-picker :value="value" @input="updateValue" style="margin-bottom: 15px !important"/>

        <span v-show="errors.has(prop.cParentForm+'.'+prop.cName)"
          class="error-span">{{ errors.first(prop.cParentForm+'.'+prop.cName) }}
        </span>
      </b-col>
      <!-- <b-col v-show="inputStatus=='view'" :style="style"> -->
        <label v-show="inputStatus=='view'" class="lbl-value-view-form notranslate" :style="prop.cStyle">{{value}}</label>
      <!-- </b-col> -->
      <b-col md=1>
        <label class="lbl-value-view-form">{{ prop.cLastLabel }}</label>
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
      cKey: Boolean,
      // cType: String,
      cDefault: String,
      cProtect: Boolean,
      cVisible: Boolean,
      cPageLevel: String,
      cTabIndex: String,
      cParentForm: String,
      cLastLabel: String,
      cStyle: String,
      // cIsAlwaysShow: Boolean,
    },
    value: [String]
  },
  data() {
    return {
      // size: 9999,
      isRequired: false,
      // style: "",
      // decimals: "00"
    }
  },
  watch: {
    // value(newData, oldData) {
    //   if (!newData) return
    // }
  },
  computed: {
    inputStatus() {
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
    }
  },
  methods: {
    updateValue (data) {
      this.$emit('input', data.hex)
    },
  },
  created: function() {
    // var vm = this
    this.prop.cLabelSize = this.prop.cLabelSize ? this.prop.cLabelSize : 4
    // this.prop.cDecimal = this.prop.cDecimal ? parseInt(this.prop.cDecimal) : 2
    // this.prop.cType = this.prop.cType ? this.prop.cType : "text"
    this.prop.cProtect = this.prop.cProtect ? this.prop.cProtect : false
    this.prop.cVisible = this.prop.cVisible === undefined ? true : this.prop.cVisible
    this.prop.cStyle = this.prop.cStyle ? this.prop.cStyle : ""
    this.value = this.prop.cDefault ? this.prop.cDefault : ''

    // if (this.prop.cType == 'decimal') {
      
    //   this.decimals = ""
    //   for (let i = 1; i <= this.prop.cDecimal; i++) {
    //     this.decimals += "0"

    //     if (i === this.prop.cDecimal) {
    //       this.isCurrency2()
    //     }
    //   }

    //   this.style = "text-align: right !important; " + this.prop.cStyle
    //   // this.style = { 'text-align': 'right' }
    // } else {
    //   this.style = this.prop.cStyle
    // }

    // if (this.prop.cType == 'numeric') {
    //   // this.style = { 'text-align': 'right' }
    // }

    // get max, for maxlength
    if (this.prop.cValidate !== undefined && this.prop.cValidate !== null && this.prop.cValidate !== ''){
      var str_array = this.prop.cValidate.split('|')
      for (var i = 0; i < str_array.length; i++) {
        var s = str_array[i].split(':')
        if(s[0] == 'max') {
          if (s[1] > 0) {
            // console.log(s[1], this.checkSize(s[1]))
            // if (this.prop.cType == 'decimal') {
            //   this.prop.cValidate = this.replaceAllString(this.prop.cValidate, 'max:'+s[1], 'max:'+this.checkSize(s[1]), 'string')
            //   this.size = this.checkSize(s[1])
            // }
            // else {
              this.size = s[1]
            // }
            // this.size = this.prop.cType == 'decimal' ? this.checkSize(s[1]) : s[1]
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
    
  },
  mounted: function () {
  },
  beforeDestroy: function() {
  },
  updated: function () {
  }
}
</script>