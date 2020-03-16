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
                                        <ABSinputTextVuex :prop="PI_optionlookupcd" v-model="M_SS_LookupEntry.optionlookupcd"  ref="ref_optionlookupcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnviewnameChange" :prop="PI_viewname" :value="M_SS_LookupEntry.viewname" :label="M_SS_LookupEntry.viewnameLabel"  ref="ref_viewname"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OncolumndbChange" :prop="PI_columndb" :value="M_SS_LookupEntry.columndb" :label="M_SS_LookupEntry.columndbLabel"  ref="ref_columndb"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnlookuptableChange" :prop="PI_lookuptable" :value="M_SS_LookupEntry.lookuptable" :label="M_SS_LookupEntry.lookuptableLabel"  ref="ref_lookuptable"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnlookupdescsChange" :prop="PI_lookupdescs" :value="M_SS_LookupEntry.lookupdescs" :label="M_SS_LookupEntry.lookupdescsLabel"  ref="ref_lookupdescs"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnlookupdbparamChange" :prop="PI_lookupdbparam" :value="M_SS_LookupEntry.lookupdbparam" :label="M_SS_LookupEntry.lookupdbparamLabel"  ref="ref_lookupdbparam"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_sourcefield" v-model="M_SS_LookupEntry.sourcefield"  ref="ref_sourcefield"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_sourcewhere" v-model="M_SS_LookupEntry.sourcewhere"  ref="ref_sourcewhere"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnmasterurlChange" :prop="PI_masterurl" :value="M_SS_LookupEntry.masterurl" :label="M_SS_LookupEntry.masterurlLabel"  ref="ref_masterurl"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_displaylookup" v-model="M_SS_LookupEntry.displaylookup"  ref="ref_displaylookup"/>
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
		cInsertKey:'id=lookup_cd,label=lookup_cd',
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

            M_SS_LookupEntry :{
                rowno: 0,
                optionlookupcd: '',
                columndb: '',
                viewname: '',
                sourcefield: '',
                sourcewhere: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                sisplaylookup: '',
                islookuplist: '',
                isasyn: '',
                stringquery: '',
                sourcequery: '',
                lookuptable: '',
                lookupdescs: '',
                lookupdbparam: '',
                masterurl: '',
                lastupdatestamp: 0
                    }
            ,
            PI_optionlookupcd: { 
                cValidate :'required', 
                cName: 'optionlookupcd', 
                cLabel: 'Lookup Code', 
                cLabelSize: 4, 
                cOrder: 1, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_viewname: { 
                dataLookUp: { 
                      LookUpCd: 'GetLookupSSAllView', 
                      ColumnDB: 'view_name', 
                      InitialWhere: "", 
                      ParamWhere: ''  
                          }, 
                cValidate :'required', 
                cName: 'viewname', 
                cLabel: 'View Name', 
                cOrder: 2, 
                cLabelSize: 4, 
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
                cDisplayColumn: 'view_name' ,
            },
            PI_columndb: { 
                dataLookUp: { 
                        LookUpCd: 'GetLookupSSAllViewColumn', 
                        ColumnDB: 'view_name', 
                        InitialWhere: "view_name=''", 
                        ParamWhere: ''  
                            }, 
                cValidate :'required', 
                cName: 'columndb', 
                cLabel: 'Column DB', 
                cLabelSize: 4, 
                cOrder: 3, 
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
            PI_lookuptable: { 
                dataLookUp: { 
                        LookUpCd: 'GetLookupSSAllTable', 
                        ColumnDB: 'table_name', 
                        InitialWhere: "", 
                        ParamWhere: ''  
                            }, 
                cValidate :'required', 
                cName: 'lookuptable', 
                cLabel: 'Lookup Table', 
                cLabelSize: 4, 
                cOrder: 4, 
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
            PI_lookupdescs: { 
                dataLookUp: { 
                        LookUpCd: 'GetLookupSSAllColumn', 
                        ColumnDB: 'column_name', 
                        InitialWhere: "table_name=''", 
                        ParamWhere: ''  
                            }, 
                cValidate :'required', 
                cName: 'lookupdescs', 
                cLabel: 'Lookup Description', 
                cLabelSize: 4, 
                cOrder: 5, 
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
            PI_lookupdbparam: { 
                dataLookUp: { 
                        LookUpCd: 'GetLookupSSAllColumn', 
                        ColumnDB: 'column_name', 
                        InitialWhere: "table_name=''", 
                        ParamWhere: ''  
                            }, 
                cValidate :'required', 
                cName: 'lookupdbparam', 
                cLabel: 'Lookup Parameter', 
                cLabelSize: 4, 
                cOrder: 6, 
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
            PI_sourcefield: { 
                cValidate :'required', 
                cName: 'sourcefield', 
                cLabel: 'Source Field', 
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
            PI_sourcewhere: { 
                cValidate :'', 
                cName: 'sourcewhere', 
                cLabel: 'Source Where', 
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
            PI_masterurl:{
              dataLookUp: { 
                        LookUpCd: 'GetSSPageMasterFile', 
                        ColumnDB: 'page_master_seq', 
                        InitialWhere: "", 
                        ParamWhere: ''  
                            }, 
                cValidate :'', 
                cName: 'masterurl', 
                cLabel: 'Master Url', 
                cLabelSize: 4, 
                cOrder: 9, 
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
                cDisplayColumn: 'location_url' ,
            },
            PI_displaylookup: { 
                cValidate :'required', 
                cName: 'displaylookup', 
                cLabel: 'Display Lookup', 
                cLabelSize: 4, 
                cOrder: 10, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
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
    OnviewnameChange(data) {
      // console.log(data);
          this.M_SS_LookupEntry.viewname = data.id
          this.M_SS_LookupEntry.viewnameLabel = data.label
      this.$nextTick(() => {
          if (this.inputStatus != "VIEW") {
              var param = {
                  OptionFunctionCd : "GetSSLookupFilterView",
                  ModuleCd: this.Module,
                  // subportfolio_cd: this.getDataUser().subportfolio_cd,
                  view_name: data.view_name
                  // user_input: this.getDataUser().user_id
              }

              this.FnDynamicFunction(param)
              .then(ress => {
                // console.log(ress)
                var data = ress.Data[0]
                if (data.fss_option_lookup_filter_view == null){
                 this.PI_columndb.dataLookUp.InitialWhere = "view_name='"+this.M_SS_LookupEntry.viewname+"'"
                  // alertWarning
                }
                else{
                  this.alertInfo(data.fss_option_lookup_filter_view)
                  this.M_SS_LookupEntry.viewname = ''
                  this.M_SS_LookupEntry.viewnameLabel = ''
                  
                }
              })
          }
        
      })
      this.$forceUpdate()
    },
    OncolumndbChange(data) {
      // console.log(data);
          this.M_SS_LookupEntry.columndb = data.label
          this.M_SS_LookupEntry.columndbLabel = data.label
      this.$nextTick(() => {
          if (this.inputStatus != "VIEW") {
          }
      })
      this.$forceUpdate()
    },
    OnlookuptableChange(data) {
      // console.log(data);
          this.M_SS_LookupEntry.lookuptable = data.id
          this.M_SS_LookupEntry.lookuptableLabel = data.label
      this.$nextTick(() => {
          if (this.inputStatus != "VIEW") {
            this.PI_lookupdescs.dataLookUp.InitialWhere = "table_name='"+data.table_name+"'"
            this.PI_lookupdbparam.dataLookUp.InitialWhere = "table_name='"+data.table_name+"'"
          }
      })
      this.$forceUpdate()
    },
    OnlookupdescsChange(data) {
      // console.log(data);
          this.M_SS_LookupEntry.lookupdescs = data.label
          this.M_SS_LookupEntry.lookupdescsLabel = data.label
      this.$nextTick(() => {
          if (this.inputStatus != "VIEW") {
          }
      })
      this.$forceUpdate()
    },
    OnlookupdbparamChange(data) {
      // console.log(data);
          this.M_SS_LookupEntry.lookupdbparam = data.label
          this.M_SS_LookupEntry.lookupdbparamLabel = data.label
      this.$nextTick(() => {
          if (this.inputStatus != "VIEW") {
          }
      })
      this.$forceUpdate()
    },
    OnmasterurlChange(data) {
      console.log(data);
          this.M_SS_LookupEntry.masterurl = data.label
          this.M_SS_LookupEntry.masterurlLabel = data.label
      this.$nextTick(() => {
          if (this.inputStatus != "VIEW") {
            var master = ""
            var master2 = ""

            if(data.label != ''){
                master = data.label.split('.')[0].trim()
                // master2 = data.label.split('.')[1].trim()
                this.M_SS_LookupEntry.masterurl = master
                this.M_SS_LookupEntry.masterurlLabel = master
            }
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
      // this.PI_viewname.cVisible = true
		},		
		doDoubleClick(){
        },
        rowClicked (record, index) {
          // this.PI_viewname.cVisible = true
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
                LineNo: this.$parent.data.page_order,
                lookup_cd: this.M_SS_LookupEntry.optionlookupcd,
                view_name: this.M_SS_LookupEntry.viewname,
                column_db: this.M_SS_LookupEntry.columndb,
                lookup_table: this.M_SS_LookupEntry.lookuptable,
                lookup_db_descs: this.M_SS_LookupEntry.lookupdescs,
                lookup_db_parameter: this.M_SS_LookupEntry.lookupdbparam,
                source_field: this.M_SS_LookupEntry.sourcefield,
                source_where: this.M_SS_LookupEntry.sourcewhere,
                master_url: this.M_SS_LookupEntry.masterurl,
                display_lookup: this.M_SS_LookupEntry.displaylookup,
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
                ss_option_lookup_id: this.M_SS_LookupEntry.rowno,
                lookup_cd: this.M_SS_LookupEntry.optionlookupcd,
                view_name: this.M_SS_LookupEntry.viewname,
                column_db: this.M_SS_LookupEntry.columndb,
                lookup_table: this.M_SS_LookupEntry.lookuptable,
                lookup_db_descs: this.M_SS_LookupEntry.lookupdescs,
                lookup_db_parameter: this.M_SS_LookupEntry.lookupdbparam,
                source_field: this.M_SS_LookupEntry.sourcefield,
                source_where: this.M_SS_LookupEntry.sourcewhere,
                master_url: this.M_SS_LookupEntry.masterurl,
                display_lookup: this.M_SS_LookupEntry.displaylookup,
                user_edit: this.getDataUser().user_id,
                lastupdatestamp: this.M_SS_LookupEntry.lastupdatestamp
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_SS_LookupEntry = {
                rowno: 0,
                optionlookupcd: '',
                columndB: '',
                viewname: '',
                sourcefield: '',
                sourcewhere: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                sisplaylookup: '',
                islookuplist: '',
                isasyn: '',
                stringquery: '',
                sourcequery: '',
                lookuptable: '',
                lookupdescs: '',
                lookupdbparam: '',
                masterurl: '',
                lastupdatestamp: 0
            }
		},
        M_New(){
          // this.PI_viewname.cVisible = false
        },
        M_Edit(){
          let data = this.$store.getters.GetPage1Data
          // console.log(data)
          this.M_SS_LookupEntry.rowno = data.ss_option_lookup_id
        },
        M_Delete(dt){       
            var data = this.FormToABSList().getRowSelected()  
            var dataDelete = []

        
            data.forEach((value) => {
                // console.log(value
                dataDelete.push({
                ss_option_lookup_id: value.ss_option_lookup_id,
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
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,                
                option_lookup_id: record.ss_option_lookup_id
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                // console.log(data)
this.M_SS_LookupEntry = {
                  rowno: data.ss_option_lookup_id,
                  optionlookupcd: data.option_lookup_cd,
                  viewname: data.view_name,
                  columndb: data.column_db,
                  lookuptable: data.lookup_table,
                  lookupdescs: data.lookup_db_descs,
                  lookupdbparam: data.lookup_db_parameter,
                  sourcefield: data.source_field,
                  sourcewhere: data.source_where,
                  displaylookup: data.display_lookup,
                  masterurl: data.master_url,
                  islookuplist: data.is_lookup_list,
                  isasyn: data.is_asyn,
                  stringquery: data.string_query,
                  userinput: data.user_input,
                  useredit: data.user_edit,
                  timeinput: data.time_input,
                  timeedit: data.time_edit,
                  lastupdatestamp: data.lastupdatestamp
                    }
                 

                this.M_SS_LookupEntry.viewnameLabel = this.M_SS_LookupEntry.viewname != null ? data.view_name : ''
                this.M_SS_LookupEntry.columndbLabel = this.M_SS_LookupEntry.columndb != null ? data.column_db : ''
                this.M_SS_LookupEntry.lookuptableLabel = this.M_SS_LookupEntry.lookuptable != null ? data.lookup_table : ''
                this.M_SS_LookupEntry.lookupdescsLabel = this.M_SS_LookupEntry.lookupdescs != null ? data.lookup_db_descs : ''
                this.M_SS_LookupEntry.lookupdbparamLabel = this.M_SS_LookupEntry.lookupdbparam != null ? data.lookup_db_parameter : ''
                this.M_SS_LookupEntry.masterurlLabel = this.M_SS_LookupEntry.masterurl != null ? data.master_url : ''

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

