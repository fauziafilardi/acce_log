<template>
  <span>
    <b-form-textarea
                v-show="isNew"
                v-validate="prop.cValidate"
                :class="{'input': true, 'error-text-field': errors.has(prop.cName)}"
                v-bind:name="prop.cName"
                v-bind:data-vv-as="prop.cNameError"
                v-model="value"
                class="text-area-field-form"
                :no-resize="!prop.cResize"
                :placeholder="prop.cPlaceholder"
                :rows="3"
                :max-rows="prop.cMaxRows"
                @input="handleInput"/>

    <label v-show="!isNew">{{value}}</label>

    <span v-show="errors.has(prop.cName)"
      class="error-span">{{ errors.first(prop.cName) }}
    </span>
  </span>
</template>

<script>
export default {
  props: {
    prop: {
      cValidate: String,
      cName: String,
      cNameError: String,
      cValue: String,
      cResize: Boolean,
      cPlaceholder: String,
      cRows: String,
      cMaxRows: String,
    }
  },
  data() {
    return {
      value: this.prop.cValue,
      isNew: false
    };
  },
  methods: {
    handleInput(){
      this.$emit('input', this.value)
    }
  },
  // watch: {
  //   value: function (newData, oldData) {
  //     this.$emit('input', newData)
  //   }
  // },
  created: function() {
    EventBus.$on('ebInput', (data) => {
      this.isNew = data
    });
  },
  mounted: function () {
    if(this.getStatusForm() == 'new') {
      this.isNew = true
    }
  }
}
</script>