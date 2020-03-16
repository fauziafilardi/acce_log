<template>
    <div>
        <ABSListVuex
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
                            <ABSinputTextVuex :prop="PI.TextMenu" v-model="M_SS_PageMaster.TextMenu"/>
                            <!-- <ABSinputTextVuex v-show="PageMasterSeqShow" :prop="PI.PageMasterSeq" v-model="M_SS_PageMaster.PageMasterSeq"/> -->
                            <b-row v-show="PageMasterSeqShow"> 
                                <b-col md="5" class="lbl-col-align">
                                    <label class="text-field-form"> Page master Seq :&nbsp;</label>
                                </b-col>
                                <b-col md="5" class="lbl-col-align" style="text-align:left !important;">
                                    <label class="text-field-form" style="padding-left: 0px !important;">{{IEBy.PageMasterSeq}}</label>
                                </b-col>
                            </b-row>
                            
                            <ABSInputSelectVuex @change="onChange" :prop="PI.ModuleCd" v-model="M_SS_PageMaster.ModuleCd"/>
                            <ABSinputTextVuex :prop="PI.PageCd" v-model="M_SS_PageMaster.PageCd"/>
                            <ABSInputSelectVuex @change="onChange" :prop="PI.TableName" v-model="M_SS_PageMaster.TableName"/>
                            <ABSinputTextVuex :prop="PI.LocationUrl" v-model="M_SS_PageMaster.LocationUrl"/>
                            <ABSinputTextVuex :prop="PI.PageUrl" v-model="M_SS_PageMaster.PageUrl"/>
                            <ABSinputRadioButtonVuex :prop="PI.UserType" v-model="M_SS_PageMaster.UserType"/>
                            <ABSinputRadioButtonVuex :prop="PI.FilterByUserLevel" v-model="M_SS_PageMaster.FilterByUserLevel"/>
                            <ABSinputTextVuex :prop="PI.UserColumnName" v-model="M_SS_PageMaster.UserColumnName"/>
                        </b-form>
                    </b-col>
                    <b-col v-show="UserTypePublic" md="5" id="col-left" class="bColMasterForm">
                        <b-form :data-vv-scope="'FormScope_' + PageLevel + '_' + TabIndex" :data-vv-value-path="'FormScope_' + PageLevel + '_' + TabIndex">
                            <ABSinputTextVuex :prop="PI.TextMenu" v-model="M_SS_PageMaster.TextMenu"/>
                            <!-- <ABSinputTextVuex v-show="PageMasterSeqShow" :prop="PI.PageMasterSeq" v-model="M_SS_PageMaster.PageMasterSeq"/> -->
                            <b-row v-show="PageMasterSeqShow"> 
                                <b-col md="5" class="lbl-col-align">
                                    <label class="text-field-form"> Page master Seq :&nbsp;</label>
                                </b-col>
                                <b-col md="5" class="lbl-col-align" style="text-align:left !important;">
                                    <label class="text-field-form" style="padding-left: 0px !important;">{{IEBy.PageMasterSeq}}</label>
                                </b-col>
                            </b-row>
                            <ABSinputRadioButtonVuex :prop="PI.FilterByUserLevel" v-model="M_SS_PageMaster.FilterByUserLevel"/>
                        </b-form>
                    </b-col>
                </b-row>
            </b-collapse>
        </div>
    </div>
</template>

<script>


