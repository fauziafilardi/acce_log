<template>
    <div>        
    <ABSListVuex
      :prop = "propList"
      :title = "data.query_name"
      @rowClicked = "rowClicked"
      @rowDblClicked = "doDoubleClick"
      @rowLinkClick = "rowLink"
      @pageSize = "M_PageSize"
      @pagination = "M_Pagination"
      @filter = "M_Advance_Filter"
      @headTable = "M_Head_Table"
    />


        <div v-show="$parent.isDetail"  :style="'margin-top:10px;'" class="el" mousetip mousetip-msg="I'm a tooltip">
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
                                        <ABSinputTextVuex :prop="PI_TaxCd" v-model="M_CM_TaxMaster.TaxCd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_Descs" v-model="M_CM_TaxMaster.Descs"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex :prop="PI_Category" v-model="M_CM_TaxMaster.Category" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex :prop="PI_FinalWithholdingTax" v-model="M_CM_TaxMaster.FinalWithholdingTax" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex :prop="PI_VATFree" v-model="M_CM_TaxMaster.VATFree" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_JoinLevel" v-model="M_CM_TaxMaster.JoinLevel"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col md="6">
                                            <b-row>
                                                <b-col md="4" class="lbl-col-align"></b-col>                                                
                                                <b-col><label class="lbl-value-view-form">* 0 artinya selalu dipisah. Jadi kalau mau disatukan, isi dengan angka yang sama tapi selain 0.</label></b-col>
                                            </b-row>                                              
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
import {EventBus} from '../../../../main'
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
                OrderBy: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_CM_TaxMaster :{
                TaxCd: '',
                Descs: '',
                Category: 'E',
                JoinLevel: '0',
                T0: '',
                T1: '',
                T2: '',
                T3: '',
                T4: '',
                T5: '',
                T6: '',
                T7: '',
                T8: '',
                T9: '',
                T10: '',
                T11: '',
                T12: '',
                T13: '',
                T14: '',
                T15: '',
                T16: '',
                T17: '',
                T18: '',
                T19: '',
                T20: '',
                T21: '',
                T22: '',
                T23: '',
                T24: '',
                T25: '',
                T26: '',
                T27: '',
                T28: '',
                T29: '',
                T30: '',
                Status: '',
                UserInput: '',
                UserEdit: this.getDataUser().user_id,
                TimeInput: '',
                TimeEdit: '',
                LastUpdateStamp: 0,
                ControlSequenceNo: 0,
                FinalWithholdingTax: 'Y',
                VATFree: 'N',
                RowId: 0
                    }
            ,
            PI_TaxCd: { 
                cValidate :'required|max:4', 
                cName:'TaxCd', 
                cLabel:'Tax Code', 
                cOrder:0, 
                cKey:true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
                cKey: true 
            }, 
            PI_Descs: { 
                cValidate :'required', 
                cName:'Descs', 
                cLabel:'Description', 
                cOrder:0, 
                cKey:false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_Category: { 
                cValidate :'', 
                cName:'Category', 
                cId:'rdbCategory', 
                cRadioOptions: [{ text: 'Inclusive', value: 'I' },{ text: 'Exclusive', value: 'E' },], 
                cLabel:'Tax Category', 
                cOrder:0, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_FinalWithholdingTax: { 
                cValidate :'', 
                cName:'FinalWithholdingTax', 
                cId:'rdbFinalWithholdingTax', 
                cRadioOptions: [{ text: 'Yes', value: 'Y' },{ text: 'No', value: 'N' },], 
                cLabel:'Final Withholding Tax', 
                cOrder:0, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_VATFree: { 
                cValidate :'', 
                cName:'VATFree', 
                cId:'rdbVATFree', 
                cRadioOptions: [{ text: 'Yes', value: 'Y' },{ text: 'No', value: 'N' },], 
                cLabel:'VAT Exemption', 
                cOrder:0, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_JoinLevel: { 
                cValidate :'required', 
                cName:'JoinLevel', 
                cLabel:'Join Level', 
                cOrder:0, 
                cKey:false, 
                cType: 'numeric',
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
            this.$store.commit('setEventStatus', 'HEADTABLE')
            this.$store.commit('setLevel',this.PageLevel)
            this.$parent.isDetail = false
            this.FormToMasterPage().ValidasiPage()
        },
        M_PageSize(){
			this.$store.commit('setEventStatus', 'PAGESIZE')
            this.$store.commit('setLevel',this.PageLevel)
            this.$parent.isDetail = false
            this.FormToMasterPage().ValidasiPage()
        },
        M_TabClick(){
        },
        M_Pagination(){
			this.$store.commit('setEventStatus', 'PAGINATION')
            this.$store.commit('setLevel',this.PageLevel)
            this.$parent.isDetail = false
            this.FormToMasterPage().ValidasiPage()
        },
        M_Advance_Filter(){
        },
        M_Search(data){
            this.$store.commit('setEventStatus', 'ONSEARCHENTER')
            this.$store.commit('setLevel',this.PageLevel)
            this.$parent.isDetail = false
            this.FormToMasterPage().ValidasiPage()
            this.FormToABSList().doGetList(data,'eb_getList')
        },
        M_Post(){
        },
        M_Refresh(){
        },
		doDoubleClick(){
        },
        SaveData () {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                TaxCd: this.M_CM_TaxMaster.TaxCd,
                Descs: this.M_CM_TaxMaster.Descs,
                // JoinLevel: this.M_CM_TaxMaster.JoinLevel ? this.replaceAllString(this.M_CM_TaxMaster.JoinLevel, ",", "").split(".")[0] : 0 ,
                JoinLevel: this.M_CM_TaxMaster.JoinLevel,
                Category: this.M_CM_TaxMaster.Category,
                FinalWithholdingTax: this.M_CM_TaxMaster.FinalWithholdingTax,
                VATFree: this.M_CM_TaxMaster.VATFree,
                UserInput: this.getDataUser().user_id                 
            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return
                
                this.FormToABSList().doGetList('','save')

                this.alertSuccess(response.Message)
                .then(() => {
                    this.getToolbar().setButton(false)
                    this.$store.commit('setListDisable', false)
                    this.$store.commit('setStatus', 'view')
					this.$store.commit('setEventStatus', 'Save')
                    this.FormToABSList().doGetList('','eb_getList')
                    this.$parent.isDetail = false

                    this.FormToMasterPage().ValidasiPage()
										
					
                })
            })

        },
        UpdateData () {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                TaxCd: this.M_CM_TaxMaster.TaxCd,
                Descs: this.M_CM_TaxMaster.Descs,
                // JoinLevel: this.M_CM_TaxMaster.JoinLevel ? this.replaceAllString(this.M_CM_TaxMaster.JoinLevel, ",", "").split(".")[0] : 0 ,
                JoinLevel: this.M_CM_TaxMaster.JoinLevel,
                Category: this.M_CM_TaxMaster.Category,
                FinalWithholdingTax: this.M_CM_TaxMaster.FinalWithholdingTax,
                VATFree: this.M_CM_TaxMaster.VATFree,
                UserEdit: this.getDataUser().user_id ,
                LastUpdateStamp: this.M_CM_TaxMaster.LastUpdateStamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                this.alertSuccess(response.Message)
                .then(() => {
                    this.getToolbar().setButton(false)
                    this.$store.commit('setListDisable', false)
                    this.$store.commit('setStatus', 'view')

                    this.FormToABSList().doGetList('','update')
                    this.$parent.isDetail = false

                    this.FormToMasterPage().ValidasiPage()
					
                })
            })

        },
		m_ClearForm(){
            this.M_CM_TaxMaster ={
                TaxCd: '',
                Descs: '',
                Category: 'E',
                JoinLevel: '0',
                T0: '',
                T1: '',
                T2: '',
                T3: '',
                T4: '',
                T5: '',
                T6: '',
                T7: '',
                T8: '',
                T9: '',
                T10: '',
                T11: '',
                T12: '',
                T13: '',
                T14: '',
                T15: '',
                T16: '',
                T17: '',
                T18: '',
                T19: '',
                T20: '',
                T21: '',
                T22: '',
                T23: '',
                T24: '',
                T25: '',
                T26: '',
                T27: '',
                T28: '',
                T29: '',
                T30: '',
                Status: '',
                UserInput: '',
                UserEdit: this.getDataUser().user_id,
                TimeInput: '',
                TimeEdit: '',
                LastUpdateStamp: 0,
                ControlSequenceNo: 0,
                FinalWithholdingTax: 'Y',
                VATFree: 'N',
                RowId: 0
                    }
            		
		},
        M_New(){
            this.$parent.state = 'NEW'
			this.m_ClearForm()

            this.FormToMasterPage().ValidasiPage()
            this.$parent.isDetail = true
			

            //this.$nextTick().then(() => document.getElementById("TaxCd").focus())
        },
        M_Edit(){
            //this.$nextTick().then(() => document.getElementById("???").focus())
        },
        M_Delete(){
            var data = this.FormToABSList().getRowSelected()
            var dataDelete = []

            data.forEach((value) => {
                dataDelete.push({
                TaxCd: value.TaxCd,
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
        M_Save(){
            if(this.inputStatus == 'EDIT')
			{			
                this.UpdateData()			
            }
            else 
			{
                this.SaveData()
            }        
        },
        paramFromParent(){

        },
		M_Cancel() {},
        rowClicked (record, index) {
            this.$parent.state = 'UPDATE'
			this.$parent.isDetail = true
            this.$store.commit('SetPage1Data', record)
            this.$store.commit('setEventStatus', 'rowClick')
            this.$store.commit('setLevel',this.PageLevel)
            this.getDataBy(record)
            

            this.FormToMasterPage().ValidasiPage()
        },
        rowLink: function(url){
            this.$refs.modalTest.show()
        },
        getDataBy (record) {
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order
,                TaxCd: record.TaxCd
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
this.M_CM_TaxMaster ={
                TaxCd: data.TaxCd,
                Descs: data.Descs,
                Category: data.Category,
                JoinLevel: data.JoinLevel,
                T0: data.T0,
                T1: data.T1,
                T2: data.T2,
                T3: data.T3,
                T4: data.T4,
                T5: data.T5,
                T6: data.T6,
                T7: data.T7,
                T8: data.T8,
                T9: data.T9,
                T10: data.T10,
                T11: data.T11,
                T12: data.T12,
                T13: data.T13,
                T14: data.T14,
                T15: data.T15,
                T16: data.T16,
                T17: data.T17,
                T18: data.T18,
                T19: data.T19,
                T20: data.T20,
                T21: data.T21,
                T22: data.T22,
                T23: data.T23,
                T24: data.T24,
                T25: data.T25,
                T26: data.T26,
                T27: data.T27,
                T28: data.T28,
                T29: data.T29,
                T30: data.T30,
                Status: data.Status,
                UserInput: data.UserInput,
                UserEdit: data.UserEdit,
                TimeInput: data.TimeInput,
                TimeEdit: data.TimeEdit,
                LastUpdateStamp: record.LastUpdateStamp,
                ControlSequenceNo: data.ControlSequenceNo,
                FinalWithholdingTax: data.FinalWithholdingTax,
                VATFree: data.VATFree,
                RowId: data.row_id
                    }
                 

         

                this.IEBy.Input = data.userinput
                this.IEBy.Edit = data.useredit

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

