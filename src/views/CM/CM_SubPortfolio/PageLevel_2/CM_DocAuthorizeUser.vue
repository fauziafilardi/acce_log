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
                                        <ABSinputTextVuex :prop="PI_document_type" v-model="M_CM_DocAuthorizeUser.document_type"  ref="ref_document_type"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_descs" v-model="M_CM_DocAuthorizeUser.descs"  ref="ref_descs"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="Onauthorize1_idChange" :prop="PI_authorize1_id" :value="M_CM_DocAuthorizeUser.authorize1_id" :label="M_CM_DocAuthorizeUser.authorize1_idLabel" ref="ref_authorize1_id"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_authorize1_name" v-model="M_CM_DocAuthorizeUser.authorize1_name"  ref="ref_authorize1_name"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_authorize1_position" v-model="M_CM_DocAuthorizeUser.authorize1_position"  ref="ref_authorize1_position"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_authorize1_reff_no" v-model="M_CM_DocAuthorizeUser.authorize1_reff_no"  ref="ref_authorize1_reff_no"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="Onauthorize2_idChange" :prop="PI_authorize2_id" :value="M_CM_DocAuthorizeUser.authorize2_id" :label="M_CM_DocAuthorizeUser.authorize2_idLabel" ref="ref_authorize2_id"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_authorize2_name" v-model="M_CM_DocAuthorizeUser.authorize2_name"  ref="ref_authorize2_name"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_authorize2_position" v-model="M_CM_DocAuthorizeUser.authorize2_position"  ref="ref_authorize2_position"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_authorize2_reff_no" v-model="M_CM_DocAuthorizeUser.authorize2_reff_no"  ref="ref_authorize2_reff_no"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="Onauthorize3_idChange" :prop="PI_authorize3_id" :value="M_CM_DocAuthorizeUser.authorize3_id" :label="M_CM_DocAuthorizeUser.authorize3_idLabel" ref="ref_authorize3_id"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_authorize3_name" v-model="M_CM_DocAuthorizeUser.authorize3_name"  ref="ref_authorize3_name"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_authorize3_position" v-model="M_CM_DocAuthorizeUser.authorize3_position"  ref="ref_authorize3_position"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_authorize3_reff_no" v-model="M_CM_DocAuthorizeUser.authorize3_reff_no"  ref="ref_authorize3_reff_no"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="Onfooter_remarks1Change" :prop="PI_footer_remarks1" v-model="M_CM_DocAuthorizeUser.footer_remarks1"  ref="ref_footer_remarks1" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="Onfooter_remarks2Change" :prop="PI_footer_remarks2" v-model="M_CM_DocAuthorizeUser.footer_remarks2"  ref="ref_footer_remarks2" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="Onfooter_remarks3Change" :prop="PI_footer_remarks3" v-model="M_CM_DocAuthorizeUser.footer_remarks3"  ref="ref_footer_remarks3" />
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
			Module:"CM",
            propList: {
                initialWhere:"subportfolio_cd = '" + this.ValKey + "'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_CM_DocAuthorizeUser :{
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                document_type: '',
                descs: '',
                authorize1_id: '',
                authorize1_name: '',
                authorize1_position: '',
                handphone1: '',
                authorize1_reff_no: '',
                footer_remarks1: '',
                authorize2_id: '',
                authorize2_name: '',
                authorize2_position: '',
                handphone2: '',
                authorize2_reff_no: '',
                footer_remarks2: '',
                authorize3_id: '',
                authorize3_name: '',
                authorize3_position: '',
                handphone3: '',
                authorize3_reff_no: '',
                footer_remarks3: '',
                user_input: '',
                user_edit: this.getDataUser().user_id,
                time_input: '',
                time_edit: '',
                lastupdatestamp: 0,
                row_id: 0
                    }
            ,
            PI_document_type: { 
                cValidate :'required|max:5', 
                cName: 'documenttttype', 
                cLabel: 'Document Type', 
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
                cValidate :'max:50', 
                cName: 'deeescs', 
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
            PI_authorize1_id: { 
                dataLookUp: { 
                    LookUpCd: 'getAuthorize1ID'    , 
                    ColumnDB: 'authorize1_ID'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'authorize1_id', 
                cLabel: 'Authorize User I', 
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
                cDisplayColumn: 'user_id,user_name' ,
            }, 
            PI_authorize1_name: { 
                cValidate :'', 
                cName: 'authorize1_name', 
                cLabel: 'Authorize Name I', 
                cLabelSize: 4, 
                cOrder: 4, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_authorize1_position: { 
                cValidate :'', 
                cName: 'authorize1_position', 
                cLabel: 'Authorize Position I', 
                cLabelSize: 4, 
                cOrder: 5, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_authorize1_reff_no: { 
                cValidate :'', 
                cName: 'authorize1_reff_no', 
                cLabel: 'Authorize Reference No I', 
                cLabelSize: 4, 
                cOrder: 6, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_authorize2_id: { 
                dataLookUp: { 
                    LookUpCd: 'getAuthorize1ID'    , 
                    ColumnDB: 'authorize1_ID'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'authorize2_id', 
                cLabel: 'Authorize User II', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 7, 
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
                cDisplayColumn: 'user_id,user_name' ,
            }, 
            PI_authorize2_name: { 
                cValidate :'', 
                cName: 'authorize2_name', 
                cLabel: 'Authorize Name II', 
                cLabelSize: 4, 
                cOrder: 8, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_authorize2_position: { 
                cValidate :'', 
                cName: 'authorize2_position', 
                cLabel: 'Authorize Position II', 
                cLabelSize: 4, 
                cOrder: 9, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_authorize2_reff_no: { 
                cValidate :'', 
                cName: 'authorize2_reff_no', 
                cLabel: 'Authorize Reference No II', 
                cLabelSize: 4, 
                cOrder: 10, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_authorize3_id: { 
                dataLookUp: { 
                    LookUpCd: 'getAuthorize1ID'    , 
                    ColumnDB: 'authorize1_ID'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'authorize3_id', 
                cLabel: 'Authorize User III', 
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
                cDisplayColumn: 'user_id,user_name' ,
            }, 
            PI_authorize3_name: { 
                cValidate :'', 
                cName: 'authorize3_name', 
                cLabel: 'Authorize Name III', 
                cLabelSize: 4, 
                cOrder: 12, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_authorize3_position: { 
                cValidate :'', 
                cName: 'authorize3_position', 
                cLabel: 'Authorize Position III', 
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
            PI_authorize3_reff_no: { 
                cValidate :'', 
                cName: 'authorize3_reff_no', 
                cLabel: 'Authorize Reference No III', 
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
            PI_footer_remarks1: { 
                cValidate :'', 
                cName:'footer_remarks1', 
                cLabel:'Footer Remarks I', 
                cLabelSize: 4, 
                cOrder:15, 
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
            PI_footer_remarks2: { 
                cValidate :'', 
                cName:'footer_remarks2', 
                cLabel:'Footer Remarks II', 
                cLabelSize: 4, 
                cOrder:16, 
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
            PI_footer_remarks3: { 
                cValidate :'', 
                cName:'footer_remarks3', 
                cLabel:'Footer Remarks III', 
                cLabelSize: 4, 
                cOrder:17, 
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
            }
      //       , 

			// PTAnalysis: {
      //           cPageLevel: this.PageLevel,
      //           cTabIndex: this.TabIndex,
      //           cPageMasterSeq: this.data.PageMasterSeq,
      //           cFormPageNo: this.data.PageOrder
      //       }         
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
        Onauthorize1_idChange (data) {
        if (this.M_CM_DocAuthorizeUser.authorize1_id == data.id) return
        this.$nextTick(() => {
            this.M_CM_DocAuthorizeUser.authorize1_id = data.id
            this.M_CM_DocAuthorizeUser.authorize1_idLabel = data.label
            if (this.inputStatus != "VIEW") {
        this.M_CM_DocAuthorizeUser.authorize1_name = data.UserName
        this.M_CM_DocAuthorizeUser.authorize1_position = data.Position
        this.M_CM_DocAuthorizeUser.authorize1_reff_no = data.ReferenceNo

            }
        })
        this.$forceUpdate()
        },
        Onauthorize2_idChange (data) {
        if (this.M_CM_DocAuthorizeUser.authorize2_id == data.id) return
        this.$nextTick(() => {
            this.M_CM_DocAuthorizeUser.authorize2_id = data.id
            this.M_CM_DocAuthorizeUser.authorize2_idLabel = data.label
            if (this.inputStatus != "VIEW") {
        this.M_CM_DocAuthorizeUser.authorize2_name = data.UserName
        this.M_CM_DocAuthorizeUser.authorize2_position = data.Position
        this.M_CM_DocAuthorizeUser.authorize2_reff_no = data.ReferenceNo

            }
        })
        this.$forceUpdate()
        },
        Onauthorize3_idChange (data) {
        if (this.M_CM_DocAuthorizeUser.authorize3_id == data.id) return
        this.$nextTick(() => {
            this.M_CM_DocAuthorizeUser.authorize3_id = data.id
            this.M_CM_DocAuthorizeUser.authorize3_idLabel = data.label
            if (this.inputStatus != "VIEW") {
        this.M_CM_DocAuthorizeUser.authorize3_name = data.UserName
        this.M_CM_DocAuthorizeUser.authorize3_position = data.Position
        this.M_CM_DocAuthorizeUser.authorize3_reff_no = data.ReferenceNo

            }
        })
        this.$forceUpdate()
        },
        Onfooter_remarks1Change (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{footer_remarks1}
            }
        })
        this.$forceUpdate()
        },
        Onfooter_remarks2Change (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{footer_remarks2}
            }
        })
        this.$forceUpdate()
        },
        Onfooter_remarks3Change (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{footer_remarks3}
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
            this.M_CM_DocAuthorizeUser.subportfolio_cd = data.subportfolio_cd 
            this.propList.initialWhere =" subportfolio_cd = '" + data.subportfolio_cd + "' "
        

            this.FormToABSList().doGetList('','eb_getList')
        },		       
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                subportfolio_cd: this.M_CM_DocAuthorizeUser.subportfolio_cd,
                document_type: this.M_CM_DocAuthorizeUser.document_type,
                descs: this.M_CM_DocAuthorizeUser.descs,
                authorize1_id: this.M_CM_DocAuthorizeUser.authorize1_id == '' || this.M_CM_DocAuthorizeUser.authorize1_id == null ? 'NULL' : this.M_CM_DocAuthorizeUser.authorize1_id ,
                authorize2_id: this.M_CM_DocAuthorizeUser.authorize2_id == '' || this.M_CM_DocAuthorizeUser.authorize2_id == null ? 'NULL' : this.M_CM_DocAuthorizeUser.authorize2_id ,
                authorize3_id: this.M_CM_DocAuthorizeUser.authorize3_id == '' || this.M_CM_DocAuthorizeUser.authorize3_id == null ? 'NULL' : this.M_CM_DocAuthorizeUser.authorize3_id ,
                footer_remarks1: this.M_CM_DocAuthorizeUser.footer_remarks1,
                footer_remarks2: this.M_CM_DocAuthorizeUser.footer_remarks2,
                footer_remarks3: this.M_CM_DocAuthorizeUser.footer_remarks3,
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
                descs: this.M_CM_DocAuthorizeUser.descs,
                authorize1_id: this.M_CM_DocAuthorizeUser.authorize1_id == '' || this.M_CM_DocAuthorizeUser.authorize1_id == null ? 'NULL' : this.M_CM_DocAuthorizeUser.authorize1_id ,
                authorize2_id: this.M_CM_DocAuthorizeUser.authorize2_id == '' || this.M_CM_DocAuthorizeUser.authorize2_id == null ? 'NULL' : this.M_CM_DocAuthorizeUser.authorize2_id ,
                authorize3_id: this.M_CM_DocAuthorizeUser.authorize3_id == '' || this.M_CM_DocAuthorizeUser.authorize3_id == null ? 'NULL' : this.M_CM_DocAuthorizeUser.authorize3_id ,
                footer_remarks1: this.M_CM_DocAuthorizeUser.footer_remarks1,
                footer_remarks2: this.M_CM_DocAuthorizeUser.footer_remarks2,
                footer_remarks3: this.M_CM_DocAuthorizeUser.footer_remarks3,
                user_edit: this.getDataUser().user_id ,
                lastupdatestamp: this.M_CM_DocAuthorizeUser.lastupdatestamp,
                document_type: this.M_CM_DocAuthorizeUser.document_type,
                subportfolio_cd: this.getDataUser().subportfolio_cd                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })

        },
		M_ClearForm(){
            this.M_CM_DocAuthorizeUser = {
                subportfolio_cd: '',
                document_type: '',
                descs: '',
                authorize1_id: '',
                authorize1_name: '',
                authorize1_position: '',
                handphone1: '',
                authorize1_reff_no: '',
                footer_remarks1: '',
                authorize2_id: '',
                authorize2_name: '',
                authorize2_position: '',
                handphone2: '',
                authorize2_reff_no: '',
                footer_remarks2: '',
                authorize3_id: '',
                authorize3_name: '',
                authorize3_position: '',
                handphone3: '',
                authorize3_reff_no: '',
                footer_remarks3: '',
                user_input: '',
                user_edit: this.getDataUser().user_id,
                time_input: '',
                time_edit: '',
                lastupdatestamp: 0,
                row_id: 0
                    }
            		
		},
        M_New(){
            let data = this.$store.getters.GetPage1Data
            this.M_CM_DocAuthorizeUser.subportfolio_cd = data.subportfolio_cd 

            this.$refs.ref_document_type.focus()
        },
        M_Edit(){
          this.$refs.ref_descs.focus()
        },
        M_Delete(dt){           

        var data = this.FormToABSList().getRowSelected()  
        console.log(data)
        var dataDelete = []

        
        data.forEach((value) => {
          dataDelete.push({
            document_type: value.document_type,
            lastupdatestamp: value.lastupdatestamp,
            subportfolio_cd: value.subportfolio_cd,
            _Message_: ""
                  })
        })       
        
        var param = {
                  OptionSeq: this.getOptionSeq().OptionSeq,
                  LineNo: this.$parent.data.page_order,
                  Data: dataDelete
              }
              console.log(JSON.stringify(param,null,2))
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
,                document_type: record.document_type,
                subportfolio_cd: record.subportfolio_cd				
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
this.M_CM_DocAuthorizeUser = {
                subportfolio_cd: data.subportfolio_cd,
                document_type: data.document_type,
                descs: data.descs,
                authorize1_id: data.authorize1_id,
                authorize1_name: data.authorize1_name,
                authorize1_position: data.authorize1_position,
                handphone1: data.handphone1,
                authorize1_reff_no: data.authorize1_reff_no,
                footer_remarks1: data.footer_remarks1,
                authorize2_id: data.authorize2_id,
                authorize2_name: data.authorize2_name,
                authorize2_position: data.authorize2_position,
                handphone2: data.handphone2,
                authorize2_reff_no: data.authorize2_reff_no,
                footer_remarks2: data.footer_remarks2,
                authorize3_id: data.authorize3_id,
                authorize3_name: data.authorize3_name,
                authorize3_position: data.authorize3_position,
                handphone3: data.handphone3,
                authorize3_reff_no: data.authorize3_reff_no,
                footer_remarks3: data.footer_remarks3,
                user_input: data.user_input,
                user_edit: data.user_edit,
                time_input: data.time_input,
                time_edit: data.time_edit,
                lastupdatestamp: record.lastupdatestamp,
                row_id: data.row_id
                    }
                 

                this.M_CM_DocAuthorizeUser.authorize1_idLabel = this.M_CM_DocAuthorizeUser.authorize1_id != null ? data.authorize1_id + this.separator  :'' 
                this.M_CM_DocAuthorizeUser.authorize2_idLabel = this.M_CM_DocAuthorizeUser.authorize2_id != null ? data.authorize2_id + this.separator  :'' 
                this.M_CM_DocAuthorizeUser.authorize3_idLabel = this.M_CM_DocAuthorizeUser.authorize3_id != null ? data.authorize3_id + this.separator  :'' 
  

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

