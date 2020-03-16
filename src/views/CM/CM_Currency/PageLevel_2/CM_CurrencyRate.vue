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
                                        <ABSinputDateRangeVuex :prop="PI_start_date" :valueFrom="M_CM_Currencyrate.start_date" :valueTo="M_CM_Currencyrate.end_date" ref="ref_start_date" @from="MdtRange_start_date" @to="MdtRange_end_date" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_rate" v-model="M_CM_Currencyrate.rate"  ref="ref_rate"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_reference_no" v-model="M_CM_Currencyrate.reference_no"  ref="ref_reference_no"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputDateVuex @input="Onreference_dateChange" :prop="PI_reference_date" v-model="M_CM_Currencyrate.reference_date"  ref="ref_reference_date" />
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
			Module:"CM",
            propList: {
                initialWhere:"currency_cd = '" + this.ValKey + "'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_CM_Currencyrate :{
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                currency_cd: '',
                cm_currency_id:0,
                start_date: '',
                end_date: '',
                rate: '0',
                user_input: '',
                user_edit: this.getDataUser().user_id,
                time_input: '',
                time_edit: '',
                lastupdatestamp: 0,
                reference_no: '',
                reference_date: '',
                row_id: 0,
                period_date: ''
                    }
            ,
            PI_start_date: { 
                cValidate :'required', 
                cName: 'startxdate', 
                cLabel: 'Start Date - End Date', 
                cLabelSize: 4, 
                cOrder: 1, 
                cKey: true, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_rate: { 
                cValidate :'required|max:13|greater:0.00', 
                cName: 'ratex', 
                cLabel: 'rate', 
                cLabelSize: 4, 
                cOrder: 2, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 0, 
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_reference_no: { 
                cValidate :'max:20', 
                cName: 'reference_no', 
                cLabel: 'Reference No', 
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
            PI_reference_date: { 
                cValidate :'', 
                cName: 'reference_date', 
                cLabel: 'Reference Date', 
                cLabelSize: 4, 
                cOrder: 4, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }
            // , 

			// PTAnalysis: {
            //     cPageLevel: this.PageLevel,
            //     cTabIndex: this.TabIndex,
            //     cPageMasterSeq: this.data.PageMasterSeq,
            //     cFormPageNo: this.data.PageOrder
            // }         
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
        Onreference_dateChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{reference_date}
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
            console.log(JSON.stringify(data,null,2))
            this.M_CM_Currencyrate.currency_cd = data.currency_cd 
            this.M_CM_Currencyrate.cm_currency_id = data.row_id 
            this.propList.initialWhere =" cm_currency_id = '" + data.row_id + "' "
        

            this.FormToABSList().doGetList('','eb_getList')
        },		       
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                currency_cd: this.M_CM_Currencyrate.currency_cd,
                cm_currency_id: this.DataRowPage1.row_id,
                start_date: this.M_CM_Currencyrate.start_date == '' || this.M_CM_Currencyrate.start_date == null ? 'NULL' : this.M_CM_Currencyrate.start_date ,
                end_date: this.M_CM_Currencyrate.end_date == '' || this.M_CM_Currencyrate.end_date == null ? 'NULL' : this.M_CM_Currencyrate.end_date ,
                rate: this.M_CM_Currencyrate.rate ? this.replaceAllString(this.M_CM_Currencyrate.rate,',','','number') : 0 ,
                ref_date: this.M_CM_Currencyrate.reference_date == '' || this.M_CM_Currencyrate.reference_date == null ? 'NULL' : this.M_CM_Currencyrate.reference_date ,
                ref_no: this.M_CM_Currencyrate.reference_no,
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
                // currency_cd: this.M_CM_Currencyrate.currency_cd,
                cm_currency_id: this.DataRowPage1.row_id,
                start_date: this.M_CM_Currencyrate.start_date == '' || this.M_CM_Currencyrate.start_date == null ? 'NULL' : this.M_CM_Currencyrate.start_date ,
                end_date: this.M_CM_Currencyrate.end_date == '' || this.M_CM_Currencyrate.end_date == null ? 'NULL' : this.M_CM_Currencyrate.end_date ,
                rate: this.M_CM_Currencyrate.rate ? this.replaceAllString(this.M_CM_Currencyrate.rate,',','','number') : 0 ,
                ref_date: this.M_CM_Currencyrate.reference_date == '' || this.M_CM_Currencyrate.reference_date == null ? 'NULL' : this.M_CM_Currencyrate.reference_date ,
                ref_no: this.M_CM_Currencyrate.reference_no,
                user_edit: this.getDataUser().user_id ,
                lastupdatestamp: this.M_CM_Currencyrate.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })

        },
		M_ClearForm(){
            this.M_CM_Currencyrate = {
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                currency_cd: '',
                start_date: '',
                end_date: '',
                rate: '',
                user_input: '',
                user_edit: this.getDataUser().user_id,
                time_input: '',
                time_edit: '',
                lastupdatestamp: 0,
                reference_no: '',
                reference_date: '',
                row_id: 0,
                period_date: ''
                    }
            		
		},
        M_New(){
            let data = this.$store.getters.GetPage1Data
            this.M_CM_Currencyrate.currency_cd = data.currency_cd 

            this.$refs.ref_start_date.focus()
        },
        M_Edit(){
            this.$refs.ref_rate.focus()
        },
        M_Delete(dt){           

            var data = this.FormToABSList().getRowSelected()  
            var dataDelete = []

            
            data.forEach((value) => {
            dataDelete.push({
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                // currency_cd: value.currency_cd,
                cm_currency_id: this.DataRowPage1.row_id,
                start_date: value.start_date,
                end_date: value.end_date,
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
                LineNo: this.$parent.data.page_order
,                subportfolio_cd: record.subportfolio_cd,
                // currency_cd: record.currency_cd,
                cm_currency_id: this.DataRowPage1.row_id,
                start_date: record.start_date,
                end_date: record.end_date				
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
this.M_CM_Currencyrate = {
                subportfolio_cd: data.subportfolio_cd,
                currency_cd: data.currency_cd,
                start_date: data.start_date,
                end_date: data.end_date,
                rate: this.isCurrency(data.rate, this.decimal),
                user_input: data.user_input,
                user_edit: data.user_edit,
                time_input: data.time_input,
                time_edit: data.time_edit,
                lastupdatestamp: record.lastupdatestamp,
                reference_no: data.reference_no,
                reference_date: data.reference_date,
                row_id: data.row_id,
                period_date: data.period_date
                    }
                 

  

                this.IEBy.Input = data.user_input
                this.IEBy.Edit = data.user_edit

            })
        }
        ,MdtRange_start_date (data) {
            this.M_CM_Currencyrate.start_date = data
        }
        ,MdtRange_end_date (data) {
            this.M_CM_Currencyrate.end_date = data
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

