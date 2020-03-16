<template>
    <div class="button--toolbar">
        <b-button
            :disabled="buttonToolbarEdit"
            @click="handleClickButton"
            size="sm"
            variant="warning"
        >
            Edit
        </b-button>
    </div>
</template>

<script>
export default {
    computed: {
        buttonToolbarEdit () {
            return this.$store.getters.buttonToolbarEdit
        }
    },
    methods: {
        handleClickButton () {
            console.log('button Edit')
        }
    }
}
</script>