<template>
    <div>
        <ABSList
            :prop="propList"
            :title = "data.query_name"
            @rowClicked="rowClicked"
            @rowDblClicked="doDoubleClick"
            @rowLinkClick="rowLink"
        />

        <div v-show="$parent.isDetail"  :style="'margin-top:10px;'" class="el" mousetip mousetip-msg="I'm a tooltip">
            <div class="div-collapse" v-b-toggle.collapse1>
                <span class="master-span" v-show="IEBy.Input && IEBy.Edit">
                    Input By : {{IEBy.Input}} | Edit By : {{IEBy.Edit}} <font-awesome-icon icon="sort-down" class="icon-style-1__master" /> 
                </span>
            </div>
            <b-collapse id="collapse1" :visible="true">
                <b-row  style="padding-left: 10px; padding-bottom: 10px; !important;">              
                    <b-col v-show="UserTypeInternal" md="5" id="col-left" class="bColMasterForm">
                        <b-form :data-vv-scope="'FormScope_' + PageLevel + '_' + TabIndex" :data-vv-value-path="'FormScope_' + PageLevel + '_' + TabIndex">
                            <ABSinputText :prop="PI_TextMenu" v-model="M_SS_PageMaster.TextMenu"/>
                            <!-- <ABSinputText v-show="PageMasterSeqShow" :prop="PI_PageMasterSeq" v-model="M_SS_PageMaster.PageMasterSeq"/> -->
                            <b-row v-show="PageMasterSeqShow"> 
                                <b-col md="5" class="lbl-col-align">                                    
                                    <label class="text-field-form"> Page master Seq :&nbsp;</label>
                                </b-col>
                                <b-col md="5" class="lbl-col-align" style="text-align:left !important;">
                                    <label class="text-field-form" style="padding-left: 0px !important;">{{IEBy.PageMasterSeq}}</label>
                                </b-col>
                            </b-row>
                            
                            <ABSInputSelect @change="onChange" :prop="PI_ModuleCd" v-model="M_SS_PageMaster.ModuleCd"/>
                            <ABSinputText :prop="PI_PageCd" v-model="M_SS_PageMaster.PageCd"/>
                            <ABSInputSelect @change="onChange" :prop="PI_TableName" v-model="M_SS_PageMaster.TableName"/>
                            <ABSinputText :prop="PI_LocationUrl" v-model="M_SS_PageMaster.LocationUrl"/>
                            <ABSinputText :prop="PI_PageUrl" v-model="M_SS_PageMaster.PageUrl"/>
                            <ABSinputRadioButton :prop="PI_UserType" v-model="M_SS_PageMaster.UserType"/>
                            <ABSinputRadioButton :prop="PI_FilterByUserLevel" v-model="M_SS_PageMaster.FilterByUserLevel"/>
                            <ABSinputText :prop="PI_UserColumnName" v-model="M_SS_PageMaster.UserColumnName"/>
                        </b-form>
                    </b-col>
                    <b-col v-show="UserTypePublic" md="5" id="col-left" class="bColMasterForm">
                        <ABSinputText :prop="PI_TextMenu" v-model="M_SS_PageMaster.TextMenu"/>
                        <!-- <ABSinputText v-show="PageMasterSeqShow" :prop="PI_PageMasterSeq" v-model="M_SS_PageMaster.PageMasterSeq"/> -->
                        <b-row v-show="PageMasterSeqShow"> 
                            <b-col md="5" class="lbl-col-align">                                    
                                <label class="text-field-form"> Page master Seq :&nbsp;</label>
                            </b-col>
                            <b-col md="5" class="lbl-col-align" style="text-align:left !important;">
                                <label class="text-field-form" style="padding-left: 0px !important;">{{IEBy.PageMasterSeq}}</label>
                            </b-col>                            
                        </b-row>
                        <ABSinputRadioButton :prop="PI_FilterByUserLevel" v-model="M_SS_PageMaster.FilterByUserLevel"/>
                    </b-col>                                    
                </b-row>
            </b-collapse>
        </div>
    </div>
