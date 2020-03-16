<template>
    <div class="button--toolbar">
        <b-button
            :disabled="buttonToolbarNew"
            @click="handleClickButton"
            size="sm"
            variant="primary"
        >
            New
        </b-button>
    </div>
</template>

<script>
export default {
    computed: {
        buttonToolbarNew () {
            return this.$store.getters.buttonToolbarNew
        }
    },
    methods: {
        handleClickButton () {
            console.log('button save')
            this.$store.dispatch('handleButtonNew')
        }
    }
}
</script>
