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
                                        <ABSinputTextVuex :prop="PI_TaxCd" v-model="M_CM_TaxMasterDetailD2.TaxCd" ref='ref_TaxCd'/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_TaxType" v-model="M_CM_TaxMasterDetailD2.TaxType" ref='ref_TaxType'/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_StartAmt" v-model="M_CM_TaxMasterDetailD2.StartAmt" ref='ref_StartAmt'/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_TaxRate" v-model="M_CM_TaxMasterDetailD2.TaxRate" ref='ref_TaxRate'/>
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
                initialWhere:"tax_cd = '" + this.ValKey + "'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '' 
            },
       
            IEBy: {Input: '', Edit: ''},

            M_CM_TaxMasterDetailD2 :{
                TaxCd: '',
                TaxType: '',
                SequenceNo: '',
                StartAmt: '',                
                TaxRate: '',
                UserInput: '',
                UserEdit: this.getDataUser().user_id,
                TimeInput: '',
                TimeEdit: '',
                LastUpdateStamp: 0,
                ControlSequenceNo: 0,
                RowId: 0
            },
            PI_TaxCd: { 
                cValidate :'max:4', 
                cName:'TaxxxCd', 
                cLabel:'Tax Code', 
                cOrder:1, 
                cKey:false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
                cProtect: true
            },
            PI_TaxType: { 
                cValidate :'max:5', 
                cName:'TaxxxType', 
                cLabel:'Tax Type', 
                cOrder:1, 
                cKey:false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
                cProtect: true
            },
            PI_StartAmt: { 
                cValidate :'required', 
                cName:'EndAmount', 
                cLabel:'End Amount', 
                cOrder:1, 
                cKey:true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
                cType: 'decimal'
            },
            PI_TaxRate: { 
                cValidate :'required|max:3|max_value:100', 
                cName:'TaxRate', 
                cLabel:'Tax Rate', 
                cOrder:1, 
                cKey:false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
                cType: 'decimal'
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
        M_PageSize () {
        },
        M_TabClick () {
        },
        M_Pagination () {
        },
        M_Advance_Filter () {
        },
        M_Search (data) {
        },
        M_Refresh () {
        },
        // SaveData () {
        M_Insert () {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                tax_cd: this.M_CM_TaxMasterDetailD2.TaxCd,
                tax_type: this.M_CM_TaxMasterDetailD2.TaxType,
                start_amt: parseFloat(this.M_CM_TaxMasterDetailD2.StartAmt ? this.replaceAllString(this.M_CM_TaxMasterDetailD2.StartAmt, ",", "","number") : 0),
                tax_rate: parseFloat(this.M_CM_TaxMasterDetailD2.TaxRate ? this.replaceAllString(this.M_CM_TaxMasterDetailD2.TaxRate, ",", "","number") : 0),
                user_input: this.getDataUser().user_id                
            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return
                
                this.$parent.resultInsert(response.Message)
            })
        },
        // UpdateData () {
        M_Update () {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                tax_cd: this.M_CM_TaxMasterDetailD2.TaxCd,
                tax_type: this.M_CM_TaxMasterDetailD2.TaxType,           
                tax_rate: parseFloat(this.M_CM_TaxMasterDetailD2.TaxRate ? this.replaceAllString(this.M_CM_TaxMasterDetailD2.TaxRate, ",", "","number") : 0),
                sequence_no: this.M_CM_TaxMasterDetailD2.SequenceNo,
                lastupdatestamp: this.M_CM_TaxMasterDetailD2.LastUpdateStamp,
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                this.$parent.resultUpdate(response.Message)
            })
        },
		M_ClearForm(){
            this.M_CM_TaxMasterDetailD2 ={
                TaxCd: '',
                TaxType: '',
                SequenceNo: '',
                StartAmt: '',                
                TaxRate: '',
                UserInput: '',
                UserEdit: this.getDataUser().user_id,
                TimeInput: '',
                TimeEdit: '',
                LastUpdateStamp: 0,
                ControlSequenceNo: 0,
                RowId: 0
            }
		},
        M_New () {
            let data = this.$store.getters.GetPage2Data
            this.M_CM_TaxMasterDetailD2.TaxCd = data.tax_cd
            this.M_CM_TaxMasterDetailD2.TaxType = data.tax_type

            this.$refs.ref_StartAmt.focus()
        },
        M_Edit () {
            this.$refs.ref_TaxRate.focus()
        },
        M_Delete (dt) {
            var data = this.FormToABSList().getRowSelected()
            var dataDelete = []

            data.forEach((value) => {
                dataDelete.push({
                    tax_cd: value.tax_cd,
                    tax_type: value.tax_type,
                    sequence_no: value.sequence_no,
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
        
        paramFromParent(){
            this.$parent.showForm = false
            let data = this.$store.getters.GetPage2Data
            this.M_CM_TaxMasterDetailD2.TaxCd = data.tax_cd 
            this.propList.initialWhere =" tax_cd = '" + data.tax_cd + "' AND tax_type = '"+ data.tax_type +"'"
            this.FormToABSList().doGetList('','eb_getList')
        },
		M_Cancel() {},		
        rowClicked (record, index) {
        },
        rowLink (url) {
            // this.$refs.modalTest.show()
        },
        getDataBy (record) {
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                tax_cd: record.tax_cd,
                tax_type: record.tax_type,
                lastupdatestamp: record.lastupdatestamp,
                sequence_no: record.sequence_no
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
                this.M_CM_TaxMasterDetailD2 = {
                    TaxCd: data.tax_cd,
                    TaxType: data.tax_type,
                    SequenceNo: data.sequence_no,
                    StartAmt: this.isCurrency(data.start_amt),                
                    TaxRate: this.isCurrency(data.tax_rate),
                    UserInput: data.user_input,
                    UserEdit: this.getDataUser().user_id,
                    TimeInput: data.time_input,
                    TimeEdit: data.time_edit,                
                    LastUpdateStamp: record.lastupdatestamp,                
                    RowId: data.row_id
                }

                this.IEBy.Input = data.user_input
                this.IEBy.Edit = data.user_edit

            })
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

