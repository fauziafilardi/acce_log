<template>
    <div class="button--toolbar">
        <b-button
            :disabled="buttonToolbarCancel"
            @click="handleClickButton"
            size="sm"
            variant="secondary"
        >
            Cancel
        </b-button>
    </div>
</template>

<script>
export default {
    computed: {
        buttonToolbarCancel () {
            return this.$store.getters.buttonToolbarCancel
        }
    },
    methods: {
        handleClickButton () {
            this.$store.dispatch('handleButtonCancel')
        }
    }
}
</script>
