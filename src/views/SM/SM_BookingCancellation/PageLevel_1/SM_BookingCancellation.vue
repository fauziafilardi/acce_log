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
      @checkboxChecked = "$parent.checkboxChecked"
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
                                        <ABSinputRadioButtonVuex @input="OncanceldayChange" :prop="PI_cancelday" v-model="M_SM_BookingCancellation.cancelday"  ref="ref_cancelday" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputTimeRange :prop="PI_cancelhourfrom" :valueFrom="M_SM_BookingCancellation.cancelhourfrom" :valueTo="M_SM_BookingCancellation.cancelhourto" ref="ref_cancelhourfrom" @from="MdtRange_cancelhourfrom" @to="MdtRange_cancelhourto" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OncanceltypeChange" :prop="PI_canceltype" v-model="M_SM_BookingCancellation.canceltype"  ref="ref_canceltype" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_cancellimit" v-model="M_SM_BookingCancellation.cancellimit"  ref="ref_cancellimit"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputTime :prop="PI_cancelfixtime" :valueFrom="M_SM_BookingCancellation.cancelfixtime"  ref="ref_cancelfixtime" @from="MdtRange_cancelfixtime"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OncancelexeconChange" :prop="PI_cancelexecon" v-model="M_SM_BookingCancellation.cancelexecon"  ref="ref_cancelexecon" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_SM_BookingCancellation.remarks"  ref="ref_remarks" />
                                      </b-col>
                                    </b-row>
                                </b-col> <!-- table close -->
                  
							</b-row>
							<ABSTAnalysis :prop="PTAnalysis" />
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
		FormType: "List",
		Module:"SM",
            propList: {
                initialWhere: "",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_SM_BookingCancellation :{
                cancelday: 'MO',
                cancelhourto: '',
                cancelhourfrom: '',
                canceltype: 'L',
                cancellimit: '0',
                cancelfixtime: '',
                cancelexecon: 'N',
                remarks: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeeditt: '',
                lastupdatestamp: 0,
                rowid: 0
                    }
            ,
            PI_cancelday: { 
                cValidate :'', 
                cName: 'cancelday', 
                cId: 'rdbcancelday', 
                cRadioOptions: [{ text: 'Sunday', value: 'SU' },{ text: 'Monday', value: 'MO' },{ text: 'Tuesday', value: 'TU' },{ text: 'Wednesday', value: 'WE' },{ text: 'Thursday', value: 'TH' },{ text: 'Friday', value: 'FR' },{ text: 'Saturday', value: 'SA' },], 
                cRadioDefaultOption: 'MO', 
                cLabel:'Day', 
                cLabelSize: 4, 
                cDefault: '', 
                cOrder: 1, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_cancelhourfrom: { 
                cValidate :'', 
                cName: 'cancelhourfrom', 
                cLabel: 'From Hour ', 
                cLabelSize: 4, 
                cOrder: 2, 
                cFormat: 'HH:mm',
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_canceltype: { 
                cValidate :'', 
                cName: 'canceltype', 
                cId: 'rdbcanceltype', 
                cRadioOptions: [{ text: 'Fix', value: 'F' },{ text: 'Flexible', value: 'L' },], 
                cRadioDefaultOption: 'L', 
                cLabel:'Checking Type', 
                cLabelSize: 4, 
                cDefault: '', 
                cOrder: 3, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_cancellimit: { 
                cValidate :'', 
                cName: 'cancellimit', 
                cLabel: 'Cancellation Limit', 
                cLabelSize: 4, 
                cOrder: 4, 
                cKey: false, 
                cLastLabel:'Minute',
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_cancelfixtime: { 
                 cValidate :'', 
                cName: 'cancelfixtime', 
                cLabel: 'Fix Time',
                cLabelSize: 4, 
                cOrder: 2, 
                cFormat: 'HH:mm',
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_cancelexecon: { 
                cValidate :'', 
                cName: 'cancelexecon', 
                cId: 'rdbcancelexecon', 
                cRadioOptions: [{ text: 'Some Day', value: 'S' },{ text: 'Next Day', value: 'N' },], 
                cRadioDefaultOption: 'N', 
                cLabel:'Exec On', 
                cLabelSize: 4, 
                cDefault: '', 
                cOrder: 6, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_remarks: { 
                cValidate :'', 
                cName:'remarks', 
                cLabel:'Remarks', 
                cLabelSize: 4, 
                cOrder:7, 
                cKey: false, 
                cDefault: '', 
                cProtect: false, 
                cVisible: true, 
                cResize: false, 
                cReadOnly: false, 
                cRows: 3, 
                cMaxRows: 3, 
                cSize: 'md', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
            }, 

			PTAnalysis: {
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cPageMasterSeq: this.data.PageMasterSeq,
                cFormPageNo: this.data.PageOrder,
				cProtect: false
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
		return this.$store.getters.GetPage1Data
	},
	GetDataBy1(){
		return this.$store.getters.GetPage1GetDataBy
	}
  },
    methods: {		
        OncanceldayChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{cancelday}
            }
        })
        this.$forceUpdate()
        },
        OncancelhourfromChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{cancelhourfrom}
            }
        })
        this.$forceUpdate()
        },
        OncanceltypeChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{canceltype}
            }
        })
        this.$forceUpdate()
        },
        OncancelexeconChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{cancelexecon}
            }
        })
        this.$forceUpdate()
        },
        OnremarksChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{remarks}
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
        },	
		M_CheckboxChecked(data, status, index){

        },		
        M_Post(dt){
        },
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubportfolioCd: this.getDataUser().subportfolio_cd,
                CancelDay: this.M_SM_BookingCancellation.cancelday,
                CancelHourFrom: this.M_SM_BookingCancellation.cancelhourfrom,
                CancelHourTo: this.M_SM_BookingCancellation.cancelhourto,
                CancelLimit: this.M_SM_BookingCancellation.cancellimit,
                CancelType: this.M_SM_BookingCancellation.canceltype,
                CancelFixTime: this.M_SM_BookingCancellation.cancelfixtime,
                CancelExecOn: this.M_SM_BookingCancellation.cancelexecon,
                Remarks: this.M_SM_BookingCancellation.remarks,
                UserInput: this.getDataUser().user_id                 
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
                SubportfolioCD: this.getDataUser().subportfolio_cd,
                SequenceNo: this.DataRow.SequenceNo,
                CancelDay: this.M_SM_BookingCancellation.cancelday,
                CancelHourFrom: this.M_SM_BookingCancellation.cancelhourfrom,
                CancelHourTo: this.M_SM_BookingCancellation.cancelhourto,
                CancelLimit: this.M_SM_BookingCancellation.cancellimit,
                CancelType: this.M_SM_BookingCancellation.canceltype,
                CancelFixTime: this.M_SM_BookingCancellation.cancelfixtime,
                CancelExecOn: this.M_SM_BookingCancellation.cancelexecon,
                Remarks: this.M_SM_BookingCancellation.remarks,
                UserEdit: this.getDataUser().user_id ,
                LastUpdateStamp: this.M_SM_BookingCancellation.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_SM_BookingCancellation = {
                cancelday: 'MO',
                cancelhourto: '',
                cancelhourfrom: '',
                canceltype: 'L',
                cancellimit: '0',
                cancelfixtime: '',
                cancelexecon: 'N',
                remarks: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeeditt: '',
                lastupdatestamp: 0,
                rowid: 0
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

				console.log(value)
				dataDelete.push({
					_Message_:'',
                    SubportfolioCd: this.getDataUser().subportfolio_cd,
                    SequenceNo: value.SequenceNo,
                    CancelDay: value.CancelDay,
                    LastUpdateStamp: value.LastUpdateStamp,


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
            console.log(record)
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order
,                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                sequenceno: record.SequenceNo
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                console.log(data)
this.M_SM_BookingCancellation = {
                cancelday: data.cancelday,
                cancelhourto: data.cancelhourto,
                cancelhourfrom: data.cancelhourfrom,
                canceltype: data.canceltype,
                cancellimit: data.cancellimit,
                cancelfixtime: data.cancelfixtime,
                cancelexecon: data.cancelexecon,
                remarks: data.remarks,
                userinput: data.userinput,
                useredit: data.useredit,
                timeinput: data.timeedit,
                timeedit: data.timeinput,
                lastupdatestamp: record.LastUpdateStamp,
                rowid: record.row_id
                    }
                 

         

                this.IEBy.Input = data.userinput
                this.IEBy.Edit = data.useredit

            })
        }
        ,MdtRange_cancelhourfrom (data) {
            this.M_SM_BookingCancellation.cancelhourfrom = data
        }
        ,MdtRange_cancelhourto (data) {
            this.M_SM_BookingCancellation.cancelhourto = data
        }
        ,MdtRange_cancelfixtime (data) {
            this.M_SM_BookingCancellation.cancelfixtime = data
        }

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