export default {
    props: {PageLevel: '', TabIndex: '', data: ''},
    data() {
        return {
            PageMasterSeq: null,
            LastUpdateStamp: null,
            propList: {
                initialWhere: "",
                LineNo: this.$parent.data.page_order,
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

            PI: {
                TextMenu: {
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
                ModuleCd: {                
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
                PageCd: {
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
                TableName: {
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
                LocationUrl: {
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
                PageUrl: {
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
                UserType: {
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
                FilterByUserLevel: {
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
                UserColumnName: {
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
            },
            PTanalysis: {
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cPageMasterSeq: this.data.PageMasterSeq,
                cFormPageNo: this.data.PageOrder
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
            this.$store.commit('setEventStatus', 'ONSEARCHENTER')
            this.$store.commit('setLevel',this.PageLevel)
            this.$parent.isDetail = false
            this.FormToMasterPage().ValidasiPage()
            this.FormToABSList().doGetList(data,'eb_getList')
        },
        M_Post(){

        },
        M_Refresh(){

        },
        M_New(){
            this.$parent.state = 'NEW'

            this.M_SS_PageMaster.TextMenu = ''
            this.M_SS_PageMaster.ModuleCd = ''
            this.M_SS_PageMaster.PageCd = ''
            this.M_SS_PageMaster.TableName = ''
            this.M_SS_PageMaster.LocationUrl = ''
            this.M_SS_PageMaster.PageUrl = ''
            this.M_SS_PageMaster.UserType = ''
            this.M_SS_PageMaster.FilterByUserLevel = ''
            this.M_SS_PageMaster.UserColumnName = ''

            this.PageMasterSeqShow = false

            this.FormToMasterPage().ValidasiPage()
            this.$parent.isDetail = true

            this.$nextTick().then(() => document.getElementById("TextMenu").focus())
        },
        M_Edit(){
            this.PageMasterSeqShow = true
            this.$nextTick().then(() => document.getElementById("TextMenu").focus())
        },
        M_Delete(){
            var data = this.FormToABSList().getRowSelected()
            var dataDelete = []

            data.forEach((value) => {
                dataDelete.push({
                    PageMasterSeq: value.PageMasterSeq,
                    LastUpdateStamp: value.LastUpdateStamp,
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
            this.M_SS_PageMaster.OptionSeq = this.getOptionSeq().OptionSeq
            this.M_SS_PageMaster.LineNo = this.$parent.data.page_order

            if(this.$store.getters.getStatus.toUpperCase() !== 'NEW'){
                this.M_SS_PageMaster.UserEdit = this.getDataUser().user_id
                this.M_SS_PageMaster.PageMasterSeq = this.PageMasterSeq
                this.M_SS_PageMaster.LastUpdateStamp = this.LastUpdateStamp
                this.postJSON(this.getUrlUpdate(), this.M_SS_PageMaster)
                .then((response) => {
                    if(response == null) {
                        return
                    }

                    delete this.M_SS_PageMaster['UserEdit']
                    this.FormToABSList().doGetList('','eb_getList')

                    this.alertSuccess(response.Message)
                    .then(() => {
                        this.getToolbar().setButton(false)
                        this.$store.commit('setListDisable', false)
                        this.$store.commit('setStatus', 'view')
                        this.FormToABSList().doGetList('','eb_getList')

                        delete this.M_SS_PageMaster['PageMasterSeq']
                        delete this.M_SS_PageMaster['LastUpdateStamp']
                    })
                })
            }
            else {
                this.M_SS_PageMaster.UserInput = this.getDataUser().user_id
                // alert('save api')
                // console.log(this.M_SS_PageMaster)
                // delete this.M_SS_PageMaster['LastUpdateStamp']
                this.postJSON(this.getUrlInsert(), this.M_SS_PageMaster)
                .then((response) => {
                    if(response == null) {
                        return
                    }
                    delete this.M_SS_PageMaster['UserInput']
                    this.FormToABSList().doGetList('','eb_getList')

                    this.alertSuccess(response.Message)
                    .then(() => {
                        this.getToolbar().setButton(false)
                        this.$store.commit('setListDisable', false)
                        this.$store.commit('setStatus', 'view')
                        this.FormToABSList().doGetList('','eb_getList')
                    })
                })
            }
            this.FormToMasterPage().ValidasiPage()
        
        },
        paramFromParent(){

        },
        rowClicked (record, index) {
            this.$parent.state = 'UPDATE'
            this.$store.commit('SetPage1Data', record)
            this.$store.commit('setEventStatus', 'rowClick')
            this.$store.commit('setLevel',this.PageLevel)
            this.getDataBy(record)
            this.$parent.isDetail = true

            this.PageMasterSeqShow = true

            this.PageMasterSeq = record.PageMasterSeq
            this.LastUpdateStamp = record.LastUpdateStamp

            this.FormToMasterPage().ValidasiPage()
        },
        rowLink: function(url){
            this.$refs.modalTest.show()
        },
        getDataBy (record) {
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
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

                        EventBus.$emit('ebSetValue' + this.PI.ModuleCd.cName + '_' + this.PageLevel + '_' + this.TabIndex, {data: data.ModuleCd, action: 'getByID'})
                        EventBus.$emit('ebSetValue' + this.PI.TableName.cName + '_' + this.PageLevel + '_' + this.TabIndex, {data: data.TableName, action: 'getByID'})
                    })
                    
                    this.IEBy.PageMasterSeq = data.PageMasterSeq
                    this.IEBy.Input = data.user_input
                    this.IEBy.Edit = data.useredit
                }
            })
        },
        onChange (data) {
           var from = data.from
            //ModuleCd
            if (from == (this.PI.ModuleCd.cName + "_" + this.PageLevel + "_" + this.TabIndex)) {
                if(data.value && data.value.id !== ''){
                    this.M_SS_PageMaster.ModuleCd = data.value.id
                }
            }
            //TableName
            else if (from == (this.PI.TableName.cName + "_" + this.PageLevel + "_" + this.TabIndex)){
                if(data.value && data.value.id !== ''){
                    this.M_SS_PageMaster.TableName = data.value.id
                }
            }
        },
    },
    beforeCreate: function () {
    },
    created: function() {
    },
    beforeMount: function() {
    },
    mounted: function() {
        this.hideSideBarMenu()
        this.FormToABSList().doGetList('','eb_getList')
        
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
