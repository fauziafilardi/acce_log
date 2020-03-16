<template>
    <div>
        <ABSList
            :prop="propList"
            :title = "data.query_name"
            @rowClicked="rowClicked"
            @rowDblClicked="doDoubleClick"
            @rowLinkClick="rowLink" />
        
        <!-- <hr class="line-grid-border" /> -->
        
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
                            <ABSinputText :prop="PI_QueryName" v-model="M_SS_CustomField.QueryName"/>
                            <ABSinputRadioButton :prop="PI_QueryType" v-model="M_SS_CustomField.QueryType"/>
                            <ABSinputText :prop="PI_SourceTable" v-model="M_SS_CustomField.SourceTable"/>
                            <ABSinputText :prop="PI_PageOrder" v-model="M_SS_CustomField.PageOrder"/>
                            <ABSinputRadioButton :prop="PI_FilterBySubPortfolio" v-model="M_SS_CustomField.FilterBySubPortfolio"/>
                            <ABSinputText :prop="PI_SubPortfolioColumnName" v-model="M_SS_CustomField.SubPortfolioColumnName"/>
                        </b-form>
                    </b-col>
                </b-row>
            </b-collapse>            
        </div>
    </div>
</template>

<script>

export default {
    props: {PageLevel:'', TabIndex: '', data: ''},
    data() {
        return {
            ValKey:null,
            // QuerySequenceNo: null,
            propList: {
                initialWhere: "page_master_seq = '" + this.ValKey + "'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex
            },
            M_SS_CustomField_Temp: {},
            M_SS_CustomField: {
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
    computed: {
        inputStatus() {
            if(this.$store.getters.getLevel == this.PageLevel && this.$store.getters.getTab == this.TabIndex){
                return this.$store.getters.getStatus.toUpperCase()
            }
            else {
                return 'VIEW'
            }
        },
        DataRow(){
            return this.$store.getters.GetPage2Data
        },
        DataRowPage1(){
            return this.$store.getters.GetPage1Data
        }
    },
    methods: {
        M_HeaderPage(data){
            // alert('MasterRate => '+JSON.stringify(data))            
            
            this.propList.initialWhere = "page_master_seq = '" + data.page_master_seq + "'"
            this.ValKey = data.page_master_seq
            this.M_SS_CustomField.PageMasterSeq = data.page_master_seq
        },
        M_HeaderChildPage(){
            return true
        },
        M_New(){
            this.$parent.state = 'NEW'
            this.$parent.isDetail = true
            
            // this.M_SS_CustomField.QueryName = ''
            // this.M_SS_CustomField.QueryType = ''
            // this.M_SS_CustomField.SourceTable = ''
            // this.M_SS_CustomField.PageOrder = ''
            // this.M_SS_CustomField.FilterBySubPortfolio = ''
            // this.M_SS_CustomField.SubPortfolioColumnName = ''

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
            var data = this.FormToABSList().getRowSelected()
            var dataDelete = []

            data.forEach((value) => {
                dataDelete.push({
                    page_master_seq: this.DataRowPage1.page_master_seq,
                    field_sequence_no:  value.field_sequence_no,
                    lastupdatestamp: value.lastupdatestamp,
                    _Message_:''
                })
            })
            
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                Data: dataDelete
            }
            
            this.postJSONMulti( this.getUrlDeleteMulti(), param )
            .then(response => {
                if (response == null) return

                this.$parent.resultDelete("Deleting Data Successfully")
            })
        },
        M_Save(){
            this.M_SS_CustomField.OptionSeq = this.getOptionSeq().OptionSeq
            this.M_SS_CustomField.LineNo = this.$parent.data.page_order
           
            if(this.$parent.state !== 'NEW'){
                this.M_SS_CustomField.UserInput = this.getDataUser().user_id
                // this.M_SS_CustomField.LastUpdateStamp = this.M_SS_CustomField_Temp.LastUpdateStamp
                this.M_SS_CustomField.QuerySequenceNo = this.QuerySequenceNo
                this.postJSON(this.getUrlUpdate(), this.M_SS_CustomField)
                .then((response) => {
                    if(response == null) {
                        return
                    }

                    delete this.M_SS_CustomField['UserInput']
                    
                    EventBus.$emit('ebGetList_' + this.PageLevel + '_' + this.TabIndex)
                    this.alertSuccess(response.Message)
                    .then(() => {
                        EventBus.$emit('ebToolbar', 'view')
                        EventBus.$emit('ebSaveSuccess_' + this.PageLevel + '_' + this.TabIndex)
                        delete this.M_SS_CustomField['QuerySequenceNo']
                    })

                })
            }
            else {//insert
                this.M_SS_CustomField.UserInput = this.getDataUser().user_id                                
                this.postJSON(this.getUrlInsert(), this.M_SS_CustomField)
                .then((response) => {
                    if(response == null) {
                        return
                    }
                    delete this.M_SS_CustomField['UserInput']
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
            // this.QuerySequenceNo = record.QuerySequenceNo

            EventBus.$emit('ToOpen',this.$parent.EbData)

            this.$parent.state = 'UPDATE'
            this.$parent.isDetail = true
            this.getDataBy(record)
        },
        rowLink: function(url){
            this.$refs.modalTest.show()
        },
        getDataBy (record) {
            console.log(record)    
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                // FieldSequenceNo: record.FieldSequenceNo,
                page_master_seq: record.page_master_seq
                
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
                this.M_SS_CustomField = {

                    // PageMasterSeq: data.PageMasterSeq,
                    // QueryName: data.QueryName,
                    // QueryType: data.QueryType,
                    // SourceTable: data.SourceTable,
                    // PageOrder: data.PageOrder,
                    // FilterBySubPortfolio: data.FilterBySubPortfolio,
                    // SubPortfolioColumnName: data.SubPortfolioColumnName

                }

                this.IEBy.Input = data.user_input
                this.IEBy.Edit = data.user_edit
                // this.M_SS_CustomField_Temp = data
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
