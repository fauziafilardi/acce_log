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
                            <ABSinputText :prop="PI_Caption" v-model="M_SS_CustomField.Caption"/>                            
                            <ABSInputSelect @change="onChange" :prop="PI_DataType" v-model="M_SS_CustomField.DataType"/>
                            <ABSinputText :prop="PI_Length" v-model="M_SS_CustomField.Length"/>
                            <ABSinputRadioButton :prop="PI_Mandatory" v-model="M_SS_CustomField.Mandatory"/>
                            <ABSinputRadioButton :prop="PI_LookupStatus" v-model="M_SS_CustomField.LookupStatus"/>
                            <ABSInputSelect @change="onChange" :prop="PI_LookupTable" v-model="M_SS_CustomField.LookupTable"/>
                            <ABSinputText :prop="PI_LookupField" v-model="M_SS_CustomField.LookupField"/>                            
                            <ABSinputText :prop="PI_LookupCondition" v-model="M_SS_CustomField.LookupCondition"/>
                            <ABSinputText v-show="DefaultDescs" :prop="PI_DefaultDescs" v-model="M_SS_CustomField.DefaultDescs"/>
                            <ABSinputText v-show="DefaultNumeric" :prop="PI_DefaultNumeric" v-model="M_SS_CustomField.DefaultNumeric"/>
                            <ABSinputText v-show="DefaultDate" :prop="PI_DefaultDate" v-model="M_SS_CustomField.DefaultDate"/>
                            <ABSinputText :prop="PI_Remarks" v-model="M_SS_CustomField.Remarks"/> 
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
            FieldSequenceNo: null,
            LastUpdateStamp: null,
            // QuerySequenceNo: null, 

            propList: {                
                initialWhere: "PageMasterSeq = '" + this.ValKey + "'",
                LineNo: 2,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex
            },
            M_SS_CustomField_Temp: {},
            M_SS_CustomField: {

                Caption: null,
                DataType: null,
                Length: null,
                Mandatory: null,
                LookupStatus: null,
                LookupTable: null,
                LookupField: null,
                LookupCondition: null,
                DefaultDescs: null,
                Remarks: null
            },
            IEBy: {Input: '', Edit: ''},
            PI_Caption: {
                cValidate: 'required|min:2|max:60',
                cName: 'Caption',
                cLabel: 'Caption',
                // cLabelSize: 5,
                cOrder: 1,
                cKey: false,
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_DataType: {
                dataLookUp: {
                        LookUpCd: '',
                        ColumnDB: '',
                        InitialWhere: '',
                        ParamWhere: ''
                    },
                    cValidate: '',
                    cName: 'DataType',
                    cLabel: 'Data Type',
                    cOrder: 1,
                    cSelected: null,
                    cType: 'lookup',
                    cPageLevel: this.PageLevel,
                    cTabIndex: this.TabIndex,
                    cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
                    cStatic: true,
                    cOption: [
                        {id:'D', label:'Description'},
                        {id:'N', label:'Numeric'},
                        {id:'A', label:'Datetime'},
                        {id:'T', label:'Text'}
                    ]
            },
            PI_Length: {
                cValidate: 'min:2|max:60',
                cName: 'Length',
                cLabel: 'Length',
                // cLabelSize: 5,
                cOrder: 3,
                cKey: false,
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_Mandatory: {
                cId: 'rdMandatory',
                cName: 'Mandatory',
                cRadioOptions: [
                            { text: 'Yes', value: 'Y' },
                            { text: 'No', value: 'N' }
                        ],
                cLabel: 'Mandatory',
                //cLabelSize: 5,
                cOrder: 5,
                cKey: false,
                cRadioDefaultOption: '',
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_LookupStatus: {
                cId: 'rdLookupStatus',
                cName: 'LookupStatus',
                cRadioOptions: [
                            { text: 'Yes', value: 'Y' },
                            { text: 'No', value: 'N' }
                        ],
                cLabel: 'Lookup Status',
                //cLabelSize: 5,
                cOrder: 5,
                cKey: false,
                cRadioDefaultOption: '',
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_LookupTable: {
                dataLookUp: {
                        LookUpCd: 'GetLookupTable',
                        ColumnDB: 'name',
                        InitialWhere: '',
                        ParamWhere: ''
                    },
                    cValidate: '',
                    cName: 'LookupTable',
                    cLabel: 'Lookup Table',
                    cOrder: 1,
                    cSelected: null,
                    cType: 'lookup',
                    cPageLevel: this.PageLevel,
                    cTabIndex: this.TabIndex,
                    cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_LookupField: {
                cValidate: 'min:2|max:60',
                cName: 'LookupField',
                cLabel: 'Lookup Field',
                // cLabelSize: 5,
                cOrder: 1,
                cKey: false,
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_LookupCondition: {
                cValidate: 'min:2|max:60',
                cName: 'LookupCondition',
                cLabel: 'Lookup Condition',
                // cLabelSize: 5,
                cOrder: 1,
                cKey: false,
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_DefaultDescs: {
                cValidate: 'min:2|max:60',
                cName: 'DefaultDescs',
                cLabel: 'Default Description',
                // cLabelSize: 5,
                cOrder: 1,
                cKey: false,
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_DefaultNumeric: {
                cValidate: 'min:2|max:60',
                cName: 'DefaultNumeric',
                cLabel: 'Default Numeric',
                // cLabelSize: 5,
                cOrder: 1,
                cKey: false,
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_DefaultDate: {
                cValidate: 'min:2|max:60',
                cName: 'DefaultDate',
                cLabel: 'Default Date',
                // cLabelSize: 5,
                cOrder: 1,
                cKey: false,
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_Remarks: {
                cValidate: 'min:2|max:60',
                cName: 'Remarks',
                cLabel: 'Remarks',
                // cLabelSize: 5,
                cOrder: 1,
                cKey: false,
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            }            
        }
    },
    methods: {
        M_HeaderPage(data){
            // alert('M_HeaderPage SS_Custom')
            // alert('MasterRate => '+JSON.stringify(data))
            this.propList.initialWhere = "PageMasterSeq = '" + data.PageMasterSeq + "'"
            this.ValKey = data.PageMasterSeq
            this.M_SS_CustomField.PageMasterSeq = data.PageMasterSeq
        },
        M_HeaderChildPage(){
            return true
        },
        M_New(){
            this.$parent.state = 'NEW'
            this.$parent.isDetail = true
            
            this.M_SS_CustomField.Caption = ''
            this.M_SS_CustomField.DataType = null
            EventBus.$emit('ebSetValue' + this.PI_DataType.cName + '_' + this.PageLevel + '_' + this.TabIndex, {data: ''})
            this.M_SS_CustomField.Length = ''
            this.M_SS_CustomField.Mandatory = ''
            this.M_SS_CustomField.LookupStatus = ''
            this.M_SS_CustomField.LookupField = ''
            this.M_SS_CustomField.LookupTable = null
             EventBus.$emit('ebSetValue' + this.PI_LookupTable.cName + '_' + this.PageLevel + '_' + this.TabIndex, {data: ''})
            this.M_SS_CustomField.LookupCondition = ''
            this.M_SS_CustomField.DefaultDescs = ''
            this.M_SS_CustomField.DefaultNumeric = ''
            this.M_SS_CustomField.DefaultDate = ''
            this.M_SS_CustomField.Remarks = ''            

            this.$nextTick().then(() => {
                document.getElementById("Caption").focus()
            })
        },
        M_Edit(){
            this.$nextTick().then(() => {
                document.getElementById("Caption").focus()
            })
        },
        M_Delete(data){
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                SubPortfolioCd:this.getDataUser().subportfolio_cd,
                PortfolioCd:this.getDataUser().portfolio_cd,
                LineNo: 2,
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
            this.M_SS_CustomField.OptionSeq = this.getOptionSeq().OptionSeq
            this.M_SS_CustomField.LineNo = 2
           
            if(this.$parent.state !== 'NEW'){
                this.M_SS_CustomField.UserEdit = this.getDataUser().user_id                
                this.M_SS_CustomField.FieldSequenceNo = this.FieldSequenceNo
                this.M_SS_CustomField.LastUpdateStamp = this.LastUpdateStamp
                this.postJSON(this.getUrlUpdate(), this.M_SS_CustomField)
                .then((response) => {
                    if(response == null) {
                        return
                    }

                    delete this.M_SS_CustomField['UserEdit']
                    
                    EventBus.$emit('ebGetList_' + this.PageLevel + '_' + this.TabIndex)
                    this.alertSuccess(response.Message)
                    .then(() => {
                        EventBus.$emit('ebToolbar', 'view')
                        EventBus.$emit('ebSaveSuccess_' + this.PageLevel + '_' + this.TabIndex)
                        
                        delete this.M_SS_PageMaster['FieldSequenceNo']
                        delete this.M_SS_PageMaster['LastUpdateStamp']
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
            
            this.FieldSequenceNo = record.FieldSequenceNo
            this.LastUpdateStamp = record.LastUpdateStamp

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
                LineNo: 2,
                FieldSequenceNo: record.FieldSequenceNo,
                PageMasterSeq: record.PageMasterSeq
                
            }

            this.postJSON( this.getUrlById(), param )
            .then( response => {
                // this.clearForm('edit')
                if(response == null) return
                var data = response.Data
                if(data.length > 0){
                    data = data[0]
                    this.$nextTick(() => {
                        this.M_SS_CustomField.PageMasterSeq = data.PageMasterSeq
                        this.M_SS_CustomField.Caption = data.Caption
                        this.M_SS_CustomField.DataType = data.DataType
                        this.M_SS_CustomField.Length = data.Length
                        this.M_SS_CustomField.Mandatory = data.Mandatory
                        this.M_SS_CustomField.LookupStatus = data.LookupStatus
                        this.M_SS_CustomField.LookupTable = data.LookupTable
                        this.M_SS_CustomField.LookupField = data.LookupField                        
                        this.M_SS_CustomField.LookupCondition = data.LookupCondition
                        this.M_SS_CustomField.DefaultDescs = data.DefaultDescs                        
                        this.M_SS_CustomField.DefaultNumeric = data.DefaultNumeric
                        this.M_SS_CustomField.DefaultDate = data.DefaultDate
                        this.M_SS_CustomField.Remarks = data.Remarks
                        
                        //SetLookup
                        EventBus.$emit('ebSetValue' + this.PI_DataType.cName + '_' + this.PageLevel + '_' + this.TabIndex, {data: data.DataType, action: 'getByID'})
                        EventBus.$emit('ebSetValue' + this.PI_LookupTable.cName + '_' + this.PageLevel + '_' + this.TabIndex, {data: data.LookupTable, action: 'getByID'})
                    })
                    
                    this.IEBy.Input = data.user_input
                    this.IEBy.Edit = data.useredit
                }
            })            
        },
        onChange (data) {
            
            var from = data.from

            //DataType
            if (from == (this.PI_DataType.cName + "_" + this.PageLevel + "_" + this.TabIndex)) {
                if(data.value && data.value.id !== ''){
                    this.M_SS_CustomField.DataType = data.value.id

                    if(data.value.id == 'D'){
                        this.DefaultDescs = true
                        this.DefaultNumeric = false
                        this.DefaultDate = false
                        
                        if(this.M_SS_CustomField.DefaultNumeric !== 'NULL' || this.M_SS_CustomField.DefaultNumeric !== '' ){
                            this.M_SS_CustomField.DefaultNumeric = this.M_SS_CustomField.DefaultNumeric
                        }
                        else{
                            this.M_SS_CustomField.DefaultNumeric = 'NULL'
                        }

                        this.M_SS_CustomField.DefaultDate = 'NULL'

                    } else if(data.value.id == 'N') {
                        this.DefaultDescs = false
                        this.DefaultNumeric = true
                        this.DefaultDate = false

                        if(this.M_SS_CustomField.DefaultDescs !== 'NULL' || this.M_SS_CustomField.DefaultDescs !== '' ){
                            this.M_SS_CustomField.DefaultDescs = this.M_SS_CustomField.DefaultDescs
                        }else{
                            this.M_SS_CustomField.DefaultDescs = 'NULL'
                        }
                        
                        this.M_SS_CustomField.DefaultDate = 'NULL'

                    } else if (data.value.id == 'A'){
                        this.DefaultDescs = false
                        this.DefaultNumeric = false
                        this.DefaultDate = true                       

                        this.M_SS_CustomField.DefaultDescs = 'NULL'
                        this.M_SS_CustomField.DefaultNumeric = 'NULL'
                    }
                }
            } 
            
            //LookupTable
            else if (from == (this.PI_LookupTable.cName + "_" + this.PageLevel + "_" + this.TabIndex)) {
                if(data.value && data.value.id !== ''){
                    this.M_SS_CustomField.LookupTable = data.value.id
                }
            }

        }
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
