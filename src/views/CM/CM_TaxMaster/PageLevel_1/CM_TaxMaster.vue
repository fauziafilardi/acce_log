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
                                        <ABSinputTextVuex :prop="PI_TaxCd" v-model="M_CM_TaxMaster.TaxCd" ref='ref_TaxCd'/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_Descs" v-model="M_CM_TaxMaster.Descs" ref='ref_Descs'/>
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

export default {
    props: {PageLevel: '', TabIndex: '', data: ''},
    data() {
        return {
		FormType: "List",
        Module:"CM",
        cInsertKey: "id=TaxCd,label=TaxCd+|+Descs",
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
            },
            PI_TaxCd: { 
                cValidate :'required|max:4', 
                cName:'TaxCd', 
                cLabel:'Tax Code', 
                cOrder:1, 
                cKey:true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
                cKey: true 
            }, 
            PI_Descs: { 
                cValidate :'required|max:60', 
                cName:'Descs', 
                cLabel:'Description', 
                cOrder:2, 
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
                cLabel:'VAT Category', 
                cOrder:3, 
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
                cOrder:4, 
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
                cOrder:5, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_JoinLevel: { 
                cValidate :'required|max:12', 
                cName:'JoinLevel', 
                cLabel:'Join Level', 
                cOrder:6, 
                cKey:false, 
                cType: 'numeric',
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
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
            if (this.$store.getters.getLevel == this.PageLevel && this.$store.getters.getTab == this.TabIndex) {
                return this.$store.getters.getStatus.toUpperCase()
            } else {
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
        M_Advance_Filter() {
        },
        M_Search (data) {
        },
        M_Post () {
        },
        M_Refresh () {
        },
		M_ClearForm(){
            this.M_CM_TaxMaster ={
                TaxCd: '',
                Descs: '',
                Category: 'E',
                JoinLevel: '',
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
        M_New () {
            this.$refs.ref_TaxCd.focus()
        },
        M_Edit() {
            this.$refs.ref_Descs.focus()
        },
        M_Delete (dt) {
            var data = this.FormToABSList().getRowSelected()  
            var dataDelete = []
            
            data.forEach((value) => {
                dataDelete.push({
                    tax_cd: value.tax_cd,
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
        // SaveData () {
        M_Insert () {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                tax_cd: this.M_CM_TaxMaster.TaxCd,
                descs: this.M_CM_TaxMaster.Descs,
                // JoinLevel: this.M_CM_TaxMaster.JoinLevel ? this.replaceAllString(this.M_CM_TaxMaster.JoinLevel, ",", "").split(".")[0] : 0 ,
                join_level: this.M_CM_TaxMaster.JoinLevel,
                category: this.M_CM_TaxMaster.Category,
                final_withholding_tax: this.M_CM_TaxMaster.FinalWithholdingTax,
                vatfree: this.M_CM_TaxMaster.VATFree,
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
                tax_cd: this.M_CM_TaxMaster.TaxCd,
                descs: this.M_CM_TaxMaster.Descs,
                // JoinLevel: this.M_CM_TaxMaster.JoinLevel ? this.replaceAllString(this.M_CM_TaxMaster.JoinLevel, ",", "").split(".")[0] : 0 ,
                join_level: this.M_CM_TaxMaster.JoinLevel,
                category: this.M_CM_TaxMaster.Category,
                final_withholding_tax: this.M_CM_TaxMaster.FinalWithholdingTax,
                vatfree: this.M_CM_TaxMaster.VATFree,
                user_edit: this.getDataUser().user_id ,
                lastupdatestamp: this.M_CM_TaxMaster.LastUpdateStamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                this.$parent.resultUpdate(response.Message)
            })
        },
        M_Cancel() {
        },
        paramFromParent () {
        },
		rowClicked (record, index) {
        },
        doDoubleClick () {
        },
        rowLink (url) {
            // this.$refs.modalTest.show()
        },
        getDataBy (record) {
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                tax_cd: record.tax_cd
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                this.M_CM_TaxMaster = {
                    TaxCd: data.tax_cd,
                    Descs: data.descs,
                    Category: data.category,
                    JoinLevel: data.join_level,
                    Status: data.status,
                    UserInput: data.user_input,
                    UserEdit: data.user_edit,
                    TimeInput: data.time_input,
                    TimeEdit: data.time_edit,
                    LastUpdateStamp: record.lastupdatestamp,
                    ControlSequenceNo: data.control_sequence_no,
                    FinalWithholdingTax: data.final_withholding_tax,
                    VATFree: data.vatfree,
                    RowId: data.row_id
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

