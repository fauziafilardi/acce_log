<template>
    <div>
        <!-- <b-modal id="modalModulAccessEntry" title="Module Access Entry" size="lg" ref="modalModulAccessEntry" class="modalCustomABS">
            <b-row>
                <b-col sm="6">
                    <ABSProcessinputText :prop="PI.ShortName" v-model="M_SS_ModuleAccess.ShortName"/>
                    <ABSProcessinputText :prop="PI.MenuName" v-model="M_SS_ModuleAccess.MenuName"/>
                </b-col>
            </b-row>
            <div slot="modal-footer" class="w-100">
                <div style="padding-right:20px;">
                    <b-btn size="sm" class="float-right btnModal__btnCancel" @click="$refs.modalColumn.hide()">
                    Cancel
                    </b-btn>       
                    <b-btn size="sm" class="float-right btnModal__btnOK" variant="primary" @click="modalColumnHandleOk">
                    OK
                    </b-btn>       
                </div>         
            </div>
        </b-modal>

        <b-modal id="modalEventAccess" title="Event" size="lg" ref="modalEventAccess" class="modalCustomABS">
            <b-row>
                <b-col sm="6">
                    <ABSProcessinputText :prop="PI.TextMenu" v-model="M_SS_ModuleAccess.TextMenu"/>                    
                </b-col>
            </b-row>
            <div slot="modal-footer" class="w-100">
                <div style="padding-right:20px;">
                    <b-btn size="sm" class="float-right btnModal__btnCancel" @click="$refs.modalColumn.hide()">
                    Cancel
                    </b-btn>       
                    <b-btn size="sm" class="float-right btnModal__btnOK" variant="primary" @click="modalColumnHandleOk">
                    OK
                    </b-btn>       
                </div>         
            </div>
        </b-modal> -->

        <b-row style="padding-top:10px; padding-right: 10px; padding-left: 10px; padding-bottom: 10px; !important;">
            <b-col sm="4">
                <!-- <ABSButton @click="openModalModulAccessEntry" icon="plus" text="Add" classButton="btnList__btnPrimary" classIcon="icon-style-1"/>
                <ABSButton icon="trash" text="Delete" classButton="btnList__btnPrimary" classIcon="icon-style-2"/> -->
                <div v-if="moduleAccessEntry.length > 0">
                    <ABSMultiSelect
                    v-model="moduleAccessEntrySelected"
                    :options="moduleAccessEntry"
                    size=10
                    class="selectCustom"
                    style="margin-top:5px !important;"
                    />
                </div>
                <div v-else> <b> No Additional Properties </b> </div>
            </b-col>
            <!-- <b-col sm="4">
                <ABSButton @click="openModalEventAccess" icon="plus" text="Add" classButton="btnList__btnPrimary" classIcon="icon-style-1"/>
                <ABSButton icon="trash" text="Delete" classButton="btnList__btnPrimary" classIcon="icon-style-2"/>
                <ABSMultiSelect
                  v-model="eventAccessSelected"
                  :options="eventAccessEntry"
                  size=10
                  class="selectCustom"
                  style="margin-top:5px !important;"
                />
            </b-col>
            <b-col sm="4">
                <ABSButton icon="plus" text="Set" classButton="btnList__btnPrimary" classIcon="icon-style-1"/>
                <ABSButton icon="trash" text="Delete" classButton="btnList__btnPrimary" classIcon="icon-style-2"/>
                <b-form-select multiple :select-size="4" v-model="availableColumnSelected" :options="options" class="mb-3 selectCustom">
                </b-form-select>
            </b-col> -->
        </b-row>        
    </div>
</template>

<script>
import {EventBus} from '../../../../main'

