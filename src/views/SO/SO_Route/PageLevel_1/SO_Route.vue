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
                                      <ABSInputSelectList @change="Onso_zone_id_fromChange" :prop="PI_so_zone_id_from" :value="M_SO_Route.so_zone_id_from" :label="M_SO_Route.so_zone_id_fromLabel" ref="ref_so_zone_id_from"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Onso_zone_id_toChange" :prop="PI_so_zone_id_to" :value="M_SO_Route.so_zone_id_to" :label="M_SO_Route.so_zone_id_toLabel" ref="ref_so_zone_id_to"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_cost_amount" v-model="M_SO_Route.cost_amount"  ref="ref_cost_amount"/>
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
		Module:"SO",
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
            M_SO_Route: {
              so_route_h_id: 0,
              subportfolio_cd: '',
              so_zone_id_from: 0,
              so_zone_id_from_cd: '',
              so_zone_id_from_descs: '',
              so_zone_id_to: 0,
              so_zone_id_to_cd: '',
              so_zone_id_to_descs: '',
              cost_amount: 0.00,
              row_id: 0,
              lastupdatestamp: 0,
              time_edit: '',
              user_input: '',
              user_edit: '',
            },
            PI_so_zone_id_from: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupSOZone'    , 
                    ColumnDB: 'zone_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'zone_cd,descs' 
                        }, 
                cValidate :'required', 
                cName: 'so_zone_id_from', 
                cLabel: 'Zone From', 
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
                cMasterUrl: 'SO/SO_Zone' ,
                cDisplayColumn: 'zone_cd,descs' ,
            }, 

            PI_so_zone_id_to: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupSOZone'    , 
                    ColumnDB: 'zone_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'zone_cd,descs' 
                        }, 
                cValidate :'required', 
                cName: 'so_zone_id_to', 
                cLabel: 'Zone To', 
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
                cMasterUrl: 'SO/SO_Zone' ,
                cDisplayColumn: 'zone_cd,descs' ,
            }, 

            PI_cost_amount: { 
                cValidate :'', 
                cName: 'cost_amount', 
                cLabel: 'Cost Amount', 
                cLabelSize: 4, 
                cOrder: 3, 
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
        Onso_zone_id_fromChange (data) {
          this.$nextTick(() => {
            this.M_SO_Route.so_zone_id_from = data.id
            this.M_SO_Route.so_zone_id_fromLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{so_zone_id_from}
            }
          })
          this.$forceUpdate()
        },
        Onso_zone_id_toChange (data) {
          this.$nextTick(() => {
            this.M_SO_Route.so_zone_id_to = data.id
            this.M_SO_Route.so_zone_id_toLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{so_zone_id_to}
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
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                so_zone_id_from: this.M_SO_Route.so_zone_id_from == '' || this.M_SO_Route.so_zone_id_from == null ? 'NULL' : this.M_SO_Route.so_zone_id_from,
                so_zone_id_to: this.M_SO_Route.so_zone_id_to == '' || this.M_SO_Route.so_zone_id_to == null ? 'NULL' : this.M_SO_Route.so_zone_id_to,
                cost_amount: parseFloat(this.M_SO_Route.cost_amount ? this.replaceAllString(this.M_SO_Route.cost_amount, ',', '', 'number') : 0),
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
                so_route_h_id: this.M_SO_Route.so_route_h_id,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                so_zone_id_from: this.M_SO_Route.so_zone_id_from == '' || this.M_SO_Route.so_zone_id_from == null ? 'NULL' : this.M_SO_Route.so_zone_id_from,
                so_zone_id_to: this.M_SO_Route.so_zone_id_to == '' || this.M_SO_Route.so_zone_id_to == null ? 'NULL' : this.M_SO_Route.so_zone_id_to,
                cost_amount: parseFloat(this.M_SO_Route.cost_amount ? this.replaceAllString(this.M_SO_Route.cost_amount, ',', '', 'number') : 0),
                lastupdatestamp: this.M_SO_Route.lastupdatestamp,
                user_edit: this.getDataUser().user_id,

            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return
				
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_SO_Route = {
              so_route_h_id: 0,
              subportfolio_cd: '',
              so_zone_id_from: 0,
              so_zone_id_from_cd: '',
              so_zone_id_from_descs: '',
              so_zone_id_to: 0,
              so_zone_id_to_cd: '',
              so_zone_id_to_descs: '',
              cost_amount: 0.00,
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
                so_route_h_id: value.so_route_h_id,
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
                so_route_h_id: record.so_route_h_id,

            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                this.M_SO_Route = {
                  so_route_h_id: data.so_route_h_id,
                  subportfolio_cd: data.subportfolio_cd,
                  so_zone_id_from: data.so_zone_id_from,
                  so_zone_id_from_cd: data.so_zone_id_from_cd,
                  so_zone_id_from_descs: data.so_zone_id_from_descs,
                  so_zone_id_to: data.so_zone_id_to,
                  so_zone_id_to_cd: data.so_zone_id_to_cd,
                  so_zone_id_to_descs: data.so_zone_id_to_descs,
                  cost_amount: this.isCurrency(data.cost_amount, this.decimal),
                  row_id: data.row_id,
                  lastupdatestamp: record.lastupdatestamp,
                  time_edit: this.momentDateFormatting(data.time_edit, 'YYYY-MM-DD'),
                  user_input: data.user_input,
                  user_edit: data.user_edit,
                }

                this.M_SO_Route.so_zone_id_fromLabel = this.M_SO_Route.so_zone_id_from_cd != null && this.M_SO_Route.so_zone_id_from_cd != '' ? data.so_zone_id_from_cd + this.separator + data.so_zone_id_from_descs :'' 
                this.M_SO_Route.so_zone_id_toLabel = this.M_SO_Route.so_zone_id_to_cd != null && this.M_SO_Route.so_zone_id_to_cd != '' ? data.so_zone_id_to_cd + this.separator + data.so_zone_id_to_descs :'' 


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

