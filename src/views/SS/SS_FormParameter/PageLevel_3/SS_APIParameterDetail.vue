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
                                        <ABSinputTextVuex :prop="PI_paramname" v-model="M_SS_APIParameterDetail.paramname"  ref="ref_paramname" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_paramtype" v-model="M_SS_APIParameterDetail.paramtype"  ref="ref_paramtype"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_columnhtmlclean" v-model="M_SS_APIParameterDetail.columnhtmlclean"  ref="ref_columnhtmlclean"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnisnotfoundChange" :prop="PI_isnotfound" v-model="M_SS_APIParameterDetail.isnotfound"  ref="ref_sptype"/>
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

            M_SS_APIParameterDetail :{
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
            PI_paramname: { 
                cValidate :'required', 
                cName: 'paramname', 
                cLabel: 'Param Name', 
                cLabelSize: 4, 
                cOrder: 201, 
                cKey: true, 
                cType: 'text',
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_paramtype: { 
                cValidate :'required', 
                cName: 'paramtype', 
                cLabel: 'Param Type', 
                cLabelSize: 4, 
                cOrder: 202, 
                cKey: true, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_columnhtmlclean: { 
                cValidate :'required', 
                cName: 'columnhtmlclean', 
                cLabel: 'Column Html Clean', 
                cLabelSize: 4, 
                cOrder: 203,
                cType: 'text',
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
            }, 
            PI_isnotfound: { 
                cValidate :'', 
                cName: 'isnotfound', 
                cId: 'rdbnotfound', 
                cRadioOptions: [{ text: 'True', value: 'True' }, { text: 'False', value: 'False' }], 
                cLabel: 'Not Found', 
                cLabelSize: 4, 
                cOrder: 204, 
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
		OnisnotfoundChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {  
                
            }
        })
        this.$forceUpdate()
        },
		setToolbarButton () {
        //    this.getToolbar().statusFunction[0].disabled = true
        //    this.getToolbar().statusFunction[2].disabled = true
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
			
            let data = this.$store.getters.GetPage2Data
            this.propList.initialWhere = "HeaderUrl = '" + data.HeaderUrl + "' And SP ='"+data.SP+"'"
            this.M_SS_APIParameterDetail.headerurl = data.Url
        

            this.FormToABSList().doGetList('','eb_getList')
        },		
		M_CheckboxChecked(data, status, index){

        },		
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNoV2: this.$parent.data.page_order,
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
                Param_ID: this.M_SS_APIParameterDetail.param_id,
                HeaderUrl: this.M_SS_APIParameterDetail.headerurl,
                ColumnHtmlClean: this.M_SS_APIParameterDetail.columnhtmlclean,
                status: this.M_SS_APIParameterDetail.status,
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_SS_APIParameterDetail = {
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
            let data = this.$store.getters.GetPage2Data
            this.M_SS_APIParameterDetail.headerurl = data.HeaderUrl 

            this.$refs.ref_functionnameclean.focus()
        },
        M_Edit(){
            let data = this.$store.getters.GetPage2Data
            this.M_SS_APIParameterDetail.headerurl = data.HeaderUrl 

            this.$refs.ref_functionnameclean.focus()
        },
        M_Delete(dt){           
			var data = this.FormToABSList().getRowSelected()  
			var dataDelete = []

			
			data.forEach((value) => {
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
            console.log(record)
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
                console.log(data)
this.M_SS_APIParameterDetail = {
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

