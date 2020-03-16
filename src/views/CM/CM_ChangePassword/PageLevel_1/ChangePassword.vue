<template>
    <div>
        <div :style="'margin-top:10px;'" class="el" mousetip mousetip-msg="I'm a tooltip">
            <div class="div-collapse" v-b-toggle.collapse1>
                <span class="master-span" v-show="IEBy.Input && IEBy.Edit">
                    Input By : {{IEBy.Input}} | Edit By : {{IEBy.Edit}} <font-awesome-icon icon="sort-down" class="icon-style-1__master" /> 
                </span>
            </div>
            <b-collapse id="collapse1" :visible="true">
                <b-row  style="padding-left: 10px; padding-bottom: 10px; !important;">              
                    <b-col md="12" id="col-left" class="bColMasterForm">
                        <b-form :data-vv-scope="'FormScope_' + PageLevel + '_' + TabIndex" :data-vv-value-path="'FormScope_' + PageLevel + '_' + TabIndex">
                            <b-row  style="padding-left: 10px; padding-bottom: 10px; !important;">              
                                <b-col md="12" id="col-left">
                                    <b-row>
                                        <b-col md="6">
                                            <ABSinputTextVuex :prop="PI_UserId" v-model="M_ChangePassword.UserId"/>
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col md="6">
                                            <ABSinputTextVuex :prop="PI_Username" v-model="M_ChangePassword.Username"/>
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col md="6">
                                            <ABSinputPassword @input="OnOldPasswordChange" :prop="PI_OldPassword" v-model="M_ChangePassword.OldPassword"/>
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col md="6">
                                            <ABSinputPassword @input="OnNewPasswordChange" :prop="PI_NewPassword" v-model="M_ChangePassword.NewPassword"/>
                                        </b-col>
                                    </b-row>
                                    <!-- <b-row>
                                        <b-col md="6" v-show="err2">
                                            <b-row v-show="err2">
                                                <b-col offset="4"><label class="lbl-value-view-form" style="color:red"> incorect password </label></b-col>
                                            </b-row>                                            
                                        </b-col>
                                    </b-row> -->
                                    <b-row>
                                        <b-col md="6">
                                            <ABSinputPassword @input="OnConfirmPasswordChange" :prop="PI_ConfirmPassword" v-model="M_ChangePassword.ConfirmPassword"/>
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col md="6" v-show="err1">                                            
                                            <b-row v-show="err1">
                                                <b-col offset="4"><label class="lbl-value-view-form" style="color:red"> incorect password</label></b-col>
                                            </b-row>                                           
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
            FormType: "Form",
            // Module:"CM",
            error: false,
            err1: false,
            err2: false,

            M_ChangePassword :{
                UserId: this.getDataUser().user_id,
                Username: this.getDataUser().username,
                OldPassword : '',
                NewPassword : '',
                ConfirmPassword : ''
            }
            ,			
            IEBy: {Input: '', Edit: ''},

            PI_UserId: { 
                cValidate :'', 
                cName: 'UserId', 
                cLabel: 'User Id', 
                cLabelSize: 4, 
                cOrder: 1, 
                cKey: true, 
                cType: 'text',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_Username: { 
                cValidate :'', 
                cName: 'Username', 
                cLabel: 'Username', 
                cLabelSize: 4, 
                cOrder: 1, 
                cKey: true, 
                cType: 'text',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_OldPassword: { 
                cValidate :'', 
                cName: 'OldPassword', 
                cLabel: 'Old Password', 
                cLabelSize: 4, 
                cOrder: 1, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_NewPassword: { 
                cValidate :'', 
                cName: 'NewPassword', 
                cLabel: 'New Password', 
                cLabelSize: 4, 
                cOrder: 1, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_ConfirmPassword: { 
                cValidate :'', 
                cName: 'ConfirmPassword', 
                cLabel: 'Confirm Password', 
                cLabelSize: 4, 
                cOrder: 1, 
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
    }
  },
    methods: {
        OnOldPasswordChange (data) {
            this.$nextTick(() =>{

            })
            this.$forceUpdate()
        },

        OnNewPasswordChange (data) {
            if(data != this.M_ChangePassword.ConfirmPassword){
                this.error = true
                this.err1 = true
            }else{
                this.err1 = false
                this.error = false
            }
            this.$nextTick(() =>{

            })
            this.$forceUpdate()
        },

        OnConfirmPasswordChange (data) {
            if(data != this.M_ChangePassword.NewPassword){
                this.error = true
                this.err1 = true
            }else{
                this.err1 = false
                this.error = false
            }
            this.$nextTick(() =>{

            })
            this.$forceUpdate()
        },       
	
		setToolbarButton () {
           //this.getToolbar().statusFunction[4].disabled = false
		},		
        M_Post(){            
        },
        M_Refresh(){
        },
        M_New(){            
            // this.$nextTick().then(() => document.getElementById("???").focus())
        },
        M_Edit(){
            // this.$refs.ref_ContactRunningCd.focus()
            // this.$nextTick().then(() => document.getElementById("???").focus())
        },
        M_Delete(dt){            
        },		
        M_Insert () {
            
        },
        M_Update () {
            if(this.M_ChangePassword.NewPassword != this.M_ChangePassword.ConfirmPassword){
                this.alertError('incorect password')
                return
            }

            var param = {
                user_id: this.getDataUser().user_id,
                old_password: this.M_ChangePassword.OldPassword,
                new_password: this.M_ChangePassword.NewPassword,
                confirm_password: this.M_ChangePassword.ConfirmPassword,
            }

            this.postEncode(this.getUrlAuthChangePassword(), param)
            .then( response => {
                console.log(response)
                if(response == null) return

                this.getToolbar().FormStatus = 'EDIT'
                this.getToolbar().ProcessPS()
                this.$parent.resultUpdate(response.Message)

            })
            // var param = {			
            //     OptionSeq: this.getOptionSeq().OptionSeq,
            //     LineNo: this.$parent.data.page_order,
            //     contact_running_cd: this.M_CM_Specification.ContactRunningCd,
            //     tax_reg_min: this.M_CM_Specification.TaxRegMin,
            //     tax_reg_max: this.M_CM_Specification.TaxRegMax,
            //     id_no_min: this.M_CM_Specification.IdNoMin,
            //     id_no_max: this.M_CM_Specification.IdNoMax,
            //     passport_no_min: this.M_CM_Specification.PassportNoMin,
            //     passport_no_max: this.M_CM_Specification.PassportNoMax,
            //     document_approval: this.M_CM_Specification.DocumentApproval,
            //     remarks: this.M_CM_Specification.Remarks,
            //     user_edit: this.getDataUser().user_id ,
            //     classification_mandatory: this.M_CM_Specification.ClassificationMandatory,
            //     contact_approval: this.M_CM_Specification.ContactApproval,
            //     lastupdatestamp: this.M_CM_Specification.LastUpdateStamp                
            // }

            // this.postJSON(this.getUrlUpdate(), param)
            // .then((response) => {
            //     if(response == null) return
            //     this.getToolbar().FormStatus = 'EDIT'
            //     this.getToolbar().ProcessPS()
            //     this.$parent.resultUpdate(response.Message)
            // })			
        },
        // M_ClearForm(){
        //     this.M_CM_Specification ={
        //         ContactRunningCd: '',
        //         Remarks: '',
        //         UserInput: '',
        //         UserEdit: this.getDataUser().user_id,
        //         TimeInput: '',
        //         TimeEdit: '',
        //         LastUpdateStamp: 0,
        //         ControlSequenceNo: 0,
        //         TaxRegMin: '',
        //         TaxRegMax: '',
        //         ClassificationMandatory: 'Y',
        //         ContactApproval: 'Y',
        //         IdNoMin: '',
        //         IdNoMax: '',
        //         PassportNoMin: '',
        //         PassportNoMax: '',
        //         DocumentApproval: 'Y',
        //         RowId: 0, 
        //         RunningCdDescs: ''
        //     }
        // },        
        paramFromParent(){
        },
        rowLink: function(url){
        },
        getDataBy () {
            // var x = {
            //     param: this.getDataUser().user_id
            // }

            this.getJSON(this.getUrlAuthDecrypt() + this.getDataUser().user_id)
            .then((response) => {
               this.M_ChangePassword = {
                    UserId: response.Data,
                    Username: this.getDataUser().user_name
                }              
            })
            
                        
            
            this.getToolbar().FormStatus = 'EDIT'
            this.getToolbar().ProcessPS()
            
            // var param = {
            //     OptionSeq: this.getOptionSeq().OptionSeq,
            //     LineNo: this.$parent.data.page_order
            // }            

            // this.postJSON( this.getUrlById(), param )
            //     .then( response => {

            //     if(response == null) return
			// 	var data = response.Data[0]
            //     if(response.Data.length > 0){
            //         // this.$store.commit('setStatus', 'EDIT')
            //         this.getToolbar().FormStatus = 'EDIT'
            //         this.getToolbar().ProcessPS()
            //     this.M_CM_Specification = {
            //         ContactRunningCd: data.contact_running_cd,
            //         ContactRunningCdLabel: data.contact_running_cd + " | " + data.running_cd_descs,
            //         Remarks: data.remarks,
            //         UserInput: data.user_input,
            //         UserEdit: data.user_edit,
            //         TimeInput: data.time_input,
            //         TimeEdit: data.time_edit,
            //         LastUpdateStamp: data.lastupdatestamp,
            //         ControlSequenceNo: data.control_sequence_no,
            //         TaxRegMin: data.tax_reg_min,
            //         TaxRegMax: data.tax_reg_max,
            //         ClassificationMandatory: data.classification_mandatory,
            //         ContactApproval: data.contact_approval,
            //         IdNoMin: data.id_no_min,
            //         IdNoMax: data.id_no_max,
            //         PassportNoMin: data.passport_no_min,
            //         PassportNoMax: data.passport_no_max,
            //         DocumentApproval: data.document_approval,
            //         RowId: data.row_id,
            //         RunningCdDescs: data.runningcd_descs
            //     }   
            //         this.IEBy.Input = data.user_input 
            //         this.IEBy.Edit = data.user_edit
            //     }
            //     else {
            //         // this.$store.commit('setStatus', 'NEW')
            //         this.getToolbar().FormStatus = 'NEW'
            //         this.getToolbar().ProcessPS()
            //     }
            // })
        },
        setToolbarButton () {            
        }
    },
    beforeCreate: function () {
    },
    created: function() {
        this.$store.commit('setFormType','Form')
        // this.isDetail = true
    },
    beforeMount: function() {
    },
    mounted: function() {
        this.getDataBy()
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
