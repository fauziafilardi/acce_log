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
    />


        <div v-show="$parent.showForm"  :style="'margin-top:10px;'" class="el" mousetip mousetip-msg="I'm a tooltip">
            <div class="div-collapse" v-b-toggle.collapse1>
                <span class="master-span" v-show="IEBy.Input && IEBy.Edit">
                    Input By : {{IEBy.Input}} | Edit By : {{IEBy.Edit}} <font-awesome-icon icon="sort-down" class="icon-style-1__master" /> 
                </span>
            </div>
            <b-collapse id="collapse1" visible="true">
                <b-row  style="padding-left: 10px; padding-bottom: 10px; !important;">     
					<b-col md="12" id="col-left" class="bColMasterForm">	
						<b-form :data-vv-scope="'FormScope_' + PageLevel + '_' + TabIndex" :data-vv-value-path="'FormScope_' + PageLevel + '_' + TabIndex">
                            <b-row style="padding-left:10px;">					
                                <b-col md="12" id="col-left"> <!-- table open -->
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_caption" v-model="M_SS_CustomField.caption"/>
                                      </b-col>
                                    </b-row>
                                <b-col md="12" id="col-left"> <!-- table open -->
                                </b-col> <!-- table close -->
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelect2 @change="OndatatypeChange" :prop="PI_datatype" :value="M_SS_CustomField.datatype"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_length" v-model="M_SS_CustomField.length"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex :prop="PI_mandatory" v-model="M_SS_CustomField.mandatory" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex :prop="PI_lookupstatus" v-model="M_SS_CustomField.lookupstatus" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnlookuptableChange" :prop="PI_lookuptable" :value="M_SS_CustomField.lookuptable" :label="M_SS_CustomField.lookuptableLabel" />
                                      </b-col>
                                      <b-col md="6">
                                          <div>
                                              <label><b>Available Field (for Lookup)</b></label>
                                          </div>                                          
                                          <label>
                                              <label v-for="(x,i) in AvailableColumn">                                                  
                                                  {{x}}
                                                  {{i==AvailableColumn.length -1 ? '' : ' ,'}}
                                              </label>
                                          </label>
                                          <!-- {{AvailableColumn}} -->
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_lookupfield" v-model="M_SS_CustomField.lookupfield"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_lookupcondition" v-model="M_SS_CustomField.lookupcondition"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_defaultdescs" v-model="M_SS_CustomField.defaultdescs"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>                                        
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_defaultnumeric" v-model="M_SS_CustomField.defaultnumeric"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputDateVuex :prop="PI_defaultdate" v-model="M_SS_CustomField.defaultdate"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex :prop="PI_remarks" v-model="M_SS_CustomField.remarks" />
                                      </b-col>
                                    </b-row>
                                </b-col> <!-- table close -->
                  
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
            AvailableColumn:[],
			ValKey:null,
            FormType: "List",
			Module:"SS",
            propList: {
                initialWhere:"page_master_seq = '" + this.ValKey + "'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_SS_CustomField :{
                fieldsequenceno: 0,
                pagemasterseq: 0,
                caption: '',
                datatype: 'D',
                length: '',
                mandatory: 'Y',
                lookupstatus: 'N',
                lookuptable: '',
                lookuptableLabel: '',
                lookupfield: '',
                lookupcondition: '',
                defaultdescs: '',
                defaultnumeric: '',
                defaultdate: '',
                remarks: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                lastupdatestamp: 0,
                rowid: 0
                    }
            ,
            PI_caption: { 
                cValidate :'required', 
                cName:'caption', 
                cLabel:'Caption', 
                cOrder:0, 
                cKey:false, 
                cVisible:true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            // PI_datatype: { 
            //     dataLookUp: null, 
            //     cValidate :'', 
            //     cName:'datatype', 
            //     cLabel:'Data Type', 
            //     cRadioDefaultOption:'', 
            //     cKey:false, 
            //     cStatic: true, 
            //     cOption: [{ label: 'Description', id: 'D' },{ label: 'Numeric', id: 'N' },{ label: 'Datetime', id: 'A' },{ label: 'Text', id: 'T' }], 
            //     cOrder:0, 
            //     cPageLevel: this.PageLevel, 
            //     cTabIndex: this.TabIndex, 
            //     cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
            //     cMasterUrl:'' ,
            //     cDisplayColumn:'' ,
            // },
            PI_datatype: { 
                dataLookUp: null, 
                cValidate :'', 
                cName:'datatype', 
                cLabel:'Data Type', 
                cKey:true, 
                cOrder:0, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cStatic: true,
                cOption: [{ label: 'Description', id: 'D' },{ label: 'Numeric', id: 'N' },{ label: 'Datetime', id: 'A' },{ label: 'Text', id: 'T' }]
            },                         
            PI_length: { 
                cValidate :'required', 
                cName:'length', 
                cLabel:'Length', 
                cOrder:0, 
                cKey:false, 
                cType: 'numeric',
                cVisible:true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_mandatory: { 
                cValidate :'', 
                cName:'mandatory', 
                cId:'rdbmandatory', 
                cRadioOptions: [{ text: 'Yes', value: 'Y' },{ text: 'No', value: 'N' },], 
                cLabel:'Mandatory', 
                cOrder:0, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_lookupstatus: { 
                cValidate :'', 
                cName:'lookupstatus', 
                cId:'rdblookupstatus', 
                cRadioOptions: [{ text: 'Yes', value: 'Y' },{ text: 'No', value: 'N' },], 
                cLabel:'Lookup Status', 
                cOrder:0, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_lookuptable: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupTableName'    , 
                    ColumnDB: 'name'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
                cName:'lookuptable', 
                cLabel:'Lookup Table', 
                cKey:false, 
                cStatic: false, 
                cOrder:0, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cMasterUrl:'' ,
                cDisplayColumn:'name' ,
            }, 
            PI_lookupfield: { 
                cValidate :'required', 
                cName:'lookupfield', 
                cLabel:'Lookup Field', 
                cOrder:0, 
                cKey:false, 
                cVisible:true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_lookupcondition: { 
                cValidate :'', 
                cName:'lookupcondition', 
                cLabel:'Lookup Condition', 
                cOrder:0, 
                cKey:false, 
                cVisible:true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_defaultdescs: { 
                cValidate :'', 
                cName:'defaultdescs', 
                cLabel:'Default Descs', 
                cOrder:0, 
                cKey:false, 
                cVisible:false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_defaultnumeric: { 
                cValidate :'', 
                cName:'defaultnumeric', 
                cLabel:'Default Numeric', 
                cOrder:0, 
                cKey:false, 
                cType: 'decimal',
                cVisible:false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_defaultdate: { 
                cValidate :'', 
                cName:'defaultdate', 
                cLabel:'Default Date', 
                cOrder:0, 
                cKey:false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
                cVisible: false 
            }, 
            PI_remarks: { 
                cValidate :'', 
                cName:'remarks', 
                cLabel:'Remarks', 
                cOrder:0, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cVisible:true 
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
		return this.$store.getters.GetPage2Data
    },
    DataRowPage1(){
        return this.$store.getters.GetPage1Data
    }
  },
    methods: {
        OndatatypeChange (data) {
            this.$nextTick(() => {
                this.M_SS_CustomField.datatype = data.id
                this.M_SS_CustomField.datatypeLabel = data.label
                /*
                D = Description
                N = Numeric
                A = Date
                T = Text
                */

                if(data.id == 'D'){
                    this.PI_defaultdescs.cVisible = true
                    this.PI_defaultnumeric.cVisible = false
                    this.PI_defaultdate.cVisible = false
                } else if(data.id == 'N') {
                    this.PI_defaultdescs.cVisible = false
                    this.PI_defaultnumeric.cVisible = true
                    this.PI_defaultdate.cVisible = false
                } else if(data.id == 'A'){
                    this.PI_defaultdescs.cVisible = false
                    this.PI_defaultnumeric.cVisible = false
                    this.PI_defaultdate.cVisible = true
                } else {
                    this.PI_defaultdescs.cVisible = false
                    this.PI_defaultnumeric.cVisible = false
                    this.PI_defaultdate.cVisible = false
                }
            })            
            this.$forceUpdate()
        },
        OnlookuptableChange (data) {
            this.$nextTick(() => {
                this.M_SS_CustomField.lookuptable = data.id
                this.M_SS_CustomField.lookuptableLabel = data.label
                
                var param = {
                    OptionFunctionCd: 'GetColumns',
                    ModuleCd: this.Module,
                    table_name: data.id
                }

                this.FnDynamicFunction(param)
                .then(response => { 
                    if(response == null) return
                    console.log(response)
                    // response.forEach((dt)=>{
                    //     this.AvailableColumn.push({
                    //         response
                    //     })
                    // })
                    // var data = response.name 
                    // console.log(data)

                    this.AvailableColumn = response.Data.map(x=>x.name)
                    // alert(JSON.stringify(response,null,2))

                })                
                
                // var param = {
                //     OptionFunctionCd: 'GetColumns',
                //     ModuleCd: 'SS',
                //     TableName: data.id
                // }

                // alert(JSON.stringify(param,null,2))
                
                // this.postJSON( this.getUrlById(), param )
                // .then(response => {
                // if(response == null) return
            
                // })

                // this.postEncode(this.getUrlDynamicFunction(), param)
                // .then((response) => {
                //     if(response == null) return
                //     var data = response.Data
                //     alert(JSON.stringify(data,null,2))
                    
                // })
                //{lookuptable}
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
        M_Insert () {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                page_master_seq: this.M_SS_CustomField.pagemasterseq,
                caption: this.M_SS_CustomField.caption,
                data_type: this.M_SS_CustomField.datatype,
                length: this.M_SS_CustomField.length,
                mandatory: this.M_SS_CustomField.mandatory,
                lookup_status: this.M_SS_CustomField.lookupstatus,
                lookup_table: this.M_SS_CustomField.lookuptable,
                lookup_field: this.M_SS_CustomField.lookupfield,
                lookup_condition: this.M_SS_CustomField.lookupcondition,
                default_descs: this.M_SS_CustomField.defaultdescs,
                default_numeric: !this.M_SS_CustomField.defaultnumeric || this.M_SS_CustomField.defaultnumeric == '' ? 'NULL' : this.M_SS_CustomField.defaultnumeric,
                default_date: !this.M_SS_CustomField.defaultdate || this.M_SS_CustomField.defaultdate == '' ? 'NULL' : this.M_SS_CustomField.defaultdate,
                remarks: this.M_SS_CustomField.remarks,
                user_input: this.getDataUser().user_id                 
            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return
                
                this.$parent.resultInsert(response.Message)
            })
        },
        M_Update () {
            // alert(JSON.stringify(this.M_SS_CustomField,null,2))
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                field_sequence_no: this.M_SS_CustomField.fieldsequenceno,
                page_master_seq: this.M_SS_CustomField.pagemasterseq,
                caption: this.M_SS_CustomField.caption,
                data_type: this.M_SS_CustomField.datatype,
                length: this.M_SS_CustomField.length,   
                mandatory: this.M_SS_CustomField.mandatory,
                lookup_status: this.M_SS_CustomField.lookupstatus,
                lookup_table: this.M_SS_CustomField.lookuptable,
                lookup_field: this.M_SS_CustomField.lookupfield,
                lookup_condition: this.M_SS_CustomField.lookupcondition,
                default_descs: this.M_SS_CustomField.defaultdescs,
                default_numeric: !this.M_SS_CustomField.defaultnumeric || this.M_SS_CustomField.defaultnumeric == '' ? 'NULL' : this.M_SS_CustomField.defaultnumeric,
                default_date: !this.M_SS_CustomField.defaultdate || this.M_SS_CustomField.defaultdate == '' ? 'NULL' : this.M_SS_CustomField.defaultdate,
                remarks: this.M_SS_CustomField.remarks,
                user_edit: this.getDataUser().user_id ,
                lastupdatestamp: this.M_SS_CustomField.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                this.$parent.resultUpdate(response.Message)
            })
        },
		M_ClearForm(){
            this.M_SS_CustomField = {
                fieldsequenceno: 0,
                pagemasterseq: 0,
                caption: '',
                datatype: 'D',
                length: '',
                mandatory: 'Y',
                lookupstatus: 'N',
                lookuptable: '',
                lookuptableLabel: '',
                lookupfield: '',
                lookupcondition: '',
                defaultdescs: '',
                defaultnumeric: '',
                defaultdate: '',
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
			let data = this.$store.getters.GetPage1Data
            this.M_SS_CustomField.pagemasterseq = data.page_master_seq 
        },
        M_Edit(){
            //this.$nextTick().then(() => {
            //    document.getElementById("???").focus()
            //})
        },
        M_Delete(dt){
            var data = this.FormToABSList().getRowSelected()
            var dataDelete = []

            data.forEach((value) => {
                dataDelete.push({
                    page_master_seq: this.DataRowPage1.page_master_seq,
                    field_sequence_no:  value.field_sequence_no,
                    lastupdatestamp: value.lastupdatestamp,
                    _Message_:''
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

                this.$parent.resultDelete("Deleting Data Successfully")
            })
        },
        paramFromParent(){
            this.$parent.showForm = false
            let data = this.$store.getters.GetPage1Data
            this.M_SS_CustomField.pagemasterseq = data.page_master_seq 
            this.propList.initialWhere =" page_master_seq = '" + data.page_master_seq + "' "
        
            this.FormToABSList().doGetList('','eb_getList')
        },
		M_Cancel() {},		
		doDoubleClick(){
        },
        rowClicked (record, index) {
        },
        rowLink (url){
        },
        getDataBy (record) {
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                field_sequence_no: record.field_sequence_no,
                page_master_seq: record.page_master_seq				
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
                this.M_SS_CustomField = {
                    fieldsequenceno: data.field_sequence_no,
                    pagemasterseq: data.page_master_seq,
                    caption: data.caption,
                    datatype: data.data_type,
                    length: data.length,
                    mandatory: data.mandatory,
                    lookupstatus: data.lookup_status,
                    lookuptable: data.lookup_table,
                    lookupfield: data.lookup_field,
                    lookupcondition: data.lookup_condition,
                    defaultdescs: data.default_descs,
                    defaultnumeric: data.default_numeric,
                    defaultdate: data.default_date,
                    remarks: data.remarks,
                    userinput: data.user_input,
                    useredit: data.user_edit,
                    timeinput: data.time_input,
                    timeedit: data.time_edit,
                    lastupdatestamp: record.lastupdatestamp,
                    rowid: data.row_id
                }

                this.M_SS_CustomField.lookuptableLabel = this.M_SS_CustomField.lookuptable && this.M_SS_CustomField.lookuptable != '' ? data.lookup_table : ''
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

