<template>
  <select
    class="styles"
    :multiple="multi"
    :size="size"
    v-model="selected"
    @change="updateValue"
    :disabled="disabled"
  >
    <option
      disabled
      value=""
      v-text="disabledOption"
      v-if="disabledOption!=''"
    />
    <option
      class="opt opt notranslate"
      v-for="option in options"
      :key="option.value"
      :value="option.value"
      :disabled="option.disabled"
      :style="option.style"
      v-text="option.key"
      @change="updateValue"
    />
  </select>
</template>

<script>
export default {
  name: 'FormSelect',
  model: {
    event: 'change',
  },
  props: {
    disabledOption: {
      type: String,
      default: '',
    },
    options: {
      type: Array,
      default: () => [],
    },
    value: {
      type: [Array, String, Number],
      default: null,
    },
    size : {
      type: String,
      default: "1"
    },
    multi : {
      type: Boolean,
      default: true
    },
    disabled : {
      type: Boolean,
      default: false
    },
  },
  watch: {
    value(newValue) {
      // console.log(newValue)
      if (newValue == null){
        this.selected = newValue
        this.$emit('input', this.selected)
      }
    }
  },
  data() {
    return {
      selected: null,
    }
  },
  computed: {
    multiple() {
      return Array.isArray(this.value);
    }
  },
  methods: {
    updateValue() {
      this.$nextTick(() => {
        if (this.multi) {
          this.$emit('change', this.selected)
          this.$emit('input', this.selected)
        }
        else {
          var idx = this.options.map(x => { return x.value }).indexOf(this.selected)
          this.$emit('change', this.options[idx])
          this.$emit('input', this.options[idx])
        }
      })
    }
  },
  mounted() {
    this.selected = this.value
  }
};
</script>

<style scoped>
    select.styles {
        /* cursor: move; */
        position: relative;
        display: block;
        padding: 10px 15px;
        margin-bottom: -1px;
        background-color: #fff;
        border: 1px solid #ddd;
    }

    option.opt {
        padding: 10px 15px;
    }
</style>