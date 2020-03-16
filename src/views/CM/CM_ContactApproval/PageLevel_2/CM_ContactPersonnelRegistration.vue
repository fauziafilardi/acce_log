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
                                        <ABSinputTextVuex :prop="PI_contactpersonnelid" v-model="M_CM_ContactPersonnelRegistration.contactpersonnelid"  ref="ref_contactpersonnelid"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OngroupcdChange" :prop="PI_groupcd" :value="M_CM_ContactPersonnelRegistration.groupcd" :label="M_CM_ContactPersonnelRegistration.groupcdLabel" ref="ref_groupcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnsalutationcdChange" :prop="PI_salutationcd" :value="M_CM_ContactPersonnelRegistration.salutationcd" :label="M_CM_ContactPersonnelRegistration.salutationcdLabel" ref="ref_salutationcd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_jobtitle" v-model="M_CM_ContactPersonnelRegistration.jobtitle"  ref="ref_jobtitle"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_fullname" v-model="M_CM_ContactPersonnelRegistration.fullname"  ref="ref_fullname"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputDateVuex @input="OnbirthdateChange" :prop="PI_birthdate" v-model="M_CM_ContactPersonnelRegistration.birthdate"  ref="ref_birthdate" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_familyname" v-model="M_CM_ContactPersonnelRegistration.familyname"  ref="ref_familyname"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnnationalitycdChange" :prop="PI_nationalitycd" :value="M_CM_ContactPersonnelRegistration.nationalitycd" :label="M_CM_ContactPersonnelRegistration.nationalitycdLabel" ref="ref_nationalitycd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_address1" v-model="M_CM_ContactPersonnelRegistration.address1"  ref="ref_address1"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnreligioncdChange" :prop="PI_religioncd" :value="M_CM_ContactPersonnelRegistration.religioncd" :label="M_CM_ContactPersonnelRegistration.religioncdLabel" ref="ref_religioncd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_address2" v-model="M_CM_ContactPersonnelRegistration.address2"  ref="ref_address2"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnmaritalstatusChange" :prop="PI_maritalstatus" :value="M_CM_ContactPersonnelRegistration.maritalstatus" :label="M_CM_ContactPersonnelRegistration.maritalstatusLabel" ref="ref_maritalstatus"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_address3" v-model="M_CM_ContactPersonnelRegistration.address3"  ref="ref_address3"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_children" v-model="M_CM_ContactPersonnelRegistration.children"  ref="ref_children"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_address4" v-model="M_CM_ContactPersonnelRegistration.address4"  ref="ref_address4"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputRadioButtonVuex @input="OngenderChange" :prop="PI_gender" v-model="M_CM_ContactPersonnelRegistration.gender"  ref="ref_gender" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_zipcode" v-model="M_CM_ContactPersonnelRegistration.zipcode"  ref="ref_zipcode"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_icno" v-model="M_CM_ContactPersonnelRegistration.icno"  ref="ref_icno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OncitycdChange" :prop="PI_citycd" :value="M_CM_ContactPersonnelRegistration.citycd" :label="M_CM_ContactPersonnelRegistration.citycdLabel" ref="ref_citycd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_passportno" v-model="M_CM_ContactPersonnelRegistration.passportno"  ref="ref_passportno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_phoneno" v-model="M_CM_ContactPersonnelRegistration.phoneno"  ref="ref_phoneno"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_kimsno" v-model="M_CM_ContactPersonnelRegistration.kimsno"  ref="ref_kimsno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_faxno" v-model="M_CM_ContactPersonnelRegistration.faxno"  ref="ref_faxno"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_kitano" v-model="M_CM_ContactPersonnelRegistration.kitano"  ref="ref_kitano"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_handphone" v-model="M_CM_ContactPersonnelRegistration.handphone"  ref="ref_handphone"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_CM_ContactPersonnelRegistration.remarks"  ref="ref_remarks" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_email" v-model="M_CM_ContactPersonnelRegistration.email"  ref="ref_email"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnattentionstatusChange" :prop="PI_attentionstatus" v-model="M_CM_ContactPersonnelRegistration.attentionstatus"  ref="ref_attentionstatus" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSFileUpload :prop="PI_referencefilename" @fileName="getFileName" 
                                                                        v-model="M_CM_ContactPersonnelRegistration.referencefilename" 
                                                                        :file="M_CM_ContactPersonnelRegistration.picturefilename" 
                                                                        :image="M_CM_ContactPersonnelRegistration.referencefilename"
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
            FormType: "View",
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
            DeleteError: '',

            M_CM_ContactPersonnelRegistration :{
                sequenceregistrationno: 0,
                cmcontactregistrationid: '',
                cmcontactpersonnelregistrationid: '',
                contactpersonnelid: '',
                contacttype: '',
                primarycontactpersonnel: '',
                salutationcd: '',
                fullname: '',
                familyname: '',
                address1: '',
                address2: '',
                address3: '',
                address4: '',
                citycd: '',
                zipcode: '',
                phoneno: '',
                faxno: '',
                handphone: '',
                email: '',
                jobtitle: '',
                birthdate: '',
                nationalitycd: '',
                religioncd: '',
                gender: 'M',
                maritalstatus: 'S',
                children: '0',
                icno: '',
                passportno: '',
                kimsno: '',
                kitano: '',
                picturefilename: '',
                referencefilename: '',
                groupcd: '',
                descs: '',
                remarks: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                controlsequenceno: 0,
                attentionstatus: 'N',
                groupdescs: '',
                salutationdescs: '',
                nationalitydescs: '',
                religiondescs: '',
                citydescs: '',
                debtorcd: '',
                lastupdatestamp: 0,
                rowid: 0
                    }
            ,
            PI_contactpersonnelid: { 
                cValidate :'required|max:10', 
                cName: 'contactpersonnelid', 
                cLabel: 'Personnel ID', 
                cLabelSize: 4, 
                cOrder: 101, 
                cKey: true, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_groupcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupPersonelGroup'    , 
                    ColumnDB: 'group_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'groupcd', 
                cLabel: 'Contact Personnel Group', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 102, 
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
                cMasterUrl: 'CM/CM_ContactPersonnelGroup' ,
                cDisplayColumn: 'group_cd,descs' ,
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
                cOrder: 102, 
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
            PI_jobtitle: { 
                cValidate :'', 
                cName: 'jobtitle', 
                cLabel: 'Job Title', 
                cLabelSize: 4, 
                cOrder: 118, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_fullname: { 
                cValidate :'', 
                cName: 'fullname', 
                cLabel: 'Full Name', 
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
            PI_birthdate: { 
                cValidate :'required', 
                cName: 'birthdate', 
                cLabel: 'Birth Date', 
                cLabelSize: 4, 
                cOrder: 119, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_familyname: { 
                cValidate :'', 
                cName: 'familyname', 
                cLabel: 'Family Name', 
                cLabelSize: 4, 
                cOrder: 105, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
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
                cOrder: 120, 
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
            PI_address1: { 
                cValidate :'required|max:50', 
                cName: 'address1', 
                cLabel: 'Address', 
                cLabelSize: 4, 
                cOrder: 106, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
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
                cOrder: 122, 
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
            PI_address2: { 
                cValidate :'', 
                cName: 'address2', 
                cLabel: '', 
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
            PI_maritalstatus: { 
                dataLookUp: null, 
                cValidate :'', 
                cName: 'maritalstatus', 
                cLabel: 'Marital Status', 
                cLabelSize: 4, 
                cOrder: 123, 
                cKey: false, 
                cTriggered: false, 
                cDefault: 'S', 
                cProtect: false, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cStatic: true, 
                cOption: [{ label: 'Single', id: 'S' },{ label: 'Married', id: 'M' },{ label: 'Widow', id: 'W' },{ label: 'Widower', id: 'R' }], 
                cMasterUrl: '' ,
                cDisplayColumn: '' ,
            }, 
            PI_address3: { 
                cValidate :'', 
                cName: 'address3', 
                cLabel: '', 
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
            PI_children: { 
                cValidate :'', 
                cName: 'children', 
                cLabel: 'Children', 
                cLabelSize: 4, 
                cOrder: 124, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_address4: { 
                cValidate :'', 
                cName: 'address4', 
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
            PI_gender: { 
                cValidate :'', 
                cName: 'gender', 
                cId: 'rdbgender', 
                cRadioOptions: [{ text: 'Male', value: 'M' }, { text: 'Female', value: 'F' }], 
                cRadioDefaultOption: 'M', 
                cLabel:'Gender', 
                cLabelSize: 4, 
                cOrder: 125, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_zipcode: { 
                cValidate :'', 
                cName: 'zipcode', 
                cLabel: 'Zip Code', 
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
            PI_icno: { 
                cValidate :'', 
                cName: 'icno', 
                cLabel: 'IC No', 
                cLabelSize: 4, 
                cOrder: 126, 
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
                cOrder: 111, 
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
                cDisplayColumn: 'city_cd,country_cd,descs' ,
            }, 
            PI_passportno: { 
                cValidate :'', 
                cName: 'passportno', 
                cLabel: 'Passport No', 
                cLabelSize: 4, 
                cOrder: 127, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_phoneno: { 
                cValidate :'', 
                cName: 'phoneno', 
                cLabel: 'Phone', 
                cLabelSize: 4, 
                cOrder: 113, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_kimsno: { 
                cValidate :'', 
                cName: 'kimsno', 
                cLabel: 'KIMS No', 
                cLabelSize: 4, 
                cOrder: 129, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_faxno: { 
                cValidate :'', 
                cName: 'faxno', 
                cLabel: 'Fax', 
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
            PI_kitano: { 
                cValidate :'', 
                cName: 'kitano', 
                cLabel: 'KITA No', 
                cLabelSize: 4, 
                cOrder: 130, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_handphone: { 
                cValidate :'', 
                cName: 'handphone', 
                cLabel: 'Handphone', 
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
            PI_remarks: { 
                cValidate :'', 
                cName:'remarks', 
                cLabel:'Remarks', 
                cLabelSize: 4, 
                cOrder: 131, 
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
                cValidate :'', 
                cName: 'email', 
                cLabel: 'Email', 
                cLabelSize: 4, 
                cOrder: 117, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_attentionstatus: { 
                cValidate :'', 
                cName: 'attentionstatus', 
                cId: 'rdbattentionstatus', 
                cRadioOptions: [{ text: 'Yes', value: 'Y' }, { text: 'No', value: 'N' }], 
                cRadioDefaultOption: 'N', 
                cLabel:'UP/Attention', 
                cLabelSize: 4, 
                cOrder: 132, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_referencefilename: { 
                cValidate :'', 
                cName:'referencefilename', 
                cLabel: 'Picture File', 
                cLabelSize: 4, 
                cOrder: 133, 
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
        OngroupcdChange (data) {
        this.$nextTick(() => {
            this.M_CM_ContactPersonnelRegistration.groupcd = data.id
            this.M_CM_ContactPersonnelRegistration.groupcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{groupcd}
            }
        })
        this.$forceUpdate()
        },
        OnsalutationcdChange (data) {
        this.$nextTick(() => {
            this.M_CM_ContactPersonnelRegistration.salutationcd = data.id
            this.M_CM_ContactPersonnelRegistration.salutationcdLabel = data.label
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
        OnnationalitycdChange (data) {
        this.$nextTick(() => {
            this.M_CM_ContactPersonnelRegistration.nationalitycd = data.id
            this.M_CM_ContactPersonnelRegistration.nationalitycdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{nationalitycd}
            }
        })
        this.$forceUpdate()
        },
        OnreligioncdChange (data) {
        this.$nextTick(() => {
            this.M_CM_ContactPersonnelRegistration.religioncd = data.id
            this.M_CM_ContactPersonnelRegistration.religioncdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{religioncd}
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
        OncitycdChange (data) {
        this.$nextTick(() => {
            this.M_CM_ContactPersonnelRegistration.citycd = data.id
            this.M_CM_ContactPersonnelRegistration.citycdLabel = data.label
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
        OnattentionstatusChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{attentionstatus}
            }
        })
        this.$forceUpdate()
        },
		
		setToolbarButton () {
           this.getToolbar().statusFunction[0].disabled = true
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
            this.M_CM_ContactPersonnelRegistration.sequenceregistrationno = data.sequence_registration_no
            // this.M_CM_ContactPersonnelRegistration.cmcontactregistrationid = data.cm_contact_registration_id
            this.propList.initialWhere =" cm_contact_registration_id = '" + data.cm_contact_registration_id + "' "
        

            this.FormToABSList().doGetList('','eb_getList')
        },		       
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                sequence_registration_no: this.M_CM_ContactPersonnelRegistration.sequenceregistrationno,
                contact_personnel_id: this.M_CM_ContactPersonnelRegistration.contactpersonnelid,
                contact_type: this.M_CM_ContactPersonnelRegistration.contacttype,
                salutation_cd: this.M_CM_ContactPersonnelRegistration.salutationcd == '' || this.M_CM_ContactPersonnelRegistration.salutationcd == null ? 'NULL' : this.M_CM_ContactPersonnelRegistration.salutationcd ,
                full_name: this.M_CM_ContactPersonnelRegistration.fullname,
                family_name: this.M_CM_ContactPersonnelRegistration.familyname,
                address1: this.M_CM_ContactPersonnelRegistration.address1,
                address2: this.M_CM_ContactPersonnelRegistration.address2,
                address3: this.M_CM_ContactPersonnelRegistration.address3,
                address4: this.M_CM_ContactPersonnelRegistration.address4,
                group_cd: this.M_CM_ContactPersonnelRegistration.groupcd == '' || this.M_CM_ContactPersonnelRegistration.groupcd == null ? 'NULL' : this.M_CM_ContactPersonnelRegistration.groupcd ,
                descs: this.M_CM_ContactPersonnelRegistration.descs,
                city_cd: this.M_CM_ContactPersonnelRegistration.citycd == '' || this.M_CM_ContactPersonnelRegistration.citycd == null ? 'NULL' : this.M_CM_ContactPersonnelRegistration.citycd ,
                zip_code: this.M_CM_ContactPersonnelRegistration.zipcode,
                phone_no: this.M_CM_ContactPersonnelRegistration.phoneno,
                fax_no: this.M_CM_ContactPersonnelRegistration.faxno,
                hand_phone: this.M_CM_ContactPersonnelRegistration.handphone,
                email: this.M_CM_ContactPersonnelRegistration.email,
                job_title: this.M_CM_ContactPersonnelRegistration.jobtitle,
                birth_date: this.M_CM_ContactPersonnelRegistration.birthdate == '' || this.M_CM_ContactPersonnelRegistration.birthdate == null ? 'NULL' : this.M_CM_ContactPersonnelRegistration.birthdate ,
                nationality_cd: this.M_CM_ContactPersonnelRegistration.nationalitycd == '' || this.M_CM_ContactPersonnelRegistration.nationalitycd == null ? 'NULL' : this.M_CM_ContactPersonnelRegistration.nationalitycd ,
                religion_cd: this.M_CM_ContactPersonnelRegistration.religioncd == '' || this.M_CM_ContactPersonnelRegistration.religioncd == null ? 'NULL' : this.M_CM_ContactPersonnelRegistration.religioncd ,
                gender: this.M_CM_ContactPersonnelRegistration.gender,
                marital_status: this.M_CM_ContactPersonnelRegistration.maritalstatus,
                children: this.M_CM_ContactPersonnelRegistration.children,
                ic_no: this.M_CM_ContactPersonnelRegistration.icno,
                passport_no: this.M_CM_ContactPersonnelRegistration.passportno,
                kims_no: this.M_CM_ContactPersonnelRegistration.kimsno,
                kita_no: this.M_CM_ContactPersonnelRegistration.kitano,
                picture_file_name: this.M_CM_ContactPersonnelRegistration.picturefilename,
                reference_file_name: this.M_CM_ContactPersonnelRegistration.referencefilename,
                remarks: this.M_CM_ContactPersonnelRegistration.remarks,
                user_input: this.getDataUser().user_id ,
                debtor_cd: this.M_CM_ContactPersonnelRegistration.debtorcd,
                attention_status: this.M_CM_ContactPersonnelRegistration.attentionstatus                
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
                sequence_registration_no: this.M_CM_ContactPersonnelRegistration.sequenceregistrationno,
                contact_personnel_id: this.M_CM_ContactPersonnelRegistration.contactpersonnelid,
                contact_type: this.M_CM_ContactPersonnelRegistration.contacttype,
                salutation_cd: this.M_CM_ContactPersonnelRegistration.salutationcd == '' || this.M_CM_ContactPersonnelRegistration.salutationcd == null ? 'NULL' : this.M_CM_ContactPersonnelRegistration.salutationcd ,
                full_name: this.M_CM_ContactPersonnelRegistration.fullname,
                family_name: this.M_CM_ContactPersonnelRegistration.familyname,
                address1: this.M_CM_ContactPersonnelRegistration.address1,
                address2: this.M_CM_ContactPersonnelRegistration.address2,
                address3: this.M_CM_ContactPersonnelRegistration.address3,
                address4: this.M_CM_ContactPersonnelRegistration.address4,
                city_cd: this.M_CM_ContactPersonnelRegistration.citycd == '' || this.M_CM_ContactPersonnelRegistration.citycd == null ? 'NULL' : this.M_CM_ContactPersonnelRegistration.citycd ,
                group_cd: this.M_CM_ContactPersonnelRegistration.groupcd == '' || this.M_CM_ContactPersonnelRegistration.groupcd == null ? 'NULL' : this.M_CM_ContactPersonnelRegistration.groupcd ,
                descs: this.M_CM_ContactPersonnelRegistration.descs,
                zip_code: this.M_CM_ContactPersonnelRegistration.zipcode,
                phone_no: this.M_CM_ContactPersonnelRegistration.phoneno,
                fax_no: this.M_CM_ContactPersonnelRegistration.faxno,
                hand_phone: this.M_CM_ContactPersonnelRegistration.handphone,
                email: this.M_CM_ContactPersonnelRegistration.email,
                job_title: this.M_CM_ContactPersonnelRegistration.jobtitle,
                birth_date: this.M_CM_ContactPersonnelRegistration.birthdate == '' || this.M_CM_ContactPersonnelRegistration.birthdate == null ? 'NULL' : this.M_CM_ContactPersonnelRegistration.birthdate ,
                nationality_cd: this.M_CM_ContactPersonnelRegistration.nationalitycd == '' || this.M_CM_ContactPersonnelRegistration.nationalitycd == null ? 'NULL' : this.M_CM_ContactPersonnelRegistration.nationalitycd ,
                religion_cd: this.M_CM_ContactPersonnelRegistration.religioncd == '' || this.M_CM_ContactPersonnelRegistration.religioncd == null ? 'NULL' : this.M_CM_ContactPersonnelRegistration.religioncd ,
                gender: this.M_CM_ContactPersonnelRegistration.gender,
                marital_status: this.M_CM_ContactPersonnelRegistration.maritalstatus,
                children: this.M_CM_ContactPersonnelRegistration.children,
                ic_no: this.M_CM_ContactPersonnelRegistration.icno,
                passport_no: this.M_CM_ContactPersonnelRegistration.passportno,
                kims_no: this.M_CM_ContactPersonnelRegistration.kimsno,
                kita_no: this.M_CM_ContactPersonnelRegistration.kitano,
                picture_file_name: this.M_CM_ContactPersonnelRegistration.picturefilename,
                reference_file_name: this.M_CM_ContactPersonnelRegistration.referencefilename,
                remarks: this.M_CM_ContactPersonnelRegistration.remarks,
                user_edit: this.getDataUser().user_id ,
                lastupdatestamp: this.M_CM_ContactPersonnelRegistration.lastupdatestamp,
                debtor_cd: this.M_CM_ContactPersonnelRegistration.debtorcd,
                attention_status: this.M_CM_ContactPersonnelRegistration.attentionstatus                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_CM_ContactPersonnelRegistration = {
                sequenceregistrationno: 0,
                cmcontactregistrationid: '',
                cmcontactpersonnelregistrationid: '',
                contactpersonnelid: '',
                contacttype: '',
                primarycontactpersonnel: '',
                salutationcd: '',
                fullname: '',
                familyname: '',
                address1: '',
                address2: '',
                address3: '',
                address4: '',
                citycd: '',
                zipcode: '',
                phoneno: '',
                faxno: '',
                handphone: '',
                email: '',
                jobtitle: '',
                birthdate: '',
                nationalitycd: '',
                religioncd: '',
                gender: 'M',
                maritalstatus: 'S',
                children: '0',
                icno: '',
                passportno: '',
                kimsno: '',
                kitano: '',
                picturefilename: '',
                referencefilename: '',
                groupcd: '',
                descs: '',
                remarks: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                controlsequenceno: 0,
                attentionstatus: 'N',
                groupdescs: '',
                salutationdescs: '',
                nationalitydescs: '',
                religiondescs: '',
                citydescs: '',
                debtorcd: '',
                lastupdatestamp: 0,
                rowid: 0
                    }
            		
		},
        M_New(){
            let data = this.$store.getters.GetPage1Data
            this.M_CM_ContactPersonnelRegistration.sequenceregistrationno = data.sequence_registration_no
            this.M_CM_ContactPersonnelRegistration.cmcontactregistrationid = data.cm_contact_registration_id

            this.$refs.ref_contactpersonnelid.focus()

        },
        M_Edit(){
          this.$refs.ref_groupcd.focus()
        },
        M_Delete(dt){           

            var data = this.FormToABSList().getRowSelected()  
            var dataDelete = []

            
            data.forEach((value) => {
            dataDelete.push({
            sequence_registration_no: value.sequence_registration_no,
            contact_personnel_id: value.contact_personnel_id,
            lastupdatestamp: value.lastupdatestamp,
            _Message_: "",
            debtor_cd: ''
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
                cm_contact_personnel_registration_id: record.cm_contact_personnel_registration_id,
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
this.M_CM_ContactPersonnelRegistration = {
                sequenceregistrationno: data.sequence_registration_no,
                cmcontactregistrationid: data.cm_contact_registration_id,
                cmcontactpersonnelregistrationid: data.cm_contact_personnel_registration_id,
                contactpersonnelid: data.contact_personnel_id,
                contacttype: data.contact_type,
                primarycontactpersonnel: data.primary_contact_personnel,
                salutationcd: data.salutation_cd,
                fullname: data.full_name,
                familyname: data.family_name,
                address1: data.address1,
                address2: data.address2,
                address3: data.address3,
                address4: data.address4,
                citycd: data.city_cd,
                zipcode: data.zip_code,
                phoneno: data.phone_no,
                faxno: data.fax_no,
                handphone: data.hand_phone,
                email: data.email,
                jobtitle: data.job_title,
                birthdate: data.birth_date,
                nationalitycd: data.nationality_cd,
                religioncd: data.religion_cd,
                gender: data.gender,
                maritalstatus: data.marital_status,
                children: data.children,
                icno: data.ic_no,
                passportno: data.passport_no,
                kimsno: data.kims_no,
                kitano: data.kita_no,
                picturefilename: data.picture_file_name,
                referencefilename: data.reference_file_name,
                groupcd: data.group_cd,
                descs: data.descs,
                remarks: data.remarks,
                userinput: data.user_input,
                useredit: data.user_edit,
                timeinput: data.time_input,
                timeedit: data.time_edit,
                controlsequenceno: data.control_sequence_no,
                attentionstatus: data.attention_status,
                groupdescs: data.group_descs,
                salutationdescs: data.salutation_descs,
                nationalitydescs: data.nationality_descs,
                religiondescs: data.religion_descs,
                citydescs: data.city_descs,
                debtorcd: data.debtor_cd,
                lastupdatestamp: record.lastupdatestamp,
                rowid: data.row_id
                    }
                 

                this.M_CM_ContactPersonnelRegistration.groupcdLabel = this.M_CM_ContactPersonnelRegistration.groupcd != null ? data.group_cd + this.separator + data.group_descs :'' 
                this.M_CM_ContactPersonnelRegistration.salutationcdLabel = this.M_CM_ContactPersonnelRegistration.salutationcd != null ? data.salutation_cd + this.separator + data.salutation_descs :'' 
                this.M_CM_ContactPersonnelRegistration.nationalitycdLabel = this.M_CM_ContactPersonnelRegistration.nationalitycd != null ? data.nationality_cd + this.separator + data.nationality_descs :'' 
                this.M_CM_ContactPersonnelRegistration.religioncdLabel = this.M_CM_ContactPersonnelRegistration.religioncd != null ? data.religion_cd + this.separator + data.religion_descs :'' 
                this.M_CM_ContactPersonnelRegistration.citycdLabel = this.M_CM_ContactPersonnelRegistration.citycd != null ? data.city_cd + this.separator + data.city_descs :'' 
  

                this.IEBy.Input = data.user_input
                this.IEBy.Edit = data.user_edit

            })
        }
        ,getFileName(fileName) {
         this.CM_ContactPersonnelRegistration.picturefilename = fileName 
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

