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
                <span>
                    <span style="float:Left; color: #81b3e9 !important;letter-spacing: 1px;margin-top: 2px;margin-left: 3px" >
                        Record Information <font-awesome-icon icon="sort-down" class="icon-style-1__master" /> 
                    </span>
                    <span v-show="IEBy.Input && IEBy.Edit" class="master-span">
                        Input By : {{IEBy.Input}} | Edit By : {{IEBy.Edit}} <font-awesome-icon icon="sort-down" class="icon-style-1__master" /> 
                    </span>
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
                                        <ABSinputTextVuex @input="Onfrom_amtChange" :prop="PI_from_amt" v-model="M_CM_StampDuty.from_amt"  ref="ref_from_amt"/>
                                      </b-col>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_to_amt" @input="Onto_amtInput" v-model="M_CM_StampDuty.to_amt"  ref="ref_to_amt"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_stampduty_amt" v-model="M_CM_StampDuty.stampduty_amt"  ref="ref_stampduty_amt"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_CM_StampDuty.remarks"  ref="ref_remarks" />
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
    watch: {
        'M_CM_StampDuty.from_amt' (newData, oldData) {
            // var from_amt = this.replaceAllString(this.M_CM_StampDuty.from_amt, ',', '', 'number')
            var from_amt = this.replaceAllString(newData, ',', '', 'number')
            // console.log(from_amt)
            this.PI_to_amt.cValidate = "required|min_value:0.00|greater:" + from_amt
        }
    },
    data() {
        return {
		cInsertKey:'',
		FormType: "List",
		Module:"CM",
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

            M_CM_StampDuty :{
                sequence_no: 0,
                from_amt: '0',
                to_amt: '0',
                stampduty_amt: '0',
                remarks: '',
                user_input: '',
                user_edit: this.getDataUser().user_id,
                time_input: '',
                time_edit: '',
                lastupdatestamp: 0,
                control_sequence_no: 0,
                row_id: 0
                    }
            ,
            PI_from_amt: { 
                cValidate :'required|max:16|min_value:0.00', 
                cName: 'from_amt', 
                cLabel: 'Trans Amount From', 
                cLabelSize: 4, 
                cLastLabel: '(Base Amount)',
                cOrder: 1, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cAllowMinus: false,
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            }, 
            PI_to_amt: { 
                cValidate :'required|max:16|min_value:0.00', 
                cName: 'to_amt', 
                cLabel: 'Trans Amount To', 
                cLabelSize: 4, 
                cLastLabel: '(Base Amount)',
                cOrder: 2, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cAllowMinus: false,
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_stampduty_amt: { 
                cValidate :'required|max:13|min_value:0.00', 
                cName: 'stampduty_amt', 
                cLabel: 'Stamp Duty Amount', 
                cLastLabel: '(Base Amount)',
                cLabelSize: 4, 
                cOrder: 3, 
                cKey: false, 
                cType: 'decimal',
                cAllowMinus: false,
                cDecimal: 2, 
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_remarks: { 
                cValidate :'', 
                cName:'remarks', 
                cLabel:'remarks', 
                cLabelSize: 4, 
                cOrder:4, 
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
    },
	DataRow(){
		return this.$store.getters.GetPage1Data
	}
  },
    methods: {
        Onto_amtInput (data) {

        },
        Onfrom_amtChange	(data) {
//         this.$nextTick(() => {
//             if (this.inputStatus != "VIEW") {
// //{remarks}
//             }
//         })
        // this.$forceUpdate()
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
        M_Post(){
        },
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                from_amt: this.M_CM_StampDuty.from_amt ? this.replaceAllString(this.M_CM_StampDuty.from_amt,',','','number') : 0 ,
                to_amt: this.M_CM_StampDuty.to_amt ? this.replaceAllString(this.M_CM_StampDuty.to_amt,',','','number') : 0 ,
                stampduty_amt: this.M_CM_StampDuty.stampduty_amt ? this.replaceAllString(this.M_CM_StampDuty.stampduty_amt,',','','number') : 0 ,
                remarks: this.M_CM_StampDuty.remarks,
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
                sequence_no: this.M_CM_StampDuty.sequence_no,
                from_amt: this.M_CM_StampDuty.from_amt ? this.replaceAllString(this.M_CM_StampDuty.from_amt,',','','number') : 0 ,
                to_amt: this.M_CM_StampDuty.to_amt ? this.replaceAllString(this.M_CM_StampDuty.to_amt,',','','number') : 0 ,
                stampduty_amt: this.M_CM_StampDuty.stampduty_amt ? this.replaceAllString(this.M_CM_StampDuty.stampduty_amt,',','','number') : 0 ,
                remarks: this.M_CM_StampDuty.remarks,
                user_edit: this.getDataUser().user_id ,
                lastupdatestamp: this.M_CM_StampDuty.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })

        },
		M_ClearForm(){
            this.M_CM_StampDuty = {
                sequence_no: 0,
                from_amt: '',
                to_amt: '',
                stampduty_amt: '',
                remarks: '',
                user_input: '',
                user_edit: this.getDataUser().user_id,
                time_input: '',
                time_edit: '',
                lastupdatestamp: 0,
                control_sequence_no: 0,
                row_id: 0
                    }
            		
		},
        M_New(){
            this.$refs.ref_from_amt.focus()
			
        },
        M_Edit(){
            this.$refs.ref_from_amt.focus()
        },
        M_Delete(dt){       

        var data = this.FormToABSList().getRowSelected()  
        var dataDelete = []

        
        data.forEach((value) => {
          dataDelete.push({
          sequence_no: value.sequence_no,
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
            console.log(record)
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order
,                sequence_no: record.sequence_no
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
this.M_CM_StampDuty = {
                sequence_no: data.sequence_no,
                from_amt: this.isCurrency(data.from_amt, this.decimal),
                to_amt: this.isCurrency(data.to_amt, this.decimal),
                stampduty_amt: this.isCurrency(data.stampduty_amt, this.decimal),
                remarks: data.remarks,
                user_input: data.user_input,
                user_edit: data.user_edit,
                time_input: data.time_input,
                time_edit: data.time_edit,
                lastupdatestamp: record.lastupdatestamp,
                // control_sequence_no: data.control_sequence_no,
                row_id: data.row_id
                    }
                 

         

                this.IEBy.Input = data.user_input
                this.IEBy.Edit = data.user_edit

            })
        }

    },
    beforeCreate: function () {
    },
    created: function() {
        // var vm = this
        this.$store.commit('setFormType','List')
        this.getToolbar().ProcessPS()

        // this.$validator.extend('invalidTransAmt', {
        // getMessage(field, val) {
        //     return "Trans Amount To can't be lower than Trans Amount From"
        // },
        // validate(value, field) {
        //     var trxamtto = vm.replaceAllString(value, ',', '', 'number')
        //     var amtfrom = vm.replaceAllString(vm.M_CM_StampDuty.from_amt, ',', '', 'number')
        //     return trxamtto < amtfrom
        // }
        // })

        // this.PI_to_amt.cValidate = "required|invalidTransAmt"
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

