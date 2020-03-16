<template>
  <b-row>
      <b-col :md="prop.cLabelSize" class="lbl-col-align">
        <label v-show="isNew || isEdit" class="text-field-form">{{ prop.cLabel }} <span v-if="isRequired" style="color:red;">*</span>:&nbsp;</label>
        <label v-show="!isNew && !isEdit" class="lbl-view-form">{{ prop.cLabel }} <span v-if="isRequired" style="color:red;">*</span>:&nbsp;</label>
      </b-col>
      <b-col >
          <b-form-radio-group 
              v-show="isNew"
              :id="prop.cName"
              :name="prop.cName"
              :options="prop.cRadioOptions"
              :disabled="!isNew"
              v-model="value"
              @input="handleInput"
              :tabindex="prop.cOrder"
              :ref="prop.cName">
          </b-form-radio-group>

          <span v-show="errors.has(prop.cParentForm+'.'+prop.cName)"
            class="error-span">{{ errors.first(prop.cParentForm+'.'+prop.cName) }}
          </span>

          <label class="text-field-form" v-show="!isNew">{{ value && value!=='' ? prop.cRadioOptions[prop.cRadioOptions.map(function(e) { return e.value }).indexOf(value)].text : '' }}</label>
      </b-col>
  </b-row>
</template>

<script>
export default {
  props: {
    prop: {
      cId: String,
      cName: String,
      cRadioOptions: Array,
      cLabel: String,
      cLabelSize: String,
      cOrder: Number,
      cRadioDefaultOption: String,
      cPageLevel: String,
      cTabIndex: String,
      cParentForm: String
    },
    value : null
  },
  data() {
    return {
      isNew: false,
      isEdit: false,
      required: false,
      selected: '',
      isRequired: false,
    };
  },
  methods: {
    handleInput () {
      // alert(this.prop.cRadioDefaultOption)
      this.$emit('input', this.value)
    },
    eventBusListener (action, data) {
      this.isNew = data
      if (action == 'new') {
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
  // watch: {
  //   selected: function (newData, oldData) {
  //     this.$emit('input', newData)
  //   }
  // },
  created: function() {
    this.prop.cLabelSize = this.prop.cLabelSize ? this.prop.cLabelSize : 5

    EventBus.$on('New_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex, (data) => this.eventBusListener('new',data))
    EventBus.$on('Edit_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex, (data) => this.eventBusListener('edit',data))
    EventBus.$on('Cancel_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex, () => this.eventBusListener('cancel',false))
    EventBus.$on('ebSaveSuccess_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex, () => this.eventBusListener('save',false))

    // get max, for maxlength
    var str_array = this.prop.cValidate.split('|')
    for (var i = 0; i < str_array.length; i++) {
      var s = str_array[i].split(':')
      if(s[0] == 'required') {
        this.isRequired = true
      }
    }
  },
  mounted: function () {
    // console.log(this.value)
    if(this.getStatusForm() == 'new') {
      this.isNew = true
    }
  },
  beforeDestroy: function () {
    EventBus.$off('New_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex)
    EventBus.$off('Edit_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex)
    EventBus.$off('Cancel_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex)
    EventBus.$off('ebSaveSuccess_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex)
  }
}
</script>