</template>

<script>
import {EventBus} from '../../../../main'

export default {
    props: {PageLevel: '', TabIndex: '', data: ''},
    data() {
        return {
            PageMasterSeq: null,
            LastUpdateStamp: null,
            propList: {
                initialWhere: "",
                LineNo: 0,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex
            },
            M_SS_PageMaster: {
                TextMenu: null,
                // PageMasterSeq: null,
                ModuleCd: null,
                PageCd: null,
                TableName: null,
                LocationUrl: null,
                PageUrl: null,
                UserType: null,
                FilterByUserLevel: null,
                UserColumnName: null
            },
            IEBy: {Input: '', Edit: ''},

            PI_TextMenu: {
                cValidate: 'required|min:2|max:60',
                cName: 'TextMenu',
                cLabel: 'Menu Name',
                // cLabelSize: 5,
                cOrder: 1,
                cKey: false,
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },            
            PI_ModuleCd: {                
                dataLookUp: {
                        LookUpCd: 'GetModuleCd',
                        ColumnDB: 'ModuleCd',
                        InitialWhere: '',
                        ParamWhere: ''
                    },
                    cValidate: 'required',
                    cName: 'ModuleCd',
                    cLabel: 'Module Code',
                    cOrder: 1,
                    cSelected: null,
                    cType: 'lookup',
                    cPageLevel: this.PageLevel,
                    cTabIndex: this.TabIndex,
                    cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_PageCd: {
                cValidate: 'min:1|max:60',
                cName: 'PageCd',
                cLabel: 'Page Code',
                //cLabelSize: 5,
                cOrder: 4,
                cKey: false,
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },            
            PI_TableName: {                
                dataLookUp: {
                        LookUpCd: 'GetLookupTable',
                        ColumnDB: 'name',
                        InitialWhere: '',
                        ParamWhere: ''
                    },
                    cValidate: 'required',
                    cName: 'TableName',
                    cLabel: 'Table Name',
                    cOrder: 1,
                    cSelected: null,
                    cType: 'lookup',
                    cPageLevel: this.PageLevel,
                    cTabIndex: this.TabIndex,
                    cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_LocationUrl: {
                cValidate: 'required|min:1|max:500',
                cName: 'LocationUrl',
                cLabel: 'Location Url (.aspx file)',
                //cLabelSize: 5,
                cOrder: 6,
                cKey: false,
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_PageUrl: {
                cValidate: 'min:1|max:60',
                cName: 'PageUrl',
                cLabel: 'Page Url (.ascx file)',
                //cLabelSize: 5,
                cOrder: 7,
                cKey: false,
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_UserType: {
                cId: 'rdUserType',
                cName: 'UserType',
                cRadioOptions: [
                            { text: 'Public', value: 'P' },
                            { text: 'Internal', value: 'I' },
                            { text: 'Obsolet', value: 'O' }
                        ],
                cLabel: 'User Type',
                //cLabelSize: 5,
                cOrder: 8,
                cKey: false,
                cRadioDefaultOption: '',
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_FilterByUserLevel: {
                cId: 'rdFilterByUserLevel',
                cName: 'FilterByUserLevel',
                cRadioOptions: [
                            { text: 'Yes', value: 'Y' },
                            { text: 'No', value: 'N' }
                        ],
                cLabel: 'Filter By User Level',
                //cLabelSize: 5,
                cOrder: 9,
                cKey: false,
                cRadioDefaultOption: '',
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_UserColumnName: {
                cValidate: 'min:2|max:60',
                cName: 'UserColumnName',
                cLabel: 'User Column Name',
                // cLabelSize: 5,
                cOrder: 10,
                cKey: false,
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            }
        }
    },
    methods: {
        M_HeaderPage(){
            return true
        },
        M_HeaderChildPage(){
            return true
        },
        M_New(){
            
            this.$parent.isPointer = false
            this.$parent.isDefault = true
            
            // this.clearForm('new')

            this.M_SS_PageMaster.TextMenu = ''
            // this.M_SS_PageMaster.PageMasterSeq = ''
            this.M_SS_PageMaster.ModuleCd = ''
            this.M_SS_PageMaster.PageCd = ''
            this.M_SS_PageMaster.TableName = ''
            this.M_SS_PageMaster.LocationUrl = ''
            this.M_SS_PageMaster.PageUrl = ''
            this.M_SS_PageMaster.UserType = ''
            this.M_SS_PageMaster.FilterByUserLevel = ''
            this.M_SS_PageMaster.UserColumnName = ''

            this.PageMasterSeqShow = false

            this.$nextTick().then(() => document.getElementById("TextMenu").focus())
        },
        M_Edit(){
            this.PageMasterSeqShow = true
            this.$nextTick().then(() => document.getElementById("TextMenu").focus())
        },
        M_Delete(data){
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                SubPortfolioCd:this.getDataUser().subportfolio_cd,
                PortfolioCd:this.getDataUser().portfolio_cd,
                LineNo: 0,
                Data: data
            }
            
            this.postJSONMulti( this.getUrlDeleteMulti(), param )
            .then(response => {
                console.log(response)
                this.responses = response
                if(response.error) {
                    this.alertError(response.message)
                }
                else {
                    this.alertSuccess("Deleting Data Successfully")
                    this.$parent.isDetail = false

                    this.$parent.EbData.Event = 'delete'
                    this.$parent.EbData.Key = ''
                    
                    EventBus.$emit('ToOpen', this.$parent.EbData)

                    // Refresh List
                    EventBus.$emit('ebGetList_' + this.PageLevel + '_' + this.TabIndex)
                }
            })
        },
        M_Save(){            
            this.M_SS_PageMaster.OptionSeq = this.getOptionSeq().OptionSeq
            this.M_SS_PageMaster.LineNo = 0

            if(this.$parent.state !== 'NEW'){
                this.M_SS_PageMaster.UserEdit = this.getDataUser().user_id
                this.M_SS_PageMaster.PageMasterSeq = this.PageMasterSeq
                this.M_SS_PageMaster.LastUpdateStamp = this.LastUpdateStamp                
                this.postJSON(this.getUrlUpdate(), this.M_SS_PageMaster)
                .then((response) => {
                    if(response == null) {
                        return
                    }

                    delete this.M_SS_PageMaster['UserEdit']
                    EventBus.$emit('ebGetList_' + this.PageLevel + '_' + this.TabIndex)
                    this.alertSuccess(response.Message)
                    .then(() => {
                        EventBus.$emit('ebToolbar', 'view')
                        EventBus.$emit('ebSaveSuccess_' + this.PageLevel + '_' + this.TabIndex)
                        delete this.M_SS_PageMaster['PageMasterSeq']
                        delete this.M_SS_PageMaster['LastUpdateStamp']
                    })
                })
            }
            else {
                this.$parent.isPointer= true
                this.$parent.isDefault= false
                this.M_SS_PageMaster.UserInput = this.getDataUser().user_id
                this.postJSON(this.getUrlInsert(), this.M_SS_PageMaster)
                .then((response) => {
                    if(response == null) {
                        return
                    }
                    delete this.M_SS_PageMaster['UserInput']
                    EventBus.$emit('ebGetList_' + this.PageLevel + '_' + this.TabIndex)
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
            this.$parent.state = 'UPDATE'
            this.$parent.EbData.PageLevel = this.PageLevel
            this.$parent.EbData.Event = 'rowClick'
            this.$parent.EbData.Key = record
            
            // if(this.getDataUser().user_type == 'I'){
            //     this.UserTypePublic = false
            //     this.UserTypeInternal = true
            // }else{
            //     this.UserTypePublic = true
            //     this.UserTypeInternal = false
            // }
            this.PageMasterSeqShow = true


            this.PageMasterSeq = record.PageMasterSeq
            this.LastUpdateStamp = record.LastUpdateStamp

            // this.M_SS_PageMaster.PageMasterSeq = data.PageMasterSeq
            
            EventBus.$emit('ToOpen', this.$parent.EbData)
            
            this.getDataBy(record)
            this.$parent.isDetail = true
        },
        rowLink: function(url){
            this.$refs.modalTest.show()
        },  
        getDataBy (record) {
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: 0,
                PageMasterSeq: record.PageMasterSeq,
                ModuleCd: record.ModuleCd
            }           

            this.postJSON( this.getUrlById(), param )
            .then( response => {
                // this.clearForm('edit')
                if(response == null) return
                var data = response.Data
                if(data.length > 0){
                    data = data[0]
                    this.$nextTick(() => {
                        this.M_SS_PageMaster.TextMenu = data.TextMenu                        
                        this.M_SS_PageMaster.ModuleCd = data.ModuleCd
                        this.M_SS_PageMaster.PageCd = data.PageCd
                        this.M_SS_PageMaster.TableName = data.TableName
                        this.M_SS_PageMaster.LocationUrl = data.LocationUrl
                        this.M_SS_PageMaster.PageUrl = data.PageUrl
                        this.M_SS_PageMaster.UserType = data.UserType                        
                        this.M_SS_PageMaster.FilterByUserLevel = data.FilterByUserLevel
                        this.M_SS_PageMaster.UserColumnName = data.UserColumnName
                        // this.M_SS_PageMaster.LastUpdateStamp = data.LastUpdateStamp

                        EventBus.$emit('ebSetValue' + this.PI_ModuleCd.cName + '_' + this.PageLevel + '_' + this.TabIndex, {data: data.ModuleCd, action: 'getByID'})
                        EventBus.$emit('ebSetValue' + this.PI_TableName.cName + '_' + this.PageLevel + '_' + this.TabIndex, {data: data.TableName, action: 'getByID'})
                    })
                    // this.M_SS_PageMaster.PageMasterSeq = data.PageMasterSeq
                    this.IEBy.PageMasterSeq = data.PageMasterSeq
                    this.IEBy.Input = data.user_input
                    this.IEBy.Edit = data.useredit
                }
            })
        },
        onChange (data) {
            var from = data.from
            //ModuleCd
            if (from == (this.PI_ModuleCd.cName + "_" + this.PageLevel + "_" + this.TabIndex)) {
                if(data.value && data.value.id !== ''){
                    this.M_SS_PageMaster.ModuleCd = data.value.id
                }
            }
            //TableName
            else if (from == (this.PI_TableName.cName + "_" + this.PageLevel + "_" + this.TabIndex)){
                if(data.value && data.value.id !== ''){
                    this.M_SS_PageMaster.TableName = data.value.id
                }
            }
        },

        // clearForm (parm) {
        //     this.M_SS_PageMaster.TextMenu = null            
        //     this.M_SS_PageMaster.ModuleCd = null
        //     EventBus.$emit('ebSetValue' + this.PI_ModuleCd.cName + '_' + this.PageLevel + '_' + this.TabIndex, {data: '', action: parm})
        //     this.M_SS_PageMaster.PageCd = null
        //     this.M_SS_PageMaster.TableName = null
        //     this.M_SS_PageMaster.LocationUrl = null
        //     this.M_SS_PageMaster.PageUrl = null
        //     this.M_SS_PageMaster.UserType = null
        //     this.M_SS_PageMaster.FilterByUserLevel = null
        //     this.M_SS_PageMaster.UserColumnName = null
            
        // }

    },
    beforeCreate: function () {
    },
    created: function() {
    },
    beforeMount: function() {
    },
    mounted: function() {
        this.hideSideBarMenu()
        EventBus.$emit('ebGetList_' + this.PageLevel + '_' + this.TabIndex)
        
        if(this.getDataUser().user_type == 'I'){
            this.UserTypePublic = false
            this.UserTypeInternal = true
        }else{
            this.UserTypePublic = true
            this.UserTypeInternal = false
        }
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
