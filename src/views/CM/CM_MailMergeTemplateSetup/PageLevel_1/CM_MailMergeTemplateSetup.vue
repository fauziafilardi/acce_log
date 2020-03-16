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
                                            <ABSinputTextVuex :prop="PI_mailmergecd" v-model="M_CM_MailMergeTemplateSetup.mailmergecd"  ref="ref_mailmergecd"/>
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col  md="6">
                                            <ABSinputTextVuex :prop="PI_mailmergename" v-model="M_CM_MailMergeTemplateSetup.mailmergename"  ref="ref_mailmergename"/>
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col  md="6">
                                            <ABSInputSelectList @change="OnspnameChange" :prop="PI_spname" :value="M_CM_MailMergeTemplateSetup.spname" :label="M_CM_MailMergeTemplateSetup.spnameLabel" ref="ref_spname"/>
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col  md="6">
                                            <span>
                                                <b-row>
                                                    <b-col md="4">
                                                        <ABSLabelOnly :prop="PI_columnfieldlabel" />
                                                    </b-col>
                                                    <b-col>
                                                        <ABSButton
                                                            text="Get Column List"
                                                            icon=""
                                                            classButton="button button--default"
                                                            classIcon=""
                                                            @click="beforeGet"
                                                            :disabled="inputStatus=='VIEW'"
                                                        />
                                                    </b-col>
                                                    <b-col md="1"></b-col>
                                                </b-row>
                                            </span>
                                        </b-col>
                                    </b-row>
                                    <b-row v-show="ColumnList">
                                        <b-col  md="12">
                                            <span>
                                                <b-row>
                                                    <b-col offset="2">
                                                        <b-row style="height: 250px; overflow-y: auto;">
                                                            <b-col>
                                                                <span v-for="(data, index) of ColumnList1" v-bind:key="index">
                                                                    {{ '{' + data.ColumnName + '}' }} <br>
                                                                </span>
                                                            </b-col>
                                                            <b-col>
                                                                <span v-for="(data, index) of ColumnList2" v-bind:key="index">
                                                                    {{ '{' + data.ColumnName + '}' }} <br>
                                                                </span>
                                                            </b-col>
                                                            <b-col>
                                                                <span v-for="(data, index) of ColumnList3" v-bind:key="index">
                                                                    {{ '{' + data.ColumnName + '}' }} <br>
                                                                </span>
                                                            </b-col>
                                                            <b-col>
                                                                <span v-for="(data, index) of ColumnList4" v-bind:key="index">
                                                                    {{ '{' + data.ColumnName + '}' }} <br>
                                                                </span>
                                                            </b-col>
                                                        </b-row>
                                                    </b-col>
                                                </b-row>
                                            </span>
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col  md="12">
                                            <ABSTextEditor
                                                @change="OnmailmergetemplateChange"
                                                @exportDoc="OnmailmergetemplateExportDoc"
                                                @exportPdf="OnmailmergetemplateExportPdf"
                                                :prop="PI_mailmergetemplate"
                                                v-model="M_CM_MailMergeTemplateSetup.mailmergetemplate"
                                                ref="ref_mailmergetemplate"
                                            />
                                        </b-col>
                                    </b-row>
                                </b-col>
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
    props: {PageLevel: '', TabIndex: '', data: ''},
    data() {
        return {
		cInsertKey:'',
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
            ColumnList: false,
            ColumnList1: [],
            ColumnList2: [],
            ColumnList3: [],
            ColumnList4: [],

            M_CM_MailMergeTemplateSetup :{
                mailmergecd: '',
                mailmergename: '',
                spname: 'SCM_MailMerge_Generate',
                spnameLabel: 'SCM_MailMerge_Generate',
                mailmergetemplate: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                lastupdatestamp: 0,
                controlsequenceno: 0,
                rowid: 0
                    }
            ,
            PI_mailmergecd: { 
                cValidate :'required|max:10', 
                cName: 'mailmergecd', 
                cLabel: 'Mail Merge Code', 
                cLabelSize: 4, 
                cOrder: 10, 
                cKey: true, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_mailmergename: { 
                cValidate :'', 
                cName: 'mailmergename', 
                cLabel: 'Mail Merge Name', 
                cLabelSize: 4, 
                cOrder: 10, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_spname: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookUpSPName'    , 
                    ColumnDB: 'SPName'   , 
                    InitialWhere: "SPName LIKE '%MailMerge%'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'spname', 
                cLabel: 'SP Name', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 0, 
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
                cDisplayColumn: 'SPName' ,
            },
            PI_columnfieldlabel: {
                cLabel: 'Column/Field List',
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true,
                cClass: 'lbl-col-align'
            },
            PI_mailmergetemplate: {
                cName: 'mailmergetemplate', 
                cLabel: 'Mail Merge Template', 
                cLabelSize: 2,
                cOrder: 5, 
                cKey: false,
                cToolbar: [
                    ['style', ['bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript', 'clear']],
                    ['font', ['fontname', 'fontsize', 'color']],
                    ['para', ['ul', 'ol', 'paragraph', 'height']],
                    ['table', ['table']],
                    ['insert', ['link', 'picture']],
                    ['edit', ['undo', 'redo']],
                    ['view', ['codeview']]
                ],
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
		return this.$store.getters.GetPage1Data
	},
	GetDataBy1(){
		return this.$store.getters.GetPage1GetDataBy
	}
  },
    methods: {
        OnmailmergetemplateChange(data) {
            this.M_CM_MailMergeTemplateSetup.mailmergetemplate = data
        },
        OnspnameChange (data) {
        this.$nextTick(() => {
            this.M_CM_MailMergeTemplateSetup.spname = data.id
            this.M_CM_MailMergeTemplateSetup.spnameLabel = data.label
            if (this.inputStatus != "VIEW") {
//{spname}
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
        },		
        M_Post(dt){
        },
        M_Insert() {
            // console.log(this.M_CM_MailMergeTemplateSetup)
            // return
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                MailMergeCd: this.M_CM_MailMergeTemplateSetup.mailmergecd,
                MailMergeName: this.M_CM_MailMergeTemplateSetup.mailmergename,
                SPName: this.M_CM_MailMergeTemplateSetup.spname == '' || this.M_CM_MailMergeTemplateSetup.spname == null ? 'NULL' : this.M_CM_MailMergeTemplateSetup.spname ,
                MailMergeTemplate: this.M_CM_MailMergeTemplateSetup.mailmergetemplate,
                UserInput: this.getDataUser().user_id                 
            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return

				//kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultInsert(response.Message)
					
				
            })

        },
        M_Update() {
            console.log(this.M_CM_MailMergeTemplateSetup)
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                MailMergeCd: this.M_CM_MailMergeTemplateSetup.mailmergecd,
                MailMergeName: this.M_CM_MailMergeTemplateSetup.mailmergename,
                SPName: this.M_CM_MailMergeTemplateSetup.spname == '' || this.M_CM_MailMergeTemplateSetup.spname == null ? 'NULL' : this.M_CM_MailMergeTemplateSetup.spname ,
                MailMergeTemplate: this.M_CM_MailMergeTemplateSetup.mailmergetemplate,
                UserEdit: this.getDataUser().user_id ,
                LastUpdateStamp: this.M_CM_MailMergeTemplateSetup.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })

        },
		M_ClearForm(){
            this.$refs.ref_mailmergetemplate.GetDataByStatus = true
            this.M_CM_MailMergeTemplateSetup = {
                mailmergecd: '',
                mailmergename: '',
                spname: 'SCM_MailMerge_Generate',
                spnameLabel: 'SCM_MailMerge_Generate',
                mailmergetemplate: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                lastupdatestamp: 0,
                controlsequenceno: 0,
                rowid: 0
                    }
            
            this.ColumnList = false
            this.ColumnList1 = []
            this.ColumnList2 = []
            this.ColumnList3 = []
            this.ColumnList4 = []
		},
        M_New(){
			
        },
        M_Edit(){
        },
        M_Delete(dt){       
			var data = this.FormToABSList().getRowSelected()  
			var dataDelete = []

			
			data.forEach((value) => {
				dataDelete.push({
                    MailMergeCd: value.MailMergeCd,
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
        getDataBy (record) {
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order
,                mailmergecd: record.MailMergeCd
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return

                this.$refs.ref_mailmergetemplate.GetDataByStatus = true
                
                var data = response.Data[0]
this.M_CM_MailMergeTemplateSetup = {
                mailmergecd: data.mailmergecd,
                mailmergename: data.mailmergename,
                spname: data.spname,
                mailmergetemplate: data.mailmergetemplate,
                userinput: data.userinput,
                useredit: data.useredit,
                timeinput: data.timeinput,
                timeedit: data.timeedit,
                lastupdatestamp: record.LastUpdateStamp,
                controlsequenceno: data.controlsequenceno,
                rowid: data.rowid
                    }
                 

                this.GetAllField()
                this.M_CM_MailMergeTemplateSetup.spnameLabel = this.M_CM_MailMergeTemplateSetup.spname != null && this.M_CM_MailMergeTemplateSetup.spname != '' ? data.spname :'' 
         

                this.IEBy.Input = data.userinput
                this.IEBy.Edit = data.useredit

            })
        },
        beforeGet(){
            var scopeForm = 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            this.$validator._base.validateAll(scopeForm).then((result) => {
                if (!result) return
                if (!this.M_CM_MailMergeTemplateSetup.spname || this.M_CM_MailMergeTemplateSetup.spname == '') return
                this.GetAllField()
            })
        },
        GetAllField(){
            var param = {
                SpName: this.M_CM_MailMergeTemplateSetup.spname,
                MailMergeCd: this.M_CM_MailMergeTemplateSetup.mailmergecd
            }

            this.postEncode( this.getUrlGetColumnList(), param )
            .then(response => {
                if(response == null) {
                    this.ColumnList = false
                    return
                }
                if (response.Data.length < 1) {
                    this.ColumnList = false
                    return
                }

                this.ColumnList = true
                var looping1 = response.Data.length / 4
                var looping2 = looping1 * 2
                var looping3 = looping1 * 3
                var looping4 = response.Data.length - 1

                for (let a = 0; a < response.Data.length; a++) {
                    if (a <= looping1) {
                        this.ColumnList1.push({
                            ColumnName: response.Data[a].ColumnName
                        })
                    }
                    else if (a > looping1 && a <= looping2) {
                        this.ColumnList2.push({
                            ColumnName: response.Data[a].ColumnName
                        })
                    }
                    else if (a > looping2 && a <= looping3) {
                        this.ColumnList3.push({
                            ColumnName: response.Data[a].ColumnName
                        })
                    }
                    else if (a > looping3 && a <= looping4) {
                        this.ColumnList4.push({
                            ColumnName: response.Data[a].ColumnName
                        })
                    }
                }
            })
        },
        OnmailmergetemplateExportDoc(data) {},
        OnmailmergetemplateExportPdf(data) {}
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

