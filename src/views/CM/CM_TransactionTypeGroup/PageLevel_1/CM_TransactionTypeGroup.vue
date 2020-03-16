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
                                        <ABSinputTextVuex :prop="PI_trxtypegroupcd" v-model="M_CM_TransactionTypeGroup.trxtypegroupcd"  ref="ref_trxtypegroupcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_descs" v-model="M_CM_TransactionTypeGroup.descs"  ref="ref_descs"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnmodulecdChange" :prop="PI_modulecd" :value="M_CM_TransactionTypeGroup.modulecd" :label="M_CM_TransactionTypeGroup.modulecdLabel" ref="ref_modulecd"/>
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
		cInsertKey:'id=cm_transaction_type_group_id, label=trx_type_group_cd+|+descs',
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

            M_CM_TransactionTypeGroup :{
                trxtypegroupcd: '',
                descs: '',
                userinput: '',
                modulecd: '',
                useredit: this.getDataUser().user_id,
                moduledescs: '',
                lastupdatestamp: 0,
                rowid: 0
                    }
            ,
            PI_trxtypegroupcd: { 
                cValidate :'required|max:5', 
                cName: 'trxtypegroupcd', 
                cLabel: 'Transaction Group', 
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
            PI_modulecd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupSSModule'    , 
                    ColumnDB: 'ModuleCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'modulecd', 
                cLabel: 'Module', 
                cKey: false, 
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
                cDisplayColumn: 'module_cd,descs' ,
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
        OnmodulecdChange (data) {
        if (this.M_CM_TransactionTypeGroup.modulecd == data.id) return
        this.$nextTick(() => {
            this.M_CM_TransactionTypeGroup.modulecd = data.id
            this.M_CM_TransactionTypeGroup.modulecdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{modulecd}
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
        M_Post(){
        },
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                trx_type_group_cd: this.M_CM_TransactionTypeGroup.trxtypegroupcd,
                descs: this.M_CM_TransactionTypeGroup.descs,
                module_cd: this.M_CM_TransactionTypeGroup.modulecd == '' || this.M_CM_TransactionTypeGroup.modulecd == null ? 'NULL' : this.M_CM_TransactionTypeGroup.modulecd ,
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
                trx_type_group_cd: this.M_CM_TransactionTypeGroup.trxtypegroupcd,
                descs: this.M_CM_TransactionTypeGroup.descs,
                user_edit: this.getDataUser().user_id ,
                module_cd: this.M_CM_TransactionTypeGroup.modulecd == '' || this.M_CM_TransactionTypeGroup.modulecd == null ? 'NULL' : this.M_CM_TransactionTypeGroup.modulecd ,
                lastupdatestamp: this.M_CM_TransactionTypeGroup.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })

        },
		M_ClearForm(){
            this.M_CM_TransactionTypeGroup = {
                trxtypegroupcd: '',
                descs: '',
                userinput: '',
                modulecd: '',
                useredit: this.getDataUser().user_id,
                moduledescs: '',
                lastupdatestamp: 0,
                rowid: 0
            }
		},
        M_New(){
			this.$refs.ref_trxtypegroupcd.focus()
        },
        M_Edit(){
            this.$refs.ref_descs.focus()
        },
        M_Delete(dt){       

            var data = this.FormToABSList().getRowSelected()
            var dataDelete = []

            data.forEach((value) => {
                dataDelete.push({
                    trx_type_group_cd: value.transaction_type_group,
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
        getDataBy (record) {
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                trx_type_group_cd: record.transaction_type_group
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                this.M_CM_TransactionTypeGroup = {
                    trxtypegroupcd: data.trx_type_group_cd,
                    descs: data.descs,
                    userinput: data.user_input,
                    modulecd: data.module_cd,
                    useredit: data.user_edit,
                    moduledescs: data.module_descs,
                    lastupdatestamp: record.lastupdatestamp,
                    rowid: data.row_id
                }

                this.M_CM_TransactionTypeGroup.modulecdLabel = this.M_CM_TransactionTypeGroup.modulecd != null ? data.module_cd + this.separator + data.module_descs :'' 

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

