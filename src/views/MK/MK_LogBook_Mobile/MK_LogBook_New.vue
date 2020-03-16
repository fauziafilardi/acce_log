<template>
    <div class="height--full" id="entryPage">
        <div class="header--content" style="margin-top: 32px !important;margin-left:0px !important;margin-right:0px !important;position: fixed;width: 100%;">              
            <div class="header--content__title">
                <b-row class="header-toolbar">
                    <b-col sm="12">
                        Log Book | 
                        <ABSButton
                            v-show="(editStatus == false && isCanAdd) || (editStatus == true && isCanEdit)"
                            text="Save"
                            icon="save"
                            classButton="button button--save"
                            classIcon="icon-style-1"
                            @click="doSave"
                        />

                        <ABSButton
                            v-show="!isCanEdit"
                            text="Back"
                            icon="chevron-left"
                            classButton="button-cancel button--cancelnew"
                            classIcon="icon-style-1"
                            @click="onGoBack"
                            :styleButton="{color: 'black'}"
                        />

                        <ABSButton
                            v-show="isCanEdit"
                            text="Cancel"
                            icon="chevron-left"
                            classButton="button-cancel button--cancelnew"
                            classIcon="icon-style-1"
                            @click="onGoBack"
                            :styleButton="{color: 'black'}"
                        />
                    </b-col>
                </b-row>
            </div>
        </div>
        <div class="content-app-form__body">
            <div class="block-scope-mobile" style="top:13%;margin:0px !important;padding-top:15px;">
                <b-row style="margin: 0px !important;">
                    <b-col md="12" class="bColMasterForm" style="padding: 5px !important">
                        <div class="card" style="font-size:11px; border:0px !important;">
                            <b-form :data-vv-scope="'FormScope_' + 1 + '_' + 1" :data-vv-value-path="'FormScope_' + 1 + '_' + 1">
                                <b-row style="padding-left:10px;">
                                    <b-col md="6" id="col-left">
                                        <b-row>
                                            <b-col md="12">
                                                <ABSinputTextVuex :prop="PI_log_book_no" v-model="M_MK_LogBookH.log_book_no"  ref="ref_log_book_no"/>
                                            </b-col>
                                        </b-row>
                                        <b-row>
                                            <b-col md="12">
                                                <ABSinputDateVuex @input="Onlog_book_dateChange" :prop="PI_log_book_date" v-model="M_MK_LogBookH.log_book_date"  ref="ref_log_book_date" />
                                            </b-col>
                                        </b-row>
                                        <b-row>
                                            <b-col md="12">
                                                <ABSInputSelectListMobile @change="Onmk_follow_up_type_idChange" :prop="PI_mk_follow_up_type_id" :value="M_MK_LogBookH.mk_follow_up_type_id" :label="M_MK_LogBookH.mk_follow_up_type_idLabel" ref="ref_mk_follow_up_type_id"/>
                                            </b-col>
                                        </b-row>
                                        <b-row>
                                            <b-col md="12">
                                                <ABSInputSelectListMobile @change="Oncm_contact_idChange" :prop="PI_cm_contact_id" :value="M_MK_LogBookH.cm_contact_id" :label="M_MK_LogBookH.cm_contact_idLabel" ref="ref_cm_contact_id"/>
                                            </b-col>
                                        </b-row>
                                        <b-row>
                                            <b-col md="12">
                                                <ABSInputSelectListMobile @change="Onmk_contact_status_h_idChange" :prop="PI_mk_contact_status_h_id" :value="M_MK_LogBookH.mk_contact_status_h_id" :label="M_MK_LogBookH.mk_contact_status_h_idLabel" ref="ref_mk_contact_status_h_id"/>
                                            </b-col>
                                        </b-row>
                                        <b-row>
                                            <b-col md="12">
                                                <ABSinputTextVuex :prop="PI_reason" v-model="M_MK_LogBookH.reason"  ref="ref_reason"/>
                                            </b-col>
                                        </b-row>
                                        <b-row>
                                            <b-col md="12">
                                                <ABSTextAreaVuex @input="OnremarkChange" :prop="PI_remark" v-model="M_MK_LogBookH.remark"  ref="ref_remark" />
                                            </b-col>
                                        </b-row>
                                    </b-col>
                                </b-row>
                            </b-form>
                        </div>
                    </b-col>
                </b-row>
                <hr style="margin-bottom:0px !important;">
                <ABSTabsVuexNew ref="tab" :listTab="ListTab" :tabPath="'views/MK/MK_LogBook_Mobile'" :PageLevel="2" />
            </div>
        </div>
    </div>
