<template>
    <div class="button--toolbar">
        <b-button
            :disabled="buttonToolbarPost"
            @click="handleClickButton"
            size="sm"
            variant="success"
        >
            Post
        </b-button>
    </div>
</template>

<script>
export default {
    computed: {
        buttonToolbarPost () {
            return this.$store.getters.buttonToolbarPost
        }
    },
    methods: {
        handleClickButton () {
            console.log('button post')
        }
    }
}
</script>
