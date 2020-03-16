<template>
    <div>        


        <div v-show="true"  :style="'margin-top:10px;'" class="el" mousetip mousetip-msg="I'm a tooltip">
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
                                      <ABSInputSelectList @change="Onrunning_order_idChange" :prop="PI_running_order_id" :value="M_SO_Specification.running_order_id" :label="M_SO_Specification.running_order_idLabel" ref="ref_running_order_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Onrunning_get_pass_idChange" :prop="PI_running_get_pass_id" :value="M_SO_Specification.running_get_pass_id" :label="M_SO_Specification.running_get_pass_idLabel" ref="ref_running_get_pass_id"/>
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
		FormType: "Form",
		Module:"SO",
       
            IEBy: {Input: '', Edit: ''},   			
            M_SO_Specification: {
              so_specifitaction_id: 0,
              subportfolio_cd: '',
              running_order_id: 0,
              running_order_id_cd: '',
              running_order_id_descs: '',
              running_get_pass_id: 0,
              running_get_pass_id_cd: '',
              running_get_pass_id_descs: '',
              row_id: 0,
              lastupdatestamp: 0,
              time_edit: '',
              user_input: '',
              user_edit: '',
            },
            PI_running_order_id: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMRunningCode'    , 
                    ColumnDB: 'running_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'running_cd,descs' 
                        }, 
                cValidate :'required', 
                cName: 'running_order_id', 
                cLabel: 'Running Order No', 
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
                cDisplayColumn: 'running_cd,descs' ,
            }, 

            PI_running_get_pass_id: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMRunningCode'    , 
                    ColumnDB: 'running_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'running_cd,descs' 
                        }, 
                cValidate :'required', 
                cName: 'running_get_pass_id', 
                cLabel: 'Running Get Pass', 
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
                cDisplayColumn: 'running_cd,descs' ,
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
        Onrunning_order_idChange (data) {
          this.$nextTick(() => {
            this.M_SO_Specification.running_order_id = data.id
            this.M_SO_Specification.running_order_idLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{running_order_id}
            }
          })
          this.$forceUpdate()
        },
        Onrunning_get_pass_idChange (data) {
          this.$nextTick(() => {
            this.M_SO_Specification.running_get_pass_id = data.id
            this.M_SO_Specification.running_get_pass_idLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{running_get_pass_id}
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
                running_order_id: this.M_SO_Specification.running_order_id == '' || this.M_SO_Specification.running_order_id == null ? 'NULL' : this.M_SO_Specification.running_order_id,
                running_get_pass_id: this.M_SO_Specification.running_get_pass_id == '' || this.M_SO_Specification.running_get_pass_id == null ? 'NULL' : this.M_SO_Specification.running_get_pass_id,
                user_input: this.getDataUser().user_id,

            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return
				          this.getToolbar().FormStatus = 'EDIT'
          this.getToolbar().ProcessPS()

                this.$parent.resultInsert(response.Message)
				
            })
        },
        M_Update() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                so_specifitaction_id: this.M_SO_Specification.so_specifitaction_id,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                running_order_id: this.M_SO_Specification.running_order_id == '' || this.M_SO_Specification.running_order_id == null ? 'NULL' : this.M_SO_Specification.running_order_id,
                running_get_pass_id: this.M_SO_Specification.running_get_pass_id == '' || this.M_SO_Specification.running_get_pass_id == null ? 'NULL' : this.M_SO_Specification.running_get_pass_id,
                lastupdatestamp: this.M_SO_Specification.lastupdatestamp,
                user_edit: this.getDataUser().user_id,

            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return
				          this.getToolbar().FormStatus = 'EDIT'
          this.getToolbar().ProcessPS()

                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_SO_Specification = {
              so_specifitaction_id: 0,
              subportfolio_cd: '',
              running_order_id: 0,
              running_order_id_cd: '',
              running_order_id_descs: '',
              running_get_pass_id: 0,
              running_get_pass_id_cd: '',
              running_get_pass_id_descs: '',
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
                so_specifitaction_id: value.so_specifitaction_id,
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
        getDataBy () {
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,

            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                if (response.Data.length > 0) {
                  this.getToolbar().FormStatus = 'EDIT'
                  this.getToolbar().ProcessPS()

                  var data = response.Data[0]
                  this.M_SO_Specification = {
                  so_specifitaction_id: data.so_specifitaction_id,
                  subportfolio_cd: data.subportfolio_cd,
                  running_order_id: data.running_order_id,
                  running_order_id_cd: data.running_order_id_cd,
                  running_order_id_descs: data.running_order_id_descs,
                  running_get_pass_id: data.running_get_pass_id,
                  running_get_pass_id_cd: data.running_get_pass_id_cd,
                  running_get_pass_id_descs: data.running_get_pass_id_descs,
                  row_id: data.row_id,
                  lastupdatestamp: data.lastupdatestamp,
                  time_edit: this.momentDateFormatting(data.time_edit, 'YYYY-MM-DD'),
                  user_input: data.user_input,
                  user_edit: data.user_edit,
                  }

                                  this.M_SO_Specification.running_order_idLabel = this.M_SO_Specification.running_order_id_cd != null && this.M_SO_Specification.running_order_id_cd != '' ? data.running_order_id_cd + this.separator + data.running_order_id_descs :'' 
                                  this.M_SO_Specification.running_get_pass_idLabel = this.M_SO_Specification.running_get_pass_id_cd != null && this.M_SO_Specification.running_get_pass_id_cd != '' ? data.running_get_pass_id_cd + this.separator + data.running_get_pass_id_descs :'' 


                  this.IEBy.Input = data.user_input
                  this.IEBy.Edit = data.user_edit
                }
                else {
                  this.getToolbar().FormStatus = 'NEW'
                  this.getToolbar().ProcessPS()
                }

            })
        }

    },
    beforeCreate: function () {
    },
    created: function() {
		this.$store.commit('setFormType','Form')
		this.getToolbar().ProcessPS()
    },
    beforeMount: function() {
    },
    mounted: function() {
		this.getDataBy()

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

