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
                                      <ABSinputTextVuex :prop="PI_user_id" v-model="M_SS_UserProfile.user_id"  ref="ref_user_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_user_name" v-model="M_SS_UserProfile.user_name"  ref="ref_user_name"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_hand_phone" v-model="M_SS_UserProfile.hand_phone"  ref="ref_hand_phone"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_email" v-model="M_SS_UserProfile.email"  ref="ref_email"/>
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
		Module:"SS",
       
            IEBy: {Input: '', Edit: ''},   			
            M_SS_UserProfile: {
              ss_user_id: 0,
              user_group: '',
              password: '',
              user_level: '',
              expired_date: '',
              login_date: '',
              status_login: '',
              is_inactive: '',
              position: '',
              reference_no: '',
              control_sequence_no: 0,
              user_type: '',
              failed_attempts: 0,
              last_change_password: '',
              default_language: '',
              user_id: '',
              user_name: '',
              hand_phone: '',
              email: '',
              row_id: 0,
              lastupdatestamp: 0,
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
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_hand_phone: { 
                cValidate :'max:60', 
                cName: 'hand_phone', 
                cLabel: 'Hand Phone', 
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

            PI_email: { 
                cValidate :'required|max:60', 
                cName: 'email', 
                cLabel: 'Email', 
                cLabelSize: 4, 
                cOrder: 4, 
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
		return this.$store.getters.GetPage1Data
	},
	GetDataBy1(){
		return this.$store.getters.GetPage1GetDataBy
	}
  },
    methods: {		
	
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
                user_id: this.M_SS_UserProfile.user_id,
                user_group: this.M_SS_UserProfile.user_group,
                user_name: this.M_SS_UserProfile.user_name,
                password: this.M_SS_UserProfile.password,
                email: this.M_SS_UserProfile.email,
                user_level: this.M_SS_UserProfile.user_level,
                expired_date: this.M_SS_UserProfile.expired_date == '' || this.M_SS_UserProfile.expired_date == null ? 'NULL' : this.M_SS_UserProfile.expired_date,
                login_date: this.M_SS_UserProfile.login_date == '' || this.M_SS_UserProfile.login_date == null ? 'NULL' : this.M_SS_UserProfile.login_date,
                status_login: this.M_SS_UserProfile.status_login,
                is_inactive: this.M_SS_UserProfile.is_inactive,
                position: this.M_SS_UserProfile.position,
                hand_phone: this.M_SS_UserProfile.hand_phone,
                reference_no: this.M_SS_UserProfile.reference_no,
                control_sequence_no: parseFloat(this.M_SS_UserProfile.control_sequence_no ? this.replaceAllString(this.M_SS_UserProfile.control_sequence_no, ',', '', 'number') : 0),
                user_type: this.M_SS_UserProfile.user_type,
                failed_attempts: parseFloat(this.M_SS_UserProfile.failed_attempts ? this.replaceAllString(this.M_SS_UserProfile.failed_attempts, ',', '', 'number') : 0),
                last_change_password: this.M_SS_UserProfile.last_change_password,
                default_language: this.M_SS_UserProfile.default_language,
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
                ss_user_id: this.M_SS_UserProfile.ss_user_id,
                user_id: this.M_SS_UserProfile.user_id,
                user_group: this.M_SS_UserProfile.user_group,
                user_name: this.M_SS_UserProfile.user_name,
                password: this.M_SS_UserProfile.password,
                email: this.M_SS_UserProfile.email,
                user_level: this.M_SS_UserProfile.user_level,
                expired_date: this.M_SS_UserProfile.expired_date == '' || this.M_SS_UserProfile.expired_date == null ? 'NULL' : this.M_SS_UserProfile.expired_date,
                login_date: this.M_SS_UserProfile.login_date == '' || this.M_SS_UserProfile.login_date == null ? 'NULL' : this.M_SS_UserProfile.login_date,
                status_login: this.M_SS_UserProfile.status_login,
                is_inactive: this.M_SS_UserProfile.is_inactive,
                position: this.M_SS_UserProfile.position,
                hand_phone: this.M_SS_UserProfile.hand_phone,
                reference_no: this.M_SS_UserProfile.reference_no,
                control_sequence_no: parseFloat(this.M_SS_UserProfile.control_sequence_no ? this.replaceAllString(this.M_SS_UserProfile.control_sequence_no, ',', '', 'number') : 0),
                user_type: this.M_SS_UserProfile.user_type,
                failed_attempts: parseFloat(this.M_SS_UserProfile.failed_attempts ? this.replaceAllString(this.M_SS_UserProfile.failed_attempts, ',', '', 'number') : 0),
                last_change_password: this.M_SS_UserProfile.last_change_password,
                default_language: this.M_SS_UserProfile.default_language,
                lastupdatestamp: this.M_SS_UserProfile.lastupdatestamp,
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
            this.M_SS_UserProfile = {
              ss_user_id: 0,
              user_group: '',
              password: '',
              user_level: '',
              expired_date: '',
              login_date: '',
              status_login: '',
              is_inactive: '',
              position: '',
              reference_no: '',
              control_sequence_no: 0,
              user_type: '',
              failed_attempts: 0,
              last_change_password: '',
              default_language: '',
              user_id: '',
              user_name: '',
              hand_phone: '',
              email: '',
              row_id: 0,
              lastupdatestamp: 0,
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
                ss_user_id: value.ss_user_id,
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
                  this.M_SS_UserProfile = {
                  ss_user_id: data.ss_user_id,
                  user_group: data.user_group,
                  password: data.password,
                  user_level: data.user_level,
                  expired_date: data.expired_date,
                  login_date: data.login_date,
                  status_login: data.status_login,
                  is_inactive: data.is_inactive,
                  position: data.position,
                  reference_no: data.reference_no,
                  control_sequence_no: data.control_sequence_no,
                  user_type: data.user_type,
                  failed_attempts: data.failed_attempts,
                  last_change_password: data.last_change_password,
                  default_language: data.default_language,
                  user_id: data.user_id,
                  user_name: data.user_name,
                  hand_phone: data.hand_phone,
                  email: data.email,
                  row_id: data.row_id,
                  lastupdatestamp: data.lastupdatestamp,
                  }
                }
                else {
                  this.getToolbar().FormStatus = 'NEW'
                  this.getToolbar().ProcessPS()
                }




                this.IEBy.Input = data.user_input
                this.IEBy.Edit = data.user_edit

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
        this.hideSideBarMenu()
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

