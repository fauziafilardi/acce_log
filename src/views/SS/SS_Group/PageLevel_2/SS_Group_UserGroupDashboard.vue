<template>
    <div>
        <div :style="'margin-top:10px;'" class="el" mousetip mousetip-msg="I'm a tooltip">
            <div class="div-collapse" v-b-toggle.collapse2>
                <span class="master-span" v-show="IEBy.Input && IEBy.Edit">
                    Input By : {{IEBy.Input}} | Edit By : {{IEBy.Edit}} <font-awesome-icon icon="sort-down" class="icon-style-1__master" /> 
                </span>
            </div>
            <b-collapse id="collapse2" :visible="true">
                <b-row  style="padding-left: 10px; padding-bottom: 10px; !important;">              
                    <b-col md="5" id="col-left" class="bColMasterForm">
                        <b-form :data-vv-scope="'FormScope_' + PageLevel + '_' + TabIndex" :data-vv-value-path="'FormScope_' + PageLevel + '_' + TabIndex">
                            <ABSProcessInputSelect @change="onFromGroupCdChange" :prop="PI.FromGroupCd" :value="M_UserGroupDashboard.FromGroupCd"/>

                            <ABSProcessInputSelect @change="onFromSubPortfolioCdChange" :prop="PI.FromSubPortfolioCd" :value="M_UserGroupDashboard.FromSubPortfolioCd"/>
                            <br> <span>(blank SubPortfolio = all SubPortfolio)</span>

                            <ABSProcessInputSelect @change="onToGroupCdChange" :prop="PI.ToGroupCd" :value="M_UserGroupDashboard.ToGroupCd"/>

                            <ABSProcessInputSelect @change="onToSubPortfolioCdChange" :prop="PI.ToSubPortfolioCd" :value="M_UserGroupDashboard.ToSubPortfolioCd"/>
                            <br> <span>(blank SubPortfolio = all SubPortfolio)</span>
                        </b-form>
                    </b-col>                
                </b-row>
            </b-collapse>
        </div>
    </div>
</template>

<script>


export default {
    props: {PageLevel: '', TabIndex: ''},
    computed: {
        inputStatus() {
            if(this.$store.getters.getLevel == this.PageLevel && this.$store.getters.getTab == this.TabIndex){
                return this.$store.getters.getStatus.toUpperCase()
            }
            else {
                return 'VIEW'
            }
        }
    },
    data() {
        return {
            FormType: "Process",
            propList: {
                initialWhere: "",
                LineNo: 1,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex
            },
            M_UserGroupDashboard: {
                FromGroupCd: null,
                FromSubPortfolioCd: '',
                ToGroupCd: null,
                ToSubPortfolioCd: ''
            },
            IEBy: {Input: '', Edit: ''},
            PI: {
                FromGroupCd: {
                    dataLookUp: {
                        LookUpCd: 'GetRespondGroup',
                        ColumnDB: 'RespondGroup',
                        InitialWhere: "",
                        ParamWhere: ''
                    },
                    cValidate: 'required',
                    cName: 'FromGroupCd',
                    cLabel: 'From Group',
                    cOrder: 1,
                    cSelected: null,
                    cType: 'lookup',
                    cPageLevel: this.PageLevel,
                    cTabIndex: this.TabIndex,
                    cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
                },
                FromSubPortfolioCd: {
                    dataLookUp: {
                        LookUpCd: 'GetSubPortfolioCd',
                        ColumnDB: 'SubPortfolioCd',
                        InitialWhere: "",
                        ParamWhere: ''
                    },
                    cValidate: '',
                    cName: 'FromSubPortfolioCd',
                    cLabel: 'SubPortfolio',
                    cOrder: 2,
                    cSelected: null,
                    cType: 'lookup',
                    cPageLevel: this.PageLevel,
                    cTabIndex: this.TabIndex,
                    cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
                },
                ToGroupCd: {
                    dataLookUp: {
                        LookUpCd: 'GetRespondGroup',
                        ColumnDB: 'RespondGroup',
                        InitialWhere: "",
                        ParamWhere: ''
                    },
                    cValidate: 'required',
                    cName: 'ToGroupCd',
                    cLabel: 'To Group',
                    cOrder: 3,
                    cSelected: null,
                    cType: 'lookup',
                    cPageLevel: this.PageLevel,
                    cTabIndex: this.TabIndex,
                    cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
                },
                ToSubPortfolioCd: {
                    dataLookUp: {
                        LookUpCd: 'GetSubPortfolioCd',
                        ColumnDB: 'SubPortfolioCd',
                        InitialWhere: "",
                        ParamWhere: ''
                    },
                    cValidate: '',
                    cName: 'ToSubPortfolioCd',
                    cLabel: 'SubPortfolio',
                    cOrder: 4,
                    cSelected: null,
                    cType: 'lookup',
                    cPageLevel: this.PageLevel,
                    cTabIndex: this.TabIndex,
                    cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
                }
            }
        }
    },
    methods: {
        M_PageSize(){
        },
        M_TabClick(){
        },
        M_Pagination(){
        },
        M_Advance_Filter(){
        },
        M_Search(data){
        },
        M_Post(dt){
            var param = {
                from_group_cd: this.M_UserGroupDashboard.FromGroupCd,
                from_subportfolio_cd: this.M_UserGroupDashboard.FromSubPortfolioCd,
                to_group_cd: this.M_UserGroupDashboard.ToGroupCd,
                to_subportfolio_cd: this.M_UserGroupDashboard.ToSubPortfolioCd,
                user_input: this.getDataUser().user_id,
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order
            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return
                this.alertSuccess(response.Message)
                .then(() => {
                    this.M_ClearForm()
                })
            })
        },
        M_Refresh(){
        },
        M_Delete(){
        },
        M_Save(){
        },
        M_New(){
        },
        M_Cancel(){
        },
        paramFromParent(){
            this.M_ClearForm()
            let data = this.$store.getters.GetPage1Data
            this.M_UserGroupDashboard.UserGroup = data.user_group
        },
        onFromGroupCdChange (data) {
            this.M_UserGroupDashboard.FromGroupCd = data.id
        },
        onFromSubPortfolioCdChange (data) {
            this.M_UserGroupDashboard.FromSubPortfolioCd = data.id
        },
        onToGroupCdChange (data) {
            this.M_UserGroupDashboard.ToGroupCd = data.id
        },
        onToSubPortfolioCdChange (data) {
            this.M_UserGroupDashboard.ToSubPortfolioCd = data.id
        },
        M_ClearForm () {
            this.M_UserGroupDashboard.FromGroupCd = ""
            this.M_UserGroupDashboard.FromSubPortfolioCd = ""
            this.M_UserGroupDashboard.ToGroupCd = ""
            this.M_UserGroupDashboard.ToSubPortfolioCd = ""
            this.M_UserGroupDashboard.UserGroup = ""
        },
        setToolbarButton () {
        }
    },
    beforeCreate: function () {
    },
    created: function() {
    },
    beforeMount: function() {
    },
    mounted: function() {
        this.hideSideBarMenu()
    },
    beforeUpdate: function() {  
    },
    updated: function() {
    },
    beforeDestroy: function() {
    },
    destroyed: function() {
    }
}
</script>
