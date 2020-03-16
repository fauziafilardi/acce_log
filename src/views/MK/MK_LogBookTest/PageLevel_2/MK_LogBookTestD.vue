<template>
    <div>        
    <ABSListVuex
      :prop = "propList"
      :title = "data.query_name"
      @rowClicked = "$parent.rowClicked"
      @rowDblClicked = "$parent.doDoubleClick"
      @rowLinkClick = "$parent.rowLink"
      @pageSize = "$parent.M_PageSize"
      @pagination = "$parent.M_Pagination"
      @filter = "$parent.M_Advance_Filter"
      @headTable = "$parent.M_Head_Table"
      @refreshColumn = "$parent.refreshColumn"
      @checkboxChecked = "$parent.checkboxChecked"
    />


        <div v-show="$parent.showForm"  :style="'margin-top:10px;'" class="el" mousetip mousetip-msg="I'm a tooltip">
            <div class="div-collapse" v-b-toggle.collapse1>
                <span class="master-span" v-show="IEBy.Input && IEBy.Edit">
                    Input By : {{IEBy.Input}} | Edit By : {{IEBy.Edit}} <font-awesome-icon icon="sort-down" class="icon-style-1__master" /> 
                </span>
            </div>
            <b-collapse id="collapse1" :visible="true">
                <b-row  style="padding-left: 10px; padding-bottom: 10px; !important;">     
					<b-col md="12" id="col-left" class="bColMasterForm">	
						<b-form :data-vv-scope="'FormScope_' + PageLevel + '_' + TabIndex" :data-vv-value-path="'FormScope_' + PageLevel + '_' + TabIndex">
                            <b-row style="padding-left:10px;">					
                                <b-col md="6" id="col-left">
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputDateVuex @input="Onnext_schedule_dateChange" :prop="PI_next_schedule_date" v-model="M_MK_LogBookTestD.next_schedule_date"  ref="ref_next_schedule_date" />
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Onmk_follow_up_type_idChange" :prop="PI_mk_follow_up_type_id" :value="M_MK_LogBookTestD.mk_follow_up_type_id" :label="M_MK_LogBookTestD.mk_follow_up_type_idLabel" ref="ref_mk_follow_up_type_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_descs" v-model="M_MK_LogBookTestD.descs"  ref="ref_descs"/>
                                    </b-col>
                                  </b-row>
                                </b-col>

							</b-row>
						</b-form>
					</b-col>
                </b-row>
            </b-collapse>
        </div>
    </div>
</template>

<script>

