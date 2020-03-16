<template>
  <span>
    <b-row v-show="prop.cVisible">
      <b-col :md="prop.cLabelSize" class="lbl-col-align">
        <template v-if="languageStatus">
          <label v-show="inputStatus=='new' || inputStatus=='edit'" class="text-field-form"> {{ $t(prop.cLabel)}} </label>
          <label v-show="inputStatus=='view'" class="lbl-view-form">{{ $t(prop.cLabel)}} </label>
        </template>
        <template v-else>
          <label v-show="inputStatus=='new' || inputStatus=='edit'" class="text-field-form"> {{ prop.cLabel }} </label>
          <label v-show="inputStatus=='view'" class="lbl-view-form"> {{ prop.cLabel }} </label>
        </template>
      </b-col>
      <b-col :md="prop.cType=='decimal'||prop.cType=='numeric'?4:''" :style="style">
        <label class="text-field-form" :style="prop.cStyle"> {{value}} </label>
      </b-col>
      <b-col md=1></b-col>
    </b-row>
  </span>
</template>

<script>

export default {
  props: {
    prop: {
      cLabel: String,
      cValue: String,
      cPageLevel: Number,
      cTabIndex: Number,
      cVisible: Boolean,
      cLabelSize: Number,
      cType: String,
      cDecimal: [String, Number],
      cStyle: String
    },
    value: [String, Number]
  },
  data() {
    return {
      // value: this.prop.cValue,
      style: {},
      decimals: "00"
    }
  },
  methods: {
    formatNumber(evt){
      if(this.prop.cType == 'decimal'){
        if(this.prop.cValue !== ''){
          var num = this.prop.cValue
          var numSplit = num.split('.')
          var numReal = numSplit[0].replace(',','')
          var numDecimal = numSplit[1] ? ("." + numSplit[1]) : '.00'

          this.prop.cValue = numReal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + numDecimal
        }
      }
    }
  },
  watch: {
    // 'prop.cValue': function(val, oldVal) {
    //   if(this.prop.cType == 'decimal'){
    //     return this.formatNumber(val)
    //   }
    //   else {
    //     return val
    //   }
    // },
    value(newData, oldData) {
      if (!newData) return
      // if (newData.indexOf('.') < 0) return
      // if (!newData.toString().includes('.')) return
      
      // var numSplit = newData.split('.')
      // var temp
      // if (numSplit[1].length > this.prop.cDecimal) {
      //   // temp = numSplit[1].substring(0, numSplit[1].length - this.prop.cDecimal)
      //   temp = numSplit[1].substring(0, this.prop.cDecimal)
      //   this.value = numSplit[0] + "." + temp
      //   this.$emit('input', this.value)
      // }
    }
  },
  computed: {
    inputStatus() {
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
  created: function() {
    this.prop.cLabelSize = this.prop.cLabelSize ? this.prop.cLabelSize : 4
    this.prop.cType = this.prop.cType ? this.prop.cType : "text"
    this.prop.cVisible = this.prop.cVisible === undefined ? true : this.prop.cVisible
    this.prop.cDecimal = this.prop.cDecimal ? parseInt(this.prop.cDecimal) : 2

    if (this.prop.cType == 'numeric' || this.prop.cType == 'decimal') {
      this.style = { 'text-align': 'right' }
    }

    if (this.value == null || this.value == '') {
      this.value = ''
    }

    // if (this.prop.cType == 'decimal') {
      
    //   this.decimals = ""
    //   for (let i = 1; i <= this.prop.cDecimal; i++) {
    //     this.decimals += "0"

    //     if (i === this.prop.cDecimal) {
    //       // this.isCurrency2()
    //     }
    //   }

    //   this.style = { 'text-align': 'right' }
    // }
  }
}
</script>