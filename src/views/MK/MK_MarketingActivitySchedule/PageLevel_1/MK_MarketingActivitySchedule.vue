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
    />


        <!-- <div v-show="$parent.showForm"  :style="'margin-top:10px;'" class="el" mousetip mousetip-msg="I'm a tooltip">
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
                                <b-col md="12" id="col-left">
                                    <b-row>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_followuptype" v-model="M_MK_FollowUpType.followuptype" ref="ref_followuptype"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_description" v-model="M_MK_FollowUpType.description"/>
                                      </b-col>
                                    </b-row>
                                </b-col>                  
							</b-row>
						</b-form>
					</b-col>
                </b-row>
            </b-collapse>
        </div> -->
    </div>
</template>

<script>
export default {
    props: {PageLevel: '', TabIndex: '', data: ''},
    data() {
        return {
		FormType: "View",
		Module:"MK",
            propList: {
                initialWhere: "",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex,
                OrderBy: '',
                SourceField: ''
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_MK_FollowUpType :{
                followuptype: '',
                description: '',
                lastupdatestamp: '',
                user_edit: '',
                subportfolio_cd: '',
                mk_follow_up_type_id:''
            }
            ,
            PI_followuptype: { 
                cValidate :'required', 
                cName:'followuptype', 
                cLabel:'Follow Up Type', 
                cOrder:10, 
                cKey:true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
                cType: 'text' 
            }, 
            PI_description: { 
                // cValidate :'required|max:2|min_value:1|max_value:13', 
                cValidate :'', 
                cName:'description', 
                cLabel:'Description', 
                cOrder:20, 
                cKey:false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
                cType: 'text' 
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
    }
  },
    methods: {		
	
		setToolbarButton () {
            //    this.getToolbar().statusFunction[1].disabled = false
            //    this.getToolbar().statusFunction[2].disabled = false
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
        M_Post(){
        },
        M_Refresh(){
        },
        M_ClearForm(){
            this.M_MK_FollowUpType ={
                followuptype: '',
                description: '',
                mk_follow_up_type_id:''                
            }
        },
        M_New () {
            this.$refs.ref_followuptype.focus()
            //this.$nextTick().then(() => document.getElementById("???").focus())
        },
        M_Edit(){
            // this.$refs.ref_PeriodDate.focus()
            //this.$nextTick().then(() => document.getElementById("???").focus())
        },
        M_Delete (dt) {
            var data = this.FormToABSList().getRowSelected()  
            var dataDelete = []
            
            data.forEach((value) => {
            dataDelete.push({
            mk_follow_up_type_id: value.row_id,
            lastupdatestamp: value.lastupdatestamp,
            _Message_: ""
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
        M_Insert () {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                follow_up_type_cd: this.M_MK_FollowUpType.followuptype,
                descs: this.M_MK_FollowUpType.description,
                user_input: this.getDataUser().user_id                 
            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return
                this.$parent.resultInsert(response.Message)
            })

        },
        M_Update () {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                follow_up_type_cd: this.M_MK_FollowUpType.followuptype,
                descs: this.M_MK_FollowUpType.description,
                user_edit: this.getDataUser().user_id ,
                mk_follow_up_type_id: this.M_MK_FollowUpType.mk_follow_up_type_id,
                lastupdatestamp: this.M_MK_FollowUpType.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return
                this.$parent.resultUpdate(response.Message)
            })
        },
        M_Cancel() {},
        paramFromParent(){
        },
        rowClicked (record, index) {
        },
        doDoubleClick(){
        },		
        rowLink: function(url){            
        },
        getDataBy (record) {
            console.log(record)
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                mk_follow_up_type_id: record.row_id 
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                console.log(data)
                this.M_MK_FollowUpType ={
                    subportfolio_cd: data.subportfolio_cd,
                    followuptype: data.follow_up_type_cd,
                    description: data.descs,
                    lastupdatestamp: record.lastupdatestamp,
                    mk_follow_up_type_id: record.row_id,
                    user_edit: data.user_edit

                }

                this.IEBy.Input = data.user_input
                this.IEBy.Edit = data.user_edit

            })
        }
    },
    beforeCreate: function () {
    },
    created: function() {
	this.$store.commit('setFormType','View')
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