</template>
<script>
    export default {
    props: {PageLevel: '', TabIndex: '', data: ''},
    data () {
        return {
            ListTab: [
                {
                    query_name: 'Log Book Detail',
                    url: 'MK_LogBook_Detail2_New',
                    mk_log_book_h_id: null
                }
            ],

            currentPage: 1,
            perPage: 10,
            sort: 'time_edit DESC',
            sourceField: '',
            paramView: '',
            search: '',

            editStatus: false,

            FormType: "List",
            Module: "MK",
            OptionUrl: "MK_LogBook",
            
            cm_running_code_h_id_log_book: null,
            
            M_MK_LogBookH: {
                mk_log_book_tes_h_id: 0,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                log_book_no: '',
                log_book_date: '',
                mk_follow_up_type_id: 0,
                follow_up_type_cd: '',
                mk_follow_up_type_id_descs: '',
                cm_contact_id: 0,
                contact_id: '',
                cm_contact_id_descs: '',
                mk_contact_status_h_id: 0,
                contact_status_cd: '',
                mk_contact_status_h_id_descs: '',
                reason: '',
                remark: '',
                row_id: 0,
                lastupdatestamp: 0,
                time_edit: '',
            },
            PI_log_book_no: { 
                cValidate :'required|max:20', 
                cName: 'log_book_no', 
                cLabel: 'Log Book No', 
                cLabelSize: 4, 
                cOrder: 1, 
                cKey: false, 
                cType: 'text',
                cVisible: false, 
                cProtect: false, 
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
            },
            PI_log_book_date: { 
                cValidate :'required', 
                cName: 'log_book_date', 
                cLabel: 'Log Book Date', 
                cLabelSize: 4, 
                cOrder: 2, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
            },
            PI_mk_follow_up_type_id: { 
                dataLookUp: { 
                    LookUpCd: 'GetFollowUpType'    , 
                    ColumnDB: 'follow_up_type_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'follow_up_type_cd,descs,time_edit' 
                        }, 
                cValidate :'', 
                cName: 'mk_follow_up_type_id', 
                cLabel: 'Follow Up Type', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 3, 
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
                cMasterUrl: 'MK/MK_FollowUpType' ,
                cDisplayColumn: 'follow_up_type_cd,descs,time_edit' ,
            },
            PI_cm_contact_id: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMContact'    , 
                    ColumnDB: 'contact_id'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'contact_id,name' 
                        }, 
                cValidate :'', 
                cName: 'cm_contact_id', 
                cLabel: 'Contact', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 4, 
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
                cMasterUrl: '' ,
                cDisplayColumn: 'contact_id,name' ,
            },
            PI_mk_contact_status_h_id: { 
                dataLookUp: { 
                    LookUpCd: 'GetContactStatusH'    , 
                    ColumnDB: 'contact_status_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'contact_status_cd, descs, time_edit' 
                        }, 
                cValidate :'', 
                cName: 'mk_contact_status_h_id', 
                cLabel: 'Customer Status', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 5, 
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
                cMasterUrl: '' ,
                cDisplayColumn: 'contact_status_cd, descs, time_edit' ,
            },
            PI_reason: { 
                cValidate :'max:255', 
                cName: 'reason', 
                cLabel: 'Reason', 
                cLabelSize: 4, 
                cOrder: 6, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
            },
            PI_remark: { 
                cValidate :'', 
                cName:'remark', 
                cLabel:'Remark', 
                cLabelSize: 4, 
                cOrder:7, 
                cKey: false, 
                cDefault: '', 
                cProtect: false, 
                cVisible: true, 
                cResize: false, 
                cReadOnly: false, 
                cRows: 3, 
                cMaxRows: 3, 
                cSize: 'md', 
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1, 
            }
        }
    },
    computed : {
        ParamFromList() {
            return this.$route.params
        },
        isCanAdd() {
            var canadd = this.ParamFromList.Option ? (this.ParamFromList.Option.add_status == "1") : true
            return canadd
        },
        isCanEdit() {
            var canedit = this.ParamFromList.Option ? (this.ParamFromList.Option.edit_status == "1") : true
            return canedit
        }
    },
    methods: {
        goToTab (index) {
            return this.$refs.tab.$children[0].$children[index].$children[0].$children[0]
        },
        GetMKSpecification () {
          var param = {
            subportfolio_cd: this.getDataUser().subportfolio_cd,
            module_cd: this.Module
          }

          this.FnDynamicSpec(param)
          .then(ress => {
            if (ress == null) {
              this.PI_log_book_no.cProtect = false
              this.M_MK_LogBookH.log_book_no= ""
              this.$refs.ref_log_book_no.focus()
            }
            else {
              var data = ress.Data[0]
              this.cm_running_code_h_id_log_book = data.cm_running_code_h_id_log_book
              if (this.cm_running_code_h_id_log_book && this.cm_running_code_h_id_log_book !== "" && this.cm_running_code_h_id_log_book > 0) {
                this.PI_log_book_no.cProtect = true
                this.M_MK_LogBookH.log_book_no= "(auto)"
              }
            }
          })
        },
        Onlog_book_dateChange (data) {
            this.M_MK_LogBookH.log_book_date = data
        },
        Onmk_follow_up_type_idChange (data) {
          this.$nextTick(() => {
            this.M_MK_LogBookH.mk_follow_up_type_id = data.id
            this.M_MK_LogBookH.mk_follow_up_type_idLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{mk_follow_up_type_id}
            }
          })
          this.$forceUpdate()
        },
        Oncm_contact_idChange (data) {
          this.$nextTick(() => {
            this.M_MK_LogBookH.cm_contact_id = data.id
            this.M_MK_LogBookH.cm_contact_idLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{cm_contact_id}
            }
          })
          this.$forceUpdate()
        },
        Onmk_contact_status_h_idChange (data) {
          this.$nextTick(() => {
            this.M_MK_LogBookH.mk_contact_status_h_id = data.id
            this.M_MK_LogBookH.mk_contact_status_h_idLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{mk_contact_status_h_id}
            }
          })
          this.$forceUpdate()
        },
        OnremarkChange(data) {},
        doSave() {
            var scopeForm = "FormScope_" + 1 + "_" + 1
            this.$validator._base.validateAll(scopeForm).then((result) => {
                if (!result) return
                this.alertConfirmation("Are You Sure Want To Save This Data ?")
                .then(ress => {
                    if (ress.value) {
                        if (this.editStatus == true) {
                            this.$validator.errors.clear(scopeForm)
                            this.M_Update()
                        }
                        else {
                            this.$validator.errors.clear(scopeForm)
                            this.M_Insert()
                        }
                    }
                })
            })
        },
        M_Insert() {
            //set data Detail
            var dataHeader = null
            var dataTab1 = null

            for (let a = 0; a < this.ListTab.length; a++) {
                if (a == 0) {
                    // Tab 1
                    var dataTab = this.goToTab(a).DataLogBookDetail
                    var param = []
                    for (let i = 0; i < dataTab.length; i++) {
                        param.push({
                            _Method_: "SAVE",
                            _LineNo_: (a+1),
                            mk_log_book_h_id: "A_Insert.row_id_output",
                            subportfolio_cd: this.getDataUser().subportfolio_cd,
                            next_schedule_date: dataTab[i].next_schedule_date,
                            mk_follow_up_type_id: dataTab[i].mk_follow_up_type_id,
                            descs: dataTab[i].descs,
                            user_input: this.getDataUser().user_id
                        })
                    }

                    dataTab1 = param
                }
                else if (a == 1) {
                    // Tab 2
                }
            }

            //action save
            if (this.cm_running_code_h_id_log_book && this.cm_running_code_h_id_log_book != "" && this.cm_running_code_h_id_log_book > 0) {
                var param = {
                    OptionFunctionCd: "GenerateRunningCodeById",
                    ModuleCd: "CM",
                    subportfolio_cd: this.getDataUser().subportfolio_cd,
                    running_id: this.cm_running_code_h_id_log_book,
                    user_input: this.getDataUser().user_id,
                    date: this.getToday()
                }

                this.FnDynamicFunction(param)
                .then(ress => {
                    if (ress == null) return
                    var data = ress.Data[0]
                    this.M_MK_LogBookH.log_book_no = data._generate_running_code_id

                    dataHeader = {
                        _Method_: "SAVE",
                        _LineNo_: 0,
                        subportfolio_cd: this.getDataUser().subportfolio_cd,
                        log_book_no: this.M_MK_LogBookH.log_book_no,
                        log_book_date: this.M_MK_LogBookH.log_book_date == '' || this.M_MK_LogBookH.log_book_date == null ? 'NULL' : this.M_MK_LogBookH.log_book_date,
                        mk_follow_up_type_id: this.M_MK_LogBookH.mk_follow_up_type_id == '' || this.M_MK_LogBookH.mk_follow_up_type_id == null ? 'NULL' : this.M_MK_LogBookH.mk_follow_up_type_id,
                        cm_contact_id: this.M_MK_LogBookH.cm_contact_id == '' || this.M_MK_LogBookH.cm_contact_id == null ? 'NULL' : this.M_MK_LogBookH.cm_contact_id,
                        mk_contact_status_h_id: this.M_MK_LogBookH.mk_contact_status_h_id == '' || this.M_MK_LogBookH.mk_contact_status_h_id == null ? 'NULL' : this.M_MK_LogBookH.mk_contact_status_h_id,
                        reason: this.M_MK_LogBookH.reason,
                        remark: this.M_MK_LogBookH.remark,
                        user_input: this.getDataUser().user_id
                    }

                    var data = [{
                        A_Insert: dataHeader,
                        B_Looping: dataTab1
                    }]

                    var param = {
                        OptionUrl: this.OptionUrl,
                        LineNo: 0,
                        Data: data
                    }

                    this.postJSONMulti(this.getUrlMultiV2(this.getUrlProsesDataPostMulti()), param)
                    .then((response) => {
                        if(response == null) {
                            this.$router.go(-1)
                            // this.$router.replace({ name: 'MK_LogBook_List2', params: { Option: this.ParamFromList.Option } })
                        }
                        else {
                            this.alertSuccess("Save Data Has Been Successfull")
                            .then(ress => {
                                this.$router.go(-1)
                            })
                            // this.$router.replace({ name: 'MK_LogBook_List2', params: { Option: this.ParamFromList.Option } })
                        }
                    })
                })
            }
            else {
                dataHeader = {
                    _Method_: "SAVE",
                    _LineNo_: 0,
                    subportfolio_cd: this.getDataUser().subportfolio_cd,
                    log_book_no: this.M_MK_LogBookH.log_book_no,
                    log_book_date: this.M_MK_LogBookH.log_book_date == '' || this.M_MK_LogBookH.log_book_date == null ? 'NULL' : this.M_MK_LogBookH.log_book_date,
                    mk_follow_up_type_id: this.M_MK_LogBookH.mk_follow_up_type_id == '' || this.M_MK_LogBookH.mk_follow_up_type_id == null ? 'NULL' : this.M_MK_LogBookH.mk_follow_up_type_id,
                    cm_contact_id: this.M_MK_LogBookH.cm_contact_id == '' || this.M_MK_LogBookH.cm_contact_id == null ? 'NULL' : this.M_MK_LogBookH.cm_contact_id,
                    mk_contact_status_h_id: this.M_MK_LogBookH.mk_contact_status_h_id == '' || this.M_MK_LogBookH.mk_contact_status_h_id == null ? 'NULL' : this.M_MK_LogBookH.mk_contact_status_h_id,
                    reason: this.M_MK_LogBookH.reason,
                    remark: this.M_MK_LogBookH.remark,
                    user_input: this.getDataUser().user_id
                }

                var data = [{
                    A_Insert: dataHeader,
                    B_Looping: dataTab1
                }]

                var param = {
                    OptionUrl: this.OptionUrl,
                    LineNo: 0,
                    Data: data
                }

                this.postJSONMulti(this.getUrlMultiV2(this.getUrlProsesDataPostMulti()), param)
                .then((response) => {
                    if(response == null) {
                        this.$router.go(-1)
                        // this.$router.replace({ name: 'MK_LogBook_List2', params: { Option: this.ParamFromList.Option } })
                    }
                    else {
                        this.alertSuccess("Save Data Has Been Successfull")
                        .then(ress => {
                            this.$router.go(-1)
                        })
                        // this.$router.replace({ name: 'MK_LogBook_List2', params: { Option: this.ParamFromList.Option } })
                    }
                })
            }
        },
        M_Update() {
            //set data Detail
            var dataHeader = null
            var dataTab1 = null

            for (let a = 0; a < this.ListTab.length; a++) {
                if (a == 0) {
                    // Tab 1
                    var dataTab = this.goToTab(a).DataLogBookDetail
                    var param = []
                    for (let i = 0; i < dataTab.length; i++) {
                        if (dataTab[i].hasOwnProperty("_METHOD_")) {
                            if (dataTab[i]['_METHOD_'] == 'NEW') {
                                param.push({
                                    _Method_: "SAVE",
                                    _LineNo_: (a+1),
                                    mk_log_book_h_id: dataTab[i].mk_log_book_h_id,
                                    subportfolio_cd: this.getDataUser().subportfolio_cd,
                                    next_schedule_date: dataTab[i].next_schedule_date,
                                    mk_follow_up_type_id: dataTab[i].mk_follow_up_type_id,
                                    descs: dataTab[i].descs,
                                    user_input: this.getDataUser().user_id
                                })
                            }
                        }
                        else {
                            param.push({
                                _Method_: "UPDATE",
                                _LineNo_: (a+1),
                                subportfolio_cd: this.getDataUser().subportfolio_cd,
                                next_schedule_date: dataTab[i].next_schedule_date,
                                mk_follow_up_type_id: dataTab[i].mk_follow_up_type_id,
                                descs: dataTab[i].descs,
                                user_edit: this.getDataUser().user_id,
                                mk_log_book_d_id: dataTab[i].row_id,
                                lastupdatestamp: dataTab[i].lastupdatestamp
                            })
                        }
                    }

                    var dataDelete = this.goToTab(a).DataForDelete
                    for (let d = 0; d < dataDelete.length; d++) {
                        param.push({
                            _Method_: "DELETE",
                            _LineNo_: (a+1),
                            mk_log_book_d_id: dataDelete[d].mk_log_book_d_id,
                            lastupdatestamp: dataDelete[d].lastupdatestamp
                        })
                    }

                    dataTab1 = param
                }
                else if (a == 1) {
                    // Tab 2
                }
            }
            
            //action update
            dataHeader = {
                _Method_: "UPDATE",
                _LineNo_: 0,
                mk_log_book_h_id: this.M_MK_LogBookH.mk_log_book_h_id,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                log_book_no: this.M_MK_LogBookH.log_book_no,
                log_book_date: this.M_MK_LogBookH.log_book_date == '' || this.M_MK_LogBookH.log_book_date == null ? 'NULL' : this.M_MK_LogBookH.log_book_date,
                mk_follow_up_type_id: this.M_MK_LogBookH.mk_follow_up_type_id == '' || this.M_MK_LogBookH.mk_follow_up_type_id == null ? 'NULL' : this.M_MK_LogBookH.mk_follow_up_type_id,
                cm_contact_id: this.M_MK_LogBookH.cm_contact_id == '' || this.M_MK_LogBookH.cm_contact_id == null ? 'NULL' : this.M_MK_LogBookH.cm_contact_id,
                mk_contact_status_h_id: this.M_MK_LogBookH.mk_contact_status_h_id == '' || this.M_MK_LogBookH.mk_contact_status_h_id == null ? 'NULL' : this.M_MK_LogBookH.mk_contact_status_h_id,
                reason: this.M_MK_LogBookH.reason,
                remark: this.M_MK_LogBookH.remark,
                lastupdatestamp: this.M_MK_LogBookH.lastupdatestamp,
                user_edit: this.getDataUser().user_id
            }

            var data = [{
                A_Insert: dataHeader,
                B_Looping: dataTab1
            }]

            var param = {
                OptionUrl: this.OptionUrl,
                LineNo: 0,
                Data: data
            }

            this.postJSONMulti(this.getUrlMultiV2(this.getUrlProsesDataPostMulti()), param)
            .then((response) => {
                if(response == null) {
                    this.$router.go(-1)
                    // this.$router.replace({ name: 'MK_LogBook_List2', params: { Option: this.ParamFromList.Option } })
                }
                else {
                    this.alertSuccess("Update Data Has Been Successfull")
                    .then(ress => {
                        this.$router.go(-1)
                    })
                    // this.$router.replace({ name: 'MK_LogBook_List2', params: { Option: this.ParamFromList.Option } })
                }
            })
        },
        M_ClearForm() {
            this.M_MK_LogBookH = {
                mk_log_book_tes_h_id: 0,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                log_book_no: '',
                log_book_date: '',
                mk_follow_up_type_id: 0,
                follow_up_type_cd: '',
                mk_follow_up_type_id_descs: '',
                cm_contact_id: 0,
                contact_id: '',
                cm_contact_id_descs: '',
                mk_contact_status_h_id: 0,
                contact_status_cd: '',
                mk_contact_status_h_id_descs: '',
                reason: '',
                remark: '',
                row_id: 0,
                lastupdatestamp: 0,
                time_edit: ''
            }
        },
        getDataBy(){
            var param = {
                OptionUrl: this.OptionUrl,
                LineNo: 0,
                mk_log_book_id: this.ParamFromList.mk_log_book_h_id
            }

            var url = this.getUrlV2(this.getUrlById())  

            this.postJSON( url, param )
            .then(response => {
                if(response == null) return
                this.M_ClearForm()
                
                var data = response.Data[0]
                const lastupdatestamp = this.ParamFromList.lastupdatestamp ? this.ParamFromList.lastupdatestamp : data.lastupdatestamp
                this.M_MK_LogBookH = {
                    mk_log_book_h_id: this.ParamFromList.mk_log_book_h_id,
                    subportfolio_cd: data.subportfolio_cd,
                    log_book_no: data.log_book_no,
                    log_book_date: data.log_book_date,
                    mk_follow_up_type_id: data.mk_follow_up_type_id,
                    follow_up_type_cd: data.follow_up_type_cd,
                    mk_follow_up_type_id_descs: data.mk_follow_up_type_id_descs,
                    cm_contact_id: data.cm_contact_id,
                    contact_id: data.contact_id,
                    cm_contact_id_descs: data.cm_contact_id_descs,
                    mk_contact_status_h_id: data.mk_contact_status_h_id,
                    contact_status_cd: data.contact_status_cd,
                    mk_contact_status_h_id_descs: data.mk_contact_status_h_id_descs,
                    reason: data.reason,
                    remark: data.remark,
                    row_id: data.row_id,
                    lastupdatestamp: lastupdatestamp,
                    time_edit: data.time_edit
                }

                this.M_MK_LogBookH.mk_follow_up_type_idLabel = this.M_MK_LogBookH.follow_up_type_cd != null && this.M_MK_LogBookH.follow_up_type_cd != '' ? data.follow_up_type_cd + this.separator + data.follow_up_descs :'' 
                this.M_MK_LogBookH.cm_contact_idLabel = this.M_MK_LogBookH.contact_id != null && this.M_MK_LogBookH.contact_id != '' ? data.contact_id + this.separator + data.customer_name :'' 
                this.M_MK_LogBookH.mk_contact_status_h_idLabel = this.M_MK_LogBookH.contact_status_cd != null && this.M_MK_LogBookH.contact_status_cd != '' ? data.contact_status_cd + this.separator + data.contact_status_descs :'' 

                this.editStatus = true
            })
        },
        onGoBack() {
            this.alertConfirmation("Are You Sure Want To Discard This Change?")
            .then(result => {
                if (result.value) {
                    this.$router.go(-1)
                    // this.$router.replace({ name: 'MK_LogBook_List2', params: { Option: this.ParamFromList.Option } })
                }
            })
        },
    },
    beforeCreate: function () {
    },
    created: function() {
    },
    beforeMount: function() {
    },
    mounted: function() {
        this.M_ClearForm()
        this.$store.commit('setFormType','List')
        const id = this.ParamFromList.mk_log_book_h_id
        const lastupdatestamp = this.ParamFromList.lastupdatestamp
        if ((id && id != '') && (lastupdatestamp && lastupdatestamp != '')) {
            for(var x = 0; x < this.ListTab.length; x++){
                this.ListTab[x].mk_log_book_h_id = id
            }
            this.getDataBy()
            if (this.ParamFromList.Option.edit_status == "1") {
                this.$store.commit('setStatus', 'new')
            }
            else {
                this.$store.commit('setStatus', 'view')
            }
        }
        else {
            this.$store.commit('setStatus', 'new')
            this.GetMKSpecification()
            this.editStatus = false
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

<style scoped>
    #entryPage {
        overscroll-behavior: contain !important;
    }
</style>