<template>
    <div class="height--full">
        <HeaderFormListVuex2 :isProcess = "true" />

        <div class="content-app-form__body" style="background-color: white;padding-top: 1px !important;margin-left: 10px;margin-right: 10px;height: 95%;overflow-y: auto;overflow-x: hidden;padding-bottom: 80px;">
            <div :style="'margin-top:10px;'" class="el" mousetip mousetip-msg="I'm a tooltip">
                <b-collapse id="collapse1" :visible="true">
                    <b-row style="padding-left: 10px; padding-bottom: 10px; !important;">
                        <b-col md="12" id="col-left" class="bColMasterForm">	
                            <b-form :data-vv-scope="'FormScope_' + PageLevel + '_' + TabIndex" :data-vv-value-path="'FormScope_' + PageLevel + '_' + TabIndex">
                                <b-row style="padding-left:10px;">
                                    <b-col md="12" id="col-left">
                                        <b-row>
                                            <b-col  md="6">
                                                <ABSInputSelectList @change="OnmarketingChange" :prop="PI_marketing" :value="marketing" :label="marketingLabel" ref="ref_marketing"/>
                                            </b-col>
                                        </b-row>
                                    </b-col>
                                </b-row>
                            </b-form>
                            
                        </b-col>
                    </b-row>
                </b-collapse>
            </div>
            <div class="tab-list-process">
                <ABSListVuex
                    :prop = "propList"
                    :title = "'Assign Contact To Marketing'"
                    :isProcess = "true"
                    @rowClicked = "rowClicked"
                    @rowDblClicked = "doDoubleClick"
                    @rowLinkClick = "rowLink"
                    @pageSize = "M_PageSize"
                    @pagination = "M_Pagination"
                    @filter = "M_Advance_Filter"
                    @headTable = "M_Head_Table"
                    @refreshColumn = "refreshColumn"
                    :isCheckAsStatus = "checkStatus"
                    :statusFalse = "null"
                />
            </div>

        </div>
        <!-- <div class="content-app-form__body" style="background-color: white;padding-top: 1px !important;margin-left: 15px;margin-right: 15px;height: 95%;overflow-y: auto;overflow-x: hidden;padding-bottom: 80px;">
            <div :style="'margin-top:10px;'" class="el" mousetip mousetip-msg="I'm a tooltip">
                <b-collapse id="collapse1" :visible="true">
                    <b-row  style="padding-left: 10px; padding-top: 10px; !important;">
                        <b-col md="12" id="col-left" class="bColMasterForm">	
                            <b-form :data-vv-scope="'FormScope_' + PageLevel + '_' + TabIndex" :data-vv-value-path="'FormScope_' + PageLevel + '_' + TabIndex">
                                <b-row style="padding-left:10px;">
                                    <b-col md="12" id="col-left">
                                        <b-row>
                                            <b-col  md="6">
                                                <ABSInputSelectList @change="OnmarketingChange" :prop="PI_marketing" :value="marketing" :label="marketingLabel" ref="ref_marketing"/>
                                            </b-col>
                                        </b-row>
                                    </b-col>
                                </b-row>
                            </b-form>
                            
                        </b-col>
                    </b-row>
                </b-collapse>
            </div>

            <ABSListVuex
                :prop = "propList"
                :title = "'Assign Contact To Marketing'"
                @rowClicked = "rowClicked"
                @rowDblClicked = "doDoubleClick"
                @rowLinkClick = "rowLink"
                @pageSize = "M_PageSize"
                @pagination = "M_Pagination"
                @filter = "M_Advance_Filter"
                @headTable = "M_Head_Table"
                @refreshColumn = "refreshColumn"
            />
        </div> -->
    </div>
</template>

<script>

export default {
    data() {
        return {
            propList: {
                initialWhere: "",
                OrderBy:'time_edit DESC',
                LineNo: 0,
                PageLevel: 1,
                TabIndex: 1,
                OrderBy: '', 
                SourceField: '', 
                ParamView: 0
            },
		    FormType: "ListEdit",
       
            IEBy: {Input: '', Edit: ''},

            marketing: '',
            marketingLabel: '',
            checkStatus: "mk_marketing_id=0",

            PI_marketing: { 
                dataLookUp: { 
                    LookUpCd: 'GetMarketingId'    , 
                    ColumnDB: 'MarketingId'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''
                        }, 
                cValidate :'', 
                cName: 'marketing', 
                cLabel: 'Marketing ID', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 1,
                cTriggered: false, 
                cDefault: '', 
                cProtect: false, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1, 
                cStatic: false, 
                cOption: [], 
                cMasterUrl: 'MK/MK_Marketing' ,
                cDisplayColumn: 'marketing_id,name' ,
            },
        }
    },
	computed : {
        inputStatus() {
            if(this.$store.getters.getLevel == this.PageLevel && this.$store.getters.getTab == this.TabIndex){
                return this.$store.getters.getStatus.toUpperCase()
            }
            else {
                return 'VIEW'
            }
        },
        PageLevel () {
            return 1
        },
        TabIndex () {
            return 1
        },
  },
    methods: {
        OnmarketingChange (data) {
            console.log(data)
            this.marketing = data.mk_marketing_id
            this.marketingLabel = data.marketing_id && data.marketing_id != '' ? data.marketing_id + this.separator + data.name : ''
            this.propList.ParamView = data.mk_marketing_id
            this.checkStatus = "mk_marketing_id=" + data.mk_marketing_id
            this.toList().doGetList('','eb_getList')
        },
        toToolbar() {
            return this.$children[0].$children[0]
        },
        toList() {
            return this.$children[2]
        },
        Loader() {
            return this.$children[3]
        },
        rowClicked (record, index) {},
        doDoubleClick () {},
        rowLink (url) {},
        M_PageSize () {},
        M_Pagination () {},
        M_Advance_Filter () {},
        M_Head_Table () {},
        M_Search(data){
           this.toList().doGetList(data,'eb_getList')
        },
        M_Save() {
            var data = this.toList().getAllItem()
            var dataSave = []

            data.forEach((value) => {
                // dt = dt + value.row_id + ','
                dataSave.push({
                    _Message_ : "",
                    subportfolio_cd : this.getDataUser().subportfolio_cd,
                    cm_contact_id: value.cm_contact_id,
                    mk_marketing_id: value.mk_marketing_id == null || value.mk_marketing_id == '' ? 'NULL' : value.mk_marketing_id 
                })
            })

            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: 0,
                Data:dataSave
            }

            this.postJSON(this.getUrlInsertMulti(), param).then(response => {
                if (response == null) return
                this.alertSuccess('Assign Contact To Marketing Successfully')
                this.marketing = ''
                this.marketingLabel = ''
                this.propList.ParamView = 0
                this.checkStatus = "mk_marketing_id=0"
                this.toList().doGetList('','eb_getList')
            })
        },
        M_Post(dt) {
        },
        setToolbarButton() {},
    },
    beforeCreate: function () {
    },
    created: function() {
        this.$store.commit('setLevel', 1)
        this.$store.commit('setTab', 1)
        this.$store.commit('setFormType','ListEdit')
        this.$store.commit('setStatus', 'Edit')
        this.$store.commit('setListDisable', false)
        this.toToolbar().ProcessPS()
    },
    beforeMount: function() {
    },
    mounted: function() {
        this.hideSideBarMenu('inquiry')
        this.toList().doGetList('','eb_getList')
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

