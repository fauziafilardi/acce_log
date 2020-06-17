<template>
  <span>
    <b-button v-show="!disabled"
              :size="size"
              @click.stop="clicked"
              :disabled="disabled"
              v-shortkey="shortKey"
              @shortkey="doShortkey"
              :class="classButton"
              :style="styleButton">
              <font-awesome-icon :icon="icon" :class="classIcon" :style="styleIcon"/>
              {{text}}
    </b-button>
    
    <b-button v-show="disabled"
              :size="size"
              @click.stop="clicked"
              :disabled="disabled"
              class="btnList__btnDisabled"
              :style="styleButton">
              <font-awesome-icon :icon="icon" :class="classIcon" :style="styleIcon"/>
              {{text}}
    </b-button>
  </span>
</template>

<script>

export default {
  props: {
    // prop: {
      disabled: Boolean,
      text: String,
      icon: String,
      classIcon: String,
      classButton: String,
      shortKey: {type: Array, default: null},
      styleButton: [Object, String, Array],
      styleIcon: [Object, String, Array],
      size: String
    // }
  },
  data() {
    return {
    }
  },
  methods: {
      clicked () {
        this.$emit('click')
      },
      doShortkey () {
        this.$emit('shortKey')
      }
  },
  mounted() {
    this.size = this.size && this.size != '' ? this.size : 'sm';
  }
}
</script>