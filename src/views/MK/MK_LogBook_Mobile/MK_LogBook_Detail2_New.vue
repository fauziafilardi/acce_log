<template>
    <div>
        <b-row>
            <b-col>
                <ABSButton
                    text="add"
                    icon="plus"
                    classButton="button button--new"
                    classIcon="icon-style-1"
                    @click="onAdd"
                    styleButton="width:100%"
                    v-show="isCanEdit"
                />
            </b-col>
        </b-row>
        

        <b-list-group style="padding-top: 10px;">
            <b-list-group-item @click="onDataDblClick(index)" v-for="(data, index) in DataLogBookDetail" href="#" class="flex-column align-items-start" v-bind:key="index">
                <div class="avatar-class">
                    <ABSAvatar :image="require('@/assets/avatar.png')"  size="54" />
                </div>

                <b-row>
                    <b-col>
                        <b-row>
                            <b-col md="5">
                                <p class="p-list" style="color: #F99500; font-size: 14px; font-weight: bold;"> {{ data.next_schedule_date && data.next_schedule_date != '' ? data.next_schedule_date : '-' }} </p>
                            </b-col>
                            <b-col md="5">
                                <p class="p-list" style="color: #0680FF; font-size: 11px;"> {{ data.mk_follow_up_type_id != '' ? data.follow_up_type_cd + ' | ' + data.follow_up_descs : '-' }} </p>
                            </b-col>
                            <b-col md="5">
                                <p class="p-list" style="color: #555555; font-size: 11px;"> {{ data.descs && data.descs != '' ? data.descs : '-' }} </p>
                            </b-col>
                        </b-row>
                    </b-col>
                    <b-col md="1" class="delete-detail-list">
                        <ABSButton
                            v-show="isCanEdit"
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

        <ABSModal id="modal12" ref="modal12" size="md" :okCancel="isCanEdit" :okOnly="!isCanEdit" @modalOkClicked="modalOk" @modalCancelClicked="modalCancel">
            <template slot="headerTitle"> Log Book Detail </template>
            <template slot="content">
                <b-row  style="padding-left: 10px; padding-bottom: 10px; !important;">
                    <b-col md="12" id="col-left" class="bColMasterForm">	
                        <b-form :data-vv-scope="'FormScope_' + this.PageLevel + '_' + this.TabIndex" :data-vv-value-path="'FormScope_' + this.PageLevel + '_' + this.TabIndex">
                            <b-row style="padding-left:10px;">
                                <b-col md="12" id="col-left">
                                    <b-row>
                                        <b-col  md="6">
                                            <ABSProcessinputDate :inputStatus="FormStatus" @input="Onnext_schedule_dateChange" :prop="PI_next_schedule_date" v-model="M_MK_LogBookD.next_schedule_date"  ref="ref_next_schedule_date" />
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col  md="6">
                                            <ABSProcessInputSelectList :inputStatus="FormStatus" @change="Onmk_follow_up_type_idChange" :prop="PI_mk_follow_up_type_id" :value="M_MK_LogBookD.mk_follow_up_type_id" :label="M_MK_LogBookD.mk_follow_up_type_idLabel" ref="ref_mk_follow_up_type_id"/>
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col  md="6">
                                            <ABSProcessinputText :inputStatus="FormStatus" :prop="PI_descs" v-model="M_MK_LogBookD.descs"  ref="ref_descs"/>
                                        </b-col>
                                    </b-row>
                                </b-col>
                            </b-row>
                        </b-form>
                    </b-col>
                </b-row>
            </template>
        </ABSModal>
    </div>
