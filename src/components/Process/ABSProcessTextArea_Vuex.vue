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
        <b-form-textarea
          v-validate="prop.cValidate"
          :class="{'input': true, 'error-text-field': errors.has(prop.cParentForm+'.'+prop.cName)}"
          v-bind:name="prop.cName"
          v-bind:data-vv-as="prop.cLabel"
          v-model="value"
          @input="handleInput"
          :tabindex="prop.cOrder"
          :disabled="inputStatus=='edit' && prop.cKey || prop.cProtect"
          :plaintext="inputStatus=='view'"
          :style="style"
          :ref="prop.cName"
          :id="prop.cName"
          :no-resize="!prop.cResize"
          :rows="prop.cRows"
          :max-rows="prop.cMaxRows"
          :readonly="prop.cReadonly"
          :size="prop.cSize"
        />

          <span v-show="errors.has(prop.cParentForm+'.'+prop.cName)"
            class="error-span">{{ errors.first(prop.cParentForm+'.'+prop.cName) }}
          </span>
          <!-- <label class="lbl-value-view-form" v-show="inputStatus=='view'">{{value}}</label> -->
      </b-col>
      <b-col md=1>
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
      cDefault: String,
      cProtect: Boolean,
      cVisible: Boolean,
      cResize: Boolean,
      cReadonly: Boolean,
      cRows: Number,
      cMaxRows: Number,
      cSize: String,
      cPageLevel: String,
      cTabIndex: String,
      cParentForm: String
    },
    value: String,
    inputStatus: String
  },
  data() {
    return {
      isRequired: false,
      style: {}
    }
  },
  computed: {
    // inputStatus() {
    //   this.$validator.pause()
    //   this.$nextTick(() => {
    //     this.$validator.errors.clear(this.prop.cParentForm)
    //     this.$validator.resume()
    //   })

    //   if(this.$store.getters.getLevel == this.prop.cPageLevel && this.$store.getters.getTab == this.prop.cTabIndex){
    //     return this.$store.getters.getStatus
    //   }
    //   else {
    //     return 'view'
    //   }
    // },
    languageStatus () {
      return this.$store.getters.languageStatus
    }
  },
  methods: {
    clearValidator() {
      this.$validator.errors.clear(this.prop.cParentForm)
    },
    handleInput () {
      this.$emit('input', this.value)
    },
    focus() {
      this.$nextTick().then(() => document.getElementById(this.prop.cName).focus())
    }
  },
  watch: {
  },
  created: function() {
    this.prop.cLabelSize = this.prop.cLabelSize ? this.prop.cLabelSize : 4
    this.prop.cSize = this.prop.cSize ? this.prop.cSize : "md"
    this.prop.cProtect = this.prop.cProtect ? this.prop.cProtect : false
    this.prop.cResize = this.prop.cResize ? this.prop.cResize : false
    this.prop.cReadonly = this.prop.cReadonly ? this.prop.cReadonly : false
    this.prop.cVisible = this.prop.cVisible === undefined ? true : this.prop.cVisible
    this.value = this.prop.cDefault ? this.prop.cDefault : ''
    this.prop.cRows = this.prop.cRows ? this.prop.cRows : 3
    this.prop.cMaxRows = this.prop.cMaxRows ? this.prop.cMaxRows : this.prop.cRows
    this.inputStatus = this.inputStatus === undefined ? 'new' : this.inputStatus

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
  },
  mounted: function () {
  },
  beforeDestroy: function() {
  },
  updated: function () {
  }
}
</script>

<style scoped>
  .form-control{
    padding-top: 0px !important;
    padding-left: 5px !important; 
    padding-right: 5px !important;
  }
  .form-control-plaintext{
    padding-top: 0px !important;
    padding-left: 5px !important;
  }
</style>