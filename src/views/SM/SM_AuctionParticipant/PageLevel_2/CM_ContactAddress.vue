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
                                        <ABSinputTextVuex :prop="PI_addresscd" v-model="M_CM_ContactAddress.addresscd"  ref="ref_addresscd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_idno" v-model="M_CM_ContactAddress.idno"  ref="ref_idno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputCheckBox @input="OnaddresscategoryChange" :prop="PI_addresscategory" v-model="M_CM_ContactAddress.addresscategory"  ref="ref_addresscategory" />
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_passportno" v-model="M_CM_ContactAddress.passportno"  ref="ref_passportno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnaddresstypeChange" :prop="PI_addresstype" v-model="M_CM_ContactAddress.addresstype"  ref="ref_addresstype" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnsalutationcdChange" :prop="PI_salutationcd" :value="M_CM_ContactAddress.salutationcd" :label="M_CM_ContactAddress.salutationcdLabel" ref="ref_salutationcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_attention" v-model="M_CM_ContactAddress.attention"  ref="ref_attention"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_address1" v-model="M_CM_ContactAddress.address1"  ref="ref_address1"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_address2" v-model="M_CM_ContactAddress.address2"  ref="ref_address2"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_address3" v-model="M_CM_ContactAddress.address3"  ref="ref_address3"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_address4" v-model="M_CM_ContactAddress.address4"  ref="ref_address4"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_zipcode" v-model="M_CM_ContactAddress.zipcode"  ref="ref_zipcode"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OncitycdChange" :prop="PI_citycd" :value="M_CM_ContactAddress.citycd" :label="M_CM_ContactAddress.citycdLabel" ref="ref_citycd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_phoneno" v-model="M_CM_ContactAddress.phoneno"  ref="ref_phoneno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_faxno" v-model="M_CM_ContactAddress.faxno"  ref="ref_faxno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_email" v-model="M_CM_ContactAddress.email"  ref="ref_email"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_CM_ContactAddress.remarks"  ref="ref_remarks" />
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
    props: {PageLevel:'', TabIndex: '', data: ''},
    data() {
        return {
			ValKey:null,
            FormType: "List",
			Module:"CM",
            propList: {
                initialWhere:"ContactId = '" + this.ValKey + "'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_CM_ContactAddress :{
                contactid: '',
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
                cOrder: 21, 
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
                cOrder: 22, 
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
                cOrder: 23, 
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
                cOrder: 24, 
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
                cOrder: 25, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_salutationcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMSalutation'    , 
                    ColumnDB: 'SalutationCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'salutationcd', 
                cLabel: 'Salutation', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 26, 
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
                cDisplayColumn: 'SalutationCd,Descs' ,
            }, 
            PI_attention: { 
                cValidate :'max:50', 
                cName: 'attention', 
                cLabel: 'Attention', 
                cLabelSize: 4, 
                cOrder: 27, 
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
                cOrder: 28, 
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
                cOrder: 29, 
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
                cOrder: 30, 
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
                cOrder: 31, 
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
                cOrder: 32, 
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
                    ColumnDB: 'CityCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'citycd', 
                cLabel: 'City', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 33, 
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
                cDisplayColumn: 'CityCd,Descs' ,
            }, 
            PI_phoneno: { 
                cValidate :'max:30', 
                cName: 'phoneno', 
                cLabel: 'Phone', 
                cLabelSize: 4, 
                cOrder: 34, 
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
                cOrder: 35, 
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
                cOrder: 36, 
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
                cOrder:37, 
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
            this.M_CM_ContactAddress.salutationcd = data.id
            this.M_CM_ContactAddress.salutationcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{salutationcd}
            }
        })
        this.$forceUpdate()
        },
        OncitycdChange (data) {
        this.$nextTick(() => {
            this.M_CM_ContactAddress.citycd = data.id
            this.M_CM_ContactAddress.citycdLabel = data.label
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
            this.M_CM_ContactAddress.contactid = data.ContactID 
            this.propList.initialWhere =" ContactId = '" + data.ContactID + "' "
        

            this.FormToABSList().doGetList('','eb_getList')
        },		       
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                ContactId: this.M_CM_ContactAddress.contactid,
                AddressCd: this.M_CM_ContactAddress.addresscd,
                BillingStatus: this.M_CM_ContactAddress.addresscategory.indexOf('B') >= 0 ? 'Y' : 'N',
                MailingStatus: this.M_CM_ContactAddress.addresscategory.indexOf('M') >= 0 ? 'Y' : 'N',
                TaxStatus: this.M_CM_ContactAddress.addresscategory.indexOf('T') >= 0 ? 'Y' : 'N',
                AddressType: this.M_CM_ContactAddress.addresstype,
                SalutationCd: this.M_CM_ContactAddress.salutationcd == '' || this.M_CM_ContactAddress.salutationcd == null ? 'NULL' : this.M_CM_ContactAddress.salutationcd ,
                Attention: this.M_CM_ContactAddress.attention,
                Address1: this.M_CM_ContactAddress.address1,
                Address2: this.M_CM_ContactAddress.address2,
                Address3: this.M_CM_ContactAddress.address3,
                Address4: this.M_CM_ContactAddress.address4,
                Email: this.M_CM_ContactAddress.email,
                CityCd: this.M_CM_ContactAddress.citycd == '' || this.M_CM_ContactAddress.citycd == null ? 'NULL' : this.M_CM_ContactAddress.citycd ,
                PostCd: this.M_CM_ContactAddress.zipcode,
                PhoneNo: this.M_CM_ContactAddress.phoneno,
                FaxNo: this.M_CM_ContactAddress.faxno,
                Remarks: this.M_CM_ContactAddress.remarks,
                UserInput: this.getDataUser().user_id ,
                DebtorCd: this.M_CM_ContactAddress.debtorcd,
                IDNo: this.M_CM_ContactAddress.idno,
                PassportNo: this.M_CM_ContactAddress.passportno                
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
                ContactId: this.M_CM_ContactAddress.contactid,
                AddressCd: this.M_CM_ContactAddress.addresscd,
                BillingStatus: this.M_CM_ContactAddress.addresscategory.indexOf('B') >= 0 ? 'Y' : 'N',
                MailingStatus: this.M_CM_ContactAddress.addresscategory.indexOf('M') >= 0 ? 'Y' : 'N',
                TaxStatus: this.M_CM_ContactAddress.addresscategory.indexOf('T') >= 0 ? 'Y' : 'N',
                AddressType: this.M_CM_ContactAddress.addresstype,
                SalutationCd: this.M_CM_ContactAddress.salutationcd == '' || this.M_CM_ContactAddress.salutationcd == null ? 'NULL' : this.M_CM_ContactAddress.salutationcd ,
                Attention: this.M_CM_ContactAddress.attention,
                Address1: this.M_CM_ContactAddress.address1,
                Address2: this.M_CM_ContactAddress.address2,
                Address3: this.M_CM_ContactAddress.address3,
                Address4: this.M_CM_ContactAddress.address4,
                Email: this.M_CM_ContactAddress.email,
                CityCd: this.M_CM_ContactAddress.citycd == '' || this.M_CM_ContactAddress.citycd == null ? 'NULL' : this.M_CM_ContactAddress.citycd ,
                PostCd: this.M_CM_ContactAddress.zipcode,
                PhoneNo: this.M_CM_ContactAddress.phoneno,
                FaxNo: this.M_CM_ContactAddress.faxno,
                Remarks: this.M_CM_ContactAddress.remarks,
                UserEdit: this.getDataUser().user_id ,
                LastUpdateStamp: this.M_CM_ContactAddress.lastupdatestamp,
                DebtorCd: this.M_CM_ContactAddress.debtorcd,
                RentalBillingStatus: this.M_CM_ContactAddress.billingstatus,
                ServiceChargeStatus: this.M_CM_ContactAddress.servicechargestatus,
                MeterUtilityStatus: this.M_CM_ContactAddress.meterutilitystatus,
                IDNo: this.M_CM_ContactAddress.idno,
                PassportNo: this.M_CM_ContactAddress.passportno                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })

        },
		M_ClearForm(){
            this.M_CM_ContactAddress = {
                contactid: '',
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
            this.M_CM_ContactAddress.contactid = data.ContactID 

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
          SubportfolioCd: value.SubportfolioCd,
          ContactId: value.ContactID,
          AddressCd: value.AddressCd,
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
,                contactid: record.ContactID,
                addresscd: record.AddressCd,
                debtorcd: record.DebtorCd				
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
                var addresscategory = []
                // var paymentctrl = ''
                if (data.billingstatus == 'Y'){
                    addresscategory.push('B')
                } 
                if (data.mailingstatus == 'Y'){
                    addresscategory.push('M')
                }
                if (data.taxstatus == 'Y'){
                    addresscategory.push('T')
                }
                console.log(data)
this.M_CM_ContactAddress = {
                contactid: data.contactid,
                addresscd: data.addresscd,
                billingstatus: data.billingstatus,
                mailingstatus: data.mailingstatus,
                taxstatus: data.taxstatus,
                rentalbillingstatus: data.rentalbillingstatus,
                servicechargestatus: data.servicechargestatus,
                meterutilitystatus: data.meterutilitystatus,
                addresstype: data.addresstype,
                salutationcd: data.salutationcd,
                attention: data.attention,
                address1: data.address1,
                address2: data.address2,
                address3: data.address3,
                address4: data.address4,
                mainaddressstatus: data.mainaddressstatus,
                email: data.email,
                citycd: data.citycd,
                zipcode: data.zipcode,
                phoneno: data.phoneno,
                faxno: data.faxno,
                remarks: data.remarks,
                userinput: data.userinput,
                useredit: data.useredit,
                timeinput: data.timeinput,
                timeedit: data.timeedit,
                lastupdatestamp: record.LastUpdateStamp,
                controlsequenceno: data.controlsequenceno,
                idno: data.idno,
                passportno: data.passportno,
                rowid: data.rowid,
                salutationdescs: data.salutationdescs,
                citydescs: data.citydescs,
                debtorcd: data.debtorcd,
                addresscategory: addresscategory
                    }
                 

                this.M_CM_ContactAddress.salutationcdLabel = this.M_CM_ContactAddress.salutationcd != null ? data.salutationcd + this.separator + data.salutationdescs :'' 
                this.M_CM_ContactAddress.citycdLabel = this.M_CM_ContactAddress.citycd != null ? data.citycd + this.separator + data.citydescs :'' 
  

                this.IEBy.Input = data.userinput
                this.IEBy.Edit = data.useredit

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

