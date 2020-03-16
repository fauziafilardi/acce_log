<template>
  <keep-alive>
  <!-- <component :ref="tabUrl" :is="component" :data="data" :PageLevel="PageLevel" :TabIndex="TabIndex" /> -->
    <component ref="_reference_" :is="component" :data="data" :PageLevel="PageLevel" :TabIndex="TabIndex" />
  </keep-alive>
</template>

<script>
export default {
    props: {
        tabPath: String,
        tabUrl: String,
        data: [Object, Array, String],
        PageLevel: [String, Number],
        TabIndex: [String, Number]
    },
    data () {
        return {
            component: null
        }
    },
    computed : {
    },
    mounted () {
        this.component = () => import(`../../${this.tabPath}/${this.tabUrl}.vue`)
    },
    methods: {
    },
    created () {
    }
}
</script>