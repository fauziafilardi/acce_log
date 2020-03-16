<template>
  <span>
    <b-row v-show="prop.cVisible">
      
      <b-col :md="prop.cLabelSize" class="lbl-col-align">
        <!-- <label class="lbl-view-form"><span v-if="isRequired" style="color:red;">*</span> {{ prop.cLabel }} :&nbsp;</label> -->

        <label v-show="isNew || isEdit" class="text-field-form"><span v-if="isRequired" style="color:red;">*</span> {{ prop.cLabel }} :&nbsp;</label>
        <label v-show="!isNew && !isEdit" class="lbl-view-form"><span v-if="isRequired" style="color:red;">*</span> {{ prop.cLabel }} :&nbsp;</label>
      </b-col>

      <b-col>
        <!-- <b-form-input
                v-show="isNew"
                v-validate="prop.cValidate"
                :class="{'input': true, 'error-text-field': errors.has(prop.cName)}"
                type="date"
                v-bind:name="prop.cName"
                v-bind:data-vv-as="prop.cNameError"
                v-bind:value="value"
                v-model="value"
                class="text-field-form"
                @input="handleInput"
                :disabled="isEdit && prop.cKey || prop.cProtect"
                :tabindex="prop.cOrder"/> -->

        <datepicker placeholder="Select Date" 
          v-show="isNew"
          v-validate="prop.cValidate"
          :class="{'input': true, 'error-text-field': errors.has(prop.cParentForm+'.'+prop.cName)}"
          type="date"
          v-bind:name="prop.cName"
          v-bind:data-vv-as="prop.cNameError"
          v-bind:value="value"
          v-model="value"
          input-class="cDate"
          @input="handleInput"
          :disabled="isEdit && prop.cKey || prop.cProtect"
          :tabindex="prop.cOrder"
          :format="prop.cFormat"
          :ref="prop.cName"
          :id="prop.cName"
        />

        <!-- <b-form-input type="date" v-model="value" class="text-field-form" :disabled="isEdit && prop.cKey || prop.cProtect"/> -->

        <span v-show="errors.has(prop.cParentForm+'.'+prop.cName)"
          class="error-span">{{ errors.first(prop.cParentForm+'.'+prop.cName) }}
        </span>

        <label v-show="!isNew">{{value}}</label>
        <!-- <label>{{value}}</label> -->
      </b-col>
    </b-row>
    
  </span>
</template>

<script>
import Datepicker from 'vuejs-datepicker'
import * as lang from "vuejs-datepicker/src/locale"

export default {
  components: { Datepicker },
  props: {
    // prop: {
    //   cValidate: String,
    //   cName: String,
    //   cNameError: String,
    //   cValue: String
    // }
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
      cParentForm: String
    },
    value: String
  },
  data() {
    return {
      // value: null,
      isNew: false,
      isEdit: false,
      isRequired: false
    };
  },
  methods: {
    handleInput(){
      this.value = this.momentDate(this.value)
      this.$emit('input', this.value)
    },
    eventBusListener (action, data) {
      // this.isEdit = false
      this.isNew = data
      if(action == 'new'){
        this.$validator.pause()
        this.$nextTick(() => {
          // this.$validator.errors.clear()
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
      else if (action == 'save') {
        this.isEdit = false
      }
    }
  },
  created: function() {
    this.prop.cLabelSize = this.prop.cLabelSize || this.prop.cLabelSize=='' ? this.prop.cLabelSize : 4
    this.prop.cProtect = this.prop.cProtect ? this.prop.cProtect : false
    this.prop.cFormat = this.prop.cFormat ? this.prop.cFormat : "dd MMM yyyy"
    this.prop.cVisible = this.prop.cVisible === undefined ? true : this.prop.cVisible

    // get max, for maxlength
    var str_array = this.prop.cValidate.split('|')
    for (var i = 0; i < str_array.length; i++) {
      var s = str_array[i].split(':')
      if(s[0] == 'required') {
        this.isRequired = true
      }
    }

    EventBus.$on('New_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex, (data) => this.eventBusListener('new',data))

    EventBus.$on('Edit_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex, (data) => this.eventBusListener('edit',data))

    EventBus.$on('Cancel_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex, () => this.eventBusListener('cancel',false))

    EventBus.$on('ebSaveSuccess_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex, () => this.eventBusListener('save',false))
  },
  mounted: function () {
    // this.value = this.momentDate(this.value)
    if(this.getStatusForm() == 'new') {
      this.isNew = true
    }
  },
  beforeDestroy: function() {
    EventBus.$off('New_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex)

    EventBus.$off('Edit_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex)

    EventBus.$off('Cancel_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex)

    EventBus.$off('ebSaveSuccess_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex)
  },
}
</script>

<style>
  .cDate {
    width:100%
  }
</style>