export default {
    props: {PageLevel:'', TabIndex: '', data: ''},
    data() {
        return {
			ValKey:null,
            FormType: "List",
			Module:"MK",
            propList: {
                initialWhere:"mk_log_book_tes_h_id = '" + this.ValKey + "'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			
            M_MK_LogBookTestD: {
              mk_log_book_tes_d_id: 0,
              subportfolio_cd: this.getDataUser().subportfolio_cd,
              mk_contact_status_h_id: 0,
              mk_log_book_tes_h_id: 0,
              next_schedule_date: '',
              mk_follow_up_type_id: 0,
              follow_up_type_cd: '',
              mk_follow_up_type_id_descs: '',
              descs: '',
              row_id: 0,
              lastupdatestamp: 0,
              time_edit: '',
            },
            PI_next_schedule_date: { 
                cValidate :'', 
                cName: 'next_schedule_date', 
                cLabel: 'Next Schedule', 
                cLabelSize: 4, 
                cOrder: 1, 
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
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'follow_up_type_cd,descs,time_edit' 
                        }, 
                cValidate :'required', 
                cName: 'mk_follow_up_type_id', 
                cLabel: 'Follow Up Type', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 2, 
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
                cDisplayColumn: 'follow_up_type_cd,descs,time_edit' ,
            }, 

            PI_descs: { 
                cValidate :'max:255', 
                cName: 'descs', 
                cLabel: 'Description', 
                cLabelSize: 4, 
                cOrder: 3, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

       
        }
    },
	computed : {
    inputStatus() {
      if(this.$store.getters.getLevel == this.PageLevel && this.$store.getters.getTab == this.TabIndex){
        return this.$store.getters.getStatus.toUpperCase()
      }
      else {
        return 'VIEW'
      }
    },
	DataRow(){
		return this.$store.getters.GetPage2Data
	},
    DataRowPage1(){
		return this.$store.getters.GetPage1Data
	}
	,GetDataBy1(){
		return this.$store.getters.GetPage1GetDataBy
	}
  },
    methods: {
        Onnext_schedule_dateChange (data) {
          this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              //{next_schedule_date}
            }
          })
          this.$forceUpdate()
        },
        Onmk_follow_up_type_idChange (data) {
          this.$nextTick(() => {
            this.M_MK_LogBookTestD.mk_follow_up_type_id = data.id
            this.M_MK_LogBookTestD.mk_follow_up_type_idLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{mk_follow_up_type_id}
            }
          })
          this.$forceUpdate()
        },

		setToolbarButton () {
		},
        M_Head_Table () {
        },
        M_PageSize(){
        },
        M_TabClick(){
        },
        M_Pagination(){
        },
        M_Advance_Filter(){
        },
		M_Search(data){
        },
        M_Refresh(){
        },
		M_Cancel() {			
		},		
		doDoubleClick(){
        },
		rowClicked (record, index) {
        },
        rowLink: function(url){
        },
		paramFromParent(){
            this.$parent.showForm = false
			
            let data = this.$store.getters.GetPage1Data
            this.M_MK_LogBookTestD.mk_log_book_tes_h_id = data.mk_log_book_tes_h_id 
            this.propList.initialWhere =" mk_log_book_tes_h_id = '" + data.mk_log_book_tes_h_id + "' "


            this.FormToABSList().doGetList('','eb_getList')
        },		
		M_CheckboxChecked(data, status, index){

        },		
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                next_schedule_date: this.M_MK_LogBookTestD.next_schedule_date == '' || this.M_MK_LogBookTestD.next_schedule_date == null ? 'NULL' : this.M_MK_LogBookTestD.next_schedule_date,
                mk_follow_up_type_id: this.M_MK_LogBookTestD.mk_follow_up_type_id == '' || this.M_MK_LogBookTestD.mk_follow_up_type_id == null ? 'NULL' : this.M_MK_LogBookTestD.mk_follow_up_type_id,
                descs: this.M_MK_LogBookTestD.descs,
                mk_contact_status_h_id: this.M_MK_LogBookTestD.mk_contact_status_h_id,
                user_input: this.getDataUser().user_id,
                mk_log_book_tes_h_id: this.M_MK_LogBookTestD.mk_log_book_tes_h_id,

            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return
                this.$parent.resultInsert(response.Message)
				
            })
        },
        M_Update() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                mk_log_book_tes_d_id: this.M_MK_LogBookTestD.mk_log_book_tes_d_id,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                next_schedule_date: this.M_MK_LogBookTestD.next_schedule_date == '' || this.M_MK_LogBookTestD.next_schedule_date == null ? 'NULL' : this.M_MK_LogBookTestD.next_schedule_date,
                mk_follow_up_type_id: this.M_MK_LogBookTestD.mk_follow_up_type_id == '' || this.M_MK_LogBookTestD.mk_follow_up_type_id == null ? 'NULL' : this.M_MK_LogBookTestD.mk_follow_up_type_id,
                descs: this.M_MK_LogBookTestD.descs,
                mk_contact_status_h_id: this.M_MK_LogBookTestD.mk_contact_status_h_id,
                lastupdatestamp: this.M_MK_LogBookTestD.lastupdatestamp,
                user_edit: this.getDataUser().user_id,
                mk_log_book_tes_h_id: this.M_MK_LogBookTestD.mk_log_book_tes_h_id,

            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_MK_LogBookTestD = {
              mk_log_book_tes_d_id: 0,
              subportfolio_cd: this.getDataUser().subportfolio_cd,
              mk_contact_status_h_id: 0,
              mk_log_book_tes_h_id: 0,
              next_schedule_date: '',
              mk_follow_up_type_id: 0,
              follow_up_type_cd: '',
              mk_follow_up_type_id_descs: '',
              descs: '',
              row_id: 0,
              lastupdatestamp: 0,
              time_edit: '',
            }
		},
        M_New(){
            let data = this.$store.getters.GetPage1Data
            this.M_MK_LogBookTestD.mk_log_book_tes_h_id = data.mk_log_book_tes_h_id 



        },
        M_Edit(){
        },
        M_Delete(dt){           
			var data = this.FormToABSList().getRowSelected()  
			var dataDelete = []

			
			data.forEach((value) => {

				
				dataDelete.push({
                mk_log_book_tes_d_id: value.mk_log_book_tes_d_id,
                lastupdatestamp: value.lastupdatestamp,

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

                this.$parent.resultDelete()
            })
        },        
        getDataBy (record) {
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                mk_log_book_tes_d_id: record.mk_log_book_tes_d_id,

            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
                this.M_MK_LogBookTestD = {
                  mk_log_book_tes_d_id: data.mk_log_book_tes_d_id,
                  subportfolio_cd: data.subportfolio_cd,
                  mk_contact_status_h_id: data.mk_contact_status_h_id,
                  mk_log_book_tes_h_id: data.mk_log_book_tes_h_id,
                  next_schedule_date: data.next_schedule_date,
                  mk_follow_up_type_id: data.mk_follow_up_type_id,
                  follow_up_type_cd: data.follow_up_type_cd,
                  mk_follow_up_type_id_descs: data.mk_follow_up_type_id_descs,
                  descs: data.descs,
                  row_id: data.row_id,
                  lastupdatestamp: record.lastupdatestamp,
                  time_edit: data.time_edit,
                }

                this.M_MK_LogBookTestD.mk_follow_up_type_idLabel = this.M_MK_LogBookTestD.follow_up_type_cd != null && this.M_MK_LogBookTestD.follow_up_type_cd != '' ? data.follow_up_type_cd + this.separator + data.mk_follow_up_type_id_descs :'' 


                this.IEBy.Input = data.userinput
                this.IEBy.Edit = data.useredit

            })
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

