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
                                      <ABSinputDateVuex @input="Onin_dateChange" :prop="PI_in_date" v-model="M_FM_FleetMaintenance.in_date"  ref="ref_in_date" />
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputDateVuex @input="Onout_dateChange" :prop="PI_out_date" v-model="M_FM_FleetMaintenance.out_date"  ref="ref_out_date" />
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputDateVuex @input="Onestimate_outChange" :prop="PI_estimate_out" v-model="M_FM_FleetMaintenance.estimate_out"  ref="ref_estimate_out" />
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Onfm_fleet_status_idChange" :prop="PI_fm_fleet_status_id" :value="M_FM_FleetMaintenance.fm_fleet_status_id" :label="M_FM_FleetMaintenance.fm_fleet_status_idLabel" ref="ref_fm_fleet_status_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Oncm_staff_idChange" :prop="PI_cm_staff_id" :value="M_FM_FleetMaintenance.cm_staff_id" :label="M_FM_FleetMaintenance.cm_staff_idLabel" ref="ref_cm_staff_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_descs" v-model="M_FM_FleetMaintenance.descs"  ref="ref_descs"/>
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
			Module:"FM",
            propList: {
                initialWhere:"fm_fleet_id = '" + this.ValKey + "'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			
            M_FM_FleetMaintenance: {
              fm_fleet_maintenance_id: 0,
              subportfolio_cd: '',
              fm_fleet_id: 0,
              in_date: '',
              out_date: '',
              estimate_out: '',
              fm_fleet_status_id: 0,
              fm_fleet_status_id_cd: '',
              fm_fleet_status_id_descs: '',
              cm_staff_id: 0,
              cm_staff_id_cd: '',
              cm_staff_id_descs: '',
              descs: '',
              row_id: 0,
              lastupdatestamp: 0,
              time_edit: '',
              user_input: '',
              user_edit: '',
            },
            PI_in_date: { 
                cValidate :'required', 
                cName: 'in_date', 
                cLabel: 'In Date', 
                cLabelSize: 4, 
                cOrder: 1, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_out_date: { 
                cValidate :'', 
                cName: 'out_date', 
                cLabel: 'Out Date', 
                cLabelSize: 4, 
                cOrder: 2, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_estimate_out: { 
                cValidate :'', 
                cName: 'estimate_out', 
                cLabel: 'Estimate Out Date', 
                cLabelSize: 4, 
                cOrder: 3, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_fm_fleet_status_id: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupFMFleetStatus'    , 
                    ColumnDB: 'status_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'status_cd,descs' 
                        }, 
                cValidate :'', 
                cName: 'fm_fleet_status_id', 
                cLabel: 'Fleet Status', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 4, 
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
                cMasterUrl: 'FM/FM_FleetStatus' ,
                cDisplayColumn: 'status_cd,descs' ,
            }, 

            PI_cm_staff_id: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupFMStaffMaster'    , 
                    ColumnDB: 'staff_no'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'staff_no,name' 
                        }, 
                cValidate :'', 
                cName: 'cm_staff_id', 
                cLabel: 'Staff', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 5, 
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
                cDisplayColumn: 'staff_no,name' ,
            }, 

            PI_descs: { 
                cValidate :'max:150', 
                cName: 'descs', 
                cLabel: 'Description', 
                cLabelSize: 4, 
                cOrder: 6, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cDefault: '', 
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
        Onin_dateChange (data) {
          this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              //{in_date}
            }
          })
          this.$forceUpdate()
        },
        Onout_dateChange (data) {
          this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              //{out_date}
            }
          })
          this.$forceUpdate()
        },
        Onestimate_outChange (data) {
          this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              //{estimate_out}
            }
          })
          this.$forceUpdate()
        },
        Onfm_fleet_status_idChange (data) {
          this.$nextTick(() => {
            this.M_FM_FleetMaintenance.fm_fleet_status_id = data.id
            this.M_FM_FleetMaintenance.fm_fleet_status_idLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{fm_fleet_status_id}
            }
          })
          this.$forceUpdate()
        },
        Oncm_staff_idChange (data) {
          this.$nextTick(() => {
            this.M_FM_FleetMaintenance.cm_staff_id = data.id
            this.M_FM_FleetMaintenance.cm_staff_idLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{cm_staff_id}
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
            this.M_FM_FleetMaintenance.fm_fleet_id = data.fm_fleet_id 
            this.propList.initialWhere =" fm_fleet_id = '" + data.fm_fleet_id + "' "


            this.FormToABSList().doGetList('','eb_getList')
        },		
		M_CheckboxChecked(data, status, index){

        },		
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                in_date: this.M_FM_FleetMaintenance.in_date == '' || this.M_FM_FleetMaintenance.in_date == null ? 'NULL' : this.M_FM_FleetMaintenance.in_date,
                out_date: this.M_FM_FleetMaintenance.out_date == '' || this.M_FM_FleetMaintenance.out_date == null ? 'NULL' : this.M_FM_FleetMaintenance.out_date,
                estimate_out: this.M_FM_FleetMaintenance.estimate_out == '' || this.M_FM_FleetMaintenance.estimate_out == null ? 'NULL' : this.M_FM_FleetMaintenance.estimate_out,
                fm_fleet_status_id: this.M_FM_FleetMaintenance.fm_fleet_status_id == '' || this.M_FM_FleetMaintenance.fm_fleet_status_id == null ? 'NULL' : this.M_FM_FleetMaintenance.fm_fleet_status_id,
                cm_staff_id: this.M_FM_FleetMaintenance.cm_staff_id == '' || this.M_FM_FleetMaintenance.cm_staff_id == null ? 'NULL' : this.M_FM_FleetMaintenance.cm_staff_id,
                descs: this.M_FM_FleetMaintenance.descs,
                user_input: this.getDataUser().user_id,
                fm_fleet_id: this.M_FM_FleetMaintenance.fm_fleet_id,

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
                fm_fleet_maintenance_id: this.M_FM_FleetMaintenance.fm_fleet_maintenance_id,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                in_date: this.M_FM_FleetMaintenance.in_date == '' || this.M_FM_FleetMaintenance.in_date == null ? 'NULL' : this.M_FM_FleetMaintenance.in_date,
                out_date: this.M_FM_FleetMaintenance.out_date == '' || this.M_FM_FleetMaintenance.out_date == null ? 'NULL' : this.M_FM_FleetMaintenance.out_date,
                estimate_out: this.M_FM_FleetMaintenance.estimate_out == '' || this.M_FM_FleetMaintenance.estimate_out == null ? 'NULL' : this.M_FM_FleetMaintenance.estimate_out,
                fm_fleet_status_id: this.M_FM_FleetMaintenance.fm_fleet_status_id == '' || this.M_FM_FleetMaintenance.fm_fleet_status_id == null ? 'NULL' : this.M_FM_FleetMaintenance.fm_fleet_status_id,
                cm_staff_id: this.M_FM_FleetMaintenance.cm_staff_id == '' || this.M_FM_FleetMaintenance.cm_staff_id == null ? 'NULL' : this.M_FM_FleetMaintenance.cm_staff_id,
                descs: this.M_FM_FleetMaintenance.descs,
                lastupdatestamp: this.M_FM_FleetMaintenance.lastupdatestamp,
                user_edit: this.getDataUser().user_id,
                fm_fleet_id: this.M_FM_FleetMaintenance.fm_fleet_id,

            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return
				
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_FM_FleetMaintenance = {
              fm_fleet_maintenance_id: 0,
              subportfolio_cd: '',
              fm_fleet_id: 0,
              in_date: '',
              out_date: '',
              estimate_out: '',
              fm_fleet_status_id: 0,
              fm_fleet_status_id_cd: '',
              fm_fleet_status_id_descs: '',
              cm_staff_id: 0,
              cm_staff_id_cd: '',
              cm_staff_id_descs: '',
              descs: '',
              row_id: 0,
              lastupdatestamp: 0,
              time_edit: '',
              user_input: '',
              user_edit: '',
            }
		},
        M_New(){
            let data = this.$store.getters.GetPage1Data
            this.M_FM_FleetMaintenance.fm_fleet_id = data.fm_fleet_id 



        },
        M_Edit(){
        },
        M_Delete(dt){           
			var data = this.FormToABSList().getRowSelected()  
			var dataDelete = []

			
			data.forEach((value) => {

				
				dataDelete.push({
                fm_fleet_maintenance_id: value.fm_fleet_maintenance_id,
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
                fm_fleet_maintenance_id: record.fm_fleet_maintenance_id,

            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
                this.M_FM_FleetMaintenance = {
                  fm_fleet_maintenance_id: data.fm_fleet_maintenance_id,
                  subportfolio_cd: data.subportfolio_cd,
                  fm_fleet_id: data.fm_fleet_id,
                  in_date: this.momentDateFormatting(data.in_date, 'YYYY-MM-DD'),
                  out_date: this.momentDateFormatting(data.out_date, 'YYYY-MM-DD'),
                  estimate_out: this.momentDateFormatting(data.estimate_out, 'YYYY-MM-DD'),
                  fm_fleet_status_id: data.fm_fleet_status_id,
                  fm_fleet_status_id_cd: data.fm_fleet_status_id_cd,
                  fm_fleet_status_id_descs: data.fm_fleet_status_id_descs,
                  cm_staff_id: data.cm_staff_id,
                  cm_staff_id_cd: data.cm_staff_id_cd,
                  cm_staff_id_descs: data.cm_staff_id_descs,
                  descs: data.descs,
                  row_id: data.row_id,
                  lastupdatestamp: record.lastupdatestamp,
                  time_edit: this.momentDateFormatting(data.time_edit, 'YYYY-MM-DD'),
                  user_input: data.user_input,
                  user_edit: data.user_edit,
                }

                this.M_FM_FleetMaintenance.fm_fleet_status_idLabel = this.M_FM_FleetMaintenance.fm_fleet_status_id_cd != null && this.M_FM_FleetMaintenance.fm_fleet_status_id_cd != '' ? data.fm_fleet_status_id_cd + this.separator + data.fm_fleet_status_id_descs :'' 
                this.M_FM_FleetMaintenance.cm_staff_idLabel = this.M_FM_FleetMaintenance.cm_staff_id_cd != null && this.M_FM_FleetMaintenance.cm_staff_id_cd != '' ? data.cm_staff_id_cd + this.separator + data.cm_staff_id_descs :'' 


                this.IEBy.Input = data.user_input
                this.IEBy.Edit = data.user_edit

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

