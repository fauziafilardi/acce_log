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
                                        <ABSinputTextVuex :prop="PI_marketingid" v-model="M_MK_Marketing.marketingid"  ref="ref_marketingid"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OncategoryChange" :prop="PI_category" v-model="M_MK_Marketing.category"  ref="ref_category"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_name" v-model="M_MK_Marketing.name"  ref="ref_name"/>
                                      </b-col>
                                    </b-row>
                                     <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnmarketinggroupcdChange" :prop="PI_marketinggroupcd" :value="M_MK_Marketing.marketinggroupcd" :label="M_MK_Marketing.marketinggroupcdLabel" ref="ref_marketinggroupcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnsalutationcdChange" :prop="PI_salutationcd" :value="M_MK_Marketing.salutationcd" :label="M_MK_Marketing.salutationcdLabel" ref="ref_salutationcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_address1" v-model="M_MK_Marketing.address1"  ref="ref_address1"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_address2" v-model="M_MK_Marketing.address2"  ref="ref_address2"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_address3" v-model="M_MK_Marketing.address3"  ref="ref_address3"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_address4" v-model="M_MK_Marketing.address4"  ref="ref_address4"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_zipcode" v-model="M_MK_Marketing.zipcode"  ref="ref_zipcode"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OncitycdChange" :prop="PI_citycd" :value="M_MK_Marketing.citycd" :label="M_MK_Marketing.citycdLabel" ref="ref_citycd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_phoneno" v-model="M_MK_Marketing.phoneno"  ref="ref_phoneno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_handphone" v-model="M_MK_Marketing.handphone"  ref="ref_handphone"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_email" v-model="M_MK_Marketing.email"  ref="ref_email"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col md="6">
                                        <ABSinputDateVuex :prop="PI_birthdate" v-model="M_MK_Marketing.birthdate"  ref="ref_birthdate" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnnationalitycdChange" :prop="PI_nationalitycd" :value="M_MK_Marketing.nationalitycd" :label="M_MK_Marketing.nationalitycdLabel" ref="ref_nationalitycd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnreligioncdChange" :prop="PI_religioncd" :value="M_MK_Marketing.religioncd" :label="M_MK_Marketing.religioncdLabel" ref="ref_religioncd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col md="6">
                                        <ABSInputSelect2 @change="OnmaritalstatusChange" :prop="PI_maritalstatus" :value="M_MK_Marketing.maritalstatus" :label="M_MK_Marketing.maritalstatusLabel" ref="ref_maritalstatus"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_children" v-model="M_MK_Marketing.children"  ref="ref_children"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OngenderChange" :prop="PI_gender" v-model="M_MK_Marketing.gender"  ref="ref_gender"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_icno" v-model="M_MK_Marketing.icno"  ref="ref_icno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_passportno" v-model="M_MK_Marketing.passportno"  ref="ref_passportno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_kimsno" v-model="M_MK_Marketing.kimsno"  ref="ref_kimsno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_kitano" v-model="M_MK_Marketing.kitano"  ref="ref_kitano"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col md="6">
                                        <ABSTextAreaVuex :prop="PI_remarks" v-model="M_MK_Marketing.remarks"  ref="ref_remarks" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSFileUpload :prop="PI_referencefilename" @fileName="getFileName" 
                                                                        v-model="M_MK_Marketing.referencefilename" 
                                                                        :file="M_MK_Marketing.picturefilename" 
                                                                        :image="M_MK_Marketing.referencefilename"
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
    props: {PageLevel: '', TabIndex: '', data: ''},
    data() {
        return {
		FormType: "List",
        Module:"MK",
        ValKey:null,
        cInsertKey:'id=marketing_id,label=marketing_id+|+name',
       propList: {
                initialWhere:"",
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

            M_MK_Marketing :{
                rowid: 0,
                marketingid: '',
                category: 'P',
                name: '',
                marketinggroupcd: '',
                salutationcd: '',
                address1: '',
                address2: '',
                address3: '',
                address4: '',
                zipcode: '',
                citycd: '',
                phoneno: '',
                handphone: '',
                email: '',
                birthdate: '',
                nationalitycd: '',
                religioncd: '',
                maritalstatus: 'S',
                children: '0',
                gender: 'M',
                icno: '',
                passportno: '',
                kimsno: '',
                kitano: '',
                remarks: '',
                picturefilename: '',
                referencefilename: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                lastupdatestamp: 0  
                    }
            ,
            PI_marketingid: {
                cValidate :'required|max:8', 
                cName: 'marketingid', 
                cLabel: 'Marketing Id', 
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
            PI_category: {
                cValidate :'', 
                cName: 'category', 
                cId: 'rdbcategory', 
                cRadioOptions: [{ text: 'Personal', value: 'P' }, { text: 'Company', value: 'C' }],
                cLabel:'Category', 
                cLabelSize: 4, 
                cOrder: 2, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_name: {
                cValidate :'max:50', 
                cName: 'name', 
                cLabel: 'Name', 
                cLabelSize: 4, 
                cOrder: 3, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_marketinggroupcd: {
                 dataLookUp: { 
                    LookUpCd: 'GetLookupMKMarketingGroup'    , 
                    ColumnDB: 'MarketingGroupCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'marketinggroupcd', 
                cLabel: 'Contact Marketing Group', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 4, 
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
                cMasterUrl: 'MK/MK_MarketingGroup' ,
                cDisplayColumn: 'marketing_group_code,descs' ,
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
                cMasterUrl: 'CM/CM_Salutation' ,
                cDisplayColumn: 'salutation_cd,descs' ,
            }, 
            PI_address1: {
                cValidate :'max:50', 
                cName: 'address1', 
                cLabel: 'Address', 
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
            PI_address2: {
                cValidate :'max:50', 
                cName: 'address2',  
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
            PI_address3: {
                cValidate :'max:50', 
                cName: 'address3', 
                cLabelSize: 4, 
                cOrder: 8, 
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
                cLabelSize: 4, 
                cOrder: 9, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_zipcode: {
                cValidate :'max:10', 
                cName: 'zipcode', 
                cLabel: 'Zip Code', 
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
                cMasterUrl: 'CM/CM_CountryCity' ,
                cDisplayColumn: 'city_cd,descs' ,
            },
            PI_phoneno: {
                cValidate :'max:30', 
                cName: 'phoneno', 
                cLabel: 'Phone', 
                cLabelSize: 4, 
                cOrder: 12, 
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
                cOrder: 13, 
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
                cOrder: 14, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_birthdate: {
                cValidate :'', 
                cName: 'birthdate', 
                cLabel: 'Birth Date', 
                cLabelSize: 4, 
                cOrder: 15, 
                cKey: false, 
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
                cOrder: 16, 
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
                cOrder: 17, 
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
            PI_maritalstatus: {
                dataLookUp: null, 
                cValidate :'', 
                cName: 'maritalstatus', 
                cLabel: 'Marital Status', 
                cLabelSize: 4, 
                cOrder: 18, 
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
            PI_children: {
                cValidate :'max:2', 
                cName: 'children', 
                cLabel: 'Children', 
                cLabelSize: 4, 
                cOrder: 19, 
                cKey: false, 
                cType: 'numeric',
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
                cLabel:'Gender', 
                cLabelSize: 4, 
                cOrder: 20, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_icno: {
                cValidate :'max:30', 
                cName: 'icno', 
                cLabel: 'IC No', 
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
            PI_passportno: {
                cValidate :'max:30', 
                cName: 'passportno', 
                cLabel: 'Passport No', 
                cLabelSize: 4, 
                cOrder: 22, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_kimsno: {
                cValidate :'max:30', 
                cName: 'kimsno', 
                cLabel: 'KIMS No', 
                cLabelSize: 4, 
                cOrder: 23, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_kitano: {
                cValidate :'max:30', 
                cName: 'kitano', 
                cLabel: 'KITA No', 
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
            PI_remarks: { 
                cValidate :'', 
                cName:'remarks', 
                cLabel:'Remarks', 
                cLabelSize: 4, 
                cOrder: 25, 
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
                cOrder: 26, 
                cVisible: true, 
                cModule: 'MK', 
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
		return this.$store.getters.GetPage1Data
	}
  },
    methods: {
        OncategoryChange (data) {
            this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
            }
        })
        this.$forceUpdate()
        },
        OnmarketinggroupcdChange (data) {
          console.log(data);
            this.$nextTick(() => {
                this.M_MK_Marketing.marketinggroupcd = data.mk_marketing_group_id
                this.M_MK_Marketing.marketinggroupcdLabel = data.label
            if (this.inputStatus != "VIEW") {
            }
        })
        this.$forceUpdate()
        },
        OnsalutationcdChange (data) {
            this.$nextTick(() => {
                this.M_MK_Marketing.salutationcd = data.cm_salutation_id
                this.M_MK_Marketing.salutationcdLabel = data.label
            if (this.inputStatus != "VIEW") {
            }
        })
        this.$forceUpdate()
        },
        OncitycdChange (data) {
            this.$nextTick(() => {
                this.M_MK_Marketing.citycd = data.cm_city_id
                this.M_MK_Marketing.citycdLabel = data.label
            if (this.inputStatus != "VIEW") {
            }
        })
        this.$forceUpdate()
        },
        OnnationalitycdChange (data) {
            this.$nextTick(() => {
                this.M_MK_Marketing.nationalitycd = data.cm_nationality_id
                this.M_MK_Marketing.nationalitycdLabel = data.label
            if (this.inputStatus != "VIEW") {
            }
        })
        this.$forceUpdate()
        },
        OnreligioncdChange (data) {
            this.$nextTick(() => {
                this.M_MK_Marketing.religioncd = data.cm_religion_id
                this.M_MK_Marketing.religioncdLabel = data.label
            if (this.inputStatus != "VIEW") {
            }
        })
        this.$forceUpdate()
        },
        OnmaritalstatusChange (data) {
            this.$nextTick(() => {
                this.M_MK_Marketing.maritalstatus = data.id
                this.M_MK_Marketing.maritalstatusLabel = data.label
            if (this.inputStatus != "VIEW") {
            }
        })
        this.$forceUpdate()
        },
        OngenderChange (data) {
            this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
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
                marketing_id: this.M_MK_Marketing.marketingid,
                category: this.M_MK_Marketing.category,
                name: this.M_MK_Marketing.name,
                mk_marketing_group_id: this.M_MK_Marketing.marketinggroupcd == '' || this.M_MK_Marketing.marketinggroupcd == null ? 'NULL' : this.M_MK_Marketing.marketinggroupcd,
                cm_salutation_id: this.M_MK_Marketing.salutationcd == '' || this.M_MK_Marketing.salutationcd == null ? 'NULL' : this.M_MK_Marketing.salutationcd,
                address1: this.M_MK_Marketing.address1,
                address2: this.M_MK_Marketing.address2,
                address3: this.M_MK_Marketing.address3,
                address4: this.M_MK_Marketing.address4,
                zip_code: this.M_MK_Marketing.zipcode,
                cm_city_id: this.M_MK_Marketing.citycd == '' || this.M_MK_Marketing.citycd == null ? 'NULL' : this.M_MK_Marketing.citycd,
                phone_no: this.M_MK_Marketing.phoneno,
                hand_phone: this.M_MK_Marketing.handphone,
                email: this.M_MK_Marketing.email,
                birth_date: this.M_MK_Marketing.birthdate == '' || this.M_MK_Marketing.birthdate == null ? 'NULL' : this.M_MK_Marketing.birthdate,
                cm_nationality_id: this.M_MK_Marketing.nationalitycd == '' || this.M_MK_Marketing.nationalitycd == null ? 'NULL' : this.M_MK_Marketing.nationalitycd,
                cm_religion_id: this.M_MK_Marketing.religioncd == '' || this.M_MK_Marketing.religioncd == null ? 'NULL' : this.M_MK_Marketing.religioncd,
                marital_status: this.M_MK_Marketing.maritalstatus,
                children: this.M_MK_Marketing.children == '' || this.M_MK_Marketing.children == null ? 0 : this.M_MK_Marketing.children,
                gender: this.M_MK_Marketing.gender,
                ic_no: this.M_MK_Marketing.icno,
                passport_no: this.M_MK_Marketing.passportno,
                kims_no: this.M_MK_Marketing.kimsno,
                kita_no: this.M_MK_Marketing.kitano,
                remarks: this.M_MK_Marketing.remarks,
                picture_file_name: this.M_MK_Marketing.picturefilename,
                reference_file_name: this.M_MK_Marketing.referencefilename,
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
                mk_marketing_id: this.M_MK_Marketing.rowid,
                marketing_id: this.M_MK_Marketing.marketingid,
                category: this.M_MK_Marketing.category,
                name: this.M_MK_Marketing.name,
                mk_marketing_group_id: this.M_MK_Marketing.marketinggroupcd == '' || this.M_MK_Marketing.marketinggroupcd == null ? 'NULL' : this.M_MK_Marketing.marketinggroupcd,
                cm_salutation_id: this.M_MK_Marketing.salutationcd == '' || this.M_MK_Marketing.salutationcd == null ? 'NULL' : this.M_MK_Marketing.salutationcd,
                address1: this.M_MK_Marketing.address1,
                address2: this.M_MK_Marketing.address2,
                address3: this.M_MK_Marketing.address3,
                address4: this.M_MK_Marketing.address4,
                zip_code: this.M_MK_Marketing.zipcode,
                cm_city_id: this.M_MK_Marketing.citycd == '' || this.M_MK_Marketing.citycd == null ? 'NULL' : this.M_MK_Marketing.citycd,
                phone_no: this.M_MK_Marketing.phoneno,
                hand_phone: this.M_MK_Marketing.handphone,
                email: this.M_MK_Marketing.email,
                birth_date: this.M_MK_Marketing.birthdate == '' || this.M_MK_Marketing.birthdate == null ? 'NULL' : this.M_MK_Marketing.birthdate,
                cm_nationality_id: this.M_MK_Marketing.nationalitycd == '' || this.M_MK_Marketing.nationalitycd == null ? 'NULL' : this.M_MK_Marketing.nationalitycd,
                cm_religion_id: this.M_MK_Marketing.religioncd == '' || this.M_MK_Marketing.religioncd == null ? 'NULL' : this.M_MK_Marketing.religioncd,
                marital_status: this.M_MK_Marketing.maritalstatus,
                children: this.M_MK_Marketing.children == '' || this.M_MK_Marketing.children == null ? 0 : this.M_MK_Marketing.children,
                gender: this.M_MK_Marketing.gender,
                ic_no: this.M_MK_Marketing.icno,
                passport_no: this.M_MK_Marketing.passportno,
                kims_no: this.M_MK_Marketing.kimsno,
                kita_no: this.M_MK_Marketing.kitano,
                remarks: this.M_MK_Marketing.remarks,
                picture_file_name: this.M_MK_Marketing.picturefilename,
                reference_file_name: this.M_MK_Marketing.referencefilename,
                user_edit: this.getDataUser().user_id,
                lastupdatestamp: this.M_MK_Marketing.lastupdatestamp           
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })

        },
		M_ClearForm(){
            this.M_MK_Marketing = {
                rowid: 0,
                marketingid: '',
                category: 'P',
                name: '',
                marketinggroupcd: '',
                salutationcd: '',
                address1: '',
                address2: '',
                address3: '',
                address4: '',
                zipcode: '',
                citycd: '',
                phoneno: '',
                handphone: '',
                email: '',
                birthdate: '',
                nationalitycd: '',
                religioncd: '',
                maritalstatus: 'S',
                children: '',
                gender: 'M',
                icno: '',
                passportno: '',
                kimsno: '',
                kitano: '',
                remarks: '',
                picturefilename: '',
                referencefilename: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                lastupdatestamp: 0  
                    }
            		
		},
        M_New(){
            this.$refs.ref_marketingid.focus()
        },
        M_Edit(){
            this.$refs.ref_category.focus()
        },
        M_Delete(dt){       

        var data = this.FormToABSList().getRowSelected()  
        var dataDelete = []

        
        data.forEach((value) => {
            console.log(value);
          dataDelete.push({
          mk_marketing_id: value.mk_marketing_id,
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
            console.log(record);
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                mk_marketing_id: record.mk_marketing_id
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                console.log(data);
this.M_MK_Marketing = {
                rowid: data.mk_marketing_id,
                marketingid: data.marketing_id,
                category: data.category,
                name: data.name,
                marketinggroupcd: data.mk_marketing_group_id,
                salutationcd: data.cm_salutation_id,
                address1: data.address1,
                address2: data.address2,
                address3: data.address3,
                address4: data.address4,
                zipcode: data.zip_code,
                citycd: data.cm_city_id,
                phoneno: data.phone_no,
                handphone: data.hand_phone,
                email: data.email,
                birthdate: data.birth_date,
                nationalitycd: data.cm_nationality_id,
                religioncd: data.cm_religion_id,
                maritalstatus: data.marital_status,
                children: data.children,
                gender: data.gender,
                icno: data.ic_no,
                passportno: data.passport_no,
                kimsno: data.kims_no,
                kitano: data.kita_no,
                remarks: data.remarks,
                picturefilename: data.picture_file_name,
                referencefilename: data.reference_file_name,
                userinput: data.user_input,
                useredit: data.user_edit,
                timeinput: data.time_input,
                timeedit: data.time_edit,
                lastupdatestamp: data.lastupdatestamp
                }
                 
                this.M_MK_Marketing.marketinggroupcdLabel = this.M_MK_Marketing.marketinggroupcd != null && this.M_MK_Marketing.marketinggroupcd != "" ? data.marketing_group_code + this.separator + data.marketing_group_descs :'' 
                this.M_MK_Marketing.salutationcdLabel = this.M_MK_Marketing.salutationcd != null && this.M_MK_Marketing.salutationcd != "" ? data.salutation_cd + this.separator + data.salutation_descs :'' 
                this.M_MK_Marketing.citycdLabel = this.M_MK_Marketing.citycd != null && this.M_MK_Marketing.citycd != "" ? data.city_cd + this.separator + data.city_descs :'' 
                this.M_MK_Marketing.nationalitycdLabel = this.M_MK_Marketing.nationalitycd != null && this.M_MK_Marketing.nationalitycd != "" ? data.nationality_cd + this.separator + data.nationality_descs :'' 
                this.M_MK_Marketing.religioncdLabel = this.M_MK_Marketing.religioncd != null && this.M_MK_Marketing.religioncd != "" ? data.religion_cd + this.separator + data.religion_descs :'' 
         

                this.IEBy.Input = data.user_input
                this.IEBy.Edit = data.user_edit

            })
        },
        getFileName(fileName) {
         this.M_MK_Marketing.picturefilename = fileName 
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

