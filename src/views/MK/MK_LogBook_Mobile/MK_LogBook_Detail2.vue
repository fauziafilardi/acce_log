<template>
    <div>
        <b-row>
            <b-col>
                <!-- <div :class="isDisableTable ? '' : 'dropdown'" style="float:right;" v-show="!hideCheckboxAndGear"> -->
                <!-- <div :class="isDisableTable ? '' : 'dropdown'" style="" v-show="!hideCheckboxAndGear"> -->
                <!-- <b-button class="button button--add" size="sm" @click="onAdd" style="
                    box-sizing: content-box;
                    z-index: 10;
                    width: 30px;
                    height: 29px;
                    background-color: rgb(85, 179, 255);
                    font-size: 20px;
                    color: white;
                    position: relative;
                    left: 20px;
                    padding: 1px 1px 1px 1px;
                    border-style: none;
                ">
                    <font-awesome-icon icon="plus" class="icon-style-1" style="margin: 0px; font-size: 20px;" />
                </b-button> -->
                <ABSButton
                    text="add"
                    icon="plus"
                    classButton="button button--new"
                    classIcon="icon-style-1"
                    @click="onAdd"
                    styleButton="width:100%"
                />
                <!-- <div style="
                    z-index: 10;
                    width: 30px;
                    height: 30px;
                    background-color: #55b3ff;
                    border-radius: 50%;
                    font-size: 20px;
                    color: white;
                    text-align: center;
                    line-height: 26px;
                    position: absolute;
                    right: 20px;
                    cursor: pointer;
                "
                @click="onAdd"
                >
                    +
                </div> -->
            </b-col>
        </b-row>
        

        <b-list-group style="padding-top: 10px;">
            <b-list-group-item @dblclick="onDataDblClick(index)" v-for="(data, index) in DataLogBookDetail" href="#" class="flex-column align-items-start" v-bind:key="index">
                <!-- <b-button size="sm" @click="M_DeleteDetail(index)" style="
                    box-sizing: content-box;
                    z-index: 10;
                    width: 30px;
                    height: 29px;
                    background-color: red;
                    font-size: 20px;
                    color: white;
                    float: right;
                    right: 0px;
                    padding: 1px 1px 1px 1px;
                    border-style: none;
                    margin-top: 0.5%;
                ">
                    <font-awesome-icon icon="trash-alt" class="icon-style-1" style="margin: 0px; font-size: 20px;" />
                </b-button>
                <b-row>
                    <b-col md="6" style="width:50%">
                        <p class="p-list"> {{ data.next_schedule_date }} </p>
                        <p class="p-list"> {{ data.follow_up_descs }} </p>
                        <p class="p-list"> {{ data.descs }} </p>
                    </b-col>
                </b-row> -->
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
                                <p class="p-list"> {{ data.next_schedule_date && data.next_schedule_date != '' ? data.next_schedule_date : '-' }} </p>
                            </b-col>
                            <b-col md="5">
                                <p class="p-list"> {{ data.follow_up_descs && data.follow_up_descs != '' ? data.follow_up_descs : '-' }} </p>
                            </b-col>
                            <b-col md="5">
                                <p class="p-list"> {{ data.descs && data.descs != '' ? data.descs : '-' }} </p>
                            </b-col>
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
        <!-- <div class="fab" @click="onAdd"> + </div> -->
    </div>
</template>
<script>
export default {
    props: {PageLevel: '', TabIndex: '', data: ''},
    data() {
        return {
            error: false,
            err1: false,
            DataLogBookDetail: [],
            currentPage: 1,
            perPage: 10,
            sort: 'time_edit DESC',
            sourceField: '',
            paramView: '',
            search: '',
            M_MK_LogBookD: {
                nextscheduledate:'',
                followuptype: '',
                descs: '',
                mk_log_book_h_id:'',
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
    methods: {
        isDisableTable(){

        },
        hideCheckboxAndGear(){

        },
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
            var scopeForm = "FormScope_" + 2 + "_" + 1
            this.$validator._base.validateAll(scopeForm).then((result) => {
                if (!result) return
                this.alertConfirmation("Are You Sure Want To Save This Data ?")
                .then(ress => {
                    if (ress.value) {
                        this.$validator.errors.clear(scopeForm)
                        if(this.editStatus == false){
                            this.M_SaveDetail()
                        } else {
                            this.M_UpdateDetail()
                        }
                    }
                })
            })
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
        }
    },
    mounted() {
        this.doGetList()
    }
}
</script>