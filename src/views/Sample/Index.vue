<template>
    <div class="toolbar-sample">
        <div class="toolbar-sample__box-button">
            <ABSButtonNew/>
            <ABSButtonEdit/>
            <ABSButtonDelete/>
            <ABSButtonSave/>
            <ABSButtonCancel/>
            <ABSButtonRefresh/>
            <ABSButtonPost/>
        </div>
        <div class="toolbar-sample__box-search">
            <ABSSearch/>
        </div>
        <button @click="handleClickAllDisable">
            disable semua button
        </button>
    </div>
</template>

<script>
import ABSButtonCancel from './Button/ABSButtonCancel'
import ABSButtonDelete from './Button/ABSButtonDelete'
import ABSButtonEdit from './Button/ABSButtonEdit'
import ABSButtonNew from './Button/ABSButtonNew'
import ABSButtonPost from './Button/ABSButtonPost'
import ABSButtonRefresh from './Button/ABSButtonRefresh'
import ABSButtonSave from './Button/ABSButtonSave'

import ABSSearch from './Search/ABSSearch'

import * as mutationTypes from '@/store/mutation-types'

export default {
    components: {
        ABSButtonCancel,
        ABSButtonDelete,
        ABSButtonEdit,
        ABSButtonNew,
        ABSButtonPost,
        ABSButtonRefresh,
        ABSButtonSave,
        ABSSearch
    },
    methods: {
        handleClickAllDisable () {
            this.$store.commit('BUTTON_NEW', true)
            this.$store.commit(mutationTypes.TOOLBAR_BUTTON_EDIT, true)
            this.$store.commit(mutationTypes.TOOLBAR_BUTTON_DELETE, true)
            this.$store.commit(mutationTypes.TOOLBAR_BUTTON_SAVE, true)
            this.$store.commit(mutationTypes.TOOLBAR_BUTTON_CANCEL, true)
            this.$store.commit(mutationTypes.TOOLBAR_BUTTON_REFRESH, true)
            this.$store.commit(mutationTypes.TOOLBAR_BUTTON_POST, true)
        }
    }
}
</script>

<style lang="scss" scoped>
    .toolbar-sample {
        display: flex;
        flex-flow: row nowrap;
        padding: 15px;
        align-content: flex-start;

        &__box-button {
            align-content: flex-start;
        }

        &__box-search {
            align-content: flex-start;
        }
    }

    .button--toolbar {
        float: left;
        margin-right: 10px;
    }
</style>
