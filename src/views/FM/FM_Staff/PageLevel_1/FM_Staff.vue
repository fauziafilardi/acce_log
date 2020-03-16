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
                                <b-col md="6" id="col-left">
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_staff_no" v-model="M_FM_Staff.staff_no"  ref="ref_staff_no"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Oncm_staff_type_idChange" :prop="PI_cm_staff_type_id" :value="M_FM_Staff.cm_staff_type_id" :label="M_FM_Staff.cm_staff_type_idLabel" ref="ref_cm_staff_type_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_name" v-model="M_FM_Staff.name"  ref="ref_name"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_nik" v-model="M_FM_Staff.nik"  ref="ref_nik"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputDateVuex @input="Onterminate_dateChange" :prop="PI_terminate_date" v-model="M_FM_Staff.terminate_date"  ref="ref_terminate_date" />
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputDateVuex @input="Onjoin_dateChange" :prop="PI_join_date" v-model="M_FM_Staff.join_date"  ref="ref_join_date" />
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_weight" v-model="M_FM_Staff.weight"  ref="ref_weight"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSTextAreaVuex @input="OnaddressChange" :prop="PI_address" v-model="M_FM_Staff.address"  ref="ref_address" />
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Oncm_city_idChange" :prop="PI_cm_city_id" :value="M_FM_Staff.cm_city_id" :label="M_FM_Staff.cm_city_idLabel" ref="ref_cm_city_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputRadioButtonVuex @input="OngenderChange" :prop="PI_gender" v-model="M_FM_Staff.gender"  ref="ref_gender" />
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Oncm_staff_master_idChange" :prop="PI_cm_staff_master_id" :value="M_FM_Staff.cm_staff_master_id" :label="M_FM_Staff.cm_staff_master_idLabel" ref="ref_cm_staff_master_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Onss_user_idChange" :prop="PI_ss_user_id" :value="M_FM_Staff.ss_user_id" :label="M_FM_Staff.ss_user_idLabel" ref="ref_ss_user_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_FM_Staff.remarks"  ref="ref_remarks" />
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_email" v-model="M_FM_Staff.email"  ref="ref_email"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputRadioButtonVuex @input="OnstatusChange" :prop="PI_status" v-model="M_FM_Staff.status"  ref="ref_status" />
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_handphone" v-model="M_FM_Staff.handphone"  ref="ref_handphone"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_total_distense_driven" v-model="M_FM_Staff.total_distense_driven"  ref="ref_total_distense_driven"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_total_fuel_use" v-model="M_FM_Staff.total_fuel_use"  ref="ref_total_fuel_use"/>
                                    </b-col>
                                  </b-row>
                                </b-col>

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
		Module:"FM",
            propList: {
                initialWhere: "",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
            running_staff_no: null,
       
            IEBy: {Input: '', Edit: ''},   			
            M_FM_Staff: {
              subportfolio_cd: '',
              cm_staff_id: 0,
              staff_no: '',
              cm_staff_type_id: 0,
              cm_staff_type_id_cd: '',
              cm_staff_type_id_descs: '',
              name: '',
              nik: '',
              terminate_date: '',
              join_date: '',
              weight: 0.00,
              address: '',
              cm_city_id: 0,
              cm_city_id_cd: '',
              cm_city_id_descs: '',
              gender: '',
              cm_staff_master_id: 0,
              cm_staff_master_id_cd: '',
              cm_staff_master_id_descs: '',
              ss_user_id: 0,
              ss_user_id_cd: '',
              ss_user_id_descs: '',
              remarks: '',
              email: '',
              status: '',
              handphone: '',
              total_distense_driven: 0.00,
              total_fuel_use: 0.00,
              row_id: 0,
              lastupdatestamp: 0,
              time_edit: '',
              user_input: '',
              user_edit: '',
            },
            PI_staff_no: { 
                cValidate :'required|max:20', 
                cName: 'staff_no', 
                cLabel: 'Staff No', 
                cLabelSize: 4, 
                cOrder: 1, 
                cKey: true, 
                cType: 'text',
                cVisible: true, 
                cDefault: '', 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_cm_staff_type_id: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupFMStaffType'    , 
                    ColumnDB: 'staff_type'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'staff_type,descs' 
                        }, 
                cValidate :'required', 
                cName: 'cm_staff_type_id', 
                cLabel: 'Staff Type', 
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
                cMasterUrl: 'FM/FM_StaffType' ,
                cDisplayColumn: 'staff_type,descs' ,
            }, 

            PI_name: { 
                cValidate :'required|max:60', 
                cName: 'name', 
                cLabel: 'Name', 
                cLabelSize: 4, 
                cOrder: 3, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cDefault: '', 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_nik: { 
                cValidate :'max:20', 
                cName: 'nik', 
                cLabel: 'NIK', 
                cLabelSize: 4, 
                cOrder: 4, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cDefault: '', 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_terminate_date: { 
                cValidate :'', 
                cName: 'terminate_date', 
                cLabel: 'Terminate Date', 
                cLabelSize: 4, 
                cOrder: 5, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_join_date: { 
                cValidate :'', 
                cName: 'join_date', 
                cLabel: 'Join Date', 
                cLabelSize: 4, 
                cOrder: 6, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_weight: { 
                cValidate :'', 
                cName: 'weight', 
                cLabel: 'Weight', 
                cLabelSize: 4, 
                cOrder: 7, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cDefault: '', 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_address: { 
                cValidate :'', 
                cName:'address', 
                cLabel:'Address', 
                cLabelSize: 4, 
                cOrder:8, 
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

            PI_cm_city_id: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMCity'    , 
                    ColumnDB: 'city_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'city_cd,descs' 
                        }, 
                cValidate :'', 
                cName: 'cm_city_id', 
                cLabel: 'City', 
                cKey: false, 
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
                cDisplayColumn: 'city_cd,descs' ,
            }, 

            PI_gender: { 
                cValidate :'', 
                cName: 'gender', 
                cId: 'rdbgender', 
                cRadioOptions: [{ text: 'Male', value: 'M' }, { text: 'Female', value: 'F' }], 
                cRadioDefaultOption: '', 
                cLabel:'Gender', 
                cLabelSize: 4, 
                cDefault: '', 
                cOrder: 10, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_cm_staff_master_id: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupFMStaffMaster'    , 
                    ColumnDB: 'staff_no'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'staff_no,name' 
                        }, 
                cValidate :'', 
                cName: 'cm_staff_master_id', 
                cLabel: 'Recruiter Staff', 
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
                cDisplayColumn: 'staff_no,name' ,
            }, 

            PI_ss_user_id: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupSSUser'    , 
                    ColumnDB: 'user_id'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: '' 
                        }, 
                cValidate :'', 
                cName: 'ss_user_id', 
                cLabel: 'User Id', 
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
                cDisplayColumn: '' ,
            }, 

            PI_remarks: { 
                cValidate :'', 
                cName:'remarks', 
                cLabel:'Remarks', 
                cLabelSize: 4, 
                cOrder:13, 
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

            PI_email: { 
                cValidate :'max:20', 
                cName: 'email', 
                cLabel: 'Email', 
                cLabelSize: 4, 
                cOrder: 14, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cDefault: '', 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_status: { 
                cValidate :'', 
                cName: 'status', 
                cId: 'rdbstatus', 
                cRadioOptions: [{ text: 'Active', value: 'A' }, { text: 'Non Active', value: 'N' }], 
                cRadioDefaultOption: '', 
                cLabel:'Status', 
                cLabelSize: 4, 
                cDefault: '', 
                cOrder: 15, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_handphone: { 
                cValidate :'max:20', 
                cName: 'handphone', 
                cLabel: 'Hand Phone', 
                cLabelSize: 4, 
                cOrder: 16, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cDefault: '', 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_total_distense_driven: { 
                cValidate :'', 
                cName: 'total_distense_driven', 
                cLabel: 'Total Distance Driven', 
                cLabelSize: 4, 
                cOrder: 17, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cDefault: '', 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_total_fuel_use: { 
                cValidate :'', 
                cName: 'total_fuel_use', 
                cLabel: 'Total Fue Use', 
                cLabelSize: 4, 
                cOrder: 18, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cDefault: '', 
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
	},
	GetDataBy1(){
		return this.$store.getters.GetPage1GetDataBy
	}
  },
    methods: {		
        GetFMSpecification () {
          var param = {
            subportfolio_cd: this.getDataUser().subportfolio_cd,
            module_cd: this.Module
          }

          this.FnDynamicSpec(param)
          .then(ress => {
            if (ress == null) {
              this.PI_staff_no.cProtect = false
              this.M_FM_Staff.staff_no= ""
              this.$refs.ref_staff_no.focus()
            }
            else {
              var data = ress.Data[0]
              this.running_staff_no = data.running_staff_no
              if (this.running_staff_no && this.running_staff_no !== "" && this.running_staff_no > 0) {
                this.PI_staff_no.cProtect = true
                this.M_FM_Staff.staff_no= "(auto)"
              }
            }
          })
        },
        Oncm_staff_type_idChange (data) {
          this.$nextTick(() => {
            this.M_FM_Staff.cm_staff_type_id = data.id
            this.M_FM_Staff.cm_staff_type_idLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{cm_staff_type_id}
            }
          })
          this.$forceUpdate()
        },
        Onterminate_dateChange (data) {
          this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              //{terminate_date}
            }
          })
          this.$forceUpdate()
        },
        Onjoin_dateChange (data) {
          this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              //{join_date}
            }
          })
          this.$forceUpdate()
        },
        OnaddressChange (data) {
          this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              //{address}
            }
          })
          this.$forceUpdate()
        },
        Oncm_city_idChange (data) {
          this.$nextTick(() => {
            this.M_FM_Staff.cm_city_id = data.id
            this.M_FM_Staff.cm_city_idLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{cm_city_id}
            }
          })
          this.$forceUpdate()
        },
        OngenderChange (data) {
          this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              //{gender}
            }
          })
          this.$forceUpdate()
        },
        Oncm_staff_master_idChange (data) {
          this.$nextTick(() => {
            this.M_FM_Staff.cm_staff_master_id = data.id
            this.M_FM_Staff.cm_staff_master_idLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{cm_staff_master_id}
            }
          })
          this.$forceUpdate()
        },
        Onss_user_idChange (data) {
          this.$nextTick(() => {
            this.M_FM_Staff.ss_user_id = data.id
            this.M_FM_Staff.ss_user_idLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{ss_user_id}
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
        OnstatusChange (data) {
          this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              //{status}
            }
          })
          this.$forceUpdate()
        },
	
		setToolbarButton () {
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
        },		
		paramFromParent(){
        },	
		M_CheckboxChecked(data, status, index){

        },		
        M_Post(dt){
        },
        M_Insert() {
          if (this.running_staff_no && this.running_staff_no != "" && this.running_staff_no > 0) {
            var param = {
              OptionFunctionCd: "GenerateRunningCodeById",
              ModuleCd: "CM",
              subportfolio_cd: this.getDataUser().subportfolio_cd,
              running_id: this.running_staff_no,
              user_input: this.getDataUser().user_id,
              date: this.getToday()
            }

            this.FnDynamicFunction(param)
            .then(ress => {
              if (ress == null) return

              var data = ress.Data[0]
              this.M_FM_Staff.staff_no = data._generate_running_code_id

                          var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                staff_no: this.M_FM_Staff.staff_no,
                cm_staff_type_id: this.M_FM_Staff.cm_staff_type_id == '' || this.M_FM_Staff.cm_staff_type_id == null ? 'NULL' : this.M_FM_Staff.cm_staff_type_id,
                name: this.M_FM_Staff.name,
                nik: this.M_FM_Staff.nik,
                terminate_date: this.M_FM_Staff.terminate_date == '' || this.M_FM_Staff.terminate_date == null ? 'NULL' : this.M_FM_Staff.terminate_date,
                join_date: this.M_FM_Staff.join_date == '' || this.M_FM_Staff.join_date == null ? 'NULL' : this.M_FM_Staff.join_date,
                weight: parseFloat(this.M_FM_Staff.weight ? this.replaceAllString(this.M_FM_Staff.weight, ',', '', 'number') : 0),
                address: this.M_FM_Staff.address,
                cm_city_id: this.M_FM_Staff.cm_city_id == '' || this.M_FM_Staff.cm_city_id == null ? 'NULL' : this.M_FM_Staff.cm_city_id,
                gender: this.M_FM_Staff.gender,
                cm_staff_master_id: this.M_FM_Staff.cm_staff_master_id == '' || this.M_FM_Staff.cm_staff_master_id == null ? 'NULL' : this.M_FM_Staff.cm_staff_master_id,
                ss_user_id: this.M_FM_Staff.ss_user_id == '' || this.M_FM_Staff.ss_user_id == null ? 'NULL' : this.M_FM_Staff.ss_user_id,
                remarks: this.M_FM_Staff.remarks,
                email: this.M_FM_Staff.email,
                status: this.M_FM_Staff.status,
                handphone: this.M_FM_Staff.handphone,
                total_distense_driven: parseFloat(this.M_FM_Staff.total_distense_driven ? this.replaceAllString(this.M_FM_Staff.total_distense_driven, ',', '', 'number') : 0),
                total_fuel_use: parseFloat(this.M_FM_Staff.total_fuel_use ? this.replaceAllString(this.M_FM_Staff.total_fuel_use, ',', '', 'number') : 0),
                user_input: this.getDataUser().user_id,

            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return
				
                this.$parent.resultInsert(response.Message)
				
            })
            })
          }
          else {
                        var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                staff_no: this.M_FM_Staff.staff_no,
                cm_staff_type_id: this.M_FM_Staff.cm_staff_type_id == '' || this.M_FM_Staff.cm_staff_type_id == null ? 'NULL' : this.M_FM_Staff.cm_staff_type_id,
                name: this.M_FM_Staff.name,
                nik: this.M_FM_Staff.nik,
                terminate_date: this.M_FM_Staff.terminate_date == '' || this.M_FM_Staff.terminate_date == null ? 'NULL' : this.M_FM_Staff.terminate_date,
                join_date: this.M_FM_Staff.join_date == '' || this.M_FM_Staff.join_date == null ? 'NULL' : this.M_FM_Staff.join_date,
                weight: parseFloat(this.M_FM_Staff.weight ? this.replaceAllString(this.M_FM_Staff.weight, ',', '', 'number') : 0),
                address: this.M_FM_Staff.address,
                cm_city_id: this.M_FM_Staff.cm_city_id == '' || this.M_FM_Staff.cm_city_id == null ? 'NULL' : this.M_FM_Staff.cm_city_id,
                gender: this.M_FM_Staff.gender,
                cm_staff_master_id: this.M_FM_Staff.cm_staff_master_id == '' || this.M_FM_Staff.cm_staff_master_id == null ? 'NULL' : this.M_FM_Staff.cm_staff_master_id,
                ss_user_id: this.M_FM_Staff.ss_user_id == '' || this.M_FM_Staff.ss_user_id == null ? 'NULL' : this.M_FM_Staff.ss_user_id,
                remarks: this.M_FM_Staff.remarks,
                email: this.M_FM_Staff.email,
                status: this.M_FM_Staff.status,
                handphone: this.M_FM_Staff.handphone,
                total_distense_driven: parseFloat(this.M_FM_Staff.total_distense_driven ? this.replaceAllString(this.M_FM_Staff.total_distense_driven, ',', '', 'number') : 0),
                total_fuel_use: parseFloat(this.M_FM_Staff.total_fuel_use ? this.replaceAllString(this.M_FM_Staff.total_fuel_use, ',', '', 'number') : 0),
                user_input: this.getDataUser().user_id,

            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return
				
                this.$parent.resultInsert(response.Message)
				
            })
          }

        },
        M_Update() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                cm_staff_id: this.M_FM_Staff.cm_staff_id,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                staff_no: this.M_FM_Staff.staff_no,
                cm_staff_type_id: this.M_FM_Staff.cm_staff_type_id == '' || this.M_FM_Staff.cm_staff_type_id == null ? 'NULL' : this.M_FM_Staff.cm_staff_type_id,
                name: this.M_FM_Staff.name,
                nik: this.M_FM_Staff.nik,
                terminate_date: this.M_FM_Staff.terminate_date == '' || this.M_FM_Staff.terminate_date == null ? 'NULL' : this.M_FM_Staff.terminate_date,
                join_date: this.M_FM_Staff.join_date == '' || this.M_FM_Staff.join_date == null ? 'NULL' : this.M_FM_Staff.join_date,
                weight: parseFloat(this.M_FM_Staff.weight ? this.replaceAllString(this.M_FM_Staff.weight, ',', '', 'number') : 0),
                address: this.M_FM_Staff.address,
                cm_city_id: this.M_FM_Staff.cm_city_id == '' || this.M_FM_Staff.cm_city_id == null ? 'NULL' : this.M_FM_Staff.cm_city_id,
                gender: this.M_FM_Staff.gender,
                cm_staff_master_id: this.M_FM_Staff.cm_staff_master_id == '' || this.M_FM_Staff.cm_staff_master_id == null ? 'NULL' : this.M_FM_Staff.cm_staff_master_id,
                ss_user_id: this.M_FM_Staff.ss_user_id == '' || this.M_FM_Staff.ss_user_id == null ? 'NULL' : this.M_FM_Staff.ss_user_id,
                remarks: this.M_FM_Staff.remarks,
                email: this.M_FM_Staff.email,
                status: this.M_FM_Staff.status,
                handphone: this.M_FM_Staff.handphone,
                total_distense_driven: parseFloat(this.M_FM_Staff.total_distense_driven ? this.replaceAllString(this.M_FM_Staff.total_distense_driven, ',', '', 'number') : 0),
                total_fuel_use: parseFloat(this.M_FM_Staff.total_fuel_use ? this.replaceAllString(this.M_FM_Staff.total_fuel_use, ',', '', 'number') : 0),
                lastupdatestamp: this.M_FM_Staff.lastupdatestamp,
                user_edit: this.getDataUser().user_id,

            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return
				
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_FM_Staff = {
              subportfolio_cd: '',
              cm_staff_id: 0,
              staff_no: '',
              cm_staff_type_id: 0,
              cm_staff_type_id_cd: '',
              cm_staff_type_id_descs: '',
              name: '',
              nik: '',
              terminate_date: '',
              join_date: '',
              weight: 0.00,
              address: '',
              cm_city_id: 0,
              cm_city_id_cd: '',
              cm_city_id_descs: '',
              gender: '',
              cm_staff_master_id: 0,
              cm_staff_master_id_cd: '',
              cm_staff_master_id_descs: '',
              ss_user_id: 0,
              ss_user_id_cd: '',
              ss_user_id_descs: '',
              remarks: '',
              email: '',
              status: '',
              handphone: '',
              total_distense_driven: 0.00,
              total_fuel_use: 0.00,
              row_id: 0,
              lastupdatestamp: 0,
              time_edit: '',
              user_input: '',
              user_edit: '',
            }
		},
        M_New(){
          this.GetFMSpecification()

        },
        M_Edit(){
        },
        M_Delete(dt){       
			var data = this.FormToABSList().getRowSelected()  
			var dataDelete = []

			
			data.forEach((value) => {

				
				dataDelete.push({
                cm_staff_id: value.cm_staff_id,
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

                this.$parent.resultDelete()
            })           
        },        
        getDataBy (record) {
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                cm_staff_id: record.cm_staff_id,

            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                this.M_FM_Staff = {
                  subportfolio_cd: data.subportfolio_cd,
                  cm_staff_id: data.cm_staff_id,
                  staff_no: data.staff_no,
                  cm_staff_type_id: data.cm_staff_type_id,
                  cm_staff_type_id_cd: data.cm_staff_type_id_cd,
                  cm_staff_type_id_descs: data.cm_staff_type_id_descs,
                  name: data.name,
                  nik: data.nik,
                  terminate_date: data.terminate_date,//this.momentDateFormatting(data.terminate_date, 'YYYY-MM-DD'),
                  join_date: data.join_date,//this.momentDateFormatting(data.join_date, 'YYYY-MM-DD'),
                  weight: this.isCurrency(data.weight, this.decimal),
                  address: data.address,
                  cm_city_id: data.cm_city_id,
                  cm_city_id_cd: data.cm_city_id_cd,
                  cm_city_id_descs: data.cm_city_id_descs,
                  gender: data.gender,
                  cm_staff_master_id: data.cm_staff_master_id,
                  cm_staff_master_id_cd: data.cm_staff_master_id_cd,
                  cm_staff_master_id_descs: data.cm_staff_master_id_descs,
                  ss_user_id: data.ss_user_id,
                  ss_user_id_cd: data.ss_user_id_cd,
                  ss_user_id_descs: data.ss_user_id_descs,
                  remarks: data.remarks,
                  email: data.email,
                  status: data.status,
                  handphone: data.handphone,
                  total_distense_driven: this.isCurrency(data.total_distense_driven, this.decimal),
                  total_fuel_use: this.isCurrency(data.total_fuel_use, this.decimal),
                  row_id: data.row_id,
                  lastupdatestamp: record.lastupdatestamp,
                  time_edit: this.momentDateFormatting(data.time_edit, 'YYYY-MM-DD'),
                  user_input: data.user_input,
                  user_edit: data.user_edit,
                }

                this.M_FM_Staff.cm_staff_type_idLabel = this.M_FM_Staff.cm_staff_type_id_cd != null && this.M_FM_Staff.cm_staff_type_id_cd != '' ? data.cm_staff_type_id_cd + this.separator + data.cm_staff_type_id_descs :'' 
                this.M_FM_Staff.cm_city_idLabel = this.M_FM_Staff.cm_city_id_cd != null && this.M_FM_Staff.cm_city_id_cd != '' ? data.cm_city_id_cd + this.separator + data.cm_city_id_descs :'' 
                this.M_FM_Staff.cm_staff_master_idLabel = this.M_FM_Staff.cm_staff_master_id_cd != null && this.M_FM_Staff.cm_staff_master_id_cd != '' ? data.cm_staff_master_id_cd + this.separator + data.cm_staff_master_id_descs :'' 
                this.M_FM_Staff.ss_user_idLabel = this.M_FM_Staff.ss_user_id_cd != null && this.M_FM_Staff.ss_user_id_cd != '' ? data.ss_user_id_cd + this.separator + data.ss_user_id_descs :'' 


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

