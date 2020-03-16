<template>
  <span>
    <b-row v-show="prop.cVisible">
      <b-col :md="prop.cLabelSize" class="lbl-col-align">
        <!-- <label v-show="inputStatus=='new' || inputStatus=='edit'" class="text-field-form"><span v-if="isRequired" style="color:red;">*</span> {{ prop.cLabel }} :&nbsp;</label>
        <label v-show="inputStatus=='view'" class="lbl-view-form"><span v-if="isRequired" style="color:red;">*</span> {{ prop.cLabel }} :&nbsp;</label> -->

        <label v-show="inputStatus=='new' || inputStatus=='edit'" class="text-field-form"><span v-if="isRequired" style="color:red;">*</span> {{ $t(prop.cName) == prop.cName ? prop.cLabel : $t(prop.cName)}} <span v-if="prop.cName && prop.cName!=''"></span> </label>
        <label v-show="inputStatus=='view'" class="lbl-view-form"><span v-if="isRequired" style="color:red;">*</span> {{ $t(prop.cName) == prop.cName ? prop.cLabel : $t(prop.cName)}} <span v-if="prop.cName && prop.cName!=''"></span> </label>
      </b-col>
      <b-col>
        <b-form-checkbox-group
            :name="prop.cName"
            :size="prop.cSize"
            :options="prop.cOptions"
            :disabled="(inputStatus=='edit' && prop.cKey) || prop.cProtect || inputStatus=='view'"
            v-model="value"
            :id="prop.cName"
            :tabindex="prop.cOrder"
            @input="handleInput"
            >
        </b-form-checkbox-group>

          <span v-show="errors.has(prop.cParentForm+'.'+prop.cName)"
            class="error-span">{{ errors.first(prop.cParentForm+'.'+prop.cName) }}
          </span>
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
      cLabelSize: Number,
      cOptions: Array,
      cOrder: Number,
      cKey: Boolean,
      cVisible: Boolean,
      cProtect: Boolean,
      cPageLevel: String,
      cTabIndex: String,
      cParentForm: String,
      cDefault: [Array, String, Number],
      cSize: String
    },
    value: {
      type: [Array, String, Number],
      default: []
    },
    inputStatus: String
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
    // }
  },
  data() {
    return {
      selected: this.value,
      isRequired: false
    };
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
  created: function() {    
    this.prop.cLabelSize = this.prop.cLabelSize ? this.prop.cLabelSize : 4
    this.prop.cVisible = this.prop.cVisible === undefined || this.prop.cVisible === null ? true : this.prop.cVisible
    this.prop.cProtect = this.prop.cProtect ? this.prop.cProtect : false
    this.prop.cSize = this.prop.cSize ? this.prop.cSize : 'md'
    this.inputStatus = this.inputStatus === undefined ? 'new' : this.inputStatus
    if (this.prop.cDefault) {
      this.value = this.prop.cDefault
    }

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
  }
}
</script>
