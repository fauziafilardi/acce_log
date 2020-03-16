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
                                        <ABSinputTextVuex :prop="PI_paramname" v-model="M_SS_ReportField.paramname"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_rowno" v-model="M_SS_ReportField.rowno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_position" v-model="M_SS_ReportField.position"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_lookupcd" v-model="M_SS_ReportField.lookupcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_lookupdb" v-model="M_SS_ReportField.lookupdb"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_lookupinitialwhere" v-model="M_SS_ReportField.lookupinitialwhere"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_label" v-model="M_SS_ReportField.label"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_maxlength" v-model="M_SS_ReportField.maxlength"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex :prop="PI_isrequired" v-model="M_SS_ReportField.isrequired" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_taborder" v-model="M_SS_ReportField.taborder"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex :prop="PI_isvisible" v-model="M_SS_ReportField.isvisible" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_displaycolumn" v-model="M_SS_ReportField.displaycolumn"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_setvalue" v-model="M_SS_ReportField.setvalue"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">                                        
                                        <ABSInputSelect2 @change="OncolumntypeChange" :prop="PI_columntype" :value="M_SS_ReportField.columntype" :label="M_SS_ReportField.columntypeLabel" ref="ref_columntype"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_defaultvalue" v-model="M_SS_ReportField.defaultvalue"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_onchangetriggerfield" v-model="M_SS_ReportField.onchangetriggerfield"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_setcolumnvalue" v-model="M_SS_ReportField.setcolumnvalue"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_onchangetriggerinitialwhere" v-model="M_SS_ReportField.onchangetriggerinitialwhere"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_setcolumnwhere" v-model="M_SS_ReportField.setcolumnwhere"/>
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
			ValKey:null,
            FormType: "List",
			Module:"SS",
            propList: {
                initialWhere:"",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_SS_ReportField :{
                columntype: '',
                defaultvalue: '',
                displaycolumn: '',
                iscolumn: 0,
                isrequired: 0,
                isvisible: 1,
                label: '',
                lookupcd: '',
                lookupdb: '',
                lookupinitialwhere: '',
                maxlength: '',
                onchangetriggerfield: '',
                onchangetriggerinitialwhere: '',
                optionseq: '',
                paramname: '',
                pathreport: '',
                position: '',
                reportname: '',
                rowno: '',
                setcolumnvalue: '',
                setcolumnwhere: '',
                setvalue: '',
                ss_optionrptparameter_id: '',
                taborder: '',
                timeedit: '',
                timeinput: '',
                useredit: '',
                userinput: ''
                }            
            ,
            PI_paramname: { 
                cValidate :'', 
                cName:'paramname', 
                cLabel:'Param Name', 
                cOrder:10, 
                cKey:false, 
                cVisible:true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_rowno: { 
                cValidate :'', 
                cName:'rowno', 
                cLabel:'Row No.', 
                cOrder:11, 
                cKey:false, 
                cType: 'numeric',
                cVisible:true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_position: { 
                cValidate :'', 
                cName:'position', 
                cLabel:'Position', 
                cOrder:12, 
                cKey:false, 
                cType: 'numeric',
                cVisible:true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_lookupcd: { 
                cValidate :'', 
                cName:'lookupcd', 
                cLabel:'Lookup Code', 
                cOrder:13, 
                cKey:false, 
                cVisible:true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_lookupdb: { 
                cValidate :'', 
                cName:'lookupdb', 
                cLabel:'Lookup DB', 
                cOrder:14, 
                cKey:false, 
                cVisible:true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_lookupinitialwhere: { 
                cValidate :'', 
                cName:'lookupinitialwhere', 
                cLabel:'Lookup Initial Where', 
                cOrder:15, 
                cKey:false, 
                cVisible:true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_label: { 
                cValidate :'', 
                cName:'label', 
                cLabel:'Label', 
                cOrder:16, 
                cKey:false, 
                cVisible:true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_maxlength: { 
                cValidate :'', 
                cName:'maxlength', 
                cLabel:'Max Length', 
                cOrder:17, 
                cKey:false, 
                cType:'numeric',
                cVisible:true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
            },
            PI_isrequired: { 
                cValidate :'', 
                cName:'isrequired', 
                cId:'rdbisrequired', 
                cRadioOptions: [{ text: 'Yes', value: '1' },{ text: 'No', value: '0' },], 
                cLabel:'Is Required', 
                cOrder:18, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_taborder: { 
                cValidate :'', 
                cName:'taborder', 
                cLabel:'Tab Order', 
                cOrder:19, 
                cKey:false, 
                cType:'numeric',
                cVisible:true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
            },
            PI_isvisible: { 
                cValidate :'', 
                cName:'isvisible', 
                cId:'rdbisvisible', 
                cRadioOptions: [{ text: 'Yes', value: '1' },{ text: 'No', value: '0' },], 
                cLabel:'Is Visible', 
                cOrder:20, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_displaycolumn: { 
                cValidate :'', 
                cName:'displaycolumn', 
                cLabel:'Display Column', 
                cOrder:21, 
                cKey:false, 
                cVisible:true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
            },
            PI_setvalue: { 
                cValidate :'', 
                cName:'setvalue', 
                cLabel:'Set Value', 
                cOrder:22, 
                cKey:false, 
                cVisible:true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
            },
            PI_columntype: { 
                dataLookUp: null, 
                cValidate :'', 
                cName:'columntype', 
                cLabel:'Column Type', 
                cKey:false, 
                cOrder:23, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cStatic: true,
                cOption: [{ label: 'String', id: 'String' },{ label: 'DateTime', id: 'DateTime' },{ label: 'DateRange', id: 'DateRange' },{ label: 'DropDown', id: 'DropDown' },{ label: 'LookUp', id: 'LookUp' }]
            },
            PI_defaultvalue: { 
                cValidate :'', 
                cName:'defaultvalue', 
                cLabel:'Default Value', 
                cOrder:24, 
                cKey:false, 
                cVisible:true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
            },
            PI_onchangetriggerfield: { 
                cValidate :'', 
                cName:'onchangetriggerfield', 
                cLabel:'Trigger Field', 
                cOrder:25, 
                cKey:false, 
                cVisible:true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
            },
            PI_setcolumnvalue: { 
                cValidate :'', 
                cName:'setcolumnvalue', 
                cLabel:'Set Column Value', 
                cOrder:26, 
                cKey:false, 
                cVisible:true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
            },
            PI_onchangetriggerinitialwhere: { 
                cValidate :'', 
                cName:'onchangetriggerinitialwhere', 
                cLabel:'Trigger Initial Where', 
                cOrder:27, 
                cKey:false, 
                cVisible:true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
            },
            PI_setcolumnwhere: { 
                cValidate :'', 
                cName:'setcolumnwhere', 
                cLabel:'Set Column Where', 
                cOrder:28, 
                cKey:false, 
                cVisible:true, 
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
		return this.$store.getters.GetPage2Data
    },
    DataRowPage1(){
        return this.$store.getters.GetPage1Data
    }
  },
    methods: {
        OncolumntypeChange (data) {
            this.$nextTick(() => {
                this.M_SS_ReportField.columntype = data.id
                this.M_SS_ReportField.columntypeLabel = data.label
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
                OptionSeqV2: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                OptionSeq: this.getOptionSeq().OptionSeq,                
                PathReport:'',
                ReportName:'',
                ParamName: this.M_SS_ReportField.paramname,
                Label: this.M_SS_ReportField.label,
                ColumnType: this.M_SS_ReportField.columntype,
                DefaultValue: this.M_SS_ReportField.defaultvalue,
                setValue: this.M_SS_ReportField.setvalue,
                isRequired: this.M_SS_ReportField.isrequired,
                isVisible: this.M_SS_ReportField.isvisible,
                isColumn: '',
                TabOrder: this.M_SS_ReportField.taborder,
                MaxLength: this.M_SS_ReportField.maxlength,
                RowNo: this.M_SS_ReportField.rowno,
                position: this.M_SS_ReportField.position,
                LookUpCd: this.M_SS_ReportField.lookupcd,
                LookUpDB: this.M_SS_ReportField.lookupdb,
                LookUpInitialWhere: this.M_SS_ReportField.lookupinitialwhere,
                SetColumnValue: this.M_SS_ReportField.setcolumnvalue,
                SetColumnWhere: this.M_SS_ReportField.setcolumnwhere,
                OnChangeTriggerField: this.M_SS_ReportField.onchangetriggerfield,
                OnChangeTriggerInitialWhere: this.M_SS_ReportField.onchangetriggerinitialwhere,
                UserInput: this.getDataUser().user_id,                
                DisplayColumn: this.M_SS_ReportField.displaycolumn,
            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return
                
                this.$parent.resultInsert(response.Message)
            })
        },
        M_Update () {
            // alert(JSON.stringify(this.M_SS_ReportField,null,2))
            var param = {			
                OptionSeqV2: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                // OptionSeq: this.getOptionSeq().OptionSeq,                
                PathReport:'',
                ReportName:'',
                ParamName: this.M_SS_ReportField.paramname,
                Label: this.M_SS_ReportField.label,
                ColumnType: this.M_SS_ReportField.columntype,
                DefaultValue: this.M_SS_ReportField.defaultvalue,
                setValue: this.M_SS_ReportField.setvalue,
                isRequired: this.M_SS_ReportField.isrequired,
                isVisible: this.M_SS_ReportField.isvisible,
                isColumn: '',
                TabOrder: this.M_SS_ReportField.taborder,
                MaxLength: this.M_SS_ReportField.maxlength,
                RowNo: this.M_SS_ReportField.rowno,
                position: this.M_SS_ReportField.position,
                LookUpCd: this.M_SS_ReportField.lookupcd,
                LookUpDB: this.M_SS_ReportField.lookupdb,
                LookUpInitialWhere: this.M_SS_ReportField.lookupinitialwhere,
                SetColumnValue: this.M_SS_ReportField.setcolumnvalue,
                SetColumnWhere: this.M_SS_ReportField.setcolumnwhere,
                OnChangeTriggerField: this.M_SS_ReportField.onchangetriggerfield,
                OnChangeTriggerInitialWhere: this.M_SS_ReportField.onchangetriggerinitialwhere,
                UserInput: this.getDataUser().user_id,                
                DisplayColumn: this.M_SS_ReportField.displaycolumn,
                SS_OptionRptParameter_ID: this.M_SS_ReportField.ss_optionrptparameter_id
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                this.$parent.resultUpdate(response.Message)
            })
        },
		M_ClearForm(){
            this.M_SS_ReportField = {
               columntype: '',
                defaultvalue: '',
                displaycolumn: '',
                iscolumn: 0,
                isrequired: 0,
                isvisible: 1,
                label: '',
                lookupcd: '',
                lookupdb: '',
                lookupinitialwhere: '',
                maxlength: '',
                onchangetriggerfield: '',
                onchangetriggerinitialwhere: '',
                optionseq: '',
                paramname: '',
                pathreport: '',
                position: '',
                reportname: '',
                rowno: '',
                setcolumnvalue: '',
                setcolumnwhere: '',
                setvalue: '',
                ss_optionrptparameter_id: '',
                taborder: '',
                timeedit: '',
                timeinput: '',
                useredit: '',
                userinput: ''
                    }
            		
		},
        M_New(){
			let data = this.$store.getters.GetPage1Data
            // this.M_SS_ReportField.pagemasterseq = data.PageMasterSeq 
        },
        M_Edit(){            
        },
        M_Delete(dt){
            var data = this.FormToABSList().getRowSelected()
            var dataDelete = []

            data.forEach((value) => {
                dataDelete.push({
                    SS_OptionRptParameter_ID:  value.SS_OptionRptParameter_ID,
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

                this.$parent.resultDelete()
            })
        },
        paramFromParent(){
            this.$parent.showForm = false
            let data = this.$store.getters.GetPage1Data
            console.log(data)
            if(data.LocationUrl.includes('TemplatePages')){
              console.log('a')
              this.FormType = "List"
              this.$store.commit('setFormType','List')
              this.getToolbar().ProcessPS()
            }else{
              console.log('b')
              this.FormType = "View"
              this.$store.commit('setFormType','View')
              this.getToolbar().ProcessPS()
            }
            // this.M_SS_ReportField.pagemasterseq = data.PageMasterSeq 
            // this.propList.initialWhere =" PageMasterSeq = '" + data.PageMasterSeq + "' "
        
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
                OptionSeqV2: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SS_OptionRptParameter_ID: record.SS_OptionRptParameter_ID,                
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
                console.log(data)
                this.M_SS_ReportField = {
                    columntype: data.columntype,
                    defaultvalue: data.defaultvalue,
                    displaycolumn: data.displaycolumn,
                    iscolumn: data.iscolumn,
                    isrequired: data.isrequired,
                    isvisible: data.isvisible,
                    label: data.label,
                    lookupcd: data.lookupcd,
                    lookupdb: data.lookupdb,
                    lookupinitialwhere: data.lookupinitialwhere,
                    maxlength: data.maxlength,
                    onchangetriggerfield: data.onchangetriggerfield,
                    onchangetriggerinitialwhere: data.onchangetriggerinitialwhere,
                    optionseq: data.optionseq,
                    paramname: data.paramname,
                    pathreport: data.pathreport,
                    position: data.position,
                    reportname: data.reportname,
                    rowno: data.rowno,
                    setcolumnvalue: data.setcolumnvalue,
                    setcolumnwhere: data.setcolumnwhere,
                    setvalue: data.setvalue,
                    ss_optionrptparameter_id: data.ss_optionrptparameter_id,
                    taborder: data.taborder,
                    timeedit: data.timeedit,
                    timeinput: data.timeinput,
                    useredit: data.useredit,
                    userinput: data.user_input
                }
                this.IEBy.Input = data.user_input
                this.IEBy.Edit = data.useredit

                if(data.isrequired == 'True'){
                    this.M_SS_ReportField.isrequired = '1'
                }else{
                    this.M_SS_ReportField.isrequired = '0'
                }

                if(data.isvisible == 'True'){
                    this.M_SS_ReportField.isvisible = '1'
                }else{
                    this.M_SS_ReportField.isvisible = '0'
                }

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

