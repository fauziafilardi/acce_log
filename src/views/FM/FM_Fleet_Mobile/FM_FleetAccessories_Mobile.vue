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
            <b-list-group-item @click="onDataClick(index)" v-for="(data, index) in DataListDetail" href="#" class="flex-column align-items-start" v-bind:key="index">
                <div style="
                      float: left;
                      margin: 0px 15px 0px 0px;
                    ">
                    <!-- <div class="container-ava">
                    <ABSAvatar :fullname="data.??" letter="2" size="54" />
                    <ABSAvatar image="url_link"  size="54" />
                    </div>   -->

                    <div class="container-status">
                      <div class="div-status" style="background-color: #0680FF;">
                         {{ data.status }}
                      </div>
                    </div>

                    </div>

					<b-row>
                      <b-col>
                        <b-row>
                         <b-col md="5">
                           <p class="p-list" style="color: #555555; font-size: 14px; ">
                               {{ data.fm_accessories_id_descs && data.fm_accessories_id_descs != '' ? data.fm_accessories_id_descs : '-' }}
                           </p>
                         </b-col>
                         <b-col md="5">
                           <p class="p-list" style="color: #F99500; font-size: 14px; ">
                               {{ data.descs && data.descs != '' ? data.descs : '-' }}
                           </p>
                         </b-col>
                         <b-col md="5">
                           <p class="p-list" style="color: #F50404; font-size: 14px; ">
                               {{ data.accessories_date && data.accessories_date != '' ? data.accessories_date : '-' }}
                           </p>
                         </b-col>

                        </b-row>
                      </b-col>
                      <b-col md="1" class="center-delete-list" style="max-width:100% !important;">
                        <ABSButton
                          v-show="isCanEdit"
                          text="Delete"
                          icon="trash"
                          classButton="button button--delete"
                          classIcon="icon-style-1"
                          styleButton=""
                          @click="M_Delete(index)"
                        />
                      </b-col>
                    </b-row>
            </b-list-group-item>
        </b-list-group>

        <ABSModal id="Modal_FM_FleetAccessories_Mobile" ref="Modal_FM_FleetAccessories_Mobile" size="md" :okCancel="isCanEdit" :okOnly="!isCanEdit" @modalOkClicked="modalOk" @modalCancelClicked="modalCancel">
            <template slot="headerTitle"> Accessories </template>
            <template slot="content">
                <b-row  style="padding-left: 10px; padding-bottom: 10px; !important;">
                    <b-col md="12" id="col-left" class="bColMasterForm">	
                        <b-form :data-vv-scope="'FormScope_' + this.PageLevel + '_' + this.TabIndex" :data-vv-value-path="'FormScope_' + this.PageLevel + '_' + this.TabIndex">
                            <b-row style="padding-left:10px;">
                                <b-col md="6" id="col-left">
                                  <b-row>
                                    <b-col md="12">
                                      <ABSProcessInputSelectList :inputStatus="FormStatus" @change="Onfm_accessories_idChange" :prop="PI_fm_accessories_id" :value="M_FM_FleetAccessories_Mobile.fm_accessories_id" :label="M_FM_FleetAccessories_Mobile.fm_accessories_idLabel" ref="ref_fm_accessories_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSProcessinputDate :inputStatus="FormStatus" @input="Onaccessories_dateChange" :prop="PI_accessories_date" v-model="M_FM_FleetAccessories_Mobile.accessories_date"  ref="ref_accessories_date" />
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSProcessinputRadioButton :inputStatus="FormStatus" @input="OnstatusChange" :prop="PI_status" v-model="M_FM_FleetAccessories_Mobile.status"  ref="ref_status" />
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSProcessinputText :inputStatus="FormStatus" :prop="PI_descs" v-model="M_FM_FleetAccessories_Mobile.descs"  ref="ref_descs"/>
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
            DataListDetail: [],
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
            Module: "FM",
            OptionUrl: "FM_Fleet_Mobile",
            M_FM_FleetAccessories_Mobile: {
              fm_fleet_id: 0,
              fm_fleet_license_id: 0,
              fleet_license_no: '',
              subportfolio_cd: '',
              fm_license_type_id: 0,
              fm_license_type_id_cd: '',
              fm_license_type_id_descs: '',
              expired_date: '',
              cost: 0.00,
              cm_city_id: 0,
              cm_city_id_cd: '',
              cm_city_id_descs: '',
              remarks: '',
              row_id: '',
              lastupdatestamp: '',
              time_edit: '',
              user_input: '',
              user_edit: '',
              fm_fleet_id: 0,
              fm_fleet_license_id: 0,
              fleet_license_no: '',
              subportfolio_cd: '',
              fm_license_type_id: 0,
              fm_license_type_id_cd: '',
              fm_license_type_id_descs: '',
              expired_date: '',
              cost: 0.00,
              cm_city_id: 0,
              cm_city_id_cd: '',
              cm_city_id_descs: '',
              remarks: '',
              row_id: '',
              lastupdatestamp: '',
              time_edit: '',
              user_input: '',
              user_edit: '',
              fm_fleet_accessories_id: 0,
              subportfolio_cd: '',
              fm_fleet_id: 0,
              fm_accessories_id: 0,
              fm_accessories_id_cd: '',
              fm_accessories_id_descs: '',
              accessories_date: '',
              status: '',
              descs: '',
              row_id: '',
              lastupdatestamp: '',
              time_edit: '',
              user_input: '',
              user_edit: '',
            },
            PI_fm_accessories_id: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupFMAccessories'    , 
                    ColumnDB: 'accessories_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'accessories_cd,descs' 
                        }, 
                cValidate :'required', 
                cName: 'fm_accessories_id', 
                cLabel: 'Accessories', 
                cKey: true, 
                cLabelSize: 4, 
                cOrder: 1, 
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
                cMasterUrl: 'FM/FM_Accessories' ,
                cDisplayColumn: 'accessories_cd,descs' ,
            }, 

            PI_accessories_date: { 
                cValidate :'', 
                cName: 'accessories_date', 
                cLabel: 'Date', 
                cLabelSize: 4, 
                cOrder: 2, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
            }, 

            PI_status: { 
                cValidate :'', 
                cName: 'status', 
                cId: 'rdbstatus', 
                cRadioOptions: [{ text: 'Installation ', value: 'I' }, { text: 'Repair ', value: 'R' }, { text: 'Dispose', value: 'D' }], 
                cRadioDefaultOption: '', 
                cLabel:'Status', 
                cLabelSize: 4, 
                cDefault: '', 
                cOrder: 3, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
            }, 

            PI_descs: { 
                cValidate :'max:150', 
                cName: 'descs', 
                cLabel: 'Description', 
                cLabelSize: 4, 
                cOrder: 4, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cDefault: '', 
                cProtect: false, 
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
            }, 


        }
    },
    computed: {
        ListOption() {
            return this.$parent.$parent.$parent.$parent.$parent.ParamFromList.Option
        },
        isCanAdd() {
            var canadd = this.ListOption ? (this.ListOption.add_status == "1") : true
            return canadd
        },
        isCanDelete() {
            var candelete = this.ListOption ? (this.ListOption.delete_status == "1") : true
            return candelete
        },
        isCanEdit() {
            var canedit = this.ListOption ? (this.ListOption.edit_status == "1") : true
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
        Onfm_accessories_idChange (data) {
          this.$nextTick(() => {
            this.M_FM_FleetAccessories_Mobile.fm_accessories_id = data.id
            this.M_FM_FleetAccessories_Mobile.fm_accessories_idLabel = data.label
            this.M_FM_FleetAccessories_Mobile.fm_accessories_id_cd = data.accessories_cd
            this.M_FM_FleetAccessories_Mobile.fm_accessories_id_descs = data.descs
            if (this.inputStatus != "VIEW") {
              //{fm_accessories_id}
            }
          })
          this.$forceUpdate()
        },
        Onaccessories_dateChange (data) {
          this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              //{accessories_date}
            }
          })
          this.$forceUpdate()
        },
        OnstatusChange (data) {
          this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              //{status}
            }
          })
          this.$forceUpdate()
        },

        modalOk(){
            if (this.isCanEdit == false) {
                this.$refs.Modal_FM_FleetAccessories_Mobile._hide()
                return
            }

            var scopeForm = 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            this.$validator._base.validateAll(scopeForm).then((result) => {
                if (!result) return
                if (this.editStatus) {
                    if (this.addStatus == true) {
                        this.DataListDetail.push({
                          fm_fleet_accessories_id: this.M_FM_FleetAccessories_Mobile.fm_fleet_accessories_id,
                          subportfolio_cd: this.M_FM_FleetAccessories_Mobile.subportfolio_cd,
                          fm_fleet_id: this.M_FM_FleetAccessories_Mobile.fm_fleet_id,
                          fm_accessories_id: this.M_FM_FleetAccessories_Mobile.fm_accessories_id,
                          fm_accessories_id_cd: this.M_FM_FleetAccessories_Mobile.fm_accessories_id_cd,
                          fm_accessories_id_descs: this.M_FM_FleetAccessories_Mobile.fm_accessories_id_descs,
                          accessories_date: this.M_FM_FleetAccessories_Mobile.accessories_date,
                          status: this.M_FM_FleetAccessories_Mobile.status,
                          descs: this.M_FM_FleetAccessories_Mobile.descs,
                          lastupdatestamp: null,
                          time_edit: this.M_FM_FleetAccessories_Mobile.time_edit,
                          user_input: this.M_FM_FleetAccessories_Mobile.user_input,
                          user_edit: this.M_FM_FleetAccessories_Mobile.user_edit,
                          _METHOD_: "NEW",
                          fm_fleet_id: this.data.fm_fleet_id,

                        })
                    }
                    else {
                        this.DataListDetail[this.M_FM_FleetAccessories_Mobile.index].fm_fleet_accessories_id = this.M_FM_FleetAccessories_Mobile.fm_fleet_accessories_id
                        this.DataListDetail[this.M_FM_FleetAccessories_Mobile.index].subportfolio_cd = this.M_FM_FleetAccessories_Mobile.subportfolio_cd
                        this.DataListDetail[this.M_FM_FleetAccessories_Mobile.index].fm_fleet_id = this.M_FM_FleetAccessories_Mobile.fm_fleet_id
                        this.DataListDetail[this.M_FM_FleetAccessories_Mobile.index].fm_accessories_id = this.M_FM_FleetAccessories_Mobile.fm_accessories_id
                        this.DataListDetail[this.M_FM_FleetAccessories_Mobile.index].fm_accessories_id_cd = this.M_FM_FleetAccessories_Mobile.fm_accessories_id_cd
                        this.DataListDetail[this.M_FM_FleetAccessories_Mobile.index].fm_accessories_id_descs = this.M_FM_FleetAccessories_Mobile.fm_accessories_id_descs
                        this.DataListDetail[this.M_FM_FleetAccessories_Mobile.index].accessories_date = this.M_FM_FleetAccessories_Mobile.accessories_date
                        this.DataListDetail[this.M_FM_FleetAccessories_Mobile.index].status = this.M_FM_FleetAccessories_Mobile.status
                        this.DataListDetail[this.M_FM_FleetAccessories_Mobile.index].descs = this.M_FM_FleetAccessories_Mobile.descs
                        this.DataListDetail[this.M_FM_FleetAccessories_Mobile.index].time_edit = this.M_FM_FleetAccessories_Mobile.time_edit
                        this.DataListDetail[this.M_FM_FleetAccessories_Mobile.index].user_input = this.M_FM_FleetAccessories_Mobile.user_input
                        this.DataListDetail[this.M_FM_FleetAccessories_Mobile.index].user_edit = this.M_FM_FleetAccessories_Mobile.user_edit
                        this.DataListDetail[this.M_FM_FleetAccessories_Mobile.index].fm_accessories_idLabel = this.M_FM_FleetAccessories_Mobile.fm_accessories_idLabel

                    }
                }
                else {
                    this.DataListDetail.push({
                          fm_fleet_accessories_id: this.M_FM_FleetAccessories_Mobile.fm_fleet_accessories_id,
                          subportfolio_cd: this.M_FM_FleetAccessories_Mobile.subportfolio_cd,
                          fm_fleet_id: this.M_FM_FleetAccessories_Mobile.fm_fleet_id,
                          fm_accessories_id: this.M_FM_FleetAccessories_Mobile.fm_accessories_id,
                          fm_accessories_id_cd: this.M_FM_FleetAccessories_Mobile.fm_accessories_id_cd,
                          fm_accessories_id_descs: this.M_FM_FleetAccessories_Mobile.fm_accessories_id_descs,
                          accessories_date: this.M_FM_FleetAccessories_Mobile.accessories_date,
                          status: this.M_FM_FleetAccessories_Mobile.status,
                          descs: this.M_FM_FleetAccessories_Mobile.descs,
                          lastupdatestamp: null,
                          time_edit: this.M_FM_FleetAccessories_Mobile.time_edit,
                          user_input: this.M_FM_FleetAccessories_Mobile.user_input,
                          user_edit: this.M_FM_FleetAccessories_Mobile.user_edit,
                          _METHOD_: "NEW",

                    })
                }

                this.M_ClearForm()
                this.$refs.Modal_FM_FleetAccessories_Mobile._hide()
                this.addStatus = false
            })
        },
        modalCancel(){},
        onAdd(){
            this.addStatus = true
            this.M_ClearForm()
            this.$refs.Modal_FM_FleetAccessories_Mobile._show()
        },
        M_ClearForm(){
            this.M_FM_FleetAccessories_Mobile = {
              fm_fleet_id: 0,
              fm_fleet_license_id: 0,
              fleet_license_no: '',
              subportfolio_cd: '',
              fm_license_type_id: 0,
              fm_license_type_id_cd: '',
              fm_license_type_id_descs: '',
              expired_date: '',
              cost: 0.00,
              cm_city_id: 0,
              cm_city_id_cd: '',
              cm_city_id_descs: '',
              remarks: '',
              row_id: '',
              lastupdatestamp: '',
              time_edit: '',
              user_input: '',
              user_edit: '',
              fm_fleet_id: 0,
              fm_fleet_license_id: 0,
              fleet_license_no: '',
              subportfolio_cd: '',
              fm_license_type_id: 0,
              fm_license_type_id_cd: '',
              fm_license_type_id_descs: '',
              expired_date: '',
              cost: 0.00,
              cm_city_id: 0,
              cm_city_id_cd: '',
              cm_city_id_descs: '',
              remarks: '',
              row_id: '',
              lastupdatestamp: '',
              time_edit: '',
              user_input: '',
              user_edit: '',
              fm_fleet_accessories_id: 0,
              subportfolio_cd: '',
              fm_fleet_id: 0,
              fm_accessories_id: 0,
              fm_accessories_id_cd: '',
              fm_accessories_id_descs: '',
              accessories_date: '',
              status: '',
              descs: '',
              row_id: '',
              lastupdatestamp: '',
              time_edit: '',
              user_input: '',
              user_edit: '',
            }

            this.$refs.ref_fm_accessories_id.clearValidator()
            this.$refs.ref_accessories_date.clearValidator()
            this.$refs.ref_status.clearValidator()
            this.$refs.ref_descs.clearValidator()

        },
        doGetList(search = "") {
            var param = {
                OptionUrl: this.OptionUrl,
                LineNo: 2,
                user_id: this.getDataUser().user_id,
                portfolio_cd: this.getDataUser().portfolio_cd,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                CurrentPage: this.currentPage,
                PerPage: this.perPage,
                ParamWhere: search,
                InitialWhere: "fm_fleet_id = " + this.data.fm_fleet_id,
                SortField: this.sort,
                SourceField: this.sourceField,
                ParamView: this.paramView
            };

            var url = this.getUrlV2(this.getUrlList())

            this.postJSON(url, param).then(response => {
                this.$store.commit('setStatusLoader', false)
                if (response == null) return;
                this.DataListDetail = response.Data
                this.editStatus = true
            })
        },
        onDataClick(index) {
            if (this.editStatus == true) {
                if (this.DataListDetail[index].hasOwnProperty("_METHOD_")) {
                    if (this.DataListDetail[index]['_METHOD_'] == 'NEW') {
                        var data = this.DataListDetail[index]
                        this.M_FM_FleetAccessories_Mobile = {
                          fm_fleet_accessories_id:  data.fm_fleet_accessories_id,
                          subportfolio_cd:  data.subportfolio_cd,
                          fm_fleet_id:  data.fm_fleet_id,
                          fm_accessories_id:  data.fm_accessories_id,
                          fm_accessories_id_cd:  data.fm_accessories_id_cd,
                          fm_accessories_id_descs:  data.fm_accessories_id_descs,
                          accessories_date: this.momentDateFormatting( data.accessories_date, 'YYYY-MM-DD'),
                          status:  data.status,
                          descs:  data.descs,
                          row_id: null,
                          lastupdatestamp: null,
                          time_edit:  data.time_edit,
                          user_input:  data.user_input,
                          user_edit:  data.user_edit,
                          index: index,
                        }

                        this.M_FM_FleetAccessories_Mobile.fm_accessories_idLabel = data.fm_accessories_idLabel 

						this.$refs.Modal_FM_FleetAccessories_Mobile._show()
                    }
                }
                else {
                    var param = {
                        OptionUrl: this.OptionUrl,
                        LineNo: 2,
                        fm_fleet_accessories_id: this.DataListDetail[index].row_id,

                    }

                    var url = this.getUrlV2(this.getUrlById())

                    this.postJSON( url, param )
                    .then(response => {
                        if(response == null) return
                        
                        var data = response.Data[0]
                        
                        this.M_FM_FleetAccessories_Mobile = {
                          fm_fleet_accessories_id:  data.fm_fleet_accessories_id,
                          subportfolio_cd:  data.subportfolio_cd,
                          fm_fleet_id:  data.fm_fleet_id,
                          fm_accessories_id:  data.fm_accessories_id,
                          fm_accessories_id_cd:  data.fm_accessories_id_cd,
                          fm_accessories_id_descs:  data.fm_accessories_id_descs,
                          accessories_date: this.momentDateFormatting( data.accessories_date, 'YYYY-MM-DD'),
                          status:  data.status,
                          descs:  data.descs,
                          row_id:  data.row_id,
                          lastupdatestamp:  this.DataListDetail[index].lastupdatestamp,
                          time_edit:  data.time_edit,
                          user_input:  data.user_input,
                          user_edit:  data.user_edit,
                          index: index,
                        }

                        this.M_FM_FleetAccessories_Mobile.fm_accessories_idLabel = this.M_FM_FleetAccessories_Mobile.fm_accessories_id_cd != null && this.M_FM_FleetAccessories_Mobile.fm_accessories_id_cd != '' ? data.fm_accessories_id_cd + this.separator + data.fm_accessories_id_descs :'' 

						this.$refs.Modal_FM_FleetAccessories_Mobile._show()
                    })
                }
            }
            else {
                var data = this.DataListDetail[index]
                        this.M_FM_FleetAccessories_Mobile = {
                          fm_fleet_accessories_id:  data.fm_fleet_accessories_id,
                          subportfolio_cd:  data.subportfolio_cd,
                          fm_fleet_id:  data.fm_fleet_id,
                          fm_accessories_id:  data.fm_accessories_id,
                          fm_accessories_id_cd:  data.fm_accessories_id_cd,
                          fm_accessories_id_descs:  data.fm_accessories_id_descs,
                          accessories_date: this.momentDateFormatting( data.accessories_date, 'YYYY-MM-DD'),
                          status:  data.status,
                          descs:  data.descs,
                          row_id: null,
                          lastupdatestamp: null,
                          time_edit:  data.time_edit,
                          user_input:  data.user_input,
                          user_edit:  data.user_edit,
                          index: index,
                        }

                        this.M_FM_FleetAccessories_Mobile.fm_accessories_idLabel = data.fm_accessories_idLabel 

                this.$refs.Modal_FM_FleetAccessories_Mobile._show()
            }
        },
        M_Delete(index) {
            this.alertConfirmation("Are You Sure Want To Delete This Data ?")
            .then(ress => {
                if (ress.value) {
                    if (this.editStatus == true) {
                        var data = this.DataListDetail[index]
                        if (data.hasOwnProperty('row_id') && data.hasOwnProperty('lastupdatestamp')) {
                            this.DataForDelete.push({
                                row_id: data.row_id,
                                lastupdatestamp: data.lastupdatestamp
                            })

                            var dataTemp = this.DataListDetail
                            dataTemp.splice(index, 1)
                            this.DataListDetail = [... new Set(dataTemp)]
                            this.alertSuccess("Delete Data Has Been Successfully")
                        }
                        else {
                            var dataTemp = this.DataListDetail
                            dataTemp.splice(index, 1)
                            this.DataListDetail = [... new Set(dataTemp)]
                            this.alertSuccess("Delete Data Has Been Successfully")
                        }
                    }
                    else {
                        var dataTemp = this.DataListDetail
                        dataTemp.splice(index, 1)
                        this.DataListDetail = [... new Set(dataTemp)]
                        this.alertSuccess("Delete Data Has Been Successfully")
                    }
                }
            })
        }
    },
    mounted() {
        if (this.data.fm_fleet_id && this.data.fm_fleet_id != '') {
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
