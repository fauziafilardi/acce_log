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
                                <b-col md="12" id="col-left"> <!-- table open -->
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_contactclasscd" v-model="M_CM_ContactClass.contactclasscd"  ref="ref_contactclasscd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_descs" v-model="M_CM_ContactClass.descs"  ref="ref_descs"/>
                                      </b-col>
                                    </b-row>

                                    <b-row>
                                        <b-col md="2">
                                            <ABSLabelOnly
                                            :prop="{cLabel: 'Tax Transaction Prefix', 
                                                cLabelSize: 4, 
                                                cValue: '', 
                                                cPageLevel: PageLevel, 
                                                cTabIndex: TabIndex, 
                                                cVisible: true,
                                                cClass: 'lbl-col-align'}"
                                            />

                                            <br/>

                                            <ABSLabelOnly
                                            :prop="{cLabel: 'Replacement Tax Transaction Prefix', 
                                                cLabelSize: 4, 
                                                cValue: '', 
                                                cPageLevel: PageLevel, 
                                                cTabIndex: TabIndex, 
                                                cVisible: true,
                                                cClass: 'lbl-col-align'}"
                                            />
                                        </b-col>

                                        <b-col md="1">
                                            <ABSTextBoxOnly :prop="PI_taxtrxprefix1" v-model="M_CM_ContactClass.taxtrxprefix1"  ref="ref_taxtrxprefix1"/>
                                            <br/>
                                            <ABSTextBoxOnly :prop="PI_replacementtaxtrxprefix1" v-model="M_CM_ContactClass.replacementtaxtrxprefix1"  ref="ref_replacementtaxtrxprefix1"/>
                                        </b-col>
                                        <div style="width: 164px !important;padding-top: 18px;padding-left: 0px !important;padding-right: 0px !important;">
                                            <table>
                                                <tr>
                                                    <td style="width: 31px;">&lt;=</td>
                                                    <td>
                                                        <ABSTextBoxOnly :prop="PI_maximumtaxamt" v-model="M_CM_ContactClass.maximumtaxamt"  ref="ref_maximumtaxamt"/>
                                                    </td>
                                                    <td>&gt;</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <b-col md="1">
                                            <ABSTextBoxOnly :prop="PI_taxtrxprefix2" v-model="M_CM_ContactClass.taxtrxprefix2"  ref="ref_taxtrxprefix2"/>
                                            <br/>
                                            <ABSTextBoxOnly :prop="PI_replacementtaxtrxprefix2" v-model="M_CM_ContactClass.replacementtaxtrxprefix2"  ref="ref_replacementtaxtrxprefix2"/>
                                        </b-col>
                                    </b-row>
                                    
                                    <!-- <b-row>
                                      <b-col md="2">
                                          <ABSLabelOnly
                                          :prop="{cLabel: 'Tax Transaction Prefix', 
                                            cLabelSize: 4, 
                                            cValue: '', 
                                            cPageLevel: PageLevel, 
                                            cTabIndex: TabIndex, 
                                            cVisible: true,
                                            cClass: 'lbl-col-align'}"
                                          />
                                      </b-col>
                                      <b-col md="1">
                                        <ABSTextBoxOnly :prop="PI_taxtrxprefix1" v-model="M_CM_ContactClass.taxtrxprefix1"  ref="ref_taxtrxprefix1"/>
                                      </b-col>
                                      <b-col md="2">
                                        <ABSTextBoxOnly :prop="PI_maximumtaxamt" v-model="M_CM_ContactClass.maximumtaxamt"  ref="ref_maximumtaxamt"/>
                                      </b-col>
                                      <b-col md="1">
                                        <ABSTextBoxOnly :prop="PI_taxtrxprefix2" v-model="M_CM_ContactClass.taxtrxprefix2"  ref="ref_taxtrxprefix2"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col md="2">
                                          <ABSLabelOnly
                                          :prop="{cLabel: 'Replacement Tax Transaction Prefix', 
                                            cLabelSize: 4, 
                                            cValue: '', 
                                            cPageLevel: PageLevel, 
                                            cTabIndex: TabIndex, 
                                            cVisible: true,
                                            cClass: 'lbl-col-align'}"
                                          />
                                      </b-col>
                                      <b-col md="1">
                                        <ABSTextBoxOnly :prop="PI_replacementtaxtrxprefix1" v-model="M_CM_ContactClass.replacementtaxtrxprefix1"  ref="ref_replacementtaxtrxprefix1"/>
                                      </b-col>
                                      <b-col md="2">
                                      </b-col>
                                      <b-col md="1">
                                        <ABSTextBoxOnly :prop="PI_replacementtaxtrxprefix2" v-model="M_CM_ContactClass.replacementtaxtrxprefix2"  ref="ref_replacementtaxtrxprefix2"/>
                                      </b-col>
                                    </b-row> -->
                                    <!-- <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_replacementtaxtrxprefix1" v-model="M_CM_ContactClass.replacementtaxtrxprefix1"  ref="ref_replacementtaxtrxprefix1"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_replacementtaxtrxprefix2" v-model="M_CM_ContactClass.replacementtaxtrxprefix2"  ref="ref_replacementtaxtrxprefix2"/>
                                      </b-col>
                                    </b-row> -->
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_vatfreeprefix" v-model="M_CM_ContactClass.vatfreeprefix"  ref="ref_vatfreeprefix"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_replacementvatfreeprefix" v-model="M_CM_ContactClass.replacementvatfreeprefix"  ref="ref_replacementvatfreeprefix"/>
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
		cInsertKey:'id=ContactClassCd, label=ContactClassCd+|+Descs',
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

            M_CM_ContactClass :{
                contactclasscd: '',
                descs: '',
                taxtrxprefix1: '',
                replacementtaxtrxprefix1: '',
                maximumtaxamt: 0,
                taxtrxprefix2: '',
                replacementtaxtrxprefix2: '',
                vatfreeprefix: '',
                replacementvatfreeprefix: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                lastupdatestamp: 0,
                rowid: 0
                    }
            ,
            PI_contactclasscd: { 
                cValidate :'required|max:5', 
                cName: 'contactclasscd', 
                cLabel: 'Contact Class Code', 
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
            PI_maximumtaxamt: { 
                cValidate :'max:15', 
                cName: 'maximumtaxamt', 
                cLabel: 'Limit Tax Amount', 
                cLabelSize: 4, 
                cOrder: 4, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: false, 
                cLastLabelShow: false,
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_taxtrxprefix1: { 
                cValidate :'max:3', 
                cName: 'taxtrxprefix1', 
                cLabel: 'Tax Trans. Prefix <= Limit Tax', 
                cLabelSize: 4, 
                cOrder: 3, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cLastLabelShow: false,
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_taxtrxprefix2: { 
                cValidate :'max:3', 
                cName: 'taxtrxprefix2', 
                cLabel: 'Tax Trans. Prefix >= Limit Tax', 
                cLabelSize: 4, 
                cOrder: 5, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false,
                cLastLabelShow: false,
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_replacementtaxtrxprefix1: { 
                cValidate :'max:3', 
                cName: 'replacementtaxtrxprefix1', 
                cLabel: 'Replacement Tax Transaction Prefix < Tax Limit', 
                cLabelSize: 4, 
                cOrder: 6, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cLastLabelShow: false,
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_replacementtaxtrxprefix2: { 
                cValidate :'max:3', 
                cName: 'replacementtaxtrxprefix2', 
                cLabel: 'Replacement Tax Prefix > Limit tax', 
                cLabelSize: 4, 
                cOrder: 7, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cLastLabelShow: false,
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_vatfreeprefix: { 
                cValidate :'max:3', 
                cName: 'vatfreeprefix', 
                cLabel: 'VAT Exemption Prefix', 
                cLabelSize: 4, 
                cOrder: 8, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_replacementvatfreeprefix: { 
                cValidate :'max:3', 
                cName: 'replacementvatfreeprefix', 
                cLabel: 'Replacement VAT Exemption Prefix', 
                cLabelSize: 4, 
                cOrder: 9, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
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
                contact_class_cd: this.M_CM_ContactClass.contactclasscd,
                descs: this.M_CM_ContactClass.descs,
                tax_trx_prefix1: this.M_CM_ContactClass.taxtrxprefix1,
                replacement_tax_trx_prefix1: this.M_CM_ContactClass.replacementtaxtrxprefix1,
                maximum_tax_amt: this.M_CM_ContactClass.maximumtaxamt ? this.replaceAllString(this.M_CM_ContactClass.maximumtaxamt,',','','number') : 0 ,
                tax_trx_prefix2: this.M_CM_ContactClass.taxtrxprefix2,
                replacement_tax_trx_prefix2: this.M_CM_ContactClass.replacementtaxtrxprefix2,
                vat_free_prefix: this.M_CM_ContactClass.vatfreeprefix,
                replacement_vat_free_prefix: this.M_CM_ContactClass.replacementvatfreeprefix,
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
                contact_class_cd: this.M_CM_ContactClass.contactclasscd,
                descs: this.M_CM_ContactClass.descs,
                tax_trx_prefix1: this.M_CM_ContactClass.taxtrxprefix1,
                replacement_tax_trx_prefix1: this.M_CM_ContactClass.replacementtaxtrxprefix1,
                maximum_tax_amt: this.M_CM_ContactClass.maximumtaxamt ? this.replaceAllString(this.M_CM_ContactClass.maximumtaxamt,',','','number') : 0 ,
                tax_trx_prefix2: this.M_CM_ContactClass.taxtrxprefix2,
                replacement_tax_trx_prefix2: this.M_CM_ContactClass.replacementtaxtrxprefix2,
                vat_free_prefix: this.M_CM_ContactClass.vatfreeprefix,
                replacement_vat_free_prefix: this.M_CM_ContactClass.replacementvatfreeprefix,
                user_edit: this.getDataUser().user_id ,
                lastupdatestamp: this.M_CM_ContactClass.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })

        },
		M_ClearForm(){
            this.M_CM_ContactClass = {
                contactclasscd: '',
                descs: '',
                taxtrxprefix1: '',
                replacementtaxtrxprefix1: '',
                maximumtaxamt: '',
                taxtrxprefix2: '',
                replacementtaxtrxprefix2: '',
                vatfreeprefix: '',
                replacementvatfreeprefix: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                lastupdatestamp: 0,
                rowid: 0
                    }
            		
		},
        M_New(){
			this.$refs.ref_contactclasscd.focus()
        },
        M_Edit(){
            this.$refs.ref_descs.focus()
        },
        M_Delete(dt){       

            var data = this.FormToABSList().getRowSelected()  
            var dataDelete = []

            
            data.forEach((value) => {
            dataDelete.push({
            contact_class_cd: value.contact_class_cd,
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
,                contact_class_cd: record.contact_class_cd
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
this.M_CM_ContactClass = {
                contactclasscd: data.contact_class_cd,
                descs: data.descs,
                taxtrxprefix1: data.tax_trx_prefix1,
                replacementtaxtrxprefix1: data.replacement_tax_trx_prefix1,
                maximumtaxamt: this.isCurrency(data.maximum_tax_amt, this.decimal),
                taxtrxprefix2: data.tax_trx_prefix2,
                replacementtaxtrxprefix2: data.replacement_tax_trx_prefix2,
                vatfreeprefix: data.vat_free_prefix,
                replacementvatfreeprefix: data.replacement_vat_free_prefix,
                userinput: data.user_input,
                useredit: data.user_edit,
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

