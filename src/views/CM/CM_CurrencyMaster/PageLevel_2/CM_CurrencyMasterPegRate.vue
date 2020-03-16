<template>
    <div>        
    <ABSListVuex
      :prop="propList"
      :title = "data.query_name"
      @rowClicked="$parent.rowClicked"
      @rowDblClicked="$parent.doDoubleClick"
      @rowLinkClick="$parent.rowLink"
      @pageSize="$parent.M_PageSize"
      @pagination="$parent.M_Pagination"
      @filter="$parent.M_Advance_Filter"
      @headTable="$parent.M_Head_Table"
      @refreshColumn="$parent.refreshColumn"
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
                                        <ABSinputDateRangeVuex :prop="PI_PeriodDate" :valueFrom="M_CM_CurrencyMasterPegRate.StartDate" :valueTo="M_CM_CurrencyMasterPegRate.EndDate" ref="ref_PeriodDate" @from="StartDate" @to="EndDate" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_Rate" v-model="M_CM_CurrencyMasterPegRate.Rate" ref="ref_Rate"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_ReferenceNo" v-model="M_CM_CurrencyMasterPegRate.ReferenceNo"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputDateVuex :prop="PI_ReferenceDate" v-model="M_CM_CurrencyMasterPegRate.ReferenceDate"/>
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
    props: {PageLevel:'', TabIndex: '', data: ''},
    data() {
        return {
			ValKey:null,
            FormType: "List",
			Module:"CM",
            propList: {
                initialWhere:"CurrencyCd = '" + this.ValKey + "'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_CM_CurrencyMasterPegRate :{
                CurrencyCd: '',
                StartDate: '',
                EndDate: '',
                Rate: '',
                UserInput: '',
                UserEdit: this.getDataUser().user_id,
                TimeInput: '',
                TimeEdit: '',
                LastUpdateStamp: 0,
                ReferenceNo: '',
                ReferenceDate: '',
                RowId: 0
                    }
            ,
            PI_PeriodDate: { 
                cValidate :'required', 
                cName:'PeriodDatedua', 
                cLabel:'Period Date', 
                cOrder:1, 
                cKey:true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_Rate: { 
                cValidate :'required|max:16|greater:0.00',
                cName:'Ratedua', 
                cLabel:'Rate', 
                cOrder:2, 
                cKey:false, 
                cType: 'decimal',
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_ReferenceNo: { 
                cValidate :'max:60', 
                cName:'ReferenceNo', 
                cLabel:'Reference No', 
                cOrder:3, 
                cKey:false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_ReferenceDate: { 
                cValidate :'', 
                cName:'ReferenceDate', 
                cLabel:'Reference Date', 
                cOrder:4, 
                cKey:false, 
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
        M_Insert () {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                CurrencyCd: this.M_CM_CurrencyMasterPegRate.CurrencyCd,
                StartDate: this.M_CM_CurrencyMasterPegRate.StartDate,
                EndDate: this.M_CM_CurrencyMasterPegRate.EndDate,
                Rate: this.M_CM_CurrencyMasterPegRate.Rate ? this.replaceAllString(this.M_CM_CurrencyMasterPegRate.Rate, ",", "",'number') : 0 ,
                RefNo: this.M_CM_CurrencyMasterPegRate.ReferenceNo,
                RefDate: this.M_CM_CurrencyMasterPegRate.ReferenceDate == '' ? 'NULL' : this.M_CM_CurrencyMasterPegRate.ReferenceDate,
                UserInput: this.getDataUser().user_id                 
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
                CurrencyCd: this.M_CM_CurrencyMasterPegRate.CurrencyCd,
                StartDate: this.M_CM_CurrencyMasterPegRate.StartDate,
                EndDate: this.M_CM_CurrencyMasterPegRate.EndDate,
                Rate: this.M_CM_CurrencyMasterPegRate.Rate ? this.replaceAllString(this.M_CM_CurrencyMasterPegRate.Rate, ",", "",'number') : 0 ,
                RefNo: this.M_CM_CurrencyMasterPegRate.ReferenceNo,
                RefDate: this.M_CM_CurrencyMasterPegRate.ReferenceDate == '' ? 'NULL' : this.M_CM_CurrencyMasterPegRate.ReferenceDate,
                UserEdit: this.getDataUser().user_id ,
                LastUpdateStamp: this.M_CM_CurrencyMasterPegRate.LastUpdateStamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return
                this.$parent.resultUpdate(response.Message)
            })

        },
		M_ClearForm(){
            this.M_CM_CurrencyMasterPegRate ={
                CurrencyCd: '',
                StartDate: '',
                EndDate: '',
                Rate: '',
                UserInput: '',
                UserEdit: this.getDataUser().user_id,
                TimeInput: '',
                TimeEdit: '',
                LastUpdateStamp: 0,
                ReferenceNo: '',
                ReferenceDate: '',
                RowId: 0
                    }
            		
		},
        M_New(){            
			let data = this.$store.getters.GetPage1Data
            this.M_CM_CurrencyMasterPegRate.CurrencyCd = data.CurrencyCd

            this.$refs.ref_PeriodDate.focus()
            //this.$nextTick().then(() => {document.getElementById("CurrencyCd").focus()})
        },
        M_Edit(){
            this.$refs.ref_Rate.focus()
        },
        M_Delete(dt){
            var data = this.FormToABSList().getRowSelected()
            var dataDelete = []

            data.forEach((value) => {
                dataDelete.push({
                CurrencyCd: value.CurrencyCd,
                StartDate: value.StartDate,
                EndDate: value.EndDate,
                LastUpdateStamp: value.LastUpdateStamp,
                _Message_: ''
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
        paramFromParent(){
            this.$parent.isDetail = false
            let data = this.$store.getters.GetPage1Data
            this.M_CM_CurrencyMasterPegRate.CurrencyCd = data.CurrencyCd 
            this.propList.initialWhere =" CurrencyCd = '" + data.CurrencyCd + "' "
        
            this.FormToABSList().doGetList('','eb_getList')
        },
		M_Cancel() {},
        rowClicked (record, index) {            
        },
        rowLink: function(url){
        },
        doDoubleClick: function (data, index) {},
        getDataBy (record) {
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                CurrencyCd: record.CurrencyCd,
                StartDate: record.StartDate,
                EndDate: record.EndDate				
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
                this.M_CM_CurrencyMasterPegRate ={
                    CurrencyCd: data.currencycd,
                    StartDate: data.startdate,
                    EndDate: data.enddate,
                    Rate: this.isCurrency(data.rate, this.decimal),
                    UserInput: data.userinput,
                    UserEdit: data.useredit,
                    TimeInput: data.timeinput,
                    TimeEdit: data.timeedit,
                    LastUpdateStamp: record.LastUpdateStamp,
                    ReferenceNo: data.referenceno,
                    ReferenceDate: data.referencedate,
                    RowId: data.rowid
                }
                this.IEBy.Input = data.userinput
                this.IEBy.Edit = data.useredit
            })
        },
        StartDate (data) {
            this.M_CM_CurrencyMasterPegRate.StartDate = data
        },
        EndDate (data) {
            this.M_CM_CurrencyMasterPegRate.EndDate = data
        },
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

