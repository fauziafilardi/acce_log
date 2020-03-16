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
                                      <ABSInputSelectList @change="Onfm_license_type_idChange" :prop="PI_fm_license_type_id" :value="M_FM_StaffLicense.fm_license_type_id" :label="M_FM_StaffLicense.fm_license_type_idLabel" ref="ref_fm_license_type_id"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_license_no" v-model="M_FM_StaffLicense.license_no"  ref="ref_license_no"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSTextAreaVuex @input="OnaddressChange" :prop="PI_address" v-model="M_FM_StaffLicense.address"  ref="ref_address" />
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_birth_city" v-model="M_FM_StaffLicense.birth_city"  ref="ref_birth_city"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputDateVuex @input="Onbirth_dateChange" :prop="PI_birth_date" v-model="M_FM_StaffLicense.birth_date"  ref="ref_birth_date" />
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputDateVuex @input="Onexpired_dateChange" :prop="PI_expired_date" v-model="M_FM_StaffLicense.expired_date"  ref="ref_expired_date" />
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
    props: {PageLevel:'', TabIndex: '', data: ''},
    data() {
        return {
			ValKey:null,
            FormType: "List",
			Module:"FM",
            propList: {
                initialWhere:"fm_license_type_id = '" + this.ValKey + "'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			
            M_FM_StaffLicense: {
              cm_staff_license_id: 0,
              subportfolio_cd: '',
              fm_license_type_id: 0,
              fm_license_type_id_cd: '',
              fm_license_type_id_descs: '',
              license_no: '',
              address: '',
              birth_city: '',
              birth_date: '',
              expired_date: '',
              row_id: 0,
              lastupdatestamp: 0,
              time_edit: '',
              user_input: '',
              user_edit: '',
            },
            PI_fm_license_type_id: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupFMLicenseType'    , 
                    ColumnDB: 'license_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'license_cd,descs' 
                        }, 
                cValidate :'', 
                cName: 'fm_license_type_id', 
                cLabel: 'License Type', 
                cKey: true, 
                cLabelSize: 4, 
                cOrder: 1, 
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
                cMasterUrl: 'FM/FM_LicenseType' ,
                cDisplayColumn: 'license_cd,descs' ,
            }, 

            PI_license_no: { 
                cValidate :'required|max:20', 
                cName: 'license_no', 
                cLabel: 'License No', 
                cLabelSize: 4, 
                cOrder: 2, 
                cKey: true, 
                cType: 'text',
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
                cOrder:3, 
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

            PI_birth_city: { 
                cValidate :'max:60', 
                cName: 'birth_city', 
                cLabel: 'Birth City', 
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

            PI_birth_date: { 
                cValidate :'', 
                cName: 'birth_date', 
                cLabel: 'Birth Date', 
                cLabelSize: 4, 
                cOrder: 5, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_expired_date: { 
                cValidate :'required', 
                cName: 'expired_date', 
                cLabel: 'Expired Date', 
                cLabelSize: 4, 
                cOrder: 6, 
                cKey: false, 
                cVisible:  true, 
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
        Onfm_license_type_idChange (data) {
          this.$nextTick(() => {
            this.M_FM_StaffLicense.fm_license_type_id = data.id
            this.M_FM_StaffLicense.fm_license_type_idLabel = data.label
            if (this.inputStatus != "VIEW") {
              //{fm_license_type_id}
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
        Onbirth_dateChange (data) {
          this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              //{birth_date}
            }
          })
          this.$forceUpdate()
        },
        Onexpired_dateChange (data) {
          this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              //{expired_date}
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
            this.$parent.showForm = false
			
            let data = this.$store.getters.GetPage1Data
            this.M_FM_StaffLicense.fm_license_type_id = data.fm_license_type_id 
            this.propList.initialWhere =" cm_staff_id = '" + data.cm_staff_id + "' "


            this.FormToABSList().doGetList('','eb_getList')
        },		
		M_CheckboxChecked(data, status, index){

        },		
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                license_no: this.M_FM_StaffLicense.license_no,
                fm_license_type_id: this.M_FM_StaffLicense.fm_license_type_id == '' || this.M_FM_StaffLicense.fm_license_type_id == null ? 'NULL' : this.M_FM_StaffLicense.fm_license_type_id,
                address: this.M_FM_StaffLicense.address,
                birth_city: this.M_FM_StaffLicense.birth_city,
                birth_date: this.M_FM_StaffLicense.birth_date == '' || this.M_FM_StaffLicense.birth_date == null ? 'NULL' : this.M_FM_StaffLicense.birth_date,
                expired_date: this.M_FM_StaffLicense.expired_date == '' || this.M_FM_StaffLicense.expired_date == null ? 'NULL' : this.M_FM_StaffLicense.expired_date,
                user_input: this.getDataUser().user_id,
                cm_staff_id: this.DataRowPage1.cm_staff_id

            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return
				
                this.$parent.resultInsert(response.Message)
				
            })
        },
        M_Update() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                cm_staff_license_id: this.M_FM_StaffLicense.cm_staff_license_id,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                license_no: this.M_FM_StaffLicense.license_no,
                fm_license_type_id: this.M_FM_StaffLicense.fm_license_type_id == '' || this.M_FM_StaffLicense.fm_license_type_id == null ? 'NULL' : this.M_FM_StaffLicense.fm_license_type_id,
                address: this.M_FM_StaffLicense.address,
                birth_city: this.M_FM_StaffLicense.birth_city,
                birth_date: this.M_FM_StaffLicense.birth_date == '' || this.M_FM_StaffLicense.birth_date == null ? 'NULL' : this.M_FM_StaffLicense.birth_date,
                expired_date: this.M_FM_StaffLicense.expired_date == '' || this.M_FM_StaffLicense.expired_date == null ? 'NULL' : this.M_FM_StaffLicense.expired_date,
                lastupdatestamp: this.M_FM_StaffLicense.lastupdatestamp,
                user_edit: this.getDataUser().user_id,

            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return
				
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_FM_StaffLicense = {
              cm_staff_license_id: 0,
              subportfolio_cd: '',
              fm_license_type_id: 0,
              fm_license_type_id_cd: '',
              fm_license_type_id_descs: '',
              license_no: '',
              address: '',
              birth_city: '',
              birth_date: '',
              expired_date: '',
              row_id: 0,
              lastupdatestamp: 0,
              time_edit: '',
              user_input: '',
              user_edit: '',
            }
		},
        M_New(){
            let data = this.$store.getters.GetPage1Data
            this.M_FM_StaffLicense.fm_license_type_id = data.fm_license_type_id 



        },
        M_Edit(){
        },
        M_Delete(dt){           
			var data = this.FormToABSList().getRowSelected()  
			var dataDelete = []

			
			data.forEach((value) => {

				
				dataDelete.push({
                cm_staff_license_id: value.cm_staff_license_id,
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
                cm_staff_license_id: record.cm_staff_license_id,

            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
                this.M_FM_StaffLicense = {
                  cm_staff_license_id: data.cm_staff_license_id,
                  subportfolio_cd: data.subportfolio_cd,
                  fm_license_type_id: data.fm_license_type_id,
                  fm_license_type_id_cd: data.fm_license_type_id_cd,
                  fm_license_type_id_descs: data.fm_license_type_id_descs,
                  license_no: data.license_no,
                  address: data.address,
                  birth_city: data.birth_city,
                  birth_date: this.momentDateFormatting(data.birth_date, 'YYYY-MM-DD'),
                  expired_date: this.momentDateFormatting(data.expired_date, 'YYYY-MM-DD'),
                  row_id: data.row_id,
                  lastupdatestamp: record.lastupdatestamp,
                  time_edit: this.momentDateFormatting(data.time_edit, 'YYYY-MM-DD'),
                  user_input: data.user_input,
                  user_edit: data.user_edit,
                }

                this.M_FM_StaffLicense.fm_license_type_idLabel = this.M_FM_StaffLicense.fm_license_type_id_cd != null && this.M_FM_StaffLicense.fm_license_type_id_cd != '' ? data.fm_license_type_id_cd + this.separator + data.fm_license_type_id_descs :'' 


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

