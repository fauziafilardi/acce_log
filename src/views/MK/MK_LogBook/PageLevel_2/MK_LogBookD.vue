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
                                        <ABSinputDateVuex @input="OnnextscheduledateChange" :prop="PI_nextscheduledate" v-model="M_MK_LogBookD.nextscheduledate"  ref="ref_nextscheduledate" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col md="6" v-show="err1">
                                            <b-row v-show="err1">
                                                <b-col offset="4"><label class="lbl-value-view-form" style="color:red"> Date must be greater than today </label></b-col>
                                            </b-row>                                            
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnfollowuptypeChange" :prop="PI_followuptype" :value="M_MK_LogBookD.followuptype" :label="M_MK_LogBookD.followuptypeLabel" ref="ref_followuptype"/>
                                      </b-col>
                                    </b-row>                                   
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_descs" v-model="M_MK_LogBookD.descs"  ref="ref_descs"/>
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
            Module:"MK",
            error: false,
            err1: false,
            propList: {
                initialWhere:"mk_log_book_h_id = '" + this.ValKey + "'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},
            
            M_MK_LogBookD: {
                nextscheduledate:'',
                followuptype: '',
                descs: '',
                mk_log_book_h_id:'',
            },
             PI_nextscheduledate: { 
                cValidate :'', 
                cName: 'nextscheduledate', 
                cLabel: 'Next Schedule', 
                cLabelSize: 4, 
                cOrder: 2, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },

            PI_followuptype: { 
                dataLookUp: { 
                    LookUpCd: 'GetFollowUpType'    , 
                    ColumnDB: 'follow_up_type_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
                cName: 'followuptype', 
                cLabel: 'Follow Up Type', 
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
                cDisplayColumn: 'follow_up_type_cd,descs' ,
            },
            PI_descs: { 
                cValidate :'', 
                cName: 'Description', 
                cLabel: 'descs', 
                cLabelSize: 4, 
                cOrder: 2,  
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
        OnnextscheduledateChange(data){
            console.log(data)
            if(data == this.getToday()){
                this.error = true
                this.err1 = true
            } else {
                this.error = false
                this.err1 = false
            }
        },
        OnfollowuptypeChange (data) {
        this.$nextTick(() => {
            this.M_MK_LogBookD.followuptype = data.mk_follow_up_type_id
            this.M_MK_LogBookD.followuptypeLabel = data.label
            if (this.inputStatus != "VIEW") {

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
            // this.M_MK_LogBookD.currency_cd = data.currency_cd 
            // this.M_MK_LogBookD.cm_currency_id = data.row_id 
            this.propList.initialWhere =" mk_log_book_h_id = '" + data.row_id + "' "
        

            this.FormToABSList().doGetList('','eb_getList')
        },		       
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                mk_log_book_h_id: this.M_MK_LogBookD.mk_log_book_h_id,                
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                next_schedule_date: this.M_MK_LogBookD.nextscheduledate,
                mk_follow_up_type_id: this.M_MK_LogBookD.followuptype,
                descs: this.M_MK_LogBookD.descs,
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
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                next_schedule_date: this.M_MK_LogBookD.nextscheduledate,                
                mk_follow_up_type_id: this.M_MK_LogBookD.followuptype,
                descs: this.M_MK_LogBookD.descs,                
                user_edit: this.getDataUser().user_id,
                mk_log_book_d_id: this.M_MK_LogBookD.mk_log_book_d_id,
                lastupdatestamp: this.M_MK_LogBookD.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })

        },
		M_ClearForm(){
            this.M_MK_LogBookD = {
                followuptype: '',
                descs: '',
                mk_contact_status_d_id:'',
                lastupdatestamp:'',
                mk_contact_status_h_id:''
                    }
            		
		},
        M_New(){
            let data = this.$store.getters.GetPage1Data
            console.log(data)
            this.M_MK_LogBookD.mk_log_book_h_id = data.row_id 
        },
        M_Edit(){
            this.$refs.ref_descs.focus()
        },
        M_Delete(dt){           

            var data = this.FormToABSList().getRowSelected()  
            var dataDelete = []

            
            data.forEach((value) => {
            dataDelete.push({
            mk_log_book_d_id: value.row_id,
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
        getDataBy (record) {
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                mk_log_book_d_id: record.row_id
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
                console.log(data)

            this.M_MK_LogBookD = {
                nextscheduledate: data.next_schedule_date,
                followuptype: data.mk_follow_up_type_id,                
                descs: data.descs,
                mk_log_book_d_id: data.row_id,
                lastupdatestamp: record.lastupdatestamp
                
            }

            this.M_MK_LogBookD.followuptypeLabel = this.M_MK_LogBookD.followuptype != null ? data.follow_up_type_cd + this.separator + data.follow_up_descs :'' 

                 

  

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

