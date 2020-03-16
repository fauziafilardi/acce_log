<template>
    <div>
        <ABSList
            :prop="propList"
            :title = "data.query_name"
            @rowClicked="rowClicked"
            @rowDblClicked="doDoubleClick"
            @rowLinkClick="rowLink" />
        
        <div v-show="$parent.isDetail" style="margin-top:10px;">
            <div class="div-collapse" v-b-toggle.collapse2>
                <span class="master-span" v-show="IEBy.Input && IEBy.Edit">
                    Input By : {{IEBy.Input}} | Edit By : {{IEBy.Edit}} <font-awesome-icon icon="sort-down" class="icon-style-1__master" />  
                </span>
            </div>
            <b-collapse id="collapse2" :visible="true">
                <b-row style="padding-left: 10px; !important; padding-bottom: 5px; !important;">
                    <b-col md="5" id="col-left">
                        <b-form :data-vv-scope="'FormScope_' + PageLevel + '_' + TabIndex" :data-vv-value-path="'FormScope_' + PageLevel + '_' + TabIndex">
                            <ABSinputText :prop="PI_QueryName" v-model="M_SS_PageMasterFileInfoH.QueryName"/>
                            <ABSinputRadioButton :prop="PI_QueryType" v-model="M_SS_PageMasterFileInfoH.QueryType"/>
                            <ABSinputText :prop="PI_SourceTable" v-model="M_SS_PageMasterFileInfoH.SourceTable"/>
                            <ABSinputText :prop="PI_PageOrder" v-model="M_SS_PageMasterFileInfoH.PageOrder"/>
                            <ABSinputRadioButton :prop="PI_FilterBySubPortfolio" v-model="M_SS_PageMasterFileInfoH.FilterBySubPortfolio"/>
                            <ABSinputText :prop="PI_SubPortfolioColumnName" v-model="M_SS_PageMasterFileInfoH.SubPortfolioColumnName"/>
                        </b-form>
                    </b-col>
                </b-row>
            </b-collapse>            
        </div>
    </div>
</template>

