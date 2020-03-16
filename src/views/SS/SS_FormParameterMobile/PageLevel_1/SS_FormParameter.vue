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
                                        <ABSInputSelectList @change="OnmoduleseqChange" :prop="PI_moduleseq" :value="M_SS_FormParameter.moduleseq" :label="M_SS_FormParameter.moduleseqLabel"  ref="ref_moduleseq"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OneventseqChange" :prop="PI_eventseq" :value="M_SS_FormParameter.eventseq" :label="M_SS_FormParameter.eventseqLabel"  ref="ref_eventseq"/>
                                      </b-col>
                                      <b-col v-show="inputStatus=='VIEW'" md="1">
                                        <b-button style="font-size: 10px;padding-top: 3px;padding-bottom: 3px;" @click="doDownload"><font-awesome-icon icon="list" class="icon-style-1"/> Download Script</b-button>
                                      </b-col> 
                                    </b-row>
                                     <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_url" v-model="M_SS_FormParameter.url" ref="ref_url"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex @input="OnfilenameChange" :prop="PI_filename" v-model="M_SS_FormParameter.filename" ref="ref_filename"/>
                                      </b-col>
                                    </b-row>
                                     <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_optionurl" v-model="M_SS_FormParameter.optionurl" ref="ref_optionurl"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnformtypeChange" :prop="PI_formtype" v-model="M_SS_FormParameter.formtype"  ref="ref_formtype"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_title" v-model="M_SS_FormParameter.title"  ref="ref_title"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex @input="OnlinenoChange" :prop="PI_lineno" v-model="M_SS_FormParameter.lineno"  ref="ref_lineno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex @input="OnlevelChange" :prop="PI_level" v-model="M_SS_FormParameter.level"  ref="ref_level"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnparentseqnoChange" :prop="PI_parentseqno" :value="M_SS_FormParameter.parentseqno"  :label="M_SS_FormParameter.parentseqnoLabel"  ref="ref_parentseqno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OntablenameChange" :prop="PI_tablename" :value="M_SS_FormParameter.tablename" :label="M_SS_FormParameter.tablenameLabel"  ref="ref_tablename"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnrelationparamChange" :prop="PI_relationparam" :value="M_SS_FormParameter.relationparam" :label="M_SS_FormParameter.relationparamLabel"  ref="ref_relationparam"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_viewgetlist" v-model="M_SS_FormParameter.viewgetlist"  ref="ref_viewgetlist"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_sp_i" v-model="M_SS_FormParameter.sp_i"  ref="ref_sp_i"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_sp_u" v-model="M_SS_FormParameter.sp_u"  ref="ref_sp_u"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_sp_d" v-model="M_SS_FormParameter.sp_d"  ref="ref_sp_d"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_sp_s" v-model="M_SS_FormParameter.sp_s"  ref="ref_sp_s"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_sp_process" v-model="M_SS_FormParameter.sp_process"  ref="ref_sp_process"/>
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
    props: {PageLevel: '', TabIndex: '', data: ''},
    data() {
        return {
		cInsertKey:'',
		FormType: "List",
		Module:"SS",
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
            urlFileScript : '',

            M_SS_FormParameter :{
                headerid: 0,
                url: '',
                title: '',
                lineno: '',
                level: '',
                sp_i: '',
                sp_u: '',
                sp_s: '',
                sp_d: '',
                sp_process: '',
                tablename: '',
                formtype: 'List',
                moduleseq: '',
                moduledescs: '',
                eventseq: '',
                eventdescs: '',
                optionseq: '',
                optionurl: '',
                relationparam: '',
                pagemasterseq: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                filename: '',
                viewgetlist: '',
                parentseqno: 0,
                relationtype: ''
                    }

            ,
            
            PI_moduleseq: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupSSModuleAccess', 
                    ColumnDB: 'ModuleSeq', 
                    InitialWhere: "", 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
                cName: 'moduleseq', 
                cLabel: 'Module', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 1,  
                cTriggered: false, 
                cDefault: '', 
                cProtect: false, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cStatic: false, 
                cOption: [], 
                cMasterUrl: '' ,
                cDisplayColumn: 'short_name,menu_name' ,
            }, 

            PI_eventseq: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupSSEventAccess', 
                    ColumnDB: 'EventSeq', 
                    InitialWhere: "module_seq=''", 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
                cName: 'eventseq', 
                cLabel: 'Event', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 2,  
                cTriggered: false, 
                cDefault: '', 
                cProtect: false, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cStatic: false, 
                cOption: [], 
                cMasterUrl: '' ,
                cDisplayColumn: 'text_menu' ,
            }, 

            PI_url: { 
                cValidate :'required|max:255', 
                cName: 'url', 
                cLabel: 'Url', 
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

            PI_filename: { 
                cValidate :'required|max:255', 
                cName: 'filename', 
                cLabel: 'File Name', 
                cLabelSize: 4, 
                cOrder: 4, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_optionurl: { 
                cValidate :'required|max:255', 
                cName: 'optionurl', 
                cLabel: 'Option Url', 
                cLabelSize: 4, 
                cOrder: 5, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            
            PI_formtype: { 
                cValidate :'required', 
                cName: 'formtype', 
                cLabel: 'Form Type', 
                cId: 'rdbformtype', 
                cRadioOptions: [{ text: 'List', value: 'List' }, { text: 'Form', value: 'Form' }], 
                cLabelSize: 4, 
                cOrder: 6, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_title: { 
                cValidate :'required|max:60', 
                cName: 'title', 
                cLabel: 'Title', 
                cLabelSize: 4, 
                cOrder: 7, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_lineno: { 
                cValidate :'required', 
                cName: 'lineno', 
                cLabel: 'Line No', 
                cLabelSize: 4, 
                cOrder: 8, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_level: { 
                cValidate :'required', 
                cName: 'level', 
                cLabel: 'Level', 
                cLabelSize: 4, 
                cOrder: 9, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_parentseqno: {
              dataLookUp: { 
                    LookUpCd: 'GetLookupSSParentSeqNo', 
                    ColumnDB: 'page_master_seq', 
                    InitialWhere: "", 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'parentseqno', 
                cLabel: 'Parent Seq No', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 10,  
                cTriggered: false, 
                cDefault: '', 
                cProtect: true, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cStatic: false, 
                cOption: [], 
                cMasterUrl: '' ,
                cDisplayColumn: 'page_master_seq,query_sequence_no' ,
            },

            PI_tablename: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupSSAllTable', 
                    ColumnDB: 'table_name', 
                    InitialWhere: "", 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'tablename', 
                cLabel: 'Table Name', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 11,  
                cTriggered: false, 
                cDefault: '', 
                cProtect: false, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cStatic: false, 
                cOption: [], 
                cMasterUrl: '' ,
                cDisplayColumn: 'table_name' ,
            }, 

            PI_relationparam: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupSSAllColumn', 
                    ColumnDB: 'column_name', 
                    InitialWhere: "", 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'relationparam', 
                cLabel: 'Relation Parameter', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 12,  
                cTriggered: false, 
                cDefault: '', 
                cProtect: false, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cStatic: false, 
                cOption: [], 
                cMasterUrl: '' ,
                cDisplayColumn: 'column_name' ,
            }, 

            PI_viewgetlist: { 
                cValidate :'', 
                cName: 'viewgetlist', 
                cLabel: 'View Name', 
                cLabelSize: 4, 
                cOrder: 13, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 


            PI_sp_i: { 
                cValidate :'', 
                cName: 'sp_i', 
                cLabel: 'SP Insert', 
                cLabelSize: 4, 
                cOrder: 14, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_sp_u: { 
                cValidate :'', 
                cName: 'sp_u', 
                cLabel: 'SP Update', 
                cLabelSize: 4, 
                cOrder: 15, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_sp_d: { 
                cValidate :'', 
                cName: 'sp_d', 
                cLabel: 'SP Delete', 
                cLabelSize: 4, 
                cOrder: 16, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_sp_s: { 
                cValidate :'', 
                cName: 'sp_s', 
                cLabel: 'SP GetById', 
                cLabelSize: 4, 
                cOrder: 17, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
    
            PI_sp_process: { 
              cValidate :'', 
                cName: 'sp_process', 
                cLabel: 'SP Process', 
                cLabelSize: 4, 
                cOrder: 18, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
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
           this.getToolbar().statusFunction[2].disabled = true
        },
        OnmoduleseqChange (data) {
            // console.log(data)
            this.M_SS_FormParameter.moduleseq = data.id
            this.M_SS_FormParameter.moduleseqLabel = data.label
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
                this.PI_eventseq.dataLookUp.InitialWhere = "module_seq='"+data.module_seq+"'"
            }
        })
        this.$forceUpdate()
        },
        OneventseqChange (data){
            // console.log(data);
            this.M_SS_FormParameter.eventseq = data.id
            this.M_SS_FormParameter.eventseqLabel = data.label
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
            }
        })
        this.$forceUpdate()
        },
        OnfilenameChange (data) {
            // console.log(data);
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              if(data != ''){
                  this.M_SS_FormParameter.optionurl = data
              }
            }
        })
        this.$forceUpdate()
        },
        OnformtypeChange (data){
            // console.log(data);
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
                if(data == 'List'){
                  this.PI_viewgetlist.cValidate = 'required'
                  this.PI_relationparam.cValidate = ''

                  this.$refs.ref_viewgetlist.isRequired = true
                  this.$refs.ref_relationparam.isRequired = false
                }
                else{
                  this.PI_viewgetlist.cValidate = ''
                  this.PI_relationparam.cValidate = 'required'

                  this.$refs.ref_viewgetlist.isRequired = false
                  this.$refs.ref_relationparam.isRequired = true
                }
            }
        })
        this.$forceUpdate()
        },
        OnlinenoChange (data) {
            // console.log(data);
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              if(this.M_SS_FormParameter.lineno == 0){
                  this.PI_level.cValidate = 'min_value:1|max_value:1'
                  this.PI_parentseqno.cProtect = true
                  this.PI_parentseqno.cValidate = ''
                  this.$refs.ref_parentseqno.isRequired = false
              }
              else if(this.M_SS_FormParameter.lineno >= 1){
                  this.PI_level.cValidate = 'min_value:2'
                  this.PI_parentseqno.cProtect = false
                  this.PI_parentseqno.cValidate = 'required'
                  this.$refs.ref_parentseqno.isRequired = true
              }
            }
        })
        this.$forceUpdate()
        },
        OnlevelChange (data) {
            // console.log(data);
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              if(this.M_SS_FormParameter.level > 1){
                  this.PI_relationparam.cValidate = 'required'
                  this.$refs.ref_relationparam.isRequired = true
              }
              else if(this.M_SS_FormParameter.level == 1){
                  this.PI_relationparam.cValidate = ''
                  this.$refs.ref_relationparam.isRequired = false
              }
            }
        })
        this.$forceUpdate()
        },
        OnparentseqnoChange (data){
            this.M_SS_FormParameter.parentseqno = data.query_sequence_no
            this.M_SS_FormParameter.parentseqnoLabel = data.label
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
            }
        })
        this.$forceUpdate()
        },
        OntablenameChange (data){
            this.M_SS_FormParameter.tablename = data.id
            this.M_SS_FormParameter.tablenameLabel = data.label
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
                this.PI_relationparam.dataLookUp.InitialWhere = "table_name='"+data.table_name+"'"
                this.M_SS_FormParameter.viewgetlist = 'v'+data.table_name
                this.M_SS_FormParameter.sp_i = 'f'+data.table_name+'_i'
                this.M_SS_FormParameter.sp_u = 'f'+data.table_name+'_u'
                this.M_SS_FormParameter.sp_d = 'f'+data.table_name+'_d'
                this.M_SS_FormParameter.sp_s = 'f'+data.table_name+'_s'
            }
        })
        this.$forceUpdate()
        },
        OnrelationparamChange (data){
          // console.log(data);
            this.M_SS_FormParameter.relationparam = data.column_name
            this.M_SS_FormParameter.relationparamLabel = data.label
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              this.M_SS_FormParameter.relationtype = data.data_type
            }
        })
        this.$forceUpdate()
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
        M_Post(dt){
        },
        M_Insert() {
            var param = {	
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNoV2: this.$parent.data.page_order,		
                url: this.M_SS_FormParameter.url,
                title: this.M_SS_FormParameter.title,
                line_no: this.M_SS_FormParameter.lineno,
                level: this.M_SS_FormParameter.level,
                sp_i: this.M_SS_FormParameter.sp_i,
                sp_u: this.M_SS_FormParameter.sp_u,
                sp_s: this.M_SS_FormParameter.sp_s,
                sp_d: this.M_SS_FormParameter.sp_d,
                sp_process: this.M_SS_FormParameter.sp_process,
                table_name: this.M_SS_FormParameter.tablename,
                form_type: this.M_SS_FormParameter.formtype,
                module_seq: this.M_SS_FormParameter.moduleseq,
                event_seq: this.M_SS_FormParameter.eventseq,
                option_seq: 0,
                option_url: this.M_SS_FormParameter.optionurl,
                relation_param: this.M_SS_FormParameter.relationparam,
                page_master_seq: 0,
                user_input: this.getDataUser().user_id,
                file_name: this.M_SS_FormParameter.filename,
                view_name: this.M_SS_FormParameter.viewgetlist,
                parent_seq_no: this.M_SS_FormParameter.parentseqno == '' || this.M_SS_FormParameter.parentseqno == null ? 0 : this.M_SS_FormParameter.parentseqno,
                relation_type: this.M_SS_FormParameter.relationtype
            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return

				//kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultInsert(response.Message)
					
				
            })
        },
        M_Update() {
          // console.log(this.M_SS_FormParameter);
            var param = {	
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNoV2: this.$parent.data.page_order,	
                header_id: this.M_SS_FormParameter.headerid,			
                url: this.M_SS_FormParameter.url,
                title: this.M_SS_FormParameter.title,
                line_no: this.M_SS_FormParameter.lineno,
                level: this.M_SS_FormParameter.level,
                sp_i: this.M_SS_FormParameter.sp_i,
                sp_u: this.M_SS_FormParameter.sp_u,
                sp_s: this.M_SS_FormParameter.sp_s,
                sp_d: this.M_SS_FormParameter.sp_d,
                sp_process: this.M_SS_FormParameter.sp_process,
                table_name: this.M_SS_FormParameter.tablename,
                form_type: this.M_SS_FormParameter.formtype,
                module_seq: this.M_SS_FormParameter.moduleseq,
                event_seq: this.M_SS_FormParameter.eventseq,
                option_seq: this.M_SS_FormParameter.optionseq,
                option_url: this.M_SS_FormParameter.optionurl,
                relation_param: this.M_SS_FormParameter.relationparam,
                page_master_seq: this.M_SS_FormParameter.pagemasterseq,
                user_edit: this.getDataUser().user_id,
                file_name: this.M_SS_FormParameter.filename,
                view_name: this.M_SS_FormParameter.viewgetlist,
                parent_seq_no: this.M_SS_FormParameter.parentseqno == '' || this.M_SS_FormParameter.parentseqno == null ? 0 : this.M_SS_FormParameter.parentseqno,
                relation_type: this.M_SS_FormParameter.relationtype
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_SS_FormParameter = {
                headerid: 0,
                url: '',
                title: '',
                lineno: '',
                level: '',
                sp_i: '',
                sp_u: '',
                sp_s: '',
                sp_d: '',
                sp_process: '',
                tablename: '',
                formtype: 'List',
                moduleseq: '',
                moduledescs: '',
                eventseq: '',
                eventdescs: '',
                optionseq: '',
                optionurl: '',
                relationparam: '',
                pagemasterseq: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                filename: '',
                viewgetlist: '',
                parentseqno: 0,
                relationtype: ''
                    }
            		
		},
        M_New(){
			   this.$refs.ref_moduleseq.focus()
        },
        M_Edit(){
            this.$refs.ref_moduleseq.focus()

            this.PI_eventseq.dataLookUp.InitialWhere = "module_seq='"+this.M_SS_FormParameter.moduleseq+"'"
            this.PI_relationparam.dataLookUp.InitialWhere = "table_name='"+this.M_SS_FormParameter.tablename+"'"
        },
        M_Delete(dt){       
            var data = this.FormToABSList().getRowSelected()  
            var dataDelete = []

        
            data.forEach((value) => {
                // console.log(value)
                dataDelete.push({
                header_id: value.header_id,
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
        getDataBy (record) {
            // console.log(record)
            this.urlFileScript = this.getFileScript(record.header_id)
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order
,               header_id: record.header_id
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                // console.log(data)
this.M_SS_FormParameter = {
                headerid: record.header_id,
                url: data.url,
                title: data.title,
                lineno: data.line_no,
                level: data.level,
                sp_i: data.sp_i,
                sp_u: data.sp_u,
                sp_s: data.sp_s,
                sp_d: data.sp_d,
                sp_process: data.sp_process,
                tablename: data.table_name,
                formtype: data.form_type,
                moduleseq: data.module_seq,
                moduledescs: data.module_descs,
                eventseq: data.event_seq,
                eventdescs: data.event_descs,
                optionseq: data.option_seq,
                optionurl: data.option_url,
                relationparam: data.relation_param,
                pagemasterseq: data.page_master_seq,
                userinput: data.user_input,
                useredit: data.user_edit,
                timeinput: data.time_input,
                timeedit: data.time_edit,
                filename: data.file_name,
                viewgetlist: data.view_name,
                parentseqno: data.parent_seq_no,
                relationtype: data.relation_type

                    }

                if(data.line_no == 0){
                    this.PI_level.cValidate = 'min_value:1|max_value:1'
                    this.PI_parentseqno.cProtect = true
                    this.PI_parentseqno.cValidate = ''
                    this.$refs.ref_parentseqno.isRequired = false
                }
                else if(data.line_no >= 1){
                    this.PI_level.cValidate = 'min_value:2'
                    this.PI_parentseqno.cProtect = false
                    this.PI_parentseqno.cValidate = 'required'
                    this.$refs.ref_parentseqno.isRequired = true
                }

                if(data.form_type == 'List'){
                  this.PI_viewgetlist.cValidate = 'required'
                  this.$refs.ref_viewgetlist.isRequired = true
                }
                else{
                  this.PI_viewgetlist.cValidate = ''
                  this.$refs.ref_viewgetlist.isRequired = false
                }

                if(data.form_type == 'List'){
                  this.PI_viewgetlist.cValidate = 'required'
                  this.PI_relationparam.cValidate = ''

                  this.$refs.ref_viewgetlist.isRequired = true
                  this.$refs.ref_relationparam.isRequired = false
                }
                else{
                  this.PI_viewgetlist.cValidate = ''
                  this.PI_relationparam.cValidate = 'required'

                  this.$refs.ref_viewgetlist.isRequired = false
                  this.$refs.ref_relationparam.isRequired = true
                }

                if(data.level > 1){
                  this.PI_relationparam.cValidate = 'required'
                  this.$refs.ref_relationparam.isRequired = true
                }
                else if(data.level == 1){
                    this.PI_relationparam.cValidate = ''
                    this.$refs.ref_relationparam.isRequired = false
                }
    
                this.M_SS_FormParameter.moduleseqLabel = this.M_SS_FormParameter.moduleseq != null ? data.module_descs + this.separator + data.module_cd : ''
                this.M_SS_FormParameter.eventseqLabel = this.M_SS_FormParameter.eventseq != null ? data.event_descs : ''
                this.M_SS_FormParameter.tablenameLabel = this.M_SS_FormParameter.tablename != null ? data.table_name : ''
                this.M_SS_FormParameter.relationparamLabel = this.M_SS_FormParameter.relationparam != null ? data.relation_param : ''
                this.M_SS_FormParameter.parentseqnoLabel = this.M_SS_FormParameter.parentseqno != null ? data.parent_seq_no : ''


                this.IEBy.Input = data.user_input
                this.IEBy.Edit = data.user_edit

            })
        },
        doDownload() {
          window.open(this.urlFileScript, "_blank")
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

