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
                                        <ABSinputTextVuex :prop="PI_tablecd" v-model="M_SM_TableMaster.tablecd"  ref="ref_tablecd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_tablename" v-model="M_SM_TableMaster.tablename"  ref="ref_tablename"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnassignuserChange" :prop="PI_assignuser" :value="M_SM_TableMaster.assignuser" :label="M_SM_TableMaster.assignuserLabel" ref="ref_assignuser"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_SM_TableMaster.remarks"  ref="ref_remarks" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OndefaultuserChange" :prop="PI_defaultuser" :value="M_SM_TableMaster.defaultuser" :label="M_SM_TableMaster.defaultuserLabel" ref="ref_defaultuser"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OntablestatusChange" :prop="PI_tablestatus" v-model="M_SM_TableMaster.tablestatus"  ref="ref_tablestatus" />
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
    props: {PageLevel: '', TabIndex: '', data: ''},
    data() {
        return {
		cInsertKey:'',
		FormType: "List",
		Module:"SM",
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

            M_SM_TableMaster :{
                tablecd: '',
                tablename: '',
                assignuser: '',
                remarks: '',
                defaultuser: '',
                tablestatus: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeeditt: '',
                lastupdatestamp: 0,
                rowid: 0
                    }
            ,
            PI_tablecd: { 
                cValidate :'required|max:5', 
                cName: 'tablecd', 
                cLabel: 'Kode Meja', 
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
            PI_tablename: { 
                cValidate :'required|max:50', 
                cName: 'tablename', 
                cLabel: 'Nama Meja', 
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
            PI_assignuser: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupUser'    , 
                    ColumnDB: 'UserId'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'UserId,UserName' 
                        }, 
                cValidate :'required', 
                cName: 'assignuser', 
                cLabel: 'Assign User', 
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
                cDisplayColumn: 'UserId,UserName' ,
            }, 
            PI_remarks: { 
                cValidate :'', 
                cName:'remarks', 
                cLabel:'Keterangan', 
                cLabelSize: 4, 
                cOrder:4, 
                cKey: false, 
                cDefault: '', 
                cProtect: false, 
                cVisible: true, 
                cResize: false, 
                cReadOnly: false, 
                cRows: 3, 
                cMaxRows: 3, 
                cSize: 'md', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
            }, 
            PI_defaultuser: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupUser'    , 
                    ColumnDB: 'UserId'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'UserId,UserName' 
                        }, 
                cValidate :'required', 
                cName: 'defaultuser', 
                cLabel: 'Default User', 
                cKey: false, 
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
                cDisplayColumn: 'UserId,UserName' ,
            }, 
            PI_tablestatus: { 
                cValidate :'', 
                cName: 'tablestatus', 
                cId: 'rdbtablestatus', 
                cRadioOptions: [{ text: 'Ya', value: 'Y' },{ text: 'Tidak', value: 'N' },], 
                cRadioDefaultOption: 'Y', 
                cLabel:'Status Meja', 
                cLabelSize: 4, 
                cDefault: '', 
                cOrder: 6, 
                cProtect: false, 
                cVisible:  true, 
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
        OnassignuserChange (data) {
        this.$nextTick(() => {
            this.M_SM_TableMaster.assignuser = data.id
            this.M_SM_TableMaster.assignuserLabel = data.label
            if (this.inputStatus != "VIEW") {
//{assignuser}
            }
        })
        this.$forceUpdate()
        },
        OnremarksChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{remarks}
            }
        })
        this.$forceUpdate()
        },
        OndefaultuserChange (data) {
        this.$nextTick(() => {
            this.M_SM_TableMaster.defaultuser = data.id
            this.M_SM_TableMaster.defaultuserLabel = data.label
            if (this.inputStatus != "VIEW") {
//{defaultuser}
            }
        })
        this.$forceUpdate()
        },
        OntablestatusChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{tablestatus}
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
		M_CheckboxChecked(data, status, index){

        },		
        M_Post(dt){
        },
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                TableCd: this.M_SM_TableMaster.tablecd,
                TableName: this.M_SM_TableMaster.tablename,
                AssignUser: this.M_SM_TableMaster.assignuser == '' || this.M_SM_TableMaster.assignuser == null ? 'NULL' : this.M_SM_TableMaster.assignuser ,
                Remarks: this.M_SM_TableMaster.remarks,
                DefaultUser: this.M_SM_TableMaster.defaultuser == '' || this.M_SM_TableMaster.defaultuser == null ? 'NULL' : this.M_SM_TableMaster.defaultuser ,
                TableStatus: this.M_SM_TableMaster.tablestatus,
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
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                TableCd: this.M_SM_TableMaster.tablecd,
                TableName: this.M_SM_TableMaster.tablename,
                AssignUser: this.M_SM_TableMaster.assignuser == '' || this.M_SM_TableMaster.assignuser == null ? 'NULL' : this.M_SM_TableMaster.assignuser ,
                Remarks: this.M_SM_TableMaster.remarks,
                DefaultUser: this.M_SM_TableMaster.defaultuser == '' || this.M_SM_TableMaster.defaultuser == null ? 'NULL' : this.M_SM_TableMaster.defaultuser ,
                TableStatus: this.M_SM_TableMaster.tablestatus,
                UserEdit: this.getDataUser().user_id ,
                LastUpdateStamp: this.M_SM_TableMaster.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_SM_TableMaster = {
                tablecd: '',
                tablename: '',
                assignuser: '',
                remarks: '',
                defaultuser: '',
                tablestatus: 'Y',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeeditt: '',
                lastupdatestamp: 0,
                rowid: 0
                    }
            	
	
		},
        M_New(){
			this.$refs.ref_tablecd.focus()
        },
        M_Edit(){
            this.$refs.ref_tablename.focus()
        },
        M_Delete(dt){       
			var data = this.FormToABSList().getRowSelected()  
			var dataDelete = []

			
			data.forEach((value) => {

				// console.log(value)
				dataDelete.push({
					_Message_:'',
                    SubPortfolioCd: this.getDataUser().subportfolio_cd,
                    TableCd: value.ableCd,
                    LastUpdateStamp: value.LastUpdateStamp,


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
                LineNo: this.$parent.data.page_order
,                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                tablecd: record.TableCd
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                // console.log(data)
this.M_SM_TableMaster = {
                tablecd: data.tablecd,
                tablename: data.tablename,
                assignuser: data.assignuser,
                remarks: data.remarks,
                defaultuser: data.defaultuser,
                tablestatus: data.tablestatus,
                userinput: data.userinput,
                useredit: data.useredit,
                timeinput: data.timeinput,
                timeedit: data.timeedit,
                lastupdatestamp: record.LastUpdateStamp,
                rowid: record.row_id
                    }
                 

                this.M_SM_TableMaster.assignuserLabel = this.M_SM_TableMaster.assignuser != null && this.M_SM_TableMaster.assignuser != '' ? data.assignuser + this.separator + data.assignusername :'' 
                this.M_SM_TableMaster.defaultuserLabel = this.M_SM_TableMaster.defaultuser != null && this.M_SM_TableMaster.defaultuser != '' ? data.defaultuser + this.separator + data.defaultusername :'' 
         

                this.IEBy.Input = data.userinput
                this.IEBy.Edit = data.useredit

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

