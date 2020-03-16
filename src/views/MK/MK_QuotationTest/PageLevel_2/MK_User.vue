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
                                      <ABSinputTextVuex :prop="PI_user_id" v-model="M_MK_User.user_id"  ref="ref_user_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_user_name" v-model="M_MK_User.user_name"  ref="ref_user_name"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Onuser_groupChange" :prop="PI_user_group" :value="M_MK_User.user_group" :label="M_MK_User.user_groupLabel" ref="ref_user_group"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_password" v-model="M_MK_User.password"  ref="ref_password"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_email" v-model="M_MK_User.email"  ref="ref_email"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_user_level" v-model="M_MK_User.user_level"  ref="ref_user_level"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_is_inactive" v-model="M_MK_User.is_inactive"  ref="ref_is_inactive"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputRadioButtonVuex @input="Onuser_typeChange" :prop="PI_user_type" v-model="M_MK_User.user_type"  ref="ref_user_type" />
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
		Module:"MK",
       
            IEBy: {Input: '', Edit: ''},   			
            M_MK_User: {
              ss_user_test_id: 0,
              user_id: '',
              user_group: '',
              user_name: '',
              password: '',
              email: '',
              user_level: 'I',
              expired_date: '',
              login_date: '',
              status_login: '',
              is_inactive: 'N',
              position: '',
              hand_phone: '',
              reference_no: '',
              control_sequence_no: 0,
              user_type: '',
              failed_attempts: 0,
              last_change_password: '',
              default_language: '',
              row_id: 0,
              lastupdatestamp: 0,
              time_edit: '',
              user_input: '',
              user_edit: '',
            },
            PI_user_id: { 
                cValidate :'required|max:10', 
                cName: 'user_id', 
                cLabel: 'User Id', 
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

            PI_user_name: { 
                cValidate :'required|max:60', 
                cName: 'user_name', 
                cLabel: 'User Name', 
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

            PI_user_group: { 
                dataLookUp: { 
                    LookUpCd: 'GetUserGroup'    , 
                    ColumnDB: 'user_group'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: '' 
                        }, 
                cValidate :'required', 
                cName: 'user_group', 
                cLabel: 'User Group', 
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
                cDisplayColumn: '' ,
            }, 

            PI_password: { 
                cValidate :'required|max:40', 
                cName: 'password', 
                cLabel: 'Password', 
                cLabelSize: 4, 
                cOrder: 4, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cDefault: '', 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_email: { 
                cValidate :'required|max:60', 
                cName: 'email', 
                cLabel: 'Email', 
                cLabelSize: 4, 
                cOrder: 5, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cDefault: '', 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_user_level: { 
                cValidate :'required|max:1', 
                cName: 'user_level', 
                cLabel: 'User Level', 
                cLabelSize: 4, 
                cOrder: 6, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cDefault: 'I', 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_is_inactive: { 
                cValidate :'required|max:1', 
                cName: 'is_inactive', 
                cLabel: 'Is In Activate', 
                cLabelSize: 4, 
                cOrder: 7, 
                cKey: false, 
                cType: 'text',
                cVisible: false, 
                cDefault: 'N', 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_user_type: { 
                cValidate :'required', 
                cName: 'user_type', 
                cId: 'rdbuser_type', 
                cRadioOptions: [{ text: 'Manager', value: 'M' }, { text: 'Customer', value: 'C' }], 
                cRadioDefaultOption: '', 
                cLabel:'User Type', 
                cLabelSize: 4, 
                cDefault: '', 
                cOrder: 8, 
                cProtect: false, 
                cVisible:  true, 
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
        Onuser_groupChange (data) {
          this.$nextTick(() => {
            this.M_MK_User.user_group = data.id
            this.M_MK_User.user_groupLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{user_group}
            }
          })
          this.$forceUpdate()
        },
        Onuser_typeChange (data) {
          this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              //{user_type}
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
          this.$store.commit('setFormType','Form')
		      this.getToolbar().ProcessPS()

          this.getDataBy()
        },	
		M_CheckboxChecked(data, status, index){

        },		
        M_Post(dt){
        },
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                user_id: this.M_MK_User.user_id,
                user_group: this.M_MK_User.user_group == '' || this.M_MK_User.user_group == null ? 'NULL' : this.M_MK_User.user_group,
                user_name: this.M_MK_User.user_name,
                password: this.M_MK_User.password,
                email: this.M_MK_User.email,
                user_level: this.M_MK_User.user_level,
                expired_date: this.M_MK_User.expired_date,
                login_date: this.M_MK_User.login_date,
                status_login: this.M_MK_User.status_login,
                is_inactive: this.M_MK_User.is_inactive,
                position: this.M_MK_User.position,
                hand_phone: this.M_MK_User.hand_phone,
                reference_no: this.M_MK_User.reference_no,
                control_sequence_no: this.M_MK_User.control_sequence_no,
                user_type: this.M_MK_User.user_type,
                failed_attempts: this.M_MK_User.failed_attempts,
                last_change_password: this.M_MK_User.last_change_password,
                default_language: this.M_MK_User.default_language,
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
                ss_user_test_id: this.M_MK_User.ss_user_test_id,
                user_id: this.M_MK_User.user_id,
                user_group: this.M_MK_User.user_group == '' || this.M_MK_User.user_group == null ? 'NULL' : this.M_MK_User.user_group,
                user_name: this.M_MK_User.user_name,
                password: this.M_MK_User.password,
                email: this.M_MK_User.email,
                user_level: this.M_MK_User.user_level,
                expired_date: this.M_MK_User.expired_date,
                login_date: this.M_MK_User.login_date,
                status_login: this.M_MK_User.status_login,
                is_inactive: this.M_MK_User.is_inactive,
                position: this.M_MK_User.position,
                hand_phone: this.M_MK_User.hand_phone,
                reference_no: this.M_MK_User.reference_no,
                control_sequence_no: this.M_MK_User.control_sequence_no,
                user_type: this.M_MK_User.user_type,
                failed_attempts: this.M_MK_User.failed_attempts,
                last_change_password: this.M_MK_User.last_change_password,
                default_language: this.M_MK_User.default_language,
                lastupdatestamp: this.M_MK_User.lastupdatestamp,
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
            this.M_MK_User = {
              ss_user_test_id: 0,
              user_id: '',
              user_group: '',
              user_name: '',
              password: '',
              email: '',
              user_level: 'I',
              expired_date: '',
              login_date: '',
              status_login: '',
              is_inactive: 'N',
              position: '',
              hand_phone: '',
              reference_no: '',
              control_sequence_no: 0,
              user_type: '',
              failed_attempts: 0,
              last_change_password: '',
              default_language: '',
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
                ss_user_test_id: value.ss_user_test_id,
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
                user_id: this.getDataUser().user_id,

            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                if (response.Data.length > 0) {
                  this.getToolbar().FormStatus = 'EDIT'
                  this.getToolbar().ProcessPS()

                  var data = response.Data[0]
                  this.M_MK_User = {
                  ss_user_test_id: data.ss_user_test_id,
                  user_id: data.user_id,
                  user_group: data.user_group,
                  user_name: data.user_name,
                  password: data.password,
                  email: data.email,
                  user_level: data.user_level,
                  expired_date: data.expired_date,
                  login_date: data.login_date,
                  status_login: data.status_login,
                  is_inactive: data.is_inactive,
                  position: data.position,
                  hand_phone: data.hand_phone,
                  reference_no: data.reference_no,
                  control_sequence_no: data.control_sequence_no,
                  user_type: data.user_type,
                  failed_attempts: data.failed_attempts,
                  last_change_password: data.last_change_password,
                  default_language: data.default_language,
                  row_id: data.row_id,
                  lastupdatestamp: record.lastupdatestamp,
                  time_edit: data.time_edit,
                  user_input: data.user_input,
                  user_edit: data.user_edit,
                  }
                  
                this.IEBy.Input = data.user_input
                this.IEBy.Edit = data.user_edit

                this.M_MK_User.user_groupLabel = this.M_MK_User.user_group_cd != null && this.M_MK_User.user_group_cd != '' ? data.user_group_cd + this.separator + data.user_group_descs :'' 
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
		// this.$store.commit('setFormType','Form')
		// this.getToolbar().ProcessPS()
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

