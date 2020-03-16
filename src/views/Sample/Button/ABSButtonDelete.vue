<template>
    <div class="button--toolbar">
        <b-button
            :disabled="buttonToolbarDelete"
            @click="handleClickButton"
            size="sm"
            variant="danger"
        >
            Delete
        </b-button>
    </div>
</template>

<script>
export default {
    computed: {
        buttonToolbarDelete () {
            return this.$store.getters.buttonToolbarDelete
        }
    },
    methods: {
        handleClickButton () {
            console.log('button delete')
        }
    }
}
</script>