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
                                      <ABSinputTextVuex :prop="PI_fleet_type_cd" v-model="M_FM_FleetType.fleet_type_cd"  ref="ref_fleet_type_cd"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_descs" v-model="M_FM_FleetType.descs"  ref="ref_descs"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Onmm_maintenance_mstr_idChange" :prop="PI_mm_maintenance_mstr_id" :value="M_FM_FleetType.mm_maintenance_mstr_id" :label="M_FM_FleetType.mm_maintenance_mstr_idLabel" ref="ref_mm_maintenance_mstr_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_weigth" v-model="M_FM_FleetType.weigth"  ref="ref_weigth"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Oncm_uom_idChange" :prop="PI_cm_uom_id" :value="M_FM_FleetType.cm_uom_id" :label="M_FM_FleetType.cm_uom_idLabel" ref="ref_cm_uom_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_volume" v-model="M_FM_FleetType.volume"  ref="ref_volume"/>
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
    props: {PageLevel: '', TabIndex: '', data: ''},
    data() {
        return {
		cInsertKey:'',
		FormType: "List",
		Module:"FM",
            propList: {
                initialWhere: "",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			
            M_FM_FleetType: {
              fm_fleet_type_id: 0,
              fleet_type_cd: '',
              descs: '',
              mm_maintenance_mstr_id: 0,
              mm_maintenance_mstr_id_cd: '',
              mm_maintenance_mstr_id_descs: '',
              weigth: 0.00,
              cm_uom_id: 0,
              cm_uom_id_cd: '',
              cm_uom_id_descs: '',
              volume: 0.00,
              row_id: 0,
              lastupdatestamp: 0,
              time_edit: '',
              user_input: '',
              user_edit: '',
            },
            PI_fleet_type_cd: { 
                cValidate :'required|max:20', 
                cName: 'fleet_type_cd', 
                cLabel: 'Fleet Type Code', 
                cLabelSize: 4, 
                cOrder: 1, 
                cKey: true, 
                cType: 'text',
                cVisible: true, 
                cDefault: '', 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_descs: { 
                cValidate :'required|max:255', 
                cName: 'descs', 
                cLabel: 'Description', 
                cLabelSize: 4, 
                cOrder: 2, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cDefault: '', 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_mm_maintenance_mstr_id: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupMMMaintenance'    , 
                    ColumnDB: 'maintenance_type'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'maintenance_type,descs' 
                        }, 
                cValidate :'required', 
                cName: 'mm_maintenance_mstr_id', 
                cLabel: 'Maintenance Type', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 3, 
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
                cDisplayColumn: 'maintenance_type,descs' ,
            }, 

            PI_weigth: { 
                cValidate :'', 
                cName: 'weigth', 
                cLabel: 'Weigth', 
                cLabelSize: 4, 
                cOrder: 4, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cDefault: '', 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_cm_uom_id: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMUom'    , 
                    ColumnDB: 'uom_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'uom_cd,descs' 
                        }, 
                cValidate :'', 
                cName: 'cm_uom_id', 
                cLabel: 'UOM', 
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
                cDisplayColumn: 'uom_cd,descs' ,
            }, 

            PI_volume: { 
                cValidate :'', 
                cName: 'volume', 
                cLabel: 'Volume', 
                cLabelSize: 4, 
                cOrder: 6, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
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
		return this.$store.getters.GetPage1Data
	},
	GetDataBy1(){
		return this.$store.getters.GetPage1GetDataBy
	}
  },
    methods: {		
        Onmm_maintenance_mstr_idChange (data) {
          this.$nextTick(() => {
            this.M_FM_FleetType.mm_maintenance_mstr_id = data.id
            this.M_FM_FleetType.mm_maintenance_mstr_idLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{mm_maintenance_mstr_id}
            }
          })
          this.$forceUpdate()
        },
        Oncm_uom_idChange (data) {
          this.$nextTick(() => {
            this.M_FM_FleetType.cm_uom_id = data.id
            this.M_FM_FleetType.cm_uom_idLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{cm_uom_id}
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
        },	
		M_CheckboxChecked(data, status, index){

        },		
        M_Post(dt){
        },
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                fleet_type_cd: this.M_FM_FleetType.fleet_type_cd,
                descs: this.M_FM_FleetType.descs,
                mm_maintenance_mstr_id: this.M_FM_FleetType.mm_maintenance_mstr_id == '' || this.M_FM_FleetType.mm_maintenance_mstr_id == null ? 'NULL' : this.M_FM_FleetType.mm_maintenance_mstr_id,
                weigth: parseFloat(this.M_FM_FleetType.weigth ? this.replaceAllString(this.M_FM_FleetType.weigth, ',', '', 'number') : 0),
                cm_uom_id: this.M_FM_FleetType.cm_uom_id == '' || this.M_FM_FleetType.cm_uom_id == null ? 'NULL' : this.M_FM_FleetType.cm_uom_id,
                volume: parseFloat(this.M_FM_FleetType.volume ? this.replaceAllString(this.M_FM_FleetType.volume, ',', '', 'number') : 0),
                user_input: this.getDataUser().user_id,

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
                fm_fleet_type_id: this.M_FM_FleetType.fm_fleet_type_id,
                fleet_type_cd: this.M_FM_FleetType.fleet_type_cd,
                descs: this.M_FM_FleetType.descs,
                mm_maintenance_mstr_id: this.M_FM_FleetType.mm_maintenance_mstr_id == '' || this.M_FM_FleetType.mm_maintenance_mstr_id == null ? 'NULL' : this.M_FM_FleetType.mm_maintenance_mstr_id,
                weigth: parseFloat(this.M_FM_FleetType.weigth ? this.replaceAllString(this.M_FM_FleetType.weigth, ',', '', 'number') : 0),
                cm_uom_id: this.M_FM_FleetType.cm_uom_id == '' || this.M_FM_FleetType.cm_uom_id == null ? 'NULL' : this.M_FM_FleetType.cm_uom_id,
                volume: parseFloat(this.M_FM_FleetType.volume ? this.replaceAllString(this.M_FM_FleetType.volume, ',', '', 'number') : 0),
                lastupdatestamp: this.M_FM_FleetType.lastupdatestamp,
                user_edit: this.getDataUser().user_id,

            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return
				
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_FM_FleetType = {
              fm_fleet_type_id: 0,
              fleet_type_cd: '',
              descs: '',
              mm_maintenance_mstr_id: 0,
              mm_maintenance_mstr_id_cd: '',
              mm_maintenance_mstr_id_descs: '',
              weigth: 0.00,
              cm_uom_id: 0,
              cm_uom_id_cd: '',
              cm_uom_id_descs: '',
              volume: 0.00,
              row_id: 0,
              lastupdatestamp: 0,
              time_edit: '',
              user_input: '',
              user_edit: '',
            }
		},
        M_New(){

        },
        M_Edit(){
        },
        M_Delete(dt){       
			var data = this.FormToABSList().getRowSelected()  
			var dataDelete = []

			
			data.forEach((value) => {

				
				dataDelete.push({
                fm_fleet_type_id: value.fm_fleet_type_id,
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
                fm_fleet_type_id: record.fm_fleet_type_id,

            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                this.M_FM_FleetType = {
                  fm_fleet_type_id: data.fm_fleet_type_id,
                  fleet_type_cd: data.fleet_type_cd,
                  descs: data.descs,
                  mm_maintenance_mstr_id: data.mm_maintenance_mstr_id,
                  mm_maintenance_mstr_id_cd: data.mm_maintenance_mstr_id_cd,
                  mm_maintenance_mstr_id_descs: data.mm_maintenance_mstr_id_descs,
                  weigth: this.isCurrency(data.weigth, this.decimal),
                  cm_uom_id: data.cm_uom_id,
                  cm_uom_id_cd: data.cm_uom_id_cd,
                  cm_uom_id_descs: data.cm_uom_id_descs,
                  volume: this.isCurrency(data.volume, this.decimal),
                  row_id: data.row_id,
                  lastupdatestamp: record.lastupdatestamp,
                  time_edit: this.momentDateFormatting(data.time_edit, 'YYYY-MM-DD'),
                  user_input: data.user_input,
                  user_edit: data.user_edit,
                }

                this.M_FM_FleetType.mm_maintenance_mstr_idLabel = this.M_FM_FleetType.mm_maintenance_mstr_id_cd != null && this.M_FM_FleetType.mm_maintenance_mstr_id_cd != '' ? data.mm_maintenance_mstr_id_cd + this.separator + data.mm_maintenance_mstr_id_descs :'' 
                this.M_FM_FleetType.cm_uom_idLabel = this.M_FM_FleetType.cm_uom_id_cd != null && this.M_FM_FleetType.cm_uom_id_cd != '' ? data.cm_uom_id_cd + this.separator + data.cm_uom_id_descs :'' 


                this.IEBy.Input = data.user_input
                this.IEBy.Edit = data.user_edit

            })
        }

    },
    beforeCreate: function () {
    },
    created: function() {
		this.$store.commit('setFormType','List')
		this.getToolbar().ProcessPS()
    },
    beforeMount: function() {
    },
    mounted: function() {
        this.hideSideBarMenu()
		this.FormToABSList().doGetList('','eb_getList')

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

