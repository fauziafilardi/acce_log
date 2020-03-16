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
                                <b-col md="12" id="col-left"> <!-- table open -->
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnusergroupChange" :prop="PI_usergroup" :value="M_SS_UserGroupControl.usergroup" :label="M_SS_UserGroupControl.usergroupLabel" ref="ref_usergroup" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex @input="OndescsChange" :prop="PI_descs" v-model="M_SS_UserGroupControl.descs"  ref="ref_descs"/>
                                      </b-col>
                                    </b-row>
                                </b-col> <!-- table close -->
                  
							</b-row>
							<!-- <ABSTAnalysis :prop="PTAnalysis" /> -->
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
			Module:"SS",
            propList: {
                initialWhere:" user_id = '" + this.ValKey + "'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},
            DataFromParent: null,

            M_SS_UserGroupControl :{
                userid: '',
                usergroup: '',
                usergroupLabel: '',
                descs: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                lastupdatestamp: 0,
                // t0: '',
                // t1: '',
                // t2: '',
                // t3: '',
                // t4: '',
                // t5: '',
                // t6: '',
                // t7: '',
                // t8: '',
                // t9: '',
                // t10: '',
                // t11: '',
                // t12: '',
                // t13: '',
                // t14: '',
                // t15: '',
                // t16: '',
                // t17: '',
                // t18: '',
                // t19: '',
                // t20: '',
                // t21: '',
                // t22: '',
                // t23: '',
                // t24: '',
                // t25: '',
                // t26: '',
                // t27: '',
                // t28: '',
                // t29: '',
                // t30: '',
                controlsequenceno: 0,
                rowid: 0
                    }
            ,
            PI_usergroup: { 
                dataLookUp: { 
                    LookUpCd: 'GetUserGroup'    , 
                    ColumnDB: 'user_group'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
                cName: 'usergroup', 
                cLabel: 'Group', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 0, 
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
                cMasterUrl: 'SS/SS_Group' ,
                cDisplayColumn: 'user_group' ,
            }, 
            PI_descs: { 
                cValidate :'required', 
                cName: 'descs', 
                cLabel: 'Description', 
                cLabelSize: 4, 
                cOrder: 0, 
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
  },
    methods: {
        OnusergroupChange (data) {
            this.M_SS_UserGroupControl.usergroup = data.id
            this.M_SS_UserGroupControl.usergroupLabel = data.label
            this.$nextTick(() => {
                if (this.inputStatus != "VIEW") {
                }
            })
            this.$forceUpdate()
        },
        OndescsChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{descs}
            }
        })
        this.$forceUpdate()
        },
		
		setToolbarButton () {
           //this.getToolbar().statusFunction[4].disabled = false
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
            this.$refs.modalTest.show()
        },
		paramFromParent(){
            this.$parent.showForm = false
			
            let data = this.$store.getters.GetPage1Data
            this.DataFromParent = data
            this.M_SS_UserGroupControl.userid = data.user_id 
            this.propList.initialWhere =" user_id = '" + data.user_id + "' "
        

            this.FormToABSList().doGetList('','eb_getList')
        },		       
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                user_id: this.DataFromParent.user_id,
                user_group: this.M_SS_UserGroupControl.usergroup,
                descs: this.M_SS_UserGroupControl.descs,
                user_input: this.getDataUser().user_id                 
            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return

				//kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultInsert(response.Message)
					
				
            })
        },
        M_Update() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                user_id: this.DataFromParent.user_id,
                user_group: this.M_SS_UserGroupControl.usergroup,
                descs: this.M_SS_UserGroupControl.descs,
                user_edit: this.getDataUser().user_id ,
                lastupdatestamp: this.M_SS_UserGroupControl.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_SS_UserGroupControl = {
                userid: '',
                usergroup: '',
                usergroupLabel: '',
                descs: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                lastupdatestamp: 0,
                // t0: '',
                // t1: '',
                // t2: '',
                // t3: '',
                // t4: '',
                // t5: '',
                // t6: '',
                // t7: '',
                // t8: '',
                // t9: '',
                // t10: '',
                // t11: '',
                // t12: '',
                // t13: '',
                // t14: '',
                // t15: '',
                // t16: '',
                // t17: '',
                // t18: '',
                // t19: '',
                // t20: '',
                // t21: '',
                // t22: '',
                // t23: '',
                // t24: '',
                // t25: '',
                // t26: '',
                // t27: '',
                // t28: '',
                // t29: '',
                // t30: '',
                controlsequenceno: 0,
                rowid: 0
                    }
            		
		},
        M_New(){
            let data = this.$store.getters.GetPage1Data
            this.M_SS_UserGroupControl.userid = data.user_id
        },
        M_Edit(){
        },
        M_Delete(dt){
            var data = this.FormToABSList().getRowSelected()
            var dataDelete = []

            data.forEach((value) => {
                dataDelete.push({
                    user_id: this.DataRowPage1.user_id,
                    user_group: value.user_group,
                    lastupdatestamp:  value.lastupdatestamp,
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

                this.$parent.resultDelete("Deleting Data Successfully")
            })
        },        
        getDataBy (record) {
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                user_id: record.user_id,
                user_group: record.user_group
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
                this.M_SS_UserGroupControl = {
                    userid: data.user_id,
                    usergroup: data.user_group,
                    descs: data.descs,
                    userinput: data.user_input,
                    useredit: data.user_edit,
                    timeinput: data.time_input,
                    timeedit: data.time_edit,
                    lastupdatestamp: record.lastupdatestamp,
                    // t0: data.t0,
                    // t1: data.t1,
                    // t2: data.t2,
                    // t3: data.t3,
                    // t4: data.t4,
                    // t5: data.t5,
                    // t6: data.t6,
                    // t7: data.t7,
                    // t8: data.t8,
                    // t9: data.t9,
                    // t10: data.t10,
                    // t11: data.t11,
                    // t12: data.t12,
                    // t13: data.t13,
                    // t14: data.t14,
                    // t15: data.t15,
                    // t16: data.t16,
                    // t17: data.t17,
                    // t18: data.t18,
                    // t19: data.t19,
                    // t20: data.t20,
                    // t21: data.t21,
                    // t22: data.t22,
                    // t23: data.t23,
                    // t24: data.t24,
                    // t25: data.t25,
                    // t26: data.t26,
                    // t27: data.t27,
                    // t28: data.t28,
                    // t29: data.t29,
                    // t30: data.t30,
                    controlsequenceno: data.control_sequence_no,
                    rowid: data.row_id
                }

                this.M_SS_UserGroupControl.usergroupLabel = this.M_SS_UserGroupControl.usergroup
                // this.M_SS_UserGroupControl.usergroupLabel = this.M_SS_UserGroupControl.usergroup && this.M_SS_UserGroupControl.usergroup != '' ? data.user_group + this.separator + data.group_descs : ''

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

