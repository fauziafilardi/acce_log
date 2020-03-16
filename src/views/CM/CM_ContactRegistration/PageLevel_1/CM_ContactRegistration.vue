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
                                        <ABSInputSelectList @change="OncontactclasscdChange" :prop="PI_contactclasscd" :value="M_CM_ContactRegistration.contactclasscd" :label="M_CM_ContactRegistration.contactclasscdLabel" ref="ref_contactclasscd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnclassificationidChange" :prop="PI_classificationid" v-model="M_CM_ContactRegistration.classificationid"  ref="ref_classificationid" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnparentidChange" :prop="PI_parentid" :value="M_CM_ContactRegistration.parentid" :label="M_CM_ContactRegistration.parentidLabel" ref="ref_parentid"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OncategoryChange" :prop="PI_category" v-model="M_CM_ContactRegistration.category"  ref="ref_category" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OngovernmentChange" :prop="PI_government" v-model="M_CM_ContactRegistration.government"  ref="ref_government" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_name" v-model="M_CM_ContactRegistration.name"  ref="ref_name"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_website" v-model="M_CM_ContactRegistration.website"  ref="ref_website"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OntaxcollectableChange" :prop="PI_taxcollectable" v-model="M_CM_ContactRegistration.taxcollectable"  ref="ref_taxcollectable" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_taxno" v-model="M_CM_ContactRegistration.taxno"  ref="ref_taxno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_taxreferenceno" v-model="M_CM_ContactRegistration.taxreferenceno"  ref="ref_taxreferenceno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputDateVuex @input="OntaxregistrationdateChange" :prop="PI_taxregistrationdate" v-model="M_CM_ContactRegistration.taxregistrationdate"  ref="ref_taxregistrationdate" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_CM_ContactRegistration.remarks"  ref="ref_remarks" />
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
            ContactApproval: '',
            ContactRunningCd: '',

            M_CM_ContactRegistration :{
                contactid: '',
                cmcontactregistrationid: '',
                contactclasscd: '',
                parentid: '',
                category: 'P',
                government: 'N',
                reasoncd: '',
                reasondescs: '',
                name: '',
                website: '',
                taxno: '',
                taxreferenceno: '',
                taxregistrationdate: '',
                taxcollectable: 'Y',
                remarks: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                classdescs: '',
                parentname: '',
                classificationlocalid: '',
                classificationcentralid: '',
                classificationgroupid: '',
                sequenceregistrationno: 0,
                lastupdatestamp: 0,
                rowid: 0,
                insurancestatus: '',
                financierstatus: '',
                status: '',
                classificationid: ''
                    }
            ,
            PI_contactclasscd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMContactClass'    , 
                    ColumnDB: 'ContactClassCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
                cName: 'contactclasscd', 
                cLabel: 'Contact Class Code', 
                cKey: false, 
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
                cMasterUrl: 'CM/CM_ContactClass' ,
                cDisplayColumn: 'contact_class_cd,descs' ,
            }, 
            PI_classificationid: { 
                cValidate :'', 
                cName: 'classificationid', 
                cId: 'rdbclassificationid', 
                cRadioOptions: [{ text: 'Local ID', value: 'L' }, { text: 'Central ID', value: 'C' }, { text: 'Group ID', value : 'G'}], 
                cRadioDefaultOption: '', 
                cLabel:'Contact ID Classification', 
                cLabelSize: 4, 
                cOrder: 2, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_parentid: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCentral'    , 
                    ColumnDB: 'ContactID'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'parentid', 
                cLabel: 'Parent ID', 
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
                cMasterUrl: 'CM/CM_Contact' ,
                cDisplayColumn: 'contact_id,name' ,
            }, 
            PI_category: { 
                cValidate :'', 
                cName: 'category', 
                cId: 'rdbcategory', 
                cRadioOptions: [{ text: 'Personal', value: 'P' }, { text: 'Company', value: 'C' }], 
                cRadioDefaultOption: 'P', 
                cLabel:'Category', 
                cLabelSize: 4, 
                cOrder: 4, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_government: { 
                cValidate :'', 
                cName: 'government', 
                cId: 'rdbgovernment', 
                cRadioOptions: [{ text: 'Yes', value: 'Y' }, { text: 'No', value: 'Y' }], 
                cRadioDefaultOption: 'n', 
                cLabel:'Government', 
                cLabelSize: 4, 
                cOrder: 5, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_name: { 
                cValidate :'required|max:50', 
                cName: 'name', 
                cLabel: 'Name', 
                cLabelSize: 4, 
                cOrder: 6, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_website: { 
                cValidate :'max:50', 
                cName: 'website', 
                cLabel: 'Website', 
                cLabelSize: 4, 
                cOrder: 7, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_taxcollectable: { 
                cValidate :'', 
                cName: 'taxcollectable', 
                cId: 'rdbtaxcollectable', 
                cRadioOptions: [{ text: 'Yes', value: 'Y' }, { text: 'No', value: 'N' }], 
                cRadioDefaultOption: 'y', 
                cLabel:'Tax Collectable', 
                cLabelSize: 4, 
                cOrder: 8, 
                cProtect: true, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_taxno: { 
                cValidate :'required|max:30', 
                cName: 'taxno', 
                cLabel: 'Tax Reg. No', 
                cLabelSize: 4, 
                cOrder: 9, 
                cKey: true, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_taxreferenceno: { 
                cValidate :'max:30', 
                cName: 'taxreferenceno', 
                cLabel: 'Tax Reference No', 
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
            PI_taxregistrationdate: { 
                cValidate :'required', 
                cName: 'taxregistrationdate', 
                cLabel: 'Tax Reg. Date', 
                cLabelSize: 4, 
                cOrder: 11, 
                cKey: false, 
                cVisible:  true, 
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
                cOrder:12, 
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
		return this.$store.getters.GetPage1Data
	}
  },
    methods: {
        GetCMSpecification(){
            var param = {
            OptionFunctionCd: "GetCMSpecification",
            ModuleCd: this.Module            
          }

          this.FnDynamicFunction(param)
            .then(ress => {
              console.log(ress)
              if(ress == null) return
              var data = ress.Data[0]
              console.log(data)
              if(data.contact_approval == 'Y'){
                  this.$store.commit('setFormType','List')
                  this.FormType = 'List'
                  this.getToolbar().ProcessPS()
                // this.getToolbar().statusFunction[4].disabled = false
              }else{
                  this.$store.commit('setFormType','View')
                  this.FormType = 'View'
                  this.getToolbar().ProcessPS()
                // this.getToolbar().statusFunction[4].disabled = false
              }
            })
        },		
        OncontactclasscdChange (data) {
        this.$nextTick(() => {
            this.M_CM_ContactRegistration.contactclasscd = data.id
            this.M_CM_ContactRegistration.contactclasscdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{contactclasscd}
            }
        })
        this.$forceUpdate()
        },
        OnclassificationidChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
        if (data == "C")
             { this.M_CM_ContactRegistration.classificationcentralid = "Y"
             this.M_CM_ContactRegistration.classificationlocalid = "N"
             this.M_CM_ContactRegistration.classificationgroupid = "N"
             this.$refs.ref_parentid.prop.dataLookUp.InitialWhere = " classification iLIKE 'Group' "
             this.$refs.ref_parentid.prop.dataLookUp.LookUpCd = "GetLookupClassificationID"
             this.PI_parentid.cValidate = "required"
             this.$refs.ref_parentid.isRequired = true
             this.PI_parentid.cProtect = false
             this.PI_taxno.cProtect = false
             this.$refs.ref_taxno.isRequired = true
             this.PI_taxno.cValidate = "required"
             this.PI_taxregistrationdate.cValidate = "required"             
             this.$refs.ref_taxregdate.isRequired = true }
        if (data == "L")
             { this.M_CM_ContactRegistration.classificationcentralid = "N"
             this.M_CM_ContactRegistration.classificationlocalid = "Y"
             this.M_CM_ContactRegistration.classificationgroupid = "N"
             this.$refs.ref_parentid.prop.dataLookUp.InitialWhere = " classification iLIKE 'Central' "
             this.$refs.ref_parentid.prop.dataLookUp.LookUpCd = "GetLookupClassificationID"
             this.PI_parentid.cValidate = "required"
             this.$refs.ref_parentid.isRequired = true
             this.PI_parentid.cProtect = false
             this.PI_taxno.cProtect = false
             this.$refs.ref_taxno.isRequired = true
             this.PI_taxno.cValidate = "required"
             this.PI_taxregistrationdate.cValidate = "required"             
             this.$refs.ref_taxregdate.isRequired = true }
        if (data == "G")
             { this.M_CM_ContactRegistration.classificationcentralid = "N"
             this.M_CM_ContactRegistration.classificationlocalid = "N"
             this.M_CM_ContactRegistration.classificationgroupid = "Y"
             this.$refs.ref_parentid.prop.dataLookUp.InitialWhere = ""
             this.$refs.ref_parentid.prop.dataLookUp.LookUpCd = "GetLookupCMContact"
             this.PI_parentid.cValidate = ""
             this.$refs.ref_parentid.isRequired = false
             this.PI_parentid.cProtect = true
             this.PI_taxno.cProtect = true
             this.$refs.ref_taxno.isRequired = false
             this.PI_taxno.cValidate = ""
             this.PI_taxregistrationdate.cValidate = ""
             this.$refs.ref_taxregdate.isRequired = false 
             this.M_CM_ContactRegistration.parentidLabel = ""
             this.M_CM_ContactRegistration.parentid = ""
             }

            }
        })
        this.$forceUpdate()
        },
        OnparentidChange (data) {
        this.$nextTick(() => {
            this.M_CM_ContactRegistration.parentid = data.id
            this.M_CM_ContactRegistration.parentidLabel = data.label
            if (this.inputStatus != "VIEW") {
//{parentid}
            }
        })
        this.$forceUpdate()
        },
        OncategoryChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{category}
            }
        })
        this.$forceUpdate()
        },
        OngovernmentChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{government}
            }
        })
        this.$forceUpdate()
        },
        OntaxcollectableChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{taxcollectable}
            }
        })
        this.$forceUpdate()
        },
        OntaxregistrationdateChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{taxregistrationdate}
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
        },		
        M_Post(){
        },
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                contact_class_cd: this.M_CM_ContactRegistration.contactclasscd == '' || this.M_CM_ContactRegistration.contactclasscd == null ? 'NULL' : this.M_CM_ContactRegistration.contactclasscd ,
                category: this.M_CM_ContactRegistration.category,
                parent_id: this.M_CM_ContactRegistration.parentid == '' || this.M_CM_ContactRegistration.parentid == null ? 'NULL' : this.M_CM_ContactRegistration.parentid ,
                government: this.M_CM_ContactRegistration.government,
                tax_collectable: this.M_CM_ContactRegistration.taxcollectable,
                tax_registration_date: this.M_CM_ContactRegistration.taxregistrationdate == '' || this.M_CM_ContactRegistration.taxregistrationdate == null ? 'NULL' : this.M_CM_ContactRegistration.taxregistrationdate ,
                name: this.M_CM_ContactRegistration.name,
                website: this.M_CM_ContactRegistration.website,
                tax_no: this.M_CM_ContactRegistration.taxno,
                tax_reference_no: this.M_CM_ContactRegistration.taxreferenceno,
                remarks: this.M_CM_ContactRegistration.remarks,
                user_input: this.getDataUser().user_id ,
                classification_local_id: this.M_CM_ContactRegistration.classificationlocalid,
                classification_central_id: this.M_CM_ContactRegistration.classificationcentralid,
                classification_group_id: this.M_CM_ContactRegistration.classificationgroupid                
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
                sequence_registration_no: this.M_CM_ContactRegistration.sequenceregistrationno,
                cm_contact_registration_id: this.M_CM_ContactRegistration.cmcontactregistrationid,
                contact_class_cd: this.M_CM_ContactRegistration.contactclasscd == '' || this.M_CM_ContactRegistration.contactclasscd == null ? 'NULL' : this.M_CM_ContactRegistration.contactclasscd ,
                category: this.M_CM_ContactRegistration.category,
                government: this.M_CM_ContactRegistration.government,
                name: this.M_CM_ContactRegistration.name,
                parent_id: this.M_CM_ContactRegistration.parentid == '' || this.M_CM_ContactRegistration.parentid == null ? 'NULL' : this.M_CM_ContactRegistration.parentid ,
                website: this.M_CM_ContactRegistration.website,
                tax_no: this.M_CM_ContactRegistration.taxno,
                tax_reference_no: this.M_CM_ContactRegistration.taxreferenceno,
                tax_registration_date: this.M_CM_ContactRegistration.taxregistrationdate == '' || this.M_CM_ContactRegistration.taxregistrationdate == null ? 'NULL' : this.M_CM_ContactRegistration.taxregistrationdate ,
                tax_collectable: this.M_CM_ContactRegistration.taxcollectable,
                remarks: this.M_CM_ContactRegistration.remarks,
                user_edit: this.getDataUser().user_id ,
                lastupdatestamp: this.M_CM_ContactRegistration.lastupdatestamp,
                classification_local_id: this.M_CM_ContactRegistration.classificationlocalid,
                classification_central_id: this.M_CM_ContactRegistration.classificationcentralid,
                classification_group_id: this.M_CM_ContactRegistration.classificationgroupid                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })

        },
		M_ClearForm(){
            this.M_CM_ContactRegistration = {
                contactid: '',
                cmcontactregistrationid: '',
                contactclasscd: '',
                parentid: '',
                category: 'P',
                government: 'N',
                reasoncd: '',
                reasondescs: '',
                name: '',
                website: '',
                taxno: '',
                taxreferenceno: '',
                taxregistrationdate: '',
                taxcollectable: 'Y',
                remarks: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                classdescs: '',
                parentname: '',
                classificationlocalid: '',
                classificationcentralid: '',
                classificationgroupid: '',
                sequenceregistrationno: 0,
                lastupdatestamp: 0,
                rowid: 0,
                insurancestatus: '',
                financierstatus: '',
                status: '',
                classificationid: ''
                    }
            		
		},
        M_New(){
        // this.FnGetRunningCdFromCMSpecification().then(dt1 => 
        // { if (dt1 != null) {
        //      this.ContactRunningCd = dt1 } })
        this.$refs.ref_contactclasscd.focus()
			
        },
        M_Edit(){
          this.$refs.ref_contactclasscd.focus()
        },
        M_Delete(dt){       

            var data = this.FormToABSList().getRowSelected()  
          var dataDelete = []
          console.log(data)

			
			data.forEach((value) => {
				dataDelete.push({
                    cm_contact_registration_id: value.cm_contact_registration_id,
                    lastupdatestamp: value.lastupdatestamp,
                    _Message_: ""
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
                cm_contact_registration_id: record.cm_contact_registration_id
            }
            console.log(param)

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                console.log(response)
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                console.log(data)
this.M_CM_ContactRegistration = {
                contactid: data.contact_id,
                cmcontactregistrationid: data.cm_contact_registration_id,
                contactclasscd: data.contact_class_cd,
                parentid: data.parent_id,
                category: data.category,
                government: data.government,
                reasoncd: data.reason_cd,
                reasondescs: data.reason_descs,
                name: data.name,
                website: data.website,
                taxno: data.tax_no,
                taxreferenceno: data.tax_reference_no,
                taxregistrationdate: data.tax_registration_date,
                taxcollectable: data.tax_collectable,
                remarks: data.remarks,
                userinput: data.user_input,
                useredit: data.user_edit,
                classdescs: data.class_descs,
                parentname: data.parent_name,
                classificationlocalid: data.classification_local_id,
                classificationcentralid: data.classification_central_id,
                classificationgroupid: data.classification_group_id,
                sequenceregistrationno: record.sequence_registration_no,
                lastupdatestamp: record.lastupdatestamp,
                rowid: data.row_id,
                insurancestatus: data.insurance_status,
                financierstatus: data.financier_status,
                status: data.status,
                classificationid: data.classification_id
                    }
                
                console.log(this.M_CM_ContactRegistration)
                 

                this.M_CM_ContactRegistration.contactclasscdLabel = this.M_CM_ContactRegistration.contactclasscd != null ? data.contact_class_cd + this.separator + data.class_descs :'' 
                this.M_CM_ContactRegistration.parentidLabel = this.M_CM_ContactRegistration.parentid != null ? data.parent_id + this.separator + data.parent_name :'' 
         

                this.IEBy.Input = data.user_input
                this.IEBy.Edit = data.user_edit

            })
        }

    },
    beforeCreate: function () {
    },
    created: function() {
        // this.GetCMSpecification()
	// this.$store.commit('setFormType','List')
    // this.getToolbar().ProcessPS()
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