<script>
import {EventBus} from '../../../../main'
export default {
    props: {PageLevel:'', TabIndex: '', data: ''},
    data() {
        return {
            ValKey:null,
            QuerySequenceNo: null,
            propList: {
                initialWhere: "PageMasterSeq = '" + this.ValKey + "'",
                LineNo: 1,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex
            },
            M_SS_PageMasterFileInfoH_Temp: {},
            M_SS_PageMasterFileInfoH: {
                QueryName:null,
                QueryType:null,
                SourceTable:null,
                PageOrder:null,
                FilterBySubPortfolio:null,
                SubPortfolioColumnName:null
            },
            IEBy: {Input: '', Edit: ''},
            PI_QueryName: {
                cValidate: 'min:2|max:60',
                cName: 'QueryName',
                cLabel: 'Query Name',
                // cLabelSize: 5,
                cOrder: 1,
                cKey: false,
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_QueryType: {
                cId: 'rdQueryType',
                cName: 'QueryType',
                cRadioOptions: [
                            { text: 'List', value: 'L' },
                            { text: 'Grid', value: 'G' }
                        ],
                cLabel: 'Query Type',
                //cLabelSize: 5,
                cOrder: 2,
                cKey: false,
                cRadioDefaultOption: '',
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_SourceTable: {
                cValidate: 'min:2|max:60',
                cName: 'SourceTable',
                cLabel: 'Source Table',
                // cLabelSize: 5,
                cOrder: 3,
                cKey: true,
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_PageOrder: {
                cValidate: 'min:1|max:60',
                cName: 'PageOrder',
                cLabel: 'PageOrder',
                // cLabelSize: 5,
                cOrder: 4,
                cKey: false,
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_FilterBySubPortfolio: {
                cId: 'rdFilterBySubPortfolio',
                cName: 'FilterBySubPortfolio',
                cRadioOptions: [
                            { text: 'Yes', value: 'Y' },
                            { text: 'No', value: 'N' }
                        ],
                cLabel: 'Filter By SubPortfolio',
                //cLabelSize: 5,
                cOrder: 5,
                cKey: false,
                cRadioDefaultOption: '',
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_SubPortfolioColumnName: {
                cValidate: 'min:2|max:60',
                cName: 'SubPortfolioColumnName',
                cLabel: 'Sub Column Name',
                // cLabelSize: 5,
                cOrder: 6,
                cKey: false,
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            }
        }
    },
    methods: {
        M_HeaderPage(data){
            // alert('MasterRate => '+JSON.stringify(data))
            console.log(data)
            this.propList.initialWhere = "PageMasterSeq = '" + data.PageMasterSeq + "'"
            this.ValKey = data.PageMasterSeq
            this.M_SS_PageMasterFileInfoH.PageMasterSeq = data.PageMasterSeq
        },
        M_HeaderChildPage(){
            return true
        },
        M_New(){
            this.$parent.state = 'NEW'
            this.$parent.isDetail = true
            
            this.M_SS_PageMasterFileInfoH.QueryName = ''
            this.M_SS_PageMasterFileInfoH.QueryType = ''
            this.M_SS_PageMasterFileInfoH.SourceTable = ''
            this.M_SS_PageMasterFileInfoH.PageOrder = ''
            this.M_SS_PageMasterFileInfoH.FilterBySubPortfolio = ''
            this.M_SS_PageMasterFileInfoH.SubPortfolioColumnName = ''

            this.$nextTick().then(() => {
                document.getElementById("QueryName").focus()
            })
        },
        M_Edit(){
            this.$nextTick().then(() => {
                document.getElementById("QueryName").focus()
            })
        },
        M_Delete(data){
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                SubPortfolioCd:this.getDataUser().subportfolio_cd,
                PortfolioCd:this.getDataUser().portfolio_cd,
                LineNo: 1,
                Data: data
            }
            
            this.postJSON( this.getUrlDeleteMulti(), param )
            .then(response => {
                // response from API
                if(response == null) return

                this.responses = response
                this.alertSuccess("Deleting Data Successfully")
                this.$parent.isDetail = false
                
                this.$parent.EbData.Event = 'delete'
                this.$parent.EbData.Key = ''
                
                EventBus.$emit('ToOpen', this.$parent.EbData)
                EventBus.$emit('ebGetList_' + this.PageLevel + '_' + this.TabIndex)
            })
        },
        M_Save(){
            this.M_SS_PageMasterFileInfoH.OptionSeq = this.getOptionSeq().OptionSeq
            this.M_SS_PageMasterFileInfoH.LineNo = 1
           
            if(this.$parent.state !== 'NEW'){
                this.M_SS_PageMasterFileInfoH.UserInput = this.getDataUser().user_id
                // this.M_SS_PageMasterFileInfoH.LastUpdateStamp = this.M_SS_PageMasterFileInfoH_Temp.LastUpdateStamp
                this.M_SS_PageMasterFileInfoH.QuerySequenceNo = this.QuerySequenceNo
                this.postJSON(this.getUrlUpdate(), this.M_SS_PageMasterFileInfoH)
                .then((response) => {
                    if(response == null) {
                        return
                    }

                    delete this.M_SS_PageMasterFileInfoH['UserInput']
                    
                    EventBus.$emit('ebGetList_' + this.PageLevel + '_' + this.TabIndex)
                    this.alertSuccess(response.Message)
                    .then(() => {
                        EventBus.$emit('ebToolbar', 'view')
                        EventBus.$emit('ebSaveSuccess_' + this.PageLevel + '_' + this.TabIndex)
                        delete this.M_SS_PageMasterFileInfoH['QuerySequenceNo']
                    })

                })
            }
            else {//insert
                this.M_SS_PageMasterFileInfoH.UserInput = this.getDataUser().user_id                                
                this.postJSON(this.getUrlInsert(), this.M_SS_PageMasterFileInfoH)
                .then((response) => {
                    if(response == null) {
                        return
                    }
                    delete this.M_SS_PageMasterFileInfoH['UserInput']
                    EventBus.$emit('ebGetList_' + this.PageLevel + '_' + this.TabIndex)
                    this.$parent.isDetail = false
                    this.alertSuccess(response.Message)
                    .then(() => {
                        EventBus.$emit('ebToolbar', 'view')
                        EventBus.$emit('ebSaveSuccess_' + this.PageLevel + '_' + this.TabIndex)
                    })
                })
            }

            this.$parent.isDetail = false
            this.$parent.EbData.Event = 'SAVE'
            EventBus.$emit('ToOpen',this.$parent.EbData)
        },
        rowClicked (record, index) {
            this.$parent.EbData.Event = 'rowClick'
            this.$parent.EbData.Key = record
            this.$parent.EbData.TabIndex = this.TabIndex            
            this.QuerySequenceNo = record.QuerySequenceNo

            EventBus.$emit('ToOpen',this.$parent.EbData)

            this.$parent.state = 'UPDATE'
            this.$parent.isDetail = true
            this.getDataBy(record)
        },
        rowLink: function(url){
            this.$refs.modalTest.show()
        },
        getDataBy (record) {    
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: 1,
                PageMasterSeq: record.PageMasterSeq,
                QuerySequenceNo: record.QuerySequenceNo
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
                this.M_SS_PageMasterFileInfoH = {

                    PageMasterSeq: data.PageMasterSeq,
                    QueryName: data.QueryName,
                    QueryType: data.QueryType,
                    SourceTable: data.SourceTable,
                    PageOrder: data.PageOrder,
                    FilterBySubPortfolio: data.FilterBySubPortfolio,
                    SubPortfolioColumnName: data.SubPortfolioColumnName
                    
                }

                this.IEBy.Input = data.user_input
                this.IEBy.Edit = data.useredit
                // this.M_SS_PageMasterFileInfoH_Temp = data
            })
        },
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
