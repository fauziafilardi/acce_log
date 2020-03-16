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
                                <b-col md="6" id="col-left"> <!-- table open -->
                                    <b-row>
                                      <b-col  md="12">
                                        <ABSinputTextVuex :prop="PI_subportfolio_cd" v-model="M_CM_SubPortfolio.subportfolio_cd"  ref="ref_subportfolio_cd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="12">
                                        <ABSinputTextVuex :prop="PI_name" v-model="M_CM_SubPortfolio.name"  ref="ref_name"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="12">
                                        <ABSInputSelectList @change="Onsubportfolio_class_cdChange" :prop="PI_subportfolio_class_cd" :value="M_CM_SubPortfolio.subportfolio_class_cd" :label="M_CM_SubPortfolio.subportfolio_class_cdLabel" ref="ref_subportfolio_class_cd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="12">
                                        <ABSInputSelectList @change="Onsubportfolio_group_cdChange" :prop="PI_subportfolio_group_cd" :value="M_CM_SubPortfolio.subportfolio_group_cd" :label="M_CM_SubPortfolio.subportfolio_group_cdLabel" ref="ref_subportfolio_group_cd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="12">
                                        <ABSinputDateVuex @input="Onsubportfolio_startChange" :prop="PI_subportfolio_start" v-model="M_CM_SubPortfolio.subportfolio_start"  ref="ref_subportfolio_start" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col md="12">
                                        <ABSinputTextVuex :prop="PI_reference_no" v-model="M_CM_SubPortfolio.reference_no"  ref="ref_reference_no"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="12">
                                        <ABSinputTextVuex @input="Onaddress1Change" :prop="PI_address1" v-model="M_CM_SubPortfolio.address1"  ref="ref_address1"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="12">
                                        <ABSinputTextVuex :prop="PI_address2" v-model="M_CM_SubPortfolio.address2"  ref="ref_address2"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="12">
                                        <ABSinputTextVuex :prop="PI_address3" v-model="M_CM_SubPortfolio.address3"  ref="ref_address3"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col md="12">
                                        <ABSinputTextVuex :prop="PI_address4" v-model="M_CM_SubPortfolio.address4"  ref="ref_address4"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col md="12">
                                        <ABSinputTextVuex :prop="PI_zip_code" v-model="M_CM_SubPortfolio.zip_code"  ref="ref_zip_code"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="12">
                                        <ABSInputSelectList @change="Oncity_cdChange" :prop="PI_city_cd" :value="M_CM_SubPortfolio.city_cd" :label="M_CM_SubPortfolio.city_cdLabel" ref="ref_city_cd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="12">
                                        <ABSinputTextVuex :prop="PI_phone_no" v-model="M_CM_SubPortfolio.phone_no"  ref="ref_phone_no"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="12">
                                        <ABSinputTextVuex :prop="PI_fax_no" v-model="M_CM_SubPortfolio.fax_no"  ref="ref_fax_no"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col md="12">
                                        <ABSinputTextVuex :prop="PI_website" v-model="M_CM_SubPortfolio.website"  ref="ref_website"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="12">
                                        <ABSinputTextVuex :prop="PI_email" v-model="M_CM_SubPortfolio.email"  ref="ref_email"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="12">
                                        <ABSInputSelectList @change="Oninternal_contact_idChange" :prop="PI_internal_contact_id" :value="M_CM_SubPortfolio.internal_contact_id" :label="M_CM_SubPortfolio.internal_contact_idLabel" ref="ref_internal_contact_id"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="12">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_CM_SubPortfolio.remarks"  ref="ref_remarks" />
                                      </b-col>
                                    </b-row>
                                </b-col> <!-- table close -->
                                <b-col md="6" id="col-right"> <!-- table open right -->
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_tax_address1" v-model="M_CM_SubPortfolio.tax_address1"  ref="ref_tax_address1"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_tax_address2" v-model="M_CM_SubPortfolio.tax_address2"  ref="ref_tax_address2"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_tax_address3" v-model="M_CM_SubPortfolio.tax_address3"  ref="ref_tax_address3"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_tax_address4" v-model="M_CM_SubPortfolio.tax_address4"  ref="ref_tax_address4"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_tax_zip_code" v-model="M_CM_SubPortfolio.tax_zip_code"  ref="ref_tax_zip_code"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Ontax_city_cdChange" :prop="PI_tax_city_cd" :value="M_CM_SubPortfolio.tax_city_cd" :label="M_CM_SubPortfolio.tax_city_cdLabel" ref="ref_tax_city_cd"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_tax_registration_no" v-model="M_CM_SubPortfolio.tax_registration_no"  ref="ref_tax_registration_no"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputDateVuex @input="Ontax_registration_dateChange" :prop="PI_tax_registration_date" v-model="M_CM_SubPortfolio.tax_registration_date"  ref="ref_tax_registration_date" />
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputTextVuex :prop="PI_tax_reference_no" v-model="M_CM_SubPortfolio.tax_reference_no"  ref="ref_tax_reference_no"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputRadioButtonVuex @input="Onhold_vatChange" :prop="PI_hold_vat" v-model="M_CM_SubPortfolio.hold_vat"  ref="ref_hold_vat" />
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputRadioButtonVuex @input="Onhold_withholdingChange" :prop="PI_hold_withholding" v-model="M_CM_SubPortfolio.hold_withholding"  ref="ref_hold_withholding" />
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Onstandard_tax_running_cdChange" :prop="PI_standard_tax_running_cd" :value="M_CM_SubPortfolio.standard_tax_running_cd" :label="M_CM_SubPortfolio.standard_tax_running_cdLabel" ref="ref_standard_tax_running_cd"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Oncommon_tax_running_cdChange" :prop="PI_common_tax_running_cd" :value="M_CM_SubPortfolio.common_tax_running_cd" :label="M_CM_SubPortfolio.common_tax_running_cdLabel" ref="ref_common_tax_running_cd"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Onar_withholding_tax_running_cdChange" :prop="PI_ar_withholding_tax_running_cd" :value="M_CM_SubPortfolio.ar_withholding_tax_running_cd" :label="M_CM_SubPortfolio.ar_withholding_tax_running_cdLabel" ref="ref_ar_withholding_tax_running_cd"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Onap_vat_deduction_running_cdChange" :prop="PI_ap_vat_deduction_running_cd" :value="M_CM_SubPortfolio.ap_vat_deduction_running_cd" :label="M_CM_SubPortfolio.ap_vat_deduction_running_cdLabel" ref="ref_ap_vat_deduction_running_cd"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSInputSelectList @change="Onap_withholding_deduction_running_cdChange" :prop="PI_ap_withholding_deduction_running_cd" :value="M_CM_SubPortfolio.ap_withholding_deduction_running_cd" :label="M_CM_SubPortfolio.ap_withholding_deduction_running_cdLabel" ref="ref_ap_withholding_deduction_running_cd"/>
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputRadioButtonVuex @input="Ondefault_vat_charges_assignmentChange" :prop="PI_default_vat_charges_assignment" v-model="M_CM_SubPortfolio.default_vat_charges_assignment"  ref="ref_default_vat_charges_assignment" />
                                    </b-col>
                                  </b-row>
                                  <b-row>
                                    <b-col md="12">
                                      <ABSinputRadioButtonVuex @input="Onone_bill_masterChange" :prop="PI_one_bill_master" v-model="M_CM_SubPortfolio.one_bill_master"  ref="ref_one_bill_master" />
                                    </b-col>
                                  </b-row>
                                </b-col> <!--- table close right -->
                                <div class="div-collapse">
                                    <span class="master-span-form">
                                        Picture
                                    </span>
                                </div>
                                <b-col md="12" id="col-left"> <!-- table open -->
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSFileUpload :prop="PI_reference_filename" @_filename="get_filename"
                                                                        @response ="getResponse"
                                                                        v-model="M_CM_SubPortfolio.reference_filename" 
                                                                        :file="M_CM_SubPortfolio.picture_filename" 
                                                                        :image="M_CM_SubPortfolio.reference_filename"
                                                                         ref="ref_reference_filename" />
                                      </b-col>
                                      <b-col  md="6">
                                        <!-- <ABSFileUpload :prop="PI_map_filename" @_filename="getMapname" 
                                                                        v-model="M_CM_SubPortfolio.map_filename" 
                                                                        :file="M_CM_SubPortfolio.picture_filename" 
                                                                        :image="M_CM_SubPortfolio.map_filename"
                                                                         ref="ref_map_filename" /> -->
                                        <ABSFileUpload :prop="PI_reference_filename2" @_filename="getMapname"
                                                                        @response ="getResponse2"
                                                                        v-model="M_CM_SubPortfolio.map_filename" 
                                                                        :file="M_CM_SubPortfolio.map_filename" 
                                                                        :image="M_CM_SubPortfolio.map_filename"
                                                                         ref="ref_reference_filename" />
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

            M_CM_SubPortfolio :{
                subportfolio_cd: '',
                name: '',
                subportfolio_class_cd: '',
                subportfolio_group_cd: '',
                subportfolio_start: '',
                reference_no: '',
                address1: '',
                address2: '',
                address3: '',
                address4: '',
                city_cd: '',
                zip_code: '',
                phone_no: '',
                fax_no: '',
                website: '',
                email: '',
                internal_contact_id: '',
                tax_address1: '',
                tax_address2: '',
                tax_address3: '',
                tax_address4: '',
                tax_city_cd: '',
                tax_zip_code: '',
                tax_registration_no: '',
                tax_registration_date: '',
                tax_reference_no: '',
                standard_tax_running_cd: '',
                common_tax_running_cd: '',
                ar_withholding_tax_running_cd: '',
                ap_vat_deduction_running_cd: '',
                ap_withholding_deduction_running_cd: '',
                default_vat_charges_assignment: 'D',
                hold_vat: 'C',
                hold_withholding: 'M',
                remarks: '',
                one_bill_master: 'N',
                picture_filename: '',
                reference_filename: '',
                user_input: '',
                user_edit: this.getDataUser().user_id,
                subportfolio_class_descs: '',
                city_descs: '',
                tax_city_descs: '',
                standard_tax_running_cd_descs: '',
                common_tax_running_cd_descs: '',
                ar_withholding_tax_running_cd_descs: '',
                ap_withholding_deduction_running_cd_descs: '',
                ap_vat_deduction_running_cd_descs: '',
                subportfolio_group_cd_descs: '',
                lastupdatestamp: 0,
                row_id: 0,
                url_picture_map:'',
                map_filename:'',
                reference_filename2:'',
                picture_filename2:''
                    }
            ,
            PI_subportfolio_cd: { 
                cValidate :'required|max:3', 
                cName: 'subportfolio_cd', 
                cLabel: 'SubPortfolio Code', 
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
            PI_tax_address1: { 
                cValidate :'max:50', 
                cName: 'tax_address1', 
                cLabel: 'tax_ Reg address', 
                cLabelSize: 4, 
                cOrder: 20, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_name: { 
                cValidate :'required|max:60', 
                cName: 'name', 
                cLabel: 'name', 
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
            PI_tax_address2: { 
                cValidate :'max:50', 
                cName: 'tax_address2', 
                cLabel: '', 
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
            PI_subportfolio_class_cd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMSubPortfolioClass'    , 
                    ColumnDB: 'subportfolio_class_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
                cName: 'subportfolio_class_cd', 
                cLabel: 'SubPortfolio Class', 
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
                cMasterUrl: 'CM/CM_SubPortfolioClass' ,
                cDisplayColumn: 'subportfolio_class_cd,Descs' ,
            }, 
            PI_tax_address3: { 
                cValidate :'max:50', 
                cName: 'tax_address3', 
                cLabel: '', 
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
            PI_subportfolio_group_cd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMSUbPortfolioGroup'    , 
                    ColumnDB: 'subportfolio_group_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'subportfolio_group_cd', 
                cLabel: 'SubPortfolio Holding Group', 
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
                cMasterUrl: '' ,
                cDisplayColumn: 'subportfolio_group,Descs' ,
            }, 
            PI_tax_address4: { 
                cValidate :'max:50', 
                cName: 'tax_address4', 
                cLabel: '', 
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
            PI_subportfolio_start: { 
                cValidate :'', 
                cName: 'subportfolio_start', 
                cLabel: 'Start Operation', 
                cLabelSize: 4, 
                cOrder: 5, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_tax_zip_code: { 
                cValidate :'max:10', 
                cName: 'tax_zip_code', 
                cLabel: 'Zip Code', 
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
            PI_tax_city_cd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMCity'    , 
                    ColumnDB: 'city_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'tax_city_cd', 
                cLabel: 'City', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 25, 
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
                cDisplayColumn: 'city_cd,country_cd,Descs' ,
            }, 
            PI_tax_registration_no: { 
                cValidate :'', 
                cName: 'tax_registration_no', 
                cLabel: 'tax_ Reg No', 
                cLabelSize: 4, 
                cOrder: 26, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_reference_no: { 
                cValidate :'max:20', 
                cName: 'reference_no', 
                cLabel: 'Reference No', 
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
            PI_address1: { 
                cValidate :'required|max:50', 
                cName: 'address1', 
                cLabel: 'address', 
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
            PI_tax_registration_date: { 
                cValidate :'', 
                cName: 'tax_registration_date', 
                cLabel: 'tax_ Reg Date', 
                cLabelSize: 4, 
                cOrder: 27, 
                cKey: false, 
                cVisible:  true, 
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
                cOrder: 8, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_tax_reference_no: { 
                cValidate :'', 
                cName: 'tax_reference_no', 
                cLabel: 'tax_ Ref No', 
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
            PI_hold_vat: { 
                cValidate :'', 
                cName: 'hold_vat', 
                cId: 'rdbhold_vat', 
                cRadioOptions: [{ text: 'Yes', value: 'M' }, { text: 'No', value: 'C' }], 
                cRadioDefaultOption: '', 
                cLabel:'Hold VAT', 
                cLabelSize: 4, 
                cOrder: 29, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_address3: { 
                cValidate :'max:50', 
                cName: 'address3', 
                cLabel: '', 
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
            PI_hold_withholding: { 
                cValidate :'', 
                cName: 'hold_withholding', 
                cId: 'rdbhold_withholding', 
                cRadioOptions: [{ text: 'Yes', value: 'M' }, { text: 'No', value: 'C' }], 
                cRadioDefaultOption: '', 
                cLabel:'Hold Withholding', 
                cLabelSize: 4, 
                cOrder: 30, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_address4: { 
                cValidate :'max:50', 
                cName: 'address4', 
                cLabel: '', 
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
            PI_zip_code: { 
                cValidate :'max:10', 
                cName: 'zip_code', 
                cLabel: ' Zip Code', 
                cLabelSize: 4, 
                cOrder: 11, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_city_cd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMCity'    , 
                    ColumnDB: 'city_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
                cName: 'city_cd', 
                cLabel: 'City', 
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
                cMasterUrl: 'CM/CM_CountryCity' ,
                cDisplayColumn: 'city_cd,country_cd,Descs' ,
            }, 
            PI_standard_tax_running_cd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMRunningCode'    , 
                    ColumnDB: 'running_cd'   , 
                    InitialWhere:  "(module_cd is null OR module_cd = 'CM')"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'standard_tax_running_cd', 
                cLabel: 'Standard tax_ RC', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 31, 
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
                cMasterUrl: 'CM/CM_running_cd' ,
                cDisplayColumn: 'running_cd,Descs' ,
            }, 
            PI_common_tax_running_cd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMRunningCode'    , 
                    ColumnDB: 'running_cd'   , 
                    InitialWhere:  "(module_cd is null OR module_cd = 'CM')"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'common_tax_running_cd', 
                cLabel: 'Common tax_ RC', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 32, 
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
                cMasterUrl: 'CM/CM_running_cd' ,
                cDisplayColumn: 'running_cd,Descs' ,
            }, 
            PI_phone_no: { 
                cValidate :'max:30', 
                cName: 'phone_no', 
                cLabel: 'Telephone', 
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
            PI_ar_withholding_tax_running_cd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMRunningCode'    , 
                    ColumnDB: 'running_cd'   , 
                    InitialWhere:  "(module_cd is null OR module_cd = 'CM')"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'ar_withholding_tax_running_cd', 
                cLabel: 'AR WithHolding tax_ RC', 
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
                cMasterUrl: 'CM/CM_running_cd' ,
                cDisplayColumn: 'running_cd,Descs' ,
            }, 
            PI_fax_no: { 
                cValidate :'max:30', 
                cName: 'fax_no', 
                cLabel: 'Fax', 
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
            PI_ap_vat_deduction_running_cd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMRunningCode'    , 
                    ColumnDB: 'running_cd'   , 
                    InitialWhere:  "(module_cd is null OR module_cd = 'CM')"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'ap_vat_deduction_running_cd', 
                cLabel: 'AP VAT Deduction RC', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 34, 
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
                cMasterUrl: 'CM/CM_running_cd' ,
                cDisplayColumn: 'running_cd,Descs' ,
            }, 
            PI_website: { 
                cValidate :'max:60', 
                cName: 'website', 
                cLabel: 'website', 
                cLabelSize: 4, 
                cOrder: 15, 
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
                cLabel: 'email', 
                cLabelSize: 4, 
                cOrder: 16, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_ap_withholding_deduction_running_cd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMRunningCode'    , 
                    ColumnDB: 'running_cd'   , 
                    InitialWhere:  "(module_cd is null OR module_cd = 'CM')"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'ap_withholding_deduction_running_cd', 
                cLabel: 'AP WithHolding Deduction RC', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 35, 
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
                cMasterUrl: 'CM/CM_running_cd' ,
                cDisplayColumn: 'running_cd,Descs' ,
            }, 
            PI_internal_contact_id: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMContact'    , 
                    ColumnDB: 'contact_id'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'internal_contact_id', 
                cLabel: 'Internal Contact', 
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
                cMasterUrl: 'CM/CM_Contact' ,
                cDisplayColumn: 'contact_id,name' ,
            }, 
            PI_default_vat_charges_assignment: { 
                cValidate :'', 
                cName: 'default_vat_charges_assignment', 
                cId: 'rdbdefault_vat_charges_assignment', 
                cRadioOptions: [{ text: 'Split', value: 'S' },{ text: 'Combine', value: 'C' },{ text: 'Default System', value: 'D' },], 
                cRadioDefaultOption: 'D', 
                cLabel:'Default VAT Charges Assignment', 
                cLabelSize: 4, 
                cOrder: 36, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_remarks: { 
                cValidate :'', 
                cName:'remarks', 
                cLabel:'remarks', 
                cLabelSize: 4, 
                cOrder:18, 
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
            PI_one_bill_master: { 
                cValidate :'', 
                cName: 'one_bill_master', 
                cId: 'rdbone_bill_master', 
                cRadioOptions: [{ text: 'Yes', value: 'Y' },{ text: 'No', value: 'N' },], 
                cRadioDefaultOption: 'N', 
                cLabel:'One Bill Master', 
                cLabelSize: 4, 
                cOrder: 37, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            // PI_reference_filename: { 
            //     cValidate :'', 
            //     cName:'reference_filename', 
            //     cLabel: 'Picture File', 
            //     cLabelSize: 4, 
            //     cOrder:0, 
            //     cVisible: true, 
            //     cModule: 'CM', 
            //     cPlaceholder: 'Choose a file...', 
            //     cPageLevel: this.PageLevel, 
            //     cTabIndex: this.TabIndex, 
            //     cVisible: true  
            // }, 
            PI_reference_filename: { 
                cValidate :'', 
                cName:'reference_filename', 
                cLabel: 'Picture File name', 
                cSubPortfolio:this.getDataUser().subportfolio_cd,
                cPath:"SubPortfolio",
                cLabelSize: 4, 
                cOrder:19, 
                cVisible: true, 
                cProtect: false,
                cModule: 'CM', 
                cPlaceholder: 'Choose a file...', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            }, 
            PI_reference_filename2: { 
                cValidate :'', 
                cName:'map_filename', 
                cLabel: 'Map File name', 
                cSubPortfolio:this.getDataUser().subportfolio_cd,
                cPath:"SubPortfolio/FloorPlan",
                cLabelSize: 4, 
                cOrder:38, 
                cVisible: true, 
                cProtect: false,
                cModule: 'CM', 
                cPlaceholder: 'Choose a Map...', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            // PI_map_filename: { 
            //     cValidate :'', 
            //     cName:'reference_filename', 
            //     cLabel: 'Picture File namex', 
            //     cSubPortfolio:this.getDataUser().subportfolio_cd,
            //     // cPath:"SaveLocation/SubPortfolio/"+this.getDataUser().subportfolio_cd+"/FloorPlan",
            //     cLabelSize: 4, 
            //     cOrder:0, 
            //     cVisible: true, 
            //     cModule: 'CM', 
            //     cPlaceholder: 'Choose a file...', 
            //     cPageLevel: this.PageLevel, 
            //     cTabIndex: this.TabIndex, 
            //     cVisible: true 
            // }, 
           

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
      getResponse (response) {

      },
      getResponse2 (response) {

      },
        Onsubportfolio_class_cdChange (data) {
        if (this.M_CM_SubPortfolio.subportfolio_class_cd == data.id) return
        this.$nextTick(() => {
            this.M_CM_SubPortfolio.subportfolio_class_cd = data.id
            this.M_CM_SubPortfolio.subportfolio_class_cdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{subportfolio_class_cd}
            }
        })
        this.$forceUpdate()
        },
        Onsubportfolio_group_cdChange (data) {
        if (this.M_CM_SubPortfolio.subportfolio_group_cd == data.id) return
        this.$nextTick(() => {
            this.M_CM_SubPortfolio.subportfolio_group_cd = data.id
            this.M_CM_SubPortfolio.subportfolio_group_cdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{subportfolio_group_cd}
            }
        })
        this.$forceUpdate()
        },
        Onsubportfolio_startChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{subportfolio_start}
            }
        })
        this.$forceUpdate()
        },
        Ontax_city_cdChange (data) {
        if (this.M_CM_SubPortfolio.tax_city_cd == data.id) return
        this.$nextTick(() => {
            this.M_CM_SubPortfolio.tax_city_cd = data.id
            this.M_CM_SubPortfolio.tax_city_cdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{tax_city_cd}
            }
        })
        this.$forceUpdate()
        },
        Onaddress1Change (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
        if (this.M_CM_SubPortfolio.city_cd == 'TT')
             { this.M_CM_SubPortfolio.address1 = 'rumah kita' }

            }
        })
        this.$forceUpdate()
        },
        Ontax_registration_dateChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{tax_registration_date}
            }
        })
        this.$forceUpdate()
        },
        Onhold_vatChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{hold_vat}
            }
        })
        this.$forceUpdate()
        },
        Onhold_withholdingChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{hold_withholding}
            }
        })
        this.$forceUpdate()
        },
        Oncity_cdChange (data) {
        if (this.M_CM_SubPortfolio.city_cd == data.id) return
        this.$nextTick(() => {
            this.M_CM_SubPortfolio.city_cd = data.id
            this.M_CM_SubPortfolio.city_cdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{city_cd}
            }
        })
        this.$forceUpdate()
        },
        Onstandard_tax_running_cdChange (data) {
        if (this.M_CM_SubPortfolio.standard_tax_running_cd == data.id) return
        this.$nextTick(() => {
            this.M_CM_SubPortfolio.standard_tax_running_cd = data.id
            this.M_CM_SubPortfolio.standard_tax_running_cdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{standard_tax_running_cd}
            }
        })
        this.$forceUpdate()
        },
        Oncommon_tax_running_cdChange (data) {
        if (this.M_CM_SubPortfolio.common_tax_running_cd == data.id) return
        this.$nextTick(() => {
            this.M_CM_SubPortfolio.common_tax_running_cd = data.id
            this.M_CM_SubPortfolio.common_tax_running_cdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{common_tax_running_cd}
            }
        })
        this.$forceUpdate()
        },
        Onar_withholding_tax_running_cdChange (data) {
        if (this.M_CM_SubPortfolio.ar_withholding_tax_running_cd == data.id) return
        this.$nextTick(() => {
            this.M_CM_SubPortfolio.ar_withholding_tax_running_cd = data.id
            this.M_CM_SubPortfolio.ar_withholding_tax_running_cdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{ar_withholding_tax_running_cd}
            }
        })
        this.$forceUpdate()
        },
        Onap_vat_deduction_running_cdChange (data) {
        if (this.M_CM_SubPortfolio.ap_vat_deduction_running_cd == data.id) return
        this.$nextTick(() => {
            this.M_CM_SubPortfolio.ap_vat_deduction_running_cd = data.id
            this.M_CM_SubPortfolio.ap_vat_deduction_running_cdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{ap_vat_deduction_running_cd}
            }
        })
        this.$forceUpdate()
        },
        Onap_withholding_deduction_running_cdChange (data) {
        if (this.M_CM_SubPortfolio.ap_withholding_deduction_running_cd == data.id) return
        this.$nextTick(() => {
            this.M_CM_SubPortfolio.ap_withholding_deduction_running_cd = data.id
            this.M_CM_SubPortfolio.ap_withholding_deduction_running_cdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{ap_withholding_deduction_running_cd}
            }
        })
        this.$forceUpdate()
        },
        Oninternal_contact_idChange (data) {
        if (this.M_CM_SubPortfolio.internal_contact_id == data.id) return
        this.$nextTick(() => {
            this.M_CM_SubPortfolio.internal_contact_id = data.id
            this.M_CM_SubPortfolio.internal_contact_idLabel = data.label
            if (this.inputStatus != "VIEW") {
//{internal_contact_id}
            }
        })
        this.$forceUpdate()
        },
        Ondefault_vat_charges_assignmentChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{default_vat_charges_assignment}
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
        Onone_bill_masterChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{one_bill_master}
            }
        })
        this.$forceUpdate()
        },
	
		setToolbarButton () {
          //  this.getToolbar().statusFunction[2].disabled = true
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
                subportfolio_cd: this.M_CM_SubPortfolio.subportfolio_cd,
                name: this.M_CM_SubPortfolio.name,
                subportfolio_class_cd: this.M_CM_SubPortfolio.subportfolio_class_cd == '' || this.M_CM_SubPortfolio.subportfolio_class_cd == null ? '' : this.M_CM_SubPortfolio.subportfolio_class_cd ,
                subportfolio_group_cd: this.M_CM_SubPortfolio.subportfolio_group_cd == '' || this.M_CM_SubPortfolio.subportfolio_group_cd == null ? '' : this.M_CM_SubPortfolio.subportfolio_group_cd ,
                subportfolio_start: this.M_CM_SubPortfolio.subportfolio_start == '' || this.M_CM_SubPortfolio.subportfolio_start == null ? 'NULL' : this.M_CM_SubPortfolio.subportfolio_start ,
                reference_no: this.M_CM_SubPortfolio.reference_no,
                address1: this.M_CM_SubPortfolio.address1,
                address2: this.M_CM_SubPortfolio.address2,
                address3: this.M_CM_SubPortfolio.address3,
                address4: this.M_CM_SubPortfolio.address4,
                city_cd: this.M_CM_SubPortfolio.city_cd == '' || this.M_CM_SubPortfolio.city_cd == null ? 'NULL' : this.M_CM_SubPortfolio.city_cd ,
                zip_code: this.M_CM_SubPortfolio.zip_code,
                phone_no: this.M_CM_SubPortfolio.phone_no,
                fax_no: this.M_CM_SubPortfolio.fax_no,
                website: this.M_CM_SubPortfolio.website,
                email: this.M_CM_SubPortfolio.email,
                internal_contact_id: this.M_CM_SubPortfolio.internal_contact_id == '' || this.M_CM_SubPortfolio.internal_contact_id == null ? 'NULL' : this.M_CM_SubPortfolio.internal_contact_id ,
                tax_address1: this.M_CM_SubPortfolio.tax_address1,
                tax_address2: this.M_CM_SubPortfolio.tax_address2,
                tax_address3: this.M_CM_SubPortfolio.tax_address3,
                tax_address4: this.M_CM_SubPortfolio.tax_address4,
                tax_city_cd: this.M_CM_SubPortfolio.tax_city_cd == '' || this.M_CM_SubPortfolio.tax_city_cd == null ? 'NULL' : this.M_CM_SubPortfolio.tax_city_cd ,
                tax_zip_code: this.M_CM_SubPortfolio.tax_zip_code,
                tax_registration_no: this.M_CM_SubPortfolio.tax_registration_no,
                tax_registration_date: this.M_CM_SubPortfolio.tax_registration_date == '' || this.M_CM_SubPortfolio.tax_registration_date == null ? 'NULL' : this.M_CM_SubPortfolio.tax_registration_date ,
                tax_reference_no: this.M_CM_SubPortfolio.tax_reference_no,
                standard_tax_running_cd: this.M_CM_SubPortfolio.standard_tax_running_cd == '' || this.M_CM_SubPortfolio.standard_tax_running_cd == null ? 'NULL' : this.M_CM_SubPortfolio.standard_tax_running_cd ,
                common_tax_running_cd: this.M_CM_SubPortfolio.common_tax_running_cd == '' || this.M_CM_SubPortfolio.common_tax_running_cd == null ? 'NULL' : this.M_CM_SubPortfolio.common_tax_running_cd ,
                ar_withholding_tax_running_cd: this.M_CM_SubPortfolio.ar_withholding_tax_running_cd == '' || this.M_CM_SubPortfolio.ar_withholding_tax_running_cd == null ? 'NULL' : this.M_CM_SubPortfolio.ar_withholding_tax_running_cd ,
                ap_vat_deduction_running_cd: this.M_CM_SubPortfolio.ap_vat_deduction_running_cd == '' || this.M_CM_SubPortfolio.ap_vat_deduction_running_cd == null ? 'NULL' : this.M_CM_SubPortfolio.ap_vat_deduction_running_cd ,
                ap_withholding_deduction_running_cd: this.M_CM_SubPortfolio.ap_withholding_deduction_running_cd == '' || this.M_CM_SubPortfolio.ap_withholding_deduction_running_cd == null ? 'NULL' : this.M_CM_SubPortfolio.ap_withholding_deduction_running_cd ,
                default_vat_charges_assignment: this.M_CM_SubPortfolio.default_vat_charges_assignment,
                hold_vat: this.M_CM_SubPortfolio.hold_vat,
                hold_withholding: this.M_CM_SubPortfolio.hold_withholding,
                remarks: this.M_CM_SubPortfolio.remarks,
                picture_filename: this.M_CM_SubPortfolio.picture_filename,
                reference_filename: this.M_CM_SubPortfolio.reference_filename,
                url_picture_map: this.PI_reference_filename2.cPath,
                map_filename: this.M_CM_SubPortfolio.map_filename,
                user_input: this.getDataUser().user_id ,
                one_bill_master: this.M_CM_SubPortfolio.one_bill_master                
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
                subportfolio_cd: this.M_CM_SubPortfolio.subportfolio_cd,
                name: this.M_CM_SubPortfolio.name,
                subportfolio_class_cd: this.M_CM_SubPortfolio.subportfolio_class_cd == '' || this.M_CM_SubPortfolio.subportfolio_class_cd == null ? '' : this.M_CM_SubPortfolio.subportfolio_class_cd ,
                subportfolio_group_cd: this.M_CM_SubPortfolio.subportfolio_group_cd == '' || this.M_CM_SubPortfolio.subportfolio_group_cd == null ? '' : this.M_CM_SubPortfolio.subportfolio_group_cd ,
                subportfolio_start: this.M_CM_SubPortfolio.subportfolio_start == '' || this.M_CM_SubPortfolio.subportfolio_start == null ? 'NULL' : this.M_CM_SubPortfolio.subportfolio_start ,
                reference_no: this.M_CM_SubPortfolio.reference_no,
                address1: this.M_CM_SubPortfolio.address1,
                address2: this.M_CM_SubPortfolio.address2,
                address3: this.M_CM_SubPortfolio.address3,
                address4: this.M_CM_SubPortfolio.address4,
                city_cd: this.M_CM_SubPortfolio.city_cd == '' || this.M_CM_SubPortfolio.city_cd == null ? 'NULL' : this.M_CM_SubPortfolio.city_cd ,
                zip_code: this.M_CM_SubPortfolio.zip_code,
                phone_no: this.M_CM_SubPortfolio.phone_no,
                fax_no: this.M_CM_SubPortfolio.fax_no,
                website: this.M_CM_SubPortfolio.website,
                email: this.M_CM_SubPortfolio.email,
                internal_contact_id: this.M_CM_SubPortfolio.internal_contact_id == '' || this.M_CM_SubPortfolio.internal_contact_id == null ? 'NULL' : this.M_CM_SubPortfolio.internal_contact_id ,
                tax_address1: this.M_CM_SubPortfolio.tax_address1,
                tax_address2: this.M_CM_SubPortfolio.tax_address2,
                tax_address3: this.M_CM_SubPortfolio.tax_address3,
                tax_address4: this.M_CM_SubPortfolio.tax_address4,
                tax_city_cd: this.M_CM_SubPortfolio.tax_city_cd == '' || this.M_CM_SubPortfolio.tax_city_cd == null ? 'NULL' : this.M_CM_SubPortfolio.tax_city_cd ,
                tax_zip_code: this.M_CM_SubPortfolio.tax_zip_code,
                tax_registration_no: this.M_CM_SubPortfolio.tax_registration_no,
                tax_registration_date: this.M_CM_SubPortfolio.tax_registration_date == '' || this.M_CM_SubPortfolio.tax_registration_date == null ? 'NULL' : this.M_CM_SubPortfolio.tax_registration_date ,
                tax_reference_no: this.M_CM_SubPortfolio.tax_reference_no,
                standard_tax_running_cd: this.M_CM_SubPortfolio.standard_tax_running_cd == '' || this.M_CM_SubPortfolio.standard_tax_running_cd == null ? 'NULL' : this.M_CM_SubPortfolio.standard_tax_running_cd ,
                common_tax_running_cd: this.M_CM_SubPortfolio.common_tax_running_cd == '' || this.M_CM_SubPortfolio.common_tax_running_cd == null ? 'NULL' : this.M_CM_SubPortfolio.common_tax_running_cd ,
                ar_withholding_tax_running_cd: this.M_CM_SubPortfolio.ar_withholding_tax_running_cd == '' || this.M_CM_SubPortfolio.ar_withholding_tax_running_cd == null ? 'NULL' : this.M_CM_SubPortfolio.ar_withholding_tax_running_cd ,
                ap_vat_deduction_running_cd: this.M_CM_SubPortfolio.ap_vat_deduction_running_cd == '' || this.M_CM_SubPortfolio.ap_vat_deduction_running_cd == null ? 'NULL' : this.M_CM_SubPortfolio.ap_vat_deduction_running_cd ,
                ap_withholding_deduction_running_cd: this.M_CM_SubPortfolio.ap_withholding_deduction_running_cd == '' || this.M_CM_SubPortfolio.ap_withholding_deduction_running_cd == null ? 'NULL' : this.M_CM_SubPortfolio.ap_withholding_deduction_running_cd ,
                default_vat_charges_assignment: this.M_CM_SubPortfolio.default_vat_charges_assignment,
                hold_vat: this.M_CM_SubPortfolio.hold_vat,
                hold_withholding: this.M_CM_SubPortfolio.hold_withholding,
                remarks: this.M_CM_SubPortfolio.remarks,
                picture_filename: this.M_CM_SubPortfolio.picture_filename,
                reference_filename: this.M_CM_SubPortfolio.reference_filename,
                url_picture_map: this.PI_reference_filename2.cPath,
                map_filename: this.M_CM_SubPortfolio.map_filename,
                user_edit: this.getDataUser().user_id ,
                LastUpdateStamp: this.M_CM_SubPortfolio.lastupdatestamp,
                one_bill_master: this.M_CM_SubPortfolio.one_bill_master                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })

        },
		M_ClearForm(){
            this.M_CM_SubPortfolio = {
                subportfolio_cd: '',//this.getDataUser().subportfolio_cd,
                name: '',
                subportfolio_class_cd: '',
                subportfolio_group_cd: '',
                subportfolio_start: '',
                reference_no: '',
                address1: '',
                address2: '',
                address3: '',
                address4: '',
                city_cd: '',
                zip_code: '',
                phone_no: '',
                fax_no: '',
                website: '',
                email: '',
                internal_contact_id: '',
                tax_address1: '',
                tax_address2: '',
                tax_address3: '',
                tax_address4: '',
                tax_city_cd: '',
                tax_zip_code: '',
                tax_registration_no: '',
                tax_registration_date: '',
                tax_reference_no: '',
                standard_tax_running_cd: '',
                common_tax_running_cd: '',
                ar_withholding_tax_running_cd: '',
                ap_vat_deduction_running_cd: '',
                ap_withholding_deduction_running_cd: '',
                default_vat_charges_assignment: 'D',
                hold_vat: 'C',
                hold_withholding: 'M',
                remarks: '',
                one_bill_master: 'N',
                picture_filename: '',
                reference_filename: '',
                user_input: '',
                user_edit: this.getDataUser().user_id,
                subportfolio_class_descs: '',
                city_descs: '',
                tax_city_descs: '',
                standard_tax_running_cd_descs: '',
                common_tax_running_cd_descs: '',
                ar_withholding_tax_running_cd_descs: '',
                ap_withholding_deduction_running_cd_descs: '',
                ap_vat_deduction_running_cd_descs: '',
                subportfolio_group_cd_descs: '',
                lastupdatestamp: 0,
                row_id: 0,
                url_picture_map:'',
                map_filename:'',
                reference_filename2:'',
                picture_filename2:''
                    }
            		
		},
        M_New(){
          this.$refs.ref_subportfolio_cd.focus()
			
        },
        M_Edit(){
          this.$refs.ref_name.focus()
        },
        M_Delete(dt){       

          var data = this.FormToABSList().getRowSelected()  
          var dataDelete = []

          
          data.forEach((value) => {
            dataDelete.push({
              subportfolio_cd: value.subportfolio_cd,
              LastUpdateStamp: value.LastUpdateStamp,
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
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order
,                subportfolio_cd: record.subportfolio_cd
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                // console.log(data)
this.M_CM_SubPortfolio = {
                subportfolio_cd: data.subportfolio_cd,
                name: data.name,
                subportfolio_class_cd: data.subportfolio_class_cd,
                subportfolio_group_cd: data.subportfolio_group_cd,
                subportfolio_start: data.subportfolio_start,
                reference_no: data.reference_no,
                address1: data.address1,
                address2: data.address2,
                address3: data.address3,
                address4: data.address4,
                city_cd: data.city_cd,
                zip_code: data.zip_code,
                phone_no: data.phone_no,
                fax_no: data.fax_no,
                website: data.website,
                email: data.email,
                internal_contact_id: data.internal_contact_id,
                tax_address1: data.tax_address1,
                tax_address2: data.tax_address2,
                tax_address3: data.tax_address3,
                tax_address4: data.tax_address4,
                tax_city_cd: data.tax_city_cd,
                tax_zip_code: data.tax_zip_code,
                tax_registration_no: data.tax_registration_no,
                tax_registration_date: data.tax_registration_date,
                tax_reference_no: data.tax_reference_no,
                standard_tax_running_cd: data.standard_tax_running_cd,
                common_tax_running_cd: data.common_tax_running_cd,
                ar_withholding_tax_running_cd: data.ar_withholding_tax_running_cd,
                ap_vat_deduction_running_cd: data.ap_vat_deduction_running_cd,
                ap_withholding_deduction_running_cd: data.ap_withholding_deduction_running_cd,
                default_vat_charges_assignment: data.default_vat_charges_assignment,
                hold_vat: data.hold_vat,
                hold_withholding: data.hold_withholding,
                remarks: data.remarks,
                one_bill_master: data.one_bill_master,
                picture_filename: data.picture_filename,
                reference_filename: data.reference_filename,
                user_input: data.user_input,
                user_edit: data.user_edit,
                subportfolio_class_descs: data.subportfolio_class_descs,
                city_descs: data.city_descs,
                tax_city_descs: data.tax_city_descs,
                standard_tax_running_cd_descs: data.standard_tax_running_cd_descs,
                common_tax_running_cd_descs: data.common_tax_running_cd_descs,
                ar_withholding_tax_running_cd_descs: data.ar_withholding_tax_running_cd_descs,
                ap_withholding_deduction_running_cd_descs: data.ap_withholding_deduction_running_cd_descs,
                ap_vat_deduction_running_cd_descs: data.ap_vat_deduction_running_cd_descs,
                subportfolio_group_cd_descs: data.subportfolio_group_cd_descs,
                lastupdatestamp: record.LastUpdateStamp,
                row_id: data.row_id,
                url_picture_map: data.url_picture_map,
                map_filename: data.map_filename
                    }
                 

                this.M_CM_SubPortfolio.subportfolio_class_cdLabel = this.M_CM_SubPortfolio.subportfolio_class_cd != null ? data.subportfolio_class_cd + this.separator + data.subportfolio_class_descs :'' 
                this.M_CM_SubPortfolio.subportfolio_group_cdLabel = this.M_CM_SubPortfolio.subportfolio_group_cd != null ? data.subportfolio_group_cd + this.separator + data.subportfolio_group_cd_descs :'' 
                this.M_CM_SubPortfolio.tax_city_cdLabel = this.M_CM_SubPortfolio.tax_city_cd != null ? data.tax_city_cd + this.separator + data.city_descs :'' 
                this.M_CM_SubPortfolio.city_cdLabel = this.M_CM_SubPortfolio.city_cd != null ? data.city_cd + this.separator + data.city_descs :'' 
                this.M_CM_SubPortfolio.standard_tax_running_cdLabel = this.M_CM_SubPortfolio.standard_tax_running_cd != null ? data.standard_tax_running_cd + this.separator + data.standard_tax_running_cd_descs :'' 
                this.M_CM_SubPortfolio.common_tax_running_cdLabel = this.M_CM_SubPortfolio.common_tax_running_cd != null ? data.common_tax_running_cd + this.separator + data.common_tax_running_cd_descs  :'' 
                this.M_CM_SubPortfolio.ar_withholding_tax_running_cdLabel = this.M_CM_SubPortfolio.ar_withholding_tax_running_cd != null ? data.ar_withholding_tax_running_cd + this.separator + data.ar_withholding_tax_running_cd_descs :'' 
                this.M_CM_SubPortfolio.ap_vat_deduction_running_cdLabel = this.M_CM_SubPortfolio.ap_vat_deduction_running_cd != null ? data.ap_vat_deduction_running_cd + this.separator + data.ap_vat_deduction_running_cd_descs :'' 
                this.M_CM_SubPortfolio.ap_withholding_deduction_running_cdLabel = this.M_CM_SubPortfolio.ap_withholding_deduction_running_cd != null ? data.ap_withholding_deduction_running_cd + this.separator + data.ap_withholding_deduction_running_cd_descs :'' 
                this.M_CM_SubPortfolio.internal_contact_idLabel = this.M_CM_SubPortfolio.internal_contact_id != null ? data.internal_contact_id :'' 
         

                this.IEBy.Input = data.user_input
                this.IEBy.Edit = data.user_edit

            })
        }
        ,get_filename(_filename) {
         this.M_CM_SubPortfolio.picture_filename = _filename 
        }
        ,getMapname(_filename) {
         this.M_CM_SubPortfolio.map_filename = _filename 
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

