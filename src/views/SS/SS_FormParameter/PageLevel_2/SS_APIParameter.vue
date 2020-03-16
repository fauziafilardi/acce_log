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
      @checkboxChecked = "$parent.checkboxChecked"
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
                                        <ABSinputTextVuex :prop="PI_method" v-model="M_SS_APIParameter.method"  ref="ref_method" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex @input="OnfunctionnamecleanChange" :prop="PI_functionnameclean" v-model="M_SS_APIParameter.functionnameclean"  ref="ref_functionnameclean"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_line_no" v-model="M_SS_APIParameter.line_no"  ref="ref_line_no"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnspChange" :prop="PI_sp" :value="M_SS_APIParameter.sp" :label="M_SS_APIParameter.spLabel"  ref="ref_sp"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnsptypeChange" :prop="PI_sptype" v-model="M_SS_APIParameter.sptype"  ref="ref_sptype"/>
                                      </b-col>
                                    </b-row>
                                </b-col> <!-- table close -->
                  
							</b-row>
							<ABSTAnalysis :prop="PTAnalysis" />
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
                initialWhere:"HeaderUrl = '" + this.ValKey + "'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_SS_APIParameter :{
                param_id: 0,
                headerurl: '',
                sp_type: '',
                sp: '',
                param_name: '',
                param_type: '',
                param_length: '',
                param_prec: '',
                param_scale: '',
                param_order: '',
                userinput: '',
                useredit: this.getDataUser().UserId,
                timeinput: '',
                timeedit: '',
                isnotfound: '',
                line_no: '',
                functionnameclean: '',
                columnhtmlclean: '',
                status: '',

                    }
            ,
            PI_method: { 
                cValidate :'required', 
                cName: 'methoid', 
                cLabel: 'Method', 
                cLabelSize: 4, 
                cOrder: 101, 
                cKey: true, 
                cVisible:  false, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_functionnameclean: { 
                cValidate :'required', 
                cName: 'functionnameclean', 
                cLabel: 'Function Name', 
                cLabelSize: 4, 
                cOrder: 102, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
                cStatic: true, 
                cOption: [
                    { label: 'Select', id: 'Select' },
                    { label: 'Insert', id: 'Insert' },
                    { label: 'Update', id: 'Update' },
                    { label: 'Delete', id: 'Delete' }],
                cMasterUrl: '' ,
                cDisplayColumn: '' 
            }, 
            PI_line_no: { 
                cValidate :'required', 
                cName: 'line_no', 
                cLabel: 'Line No', 
                cLabelSize: 4, 
                cOrder: 103, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_sp: { 
                dataLookUp: { 
                    LookUpCd: 'GetUISp', 
                    ColumnDB: 'SpName', 
                    InitialWhere: "", 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
                cName: 'sp', 
                cLabel: 'SP', 
                cLabelSize: 4, 
                cOrder: 104,
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
                cDisplayColumn: 'SpName' ,
            }, 
            PI_sptype: { 
                cValidate :'required', 
                cName: 'sptype', 
                cId: 'rdbsptype', 
                cRadioOptions: [{ text: 'Insert', value: 'I' }, { text: 'Update', value: 'U' }, { text: 'Delete', value: 'D' }, { text: 'GetById', value: 'S' }], 
                cLabel: 'SP Type', 
                cLabelSize: 4, 
                cOrder: 105, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

			PTAnalysis: {
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cPageMasterSeq: this.data.PageMasterSeq,
                cFormPageNo: this.data.PageOrder,
				cProtect: false
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
	,GetDataBy1(){
		return this.$store.getters.GetPage1GetDataBy
	}
  },
    methods: {
        OnfunctionnamecleanChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {  
                this.M_SS_APIParameter.method = data
            }
        })
        this.$forceUpdate()
        },
        OnspChange (data) {
            // console.log(data)
            this.M_SS_APIParameter.sp = data.id
            this.M_SS_APIParameter.spLabel = data.label
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {  
                
            }
        })
        this.$forceUpdate()
        },
		OnsptypeChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {  
                
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
            this.$parent.showForm = false
			
            let data = this.$store.getters.GetPage1Data
            // console.log(data)
            this.propList.initialWhere = "HeaderUrl = '" + data.Url + "'"
            this.M_SS_APIParameter.headerurl = data.Url
        

            this.FormToABSList().doGetList('','eb_getList')
        },		
		M_CheckboxChecked(data, status, index){

        },		
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNoV2: this.$parent.data.page_order,
                HeaderUrl: this.DataRowPage1.Url,
                Method: this.M_SS_APIParameter.method,
                FunctionNameClean: this.M_SS_APIParameter.functionnameclean.toUpperCase(),
                LineNo: this.M_SS_APIParameter.line_no,
                SP: this.M_SS_APIParameter.sp,
                SpType: this.M_SS_APIParameter.sptype,
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
                LineNoV2: this.$parent.data.page_order,
                HeaderUrl: this.DataRowPage1.Url,
                FunctionNameClean: this.M_SS_APIParameter.functionnameclean.toUpperCase(),
                LineNo: this.M_SS_APIParameter.line_no,
                SP: this.M_SS_APIParameter.sp,
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_SS_APIParameter = {
                param_id: 0,
                headerurl: '',
                sp_type: '',
                sp: '',
                param_name: '',
                param_type: '',
                param_length: '',
                param_prec: '',
                param_scale: '',
                param_order: '',
                userinput: '',
                useredit: this.getDataUser().UserId,
                timeinput: '',
                timeedit: '',
                isnotfound: '',
                line_no: '',
                functionnameclean: '',
                columnhtmlclean: '',
                status: '',
                    }
            	
		},
        M_New(){
            let data = this.$store.getters.GetPage1Data
            this.M_SS_APIParameter.headerurl = data.Url 

            this.$refs.ref_functionnameclean.focus()
        },
        M_Edit(){
            let data = this.$store.getters.GetPage1Data
            this.M_SS_APIParameter.headerurl = data.Url 

            this.$refs.ref_functionnameclean.focus()
        },
        M_Delete(dt){           
			var data = this.FormToABSList().getRowSelected()  
			var dataDelete = []

			
			data.forEach((value) => {
                // console.log(value);
				dataDelete.push({
					_Message_:'',
                    HeaderUrl: value.HeaderUrl,
                    SP: value.SP,


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
                HeaderUrl: record.HeaderUrl,
                SP: record.SP,               		
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
                // console.log(data)
this.M_SS_APIParameter = {
                param_id: data.param_id,
                headerurl: data.headerurl,
                sp_type: data.sp_type,
                sp: data.sp,
                param_name: data.param_name,
                param_type: data.param_type,
                param_length: data.param_length,
                param_prec: data.param_prec,
                param_scale: data.param_scale,
                param_order: data.param_order,
                userinput: data.userinput,
                useredit: data.useredit,
                timeinput: data.timeinput,
                timeedit: data.timeedit,
                isnotfound: data.isnotfound,
                line_no: data.line_no,
                functionnameclean: data.functionnameclean,
                columnhtmlclean: data.columnhtmlclean,
                status: data.status,
                    }
                 
                this.M_SS_APIParameter.spLabel = this.M_SS_APIParameter.sp != null ? data.sp :''
  

                this.IEBy.Input = data.userinput
                this.IEBy.Edit = data.useredit

            })
        }
		
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

