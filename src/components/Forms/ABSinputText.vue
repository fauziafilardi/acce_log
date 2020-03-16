<template>
  <span>
    <b-row v-show="prop.cVisible">
      <b-col :md="prop.cLabelSize" class="lbl-col-align">
        <label v-show="isNew || isEdit" class="text-field-form"><span v-if="isRequired" style="color:red;">*</span> {{ prop.cLabel }} :&nbsp;</label>
        <label v-show="!isNew && !isEdit" class="lbl-view-form"><span v-if="isRequired" style="color:red;">*</span> {{ prop.cLabel }} :&nbsp;</label>
      </b-col>
      <b-col> 
        <b-form-input
          v-show="isNew"
          v-validate="prop.cValidate"
          :class="{'input': true, 'error-text-field': errors.has(prop.cParentForm+'.'+prop.cName)}"
          type="text"
          v-bind:name="prop.cName"
          v-bind:data-vv-as="prop.cLabel"
          v-model="value"
          class="text-field-form"
          @input="handleInput"
          :maxlength="size"
          :tabindex="prop.cOrder"
          :disabled="isEdit && prop.cKey || prop.cProtect"
          @keypress.native="formatNumber"
          :style="style"
          @blur.native="isCurrency"
          :ref="prop.cName"
          :id="prop.cName"
        />

          <span v-show="errors.has(prop.cParentForm+'.'+prop.cName)"
            class="error-span">{{ errors.first(prop.cParentForm+'.'+prop.cName) }}
          </span>

          <!-- <label class="text-field-form" v-show="!isNew">{{prop.cDefault}}</label>
          <label class="text-field-form" v-show="!isNew">{{value}}</label> -->
          <label class="lbl-value-view-form notranslate" v-show="!isNew">{{value}}</label>
      </b-col>
      <!-- <b-col v-else>
        <b-form-input
          v-show="isNew"
          v-validate="prop.cValidate"
          :class="{'input': true, 'error-text-field': errors.has(prop.cName)}"
          type="text"
          v-bind:name="prop.cName"
          v-bind:data-vv-as="prop.cLabel"
          v-model="value"
          class="text-field-form"
          @input="handleInput"
          :maxlength="size"
          :tabindex="prop.cOrder"/>

          <span v-show="errors.has(prop.cName)"
            class="error-span">{{ errors.first(prop.cName) }}
          </span>

          <label class="text-field-form" v-show="!isNew">{{value}}</label>
      </b-col> -->
      <b-col md="1">
        <label class="lbl-value-view-form notranslate">{{ prop.cLastLabel }}</label>
      </b-col>
    </b-row>
  </span>
</template>

<script>
import { EventBus } from '../../main'
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
      cVisible: Boolean,
      cPageLevel: String,
      cTabIndex: String,
      cParentForm: String,
      cLastLabel: String
    },
    value: String
  },
  data() {
    return {
      isNew: false,
      isEdit: false,
      size: 0,
      isRequired: false,
      style: {},
      // validators: {}
    };
  },
  methods: {
    handleInput () {
      this.$emit('input', this.value)
      // console.log(this.$validator)
      // this.$emit('isValid', this.$validator.validate().then((res) => {return res}))
    },
    formatNumber(evt){
      if(this.prop.cType == 'decimal'){
        // console.log(evt)
        evt = (evt) ? evt : window.event
        var charCode = (evt.which) ? evt.which : evt.keyCode
        if ((charCode > 31 && (charCode < 48 || charCode > 57)) && charCode !== 46) {
          evt.preventDefault()
        }
        else if(charCode == 46){
          var str = this.value
          if(str.indexOf('.') !== -1){
            evt.preventDefault()
          }
          else {
            return true
          }
        }
        else {
          return true
        }
      }
    },
    isCurrency () {
      if(this.prop.cType == 'decimal'){
        if(this.value !== ''){
          var num = this.value
          var numSplit = num.split('.')
          var numReal = numSplit[0].replace(',','')
          var numDecimal = numSplit[1] ? ("." + numSplit[1]) : '.00'

          this.value = numReal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + numDecimal
        }
      }
    },
    eventBusListener (action, data) {
      // alert(action)
      // this.isEdit = false
      this.isNew = data
      if(action == 'new'){
        this.$validator.pause()
        this.$nextTick(() => {
          this.$validator.errors.clear(this.prop.cParentForm)
          // this.$validator.fields.items.forEach(field => field.reset())
          // this.$validator.fields.items.forEach(field => this.errors.remove(field))
          this.$validator.resume()
        })
      }
      else if (action == 'edit') {
        this.isEdit = true
      }
      else if (action == 'cancel') {
        this.isEdit = false
      }
      // else if (action == 'beforeSave') {
      //   // if(this.prop.cValidate){
      //     this.$validator.validate().then((res) => { EventBus.$emit('ValidToSave_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex, {from: this.prop.cName, response: res}) })
      //   // }
      // }
      else if (action == 'save') {
        this.isEdit = false
      }
    }
  },
  computed: {
  },
  watch: {
  },
  created: function() {
    this.prop.cLabelSize = this.prop.cLabelSize ? this.prop.cLabelSize : 5
    this.prop.cType = this.prop.cType ? this.prop.cType : "text"
    this.prop.cProtect = this.prop.cProtect ? this.prop.cProtect : false
    this.prop.cVisible = this.prop.cVisible === undefined ? true : this.prop.cVisible
    this.value = this.prop.cDefault ? this.prop.cDefault : ''

    if (this.prop.cType == 'decimal') {
      this.style = { 'text-align': 'right' }
    }

    // get max, for maxlength
    var str_array = this.prop.cValidate.split('|')
    for (var i = 0; i < str_array.length; i++) {
      var s = str_array[i].split(':')
      if(s[0] == 'max') {
        this.size = s[1]
      }
      else if(s[0] == 'required') {
        this.isRequired = true
      }

      // this.validators[s[0]] = s[1]==null || s[1]==undefined?true:s[1]
    }

    if (this.size == 0) alert('Max Length Should Be Fill')
    
    // EventBus.$on('ebInput', (data) => {
    //   this.isNew = data
    //   if (this.getStatusForm() == 'edit') {
    //     this.isEdit = true
    //   } else {
    //     this.isEdit = false
    //   }
    // })
    EventBus.$on('New_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex, (data) => this.eventBusListener('new', data))

    EventBus.$on('Edit_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex, (data) => this.eventBusListener('edit', data))

    EventBus.$on('Cancel_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex, () => this.eventBusListener('cancel',false))

    // EventBus.$on('Save_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex, () => this.eventBusListener('beforeSave',true))

    EventBus.$on('ebSaveSuccess_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex, () => this.eventBusListener('save',false))

    // EventBus.$on('input', (data) => {
    //   alert(data)
    //   this.value = data
    // })

    // this.$validator.attach({
    //   name: this.prop.cName,
    //   rules: this.validators
    // })
  },
  mounted: function () {
    if(this.getStatusForm() == 'new') {
      this.isNew = true
    }
  },
  beforeDestroy: function() {
    EventBus.$off('New_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex)

    EventBus.$off('Edit_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex)

    EventBus.$off('Cancel_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex)

    // EventBus.$off('Save_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex)

    EventBus.$off('ebSaveSuccess_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex)
  },
  updated: function () {
  }
}
</script>