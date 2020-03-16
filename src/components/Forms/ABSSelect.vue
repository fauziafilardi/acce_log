<template>
  <select
    class="styles"
    :multiple="multiple"
    :size="size"
    v-model="selected"
    @change="updateValue"
  >
    <option
      disabled
      value=""
      v-text="disabledOption"
      v-if="disabledOption!=''"
    />
    <option
      class="opt"
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
    // By default, `v-model` reacts to the `input`
    // event for updating the value, we change this
    // to `change` for similar behavior as the
    // native `<select>` element.
    event: 'change',
  },
  props: {
    // The disabled option is necessary because
    // otherwise it isn't possible to select the
    // first item on iOS devices. This prop can
    // be used to configure the text for the
    // disabled option.
    disabledOption: {
      type: String,
      default: '',
    },
    options: {
      type: Array,
      default: () => [],
    },
    value: {
    //   type: [String, Number],
      type: [Array, String, Number],
      default: null,
    },
    size : {
        type: Number,
        default: 1
    }
  },
  data() {
    return {
      selected: this.value,
    };
  },
  computed: {
    multiple() {
        return Array.isArray(this.value);
    }
  },
  methods: {
    updateValue() {
      // Emitting a `change` event with the new
      // value of the `<select>` field, updates
      // all values bound with `v-model`.
      this.$emit('change', this.selected);
    },
  },
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