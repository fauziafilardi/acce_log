<template>
    <div class="button--toolbar">
        <b-button
            :disabled="buttonToolbarRefresh"
            @click="handleClickButton"
            size="sm"
            variant="primary"
        >
            Refresh
        </b-button>
    </div>
</template>

<script>
export default {
    computed: {
        buttonToolbarRefresh () {
            return this.$store.getters.buttonToolbarRefresh
        }
    },
    methods: {
        handleClickButton () {
            console.log('button refresh')
        }
    }
}
</script>
