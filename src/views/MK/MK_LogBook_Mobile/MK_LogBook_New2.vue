<template>
    <div class="height--full">
        <div class="header--content" style="margin-top: 32px !important;margin-left:0px !important;margin-right:0px !important;position: fixed;width: 100%;border-top: 1px solid #ccc;">              
            <div class="header--content__title">
                <b-row class="header-toolbar">
                    <b-col sm="12">
                        Log Book | 
                        <ABSButton
                            text="Back"
                            icon="chevron-left"
                            classButton="button button--new"
                            classIcon="icon-style-1"
                            @click="onGoBack"
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
                <div>
                    <b-tabs>
                        <b-tab title="Log Book Detail" active>
                            <b-row>
                                <b-row>
                                    <b-col style="padding-left:25px !important;">
                                        <ABSButton
                                            text="add"
                                            icon="plus"
                                            classButton="button button--new"
                                            classIcon="icon-style-1"
                                            @click="onAdd"
                                            :styleButton="'width:100%'"
                                        />
                                    </b-col>
                                </b-row>
                                <b-list-group style="padding-top: 10px;width:100%;padding-left:20px !important; padding-right:12px !important;">
                                    <b-list-group-item @dblclick="onDataDblClick(index)" v-for="(data, index) in DataLogBookDetail" href="#" class="flex-column align-items-start" v-bind:key="index">                            
                                        <div style="
                                            float: left;
                                            margin: 5px;
                                            height: 54px;
                                        ">
                                            <img style="height: 100%; padding: 2px;" :src="require('@/assets/avatar.png')" alt="">
                                        </div>

                                        <b-row>
                                            <b-col>
                                                <b-row>
                                                    <b-col md="5">                                                        
                                                        <!-- <p class="p-list"> {{ data.next_schedule_date && data.next_schedule_date != '' ? data.next_schedule_date : '-' }} </p> -->
                                                        <p class="p-list">
                                                            {{data.nextscheduledate}}
                                                        </p>
                                                    </b-col>
                                                    <b-col md="5">   
                                                        <p class="p-list">
                                                            {{data.followuptype}}
                                                        </p>
                                                    </b-col>
                                                    <b-col md="5">  
                                                        <p class="p-list">
                                                            {{data.descs}}
                                                        </p>
                                                    </b-col>
                                                    <!-- <b-col md="5">
                                                        <p class="p-list"> {{ data.follow_up_descs && data.follow_up_descs != '' ? data.follow_up_descs : '-' }} </p>
                                                    </b-col>
                                                    <b-col md="5">
                                                        <p class="p-list"> {{ data.descs && data.descs != '' ? data.descs : '-' }} </p>
                                                    </b-col> -->
                                                </b-row>
                                            </b-col>
                                            <b-col md="1" style="position: relative; margin-left: -5px;">
                                                <ABSButton
                                                    text="Delete"
                                                    icon="trash"
                                                    classButton="button button--delete"
                                                    classIcon="icon-style-1"
                                                    @click="M_DeleteDetail(index)"
                                                />
                                            </b-col>
                                        </b-row>
                                    </b-list-group-item>
                                </b-list-group>

                                <ABSModal id="modal12" ref="modal12" size="lg" okCancel @modalOkClicked="modalOk" @modalCancelClicked="modalCancel">
                                    <template slot="headerTitle"> Log Book Detail </template>
                                    <template slot="content">
                                        <b-row  style="padding-left: 10px; padding-bottom: 10px; !important;">
                                            <b-col md="12" id="col-left" class="bColMasterForm">	
                                                <b-form :data-vv-scope="'FormScope_' + 2 + '_' + 1" :data-vv-value-path="'FormScope_' + 2 + '_' + 1">
                                                    <b-row style="padding-left:10px;">
                                                        <b-col md="12" id="col-left">
                                                            <b-row>
                                                                <b-col  md="6">
                                                                    <ABSProcessinputDate @input="OnnextscheduledateChange" :prop="PI_nextscheduledate" v-model="M_MK_LogBookD.nextscheduledate"  ref="ref_nextscheduledate" />
                                                                </b-col>
                                                            </b-row>
                                                            <b-row>
                                                                <b-col md="6" v-show="err1">
                                                                    <b-row v-show="err1">
                                                                        <b-col offset="4"><label class="lbl-value-view-form" style="color:red"> Date must be greater than today </label></b-col>
                                                                    </b-row>
                                                                </b-col>
                                                            </b-row>
                                                            <b-row>
                                                                <b-col  md="6">
                                                                    <ABSProcessInputSelectList @change="OnfollowuptypeChange" :prop="PI_followuptype" :value="M_MK_LogBookD.followuptype" :label="M_MK_LogBookD.followuptypeLabel" ref="ref_followuptype"/>
                                                                </b-col>
                                                            </b-row>
                                                            <b-row>
                                                                <b-col  md="6">
                                                                    <ABSProcessinputText :prop="PI_descs" v-model="M_MK_LogBookD.descs"  ref="ref_descs"/>
                                                                </b-col>
                                                            </b-row>
                                                        </b-col>
                                                    </b-row>
                                                </b-form>
                                            </b-col>
                                        </b-row>
                                    </template>
                                </ABSModal>
                            </b-row>
                        </b-tab>
                        <b-tab title="Second"><p>I'm the second tab</p></b-tab>
                    </b-tabs>
                </div>                
                    <!-- <ABSTabsVuexNew :listTab="ListTab" :tabPath="'views/MK/MK_LogBook_Mobile'" :PageLevel="1" /> -->
            </div>
        </div>
        <div class="footer--content">
            <div class="header--content__title">
                <b-row class="header-toolbar">
                    <b-col sm="12">                   
                        <ABSButton
                            text="Save"
                            icon="save"
                            classButton="button button--save"
                            classIcon="icon-style-1"
                            @click="doSave"
                            :disabled="!isCanEdit"
                        />
                    </b-col>
                </b-row>
            </div>            
        </div>
    </div>
