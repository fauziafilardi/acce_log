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
                                <b-col md="12" id="col-left">
                                    <b-row>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_FinYear" v-model="M_CM_AccountingPeriod.FinYear" ref="ref_FinYear"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_FinPeriod" v-model="M_CM_AccountingPeriod.FinPeriod"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                          <ABSinputDateRangeVuex :prop="PI_PeriodDate" :valueFrom="M_CM_AccountingPeriod.StartDate" :valueTo="M_CM_AccountingPeriod.EndDate" ref="ref_PeriodDate" @from="StartDate" @to="EndDate" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex :prop="PI_Remarks" v-model="M_CM_AccountingPeriod.Remarks" />
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
		FormType: "List",
		Module:"CM",
            propList: {
                initialWhere: "",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex,
                OrderBy: '',
                SourceField: ''
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_CM_AccountingPeriod :{
                FinYear: '',
                FinPeriod: '',
                StartDate: '',
                EndDate: '',
                Remarks: '',
                UserInput: '',
                UserEdit: this.getDataUser().user_id,
                TimeInput: '',
                TimeEdit: '',
                LastUpdateStamp: 0,
                RowId: 0
                    }
            ,
            PI_FinYear: { 
                cValidate :'required|max:4|min_value:1900|max_value:2050', 
                cName:'FinYear', 
                cLabel:'Financial Year', 
                cOrder:10, 
                cKey:true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
                cType: 'numeric' 
            }, 
            PI_FinPeriod: { 
                // cValidate :'required|max:2|min_value:1|max_value:13', 
                cValidate :'required|max:2|min_value:1', 
                cName:'FinPeriod', 
                cLabel:'Financial Period', 
                cOrder:20, 
                cKey:true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
                cType: 'numeric' 
            },
            PI_PeriodDate: {
                cValidate :'required', 
                cName:'PeriodDate', 
                cLabel:'Start Date - End Date', 
                cOrder:30, 
                cKey:false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_Remarks: { 
                cValidate :'', 
                cName:'Remarks', 
                cLabel:'Remarks', 
                cOrder:40, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
			PTAnalysis: {
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cPageMasterSeq: this.data.PageMasterSeq,
                cFormPageNo: this.data.PageOrder
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
            this.M_CM_AccountingPeriod ={
                FinYear: '',
                FinPeriod: '',
                StartDate: '',
                EndDate: '',
                Remarks: '',
                UserInput: '',
                UserEdit: this.getDataUser().user_id,
                TimeInput: '',
                TimeEdit: '',
                LastUpdateStamp: 0,
                RowId: 0
            }
        },
        M_New () {
            this.$refs.ref_FinYear.focus()
            //this.$nextTick().then(() => document.getElementById("???").focus())
        },
        M_Edit(){
            this.$refs.ref_PeriodDate.focus()
            //this.$nextTick().then(() => document.getElementById("???").focus())
        },
        M_Delete (dt) {
            var data = this.FormToABSList().getRowSelected()  
            var dataDelete = []

            
            data.forEach((value) => {
            dataDelete.push({
            fin_year: value.fin_year,
            fin_period: value.fin_period,
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
                fin_year: this.M_CM_AccountingPeriod.FinYear,
                fin_period: this.M_CM_AccountingPeriod.FinPeriod,
                start_date: this.M_CM_AccountingPeriod.StartDate,
                end_date: this.M_CM_AccountingPeriod.EndDate,
                remarks: this.M_CM_AccountingPeriod.Remarks,
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
                fin_year: this.M_CM_AccountingPeriod.FinYear,
                fin_period: this.M_CM_AccountingPeriod.FinPeriod,
                start_date: this.M_CM_AccountingPeriod.StartDate,
                end_date: this.M_CM_AccountingPeriod.EndDate,
                remarks: this.M_CM_AccountingPeriod.Remarks,
                user_edit: this.getDataUser().user_id ,
                lastupdatestamp: this.M_CM_AccountingPeriod.LastUpdateStamp                
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
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                fin_year: record.fin_year,
                fin_period: record.fin_period 
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                
                this.M_CM_AccountingPeriod ={
                    FinYear: data.fin_year,
                    FinPeriod: data.fin_period,
                    StartDate: data.start_date,
                    EndDate: data.end_date,
                    Remarks: data.remarks,
                    UserInput: data.user_input,
                    UserEdit: data.user_edit,
                    TimeInput: data.time_input,
                    TimeEdit: data.time_edit,
                    LastUpdateStamp: record.lastupdatestamp,
                    RowId: data.row_id
                }

                this.IEBy.Input = data.user_input
                this.IEBy.Edit = data.user_edit

            })
        },
        StartDate (data) {
            this.M_CM_AccountingPeriod.StartDate = data
        },
        EndDate (data) {
            this.M_CM_AccountingPeriod.EndDate = data
        },

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

