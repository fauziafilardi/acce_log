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
                                        <ABSinputTextVuex :prop="PI_textmenu" v-model="M_SS_PageMasterFile.textmenu"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSCompute :prop="PI_pagemasterseq" v-model="M_SS_PageMasterFile.pagemasterseq" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnmodulecdChange" :prop="PI_modulecd" :value="M_SS_PageMasterFile.modulecd" :label="M_SS_PageMasterFile.modulecdLabel" />
                                      </b-col>
                                      <b-col md="6">
                                        <ABSCompute :prop="PI_moduledescs" v-model="M_SS_PageMasterFile.moduledescs" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_pagecd" v-model="M_SS_PageMasterFile.pagecd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OntablenameChange" :prop="PI_tablename" :value="M_SS_PageMasterFile.tablename" :label="M_SS_PageMasterFile.tablenameLabel" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_locationurl" v-model="M_SS_PageMasterFile.locationurl"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_pageurl" v-model="M_SS_PageMasterFile.pageurl"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <!-- <b-col  md="6">
                                        <ABSCompute :prop="PI_usertype" v-model="M_SS_PageMasterFile.usertype" />
                                      </b-col> -->
                                      <b-col md="6">
                                        <ABSinputRadioButtonVuex :prop="PI_usertype" v-model="M_SS_PageMasterFile.usertype" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex :prop="PI_filterbyuserlevel" v-model="M_SS_PageMasterFile.filterbyuserlevel" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_usercolumnname" v-model="M_SS_PageMasterFile.usercolumnname"/>
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

            M_SS_PageMasterFile :{
                pagemasterseq: 0,
                modulecd: '',
                modulecdLabel: '',
                pagecd: '',
                textmenu: '',
                locationurl: '',
                pageurl: '',
                imageurld: '',
                pagetype: '',
                usetable: '',
                usefield: '',
                useamountfield: '',
                filterbyuserlevel: 'Y',
                usercolumnname: '',
                workflowstatus: '',
                tablename: '',
                tablenameLabel: '',
                viewstatus: '',
                editstatus: '',
                deletestatus: '',
                controlsequenceno: 0,
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                lastupdatestamp: 0,
                // t0: '',
                // t1: '',
                // t2: '',
                // t3: '',
                // t4: '',
                // t5: '',
                // t6: '',
                // t7: '',
                // t8: '',
                // t9: '',
                // t10: '',
                // t11: '',
                // t12: '',
                // t13: '',
                // t14: '',
                // t15: '',
                // t16: '',
                // t17: '',
                // t18: '',
                // t19: '',
                // t20: '',
                // t21: '',
                // t22: '',
                // t23: '',
                // t24: '',
                // t25: '',
                // t26: '',
                // t27: '',
                // t28: '',
                // t29: '',
                // t30: '',
                usertype: 'P',
                rowid: 0,
                menu_url: '',
                component_url: '',
                moduledescs: ''
                    }
            ,
            PI_textmenu: { 
                cValidate :'required', 
                cName:'textmenu', 
                cLabel:'Menu Name', 
                cOrder:1, 
                cKey:false, 
                cVisible:true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_pagemasterseq: { 
                cLabel:'PageMasterSeq', 
                cValue:'', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible:true 
            }, 
            PI_modulecd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupSSModule'    , 
                    ColumnDB: 'ModuleCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
                cName:'modulecd', 
                cLabel:'Module', 
                cKey:false, 
                cStatic: false, 
                cOrder:2, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cMasterUrl:'' ,
                cDisplayColumn:'module_cd,descs' ,
            }, 
            PI_moduledescs: { 
                cLabel:'', 
                cValue:'', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible:false 
            }, 
            PI_pagecd: { 
                cValidate :'', 
                cName:'pagecd', 
                cLabel:'Page Code', 
                cOrder:3, 
                cKey:false, 
                cVisible:true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_tablename: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupSSAllTable'    , 
                    ColumnDB: 'table_name'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
                cName:'tablename', 
                cLabel:'Table Name', 
                cKey:false, 
                cStatic: false, 
                cOrder:4, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cMasterUrl:'' ,
                cDisplayColumn:'table_name' ,
            }, 
            PI_locationurl: { 
                cValidate :'required', 
                cName:'locationurl', 
                cLabel:'Location Url', 
                cOrder:5, 
                cKey:false, 
                cVisible:true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_pageurl: { 
                cValidate :'', 
                cName:'pageurl', 
                cLabel:'Page Url (.ascx file)', 
                cOrder:0, 
                cKey:false, 
                cVisible:false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            // PI_usertype: { 
            //     cLabel:'', 
            //     cValue:'', 
            //     cPageLevel: this.PageLevel, 
            //     cTabIndex: this.TabIndex, 
            //     cVisible:false 
            // }, 
            PI_usertype: { 
                cValidate :'', 
                cName:'usertype', 
                cId:'rdbusertype', 
                cRadioOptions: [{ text: 'Public', value: 'P' },{ text: 'Internal', value: 'I' },{ text: 'Obsolete', value: 'O' },], 
                cLabel:'User Type', 
                cOrder:6, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_filterbyuserlevel: { 
                cValidate :'', 
                cName:'filterbyuserlevel', 
                cId:'rdbfilterbyuserlevel', 
                cRadioOptions: [{ text: 'Yes', value: 'Y' },{ text: 'No', value: 'N' },], 
                cLabel:'Filter By User Level', 
                cOrder:7, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_usercolumnname: { 
                cValidate :'', 
                cName:'usercolumnname', 
                cLabel:'User Column Name', 
                cOrder:8, 
                cKey:false, 
                cVisible:true, 
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
        OnmodulecdChange (data) {
        this.$nextTick(() => {
            this.M_SS_PageMasterFile.modulecd = data.id
            this.M_SS_PageMasterFile.modulecdLabel = data.label
//{modulecd}
        })
        this.$forceUpdate()
        },
        OntablenameChange (data) {
        this.$nextTick(() => {
            this.M_SS_PageMasterFile.tablename = data.id
            this.M_SS_PageMasterFile.tablenameLabel = data.label
//{tablename}
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
        M_Post(){
        },
        M_Refresh(){
        },
		doDoubleClick(){
        },
        M_Insert () {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                module_cd: this.M_SS_PageMasterFile.modulecd,
                page_cd: this.M_SS_PageMasterFile.pagecd,
                table_name: this.M_SS_PageMasterFile.tablename,
                text_menu: this.M_SS_PageMasterFile.textmenu,
                location_url: this.M_SS_PageMasterFile.locationurl,
                page_url: this.M_SS_PageMasterFile.pageurl,
                filter_by_user_level: this.M_SS_PageMasterFile.filterbyuserlevel,
                user_column_name: this.M_SS_PageMasterFile.usercolumnname,
                user_type: this.M_SS_PageMasterFile.usertype,
                user_input: this.getDataUser().user_id                 
            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return
                
                this.$parent.resultInsert(response.Message)
            })
        },
        M_Update () {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                page_master_seq: this.M_SS_PageMasterFile.pagemasterseq,
                module_cd: this.M_SS_PageMasterFile.modulecd,
                page_cd: this.M_SS_PageMasterFile.pagecd,
                table_name: this.M_SS_PageMasterFile.tablename,
                text_menu: this.M_SS_PageMasterFile.textmenu,
                location_url: this.M_SS_PageMasterFile.locationurl,
                page_url: this.M_SS_PageMasterFile.pageurl,
                filter_by_user_level: this.M_SS_PageMasterFile.filterbyuserlevel,
                user_column_name: this.M_SS_PageMasterFile.usercolumnname,
                user_type: this.M_SS_PageMasterFile.usertype,
                user_edit: this.getDataUser().user_id ,
                lastupdatestamp: this.M_SS_PageMasterFile.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                this.$parent.resultUpdate(response.Message)
            })
        },
		M_ClearForm(){
            this.M_SS_PageMasterFile = {
                pagemasterseq: 0,
                modulecd: '',
                modulecdLabel: '',
                pagecd: '',
                textmenu: '',
                locationurl: '',
                pageurl: '',
                imageurld: '',
                pagetype: '',
                usetable: '',
                usefield: '',
                useamountfield: '',
                filterbyuserlevel: 'Y',
                usercolumnname: '',
                workflowstatus: '',
                tablename: '',
                tablenameLabel: '',
                viewstatus: '',
                editstatus: '',
                deletestatus: '',
                controlsequenceno: 0,
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                lastupdatestamp: 0,
                // t0: '',
                // t1: '',
                // t2: '',
                // t3: '',
                // t4: '',
                // t5: '',
                // t6: '',
                // t7: '',
                // t8: '',
                // t9: '',
                // t10: '',
                // t11: '',
                // t12: '',
                // t13: '',
                // t14: '',
                // t15: '',
                // t16: '',
                // t17: '',
                // t18: '',
                // t19: '',
                // t20: '',
                // t21: '',
                // t22: '',
                // t23: '',
                // t24: '',
                // t25: '',
                // t26: '',
                // t27: '',
                // t28: '',
                // t29: '',
                // t30: '',
                usertype: 'P',
                rowid: 0,
                menu_url: '',
                component_url: '',
                moduledescs: ''
                    }
            		
		},
        M_New(){
            this.PI_pagemasterseq.cVisible = false

            //this.$nextTick().then(() => document.getElementById("PageMasterSeq").focus())
        },
        M_Edit(){
            //this.$nextTick().then(() => document.getElementById("???").focus())
        },
        M_Delete(dt){
          var data = this.FormToABSList().getRowSelected()
          var dataDelete = []

          data.forEach((value) => {
              dataDelete.push({
                  page_master_seq: value.page_master_seq,
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

        },
		M_Cancel() {
            this.PI_pagemasterseq.cVisible = true
        },
        rowClicked (record, index) {
            this.PI_pagemasterseq.cVisible = true            
        },
        rowLink (url){
        },
        getDataBy (record) {
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                page_master_seq: record.page_master_seq,
                module_cd: record.module_cd
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                console.log(data)
                this.M_SS_PageMasterFile = {
                    pagemasterseq: data.page_master_seq,
                    modulecd: record.module_cd,
                    pagecd: data.page_cd,
                    textmenu: data.text_menu,
                    locationurl: data.location_url,
                    pageurl: data.page_url,
                    imageurld: data.image_url_d,
                    pagetype: data.page_type,
                    usetable: data.use_table,
                    usefield: data.use_field,
                    useamountfield: data.use_amount_field,
                    filterbyuserlevel: data.filter_by_user_level,
                    usercolumnname: data.user_column_name,
                    workflowstatus: data.work_flow_status,
                    tablename: data.table_name,
                    viewstatus: data.view_status,
                    editstatus: data.edit_status,
                    deletestatus: data.delete_status,
                    controlsequenceno: data.control_sequence_no,
                    userinput: data.user_input,
                    useredit: data.user_edit,
                    timeinput: data.time_input,
                    timeedit: data.time_edit,
                    lastupdatestamp: record.lastupdatestamp,
                    // t0: data.t0,
                    // t1: data.t1,
                    // t2: data.t2,
                    // t3: data.t3,
                    // t4: data.t4,
                    // t5: data.t5,
                    // t6: data.t6,
                    // t7: data.t7,
                    // t8: data.t8,
                    // t9: data.t9,
                    // t10: data.t10,
                    // t11: data.t11,
                    // t12: data.t12,
                    // t13: data.t13,
                    // t14: data.t14,
                    // t15: data.t15,
                    // t16: data.t16,
                    // t17: data.t17,
                    // t18: data.t18,
                    // t19: data.t19,
                    // t20: data.t20,
                    // t21: data.t21,
                    // t22: data.t22,
                    // t23: data.t23,
                    // t24: data.t24,
                    // t25: data.t25,
                    // t26: data.t26,
                    // t27: data.t27,
                    // t28: data.t28,
                    // t29: data.t29,
                    // t30: data.t30,
                    usertype: data.user_type,
                    rowid: data.row_id,
                    menu_url: data.menu_url,
                    component_url: data.component_url,
                    moduledescs: data.module_descs
                }

                this.M_SS_PageMasterFile.modulecdLabel = this.M_SS_PageMasterFile.modulecd && this.M_SS_PageMasterFile.modulecd != '' ? data.module_cd + this.separator + data.module_descs : ''
                this.M_SS_PageMasterFile.tablenameLabel = this.M_SS_PageMasterFile.tablename && this.M_SS_PageMasterFile.tablename != '' ? data.table_name : ''

                // this.M_SS_PageMaster.PageMasterSeq = data.pagemasterseq       

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

