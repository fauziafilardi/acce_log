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
                                        <ABSInputSelectList @change="OnsalutationcdChange" :prop="PI_salutationcd" :value="M_CM_ContactFamily.salutationcd" :label="M_CM_ContactFamily.salutationcdLabel" ref="ref_salutationcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_name" v-model="M_CM_ContactFamily.name"  ref="ref_name"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelect2 @change="OnrelationChange" :prop="PI_relation" :value="M_CM_ContactFamily.relation" :label="M_CM_ContactFamily.relationLabel" ref="ref_relation"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputDateVuex @input="OnbirthdateChange" :prop="PI_birthdate" v-model="M_CM_ContactFamily.birthdate"  ref="ref_birthdate" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OngenderChange" :prop="PI_gender" v-model="M_CM_ContactFamily.gender"  ref="ref_gender" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnnationalitycdChange" :prop="PI_nationalitycd" :value="M_CM_ContactFamily.nationalitycd" :label="M_CM_ContactFamily.nationalitycdLabel" ref="ref_nationalitycd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnreligioncdChange" :prop="PI_religioncd" :value="M_CM_ContactFamily.religioncd" :label="M_CM_ContactFamily.religioncdLabel" ref="ref_religioncd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_icno" v-model="M_CM_ContactFamily.icno"  ref="ref_icno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_handphone" v-model="M_CM_ContactFamily.handphone"  ref="ref_handphone"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_email" v-model="M_CM_ContactFamily.email"  ref="ref_email"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_CM_ContactFamily.remarks"  ref="ref_remarks" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSFileUpload :prop="PI_referencefilename" @fileName="getFileName" 
                                                                        v-model="M_CM_ContactFamily.referencefilename" 
                                                                        :file="M_CM_ContactFamily.picturefilename" 
                                                                        :image="M_CM_ContactFamily.referencefilename"
                                                                         ref="ref_referencefilename" />
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
    props: {PageLevel:'', TabIndex: '', data: ''},
    data() {
        return {
			ValKey:null,
            FormType: "List",
			Module:"CM",
            propList: {
                initialWhere:"contact_id = '" + this.ValKey + "'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_CM_ContactFamily :{
                contactid: '',
                sequenceno: 0,
                salutationcd: '',
                name: '',
                relation: '',
                birthdate: '',
                gender: 'M',
                nationalitycd: '',
                religioncd: '',
                icno: '',
                handphone: '',
                email: '',
                picturefilename: '',
                referencefilename: '',
                remarks: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                salutationdescs: '',
                nationalitydescs: '',
                religiondescs: '',
                timeedit: '',
                lastupdatestamp: 0,
                rowid: 0
                    }
            ,
            PI_salutationcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMSalutation'    , 
                    ColumnDB: 'salutation_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'salutationcddd', 
                cLabel: 'Salutation', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 101, 
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
                cMasterUrl: 'CM/CM_Salutation' ,
                cDisplayColumn: 'salutation_cd,descs' ,
            }, 
            PI_name: { 
                cValidate :'required|max:50', 
                cName: 'name', 
                cLabel: 'Name', 
                cLabelSize: 4, 
                cOrder: 102, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_relation: { 
                dataLookUp: null, 
                cValidate :'', 
                cName: 'relation', 
                cLabel: 'Relationship', 
                cLabelSize: 4, 
                cOrder: 103, 
                cKey: false, 
                cTriggered: false, 
                // cDefault: 'P', 
                cProtect: false, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cStatic: true, 
                cOption: [{ label: 'Parent', id: 'P' },{ label: 'Sibling', id: 'S' },{ label: 'Spouse', id: 'U' },{ label: 'Child', id: 'C' }], 
                cMasterUrl: '' ,
                cDisplayColumn: '' ,
            }, 
            PI_birthdate: { 
                cValidate :'', 
                cName: 'birthdate', 
                cLabel: 'Birth Date', 
                cLabelSize: 4, 
                cOrder: 104, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_gender: { 
                cValidate :'', 
                cName: 'genderfamily', 
                cId: 'rdbgenderfamily', 
                cRadioOptions: [{ text: 'Male', value: 'M' }, { text: 'Female', value: 'F' }], 
                cRadioDefaultOption: '', 
                cLabel:'Gender', 
                cLabelSize: 4, 
                cOrder: 105, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_nationalitycd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMNationality'    , 
                    ColumnDB: 'nationality_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'nationalitycd', 
                cLabel: 'Nationality', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 106, 
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
                cMasterUrl: 'CM/CM_Nationality' ,
                cDisplayColumn: 'nationality_cd,descs' ,
            }, 
            PI_religioncd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMReligion'    , 
                    ColumnDB: 'religion_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'religioncd', 
                cLabel: 'Religion', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 107, 
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
                cMasterUrl: 'CM/CM_Religion' ,
                cDisplayColumn: 'religion_cd,descs' ,
            }, 
            PI_icno: { 
                cValidate :'max:30', 
                cName: 'icno', 
                cLabel: 'IC Number', 
                cLabelSize: 4, 
                cOrder: 108, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_handphone: { 
                cValidate :'max:30', 
                cName: 'handphone', 
                cLabel: 'Handphone', 
                cLabelSize: 4, 
                cOrder: 109, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_email: { 
                cValidate :'max:60', 
                cName: 'email', 
                cLabel: 'Email', 
                cLabelSize: 4, 
                cOrder: 110, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_remarks: { 
                cValidate :'', 
                cName:'remarks', 
                cLabel:'Remarks', 
                cLabelSize: 4, 
                cOrder:111, 
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
            PI_referencefilename: { 
                cValidate :'', 
                cName:'referencefilename', 
                cLabel: 'Picture File', 
                cSubPortfolio:this.getDataUser().subportfolio_cd,
                cPath:"SaveLocation/SubPortfolio",
                cLabelSize: 4, 
                cOrder:112, 
                cVisible: true, 
                cModule: 'CM', 
                cPlaceholder: 'Choose a file...', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
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
  },
    methods: {
        OnsalutationcdChange (data) {
        this.$nextTick(() => {
            this.M_CM_ContactFamily.salutationcd = data.id
            this.M_CM_ContactFamily.salutationcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{salutationcd}
            }
        })
        this.$forceUpdate()
        },
        OnbirthdateChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{birthdate}
            }
        })
        this.$forceUpdate()
        },
        OngenderChange (data) {
            this.M_CM_ContactFamily.gender = data
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{gender}
            }
        })
        this.$forceUpdate()
        },
        OnnationalitycdChange (data) {
        this.$nextTick(() => {
            this.M_CM_ContactFamily.nationalitycd = data.id
            this.M_CM_ContactFamily.nationalitycdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{nationalitycd}
            }
        })
        this.$forceUpdate()
        },
        OnreligioncdChange (data) {
        this.$nextTick(() => {
            this.M_CM_ContactFamily.religioncd = data.id
            this.M_CM_ContactFamily.religioncdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{religioncd}
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
            this.M_CM_ContactFamily.contactid = data.contact_id 
            this.propList.initialWhere =" contact_id = '" + data.contact_id + "' "
        

            this.FormToABSList().doGetList('','eb_getList')
        },		       
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                contact_id: this.M_CM_ContactFamily.contactid,
                salutation_cd: this.M_CM_ContactFamily.salutationcd == '' || this.M_CM_ContactFamily.salutationcd == null ? 'NULL' : this.M_CM_ContactFamily.salutationcd ,
                name: this.M_CM_ContactFamily.name,
                relation: this.M_CM_ContactFamily.relation,
                birth_date: this.M_CM_ContactFamily.birthdate == '' || this.M_CM_ContactFamily.birthdate == null ? 'NULL' : this.M_CM_ContactFamily.birthdate ,
                gender: this.M_CM_ContactFamily.gender,
                nationality_cd: this.M_CM_ContactFamily.nationalitycd == '' || this.M_CM_ContactFamily.nationalitycd == null ? 'NULL' : this.M_CM_ContactFamily.nationalitycd ,
                religion_cd: this.M_CM_ContactFamily.religioncd == '' || this.M_CM_ContactFamily.religioncd == null ? 'NULL' : this.M_CM_ContactFamily.religioncd ,
                ic_no: this.M_CM_ContactFamily.icno,
                hand_phone: this.M_CM_ContactFamily.handphone,
                email: this.M_CM_ContactFamily.email,
                picture_file_name: this.M_CM_ContactFamily.picturefilename,
                reference_file_name: this.M_CM_ContactFamily.referencefilename,
                remarks: this.M_CM_ContactFamily.remarks,
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
            // console.log(this.M_CM_ContactFamily);
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                contact_id: this.M_CM_ContactFamily.contactid,
                sequence_no: this.M_CM_ContactFamily.sequenceno,
                salutation_cd: this.M_CM_ContactFamily.salutationcd == '' || this.M_CM_ContactFamily.salutationcd == null ? 'NULL' : this.M_CM_ContactFamily.salutationcd ,
                name: this.M_CM_ContactFamily.name,
                relation: this.M_CM_ContactFamily.relation,
                birth_date: this.M_CM_ContactFamily.birthdate == '' || this.M_CM_ContactFamily.birthdate == null ? 'NULL' : this.M_CM_ContactFamily.birthdate ,
                gender: this.M_CM_ContactFamily.gender,
                nationality_cd: this.M_CM_ContactFamily.nationalitycd == '' || this.M_CM_ContactFamily.nationalitycd == null ? 'NULL' : this.M_CM_ContactFamily.nationalitycd ,
                religion_cd: this.M_CM_ContactFamily.religioncd == '' || this.M_CM_ContactFamily.religioncd == null ? 'NULL' : this.M_CM_ContactFamily.religioncd ,
                ic_no: this.M_CM_ContactFamily.icno,
                hand_phone: this.M_CM_ContactFamily.handphone,
                email: this.M_CM_ContactFamily.email,
                picture_file_name: this.M_CM_ContactFamily.picturefilename,
                reference_file_name: this.M_CM_ContactFamily.referencefilename,
                remarks: this.M_CM_ContactFamily.remarks,
                user_edit: this.getDataUser().user_id ,
                lastupdatestamp: this.M_CM_ContactFamily.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_CM_ContactFamily = {
                contactid: '',
                sequenceno: 0,
                salutationcd: '',
                name: '',
                relation: 'P',
                birthdate: '',
                gender: 'M',
                nationalitycd: '',
                religioncd: '',
                icno: '',
                handphone: '',
                email: '',
                picturefilename: '',
                referencefilename: '',
                remarks: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                salutationdescs: '',
                nationalitydescs: '',
                religiondescs: '',
                timeedit: '',
                lastupdatestamp: 0,
                rowid: 0
                    }
            		
		},
        M_New(){
            let data = this.$store.getters.GetPage1Data
            this.M_CM_ContactFamily.contactid = data.contact_id

            this.$refs.ref_salutationcd.focus()

        },
        M_Edit(){
            this.$refs.ref_salutationcd.focus()
        },
        M_Delete(dt){           

        var data = this.FormToABSList().getRowSelected()  
        var dataDelete = []

        
        data.forEach((value) => {
            // console.log(value);
          dataDelete.push({
          contact_id: value.contact_id,
          sequence_no: value.sequence_no,
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
            // console.log(record);
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order
,                contact_id: record.contact_id,
                sequence_no: record.sequence_no				
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
                // console.log(data);
this.M_CM_ContactFamily = {
                contactid: data.contact_id,
                sequenceno: data.sequence_no,
                salutationcd: data.salutation_cd,
                name: data.name,
                relation: data.relation,
                birthdate: data.birth_date,
                gender: data.gender,
                nationalitycd: data.nationality_cd,
                religioncd: data.religion_cd,
                icno: data.ic_no,
                handphone: data.hand_phone,
                email: data.email,
                picturefilename: data.picture_file_name,
                referencefilename: data.reference_file_name,
                remarks: data.remarks,
                userinput: data.user_input,
                useredit: data.user_edit,
                salutationdescs: data.salutation_descs,
                nationalitydescs: data.nationality_descs,
                religiondescs: data.religion_descs,
                timeedit: data.time_edit,
                lastupdatestamp: data.lastupdatestamp,
                rowid: data.row_id
                    }
                 

                this.M_CM_ContactFamily.salutationcdLabel = this.M_CM_ContactFamily.salutationcd != null ? data.salutation_cd + this.separator + data.salutation_descs :'' 
                this.M_CM_ContactFamily.nationalitycdLabel = this.M_CM_ContactFamily.nationalitycd != null ? data.nationality_cd + this.separator + data.nationality_descs :'' 
                this.M_CM_ContactFamily.religioncdLabel = this.M_CM_ContactFamily.religioncd != null ? data.religion_cd + this.separator + data.religion_descs :'' 
  

                this.IEBy.Input = data.user_input
                this.IEBy.Edit = data.user_edit

            })
        }
        ,getFileName(fileName) {
         this.CM_ContactFamily.picturefilename = fileName 
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

