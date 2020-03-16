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
                                        <ABSinputTextVuex :prop="PI_paymentcd" v-model="M_CM_PaymentType.paymentcd"  ref="ref_paymentcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_descs" v-model="M_CM_PaymentType.descs"  ref="ref_descs"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnpaymenttypeChange" :prop="PI_paymenttype" v-model="M_CM_PaymentType.paymenttype"  ref="ref_paymenttype" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_CM_PaymentType.remarks"  ref="ref_remarks" />
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
    props: {PageLevel: '', TabIndex: '', data: ''},
    data() {
        return {
		cInsertKey:'id=payment_cd,label=payment_cd+|+descs',
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

            M_CM_PaymentType :{
                paymentcd: '',
                descs: '',
                paymenttype: 'C',
                paymenttypegroup: 'G',
                remarks: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                lastupdatestamp: 0,
                rowid: 0
                    }
            ,
            PI_paymentcd: { 
                cValidate :'required|max:5', 
                cName: 'paymentcd', 
                cLabel: 'Payment Code', 
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
            PI_descs: { 
                cValidate :'required|max:60', 
                cName: 'descs', 
                cLabel: 'Description', 
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
            PI_paymenttype: { 
                cValidate :'', 
                cName: 'paymenttype', 
                cId: 'rdbpaymenttype', 
                cRadioOptions: [{ text: 'Cash', value: 'N' },{ text: 'Non Cash', value: 'C' },], 
                cRadioDefaultOption: 'C', 
                cLabel:'Payment Type', 
                cLabelSize: 4, 
                cOrder: 3, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_paymenttypegroup: { 
                cValidate :'', 
                cName: 'paymenttypegroup', 
                cId: 'rdbpaymenttypegroup', 
                cRadioOptions: [{ text: 'Cheque', value: 'C' },{ text: 'Giro', value: 'G' },], 
                cRadioDefaultOption: 'G', 
                cLabel:'Payment Type Group', 
                cLabelSize: 4, 
                cOrder: 4, 
                cProtect: false, 
                cVisible:  false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_remarks: { 
                cValidate :'', 
                cName:'remarks', 
                cLabel:'Remarks', 
                cLabelSize: 4, 
                cOrder:5, 
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
		return this.$store.getters.GetPage1Data
	}
  },
    methods: {		
        OnpaymenttypeChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{paymenttype}
            }
        })
        this.$forceUpdate()
        },
        OnpaymenttypegroupChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{paymenttypegroup}
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
        M_Post(){
        },
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                payment_cd: this.M_CM_PaymentType.paymentcd,
                descs: this.M_CM_PaymentType.descs,
                payment_type: this.M_CM_PaymentType.paymenttype,
                payment_type_group: this.M_CM_PaymentType.paymenttypegroup,
                remarks: this.M_CM_PaymentType.remarks,
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
                payment_cd: this.M_CM_PaymentType.paymentcd,
                descs: this.M_CM_PaymentType.descs,
                payment_type: this.M_CM_PaymentType.paymenttype,
                payment_type_group: this.M_CM_PaymentType.paymenttypegroup,
                remarks: this.M_CM_PaymentType.remarks,
                user_edit: this.getDataUser().user_id ,
                lastupdatestamp: this.M_CM_PaymentType.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })

        },
		M_ClearForm(){
            this.M_CM_PaymentType = {
                paymentcd: '',
                descs: '',
                paymenttype: 'C',
                paymenttypegroup: 'G',
                remarks: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                lastupdatestamp: 0,
                rowid: 0
            }
            		
		},
        M_New(){
			this.$refs.ref_paymentcd.focus()
        },
        M_Edit(){
            this.$refs.ref_descs.focus()
        },
        M_Delete(dt){       

            var data = this.FormToABSList().getRowSelected()
            var dataDelete = []

            data.forEach((value) => {
                dataDelete.push({
                    payment_cd: value.payment_cd,
                    lastupdatestamp: value.lastupdatestamp,
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
        getDataBy (record) {
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                payment_cd: record.payment_cd
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                this.M_CM_PaymentType = {
                    paymentcd: data.payment_cd,
                    descs: data.descs,
                    paymenttype: data.payment_type,
                    paymenttypegroup: data.payment_type_group,
                    remarks: data.remarks,
                    userinput: data.user_input,
                    useredit: data.user_edit,
                    timeinput: data.time_input,
                    timeedit: data.time_edit,
                    lastupdatestamp: record.lastupdatestamp,
                    rowid: data.row_id
                }
                
                this.IEBy.Input = data.user_input
                this.IEBy.Edit = data.user_edit

            })
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

