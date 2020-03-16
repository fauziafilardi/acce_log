<template>
    <div class="height--full">
        <div class="header--content">
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

                        <ABSButton
                            text="Save"
                            icon="save"
                            classButton="button button--save"
                            classIcon="icon-style-1"
                            @click="doSave"
                            :disabled="false"
                        />
                    </b-col>
                </b-row>
            </div>
        </div>
    
  <div class="content-app-form__body">
    <div class="block-scope-mobile">
      <b-row style="margin: 0px !important;">
            <b-col md="12" class="bColMasterForm" style="padding: 5px !important">
                <div class="card" style="font-size:11px; border:0px !important;">
                    <b-form :data-vv-scope="'FormScope_' + 1 + '_' + 1" :data-vv-value-path="'FormScope_' + 1 + '_' + 1">
                    <!-- <b-form> -->
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
                                    <ABSInputSelectList @change="Onmk_follow_up_type_idChange" :prop="PI_mk_follow_up_type_id" :value="M_MK_LogBookH.mk_follow_up_type_id" :label="M_MK_LogBookH.mk_follow_up_type_idLabel" ref="ref_mk_follow_up_type_id"/>
                                </b-col>
                                </b-row>
                                <b-row>
                                <b-col md="12">
                                    <ABSInputSelectList @change="Oncm_contact_idChange" :prop="PI_cm_contact_id" :value="M_MK_LogBookH.cm_contact_id" :label="M_MK_LogBookH.cm_contact_idLabel" ref="ref_cm_contact_id"/>
                                </b-col>
                                </b-row>
                                <b-row>
                                <b-col md="12">
                                    <ABSInputSelectList @change="Onmk_contact_status_h_idChange" :prop="PI_mk_contact_status_h_id" :value="M_MK_LogBookH.mk_contact_status_h_id" :label="M_MK_LogBookH.mk_contact_status_h_idLabel" ref="ref_mk_contact_status_h_id"/>
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
    </div>
  </div>
  </div>
</template>

<script>
export default {
    props: {PageLevel: '', TabIndex: '', data: ''},
    data () {
    return {
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
        LogBookOption: null
    }
  },
    computed : {
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
        onGoBack() {
            // this.$router.replace('/MK/MK_LogBook_List2')
            this.$router.replace({ name: 'MK_LogBook_List2', params: { Option: this.LogBookOption } })
        },
        doSave() {
            var scopeForm = "FormScope_" + this.pageLevel + "_" + this.tabIndex
            this.$validator._base.validateAll(scopeForm).then((result) => {
                if (!result) return
                this.alertConfirmation("Are You Sure Want To Save This Data ?")
                .then(ress => {
                    if (ress.value) {
                        // this.$store.commit('setEventStatus', 'SAVE')
                        this.$validator.errors.clear(scopeForm)
                        this.M_Save()
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
        M_Save() {
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

                var param = {
                    OptionUrl: this.OptionUrl,
                    LineNo: 0,
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

                var url = this.getUrlV2(this.getUrlInsert())

                this.postJSON(url, param)
                .then((response) => {
                    if(response == null) return
                    this.alertSuccess(response.Message)
                    const data = response.Data[0]
                    this.$router.push({ name: 'MK_LogBook_Edit', params: { Option: this.LogBookOption, mk_log_book_h_id: data.row_id, lastupdatestamp: null } })
                })
            })
          }
          else {
            var param = {
                OptionUrl: this.OptionUrl,
                LineNo: 0,
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

            var url = this.getUrlV2(this.getUrlInsert())

            this.postJSON(url, param)
            .then((response) => {
                if(response == null) return
                this.alertSuccess(response.Message)
                const data = response.Data[0]
                this.$router.push({ name: 'MK_LogBook_Edit', params: { Option: this.LogBookOption, mk_log_book_h_id: data.row_id, lastupdatestamp: null } })
            })
          }
        },
    },
    beforeCreate: function () {
    },
    created: function() {
        this.M_ClearForm()
        this.$store.commit('setFormType','List')
        this.$store.commit('setStatus', 'new')
        this.LogBookOption = this.$route.params.Option
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

<style scoped>
  .card-list {
      box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
      transition: 0.3s;
      width: 100%;
      /* margin:15px; */
  }

  .card-list:hover {
      box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
  }

  .container-list {
      padding: 2px 20px;
  }

  .p-list {
    margin-bottom: 0px !important;
    margin-top: 0px !important;
  }

  .fab {
    z-index: 10;
    width: 30px;
    height: 30px;
    background-color: #55b3ff;
    border-radius: 50%;
    box-shadow: 0 6px 10px 0 #666;
    transition: all 0.1s ease-in-out;
    
    font-size: 20px;
    color: white;
    text-align: center;
    line-height: 26px;
    
    position: fixed;
    right: 20px;
    bottom: 18px;
}
 
.fab:hover {
   box-shadow: 0 6px 14px 0 #666;
   transform: scale(1.05);
}

.list-group-item {
    padding: 5px 10px !important;
}
</style>
