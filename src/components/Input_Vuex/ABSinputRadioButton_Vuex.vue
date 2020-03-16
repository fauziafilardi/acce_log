<template>
  <b-row v-show="prop.cVisible" style="font-size: 11px">
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
          <b-form-radio-group 
            v-validate="prop.cValidate"
            :class="{'input': true, 'error-text-field': errors.has(prop.cParentForm+'.'+prop.cName)}"
            v-show="inputStatus!=='view'"
            :id="prop.cName"
            :name="prop.cName"
            :options="prop.cRadioOptions"
            :disabled="inputStatus=='edit' && prop.cKey || prop.cProtect"
            v-model="value"
            @input="handleInput"
            :tabindex="prop.cOrder"
            :ref="prop.cName"
            :buttons="prop.cButton"
            button-variant="outline-primary"
            :size="prop.cSize">
          </b-form-radio-group>

          <span v-show="errors.has(prop.cParentForm+'.'+prop.cName)"
            class="error-span">{{ errors.first(prop.cParentForm+'.'+prop.cName) }}
          </span>

          <label class="lbl-value-view-form notranslate" v-show="inputStatus=='view'">{{ selectedvalue }}</label>
          <!-- {{prop.cRadioOptions}}
          {{value}} -->
      </b-col>
      <b-col md=1>
        <span v-show="inputStatus!='view' && prop.cShowClearButton" class="forClear" @click="clearSelected">Clear</span>
      </b-col>
  </b-row>
</template>

<script>
export default {
  props: {
    prop: {
      cId: String,
      cName: String,
      cValidate: String,
      cRadioOptions: Array,
      cLabel: String,
      cLabelSize: String,
      cOrder: Number,
      cKey:Boolean,
      cVisible:Boolean,
      cRadioDefaultOption: [String, Number],
      cPageLevel: String,
      cTabIndex: String,
      cParentForm: String,
      cProtect: Boolean,
      cShowClearButton: Boolean,
      cButton: Boolean,
      cSize: String
    },
    value : [String, Number]
  },
  data() {
    return {
      required: false,
      selected: null,
      isRequired: false,
    }
  },
  computed: {
    selectedvalue() {
      var val = ''
      if (this.value && this.value != '') {
        var idx = this.prop.cRadioOptions.map(function(e) { return e.value }).indexOf(this.value.toString())
        if (idx < 0) {
          val = ''
        } else {
          val = this.prop.cRadioOptions[idx].text
        }
      }
      return val
    },
    inputStatus() {
      this.$validator.pause()
      this.$nextTick(() => {
        this.$validator.errors.clear(this.prop.cParentForm)
        this.$validator.resume()
      })
      // return this.$store.getters.getStatus

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
  methods: {
    focus() {
      this.$nextTick().then(() => document.getElementById(this.prop.cName).focus())
    },
    clearSelected () {
      this.value = null
    },
    handleInput (val) {
      this.$emit('input', this.value)
    },
    eventBusListener (action, data) {
      this.inputStatus.isNew = data
      if (action == 'new') {
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
    }
  },
  created: function() {
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
    var ccx = {
      custom: {}
    }

    if(this.prop.cRadioDefaultOption !== null && this.prop.cRadioDefaultOption !== undefined && this.prop.cRadioDefaultOption !== ''){
      this.value = this.prop.cRadioDefaultOption
    }

    this.prop.cLabelSize = this.prop.cLabelSize ? this.prop.cLabelSize : 4

    this.prop.cShowClearButton = this.prop.cShowClearButton ? this.prop.cShowClearButton : false

    this.prop.cVisible = this.prop.cVisible === undefined || this.prop.cVisible === null ? true : this.prop.cVisible

    this.prop.cProtect = this.prop.cProtect ? this.prop.cProtect : false
    
    this.prop.cButton = this.prop.cButton ? this.prop.cButton : false
    this.prop.cSize = this.prop.cSize ? this.prop.cSize : 'md'

    // get max, for maxlength
    if(this.prop.cValidate !== undefined && this.prop.cValidate !== null && this.prop.cValidate !== ''){
      var str_array = this.prop.cValidate.split('|')
      for (var i = 0; i < str_array.length; i++) {
        var s = str_array[i].split(':')
        if(s[0] == 'required' || s[0] == 'cRequired') {
          this.isRequired = true
          if (s[0] == 'cRequired') {
            ccx.custom[this.prop.cName] = {
              'required' : s[1]
            }

            this.$validator.localize('en', ccx)
          }
        }
        else {
          this.prop.cValidate = false
        }

      }
    }
  },
  mounted: function () {
  },
  beforeDestroy: function () {
  }
}
</script>

<style scoped>
  .forClear {
    color: blue;
    text-decoration: underline;
    cursor: pointer;
  }
</style>