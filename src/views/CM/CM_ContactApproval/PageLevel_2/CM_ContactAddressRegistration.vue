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
                                        <ABSinputTextVuex :prop="PI_addresscd" v-model="M_CM_ContactAddressRegistration.addresscd"  ref="ref_addresscd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_idno" v-model="M_CM_ContactAddressRegistration.idno"  ref="ref_idno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputCheckBox @input="OnaddresscategoryChange" :prop="PI_addresscategory" v-model="M_CM_ContactAddressRegistration.addresscategory"  ref="ref_addresscategory" />
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_passportno" v-model="M_CM_ContactAddressRegistration.passportno"  ref="ref_passportno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnaddresstypeChange" :prop="PI_addresstype" v-model="M_CM_ContactAddressRegistration.addresstype"  ref="ref_addresstype" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnsalutationcdChange" :prop="PI_salutationcd" :value="M_CM_ContactAddressRegistration.salutationcd" :label="M_CM_ContactAddressRegistration.salutationcdLabel" ref="ref_salutationcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_attention" v-model="M_CM_ContactAddressRegistration.attention"  ref="ref_attention"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_address1" v-model="M_CM_ContactAddressRegistration.address1"  ref="ref_address1"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_address2" v-model="M_CM_ContactAddressRegistration.address2"  ref="ref_address2"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_address3" v-model="M_CM_ContactAddressRegistration.address3"  ref="ref_address3"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_address4" v-model="M_CM_ContactAddressRegistration.address4"  ref="ref_address4"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_zipcode" v-model="M_CM_ContactAddressRegistration.zipcode"  ref="ref_zipcode"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OncitycdChange" :prop="PI_citycd" :value="M_CM_ContactAddressRegistration.citycd" :label="M_CM_ContactAddressRegistration.citycdLabel" ref="ref_citycd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_phoneno" v-model="M_CM_ContactAddressRegistration.phoneno"  ref="ref_phoneno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_faxno" v-model="M_CM_ContactAddressRegistration.faxno"  ref="ref_faxno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_email" v-model="M_CM_ContactAddressRegistration.email"  ref="ref_email"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_CM_ContactAddressRegistration.remarks"  ref="ref_remarks" />
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
                initialWhere:"cm_contact_registration_id = '" + this.ValKey + "'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_CM_ContactAddressRegistration :{
                contactid: '',
                cmcontactregistrationid: '',
                cmcontactaddressregistrationid: '',
                addresscd: '',
                billingstatus: '',
                mailingstatus: '',
                taxstatus: '',
                rentalbillingstatus: '',
                servicechargestatus: '',
                meterutilitystatus: '',
                addresstype: 'C',
                salutationcd: '',
                attention: '',
                address1: '',
                address2: '',
                address3: '',
                address4: '',
                mainaddressstatus: '',
                email: '',
                citycd: '',
                zipcode: '',
                phoneno: '',
                faxno: '',
                remarks: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                lastupdatestamp: 0,
                controlsequenceno: 0,
                idno: '',
                passportno: '',
                rowid: 0,
                salutationdescs: '',
                citydescs: '',
                debtorcd: '',
                addresscategory: []
                    }
            ,
            PI_addresscd: { 
                cValidate :'required|max:5', 
                cName: 'addresscd', 
                cLabel: 'Address Code', 
                cLabelSize: 4, 
                cOrder: 101, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_idno: { 
                cValidate :'required|max:20', 
                cName: 'idno', 
                cLabel: 'NIK', 
                cLabelSize: 4, 
                cOrder: 102, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_addresscategory: { 
                cValidate :'', 
                cName: 'addresscategory', 
                cLabel: 'Address Category', 
                cLabelSize: 4, 
                cOptions: [{ text: 'Billing', value: 'B' }, { text: 'Mailling', value: 'M' }, { text: 'Tax', value: 'T' }], 
                cOrder: 103, 
                cKey: false, 
                cVisible: true, 
                cProtect: false, 
                cDefault: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_passportno: { 
                cValidate :'max:20', 
                cName: 'passportno', 
                cLabel: 'Passport No', 
                cLabelSize: 4, 
                cOrder: 104, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_addresstype: { 
                cValidate :'', 
                cName: 'addresstype', 
                cId: 'rdbaddresstype', 
                cRadioOptions: [{ text: 'Company', value: 'C' }, { text: 'Home', value: 'H' }, { text: 'Other', value: 'O' }], 
                cRadioDefaultOption: '', 
                cLabel:'Address Type', 
                cLabelSize: 4, 
                cOrder: 105, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_salutationcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMSalutation'    , 
                    ColumnDB: 'salutation_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'salutationcd', 
                cLabel: 'Salutation', 
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
                cMasterUrl: 'CM/CM_Salutation' ,
                cDisplayColumn: 'salutation_cd,descs' ,
            }, 
            PI_attention: { 
                cValidate :'max:50', 
                cName: 'attention', 
                cLabel: 'Attention', 
                cLabelSize: 4, 
                cOrder: 107, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_address1: { 
                cValidate :'required|max:50', 
                cName: 'address1', 
                cLabel: 'Address', 
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
            PI_address2: { 
                cValidate :'max:50', 
                cName: 'address2', 
                cLabel: '', 
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
            PI_address3: { 
                cValidate :'max:50', 
                cName: 'address3', 
                cLabel: '', 
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
            PI_address4: { 
                cValidate :'max:50', 
                cName: 'address4', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 111, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_zipcode: { 
                cValidate :'max:5', 
                cName: 'zipcode', 
                cLabel: 'Zip Code', 
                cLabelSize: 4, 
                cOrder: 112, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_citycd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMCity'    , 
                    ColumnDB: 'city_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'citycd', 
                cLabel: 'City', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 113, 
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
                cMasterUrl: 'CM/CM_CountryCity' ,
                cDisplayColumn: 'city_cd,descs' ,
            }, 
            PI_phoneno: { 
                cValidate :'max:30', 
                cName: 'phoneno', 
                cLabel: 'Phone', 
                cLabelSize: 4, 
                cOrder: 114, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_faxno: { 
                cValidate :'max:30', 
                cName: 'faxno', 
                cLabel: 'Fax', 
                cLabelSize: 4, 
                cOrder: 115, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_email: { 
                cValidate :'max:50', 
                cName: 'email', 
                cLabel: 'Email', 
                cLabelSize: 4, 
                cOrder: 116, 
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
                cOrder: 117, 
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
        OnaddresscategoryChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{addresscategory}
            }
        })
        this.$forceUpdate()
        },
        OnaddresstypeChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{addresstype}
            }
        })
        this.$forceUpdate()
        },
        OnsalutationcdChange (data) {
        this.$nextTick(() => {
            this.M_CM_ContactAddressRegistration.salutationcd = data.id
            this.M_CM_ContactAddressRegistration.salutationcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{salutationcd}
            }
        })
        this.$forceUpdate()
        },
        OncitycdChange (data) {
        this.$nextTick(() => {
            this.M_CM_ContactAddressRegistration.citycd = data.id
            this.M_CM_ContactAddressRegistration.citycdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{citycd}
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
           this.getToolbar().statusFunction[0].disabled = true
           this.getToolbar().statusFunction[1].disabled = true
           this.getToolbar().statusFunction[2].disabled = true
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
            this.M_CM_ContactAddressRegistration.sequenceregistrationno = data.sequence_registration_no 
            this.propList.initialWhere =" cm_contact_registration_id = '" + data.cm_contact_registration_id + "' "
        

            this.FormToABSList().doGetList('','eb_getList')
        },		       
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                sequence_registration_no: this.M_CM_ContactAddressRegistration.sequenceregistrationno,
                contact_id: this.M_CM_ContactAddressRegistration.contactid,
                address_cd: this.M_CM_ContactAddressRegistration.addresscd,
                billing_status: this.M_CM_ContactAddressRegistration.addresscategory.indexOf('B') >= 0 ? 'Y' : 'N',
                mailing_status: this.M_CM_ContactAddressRegistration.addresscategory.indexOf('M') >= 0 ? 'Y' : 'N',
                tax_status: this.M_CM_ContactAddressRegistration.addresscategory.indexOf('T') >= 0 ? 'Y' : 'N',
                address_type: this.M_CM_ContactAddressRegistration.addresstype,
                salutation_cd: this.M_CM_ContactAddressRegistration.salutationcd == '' || this.M_CM_ContactAddressRegistration.salutationcd == null ? 'NULL' : this.M_CM_ContactAddressRegistration.salutationcd ,
                attention: this.M_CM_ContactAddressRegistration.attention,
                address1: this.M_CM_ContactAddressRegistration.address1,
                address2: this.M_CM_ContactAddressRegistration.address2,
                address3: this.M_CM_ContactAddressRegistration.address3,
                address4: this.M_CM_ContactAddressRegistration.address4,
                email: this.M_CM_ContactAddressRegistration.email,
                city_cd: this.M_CM_ContactAddressRegistration.citycd == '' || this.M_CM_ContactAddressRegistration.citycd == null ? 'NULL' : this.M_CM_ContactAddressRegistration.citycd ,
                post_cd: this.M_CM_ContactAddressRegistration.zipcode,
                phone_no: this.M_CM_ContactAddressRegistration.phoneno,
                fax_no: this.M_CM_ContactAddressRegistration.faxno,
                remarks: this.M_CM_ContactAddressRegistration.remarks,
                user_input: this.getDataUser().user_id ,
                debtor_cd: this.M_CM_ContactAddressRegistration.debtorcd,
                id_no: this.M_CM_ContactAddressRegistration.idno,
                passport_no: this.M_CM_ContactAddressRegistration.passportno                
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
                sequence_registration_no: this.M_CM_ContactAddressRegistration.sequenceregistrationno,
                contact_id: this.M_CM_ContactAddressRegistration.contactid,
                address_cd: this.M_CM_ContactAddressRegistration.addresscd,
                billing_status: this.M_CM_ContactAddressRegistration.addresscategory.indexOf('B') >= 0 ? 'Y' : 'N',
                mailing_status: this.M_CM_ContactAddressRegistration.addresscategory.indexOf('M') >= 0 ? 'Y' : 'N',
                tax_status: this.M_CM_ContactAddressRegistration.addresscategory.indexOf('T') >= 0 ? 'Y' : 'N',
                address_type: this.M_CM_ContactAddressRegistration.addresstype,
                salutation_cd: this.M_CM_ContactAddressRegistration.salutationcd == '' || this.M_CM_ContactAddressRegistration.salutationcd == null ? 'NULL' : this.M_CM_ContactAddressRegistration.salutationcd ,
                attention: this.M_CM_ContactAddressRegistration.attention,
                address1: this.M_CM_ContactAddressRegistration.address1,
                address2: this.M_CM_ContactAddressRegistration.address2,
                address3: this.M_CM_ContactAddressRegistration.address3,
                address4: this.M_CM_ContactAddressRegistration.address4,
                email: this.M_CM_ContactAddressRegistration.email,
                city_cd: this.M_CM_ContactAddressRegistration.citycd == '' || this.M_CM_ContactAddressRegistration.citycd == null ? 'NULL' : this.M_CM_ContactAddressRegistration.citycd ,
                post_cd: this.M_CM_ContactAddressRegistration.zipcode,
                phone_no: this.M_CM_ContactAddressRegistration.phoneno,
                fax_no: this.M_CM_ContactAddressRegistration.faxno,
                remarks: this.M_CM_ContactAddressRegistration.remarks,
                user_edit: this.getDataUser().user_id ,
                lastupdatestamp: this.M_CM_ContactAddressRegistration.lastupdatestamp,
                debtor_cd: this.M_CM_ContactAddressRegistration.debtorcd,
                rental_billing_status: this.M_CM_ContactAddressRegistration.billingstatus,
                service_charge_status: this.M_CM_ContactAddressRegistration.servicechargestatus,
                meter_utility_status: this.M_CM_ContactAddressRegistration.meterutilitystatus,
                id_no: this.M_CM_ContactAddressRegistration.idno,
                passport_no: this.M_CM_ContactAddressRegistration.passportno                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })

        },
		M_ClearForm(){
            this.M_CM_ContactAddressRegistration = {
                contactid: '',
                cmcontactregistrationid: '',
                cmcontactaddressregistrationid: '',
                addresscd: '',
                billingstatus: '',
                mailingstatus: '',
                taxstatus: '',
                rentalbillingstatus: '',
                servicechargestatus: '',
                meterutilitystatus: '',
                addresstype: 'C',
                salutationcd: '',
                attention: '',
                address1: '',
                address2: '',
                address3: '',
                address4: '',
                mainaddressstatus: '',
                email: '',
                citycd: '',
                zipcode: '',
                phoneno: '',
                faxno: '',
                remarks: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                lastupdatestamp: 0,
                controlsequenceno: 0,
                idno: '',
                passportno: '',
                rowid: 0,
                salutationdescs: '',
                citydescs: '',
                debtorcd: '',
                addresscategory: []
                    }
            		
		},
        M_New(){
            let data = this.$store.getters.GetPage1Data
            this.M_CM_ContactAddressRegistration.contactid = data.contact_id
            this.M_CM_ContactAddressRegistration.sequenceregistrationno = data.sequence_registration_no 

            this.$refs.ref_addresscd.focus()

        },
        M_Edit(){
          this.$refs.ref_addresscategory.focus()
        },
        M_Delete(dt){           
        var data = this.FormToABSList().getRowSelected()  
        var dataDelete = []

        
        data.forEach((value) => {
          dataDelete.push({
          subportfolio_cd: value.subportfolio_cd,
          contact_id: value.contact_id,
          address_cd: value.address_cd,
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
                cm_contact_registration_id: record.cm_contact_registration_id,
                cm_contact_address_registration_id: record.cm_contact_address_registration_id,
                debtor_cd: record.debtor_cd				
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
                var addresscategory = []
                // var paymentctrl = ''
                if (data.billing_status == 'Y'){
                    addresscategory.push('B')
                } 
                if (data.mailing_status == 'Y'){
                    addresscategory.push('M')
                }
                if (data.tax_status == 'Y'){
                    addresscategory.push('T')
                }
                console.log(data)
this.M_CM_ContactAddressRegistration = {
                contactid: data.contact_id,
                cmcontactregistrationid: data.cm_contact_registration_id,
                cmcontactaddressregistrationid: data.cm_contact_address_registration_id,
                addresscd: data.address_cd,
                billingstatus: data.billing_status,
                mailingstatus: data.mailing_status,
                taxstatus: data.tax_status,
                rentalbillingstatus: data.rental_billing_status,
                servicechargestatus: data.service_charge_status,
                meterutilitystatus: data.meter_utility_status,
                addresstype: data.address_type,
                salutationcd: data.salutation_cd,
                attention: data.attention,
                address1: data.address1,
                address2: data.address2,
                address3: data.address3,
                address4: data.address4,
                mainaddressstatus: data.main_addresss_tatus,
                email: data.email,
                citycd: data.city_cd,
                zipcode: data.zip_code,
                phoneno: data.phone_no,
                faxno: data.fax_no,
                remarks: data.remarks,
                userinput: data.user_input,
                useredit: data.user_edit,
                timeinput: data.time_input,
                timeedit: data.time_edit,
                lastupdatestamp: record.lastupdatestamp,
                controlsequenceno: data.control_sequence_no,
                idno: data.id_no,
                passportno: data.passport_no,
                rowid: data.row_id,
                salutationdescs: data.salutation_descs,
                citydescs: data.city_descs,
                debtorcd: data.debtor_cd,
                addresscategory: address_category
                    }
                 

                this.M_CM_ContactAddressRegistration.salutationcdLabel = this.M_CM_ContactAddressRegistration.salutationcd != null ? data.salutation_cd + this.separator + data.salutation_descs :'' 
                this.M_CM_ContactAddressRegistration.citycdLabel = this.M_CM_ContactAddressRegistration.citycd != null ? data.city_cd + this.separator + data.city_descs :'' 
  

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