</template>
<script>
export default {
    props: {PageLevel: '', TabIndex: '', data: ''},
    data() {
        return {
            DataLogBookDetail: [],
            currentPage: 1,
            perPage: 10,
            sort: 'time_edit DESC',
            sourceField: '',
            paramView: '',
            search: '',
            
            editStatus: false,
            addStatus: false,
            FormStatus: 'new',
            DataForDelete: [],
            
            FormType: "List",
            Module: "MK",
            OptionUrl: "MK_LogBook",

            M_MK_LogBookD: {
                mk_log_book_h_id: '',
                row_id: '',
                next_schedule_date:'',
                mk_follow_up_type_id: '',
                follow_up_type_cd: '',
                follow_up_descs: '',
                mk_follow_up_type_idLabel: '',
                descs: ''
            },
            PI_next_schedule_date: { 
                cValidate :'today_is_min', 
                cName: 'next_schedule_date', 
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
            PI_mk_follow_up_type_id: { 
                dataLookUp: { 
                    LookUpCd: 'GetFollowUpType'    , 
                    ColumnDB: 'follow_up_type_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
                cName: 'mk_follow_up_type_id', 
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
    computed: {
        LogBookOption() {
            return this.$parent.$parent.$parent.$parent.$parent.ParamFromList.Option
        },
        isCanAdd() {
            var canadd = this.LogBookOption ? (this.LogBookOption.add_status == "1") : true
            return canadd
        },
        isCanDelete() {
            var candelete = this.LogBookOption ? (this.LogBookOption.delete_status == "1") : true
            return candelete
        },
        isCanEdit() {
            var canedit = this.LogBookOption ? (this.LogBookOption.edit_status == "1") : true
            if (canedit == true) {
                this.FormStatus = 'new'
            }
            else {
                this.FormStatus = 'view'
            }
            return canedit
        }
    },
    methods: {
        isDisableTable(){
        },
        hideCheckboxAndGear(){
        },
        Onnext_schedule_dateChange(data){
        },
        Onmk_follow_up_type_idChange (data) {
            this.$nextTick(() => {
                this.M_MK_LogBookD.mk_follow_up_type_id = data.id
                this.M_MK_LogBookD.follow_up_type_cd = data.follow_up_type_cd
                this.M_MK_LogBookD.follow_up_descs = data.descs
                this.M_MK_LogBookD.mk_follow_up_type_idLabel = data.label
                if (this.inputStatus != "VIEW") {
                }
            })
            this.$forceUpdate()
        },
        modalOk(){
            if (this.isCanEdit == false) {
                this.$refs.modal12._hide()
                return
            }

            var scopeForm = 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            this.$validator._base.validateAll(scopeForm).then((result) => {
                if (!result) return
                if (this.editStatus) {
                    if (this.addStatus == true) {
                        this.DataLogBookDetail.push({
                            _METHOD_: "NEW",
                            mk_log_book_h_id: this.data.mk_log_book_h_id,
                            next_schedule_date:this.M_MK_LogBookD.next_schedule_date, 
                            mk_follow_up_type_id: this.M_MK_LogBookD.mk_follow_up_type_id,
                            follow_up_type_cd: this.M_MK_LogBookD.follow_up_type_cd,
                            follow_up_descs: this.M_MK_LogBookD.follow_up_descs,
                            mk_follow_up_type_idLabel: this.M_MK_LogBookD.mk_follow_up_type_idLabel,
                            descs:this.M_MK_LogBookD.descs
                        })
                    }
                    else {
                        this.DataLogBookDetail[this.M_MK_LogBookD.index].next_schedule_date = this.M_MK_LogBookD.next_schedule_date
                        this.DataLogBookDetail[this.M_MK_LogBookD.index].mk_follow_up_type_id = this.M_MK_LogBookD.mk_follow_up_type_id
                        this.DataLogBookDetail[this.M_MK_LogBookD.index].follow_up_type_cd = this.M_MK_LogBookD.follow_up_type_cd
                        this.DataLogBookDetail[this.M_MK_LogBookD.index].follow_up_descs = this.M_MK_LogBookD.follow_up_descs
                        this.DataLogBookDetail[this.M_MK_LogBookD.index].mk_follow_up_type_idLabel = this.M_MK_LogBookD.mk_follow_up_type_idLabel
                        this.DataLogBookDetail[this.M_MK_LogBookD.index].descs = this.M_MK_LogBookD.descs
                    }
                }
                else {
                    this.DataLogBookDetail.push({
                        _METHOD_: "NEW",
                        next_schedule_date:this.M_MK_LogBookD.next_schedule_date, 
                        mk_follow_up_type_id: this.M_MK_LogBookD.mk_follow_up_type_id,
                        follow_up_type_cd: this.M_MK_LogBookD.follow_up_type_cd,
                        follow_up_descs: this.M_MK_LogBookD.follow_up_descs,
                        mk_follow_up_type_idLabel: this.M_MK_LogBookD.mk_follow_up_type_idLabel,
                        descs:this.M_MK_LogBookD.descs
                    })
                }

                this.M_ClearFormDetail()
                this.$refs.modal12._hide()
                this.addStatus = false
            })
        },
        modalCancel(){},
        onAdd(){
            this.addStatus = true
            this.M_ClearFormDetail()
            this.$refs.modal12._show()
        },
        M_ClearFormDetail(){
            this.M_MK_LogBookD = {
                next_schedule_date:'',
                mk_follow_up_type_id: '',
                mk_follow_up_type_idLabel: '',
                descs: ''
            }

            this.$refs.ref_next_schedule_date.clearValidator()
            this.$refs.ref_mk_follow_up_type_id.clearValidator()
            this.$refs.ref_descs.clearValidator()
        },
        doGetList(search = "") {
            var param = {
                OptionUrl: this.OptionUrl,
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
                this.$store.commit('setStatusLoader', false)
                if (response == null) return;
                this.DataLogBookDetail = response.Data
                this.editStatus = true
            })
        },
        onDataDblClick(index) {
            if (this.editStatus == true) {
                if (this.DataLogBookDetail[index].hasOwnProperty("_METHOD_")) {
                    if (this.DataLogBookDetail[index]['_METHOD_'] == 'NEW') {
                        var data = this.DataLogBookDetail[index]
                        this.M_MK_LogBookD = {
                            index: index,
                            next_schedule_date: data.next_schedule_date,
                            mk_follow_up_type_id: data.mk_follow_up_type_id,
                            follow_up_type_cd: data.follow_up_type_cd,
                            follow_up_descs: data.follow_up_descs,
                            mk_follow_up_type_idLabel: data.mk_follow_up_type_idLabel,
                            descs: data.descs,
                            mk_log_book_d_id: null,
                            lastupdatestamp: null
                        }
                        this.$refs.modal12._show()
                    }
                }
                else {
                    var param = {
                        OptionUrl: this.OptionUrl,
                        LineNo: 1,
                        mk_log_book_d_id: this.DataLogBookDetail[index].row_id
                    }

                    var url = this.getUrlV2(this.getUrlById())

                    this.postJSON( url, param )
                    .then(response => {
                        if(response == null) return
                        
                        var data = response.Data[0]
                        this.$refs.modal12._show()
                        
                        this.M_MK_LogBookD = {
                            index: index,
                            next_schedule_date: data.next_schedule_date,
                            mk_follow_up_type_id: data.mk_follow_up_type_id,
                            follow_up_type_cd: data.follow_up_type_cd,
                            follow_up_descs: data.follow_up_descs,
                            descs: data.descs,
                            mk_log_book_d_id: data.row_id,
                            lastupdatestamp: this.DataLogBookDetail[index].lastupdatestamp
                        }
                        this.M_MK_LogBookD.mk_follow_up_type_idLabel = this.M_MK_LogBookD.mk_follow_up_type_id != null ? data.follow_up_type_cd + this.separator + data.follow_up_descs :'' 
                    })
                }
            }
            else {
                var data = this.DataLogBookDetail[index]
                this.M_MK_LogBookD = {
                    index: index,
                    next_schedule_date: data.next_schedule_date,
                    mk_follow_up_type_id: data.mk_follow_up_type_id,
                    follow_up_type_cd: data.follow_up_type_cd,
                    follow_up_descs: data.follow_up_descs,
                    mk_follow_up_type_idLabel: data.mk_follow_up_type_idLabel,
                    descs: data.descs,
                    mk_log_book_d_id: null,
                    lastupdatestamp: null
                }
                this.$refs.modal12._show()
            }
        },
        M_DeleteDetail(index) {
            this.alertConfirmation("Are You Sure Want To Delete This Data ?")
            .then(ress => {
                if (ress.value) {
                    if (this.editStatus == true) {
                        var data = this.DataLogBookDetail[index]
                        if (data.hasOwnProperty('row_id') && data.hasOwnProperty('lastupdatestamp')) {
                            // var param = {
                            //     OptionUrl: this.OptionUrl,
                            //     LineNo: 1,
                            //     mk_log_book_d_id: data.row_id,
                            //     lastupdatestamp: data.lastupdatestamp
                            // }
    
                            // var url = this.getUrlV2(this.getUrlDelete())
    
                            // this.postJSON(url, param)
                            // .then((response) => {
                            //     if(response == null) return
                            //     this.alertSuccess(response.Message)
                            //     this.doGetList()
                            // })

                            this.DataForDelete.push({
                                mk_log_book_d_id: data.row_id,
                                lastupdatestamp: data.lastupdatestamp
                            })

                            var dataTemp = this.DataLogBookDetail
                            dataTemp.splice(index, 1)
                            this.DataLogBookDetail = [... new Set(dataTemp)]
                            this.alertSuccess("Delete Data Has Been Successfully")
                        }
                        else {
                            var dataTemp = this.DataLogBookDetail
                            dataTemp.splice(index, 1)
                            this.DataLogBookDetail = [... new Set(dataTemp)]
                            this.alertSuccess("Delete Data Has Been Successfully")
                        }
                    }
                    else {
                        var dataTemp = this.DataLogBookDetail
                        dataTemp.splice(index, 1)
                        this.DataLogBookDetail = [... new Set(dataTemp)]
                        this.alertSuccess("Delete Data Has Been Successfully")
                    }
                }
            })
        }
    },
    mounted() {
        if (this.data.mk_log_book_h_id && this.data.mk_log_book_h_id != '') {
            this.$store.commit('setStatusLoader', true)
            this.doGetList()
            this.editStatus = true
        }
        else {
            this.editStatus = false
        }
    }
}
</script>