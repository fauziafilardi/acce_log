<template>
    <div class="toolbar--search">
        <b-form-input
            id="search-toolbar"
            type="text"
            v-model="searchToolbar"
            required
            placeholder="Search..."
        >
        </b-form-input>
        {{ searchToolbar }}
    </div>
</template>

<script>
export default {
    computed: {
        searchToolbar: {
            set (data) {
                this.$store.dispatch('handleChange', data)
            },
            get () {
                return this.$store.getters.searchToolbar
            }
        }
    }
}
</script>