export default {
    props: {PageLevel: '', TabIndex: '', data: ''},
    data() {
        return {
            moduleAccessEntrySelected: [],
            moduleAccessEntry: [],
            eventAccessSelected: [],
            eventAccessEntry: [],            
            // PageMasterSeq: null,
            // LastUpdateStamp: null,
            propList: {
                initialWhere: "",
                LineNo: 0,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex
            },
            M_SS_ModuleAccess: {
                ShortName: null,
                MenuName: null
            },
            IEBy: {Input: '', Edit: ''},
            PI: {
                ShortName: {
                    cValidate: 'required|min:2|max:60',
                    cName: 'ShortName',
                    cLabel: 'Short Name',
                    // cLabelSize: 5,
                    cOrder: 1,
                    cKey: true,
                    cPageLevel: this.PageLevel,
                    cTabIndex: this.TabIndex,
                    cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
                },
                MenuName: {
                    cValidate: 'required|min:2|max:60',
                    cName: 'MenuName',
                    cLabel: 'Menu Name',
                    // cLabelSize: 5,
                    cOrder: 2,
                    cKey: true,
                    cPageLevel: this.PageLevel,
                    cTabIndex: this.TabIndex,
                    cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
                },
                TextMenu: {
                    cValidate: 'required|min:2|max:60',
                    cName: 'TextMenu',
                    cLabel: 'Event Name',
                    // cLabelSize: 5,
                    cOrder: 3,
                    cKey: true,
                    cPageLevel: this.PageLevel,
                    cTabIndex: this.TabIndex,
                    cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
                }
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
            this.$parent.isDefault = true
            
            // this.clearForm('new')

            this.M_SS_ModuleAccess.ShortName = ''
            this.M_SS_ModuleAccess.MenuName = ''

            // this.$nextTick().then(() => document.getElementById("TextMenu").focus())
        },
        M_Edit(){            
            // this.$nextTick().then(() => document.getElementById("TextMenu").focus())
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
            this.M_SS_ModuleAccess.OptionSeq = this.getOptionSeq().OptionSeq
            this.M_SS_ModuleAccess.LineNo = 0

            if(this.$parent.state !== 'NEW'){
                this.M_SS_ModuleAccess.UserEdit = this.getDataUser().user_id
                this.M_SS_ModuleAccess.PageMasterSeq = this.PageMasterSeq
                this.M_SS_ModuleAccess.LastUpdateStamp = this.LastUpdateStamp                
                this.postJSON(this.getUrlUpdate(), this.M_SS_ModuleAccess)
                .then((response) => {
                    if(response == null) {
                        return
                    }

                    delete this.M_SS_ModuleAccess['UserEdit']
                    EventBus.$emit('ebGetList_' + this.PageLevel + '_' + this.TabIndex)
                    this.alertSuccess(response.Message)
                    .then(() => {
                        EventBus.$emit('ebToolbar', 'view')
                        EventBus.$emit('ebSaveSuccess_' + this.PageLevel + '_' + this.TabIndex)
                        delete this.M_SS_ModuleAccess['PageMasterSeq']
                        delete this.M_SS_ModuleAccess['LastUpdateStamp']
                    })
                })
            }
            else {
                this.$parent.isPointer= true
                this.$parent.isDefault= false
                this.M_SS_ModuleAccess.UserInput = this.getDataUser().user_id
                this.postJSON(this.getUrlInsert(), this.M_SS_ModuleAccess)
                .then((response) => {
                    if(response == null) {
                        return
                    }
                    delete this.M_SS_ModuleAccess['UserInput']
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
            
            this.PageMasterSeq = record.PageMasterSeq
            this.LastUpdateStamp = record.LastUpdateStamp
            
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
                        this.M_SS_ModuleAccess.ShortName = data.ShortName                        
                        this.M_SS_ModuleAccess.MenuName = data.MenuName
                        this.M_SS_ModuleAccess.PageCd = data.PageCd
                        this.M_SS_ModuleAccess.TableName = data.TableName
                        this.M_SS_ModuleAccess.LocationUrl = data.LocationUrl
                        this.M_SS_ModuleAccess.PageUrl = data.PageUrl
                        this.M_SS_ModuleAccess.UserType = data.UserType                        
                        this.M_SS_ModuleAccess.FilterByUserLevel = data.FilterByUserLevel
                        this.M_SS_ModuleAccess.UserColumnName = data.UserColumnName
                        // this.M_SS_ModuleAccess.LastUpdateStamp = data.LastUpdateStamp
                        
                    })
                    // this.M_SS_ModuleAccess.PageMasterSeq = data.PageMasterSeq

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
                    this.M_SS_ModuleAccess.ModuleCd = data.value.id
                }
            }
            //TableName
            else if (from == (this.PI_TableName.cName + "_" + this.PageLevel + "_" + this.TabIndex)){   
                if(data.value && data.value.id !== ''){
                    this.M_SS_ModuleAccess.TableName = data.value.id
                }
            }
        },
        openModalModulAccessEntry () {
            this.$refs.modalModulAccessEntry.show()
            // this.M_New()
            this.$nextTick().then(() => document.getElementById("ShortName").focus())
        },
        openModalEventAccess () {
            this.$refs.modalEventAccess.show()
            this.$nextTick().then(() => document.getElementById("TextMenu").focus())
        },
        getDataModuleAccess(){
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                UserId: this.getDataUser().user_id,
                PortfolioCd: this.getDataUser().portfolio_cd,                
                LineNo: 0,
                CurrentPage: 1,
                PerPage: 5,
                ParamWhere: '',
                initialWhere: '',
                ShortField: ''
            }
            console.log(param)
            this.postEncode( this.getUrlDataList(), param )
            .then( response => {
                // this.clearForm('edit')
                if(response == null) return
                var data = response.Data
                if(data.length > 0){
                    data = data[0]
                    console.log(data)
                    this.$nextTick(() => {

                        moduleAccessEntrySelected.forEach((val, idx) => {
                            moduleAccessEntry.push({
                                value: idx,
                                key: val,
                                text: val
                            })
                        })

                        // this.M_SS_ModuleAccess.ShortName = data.ShortName                        
                        // this.M_SS_ModuleAccess.MenuName = data.MenuName
                        
                        // this.M_SS_ModuleAccess.PageCd = data.PageCd
                        // this.M_SS_ModuleAccess.TableName = data.TableName
                        // this.M_SS_ModuleAccess.LocationUrl = data.LocationUrl
                        // this.M_SS_ModuleAccess.PageUrl = data.PageUrl
                        // this.M_SS_ModuleAccess.UserType = data.UserType                        
                        // this.M_SS_ModuleAccess.FilterByUserLevel = data.FilterByUserLevel
                        // this.M_SS_ModuleAccess.UserColumnName = data.UserColumnName
                        // this.M_SS_ModuleAccess.LastUpdateStamp = data.LastUpdateStamp
                        
                    })
                    // this.M_SS_ModuleAccess.PageMasterSeq = data.PageMasterSeq

                    // this.IEBy.PageMasterSeq = data.PageMasterSeq
                    // this.IEBy.Input = data.user_input
                    // this.IEBy.Edit = data.useredit

                }
            })


        },
        getDataEventAccess(){

        }


        // clearForm (parm) {
        //     this.M_SS_ModuleAccess.TextMenu = null            
        //     this.M_SS_ModuleAccess.ModuleCd = null
        //     EventBus.$emit('ebSetValue' + this.PI_ModuleCd.cName + '_' + this.PageLevel + '_' + this.TabIndex, {data: '', action: parm})
        //     this.M_SS_ModuleAccess.PageCd = null
        //     this.M_SS_ModuleAccess.TableName = null
        //     this.M_SS_ModuleAccess.LocationUrl = null
        //     this.M_SS_ModuleAccess.PageUrl = null
        //     this.M_SS_ModuleAccess.UserType = null
        //     this.M_SS_ModuleAccess.FilterByUserLevel = null
        //     this.M_SS_ModuleAccess.UserColumnName = null
            
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
        this.getDataModuleAccess()
        // EventBus.$emit('ebGetList_' + this.PageLevel + '_' + this.TabIndex)
        
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
