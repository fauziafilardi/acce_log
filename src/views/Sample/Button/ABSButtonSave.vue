<template>
    <div class="button--toolbar">
        <b-button
            :disabled="buttonToolbarSave"
            @click="handleClickButton"
            size="sm"
            variant="success"
        >
            Save
        </b-button>
    </div>
</template>

<script>
export default {
    computed: {
        buttonToolbarSave () {
            return this.$store.getters.buttonToolbarSave
        }
    },
    methods: {
        handleClickButton () {
            this.$store.dispatch('handleButtonSave')
        }
    }
}
</script>
