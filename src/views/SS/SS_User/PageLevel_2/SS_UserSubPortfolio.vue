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
                                        <ABSInputSelectList @change="OnsubportfoliocdChange" :prop="PI_subportfoliocd" :value="M_SS_UserSubPortfolio.subportfoliocd" :label="M_SS_UserSubPortfolio.subportfoliocdLabel" ref="ref_subportfoliocd" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnstatusChange" :prop="PI_status" v-model="M_SS_UserSubPortfolio.status"  ref="ref_status" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputCheckBox @input="OndefaultloginstatusChange" :prop="PI_defaultloginstatus" v-model="M_SS_UserSubPortfolio.defaultloginstatus"  ref="ref_defaultloginstatus" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OndescsChange" :prop="PI_descs" v-model="M_SS_UserSubPortfolio.descs"  ref="ref_descs" />
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
    props: {PageLevel:'', TabIndex: '', data: ''},
    data() {
        return {
			ValKey:null,
            FormType: "List",
			Module:"SS",
            propList: {
                initialWhere:"user_id = '" + this.ValKey + "'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_SS_UserSubPortfolio :{
                userid: '',
                subportfoliocd: '',
                subportfoliocdLabel: '',
                name: '',
                status: 'Y',
                defaultloginstatus: '',
                descs: '',
                userinput: '',
                useredit: '',
                timeedit: '',
                lastupdatestamp: 0,
                rowid: 0
                    }
            ,
            PI_subportfoliocd: { 
                dataLookUp: { 
                    LookUpCd: 'GetSubPortfolioCd'    , 
                    ColumnDB: 'SubPortfolioCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
                cName: 'subportfoliocd', 
                cLabel: 'SubPortfolio', 
                cKey: true, 
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
                cDisplayColumn: 'subportfolio,name' ,
            }, 
            PI_status: { 
                cValidate :'', 
                cName: 'status', 
                cId: 'rdbstatus', 
                cRadioOptions: [{ text: 'Allow', value: 'Y' },{ text: 'Deny', value: 'N' },], 
                cRadioDefaultOption: 'Y', 
                cLabel:'Access Permission', 
                cLabelSize: 4, 
                cOrder: 0, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_defaultloginstatus: { 
                cValidate :'', 
                cName: 'defaultloginstatus', 
                cLabel: 'Default Login Status', 
                cLabelSize: 4, 
                cOptions: [ { text: '', value: true } ], 
                cOrder: 0, 
                cKey: false, 
                cVisible: true, 
                cProtect: false, 
                cDefault: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_descs: { 
                cValidate :'', 
                cName:'descs', 
                cLabel:'Description', 
                cLabelSize: 4, 
                cOrder:0, 
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
        OnsubportfoliocdChange (data) {
            this.M_SS_UserSubPortfolio.subportfoliocd = data.id
            this.M_SS_UserSubPortfolio.subportfoliocdLabel = data.label
            this.$nextTick(() => {
                if (this.inputStatus != "VIEW") {
                    //{subportfoliocd}
                }
            })
            this.$forceUpdate()
        },
        OnstatusChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{status}
            }
        })
        this.$forceUpdate()
        },
        OndefaultloginstatusChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{defaultloginstatus}
            }
        })
        this.$forceUpdate()
        },
        OndescsChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{descs}
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
            this.M_SS_UserSubPortfolio.userid = data.user_id 
            this.propList.initialWhere =" user_id = '" + data.user_id + "' "
        

            this.FormToABSList().doGetList('','eb_getList')
        },		       
        M_Insert() {
            console.log(this.M_SS_UserSubPortfolio)
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                user_id: this.DataRowPage1.user_id,
                subportfolio_cd: this.M_SS_UserSubPortfolio.subportfoliocd,
                status: this.M_SS_UserSubPortfolio.status,
                default_login_status: this.M_SS_UserSubPortfolio.defaultloginstatus[0] === true ? "Y" : "N",
                descs: this.M_SS_UserSubPortfolio.descs,
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
            console.log(this.M_SS_UserSubPortfolio)
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                user_id: this.DataRowPage1.user_id,
                subportfolio_cd: this.M_SS_UserSubPortfolio.subportfoliocd,
                status: this.M_SS_UserSubPortfolio.status,
                default_login_status: this.M_SS_UserSubPortfolio.defaultloginstatus[0] === true ? "Y" : "N",
                descs: this.M_SS_UserSubPortfolio.descs,
                user_edit: this.getDataUser().user_id ,
                lastupdatestamp: this.M_SS_UserSubPortfolio.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_SS_UserSubPortfolio = {
                userid: '',
                subportfoliocd: '',
                subportfoliocdLabel: '',
                name: '',
                status: 'Y',
                defaultloginstatus: '',
                descs: '',
                userinput: '',
                useredit: '',
                timeedit: '',
                lastupdatestamp: 0,
                rowid: 0
                    }
            		
		},
        M_New(){
            let data = this.$store.getters.GetPage1Data
            this.M_SS_UserSubPortfolio.userid = data.user_id 



        },
        M_Edit(){
        },
        M_Delete(dt){
            var data = this.FormToABSList().getRowSelected()
            var dataDelete = []

            data.forEach((value) => {
                dataDelete.push({
                    subportfolio_cd: this.getDataUser().subportfolio_cd,
                    user_id: this.DataRowPage1.user_id,
                    lastupdatestamp:  value.lastupdatestamp,
                    user_edit: this.getDataUser().user_id,
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
        getDataBy (record) {
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                user_id: record.user_id,
                subportfolio_cd: record.subportfolio_cd
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
                this.M_SS_UserSubPortfolio = {
                    userid: data.user_id,
                    subportfoliocd: data.subportfolio_cd,
                    name: data.name,
                    status: data.status,
                    defaultloginstatus: data.default_login_status == "Y" ? true : "",
                    descs: data.descs,
                    userinput: data.user_input,
                    useredit: data.user_edit,
                    timeedit: data.time_edit,
                    lastupdatestamp: record.lastupdatestamp,
                    rowid: data.row_id
                }
                    
                this.M_SS_UserSubPortfolio.subportfoliocdLabel = this.M_SS_UserSubPortfolio.subportfoliocd && this.M_SS_UserSubPortfolio.subportfoliocd != '' ? data.subportfolio_cd + this.separator + data.name : ''

                this.IEBy.Input = data.user_input
                this.IEBy.Edit = data.user_edit

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

