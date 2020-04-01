<template>
    <div class="dashboard-page-chart">
        <div class="dashboard-page-chart__body">
            <b-row class="dashboardBody">
                <b-col md="12">
                    <ACCList
                        :prop = "propList"
                        :title = "'New Prospect'"
                        @rowClicked = "rowClicked"
                        @rowDblClicked = "doDoubleClick"
                        @rowLinkClick = "rowLink"
                        @pageSize = "M_PageSize"
                        @pagination = "M_Pagination"
                        @filter = "M_Advance_Filter"
                        @headTable = "M_Head_Table"
                        @refreshColumn = "refreshColumn"
                        ref="ref_NewProspectList"
                    />
                </b-col>
            </b-row>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            propList: {
                initialWhere: "",
                LineNo: 0,
                PageLevel: 1,
                TabIndex: 1,
                OrderBy: '',
                SourceField: '',
                ParamView: ''
            }
        }
    },
    methods: {
        rowClicked(record, index) {},
        doDoubleClick() {},
        rowLink(url) {},
        M_PageSize() {},
        M_Pagination() {},
        M_Advance_Filter() {},
        M_Head_Table() {},
        refreshColumn() {},
    },
    mounted() {
        this.$refs.ref_NewProspectList.doGetList('')
    }
}
</script>

<style>

</style>