</template>
<script>
    export default {
    props: {PageLevel: '', TabIndex: '', data: ''},
    data () {
        return {
            //Detail Start
            ListTab: [
                {
                    query_name: 'Log Book Detail',
                    url: 'MK_LogBook_Detail2',
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
            error: false,
            err1: false,
            DataLogBookDetail: [],
            nextscheduledate:'',
            descs:'',
            followuptype:'',
            //Detail End

            LogBookOption: null,

            FormType: "List",
            Module: "MK",
            cm_running_code_h_id_log_book: null,
            id: null,
            lastupdatestamp: null,
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
                cVisible: true, 
                cProtect: false, 
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
            }, 

            PI_log_book_date: { 
                cValidate :'', 
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
            },
            
            M_MK_LogBookD: {
                nextscheduledate:'',
                followuptype: '',
                descs: '',
                mk_log_book_h_id:'',
                lastupdatestamp:null
            },
            PI_nextscheduledate: { 
                cValidate :'', 
                cName: 'nextscheduledate', 
                cLabel: 'Next Schedule', 
                cLabelSize: 4, 
                cOrder: 2, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },

            PI_followuptype: { 
                dataLookUp: { 
                    LookUpCd: 'GetFollowUpType'    , 
                    ColumnDB: 'follow_up_type_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
                cName: 'followuptype', 
                cLabel: 'Follow Up Type', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 1, 
                cTriggered: false, 
                cDefault: '', 
                cProtect: false, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cStatic: false, 
                cOption: [], 
                cMasterUrl: '' ,
                cDisplayColumn: 'follow_up_type_cd,descs' ,
            },
            PI_descs: { 
                cValidate :'', 
                cName: 'Description', 
                cLabel: 'descs', 
                cLabelSize: 4, 
                cOrder: 2,  
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }
        }
    },
    computed : {
        isCanEdit() {
            var canedit = this.LogBookOption ? (this.LogBookOption.add_status == "1") : true
            if (canedit == true) {
                this.$store.commit('setStatus', 'edit')
            }
            else {
                this.$store.commit('setStatus', 'view')
            }
            return canedit
        }
    },
    methods: {
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
        //LogBookHeaderStart----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
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
        doSave() {
            var scopeForm = "FormScope_" + this.pageLevel + "_" + this.tabIndex
            this.$validator._base.validateAll(scopeForm).then((result) => {
                if (!result) return
                this.alertConfirmation("Are You Sure Want To Save This Data ?")
                .then(ress => {
                    if (ress.value) {
                        this.$validator.errors.clear(scopeForm)
                        this.M_Insert()
                    }
                })
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
        M_Insert(){
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

                var param1 = {
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

                console.log(JSON.stringify(this.DataLogBookDetail, null, 2))
            var param2 = []
            for (let i = 0; i < this.DataLogBookDetail.length; i++) {
                param2.push({
                    _Method_: "SAVE",
                    _LineNo_: 1,
                    mk_log_book_h_id: "A_Insert.row_id_output",
                    subportfolio_cd: this.getDataUser().subportfolio_cd,
                    next_schedule_date: this.DataLogBookDetail[i].nextscheduledate,
                    mk_follow_up_type_id: this.DataLogBookDetail[i].followuptype,
                    descs: this.DataLogBookDetail[i].descs,
                    user_input: this.getDataUser().user_id
                })
            
            }

             var data = [{
                A_Insert: param1,
                B_Looping: param2
            }]
            console.log(JSON.stringify(data, null, 2))
                var param = {
                OptionUrl: 'MK_LogBook',
                LineNo: 0,
                Data: data
            }

            this.postJSONMulti(this.getUrlMultiV2(this.getUrlProsesDataPostMulti()), param)
            .then((response) => {
            if(response == null) return
                this.alertSuccess(response.Message)
            })

               
            })
          }
          else {
            var param1 = {
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
                user_input: this.getDataUser().user_id,

            }

            console.log(JSON.stringify(this.DataLogBookDetail, null, 2))
            var param2 = []
            for (let i = 0; i < this.DataLogBookDetail.length; i++) {
                param2.push({
                    _Method_: "SAVE",
                    _LineNo_: 1,
                    mk_log_book_h_id: "A_Insert.row_id_output",
                    subportfolio_cd: this.getDataUser().subportfolio_cd,
                    next_schedule_date: this.DataLogBookDetail[i].nextscheduledate,
                    mk_follow_up_type_id: this.DataLogBookDetail[i].followuptype,
                    descs: this.DataLogBookDetail[i].descs,
                    user_input: this.getDataUser().user_id
                })
            
            }

             var data = [{
                A_Insert: param1,
                B_Looping: param2
            }]
            console.log(JSON.stringify(data, null, 2))
                var param = {
                OptionUrl: 'MK_LogBook',
                LineNo: 0,
                Data: data
            }

            this.postJSONMulti(this.getUrlMultiV2(this.getUrlProsesDataPostMulti()), param)
            .then((response) => {
            if(response == null) return
                this.alertSuccess(response.Message)
            })

          
          }


            // var param1 = {
            // // OptionUrl: "MK_LogBook",
            //     // LineNo: 0,
            //     _Method_: "SAVE",
            //         _LineNo_: 0,
            //     mk_log_book_h_id: this.M_MK_LogBookH.mk_log_book_h_id,
            //     subportfolio_cd: this.getDataUser().subportfolio_cd,
            //     log_book_no: this.M_MK_LogBookH.log_book_no,
            //     log_book_date: this.M_MK_LogBookH.log_book_date == '' || this.M_MK_LogBookH.log_book_date == null ? 'NULL' : this.M_MK_LogBookH.log_book_date,
            //     mk_follow_up_type_id: this.M_MK_LogBookH.mk_follow_up_type_id == '' || this.M_MK_LogBookH.mk_follow_up_type_id == null ? 'NULL' : this.M_MK_LogBookH.mk_follow_up_type_id,
            //     cm_contact_id: this.M_MK_LogBookH.cm_contact_id == '' || this.M_MK_LogBookH.cm_contact_id == null ? 'NULL' : this.M_MK_LogBookH.cm_contact_id,
            //     mk_contact_status_h_id: this.M_MK_LogBookH.mk_contact_status_h_id == '' || this.M_MK_LogBookH.mk_contact_status_h_id == null ? 'NULL' : this.M_MK_LogBookH.mk_contact_status_h_id,
            //     reason: this.M_MK_LogBookH.reason,
            //     remark: this.M_MK_LogBookH.remark,
            //     // lastupdatestamp: this.M_MK_LogBookH.lastupdatestamp,
            //     user_edit: this.getDataUser().user_id
            // }
            
            
            // this.postJSON(this.getUrlV2(this.getUrlUpdate()), param)
            // .then((response) => {
            //     if(response == null) return
            //     this.alertSuccess(response.Message)
            //     this.getDataBy()
            // })
        },
        getDataBy(){
            var param = {
                OptionUrl: "MK_LogBook",
                LineNo: 0,
                mk_log_book_id: this.id
            }

            var url = this.getUrlV2(this.getUrlById())  

            this.postJSON( url, param )
            .then(response => {
                if(response == null) return
                this.M_ClearForm()
                
                var data = response.Data[0]
                const lastupdatestamp = this.lastupdatestamp ? this.lastupdatestamp : data.lastupdatestamp
                this.M_MK_LogBookH = {
                    mk_log_book_h_id: this.id,
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
                    time_edit: data.time_edit,
                }

                this.M_MK_LogBookH.mk_follow_up_type_idLabel = this.M_MK_LogBookH.follow_up_type_cd != null && this.M_MK_LogBookH.follow_up_type_cd != '' ? data.follow_up_type_cd + this.separator + data.follow_up_descs :'' 
                this.M_MK_LogBookH.cm_contact_idLabel = this.M_MK_LogBookH.contact_id != null && this.M_MK_LogBookH.contact_id != '' ? data.contact_id + this.separator + data.customer_name :'' 
                this.M_MK_LogBookH.mk_contact_status_h_idLabel = this.M_MK_LogBookH.contact_status_cd != null && this.M_MK_LogBookH.contact_status_cd != '' ? data.contact_status_cd + this.separator + data.contact_status_descs :'' 

                // this.$store.commit('setStatus', 'view')
            })
        },
        //LogBookHeaderEnd----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        
        //LogBookDetailStart=============================================================================================
        OnnextscheduledateChange(data){
            console.log(data)
            if(data == this.getToday()){
                this.error = true
                this.err1 = true
            } else {
                this.error = false
                this.err1 = false
            }
        },
        OnfollowuptypeChange (data) {
            this.$nextTick(() => {
                this.M_MK_LogBookD.followuptype = data.mk_follow_up_type_id
                this.M_MK_LogBookD.followuptypeLabel = data.label
                if (this.inputStatus != "VIEW") {
                }
            })
            this.$forceUpdate()
        },
        OnremarkChange(){
        },
        Onlog_book_dateChange(){
        },
        modalOk(){
            
            this.DataLogBookDetail.push(
                {   nextscheduledate:this.M_MK_LogBookD.nextscheduledate, 
                    followuptype: this.M_MK_LogBookD.followuptype ,
                    // mk_follow_up_type_id: this.M_MK_LogBookD.mk_follow_up_type_id,
                    descs:this.M_MK_LogBookD.descs },
            );
            this.M_ClearFormDetail()
            this.$refs.modal12._hide()
            // var scopeForm = "FormScope_" + 2 + "_" + 1
            // this.$validator._base.validateAll(scopeForm).then((result) => {
            //     if (!result) return
            //     this.alertConfirmation("Are You Sure Want To Save This Data ?")
            //     .then(ress => {
            //         if (ress.value) {
            //             this.$validator.errors.clear(scopeForm)
            //             if(this.editStatus == false){
            //                 this.M_SaveDetail()
            //             } else {
            //                 this.M_UpdateDetail()
            //             }
            //         }
            //     })
            // })
        },
        modalCancel(){},
        onAdd(){
            this.M_ClearFormDetail()
            this.$refs.modal12._show()
        },
        M_ClearFormDetail(){
            this.M_MK_LogBookD = {
                nextscheduledate:'',
                followuptype: '',
                descs: '',
                mk_log_book_h_id:'',
            }
        },
        M_SaveDetail(){
            var param = {
                OptionUrl: "MK_LogBook",
                LineNo: 1,
                mk_log_book_h_id: this.data.mk_log_book_h_id,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                next_schedule_date: this.M_MK_LogBookD.nextscheduledate,
                mk_follow_up_type_id: this.M_MK_LogBookD.followuptype,
                descs: this.M_MK_LogBookD.descs,
                user_input: this.getDataUser().user_id
            }

            var url = this.getUrlV2(this.getUrlInsert())

            this.postJSON(url, param)
            .then((response) => {
                if(response == null) return
                this.alertSuccess(response.Message)
                this.doGetList()
                this.$refs.modal12._hide()
            })
        },
        M_UpdateDetail(){
            var param = {
                OptionUrl: "MK_LogBook",
                LineNo: 1,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                next_schedule_date: this.M_MK_LogBookD.nextscheduledate,
                mk_follow_up_type_id: this.M_MK_LogBookD.followuptype,
                descs: this.M_MK_LogBookD.descs,
                user_edit: this.getDataUser().user_id,
                mk_log_book_d_id: this.M_MK_LogBookD.mk_log_book_d_id,
                lastupdatestamp: this.M_MK_LogBookD.lastupdatestamp
            }

            var url = this.getUrlV2(this.getUrlUpdate())

            this.postJSON(url, param)
            .then((response) => {
                if(response == null) return
                this.alertSuccess(response.Message)
                this.doGetList()
                this.$refs.modal12._hide()
            })
        },
        doGetList(search = "") {
            var param = {
                OptionUrl: "MK_LogBook",
                LineNo: 1,
                user_id: this.getDataUser().user_id,
                portfolio_cd: this.getDataUser().portfolio_cd,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                CurrentPage: this.currentPage,
                PerPage: this.perPage,
                ParamWhere: search,
                InitialWhere: "mk_log_book_h_id = "+ this.data.mk_log_book_h_id,
                SortField: this.sort,
                SourceField: this.sourceField,
                ParamView: this.paramView
            };

            var url = this.getUrlV2(this.getUrlList())

            this.postJSON(url, param).then(response => {
            if (response == null) return;
                this.DataLogBookDetail = response.Data
                console.log(response)
                this.editStatus = false
            })
        },
        onDataDblClick(index) {
            var param = {
                OptionUrl: "MK_LogBook",
                LineNo: 1,
                mk_log_book_d_id: this.DataLogBookDetail[index].row_id
            }

            var url = this.getUrlV2(this.getUrlById())  

            this.postJSON( url, param )
            .then(response => {
                if(response == null) return
                // this.M_ClearFormDetail()
                var data = response.Data[0]
                console.log(data)
                this.$refs.modal12._show()
                this.editStatus = true
                
                // const lastupdatestamp = this.lastupdatestamp ? this.lastupdatestamp : data.lastupdatestamp

                this.M_MK_LogBookD = {
                    nextscheduledate: data.next_schedule_date,
                    followuptype: data.mk_follow_up_type_id,
                    descs: data.descs,
                    mk_log_book_d_id: data.row_id,
                    lastupdatestamp: this.DataLogBookDetail[index].lastupdatestamp
                }
                this.M_MK_LogBookD.followuptypeLabel = this.M_MK_LogBookD.followuptype != null ? data.follow_up_type_cd + this.separator + data.follow_up_descs :'' 
            })
        },
        M_DeleteDetail(index) {
            this.alertConfirmation("Are You Sure Want To Delete This Data ?")
            .then(ress => {
                if (ress.value) {
                    this.M_DeleteD(index)
                }
            })
        },
        M_DeleteD(index){
            var param = {
                OptionUrl: "MK_LogBook",
                LineNo: 1,
                mk_log_book_d_id:this.DataLogBookDetail[index].row_id,
                lastupdatestamp: this.DataLogBookDetail[index].lastupdatestamp
            }

            var url = this.getUrlV2(this.getUrlDelete())

            this.postJSON(url, param)
            .then((response) => {
                if(response == null) return
                this.alertSuccess(response.Message)
                this.doGetList()
            })
        },
        //LogBookDetailEnd

        onGoBack() {
            // this.alertConfirmation("Do You Want To Save Data First?")
            this.alertConfirmation("Are You Sure Want To Discard This Change?")
            .then(result => {
                if (result.value) {
                    this.$router.replace({ name: 'MK_LogBook_List2', params: { Option: this.LogBookOption } })
                }
            })
        },
    },
    beforeCreate: function () {
    },
    created: function() {
        this.M_ClearForm()
        this.doGetList()
        // this.$store.commit('setFormType','List')
        // const id = this.$route.params.mk_log_book_h_id
        // const lastupdatestamp = this.$route.params.lastupdatestamp
        // this.LogBookOption = this.$route.params.Option
        // if ((id && id != '') && (lastupdatestamp && lastupdatestamp != '')) {
        //     this.id = id
        //     for(var x = 0; x < this.ListTab.length; x++){
        //         this.ListTab[x].mk_log_book_h_id = id
        //     }
        //     this.lastupdatestamp = lastupdatestamp
        //     this.getDataBy()
        //     // this.doGetList()
        // }
        // else {
        //     this.$router.replace({ name: 'MK_LogBook_List2', params: { Option: this.LogBookOption } })
        // }
    },
    beforeMount: function() {
    },
    mounted: function() {
        this.GetMKSpecification()
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